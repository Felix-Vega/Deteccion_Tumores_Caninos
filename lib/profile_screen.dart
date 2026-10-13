import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'login_screen.dart';
import 'main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notifications = true;

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          children: [
            const Text('Clínica veterinaria',
                style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
            const Text('Perfil profesional',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark)),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.mint),
                  child: const Text('EL',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary)),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dra. Elena',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark)),
                      Text('elena@clinica.vet',
                          style: TextStyle(
                              fontSize: 11.5, color: AppColors.textMuted)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined,
                      size: 18, color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cuenta profesional',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark)),
                  SizedBox(height: 8),
                  Text('Clínica veterinaria',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark)),
                  Text('Subir archivos de microscopio para revisión interna',
                      style: TextStyle(
                          fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preferencias de análisis',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark)),
                  const SizedBox(height: 4),
                  SettingsRow(
                    icon: Icons.notifications_none,
                    title: 'Notificaciones de análisis',
                    subtitle: 'Recibir avisos cuando un análisis esté listo',
                    trailing: Switch(
                      value: _notifications,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.primary,
                      onChanged: (v) => setState(() => _notifications = v),
                    ),
                  ),
                  const SettingsRow(
                    icon: Icons.palette_outlined,
                    title: 'Segmentación de colores',
                    value: 'Automática',
                  ),
                  const SettingsRow(
                    icon: Icons.straighten,
                    title: 'Calibración',
                    value: 'Por muestra',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Archivos e informes',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark)),
                  SizedBox(height: 4),
                  SettingsRow(
                    icon: Icons.verified_user_outlined,
                    title: 'Archivos subidos',
                    subtitle: 'Ver, descargar o eliminar archivos',
                  ),
                  SettingsRow(
                    icon: Icons.help_outline,
                    title: 'Informes y exportación',
                  ),
                  SettingsRow(
                    icon: Icons.description_outlined,
                    title: 'Privacidad y ayuda',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _logout,
                child: const Text('Cerrar sesión',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary)),
              ),
            ),
            const Center(
              child: Text('Clínica veterinaria · Versión 1.0',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
            ),
          ],
        ),
      ),
    );
  }
}
