enum AnalysisStatus { pending, reviewed, draft }

class Analysis {
  const Analysis({
    required this.id,
    required this.patient,
    required this.type,
    required this.date,
    required this.status,
    required this.description,
  });

  final String id;
  final String patient;
  final String type;
  final String date;
  final AnalysisStatus status;
  final String description;
}

const sampleAnalyses = <Analysis>[
  Analysis(
    id: 'M-024',
    patient: 'Nala',
    type: 'Citología cutánea',
    date: 'Hoy, 09:12',
    status: AnalysisStatus.pending,
    description: 'Muestra recibida · Segmentación de colores activada',
  ),
  Analysis(
    id: 'M-023',
    patient: 'Nala',
    type: 'Citología cutánea',
    date: '24 sep',
    status: AnalysisStatus.reviewed,
    description: 'Informe finalizado · Archivo listo para exportación',
  ),
  Analysis(
    id: 'M-022',
    patient: 'Nala',
    type: 'Citología cutánea',
    date: '12 sep',
    status: AnalysisStatus.pending,
    description: 'Segmentación activa · Esperando revisión clínica',
  ),
  Analysis(
    id: 'M-021',
    patient: 'Nala',
    type: 'Citología cutánea',
    date: '02 sep',
    status: AnalysisStatus.draft,
    description: 'Archivo guardado · Sin revisión clínica',
  ),
];
