package boot.mvc.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapperInter {
    public int checkIdAndPassword(Map<String, String> map);
}
