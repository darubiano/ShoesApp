import 'package:flutter/material.dart';

class ShoeDesc extends StatelessWidget {

  final String titulo;
  final String descripcion;

  ShoeDesc({
    @required this.titulo,
    @required this.descripcion
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          SizedBox(height:20),
          Text(this.titulo,style:TextStyle(fontSize:30,fontWeight:FontWeight.w700)),
          Text(this.descripcion,style:TextStyle(color: Colors.black54, height: 1.6))
        ]
      ),
    );
  }
}