import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'models.dart';
import 'segmentation_result_screen.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  void _goTab(BuildContext context, int index) {
    tabIndex.value = index;
    Navigator.of(context).popUntil((r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final samples = sampleAnalyses.take(2).toList();

    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                children: [
                  ScreenHeader(
                    subtitle: 'Ficha clínica del paciente',
                    title: 'Ficha del paciente',
                    onBack: () => Navigator.of(context).pop(),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined,
                          size: 18, color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.mint,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const PatientAvatar(size: 72),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Nala',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.textDark)),
                                  Text('Golden retriever · Hembra',
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          color: AppColors.textMuted)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Expanded(child: _Stat(label: 'Edad', value: '4 años')),
                            SizedBox(width: 8),
                            Expanded(child: _Stat(label: 'Peso', value: '28 kg')),
                            SizedBox(width: 8),
                            Expanded(
                                child: _Stat(label: 'Esterilizada', value: 'Sí')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Muestras y análisis',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark)),
                        const SizedBox(height: 8),
                        for (final a in samples)
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) =>
                                      SegmentationResultScreen(analysis: a)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.mint,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                        Icons.center_focus_strong_outlined,
                                        size: 16,
                                        color: AppColors.primary),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${a.id} · ${a.type}',
                                            style: const TextStyle(
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.textDark)),
                                        Text(
                                            a.status == AnalysisStatus.pending
                                                ? '${a.date} · Pendiente de revisión'
                                                : '${a.date} · Revisado',
                                            style: const TextStyle(
                                                fontSize: 10.5,
                                                color: AppColors.textMuted)),
                                      ],
                                    ),
                                  ),
                                  if (a.status == AnalysisStatus.pending)
                                    StatusChip.status(a.status)
                                  else
                                    const Icon(Icons.chevron_right,
                                        size: 18,
                                        color: AppColors.textMuted),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () => _goTab(context, 1),
                          child: const Text('Nueva muestra o subir imagen',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notas clínicas',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark)),
                        const SizedBox(height: 8),
                        const InfoBanner(
                          'Registra notas clínicas y vincula cada imagen a su '
                          'muestra.',
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _goTab(context, 2),
                          child: const Text('Ver historial',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: PrimaryButton(
                label: 'Nueva muestra o subir imagen',
                onPressed: () => _goTab(context, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 10, color: AppColors.textMuted)),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark)),
        ],
      ),
    );
  }
}
