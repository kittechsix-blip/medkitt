// MedKitt — Lab Parser Service
// Parses free-text lab input and identifies abnormalities with clinical context

/**
 * Reference ranges for common labs
 * Structure: { low, high, unit, criticalLow?, criticalHigh? }
 */
export const LAB_REFERENCE_RANGES = {
  // Basic Metabolic Panel (BMP)
  sodium: { low: 136, high: 145, unit: 'mEq/L', criticalLow: 120, criticalHigh: 160 },
  potassium: { low: 3.5, high: 5.0, unit: 'mEq/L', criticalLow: 2.5, criticalHigh: 6.5 },
  chloride: { low: 98, high: 106, unit: 'mEq/L' },
  bicarbonate: { low: 22, high: 29, unit: 'mEq/L', criticalLow: 10 },
  co2: { low: 22, high: 29, unit: 'mEq/L', criticalLow: 10 }, // alias for bicarb
  bun: { low: 7, high: 20, unit: 'mg/dL' },
  creatinine: { low: 0.7, high: 1.3, unit: 'mg/dL', criticalHigh: 10 },
  glucose: { low: 70, high: 100, unit: 'mg/dL', criticalLow: 40, criticalHigh: 500 },
  calcium: { low: 8.5, high: 10.5, unit: 'mg/dL', criticalLow: 6.0, criticalHigh: 14.0 },
  magnesium: { low: 1.7, high: 2.2, unit: 'mg/dL', criticalLow: 1.0 },
  phosphorus: { low: 2.5, high: 4.5, unit: 'mg/dL' },

  // Complete Blood Count (CBC)
  wbc: { low: 4.5, high: 11.0, unit: 'K/uL', criticalLow: 2.0, criticalHigh: 30.0 },
  hemoglobin: { low: 12.0, high: 17.5, unit: 'g/dL', criticalLow: 7.0 },
  hgb: { low: 12.0, high: 17.5, unit: 'g/dL', criticalLow: 7.0 }, // alias
  hematocrit: { low: 36, high: 50, unit: '%', criticalLow: 20 },
  hct: { low: 36, high: 50, unit: '%', criticalLow: 20 }, // alias
  platelets: { low: 150, high: 400, unit: 'K/uL', criticalLow: 50, criticalHigh: 1000 },
  plt: { low: 150, high: 400, unit: 'K/uL', criticalLow: 50, criticalHigh: 1000 }, // alias

  // Liver Function Tests (LFTs)
  ast: { low: 10, high: 40, unit: 'U/L', criticalHigh: 1000 },
  alt: { low: 7, high: 56, unit: 'U/L', criticalHigh: 1000 },
  alkalinephosphatase: { low: 44, high: 147, unit: 'U/L' },
  alkphos: { low: 44, high: 147, unit: 'U/L' }, // alias
  bilirubin: { low: 0.1, high: 1.2, unit: 'mg/dL', criticalHigh: 15 },
  totalbilirubin: { low: 0.1, high: 1.2, unit: 'mg/dL', criticalHigh: 15 },
  directbilirubin: { low: 0, high: 0.3, unit: 'mg/dL' },
  albumin: { low: 3.5, high: 5.0, unit: 'g/dL' },
  totalprotein: { low: 6.0, high: 8.3, unit: 'g/dL' },

  // Cardiac Markers
  troponin: { low: 0, high: 0.04, unit: 'ng/mL', criticalHigh: 0.1 },
  troponini: { low: 0, high: 0.04, unit: 'ng/mL', criticalHigh: 0.1 },
  bnp: { low: 0, high: 100, unit: 'pg/mL', criticalHigh: 500 },
  ntprobnp: { low: 0, high: 125, unit: 'pg/mL', criticalHigh: 900 },

  // Coagulation
  pt: { low: 11, high: 13.5, unit: 'sec' },
  inr: { low: 0.8, high: 1.1, unit: '' },
  ptt: { low: 25, high: 35, unit: 'sec' },
  aptt: { low: 25, high: 35, unit: 'sec' }, // alias
  fibrinogen: { low: 200, high: 400, unit: 'mg/dL', criticalLow: 100 },
  ddimer: { low: 0, high: 0.5, unit: 'mg/L' },

  // Inflammatory Markers
  crp: { low: 0, high: 1.0, unit: 'mg/dL' },
  esr: { low: 0, high: 20, unit: 'mm/hr' },
  procalcitonin: { low: 0, high: 0.1, unit: 'ng/mL', criticalHigh: 2.0 },

  // ABG/VBG
  ph: { low: 7.35, high: 7.45, unit: '', criticalLow: 7.1, criticalHigh: 7.6 },
  pco2: { low: 35, high: 45, unit: 'mmHg' },
  po2: { low: 80, high: 100, unit: 'mmHg', criticalLow: 60 },
  lactate: { low: 0.5, high: 2.0, unit: 'mmol/L', criticalHigh: 4.0 },

  // Other
  ammonia: { low: 15, high: 45, unit: 'umol/L', criticalHigh: 100 },
  lipase: { low: 0, high: 160, unit: 'U/L', criticalHigh: 500 },
  amylase: { low: 28, high: 100, unit: 'U/L' },
  tsh: { low: 0.4, high: 4.0, unit: 'mIU/L' },
  freet4: { low: 0.8, high: 1.8, unit: 'ng/dL' },
  hba1c: { low: 4, high: 5.6, unit: '%' },
  a1c: { low: 4, high: 5.6, unit: '%' }, // alias
};

