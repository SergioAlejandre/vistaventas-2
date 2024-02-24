import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';


class MostrarProductosControl {
  List<Producto> verProductos() {
    var productos = Hive.box('productos');
    if (productos.isNotEmpty) {
      List<Producto> listaProductos = [];
      for (var i = 0; i < productos.length; i++) {
        listaProductos.add(
          Producto(
            ID: productos.getAt(i)['ID'],
            Nombre: productos.getAt(i)['Nombre'],
            Precio: productos.getAt(i)['Precio'],  // deberia de ser -------double.parse(productos.getAt(i)['precio']),
          ),
        );
      }
      return listaProductos;
    }
    return [];
  }
    

}