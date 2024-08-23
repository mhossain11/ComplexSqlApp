import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../database/databasehelper.dart';
import '../model/complexmodel.dart';
import '../model/requests.dart';

class ComplexModelProvider extends ChangeNotifier{

  ComplexRequestsModel complexRequest = ComplexRequestsModel();

   bool loading = false;
   List<Requests> userList=[];

  Future dataAll() async{
    loading = true;
    notifyListeners();


      try{
        String url = 'https://imechanic.techvaultltd.com/api/allposts';
        var uri = Uri.parse(url);
        var response =await http.get(uri,headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 768|Y3jGouVPnUbZpuepJA15hoiHt2vTFPcjAD6yvQkWff763138 ',
        });

        var convert = jsonDecode(response.body);
        print('Data');
        if(response.statusCode == 200){
          print('Data Upload');
          loading = false;
          complexRequest = ComplexRequestsModel.fromJson(convert);
          for (var i in complexRequest.data!.requests! ){
            DatabaseHelper.insertItem(i);
           // userList.add(i);
          }
          print(userList.length.toString());


        }else{
          print('Error');
        }
      }catch(e){
        print(e);
      }finally{
        loading = false;
        notifyListeners();
      }


    }

  Future<void> loadLocalData() async {
    final dataList =await DatabaseHelper.getUserData();
    userList.clear();
    userList =
        dataList.map((json) => Requests.fromJson(json)).toList();
    notifyListeners();
  }

}