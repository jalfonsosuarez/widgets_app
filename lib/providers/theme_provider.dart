import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//? Estado => isDarkModeProvider = boolean
final isDarkModeProvider = StateProvider((ref) => false);

//? Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//? Indice del color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);
