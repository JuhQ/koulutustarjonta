package fi.helsinki.koulutustarjonta.resource;

import fi.helsinki.koulutustarjonta.dao.LearningOpportunityDAO;
import fi.helsinki.koulutustarjonta.domain.LearningOpportunity;
import fi.helsinki.koulutustarjonta.dto.LearningOpportunityDTO;
import org.modelmapper.ModelMapper;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Hannu Lyytikainen
 */
@Path("/koulutus")
@Produces(MediaType.APPLICATION_JSON)
public class LearningOpportunityResource {

    final LearningOpportunityDAO learningOpportunityDAO;
    final ModelMapper modelMapper;

    public LearningOpportunityResource(LearningOpportunityDAO learningOpportunityDAO) {
        this.learningOpportunityDAO = learningOpportunityDAO;
        this.modelMapper = new ModelMapper();
    }

    @GET
    public List<LearningOpportunityDTO> getLearningOpportunities() {
        List<LearningOpportunity> learningOpportunities = learningOpportunityDAO.findAll();
        return learningOpportunities.stream().map(lo -> {
            return modelMapper.map(lo, LearningOpportunityDTO.class);
        }).collect(Collectors.toList());

    }

    @GET
    @Path("/{oid}")
    public LearningOpportunityDTO getLearningOpportunity(@PathParam("oid") String oid) {
        System.out.println("oid :" + oid);
        return modelMapper.map(learningOpportunityDAO.findById(oid), LearningOpportunityDTO.class);
    }

}