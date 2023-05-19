package boot.mvc.style;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StyleService implements StyleServiceInter {

	@Autowired
	StyleMapperInter mapper;
}
