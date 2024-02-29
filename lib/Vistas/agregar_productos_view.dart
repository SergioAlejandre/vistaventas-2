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
  final TextEditingController cantidadcontrol = TextEditingController();
  final AgregarProductosControl agregarProductosController =
      AgregarProductosControl();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 241, 229, 112),
      appBar: AppBar(title:const DefaultTextStyle(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        child: Text('Agregar Productos'),
      ),
      backgroundColor: const Color.fromARGB(255, 160, 108, 40),
    ),
      
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 30,
        ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
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
               decoration: const InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25)
                ),
               ),
               
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
                decoration: const InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25)
                ),  
                ),
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
                decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                  Radius.circular(25)
                ),
                ),
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
            child: Text('Cantidad'),
           ),
           const SizedBox(
            height: 10,
           ),
           TextField(
                controller:cantidadcontrol,
                decoration: const InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25)
                ),  
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
                  agregarProductosController.agregarProducto(
                    ID: idcontrol.text,
                    Nombre: nombrecontrol.text,
                    Precio: preciocontrol.text,
                    Cantidad: cantidadcontrol.text,
                  );
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: const Text('Producto agregado Correctamente'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  });
                  //Navigator.pop(context);
              },
            ),
            const SizedBox(
            height: 10,
           ),
            CustomButtonHome(
              name: 'Limpiar',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                idcontrol.clear();
                nombrecontrol.clear();
                preciocontrol.clear();
                cantidadcontrol.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

}