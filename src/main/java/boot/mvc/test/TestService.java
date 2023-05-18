package boot.mvc.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService implements TestServiceInter {

	@Autowired
	TestMapperInter mapper;

	@Override
	public void TestInfoInsert(TestDto testDto) {
		// TODO Auto-generated method stub
		mapper.TestInfoInsert(testDto);
	}
	
	

}
