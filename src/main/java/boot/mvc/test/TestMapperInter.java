package boot.mvc.test;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapperInter {

	public void TestInfoInsert(TestDto testDto);
	
}
