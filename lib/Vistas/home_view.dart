import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/Vistas/agregar_productos_view.dart';
import 'package:vistaventas/Vistas/compra_productos_view.dart';
import 'package:vistaventas/Vistas/mostrar_productos_view.dart';
import 'package:vistaventas/Vistas/productos_comprados_view.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class HomeView extends StatelessWidget {
  List<Producto> productos = [
  
  ];
  HomeView({Key? key}) : super(key: key);
  
  
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
        child: Text('Punto de venta'),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 160, 108, 40),
    ),
      
      body:SingleChildScrollView(
        child:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70
            ),
            CustomButtonHome(
              name: 'Agregar Productos',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                      productos: productos,
                     );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20
            ),
            CustomButtonHome(
              name: 'Mostrar Productos',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MostrarProductosView(
                       productos: productos,
                     );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20
            ),
            CustomButtonHome(
              name: 'Compra de productos',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CompraDeProductosView(
                      // productos: productos,
                     );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20
            ),
           /*CustomButtonHome(
              name: 'Test Hive',
              color: Colors.blue,
              onPressed: () {
               var productosBox = Hive.box('productos');
                print('Productos: ${productosBox.values}');
              },
            ),*/
           /* CustomButtonHome(
              name: 'Productos Comprados',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductosCompradosView(),
                  ),
                );
              },
            ),*/
          ],
        ),
      ),
     ),
    );
  }

}