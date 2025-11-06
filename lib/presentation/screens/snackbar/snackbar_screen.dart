import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar-screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'Aceptar', 
        onPressed: (){}
      ),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog( BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false, //? evita que se cierre el diálogo al hacer click fuera de él.
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Sit nostrud officia et fugiat consectetur voluptate incididunt consectetur reprehenderit deserunt. In occaecat aliquip sunt culpa labore elit magna esse excepteur ipsum incididunt. Elit proident dolore aute anim fugiat eu nostrud ut velit. Consequat duis dolor quis ullamco velit aute ullamco dolor. Ex officia veniam proident voluptate eiusmod minim ullamco esse aute sint consequat Lorem do voluptate. Sint minim minim fugiat amet duis occaecat voluptate officia adipisicing Lorem ex eiusmod esse.'),
        actions: [
          TextButton(onPressed: () => context.pop(), 
          child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Velit sint Lorem veniam voluptate quis mollit consequat incididunt.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}

