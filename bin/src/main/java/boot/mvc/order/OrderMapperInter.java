package boot.mvc.order;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapperInter {
    public void insertOrder(OrderDto orderDto);
}
