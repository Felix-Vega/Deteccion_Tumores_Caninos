import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'main_shell.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _accepted = true;

  void _create() {
    if (!_accepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Acepta los Términos de uso para continuar.')),
      );
      return;
    }
    tabIndex.value = 0;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(
                subtitle: 'Detección Canina · Profesionales',
                title: 'Crear cuenta profesional',
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 16),
              const MicroBanner(
                height: 130,
                text: 'Análisis microscópico para tu práctica clínica.',
              ),
              const SizedBox(height: 12),
              const Text(
                'Carga muestras y revisa la segmentación de colores.',
                style: TextStyle(fontSize: 12, color: AppColors.textMuted),
              ),
              const SizedBox(height: 14),
              const AppTextField(
                label: 'Nombre completo',
                hint: 'Dra. Elena',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: 'Correo profesional',
                hint: 'elena@clinica.vet',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              const AppTextField(
                label: 'Contraseña',
                hint: '••••••••••',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 6),
              const Text(
                'Usa al menos 8 caracteres, con letras y números.',
                style: TextStyle(fontSize: 10.5, color: AppColors.textMuted),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _accepted,
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => _accepted = v ?? false),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Acepto los Términos de uso y la Política de privacidad.',
                      style:
                          TextStyle(fontSize: 11, color: AppColors.textMuted),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              PrimaryButton(label: 'Crear cuenta profesional', onPressed: _create),
              const SizedBox(height: 14),
              const InfoBanner(
                'La herramienta ayuda a revisar segmentaciones de colores. '
                'La interpretación clínica y el diagnóstico siempre '
                'corresponden al profesional.',
              ),
              const SizedBox(height: 16),
              AuthFooter(
                question: '¿Ya tienes una cuenta profesional?',
                action: 'Iniciar sesión',
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
