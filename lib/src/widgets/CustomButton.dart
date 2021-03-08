import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String titulo;
  final double alto;
  final double ancho;
  final Color color;
  CustomButton({
    this.titulo,
    this.alto = 50,
    this.ancho = 150,
    this.color = Colors.orange
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(100),
        color: this.color,
      ),
      child: Text(this.titulo, style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
    );
  }
}