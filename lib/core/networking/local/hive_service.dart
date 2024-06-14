import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import '../../../app/constants/hive_table_constant.dart';
import '../../../feature/auth/data/model/auth_hive_model.dart';

final hiveServiceProvider = Provider((ref) => HiveService());

// this creates a db in the local storage in our phone with name _project_name.db
class HiveService{
  Future<void> init() async{
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(AuthHiveModelAdapter());// this is adapter created on the .g.dart file
  }


  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
  }


  //Login
  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
    element.username == username && element.password == password);
    box.close();
    return user;
  }


}