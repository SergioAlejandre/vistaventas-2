import 'package:hive_flutter/hive_flutter.dart';

class AgregarProductosControl{
  void agregarProducto({
    required String ID,
    required String Nombre,
    required String Precio,
    required String Cantidad,
    }){
      //1.- validar datos de entrada
      

      //2.- guardar en la base de datos
      var productos = Hive.box('productos');

      productos.put(
        ID,
        {
          'ID': ID,
          'Nombre': Nombre,
          'Precio': Precio,
          'Cantidad': Cantidad,
        },
      );
         // productos.delete(ID);
      
    }
 
   
}