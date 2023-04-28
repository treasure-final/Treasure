package boot.mvc.panalty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PanaltyService implements PanaltyServiceInter {

	@Autowired
	PanaltyMapperInter mapper;

}
