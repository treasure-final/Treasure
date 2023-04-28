package boot.mvc.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService implements TestServiceInter {

	@Autowired
	TestMapperInter mapper;
	
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

}
