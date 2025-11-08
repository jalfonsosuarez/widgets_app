import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {


  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
              }, 
              child: const Text('Elevated button'),
            ),
           const ElevatedButton(
              onPressed: null,
              child: const Text('Elevated disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                
              }, 
              icon: const Icon( Icons.access_alarm_rounded),
              label: Text('Elevated Icon'),
            ),
            FilledButton(
              onPressed: () {
              
              }, 
              child: Text('Filled Button'),
            ),
            FilledButton.icon(
              onPressed: () {
              
              }, 
              icon: const Icon(Icons.accessibility_new),
              label: Text('Filled Icon'),
            ),
            OutlinedButton(
              onPressed: () {
              
              }, 
              child: Text('Outline button'),
            ),
            OutlinedButton.icon(
              onPressed: () {
              
              }, 
              label: Text('Outline icon'),
              icon: Icon( Icons.terminal),
            ),
            TextButton(
              onPressed: () {
                
              }, 
              child: Text('Text button'),
            ),
            TextButton.icon(
              onPressed: () {
                
              }, 
              label: Text('Text icon'),
              icon: Icon( Icons.account_box_outlined ),
            ),
            
            const CustomButton(),

            IconButton(
              onPressed: () {
                
              }, 
              icon: Icon( Icons.app_registration_rounded),
            ),
            IconButton(
              onPressed: () {
                
              }, 
              icon: Icon( Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  colors.primary,
                ),
                iconColor: const WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', 
              style: TextStyle( color: Colors.white),
            )
          ),
        ),
      ),
    );
  }
}