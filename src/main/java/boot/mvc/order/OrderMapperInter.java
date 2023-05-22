package boot.mvc.order;

import boot.mvc.purchase.PurchaseDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapperInter {
    public void insertOrder(OrderDto orderDto);
}
