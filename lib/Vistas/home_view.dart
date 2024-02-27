import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/Vistas/agregar_productos_view.dart';
import 'package:vistaventas/Vistas/compra_productos_view.dart';
import 'package:vistaventas/Vistas/mostrar_productos_view.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class HomeView extends StatelessWidget {
  List<Producto> productos = [
  
  ];
  HomeView({Key? key}) : super(key: key);
  
  
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
        child: Text('Punto de venta'),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 2, 73, 121),
    ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70
            ),
            CustomButtonHome(
              name: 'Agregar Productos',
              color: Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                       //productos: [],//deberia ir productos: productos,--------------
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
              color: Color.fromARGB(255, 160, 108, 40),
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
                       //productos: productos,
                     );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20
            ),
           CustomButtonHome(
              name: 'Test Hive',
              color: Colors.blue,
              onPressed: () {
               var productosBox = Hive.box('productos');
                print('Productos: ${productosBox.values}');
              },
            ),
          ],
        ),
      ),
    );
  }

}