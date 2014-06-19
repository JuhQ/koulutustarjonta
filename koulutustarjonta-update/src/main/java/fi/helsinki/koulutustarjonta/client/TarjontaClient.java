package fi.helsinki.koulutustarjonta.client;

import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import fi.helsinki.koulutustarjonta.client.converter.LearningOpportunityConverter;
import fi.helsinki.koulutustarjonta.client.mock.TarjontaMock;
import fi.helsinki.koulutustarjonta.domain.LearningOpportunity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * @author Hannu Lyytikainen
 */
public class TarjontaClient {

    private static final Logger LOG = LoggerFactory.getLogger(TarjontaClient.class);

    private WebResource koulutusResource;
    private LearningOpportunityConverter learningOpportunityConverter;


    public TarjontaClient(WebResource koulutusResource) {
        this.koulutusResource = koulutusResource;
        this.learningOpportunityConverter = new LearningOpportunityConverter();
    }

    public LearningOpportunity getLearningOpportunity(String oid) {
        LOG.debug(String.format("Fetching learning opportunity %s", oid));
        Map<String, Object> koulutus = koulutusResource.path(oid).get(new GenericType<Map<String, Object>>() {});
        LearningOpportunity learningOpportunity = learningOpportunityConverter.convert(koulutus);

        // mostly use mock for poc
        TarjontaMock tarjontaMock = new TarjontaMock();
        LearningOpportunity mockLearningOpportunity = tarjontaMock.getDegree();
        mockLearningOpportunity.setGoals(learningOpportunity.getGoals());

        return mockLearningOpportunity;

    }

}