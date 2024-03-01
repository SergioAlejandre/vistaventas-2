import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vistaventas/modelos/producto_modelo.dart';
import 'package:vistaventas/controladores/mostrar_productos_control.dart';
import 'package:vistaventas/widgets/CustomButtonHome.dart';

class MostrarProductosView extends StatefulWidget {
  @override
  mostrarProductosViewState createState() => mostrarProductosViewState();
  const MostrarProductosView({Key? key, required List<Producto> productos})
      : super(key: key);
}

class mostrarProductosViewState extends State<MostrarProductosView> {
  final TextEditingController idcontrol = TextEditingController();
  final TextEditingController nombrecontrol = TextEditingController();
  final TextEditingController preciocontrol = TextEditingController();
  final TextEditingController cantidadcontrol = TextEditingController();
  final MostrarProductosControl editarProductosController =
      MostrarProductosControl();
  final MostrarProductosControl verProductosController =
      MostrarProductosControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 229, 112),
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          child: Text('Mostrar Productos'),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 108, 40),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
        child: Container(
          //color: Colors.white,
          margin: const EdgeInsets.all(0),
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 5,
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
                      backgroundColor: const Color.fromARGB(255, 160, 108, 40),
                    ),
                    title: Text(producto.Nombre),
                    subtitle: Text(
                        '\$${producto.Precio}        Cantidad:${producto.Cantidad}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            var box = Hive.box('productos');
                            await box.delete(producto.ID);
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                             await showDialog<String>(
                              
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Editar producto'),
                                content: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    TextField(
                                      controller: idcontrol,
                                      decoration: const InputDecoration(
                                          hintText: "ID del producto a editar"),
                                    ),
                                    TextField(
                                      controller: nombrecontrol,
                                      decoration: const InputDecoration(
                                          hintText: "Nuevo nombre"),
                                    ),
                                    TextField(
                                      controller: preciocontrol,
                                      decoration: const InputDecoration(
                                          hintText: "Nuevo precio"),
                                    ),
                                    TextField(
                                      controller: cantidadcontrol,
                                      decoration: const InputDecoration(
                                          hintText: "Nueva cantidad"),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    CustomButtonHome(
                                      name: 'Realizar Cambios',
                                      color: const Color.fromARGB(
                                          255, 160, 108, 40),
                                      onPressed: () {
                                        editarProductosController
                                            .modificarProducto(
                                          ID: idcontrol.text,
                                          Nombre: nombrecontrol.text,
                                          Precio: double.parse(preciocontrol.text),
                                          Cantidad: int.parse(cantidadcontrol.text),
                                        );
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    CustomButtonHome(
                                      name: 'Limpiar',
                                      color: const Color.fromARGB(
                                          255, 160, 108, 40),
                                      onPressed: () {
                                        idcontrol.clear();
                                        nombrecontrol.clear();
                                        preciocontrol.clear();
                                        cantidadcontrol.clear();
                                      },
                                    ),
                                  ],
                                ),
                                ),
                               ),
                            );
                            setState(() {});
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
