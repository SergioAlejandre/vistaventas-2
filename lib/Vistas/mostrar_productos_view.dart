import 'package:flutter/material.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';
import 'package:vistaventas/controladores/mostrar_productos_control.dart';

class MostrarProductosView extends StatelessWidget{
  final List<Producto> productos;
  final MostrarProductosControl verProductosController =
      MostrarProductosControl();
  
  MostrarProductosView({
    Key? key,
    required this.productos,
  }) : super(key: key);

 
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
        child: Text('Mostrar Productos'),
      ),
    ),
      
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 30,
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: verProductosController
            .verProductos()
            .map(
              (Producto producto) => ListTile(
                leading: CircleAvatar(
                  child: Text(producto.ID),
                ),
                title: Text(producto.Nombre),
                subtitle: Text(producto.Precio),
              ),
            )
            .toList(),
        ),
      ),
    );
  }

}

