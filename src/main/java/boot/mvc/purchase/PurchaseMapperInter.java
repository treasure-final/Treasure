package boot.mvc.purchase;

import boot.mvc.sell_bid.SellBidDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PurchaseMapperInter {

    public PurchaseDto getPurchaseData(Map<String,String> map);
  
    public void insertPurchase(PurchaseDto purchaseDto);

    public List<SellBidDto> getBuyNowPrice(String item_num);

    public List<PurchaseDto> getDataByStatus0(String user_num);

    public List<PurchaseDto> getDataByStatus1(String user_num);
}
