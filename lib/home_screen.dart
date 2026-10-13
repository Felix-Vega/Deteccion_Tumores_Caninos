import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'models.dart';
import 'patient_screen.dart';
import 'segmentation_result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recent = sampleAnalyses.take(2).toList();

    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Buenos días, Dra. Elena',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.textMuted)),
                      const SizedBox(height: 2),
                      const Text(
                        'Nala · M-024 · citología cutánea',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PatientScreen()),
                  ),
                  child: const PatientAvatar(size: 38),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _UploadCard(onTap: () => tabIndex.value = 1),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Muestras recientes',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
                GestureDetector(
                  onTap: () => tabIndex.value = 2,
                  child: const Text('Ver historial',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            for (final a in recent) ...[
              _RecentTile(analysis: a),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 6),
            AppCard(
              color: AppColors.orangeSoft,
              borderColor: const Color(0xFFF7D8C4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.biotech_outlined,
                        size: 18, color: AppColors.orange),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TRABAJO CON MUESTRAS',
                            style: TextStyle(
                                fontSize: 9,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                color: AppColors.orange)),
                        SizedBox(height: 3),
                        Text('Revisa la muestra con luz uniforme',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark)),
                        SizedBox(height: 3),
                        Text(
                          'Usa una imagen microscópica nítida y evita sombras '
                          'para mejorar la segmentación de colores.',
                          style: TextStyle(
                              fontSize: 11.5,
                              height: 1.35,
                              color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const InfoBanner(
              'Los resultados de segmentación son apoyo a revisión clínica. '
              'No sustituyen el diagnóstico profesional.',
              icon: Icons.help_outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadCard extends StatelessWidget {
  const _UploadCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.file_upload_outlined,
                    color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subir imagen microscópica',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                            color: Colors.white)),
                    SizedBox(height: 6),
                    Text(
                      'Carga la muestra M-024 para segmentación de colores y '
                      'apoyo a revisión clínica.',
                      style: TextStyle(
                          fontSize: 11.5, height: 1.35, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Subir archivo',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward,
                            size: 14, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentTile extends StatelessWidget {
  const _RecentTile({required this.analysis});

  final Analysis analysis;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => SegmentationResultScreen(analysis: analysis)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.mint,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.biotech_outlined,
                size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${analysis.patient} · ${analysis.id}',
                    style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(analysis.type,
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textMuted)),
                    const SizedBox(width: 8),
                    StatusChip.status(analysis.status),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(analysis.date,
                  style: const TextStyle(
                      fontSize: 10.5, color: AppColors.textMuted)),
            ],
          ),
          const Icon(Icons.chevron_right,
              size: 18, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
