import 'package:dio/dio.dart';

  void deleteResquest(User,filmeiD) async{ 
    Dio dio = Dio();
    var response = await dio.delete("https://apiloomi.onrender.com/filme/$filmeiD/user/$User/");
    print(response.data);
  }