/**
 * Aliases for common lab name variations
 */
const LAB_ALIASES = {
  'na': 'sodium',
  'k': 'potassium',
  'cl': 'chloride',
  'hco3': 'bicarbonate',
  'bicarb': 'bicarbonate',
  'cr': 'creatinine',
  'cre': 'creatinine',
  'glu': 'glucose',
  'ca': 'calcium',
  'mg': 'magnesium',
  'phos': 'phosphorus',
  'white blood cell': 'wbc',
  'white count': 'wbc',
  'hemoglobin': 'hgb',
  'hematocrit': 'hct',
  'platelet': 'platelets',
  'plts': 'platelets',
  'sgot': 'ast',
  'sgpt': 'alt',
  'alk phos': 'alkphos',
  'alkaline phosphatase': 'alkphos',
  'bili': 'bilirubin',
  'total bili': 'totalbilirubin',
  'direct bili': 'directbilirubin',
  'trop': 'troponin',
  'trop i': 'troponini',
  'hs-troponin': 'troponin',
  'pro-bnp': 'ntprobnp',
  'nt-probnp': 'ntprobnp',
  'd-dimer': 'ddimer',
  'c-reactive protein': 'crp',
  'sed rate': 'esr',
  'procal': 'procalcitonin',
  'paco2': 'pco2',
  'pao2': 'po2',
  'lactic acid': 'lactate',
  'free t4': 'freet4',
  't4': 'freet4',
  'hemoglobin a1c': 'hba1c',
};

/**
 * Clinical context mappings - what consults/calculators are relevant for abnormalities
 */
