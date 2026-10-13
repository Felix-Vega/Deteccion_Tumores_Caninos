import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                subtitle: 'Volver al acceso profesional',
                title: 'Recuperar acceso profesional',
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.mark_email_unread_outlined,
                          size: 28, color: AppColors.primary),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'DETECCIÓN CANINA',
                      style: TextStyle(
                          fontSize: 9,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Recupera tu acceso profesional',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Introduce tu correo profesional. Si corresponde a una cuenta '
                'registrada, recibirás un enlace para restablecer tu acceso.',
                style: TextStyle(
                    fontSize: 12, height: 1.4, color: AppColors.textMuted),
              ),
              const SizedBox(height: 14),
              const AppTextField(
                label: 'Correo electrónico',
                hint: 'elena@clinica.vet',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              PrimaryButton(
                label: 'Enviar enlace de restablecimiento',
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Si el correo está registrado, recibirás un enlace.')),
                ),
              ),
              const SizedBox(height: 14),
              const AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('¿No recibes el correo?',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark)),
                    SizedBox(height: 4),
                    Text(
                      'Revisa la carpeta de spam y comprueba que el correo esté '
                      'bien escrito antes de volver a intentarlo.',
                      style: TextStyle(
                          fontSize: 11.5,
                          height: 1.35,
                          color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const InfoBanner(
                'Por seguridad, si el correo profesional corresponde a una '
                'cuenta registrada, recibirás las instrucciones en tu bandeja '
                'de entrada.',
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Volver al acceso profesional',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
