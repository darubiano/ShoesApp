import 'package:flutter/material.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widgets/CustomWigets.dart';


class ShoePage extends StatelessWidget {
  static const String id = 'Zapato';
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children:<Widget>[
          CustomAppBar(texto: 'For you',),
          SizedBox(height:20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:Column(
                children:<Widget>[
                  Hero(
                    tag: 'shoe-1',
                    child: ShoeSize()
                  ),
                  ShoeDesc(
                    titulo: "Nike Air Max 720",
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ]
              )
            )
          ),
          CarButton(monto:180.0)
        ]
      ),
    );
  }
}