import 'package:flutter/material.dart';
import 'package:vistaventas/controladores/compra_productos_control.dart';
import 'package:vistaventas/controladores/mostrar_productos_control.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';

class ProductosCompradosView extends StatelessWidget {//esta es la que jala
  final MostrarProductosControl mostrarProductosController = MostrarProductosControl();

  @override
  Widget build(BuildContext context) {
    List<Producto> productosComprados = mostrarProductosController.verProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Comprados'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...productosComprados.map((producto) {
              return ListTile(
                title: Text(producto.Nombre),
                subtitle: Text('Precio: ${producto.Precio}, Cantidad: ${producto.Cantidad}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
/*class ProductosCompradosView extends StatelessWidget {
  final ComprarProductosControl comprarProductosController = ComprarProductosControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Comprados'),
      ),
      body: ListView.builder(
        itemCount: comprarProductosController.productosComprados.length,
        itemBuilder: (context, index) {
          var producto = comprarProductosController.productosComprados[index];
          return ListTile(
            title: Text(producto.Nombre),
            subtitle: Text('Precio: ${producto.Precio}, Cantidad: ${producto.Cantidad}'),
          );
        },
      ),
    );
  }
}*/