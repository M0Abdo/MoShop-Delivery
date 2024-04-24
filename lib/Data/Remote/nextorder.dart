
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class NextOrderData {
  Crud crud;
  NextOrderData(this.crud);
  postdata(String id) async {
    var res = await crud.postRequest(AppLink.nextOrder, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
 
}
