package boot.mvc.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ItemService implements ItemServiceInter {

	@Autowired
	ItemMapperInter inter;

}
