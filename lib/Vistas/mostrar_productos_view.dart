

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/controladores/mostrar_productos_control.dart';

class MostrarProductosView extends StatefulWidget{
 
  @override
  mostrarProductosViewState createState() => mostrarProductosViewState();
 /* MostrarProductosView({
    Key? key,
    required this.productos,
  }) : super(key: key);*/
  const MostrarProductosView({Key?key,required List<Producto> productos}) : super(key: key);

}

class mostrarProductosViewState extends State<MostrarProductosView>{
  //final List<Producto> productos;
  final MostrarProductosControl verProductosController =
      MostrarProductosControl();
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
        child: Text('Mostrar Productos'),
      ),
      backgroundColor: const Color.fromARGB(255, 2, 73, 121),
    ),
      
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:0,
          vertical: 0,
        ),
        child:Container(
          color:Colors.white,
          margin: const EdgeInsets.all(10),
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: verProductosController
              .verProductos()
              .map(
                (Producto producto) => ListTile(
                  leading: CircleAvatar(
                    child: Text(producto.ID),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 241, 229, 112),
                  ),
                  title: Text(producto.Nombre),
                  subtitle: Text(producto.Precio),
                  trailing:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async{
                          var box=Hive.box('productos');
                          await box.delete(producto.ID); 
                          setState((){});                          
                        },
                      ),
                    ],
                  ),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),

                ),
              )
              .toList(),
          ),
        ),
      ),
    );
  }

}

