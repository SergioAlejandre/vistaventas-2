import 'package:flutter/material.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class CompraDeProductosView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 241, 229, 112),
      appBar: AppBar(title:const DefaultTextStyle(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        child: Text('Compra de productos'),
      ),
    ),
      
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 30,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :[
            
          ],
        ),
      ),
    );
  }

}