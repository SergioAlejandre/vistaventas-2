import 'package:flutter/material.dart';
import 'package:vistaventas/controladores/agregar_productos_control.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class AgregarProductosView extends StatelessWidget{
  final List<Producto> productos;
  AgregarProductosView({Key? key, required this.productos}) : super(key: key);
  final TextEditingController idcontrol = TextEditingController();
  final TextEditingController nombrecontrol = TextEditingController();
  final TextEditingController preciocontrol = TextEditingController();
  final AgregarProductosControl agregarProductosController =
      AgregarProductosControl();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 241, 229, 112),
      appBar: AppBar(title:const DefaultTextStyle(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        child: Text('Agregar Productos'),
      ),
      backgroundColor: Color.fromARGB(255, 2, 73, 121),
    ),
      
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 30,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :[
            const DefaultTextStyle(
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            ),
            child: Text('ID'),
           ),
           const SizedBox(
            height: 10,
           ),
           TextField(
               controller:idcontrol,
               decoration: InputDecoration(
               border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
            height: 10,
           ),
           const DefaultTextStyle(
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            ),
            child: Text('Nombre'),
           ),
           const SizedBox(
            height: 10,
           ),
           TextField(
                controller:nombrecontrol,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
            height: 10,
           ),
           const DefaultTextStyle(
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            ),
            child: Text('Precio'),
           ),
           const SizedBox(
            height: 10,
           ),
           TextField(
                controller:preciocontrol,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
            ),
            const SizedBox(
            height: 10,
           ),
            CustomButtonHome(
              name: 'Agregar Producto',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                /*Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                       
                     );
                    },
                  ),
                );*/
                agregarProductosController.agregarProducto(
                    ID: idcontrol.text,
                    Nombre: nombrecontrol.text,
                    Precio: preciocontrol.text,
                  );
                  Navigator.pop(context);
              },
            ),
            const SizedBox(
            height: 10,
           ),
            CustomButtonHome(
              name: 'Limpiar',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                /*Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                       
                     );
                    },
                  ),
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }

}