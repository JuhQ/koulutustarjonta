package fi.helsinki.koulutustarjonta.client.converter;

import com.fasterxml.jackson.databind.JsonNode;
import fi.helsinki.koulutustarjonta.client.KoodistoClient;
import fi.helsinki.koulutustarjonta.domain.*;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Matchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * @author Hannu Lyytikainen
 */
public class ApplicationOptionConverterTest extends AbstractClientConverterTest {

    JsonNode fixture;
    ApplicationOptionConverter converter;

    @Before
    public void init() throws IOException {
        KoodistoClient koodistoClient = mock(KoodistoClient.class);
        Code prerequisite = new Code();
        prerequisite.setName(new I18N("prerequisite name fi", "prerequisite name sv", "prerequisite name en"));
        when(koodistoClient.getCode(eq("pohjakoulutusvaatimuskorkeakoulut_118"))).thenReturn(prerequisite);
        Code postalCode = new Code();
        postalCode.setValue("00014");
        when(koodistoClient.getCode(eq("posti_00014"))).thenReturn(postalCode);

        converter = new ApplicationOptionConverter(koodistoClient);
        fixture = fixture("fixtures/hakukohde.json");
    }

    @Test
    public void testConvert () {
        ApplicationOption ao = converter.convert(fixture);
        assertNotNull(ao);
        assertEquals("1.2.246.562.20.92573201339", ao.getOid());
        assertEquals("Kemia, luonnontieteiden kandidaatti ja filosofian maisteri", ao.getName().getFi());
        assertEquals("Kemi, kandidat i naturvetenskaper och filosofie magister", ao.getName().getSv());
        assertEquals(8, ao.getStartingQuota());
        assertNotNull(ao.getApplicationSuitabilityRequirements());
        assertEquals(1, ao.getApplicationSuitabilityRequirements().size());
        I18N suitability = ao.getApplicationSuitabilityRequirements().get(0);
        assertEquals("prerequisite name fi", suitability.getFi());
        assertEquals("prerequisite name sv", suitability.getSv());
        assertEquals("prerequisite name en", suitability.getEn());
        assertEquals("hakukelpoisuus fi", ao.getApplicationSuitabilityRequirementDescription().getFi());
        assertEquals("hakukelpoisuus sv", ao.getApplicationSuitabilityRequirementDescription().getSv());
        assertEquals("hakukelpoisuus en", ao.getApplicationSuitabilityRequirementDescription().getEn());
        assertEquals("lisatiedot fi", ao.getAdditionalInfo().getFi());
        assertEquals("lisatiedot sv", ao.getAdditionalInfo().getSv());
        assertEquals("lisatiedot en", ao.getAdditionalInfo().getEn());
        assertEquals("valintaperustekuvaus fi", ao.getSelectionCriteria().getFi());
        assertEquals("valintaperustekuvaus sv", ao.getSelectionCriteria().getSv());
        assertEquals("valintaperustekuvaus en", ao.getSelectionCriteria().getEn());
        assertEquals("<p>sora fi</p>", ao.getSora().getFi());
        assertEquals("<p>sora en</p>", ao.getSora().getEn());
        assertEquals("<p>sora sv</p>", ao.getSora().getSv());
        assertNotNull(ao.getExams());
        List<Exam> exams = ao.getExams();
        assertNotNull(exams);
        assertEquals(3, exams.size());
        List<Attachment> attachments = ao.getAttachments();
        assertNotNull(attachments);
        assertEquals(4, attachments.size());
    }

}