const CLINICAL_MAPPINGS = {
  // Hyponatremia
  hyponatremia: {
    condition: 'Hyponatremia',
    triggers: [{ lab: 'sodium', direction: 'low' }],
    severity: (value) => value < 120 ? 'critical' : value < 130 ? 'moderate' : 'mild',
    consults: ['hyponatremia'],
    calculators: [],
    guidance: 'Assess volume status, check serum osmolality, urine Na and osmolality.'
  },
  // Hyperkalemia
  hyperkalemia: {
    condition: 'Hyperkalemia',
    triggers: [{ lab: 'potassium', direction: 'high' }],
    severity: (value) => value > 6.5 ? 'critical' : value > 5.5 ? 'moderate' : 'mild',
    consults: ['hyperkalemia'],
    calculators: [],
    guidance: 'Check EKG immediately. Consider calcium gluconate, insulin/D50, albuterol, kayexalate.'
  },
  // AKI
  aki: {
    condition: 'Acute Kidney Injury',
    triggers: [{ lab: 'creatinine', direction: 'high' }],
    severity: (value) => value > 4 ? 'critical' : value > 2 ? 'moderate' : 'mild',
    consults: ['aki'],
    calculators: [],
    guidance: 'Check urine output, BUN/Cr ratio, urinalysis. Consider prerenal vs intrinsic vs postrenal.'
  },
  // Elevated troponin
  elevatedtroponin: {
    condition: 'Elevated Troponin',
    triggers: [{ lab: 'troponin', direction: 'high' }, { lab: 'troponini', direction: 'high' }],
    severity: (value) => value > 0.5 ? 'critical' : value > 0.1 ? 'moderate' : 'mild',
    consults: ['nstemi', 'chest-pain'],
    calculators: ['heart-score'],
    guidance: 'Serial troponins, 12-lead EKG, consider ACS pathway. Rule out Type 2 MI.'
  },
  // Elevated lactate
  hyperlactatemia: {
    condition: 'Elevated Lactate',
    triggers: [{ lab: 'lactate', direction: 'high' }],
    severity: (value) => value > 4 ? 'critical' : value > 2 ? 'moderate' : 'mild',
    consults: ['sepsis'],
    calculators: ['qsofa'],
    guidance: 'Consider sepsis, shock, ischemia. Repeat lactate after resuscitation.'
  },
  // Anemia
  anemia: {
    condition: 'Anemia',
    triggers: [{ lab: 'hemoglobin', direction: 'low' }, { lab: 'hgb', direction: 'low' }],
    severity: (value) => value < 7 ? 'critical' : value < 10 ? 'moderate' : 'mild',
    consults: ['anemia', 'gi-bleed'],
    calculators: [],
    guidance: 'Check reticulocyte count, iron studies, assess for bleeding.'
  },
  // Thrombocytopenia
  thrombocytopenia: {
    condition: 'Thrombocytopenia',
    triggers: [{ lab: 'platelets', direction: 'low' }, { lab: 'plt', direction: 'low' }],
    severity: (value) => value < 20 ? 'critical' : value < 50 ? 'moderate' : 'mild',
    consults: ['thrombocytopenia'],
    calculators: [],
    guidance: 'Review medications, check peripheral smear, consider HIT, TTP, ITP, DIC.'
  },
  // Acidosis
  acidosis: {
    condition: 'Acidosis',
    triggers: [{ lab: 'ph', direction: 'low' }, { lab: 'bicarbonate', direction: 'low' }],
    severity: (value, lab) => {
      if (lab === 'ph') return value < 7.2 ? 'critical' : 'moderate';
      return value < 15 ? 'critical' : 'moderate';
    },
    consults: ['dka', 'metabolic-acidosis'],
    calculators: ['anion-gap'],
    guidance: 'Calculate anion gap. Consider DKA, lactic acidosis, toxic ingestion, renal failure.'
  },
  // Elevated BNP
  elevatedbnp: {
    condition: 'Elevated BNP/NT-proBNP',
    triggers: [{ lab: 'bnp', direction: 'high' }, { lab: 'ntprobnp', direction: 'high' }],
    severity: (value, lab) => {
      if (lab === 'bnp') return value > 500 ? 'critical' : 'moderate';
      return value > 900 ? 'critical' : 'moderate';
    },
    consults: ['chf', 'dyspnea'],
    calculators: [],
    guidance: 'Assess for heart failure. Consider echo, chest x-ray, volume status.'
  },
  // Leukocytosis
  leukocytosis: {
    condition: 'Leukocytosis',
    triggers: [{ lab: 'wbc', direction: 'high' }],
    severity: (value) => value > 30 ? 'critical' : value > 15 ? 'moderate' : 'mild',
    consults: ['sepsis'],
    calculators: ['qsofa', 'sirs'],
    guidance: 'Consider infection, stress response, malignancy. Check differential.'
  },
  // Coagulopathy
  coagulopathy: {
    condition: 'Coagulopathy',
    triggers: [{ lab: 'inr', direction: 'high' }, { lab: 'pt', direction: 'high' }],
    severity: (value, lab) => {
      if (lab === 'inr') return value > 4 ? 'critical' : value > 2 ? 'moderate' : 'mild';
      return value > 20 ? 'moderate' : 'mild';
    },
    consults: ['anticoagulation-reversal', 'bleeding'],
    calculators: [],
    guidance: 'Check medication history (warfarin, DOACs). Consider vitamin K, FFP, PCC.'
  },
  // Hyperglycemia
  hyperglycemia: {
    condition: 'Hyperglycemia',
    triggers: [{ lab: 'glucose', direction: 'high' }],
    severity: (value) => value > 500 ? 'critical' : value > 300 ? 'moderate' : 'mild',
    consults: ['dka', 'hhs'],
    calculators: ['anion-gap'],
    guidance: 'Check ketones, anion gap, osmolality. Consider DKA vs HHS.'
  },
  // Hypoglycemia
  hypoglycemia: {
    condition: 'Hypoglycemia',
    triggers: [{ lab: 'glucose', direction: 'low' }],
    severity: (value) => value < 40 ? 'critical' : value < 60 ? 'moderate' : 'mild',
    consults: ['hypoglycemia'],
    calculators: [],
    guidance: 'Immediate D50 if symptomatic. Check insulin, sulfonylurea use, sepsis, adrenal insufficiency.'
  },
};

