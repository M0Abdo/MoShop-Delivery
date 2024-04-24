
import '../../AppLink.dart';
import '../../Core/Class/Crud.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  postdata(String id) async {
    var res = await crud.postRequest(AppLink.profile, {"id":id});
    return res?.fold((l) => l, (r) => r);
  }
 
}
