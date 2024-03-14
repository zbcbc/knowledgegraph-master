import com.knowledgegraph.neo4j.mapper.ResearchAreasMapper;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.dto.AreaPapersDto;
import com.knowledgegraph.neo4j.service.impl.OrganizationServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
public class TestForKG {
    @Autowired
    OrganizationServiceImpl organizationService;
    @Autowired
    ResearchAreasMapper researchAreasMapper;

    @Test
    public void select(){
        Organization organization = organizationService.getOrganizationByName("斯坦福大学");
        System.out.println(organization);
    }

    @Test
    public void query222(){
        List<AreaPapersDto> areaPapersDtos = researchAreasMapper.queryAreasByExpertId(1L);
        System.out.println(areaPapersDtos);
    }
}