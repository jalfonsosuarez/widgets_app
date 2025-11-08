import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/providers/counter_provider.dart';
import 'package:widgets_app/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter-screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final int count = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            }, 
            icon: !isDarkMode 
              ? Icon( Icons.light_mode_outlined)
              : Icon( Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Center(
          child: Text('Valor: $count', 
          style: Theme.of(context).textTheme.titleLarge,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
