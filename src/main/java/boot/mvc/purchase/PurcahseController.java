package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurcahseController {

    @Autowired
    PurcahseService service;

    @GetMapping("/buy/type")
    public String selectType() {
        return "/purchase/purchaseType";
    }

    @GetMapping("/buy/select")
    public ModelAndView selectSize() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("purchase/purchaseSize");
        return mv;
    }

    @GetMapping("/buy/order")
    public String order() {
        return "/purchase/purchaseOrder";
    }
}
