package boot.mvc.test;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapperInter {

	public int getTotalCount();
	
}
