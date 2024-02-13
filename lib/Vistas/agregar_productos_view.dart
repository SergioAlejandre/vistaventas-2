import 'package:flutter/material.dart';

class AgregarProductosView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Agregar Productos')),
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 30,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :[
           const Text('ID'),
           const SizedBox(
            height: 10,
           ),
           const Text('Nombre'),
           const SizedBox(
            height: 10,
           ),
            const Text('Precio'),
           const SizedBox(
            height: 10,
           ),
          ],
        ),
      ),
    );
  }

}