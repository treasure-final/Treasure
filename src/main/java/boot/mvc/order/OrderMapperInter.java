package boot.mvc.order;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapperInter {
    public void insertOrder(OrderDto orderDto);
    public String getNowinsertOrderNum();
    public OrderDto getOrderData(String order_num);
}
