import 'package:crudapi/provider/complexmodelprovider.dart';
import 'package:crudapi/screen/complexmodelscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/databasehelper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ComplexModelProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ComplexModelScreen(),
      ),
    );
  }
}