/**
 * Parse lab name from various formats
 * @param {string} rawName - The raw lab name from input
 * @returns {string|null} - Normalized lab key or null
 */
function normalizeLabName(rawName) {
  const cleaned = rawName.toLowerCase()
    .replace(/[^a-z0-9]/g, '')
    .trim();

  // Direct match
  if (LAB_REFERENCE_RANGES[cleaned]) {
    return cleaned;
  }

  // Check aliases
  for (const [alias, canonical] of Object.entries(LAB_ALIASES)) {
    const normalizedAlias = alias.replace(/[^a-z0-9]/g, '');
    if (cleaned === normalizedAlias) {
      return canonical;
    }
  }

  // Partial match (e.g., "sodium" matches "sodium")
  for (const key of Object.keys(LAB_REFERENCE_RANGES)) {
    if (cleaned.includes(key) || key.includes(cleaned)) {
      return key;
    }
  }

  return null;
}

/**
 * Parse a single lab value from text
 * @param {string} text - e.g., "sodium 128" or "Na: 128 mEq/L"
 * @returns {object|null} - { name, value, unit } or null
 */
function parseLabValue(text) {
  // Patterns to match lab values
  // "sodium 128", "Na: 128", "sodium: 128 mEq/L", "K 5.2"
  const patterns = [
    /^([a-zA-Z\s\-]+)[\s:=]+(\d+\.?\d*)\s*(.*)$/,  // "sodium 128 mEq/L"
    /^([a-zA-Z\s\-]+)[\s:=]+<?\s*(\d+\.?\d*)\s*(.*)$/, // "troponin <0.01"
  ];

  for (const pattern of patterns) {
    const match = text.trim().match(pattern);
    if (match) {
      const rawName = match[1].trim();
      const value = parseFloat(match[2]);
      const unit = match[3]?.trim() || '';

      const normalizedName = normalizeLabName(rawName);
      if (normalizedName && !isNaN(value)) {
        return { name: normalizedName, displayName: rawName, value, unit };
      }
    }
  }

  return null;
}

