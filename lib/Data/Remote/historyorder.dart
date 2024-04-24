
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class HistoryOrderData {
  Crud crud;
  HistoryOrderData(this.crud);
  postdata(String id) async {
    var res = await crud.postRequest(AppLink.ordershistory, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
 
}
