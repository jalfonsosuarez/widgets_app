import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui-controls-screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Modo desarrollador'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [

            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = value!;
              }), 
              child: const Column(
                children: [
                  RadioListTile(
                    title: Text('En coche'),
                    subtitle: Text('Viajar en coche'),
                    value: Transportation.car,
                  ),

                  RadioListTile(
                    title: Text('En avion'),
                    subtitle: Text('Viajar en avion'),
                    value: Transportation.plane,
                  ),

                  RadioListTile(
                    title: Text('En barco'),
                    subtitle: Text('Viajar en barco'),
                    value: Transportation.boat,
                  ),

                  RadioListTile(
                    title: Text('En submarino'),
                    subtitle: Text('Viajar en submarino'),
                    value: Transportation.submarine,
                  ),
                ],
              )
            )
          ],
        ),

        CheckboxListTile(
          title: const Text('Desayuno'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),

        CheckboxListTile(
          title: const Text('Almuerzo'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          title: const Text('Cena'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),

      ],
    );
  }
}
