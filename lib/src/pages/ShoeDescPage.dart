import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/ShoeModel.dart';
import 'package:shoesapp/src/widgets/CustomWigets.dart';

class ShoeDescPage extends StatelessWidget {
  static const String id = 'ShoeDesc';
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
      children:<Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: 'shoe-1',
              child: ShoeSize(fullScreen:true)
            ),
            Positioned(
              top: 60,
              child: FloatingActionButton(
                child: Icon(Icons.chevron_left,color:Colors.white,size:50),
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                splashColor: Colors.orange,
                onPressed: (){
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
              )
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child:Column(
              children:<Widget>[
                ShoeDesc(
                  titulo: "Nike Air Max 720",
                  descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _BuyNow(),
                _ColorsAndMore(),
                _ButtonSettings()
              ]
            )
          )
        ),
      ]
        )
    );
  }
}

class _ButtonSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:30),
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _ButtonShadow(icon: Icon(Icons.favorite,color: Colors.red,size:25,),),
          _ButtonShadow(icon: Icon(Icons.add_shopping_cart,color: Colors.grey.withOpacity(0.4),size:25,),),
          _ButtonShadow(icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.4),size:25,),),
        ],
      ),
    );
  }
}

class _ButtonShadow extends StatelessWidget {
  final Icon icon;

  _ButtonShadow({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:45,
      height:45,
      decoration: BoxDecoration(
        color:Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color:Colors.black26,spreadRadius: -5,blurRadius: 20,offset: Offset(0, 10))
        ]
      ),
      child: this.icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children:<Widget>[
                Positioned(left: 90,
                  child:_ButtonColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    urlImage:'assets/images/verde.png'
                  ),
                ),
                Positioned(left: 60,
                  child:_ButtonColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    urlImage:'assets/images/amarillo.png'
                  ),
                ),
                Positioned(left: 30,
                  child:_ButtonColor(
                    color: Color(0xff2099F1),
                    index: 2,
                    urlImage:'assets/images/azul.png'
                  ),
                ),
                _ButtonColor(
                  color: Color(0xff383838),
                  index: 1,
                  urlImage:'assets/images/negro.png'
                )
              ]
            )
          ),
          CustomButton(
            titulo: 'More related items',
            alto:size.height*0.04,
            ancho:size.width*0.35,
            color: Color(0xffFFC675)
          )
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImage;
  _ButtonColor({
    this.color,
    this.index,
    this.urlImage
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInLeft(
      delay: Duration(milliseconds: this.index*100),
      duration: Duration(milliseconds:300),
      child: GestureDetector(
        onTap: (){
          final showModel =Provider.of<ShoeModel>(context,listen: false);
          showModel.assetImage = this.urlImage;
        },
        child: Container(
          width:size.width*0.099,
          height:size.height*0.05,
          decoration:BoxDecoration(
            color:this.color,
            shape:BoxShape.circle
          )
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:EdgeInsets.symmetric(horizontal:30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text('\$180.0',style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
          Spacer(),
          Bounce(
            from: 8,
            delay: Duration(seconds:1),
            child: CustomButton(titulo: 'Buy now',alto: size.height*0.05, ancho: size.width*0.25,)
          )
        ]
      ),
    );
  }
}