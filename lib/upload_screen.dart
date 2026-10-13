import 'package:flutter/material.dart';

import 'common_widgets.dart';
import 'main.dart';
import 'sample_data_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  // TODO: reemplazar por el archivo real con file_picker / image_picker.
  bool _hasFile = true;

  void _pickFile() {
    setState(() => _hasFile = true);
  }

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
                subtitle: 'Paso 1 de 2 · Archivo microscópico',
                title: 'Subir imagen microscópica',
                onBack: () => tabIndex.value = 0,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Paciente: Nala',
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark)),
                  StatusChip('Muestra M-024'),
                ],
              ),
              const SizedBox(height: 10),
              const AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Citología cutánea',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark)),
                    SizedBox(height: 3),
                    Text('Imagen de muestra para segmentación de colores.',
                        style: TextStyle(
                            fontSize: 11.5, color: AppColors.textMuted)),
                    SizedBox(height: 3),
                    Text('Derivada por Dra. Elena',
                        style: TextStyle(
                            fontSize: 10.5, color: AppColors.textMuted)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selecciona el archivo',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark)),
                    const SizedBox(height: 4),
                    const Text(
                      'Sube una imagen microscópica de la muestra M-024 para '
                      'su revisión.',
                      style: TextStyle(
                          fontSize: 11.5,
                          height: 1.35,
                          color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 12),
                    OutlineAppButton(
                      label: 'Cargar archivo',
                      icon: Icons.file_upload_outlined,
                      onPressed: _pickFile,
                    ),
                    if (_hasFile) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('M-024.jpg',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textDark)),
                                      Text('JPG · 2,4 MB',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColors.textMuted)),
                                    ],
                                  ),
                                ),
                                StatusChip('Listo'),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.insert_drive_file_outlined,
                                    size: 14, color: AppColors.primary),
                                SizedBox(width: 6),
                                Text(
                                    'Archivo seleccionado para revisión microscópica.',
                                    style: TextStyle(
                                        fontSize: 10.5,
                                        color: AppColors.textMuted)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Vista previa microscópica',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark)),
              const Text('Ejemplo ilustrativo de la muestra M-024.',
                  style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: MicroPlaceholder(
                  style: CellStyle.pink,
                  seed: 3,
                  radius: 14,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: const [
                        Positioned(
                            top: 0, left: 0, child: _OverlayChip('Ejemplo')),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: _OverlayChip('Muestra M-024')),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: _OverlayChip('Citología cutánea')),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: OutlineAppButton(
                        label: 'Cambiar archivo', onPressed: _pickFile),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryButton(
                      label: 'Continuar',
                      onPressed: _hasFile
                          ? () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const SampleDataScreen()),
                              )
                          : null,
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

class _OverlayChip extends StatelessWidget {
  const _OverlayChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark)),
    );
  }
}
