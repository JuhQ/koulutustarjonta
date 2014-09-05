package fi.helsinki.koulutustarjonta.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author Hannu Lyytikainen
 */
@NoArgsConstructor
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class SomeDTO {
    @JsonProperty("facebook")
    private I18NDTO facebook;
    @JsonProperty("twitter")
    private I18NDTO twitter;
    @JsonProperty("google_plus")
    private I18NDTO googlePlus;
    @JsonProperty("linkedin")
    private I18NDTO linkedIn;
}
