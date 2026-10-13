import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'forgot_password_screen.dart';
import 'main.dart';
import 'main_shell.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _login(BuildContext context) {
    tabIndex.value = 0;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MicroBanner(
              height: 210,
              radius: 0,
              subtitle: 'ANÁLISIS CLÍNICO',
              text: 'Revisa muestras, segmenta hallazgos y comparte resultados.',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Acceso clínico',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const AppTextField(
                    label: 'Correo electrónico',
                    hint: 'elena@clinica.vet',
                    icon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  const AppTextField(
                    label: 'Contraseña',
                    hint: '••••••••',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen()),
                      ),
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary),
                      ),
                    ),
                  ),
                  PrimaryButton(
                    label: 'Iniciar sesión',
                    onPressed: () => _login(context),
                  ),
                  const SizedBox(height: 14),
                  const InfoBanner(
                      'Gestiona tus archivos según la política de privacidad.'),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Feature(
                          icon: Icons.fact_check_outlined,
                          label: 'Revisión de hallazgos',
                          color: AppColors.orange),
                      _Feature(
                          icon: Icons.biotech_outlined,
                          label: 'Archivos de microscopio',
                          color: AppColors.primary),
                    ],
                  ),
                  const SizedBox(height: 28),
                  AuthFooter(
                    question: '¿Aún no tienes una cuenta?',
                    action: 'Crear cuenta',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const RegisterScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.5)),
            color: color.withOpacity(0.1),
          ),
          child: Icon(icon, size: 14, color: color),
        ),
        const SizedBox(width: 6),
        Text(label,
            style:
                const TextStyle(fontSize: 10.5, color: AppColors.textMuted)),
      ],
    );
  }
}
