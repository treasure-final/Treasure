package boot.mvc.item;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemService implements ItemServiceInter {

	@Autowired
	ItemMapperInter mapper;

	

}
