package fi.helsinki.koulutustarjonta.dao;

import fi.helsinki.koulutustarjonta.dao.exception.ResourceNotFound;
import fi.helsinki.koulutustarjonta.dao.jdbi.ApplicationSystemJDBI;
import fi.helsinki.koulutustarjonta.domain.ApplicationPeriod;
import fi.helsinki.koulutustarjonta.domain.ApplicationSystem;
import fi.helsinki.koulutustarjonta.test.Fixture;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.skife.jdbi.v2.Handle;

import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * @author Hannu Lyytikainen
 */
public class ApplicationSystemDAOTest extends BaseDAOTest {


    ApplicationSystemDAO dao;
    final String asOid1 = "as_oid_1";
    final String populatedAsOid = "haku_id1";
    final ApplicationSystem fixture1 = Fixture.applicationSystem(asOid1);

    @Before
    public void init() {
        dao = new ApplicationSystemDAO(dbi.onDemand(ApplicationSystemJDBI.class));
    }

    @After
    public void destroy() {
        Handle h = dbi.open();
        h.execute("DELETE FROM hakuaika WHERE id_haku = ?", fixture1.getOid());
        h.execute("DELETE FROM haku WHERE id = ?", fixture1.getOid());
        dbi.close(h);
    }

    @Test
    public void testFindByOid() throws ResourceNotFound {
        ApplicationSystem as = dao.findByOid(populatedAsOid);
        verifyApplicationSystem(as);
    }

    @Test
    public void findAll() {
        List<ApplicationSystem> systems = dao.findAll().stream()
                .filter(system -> system.getOid().equals(populatedAsOid))
                .collect(Collectors.toList());
        assertNotNull(systems);
        assertEquals(1, systems.size());
        verifyApplicationSystem(systems.get(0));
    }

    @Test(expected = ResourceNotFound.class)
    public void testNotFound() throws ResourceNotFound {
        dao.findByOid("invalid_oid");
    }

    private void verifyApplicationSystem(ApplicationSystem as) {
        assertNotNull(as);
        assertEquals(populatedAsOid, as.getOid());
        assertEquals("haku nimi fi", as.getName().getFi());
        assertEquals("haku nimi sv", as.getName().getSv());
        assertEquals("haku nimi en", as.getName().getEn());
        assertEquals("hakutapa fi", as.getApplicationMethod().getFi());
        assertEquals("hakutapa sv", as.getApplicationMethod().getSv());
        assertEquals("hakutapa en", as.getApplicationMethod().getEn());
        assertEquals(2015, as.getApplicationYear());
        assertEquals("K", as.getApplicationSeason().getValue());
        assertEquals("hakukausi fi", as.getApplicationSeason().getName().getFi());
        assertEquals("hakukausi sv", as.getApplicationSeason().getName().getSv());
        assertEquals("hakukausi en", as.getApplicationSeason().getName().getEn());
        assertEquals(2016, as.getEducationStartYear());
        assertEquals("S", as.getEducationStartSeason().getValue());
        assertEquals("koul alk kausi fi", as.getEducationStartSeason().getName().getFi());
        assertEquals("koul alk kausi sv", as.getEducationStartSeason().getName().getSv());
        assertEquals("koul alk kausi en", as.getEducationStartSeason().getName().getEn());
        assertEquals("hakulomake url", as.getApplicationFormUrl());
        assertNotNull(as.getApplicationPeriods());
        assertEquals(1, as.getApplicationPeriods().size());
        ApplicationPeriod ap = as.getApplicationPeriods().get(0);
        assertNotNull(ap);
        assertEquals("hakuaika_id1", ap.getId());
        assertEquals("hakuaika nimi", ap.getName());
        Calendar starts = getZeroCalendar();
        starts.set(Calendar.YEAR, 2015);
        starts.set(Calendar.MONTH, Calendar.JANUARY);
        starts.set(Calendar.DATE, 1);
        starts.set(Calendar.HOUR_OF_DAY, 15);
        Calendar ends = getZeroCalendar();
        ends.set(Calendar.YEAR, 2015);
        ends.set(Calendar.MONTH, Calendar.FEBRUARY);
        ends.set(Calendar.DATE, 1);
        ends.set(Calendar.HOUR_OF_DAY, 15);
        assertEquals(starts.getTime(), ap.getStarts());
        assertEquals(ends.getTime(), ap.getEnds());

    }




}