import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.service.impl.OrganizationServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/6 16:30
 */

@SpringBootTest
public class TestForKG {
    @Autowired
    OrganizationServiceImpl organizationService;

    @Test
    public void select(){
        //List<Organization> orgList = organizationService.getOrganizationByName("斯坦福大学");
        //System.out.println(orgList.get(0));
    }
}
