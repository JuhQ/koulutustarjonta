package fi.helsinki.koulutustarjonta.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * @author Hannu Lyytikainen
 */
public class ApplicationOptionDTO {

    private String oid;
    private I18NDTO name;
    private int startingQuota;
    private I18NDTO requirementDescription;
    private I18NDTO additionalInfo;
    private I18NDTO selectionCriteria;
    private I18NDTO sora;
    private List<ExamDTO> exams;
    private List<AttachmentDTO> attachments;
    private List<I18NDTO> requirements;
    private String applicationSystem;

    public ApplicationOptionDTO() {
    }

    @JsonProperty("oid")
    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @JsonProperty("nimi")
    public I18NDTO getName() {
        return name;
    }

    public void setName(I18NDTO name) {
        this.name = name;
    }

    @JsonProperty("aloituspaikat")
    public int getStartingQuota() {
        return startingQuota;
    }

    public void setStartingQuota(int startingQuota) {
        this.startingQuota = startingQuota;
    }


    @JsonProperty("hakukelpoisuusvaatimus_kuvaus")
    public I18NDTO getRequirementDescription() {
        return requirementDescription;
    }

    public void setRequirementDescription(I18NDTO requirementDescription) {
        this.requirementDescription = requirementDescription;
    }

    @JsonProperty("lisatiedot")
    public I18NDTO getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(I18NDTO additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    @JsonProperty("valintaperustekuvaus")
    public I18NDTO getSelectionCriteria() {
        return selectionCriteria;
    }

    public void setSelectionCriteria(I18NDTO selectionCriteria) {
        this.selectionCriteria = selectionCriteria;
    }

    @JsonProperty("sorakuvaus")
    public I18NDTO getSora() {
        return sora;
    }

    public void setSora(I18NDTO sora) {
        this.sora = sora;
    }

    @JsonProperty("valintakokeet")
    public List<ExamDTO> getExams() {
        return exams;
    }

    public void setExams(List<ExamDTO> exams) {
        this.exams = exams;
    }

    @JsonProperty("liitteet")
    public List<AttachmentDTO> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<AttachmentDTO> attachments) {
        this.attachments = attachments;
    }

    @JsonProperty("hakukelpoisuusvaatimukset")
    public List<I18NDTO> getRequirements() {
        return requirements;
    }

    public void setRequirements(List<I18NDTO> requirements) {
        this.requirements = requirements;
    }

    @JsonProperty("haku")
    public String getApplicationSystem() {
        return applicationSystem;
    }

    public void setApplicationSystem(String applicationSystem) {
        this.applicationSystem = applicationSystem;
    }
}