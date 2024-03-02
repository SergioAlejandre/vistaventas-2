import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/Vistas/productos_comprados_view.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';
import 'package:vistaventas/controladores/compra_productos_control.dart';

class CompraDeProductosView extends StatelessWidget {
  final TextEditingController idcontrol = TextEditingController();
  final TextEditingController preciocontrol = TextEditingController();
  final TextEditingController cantidadcontrol = TextEditingController();
  final ComprarProductosControl comprarProductosController =
      ComprarProductosControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 229, 112),
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          child: Text('Compra de productos'),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 108, 40),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              child: Text('Ingresa el ID del producto a comprar'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: idcontrol,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
            const DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              child: Text('Ingresa la cantidad del producto a comprar'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: cantidadcontrol,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           CustomButtonHome(
              name: 'Comprar Producto',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                double totalCompra = comprarProductosController.comprarProducto(
                    idcontrol.text, int.parse(cantidadcontrol.text));
                //print(totalCompra);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            'Producto comprado Correctamente, Con el ID: ${idcontrol.text} Con un total de compra de: \$$totalCompra Por la cantidad de: ${cantidadcontrol.text} Productos'),
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
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductosCompradosView(),
                  ),
                );*/
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
                cantidadcontrol.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
