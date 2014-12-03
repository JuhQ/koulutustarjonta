package fi.helsinki.koulutustarjonta.dao;

import fi.helsinki.koulutustarjonta.dao.exception.ResourceNotFound;
import fi.helsinki.koulutustarjonta.dao.jdbi.ApplicationSystemJDBI;
import fi.helsinki.koulutustarjonta.dao.mapper.ApplicationSystemObjectBuilder;
import fi.helsinki.koulutustarjonta.dao.util.ApplicationSystemJoinRow;
import fi.helsinki.koulutustarjonta.domain.ApplicationSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Hannu Lyytikainen
 */
public class ApplicationSystemDAO {

    private static final Logger LOG = LoggerFactory.getLogger(ApplicationSystemDAO.class);

    private final ApplicationSystemJDBI jdbi;

    public ApplicationSystemDAO(ApplicationSystemJDBI jdbi) {
        this.jdbi = jdbi;
    }

    public void save(ApplicationSystem as) {
        LOG.debug(String.format("Saving application system %s", as.getOid()));
        jdbi.begin();
        LOG.debug("Transaction begun");
        try {
            jdbi.upsertApplicationSystem(as);
            LOG.debug("Application system upserted");
            jdbi.upsertApplicationPeriods(as.getApplicationPeriods(),
                    as.getOid());
            LOG.debug("Application periods added");
            List<String> currentApplicationPeriodIds = as.getApplicationPeriods()
                    .stream()
                    .map(period -> period.getId())
                    .collect(Collectors.toList());
            jdbi.clearDeletedApplicationPeriodsFromApplicationOptions(as.getOid(), currentApplicationPeriodIds);
            jdbi.removeDeletedApplicationPeriods(as.getOid(), currentApplicationPeriodIds);
            LOG.debug("ApplicationPeriods deleted");
            jdbi.commit();
        }
        catch (Exception e) {
            jdbi.rollback();
            throw e;
        }
        LOG.debug("Transaction completed");
    }

    public ApplicationSystem findByOid(String oid) throws ResourceNotFound {
        List<ApplicationSystemJoinRow> rows = jdbi.findByOid(oid);
        if (rows.size() == 0) {
            throw new ResourceNotFound(ApplicationSystem.class, oid);
        }
        else {
            return ApplicationSystemObjectBuilder.buildOne(rows);
        }
    }

    public List<ApplicationSystem> findAll() {
        return ApplicationSystemObjectBuilder.build(jdbi.findAll());
    }
}
