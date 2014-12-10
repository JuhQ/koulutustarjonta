package fi.helsinki.koulutustarjonta.dao.jdbi;

import fi.helsinki.koulutustarjonta.dao.binder.*;
import fi.helsinki.koulutustarjonta.dao.mapper.ApplicationOptionJoinRowMapper;
import fi.helsinki.koulutustarjonta.dao.util.ApplicationOptionJoinRow;
import fi.helsinki.koulutustarjonta.domain.*;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlBatch;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.BatchChunkSize;
import org.skife.jdbi.v2.sqlobject.customizers.Mapper;
import org.skife.jdbi.v2.sqlobject.mixins.Transactional;
import org.skife.jdbi.v2.sqlobject.stringtemplate.UseStringTemplate3StatementLocator;

import java.util.List;

/**
 * @author Hannu Lyytikainen
 */
@UseStringTemplate3StatementLocator("/db/sql/templates/ApplicationOptionJDBI.sql.stg")
public interface ApplicationOptionJDBI extends Transactional<ApplicationOptionJDBI> {

    @SqlUpdate
    void upsert(@BindApplicationOption ApplicationOption applicationOption);

    @SqlQuery
    @Mapper(ApplicationOptionJoinRowMapper.class)
    List<ApplicationOptionJoinRow> findJoinRowsById(@Bind("id") String id);

    @SqlQuery
    @Mapper(ApplicationOptionJoinRowMapper.class)
    List<ApplicationOptionJoinRow> findJoinRows();

    @SqlBatch
    @BatchChunkSize(10)
    void upsertExams(@BindExam List<Exam> exam, @Bind("id_hakukohde") String applicationOptionOid);

    @SqlBatch
    @BatchChunkSize(10)
    void upsertExamEvents(@BindExamEvent List<ExamEvent> events, @Bind("id_valintakoe") String examOid);

    @SqlUpdate
    void removeAttachments(@Bind("id_hakukohde") String applicationOptionOid);

    @SqlBatch
    @BatchChunkSize(10)
    void insertAttachments(@BindAttachment List<Attachment> attachments, @Bind("id_hakukohde") String applicationOptionOid);

    @SqlBatch
    @BatchChunkSize(10)
    void insertRequirements(
            @BindRequirement List<Requirement> requirements,
            @Bind("id_hakukohde") String applicationOptionOid);

    @SqlUpdate
    void removeRequirements(@Bind("id_hakukohde") String applicationOptionOid);

}
