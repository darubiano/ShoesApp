import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/CustomWigets.dart';

class CarButton extends StatelessWidget {
  final double monto;
  CarButton({
    @required this.monto
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:10,right: 10,bottom: 5),
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color:Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Text('\$${this.monto}',style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
            CustomButton(titulo: 'Add to cart',)
          ]
        ),
      ),
    );
  }
}