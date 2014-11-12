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
public class AddressDTO {
    @JsonProperty("katuosoite")
    private String street;
    @JsonProperty("postinumero")
    private String postalCode;
    @JsonProperty("postitoimipaikka")
    private String postOffice;
}
