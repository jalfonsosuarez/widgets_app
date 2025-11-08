import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'themeChanger-screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeChangerScreen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: !isDarkMode
                ? Icon(Icons.light_mode_outlined)
                : Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        RadioGroup(
          groupValue: colors[selectedColor],
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(colors.indexOf(value!));
          },
          child: Column(
            children: [
              ...colors.map(
                (color) => RadioListTile(
                  title: Text('Este color', style: TextStyle(color: color)),
                  activeColor: colors[selectedColor],
                  value: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
