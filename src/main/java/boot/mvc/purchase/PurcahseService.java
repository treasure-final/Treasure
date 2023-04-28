package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurcahseService implements PurcahseServiceInter {

	@Autowired
	PurcahseMapperInter mapper;
	
}
