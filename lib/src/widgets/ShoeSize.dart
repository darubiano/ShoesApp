import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/ShoeModel.dart';
import 'package:shoesapp/src/pages/ShoeDescPage.dart';

class ShoeSize extends StatelessWidget {
  final bool fullScreen;

  ShoeSize({
    this.fullScreen=false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        if (!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context)=>ShoeDescPage())
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:(this.fullScreen)?0:30,
          vertical:(this.fullScreen)?0:10
        ),
        child: Container(
          width: double.infinity,
          height:  (this.fullScreen)?size.height*0.5:size.height*0.55,
          decoration: BoxDecoration(
            color:Color(0xffFFCF53),
            borderRadius: (this.fullScreen)
            ?BorderRadius.only(
              bottomLeft:Radius.circular(50),
              bottomRight:Radius.circular(50))            
            :BorderRadius.circular(50)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              _ShoeShadow(fullScreen: this.fullScreen,),
              (this.fullScreen)?Container():_Size()
            ]
          ),
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget { 
  final bool fullScreen;
  _ShoeShadow({this.fullScreen});
  @override
  Widget build(BuildContext context) {
    final showModel =Provider.of<ShoeModel>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children:<Widget>[
          Positioned(
            bottom: 20,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: size.width*0.6,
                height: size.height*0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(color:Color(0xffEAA14E),blurRadius:40)
                  ]
                ),
              ),
            ),
          ),
          Image(
            image: AssetImage(showModel.assetImage),
            width:(this.fullScreen)?size.width*0.7:size.width*0.6,
          )
        ]
      ),
    );
  }
}

class _Size extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ShoeSizeBox(numero: 7,),
          ShoeSizeBox(numero: 7.5,),
          ShoeSizeBox(numero: 8,),
          ShoeSizeBox(numero: 8.5,),
          ShoeSizeBox(numero: 9,),
          ShoeSizeBox(numero: 9.5,),
        ],
      ),
    );
  }
}

class ShoeSizeBox extends StatelessWidget {
  final double numero;

  ShoeSizeBox({this.numero});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: (){
        final shoeModel = Provider.of<ShoeModel>(context,listen: false);
        shoeModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width:40,
        height:40,
        decoration: BoxDecoration(
          color:(this.numero==shoeModel.talla)?Color(0xffF1A23A):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (this.numero==shoeModel.talla) 
              BoxShadow(color:Color(0xffF1A23A),blurRadius: 10,offset: Offset(0,5))           
          ]
        ),
        child: Text('${this.numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (this.numero==shoeModel.talla)? Colors.white:Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}