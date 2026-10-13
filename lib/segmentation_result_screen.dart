import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'models.dart';

class SegmentationResultScreen extends StatelessWidget {
  const SegmentationResultScreen({super.key, this.analysis});

  final Analysis? analysis;

  static const _regions = [
    (AppColors.primary, 'Región verde', '34,2%'),
    (AppColors.orange, 'Región naranja', '21,8%'),
    (Color(0xFF8A9795), 'Región gris', '44,0%'),
  ];

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final id = analysis?.id ?? 'M-024';
    final patient = analysis?.patient ?? 'Nala';

    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(
                subtitle: '$patient · $id · citología cutánea',
                title: 'Segmentación de colores',
                onBack: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 14),
              AppCard(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Imagen microscópica',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark)),
                          const SizedBox(height: 3),
                          Text('$id.jpg · Demostración · Sin calibrar',
                              style: const TextStyle(
                                  fontSize: 10.5,
                                  color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    StatusChip('$id.jpg',
                        background: AppColors.orangeSoft,
                        foreground: AppColors.orange),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Original / segmentada · Ejemplo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              AspectRatio(
                                aspectRatio: 1,
                                child: MicroPlaceholder(
                                    style: CellStyle.pink,
                                    seed: 3,
                                    radius: 10),
                              ),
                              SizedBox(height: 4),
                              Text('Original',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textMuted)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              AspectRatio(
                                aspectRatio: 1,
                                child: MicroPlaceholder(
                                    style: CellStyle.segmented,
                                    seed: 3,
                                    radius: 10),
                              ),
                              SizedBox(height: 4),
                              Text('Segmentada',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textMuted)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text('Regiones por color, no identificación celular.',
                        style: TextStyle(
                            fontSize: 10, color: AppColors.textMuted)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Área por región · Datos de ejemplo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark)),
                    const SizedBox(height: 10),
                    for (final r in _regions)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: r.$1,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('${r.$2} · ${r.$3}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textDark)),
                          ],
                        ),
                      ),
                    const SizedBox(height: 4),
                    const Text(
                        'Porcentaje del área analizada · Total 100%',
                        style: TextStyle(
                            fontSize: 10, color: AppColors.textMuted)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppCard(
                color: AppColors.orangeSoft,
                borderColor: const Color(0xFFF7D8C4),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Revisión profesional',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark)),
                    const SizedBox(height: 6),
                    const StatusChip('Pendiente de revisión',
                        background: Colors.white,
                        foreground: AppColors.orange),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFF7D8C4)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Interpretación clínica',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark)),
                          SizedBox(height: 3),
                          Text('Añadir hallazgos y notas del veterinario.',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const InfoBanner(
                'No es un diagnóstico. Las medidas físicas requieren '
                'calibración.',
                icon: Icons.verified_user_outlined,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Guardar resultado',
                      onPressed: () =>
                          _snack(context, 'Resultado guardado en el historial.'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlineAppButton(
                      label: 'Exportar informe',
                      onPressed: () =>
                          _snack(context, 'Exportación de informe pendiente.'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
