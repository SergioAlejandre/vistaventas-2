import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';

class ComprarProductosControl{
  List<Producto> productosComprados = [];//esto fue lo nuevo agregado
  
double comprarProducto(String id, int cantidadcomprada) {
  var box = Hive.box('productos');
  var producto = box.get(id);
  if (producto != null && producto['Cantidad'] >= cantidadcomprada) {
    producto['Cantidad'] -= cantidadcomprada; // Resta la cantidad comprada
    box.put(id, producto); // Guarda el producto actualizado en la base de datos

    double totalCompra = producto['Precio'] * cantidadcomprada; // Calcula el total de la compra
    productosComprados.add(Producto(//esto fue lo nuevo agregado
        ID: id,
        Nombre: producto['Nombre'],
        Precio: producto['Precio'],
        Cantidad: cantidadcomprada,
      ));
    return totalCompra;
  } else {
    // Maneja el caso en que el producto no existe o no hay suficiente cantidad
    return 0.0;
  }
}

}