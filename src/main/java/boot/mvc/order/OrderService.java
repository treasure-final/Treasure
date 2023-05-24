package boot.mvc.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService implements OrderServiceInter {

    @Autowired
    OrderMapperInter mapper;

    @Override
    public void insertOrder(OrderDto orderDto) {
        mapper.insertOrder(orderDto);
    }

    @Override
    public String getNowinsertOrderNum() {
        return mapper.getNowinsertOrderNum();
    }

    @Override
    public OrderDto getOrderData(String order_num) {
        return mapper.getOrderData(order_num);
    }
}
