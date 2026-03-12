// MedKitt — Lab Panels Data
// Standard US lab panels with reference ranges

export const LAB_PANELS = {
  bmp: {
    id: 'bmp',
    name: 'Basic Metabolic Panel (BMP)',
    icon: '🧪',
    labs: [
      { id: 'sodium', name: 'Sodium', unit: 'mEq/L', low: 136, high: 145, criticalLow: 120, criticalHigh: 160 },
      { id: 'potassium', name: 'Potassium', unit: 'mEq/L', low: 3.5, high: 5.0, criticalLow: 2.5, criticalHigh: 6.5 },
      { id: 'chloride', name: 'Chloride', unit: 'mEq/L', low: 98, high: 106 },
      { id: 'bicarbonate', name: 'CO2/Bicarb', unit: 'mEq/L', low: 22, high: 29, criticalLow: 10 },
      { id: 'bun', name: 'BUN', unit: 'mg/dL', low: 7, high: 20 },
      { id: 'creatinine', name: 'Creatinine', unit: 'mg/dL', low: 0.7, high: 1.3, criticalHigh: 10 },
      { id: 'glucose', name: 'Glucose', unit: 'mg/dL', low: 70, high: 100, criticalLow: 40, criticalHigh: 500 },
      { id: 'calcium', name: 'Calcium', unit: 'mg/dL', low: 8.5, high: 10.5, criticalLow: 6.0, criticalHigh: 14.0 },
    ]
  },
  cmp: {
    id: 'cmp',
    name: 'Comprehensive Metabolic Panel (CMP)',
    icon: '🧬',
    labs: [
      { id: 'sodium', name: 'Sodium', unit: 'mEq/L', low: 136, high: 145, criticalLow: 120, criticalHigh: 160 },
      { id: 'potassium', name: 'Potassium', unit: 'mEq/L', low: 3.5, high: 5.0, criticalLow: 2.5, criticalHigh: 6.5 },
      { id: 'chloride', name: 'Chloride', unit: 'mEq/L', low: 98, high: 106 },
      { id: 'bicarbonate', name: 'CO2/Bicarb', unit: 'mEq/L', low: 22, high: 29, criticalLow: 10 },
      { id: 'bun', name: 'BUN', unit: 'mg/dL', low: 7, high: 20 },
      { id: 'creatinine', name: 'Creatinine', unit: 'mg/dL', low: 0.7, high: 1.3, criticalHigh: 10 },
      { id: 'glucose', name: 'Glucose', unit: 'mg/dL', low: 70, high: 100, criticalLow: 40, criticalHigh: 500 },
      { id: 'calcium', name: 'Calcium', unit: 'mg/dL', low: 8.5, high: 10.5, criticalLow: 6.0, criticalHigh: 14.0 },
      { id: 'albumin', name: 'Albumin', unit: 'g/dL', low: 3.5, high: 5.0 },
      { id: 'totalProtein', name: 'Total Protein', unit: 'g/dL', low: 6.0, high: 8.3 },
      { id: 'ast', name: 'AST', unit: 'U/L', low: 10, high: 40, criticalHigh: 1000 },
      { id: 'alt', name: 'ALT', unit: 'U/L', low: 7, high: 56, criticalHigh: 1000 },
      { id: 'alkPhos', name: 'Alk Phos', unit: 'U/L', low: 44, high: 147 },
      { id: 'bilirubin', name: 'Total Bilirubin', unit: 'mg/dL', low: 0.1, high: 1.2, criticalHigh: 15 },
    ]
  },
  cbc: {
    id: 'cbc',
    name: 'Complete Blood Count (CBC)',
    icon: '🩸',
    labs: [
      { id: 'wbc', name: 'WBC', unit: 'K/uL', low: 4.5, high: 11.0, criticalLow: 2.0, criticalHigh: 30.0 },
      { id: 'hemoglobin', name: 'Hemoglobin', unit: 'g/dL', low: 12.0, high: 17.5, criticalLow: 7.0 },
      { id: 'hematocrit', name: 'Hematocrit', unit: '%', low: 36, high: 50, criticalLow: 20 },
      { id: 'platelets', name: 'Platelets', unit: 'K/uL', low: 150, high: 400, criticalLow: 50, criticalHigh: 1000 },
      { id: 'mcv', name: 'MCV', unit: 'fL', low: 80, high: 100 },
      { id: 'rdw', name: 'RDW', unit: '%', low: 11.5, high: 14.5 },
    ]
  },
  cbcDiff: {
    id: 'cbcDiff',
    name: 'CBC with Differential',
    icon: '🩸',
    labs: [
      { id: 'wbc', name: 'WBC', unit: 'K/uL', low: 4.5, high: 11.0, criticalLow: 2.0, criticalHigh: 30.0 },
      { id: 'hemoglobin', name: 'Hemoglobin', unit: 'g/dL', low: 12.0, high: 17.5, criticalLow: 7.0 },
      { id: 'hematocrit', name: 'Hematocrit', unit: '%', low: 36, high: 50, criticalLow: 20 },
      { id: 'platelets', name: 'Platelets', unit: 'K/uL', low: 150, high: 400, criticalLow: 50, criticalHigh: 1000 },
      { id: 'neutrophils', name: 'Neutrophils', unit: '%', low: 40, high: 70 },
      { id: 'lymphocytes', name: 'Lymphocytes', unit: '%', low: 20, high: 40 },
      { id: 'monocytes', name: 'Monocytes', unit: '%', low: 2, high: 8 },
      { id: 'eosinophils', name: 'Eosinophils', unit: '%', low: 1, high: 4 },
      { id: 'basophils', name: 'Basophils', unit: '%', low: 0, high: 1 },
      { id: 'bands', name: 'Bands', unit: '%', low: 0, high: 5 },
    ]
  },
  vbg: {
    id: 'vbg',
    name: 'Venous Blood Gas (VBG)',
    icon: '💨',
    labs: [
      { id: 'ph', name: 'pH', unit: '', low: 7.32, high: 7.42, criticalLow: 7.1, criticalHigh: 7.6 },
      { id: 'pco2', name: 'pCO2', unit: 'mmHg', low: 41, high: 51 },
      { id: 'po2', name: 'pO2', unit: 'mmHg', low: 25, high: 40 },
      { id: 'hco3', name: 'HCO3', unit: 'mEq/L', low: 22, high: 26, criticalLow: 10 },
      { id: 'baseExcess', name: 'Base Excess', unit: 'mEq/L', low: -2, high: 2 },
      { id: 'lactate', name: 'Lactate', unit: 'mmol/L', low: 0.5, high: 2.0, criticalHigh: 4.0 },
    ]
  },
  abg: {
    id: 'abg',
    name: 'Arterial Blood Gas (ABG)',
    icon: '💨',
    labs: [
      { id: 'ph', name: 'pH', unit: '', low: 7.35, high: 7.45, criticalLow: 7.1, criticalHigh: 7.6 },
      { id: 'pco2', name: 'pCO2', unit: 'mmHg', low: 35, high: 45 },
      { id: 'po2', name: 'pO2', unit: 'mmHg', low: 80, high: 100, criticalLow: 60 },
      { id: 'hco3', name: 'HCO3', unit: 'mEq/L', low: 22, high: 26, criticalLow: 10 },
      { id: 'baseExcess', name: 'Base Excess', unit: 'mEq/L', low: -2, high: 2 },
      { id: 'sao2', name: 'SaO2', unit: '%', low: 95, high: 100, criticalLow: 90 },
    ]
  },
  coox: {
    id: 'coox',
    name: 'Co-Oximetry',
    icon: '🫁',
    labs: [
      { id: 'carboxyhemoglobin', name: 'Carboxyhemoglobin', unit: '%', low: 0, high: 3, criticalHigh: 10 },
      { id: 'methemoglobin', name: 'Methemoglobin', unit: '%', low: 0, high: 1.5, criticalHigh: 10 },
      { id: 'oxyhemoglobin', name: 'Oxyhemoglobin', unit: '%', low: 94, high: 98 },
      { id: 'deoxyhemoglobin', name: 'Deoxyhemoglobin', unit: '%', low: 0, high: 5 },
    ]
  },
  cardiac: {
    id: 'cardiac',
    name: 'Cardiac Markers',
    icon: '❤️',
    labs: [
      { id: 'troponin', name: 'Troponin I', unit: 'ng/mL', low: 0, high: 0.04, criticalHigh: 0.1 },
      { id: 'bnp', name: 'BNP', unit: 'pg/mL', low: 0, high: 100, criticalHigh: 500 },
      { id: 'ntProBnp', name: 'NT-proBNP', unit: 'pg/mL', low: 0, high: 125, criticalHigh: 900 },
    ]
  },
  coags: {
    id: 'coags',
    name: 'Coagulation Panel',
    icon: '🩹',
    labs: [
      { id: 'pt', name: 'PT', unit: 'sec', low: 11, high: 13.5 },
      { id: 'inr', name: 'INR', unit: '', low: 0.8, high: 1.1 },
      { id: 'ptt', name: 'PTT', unit: 'sec', low: 25, high: 35 },
      { id: 'fibrinogen', name: 'Fibrinogen', unit: 'mg/dL', low: 200, high: 400, criticalLow: 100 },
      { id: 'dDimer', name: 'D-Dimer', unit: 'mg/L FEU', low: 0, high: 0.5 },
    ]
  },
  lfts: {
    id: 'lfts',
    name: 'Liver Function Tests',
    icon: '🫀',
    labs: [
      { id: 'ast', name: 'AST', unit: 'U/L', low: 10, high: 40, criticalHigh: 1000 },
      { id: 'alt', name: 'ALT', unit: 'U/L', low: 7, high: 56, criticalHigh: 1000 },
      { id: 'alkPhos', name: 'Alk Phos', unit: 'U/L', low: 44, high: 147 },
      { id: 'totalBilirubin', name: 'Total Bilirubin', unit: 'mg/dL', low: 0.1, high: 1.2, criticalHigh: 15 },
      { id: 'directBilirubin', name: 'Direct Bilirubin', unit: 'mg/dL', low: 0, high: 0.3 },
      { id: 'albumin', name: 'Albumin', unit: 'g/dL', low: 3.5, high: 5.0 },
      { id: 'totalProtein', name: 'Total Protein', unit: 'g/dL', low: 6.0, high: 8.3 },
    ]
  },
  lipase: {
    id: 'lipase',
    name: 'Pancreatic',
    icon: '🧫',
    labs: [
      { id: 'lipase', name: 'Lipase', unit: 'U/L', low: 0, high: 160, criticalHigh: 500 },
      { id: 'amylase', name: 'Amylase', unit: 'U/L', low: 28, high: 100 },
    ]
  },
  thyroid: {
    id: 'thyroid',
    name: 'Thyroid Panel',
    icon: '🦋',
    labs: [
      { id: 'tsh', name: 'TSH', unit: 'mIU/L', low: 0.4, high: 4.0 },
      { id: 'freeT4', name: 'Free T4', unit: 'ng/dL', low: 0.8, high: 1.8 },
      { id: 'freeT3', name: 'Free T3', unit: 'pg/mL', low: 2.3, high: 4.2 },
    ]
  },
  urinalysis: {
    id: 'urinalysis',
    name: 'Urinalysis',
    icon: '🚽',
    labs: [
      { id: 'urinePh', name: 'pH', unit: '', low: 4.5, high: 8.0 },
      { id: 'specificGravity', name: 'Specific Gravity', unit: '', low: 1.005, high: 1.030 },
      { id: 'wbcUrine', name: 'WBC', unit: '/hpf', low: 0, high: 5 },
      { id: 'rbcUrine', name: 'RBC', unit: '/hpf', low: 0, high: 3 },
      { id: 'bacteria', name: 'Bacteria', unit: '', low: 0, high: 0 }, // categorical
      { id: 'leukEsterase', name: 'Leuk Esterase', unit: '', low: 0, high: 0 }, // categorical
      { id: 'nitrites', name: 'Nitrites', unit: '', low: 0, high: 0 }, // categorical
    ]
  },
  drugScreen: {
    id: 'drugScreen',
    name: 'Urine Drug Screen',
    icon: '💊',
    labs: [
      { id: 'amphetamines', name: 'Amphetamines', unit: '', isQualitative: true },
      { id: 'barbiturates', name: 'Barbiturates', unit: '', isQualitative: true },
      { id: 'benzodiazepines', name: 'Benzodiazepines', unit: '', isQualitative: true },
      { id: 'cocaine', name: 'Cocaine', unit: '', isQualitative: true },
      { id: 'opiates', name: 'Opiates', unit: '', isQualitative: true },
      { id: 'phencyclidine', name: 'PCP', unit: '', isQualitative: true },
      { id: 'thc', name: 'THC', unit: '', isQualitative: true },
      { id: 'methadone', name: 'Methadone', unit: '', isQualitative: true },
      { id: 'fentanyl', name: 'Fentanyl', unit: '', isQualitative: true },
    ]
  },
  serumDrugLevels: {
    id: 'serumDrugLevels',
    name: 'Serum Drug Levels',
    icon: '💉',
    labs: [
      { id: 'acetaminophen', name: 'Acetaminophen', unit: 'mcg/mL', low: 10, high: 30, criticalHigh: 150 },
      { id: 'salicylate', name: 'Salicylate', unit: 'mg/dL', low: 15, high: 30, criticalHigh: 50 },
      { id: 'ethanol', name: 'Ethanol', unit: 'mg/dL', low: 0, high: 0, criticalHigh: 300 },
      { id: 'digoxin', name: 'Digoxin', unit: 'ng/mL', low: 0.8, high: 2.0, criticalHigh: 2.5 },
      { id: 'lithium', name: 'Lithium', unit: 'mEq/L', low: 0.6, high: 1.2, criticalHigh: 1.5 },
      { id: 'phenytoin', name: 'Phenytoin', unit: 'mcg/mL', low: 10, high: 20, criticalHigh: 30 },
      { id: 'valproicAcid', name: 'Valproic Acid', unit: 'mcg/mL', low: 50, high: 100, criticalHigh: 150 },
      { id: 'carbamazepine', name: 'Carbamazepine', unit: 'mcg/mL', low: 4, high: 12, criticalHigh: 15 },
    ]
  },
  inflammatory: {
    id: 'inflammatory',
    name: 'Inflammatory Markers',
    icon: '🔥',
    labs: [
      { id: 'crp', name: 'CRP', unit: 'mg/dL', low: 0, high: 1.0 },
      { id: 'esr', name: 'ESR', unit: 'mm/hr', low: 0, high: 20 },
      { id: 'procalcitonin', name: 'Procalcitonin', unit: 'ng/mL', low: 0, high: 0.1, criticalHigh: 2.0 },
      { id: 'ferritin', name: 'Ferritin', unit: 'ng/mL', low: 12, high: 300 },
      { id: 'ldh', name: 'LDH', unit: 'U/L', low: 140, high: 280 },
    ]
  },
  csf: {
    id: 'csf',
    name: 'CSF Analysis',
    icon: '🧠',
    labs: [
      { id: 'csfWbc', name: 'WBC', unit: 'cells/uL', low: 0, high: 5 },
      { id: 'csfRbc', name: 'RBC', unit: 'cells/uL', low: 0, high: 0 },
      { id: 'csfProtein', name: 'Protein', unit: 'mg/dL', low: 15, high: 45 },
      { id: 'csfGlucose', name: 'Glucose', unit: 'mg/dL', low: 40, high: 70 },
      { id: 'csfNeutrophils', name: 'Neutrophils', unit: '%', low: 0, high: 6 },
      { id: 'csfLymphocytes', name: 'Lymphocytes', unit: '%', low: 40, high: 80 },
    ]
  },
};

// Panel categories for display grouping
export const PANEL_CATEGORIES = [
  {
    name: 'Chemistry',
    panels: ['bmp', 'cmp', 'lfts', 'lipase', 'thyroid']
  },
  {
    name: 'Hematology',
    panels: ['cbc', 'cbcDiff', 'coags']
  },
  {
    name: 'Blood Gas',
    panels: ['vbg', 'abg', 'coox']
  },
  {
    name: 'Cardiac',
    panels: ['cardiac', 'inflammatory']
  },
  {
    name: 'Toxicology',
    panels: ['drugScreen', 'serumDrugLevels']
  },
  {
    name: 'Other',
    panels: ['urinalysis', 'csf']
  }
];
