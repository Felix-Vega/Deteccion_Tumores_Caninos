import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'history_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'upload_screen.dart';

/// Contenedor de las 4 pestañas principales. Cada pantalla dibuja su propia
/// [AppBottomNav], así también aparece en las pantallas que se abren encima
/// (datos de la muestra, resultado, ficha del paciente).
class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabIndex,
      builder: (context, index, _) {
        return IndexedStack(
          index: index,
          children: const [
            HomeScreen(),
            UploadScreen(),
            HistoryScreen(),
            ProfileScreen(),
          ],
        );
      },
    );
  }
}
