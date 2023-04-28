package boot.mvc.inventory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InventoryService implements InventoryServiceInter {

	@Autowired
	InventoryMapperInter mapper;

}
