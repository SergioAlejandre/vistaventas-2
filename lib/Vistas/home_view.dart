import 'package:flutter/material.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Punto de Venta'),//CENTAR El TITULO
        leading:  const Align(
          alignment: Alignment.center,
          
            
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonHome(
              name: 'Agregar Productos',
              color: Color.fromARGB(255, 253, 169, 58),
              onPressed: () {
                /*Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                        productos: productos,
                     );
                    },
                  ),
                );*/
              },
            ),
            const SizedBox(height: 20),
            CustomButtonHome(
              name: 'Mostrar Productos',
              color: const Color.fromARGB(255, 253, 169, 58),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MostrarProductoView(
                       productos: productos,
                     );
                    },
                  ),
                );*/
              },
            ),
            const SizedBox(height: 20),
            CustomButtonHome(
              name: 'Venta de productos',
              color: const Color.fromARGB(255, 253, 169, 58),
              onPressed: () {
                
              },
            ),
            const SizedBox(height: 20),
            /*CustomButtonHome(
              name: 'Test Hive',
              color: Colors.blue,
              onPressed: () {
               // var productosBox = Hive.box('productos');
               // print('Productos: ${productosBox.values}');
              },
            ),*/
          ],
        ),
      ),
    );
  }

}