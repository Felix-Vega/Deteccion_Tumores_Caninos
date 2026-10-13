import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'models.dart';
import 'patient_screen.dart';
import 'segmentation_result_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  static const _filters = ['Todos', 'Borrador', 'Pendiente', 'Revisado'];
  String _filter = 'Todos';

  bool _matches(Analysis a) {
    switch (_filter) {
      case 'Borrador':
        return a.status == AnalysisStatus.draft;
      case 'Pendiente':
        return a.status == AnalysisStatus.pending;
      case 'Revisado':
        return a.status == AnalysisStatus.reviewed;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = sampleAnalyses.where(_matches).toList();

    return Scaffold(
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          children: [
            ScreenHeader(
              subtitle: 'Historial de análisis microscópicos',
              title: 'Análisis microscópicos',
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search,
                    size: 20, color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PatientScreen()),
              ),
              child: const Row(
                children: [
                  Icon(Icons.pets, size: 18, color: AppColors.primary),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Nala · Todos los análisis',
                        style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark)),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: AppColors.textMuted),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final f in _filters)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _filter = f),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: f == _filter
                                ? AppColors.primary
                                : AppColors.mint,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(f,
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: f == _filter
                                      ? Colors.white
                                      : AppColors.primary)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text('Últimos análisis · ${items.length} registros',
                style: const TextStyle(
                    fontSize: 11.5, color: AppColors.textMuted)),
            const SizedBox(height: 8),
            for (final a in items) ...[
              _HistoryCard(analysis: a),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 4),
            const InfoBanner(
              'Los estados reflejan el flujo de revisión; no indican '
              'diagnóstico.',
              icon: Icons.help_outline,
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Exportación de informe pendiente.')),
                ),
                child: const Text('Exportar informe profesional',
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.analysis});

  final Analysis analysis;

  @override
  Widget build(BuildContext context) {
    final a = analysis;
    return AppCard(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => SegmentationResultScreen(analysis: a)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  a.status == AnalysisStatus.reviewed
                      ? Icons.biotech_outlined
                      : Icons.center_focus_strong_outlined,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${a.patient} ${a.id}',
                            style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark)),
                        Text(a.date,
                            style: const TextStyle(
                                fontSize: 10.5, color: AppColors.textMuted)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(a.type,
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.textMuted)),
                        StatusChip.status(a.status),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 18, color: AppColors.textMuted),
            ],
          ),
          const SizedBox(height: 8),
          Text(a.description,
              style:
                  const TextStyle(fontSize: 10.5, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}
