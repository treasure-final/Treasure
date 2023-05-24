package boot.mvc.order;

public interface OrderServiceInter {
    public void insertOrder(OrderDto orderDto);
    public String getNowinsertOrderNum();
    public OrderDto getOrderData(String order_num);
}
