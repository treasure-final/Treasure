package boot.mvc.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService implements OrderServiceInter {

	@Autowired
    OrderMapperInter mapper;
	
}
