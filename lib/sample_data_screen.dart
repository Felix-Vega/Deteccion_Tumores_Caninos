import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'segmentation_result_screen.dart';

class SampleDataScreen extends StatelessWidget {
  const SampleDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(
                subtitle: 'Paso 2 de 2 · Archivo microscópico',
                title: 'Datos de la muestra',
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 14),
              AppCard(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Archivo cargado',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textMuted)),
                              Text('M-024.jpg',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.textDark)),
                            ],
                          ),
                        ),
                        StatusChip('Ejemplo'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: MicroPlaceholder(
                          style: CellStyle.pink, seed: 3, radius: 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    const PatientAvatar(size: 36),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Paciente',
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.textMuted)),
                          Text('Nala',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark)),
                        ],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        color: AppColors.textMuted),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _Field(label: 'ID de muestra', value: 'M-024')),
                  SizedBox(width: 12),
                  Expanded(
                      child: _Field(
                          label: 'Tipo de muestra', hint: 'Citología cutánea')),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _Field(
                          label: 'Preparación', hint: 'Sin especificar')),
                  SizedBox(width: 12),
                  Expanded(
                      child:
                          _Field(label: 'Tinción', hint: 'Sin especificar')),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child:
                          _Field(label: 'Aumento', hint: 'Sin especificar')),
                  SizedBox(width: 12),
                  Expanded(
                      child: _Field(
                          label: 'Método de segmentación',
                          value: 'Por colores')),
                ],
              ),
              const SizedBox(height: 12),
              const InfoBanner(
                'Segmentación como apoyo clínico; requiere interpretación '
                'profesional.',
                icon: Icons.help_outline,
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Analizar muestra',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const SegmentationResultScreen()),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text('M-024.jpg · Archivo de demostración',
                    style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({required this.label, this.value, this.hint});

  final String label;
  final String? value;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark)),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: value,
          style: const TextStyle(fontSize: 12.5, color: AppColors.textDark),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(fontSize: 12.5, color: AppColors.textMuted),
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
