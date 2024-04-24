
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  postdata(String id) async {
    var res = await crud.postRequest(AppLink.orderdetails, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
   accept_delete(String id,st) async {
    var res = await crud.postRequest(AppLink.acccept_cancel, {"id":id,"st":st});
    return res?.fold((l) => l, (r) => r);
  }
}