/**
 * Parse multiple lab values from free text
 * @param {string} input - Free text with lab values
 * @returns {Array} - Array of parsed labs
 */
export function parseLabInput(input) {
  const results = [];

  // Split by common delimiters: comma, newline, semicolon
  const parts = input.split(/[,;\n]+/);

  for (const part of parts) {
    const parsed = parseLabValue(part);
    if (parsed) {
      results.push(parsed);
    }
  }

  return results;
}

/**
 * Interpret a single lab value
 * @param {string} name - Normalized lab name
 * @param {number} value - Lab value
 * @returns {object} - { status, severity, message }
 */
export function interpretLabValue(name, value) {
  const range = LAB_REFERENCE_RANGES[name];
  if (!range) {
    return { status: 'unknown', severity: 'none', message: 'No reference range available' };
  }

  // Check critical values first
  if (range.criticalLow && value < range.criticalLow) {
    return {
      status: 'critical-low',
      severity: 'critical',
      message: `CRITICAL LOW (< ${range.criticalLow} ${range.unit})`,
      referenceRange: `${range.low}-${range.high} ${range.unit}`
    };
  }
  if (range.criticalHigh && value > range.criticalHigh) {
    return {
      status: 'critical-high',
      severity: 'critical',
      message: `CRITICAL HIGH (> ${range.criticalHigh} ${range.unit})`,
      referenceRange: `${range.low}-${range.high} ${range.unit}`
    };
  }

  // Check if abnormal
  if (value < range.low) {
    return {
      status: 'low',
      severity: 'abnormal',
      message: `Low (normal: ${range.low}-${range.high} ${range.unit})`,
      referenceRange: `${range.low}-${range.high} ${range.unit}`
    };
  }
  if (value > range.high) {
    return {
      status: 'high',
      severity: 'abnormal',
      message: `High (normal: ${range.low}-${range.high} ${range.unit})`,
      referenceRange: `${range.low}-${range.high} ${range.unit}`
    };
  }

  return {
    status: 'normal',
    severity: 'normal',
    message: `Normal (${range.low}-${range.high} ${range.unit})`,
    referenceRange: `${range.low}-${range.high} ${range.unit}`
  };
}

/**
 * Find clinical conditions triggered by lab abnormalities
 * @param {Array} parsedLabs - Array of { name, value } objects
 * @returns {Array} - Array of clinical conditions with guidance
 */
export function findClinicalConditions(parsedLabs) {
  const conditions = [];

  for (const [conditionKey, mapping] of Object.entries(CLINICAL_MAPPINGS)) {
    for (const trigger of mapping.triggers) {
      const lab = parsedLabs.find(l => l.name === trigger.lab);
      if (!lab) continue;

      const interpretation = interpretLabValue(lab.name, lab.value);
      const isTriggered = (trigger.direction === 'low' && (interpretation.status === 'low' || interpretation.status === 'critical-low'))
        || (trigger.direction === 'high' && (interpretation.status === 'high' || interpretation.status === 'critical-high'));

      if (isTriggered) {
        const severity = mapping.severity(lab.value, lab.name);
        conditions.push({
          condition: mapping.condition,
          severity,
          triggeringLab: { name: lab.name, value: lab.value },
          consults: mapping.consults,
          calculators: mapping.calculators,
          guidance: mapping.guidance,
        });
        break; // Don't duplicate condition if multiple triggers match
      }
    }
  }

  return conditions;
}

/**
 * Full lab interpretation pipeline
 * @param {string} input - Free text lab input
 * @returns {object} - { parsedLabs, interpretations, conditions }
 */
export function interpretLabs(input) {
  const parsedLabs = parseLabInput(input);

  const interpretations = parsedLabs.map(lab => ({
    ...lab,
    interpretation: interpretLabValue(lab.name, lab.value)
  }));

  const conditions = findClinicalConditions(parsedLabs);

  return {
    parsedLabs,
    interpretations,
    conditions,
  };
}
