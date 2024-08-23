import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/complexmodelprovider.dart';

class ComplexModelScreen extends StatefulWidget {
  const ComplexModelScreen({super.key});

  @override
  State<ComplexModelScreen> createState() => _ComplexModelScreenState();
}

class _ComplexModelScreenState extends State<ComplexModelScreen> {
  late ComplexModelProvider complexModelProvider ;
  @override
  void initState() {
    super.initState();
    complexModelProvider = Provider.of<ComplexModelProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
     await complexModelProvider.dataAll();
     await complexModelProvider.loadLocalData();
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex list'),
      ),
      body: Consumer<ComplexModelProvider>(
          builder: (context,provider,child) {
            return provider.loading?
            const Center(child: CircularProgressIndicator(),):
            provider.userList.isEmpty?
            const Center(child: Text('No News Found'),):
            ListView.builder(
                itemCount: provider.userList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Text(provider.userList[index].id.toString()),
                    title: Text(provider.userList[index].title.toString()),
                    subtitle: Text("By ${provider.userList[index].description}"),

                  );
                });
          }
      ),
    );
  }
}
