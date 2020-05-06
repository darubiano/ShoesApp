import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/ShoeModel.dart';
import 'package:shoesapp/src/pages/ShoePage.dart';


void main(){ 
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ShoeModel())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showes',
      debugShowCheckedModeBanner: false,
      home: ShoePage()
    );
  }
}