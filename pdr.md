# Sodium Disorders Consult — Implementation Plan

## Context

New "Sodium Disorders" consult covering both hyponatremia and hypernatremia — mirroring the existing Potassium Disorders consult pattern (dual-condition, single tree). Clinical content sourced from IBCC, JAMA 2022, NEJM 2023, AFP 2023, and European guidelines. Cross-listed in Nephro/Rheum/Endo + EM.

---

## Totals

| Metric | Count |
|--------|-------|
| Nodes | 28 |
| Modules | 6 |
| Info Pages | 8 |
| New Drugs | 5 (Desmopressin, Hypertonic Saline, Oral Urea, NaCl Tablets, Thiamine) |
| Existing Drug Updates | 1 (Furosemide — add sodium dosing) |
| Citations | 16 |
| Calculator | 1 (Free Water Deficit — formula-based, extends calculator architecture) |

---

## Module Labels

```
['Initial Assessment', 'HypoNa Etiology', 'Emergency HypoNa Rx', 'SIAD & Specific Causes', 'HyperNa Assessment', 'HyperNa Treatment']
```

---

## Tree Structure (28 Nodes)

### MODULE 1: Initial Assessment (5 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 1 | `na-start` | question | Sodium Level | HypoNa → `na-hypo-symptoms`, HyperNa → `na-hyper-assess` |
| 2 | `na-hypo-symptoms` | question | Symptom Severity | Severe/Moderate → `na-hypo-emergency`, Mild/Asymptomatic → `na-hypo-initial` |
| 3 | `na-hypo-initial` | info | Initial Laboratory Package | → `na-hypo-etiology`. Orders: serum osm, urine osm, urine Na. Thiamine 100mg IV empirically. Check K+. |
| 4 | `na-hypo-etiology` | question | Serum Osmolality Result | Osm >275 → `na-non-hypotonic`, Osm <275 → `na-hypo-urine-osm` |
| 5 | `na-non-hypotonic` | result | Non-Hypotonic Hyponatremia | Correct for glucose (+1.6 per 100 above 100). Pseudohyponatremia: confirm with POC. |

### MODULE 2: HypoNa Etiology (4 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 6 | `na-hypo-urine-osm` | question | Urine Osmolality | <100 → `na-hypo-water-excess`, >100 → `na-hypo-urine-na` |
| 7 | `na-hypo-water-excess` | result | Water > Solute Intake | Beer potomania, polydipsia, marathon. HIGH overcorrection risk. Proactive DDAVP clamp. |
| 8 | `na-hypo-urine-na` | question | Urine Sodium | <30 → `na-hypo-low-una`, >30 → `na-hypo-high-una` |
| 9 | `na-hypo-low-una` | question | Low UNa — Volume Assessment | Hypovolemic → `na-hypo-hypovolemic`, Hypervolemic → `na-hypo-hypervolemic` |

### MODULE 3: Emergency HypoNa Rx (4 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 10 | `na-hypo-emergency` | info | Emergency Hypertonic Saline | 3% NaCl 100-150mL bolus over 10-20min, repeat x2. Target 4-6 mEq/L rise. → `na-hypo-correction-limits` |
| 11 | `na-hypo-correction-limits` | info | Correction Rate Limits | Max 10 mEq/L in 24h (8 for high-risk). DDAVP rescue if overcorrecting. → `na-hypo-ddavp-decision` |
| 12 | `na-hypo-ddavp-decision` | question | DDAVP Clamp Strategy | Start clamp → `na-hypo-ddavp-protocol`, Monitor without → `na-hypo-initial` |
| 13 | `na-hypo-ddavp-protocol` | info | DDAVP Clamp-Bolus Protocol | DDAVP 2mcg IV q6-8h + 100mL 3% boluses. Check Na q2h. → `na-hypo-etiology` |

### MODULE 4: SIAD & Specific Causes (6 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 14 | `na-hypo-high-una` | question | High UNa — Differential | SIAD → `na-siad-treatment`, Diuretic-induced → `na-hypo-diuretic`, Adrenal insufficiency → `na-hypo-adrenal` |
| 15 | `na-siad-treatment` | info | SIAD Treatment | Fluid restriction → Oral Urea → Salt tabs + loop. No vaptans. → `na-hypo-monitoring` |
| 16 | `na-hypo-diuretic` | result | Diuretic-Induced Hyponatremia | Hold thiazide. High overcorrection risk. DDAVP clamp if Na <120. |
| 17 | `na-hypo-adrenal` | result | Adrenal Insufficiency | Check cortisol/ACTH. Stress-dose hydrocortisone 100mg IV if unstable. |
| 18 | `na-hypo-hypovolemic` | result | Hypovolemic Hyponatremia | NS resuscitation. HIGH overcorrection risk once volume restored. |
| 19 | `na-hypo-hypervolemic` | result | Hypervolemic Hyponatremia | HF/cirrhosis/nephrotic. Fluid restriction + furosemide. Treat underlying. |

### MODULE 5: HyperNa Assessment (5 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 20 | `na-hypo-monitoring` | result | HypoNa Monitoring & Disposition | Na q2h active, q4-6h stable. ICU if Na <120 or DDAVP clamp. |
| 21 | `na-hyper-assess` | question | Hypernatremia Assessment | Volume depleted → `na-hyper-fwd`, Polyuria → `na-hyper-di`, Volume overloaded → `na-hyper-overload` |
| 22 | `na-hyper-di` | question | Diabetes Insipidus Workup | Central DI → `na-hyper-central-di`, Nephrogenic DI → `na-hyper-nephrogenic-di` |
| 23 | `na-hyper-central-di` | info | Central DI Treatment | DDAVP 2mcg IV q8-12h + free water replacement. → `na-hyper-fwd` |
| 24 | `na-hyper-nephrogenic-di` | info | Nephrogenic DI Treatment | Remove offending agent. Thiazide + amiloride paradox. Large free water volumes. → `na-hyper-fwd` |

### MODULE 6: HyperNa Treatment (4 nodes)

| # | ID | Type | Title | Branching |
|---|-----|------|-------|-----------|
| 25 | `na-hyper-fwd` | info | Free Water Deficit & Replacement | FWD calculator link. Enteral water preferred, D5W if NPO. Max 12 mEq/L/day chronic. → `na-hyper-monitoring` |
| 26 | `na-hyper-overload` | info | HyperNa + Volume Overload | Natriuretic diuresis (thiazide + amiloride) + free water. → `na-hyper-monitoring` |
| 27 | `na-hyper-monitoring` | result | HyperNa Monitoring & Disposition | Na q4-6h. Overcorrection rare in hyperNa (unlike hypoNa). |
| 28 | `na-hyper-elderly` | info | Hypernatremia in the Elderly | Usually chronic, don't need ICU. Oral water if able. → `na-hyper-monitoring` |

---

## Info Pages (8)

All in `src/components/info-page.ts`, registered in `INFO_PAGES` map.

| ID | Title | Content Scope |
|----|-------|---------------|
| `na-summary` | Sodium Disorders Steps Summary | MANDATORY. Sectioned bullets with `#/node/` links for each major phase. First line of `na-start`. |
| `na-ddavp-clamp` | DDAVP Clamp-Bolus Protocol | Full protocol: initiation (DDAVP 2mcg IV q8h), D5W/3% bolus adjustments, Na q2h monitoring, discontinuation criteria. |
| `na-siad-causes` | SIAD Causes & Diagnosis | Diagnostic criteria, medication causes (SSRIs, carbamazepine, NSAIDs, opioids), malignancy, neuro, pulmonary. |
| `na-hyper-causes` | Hypernatremia Causes | 7-category breakdown: inadequate intake, Na/K admin, renal retention, GI loss, diuresis, nephrogenic DI, central DI. |
| `na-overcorrection` | Overcorrection Rescue Protocol | DDAVP 2mcg IV stat + D5W 3mL/kg/hr. Lowering Na back to safe trajectory. |
| `na-ods-risk` | ODS Risk Factors | High-risk populations, clinical presentation (delayed 2-6 days), prevention. |
| `na-lab-interpretation` | Hyponatremia Lab Interpretation | Serum Osm → Urine Osm → Urine Na stepwise algorithm. Grey zones explained. |
| `na-non-hypotonic-info` | Non-Hypotonic Hyponatremia | Translocational (hyperglycemia, mannitol) vs pseudohyponatremia (lipids, paraproteins). Correction formula. |

---

## New Drugs (5)

All in `src/data/drug-store.ts`. Add to `ALL_DRUGS` array (alphabetical) and `NAME_TO_ID` map.

### 1. Desmopressin (DDAVP)
- **ID**: `desmopressin`
- **Class**: Synthetic vasopressin analog (V2 agonist)
- **Route**: IV / Intranasal
- **Dosing entries (4)**:
  - `DDAVP clamp (hyponatremia)` — 2 mcg IV q6-8h
  - `Overcorrection rescue` — 2 mcg IV stat
  - `Central diabetes insipidus` — 2 mcg IV q8-12h OR 10 mcg intranasal BID
  - `DI diagnostic trial` — 2 mcg IV x1 (central: urine osm rises >50% in 2h)
- **Contraindications**: Type IIb vWD, habitual/psychogenic polydipsia
- **Monitoring**: Na q2h during clamp, urine output, fluid balance

### 2. Hypertonic Saline (3% NaCl)
- **ID**: `hypertonic-saline`
- **Class**: Hypertonic crystalloid
- **Route**: IV
- **Dosing entries (2)**:
  - `Severe symptomatic hyponatremia` — 100-150 mL IV bolus over 10-20 min, repeat x2
  - `DDAVP clamp bolus correction` — 100 mL IV bolus, raises Na ~2 mEq/L per bolus in 70kg adult
- **Cautions**: Na q2h during admin, central line preferred for continuous infusions (peripheral OK for boluses), max 10 mEq/L correction in 24h

### 3. Oral Urea (Ure-Na)
- **ID**: `oral-urea`
- **Class**: Osmotic agent
- **Route**: PO
- **Dosing entries (2)**:
  - `SIAD` — 15-60g PO daily (start 15-30g), mix with sweet/flavored liquid
  - `Beer potomania / low solute` — 15-30g PO daily
- **Cautions**: Extremely bitter taste, GI upset, not widely available

### 4. Sodium Chloride Tablets
- **ID**: `nacl-tablets`
- **Class**: Electrolyte supplement
- **Route**: PO
- **Dosing entries (1)**:
  - `SIAD (with loop diuretic)` — 1-3g PO TID + furosemide 20-40mg daily
- **Cautions**: May worsen edema in HF/cirrhosis, GI irritation, hypertension

### 5. Thiamine (Vitamin B1)
- **ID**: `thiamine`
- **Class**: Vitamin
- **Route**: IV/PO
- **Dosing entries (2)**:
  - `Hyponatremia (ODS prevention)` — 100 mg IV daily, give empirically to all patients undergoing Na correction
  - `Wernicke encephalopathy` — 500 mg IV TID x3 days, then 250 mg IV daily x3-5 days
- **Cautions**: Anaphylaxis rare with IV, give BEFORE glucose in alcoholic patients

### Existing Drug Update: Furosemide
Add 2 new dosing entries to existing `FUROSEMIDE` const:
- `SIAD (with salt tabs)` — 20-40 mg PO daily with NaCl tablets 3-9g/day
- `Hypernatremia (volume overload)` — 20-40 mg IV, produces hypotonic urine

---

## Calculator: Free Water Deficit

### Architecture Extension
Add optional `computeResult` function to `CalculatorDefinition` interface in `calculator.ts`:
```typescript
computeResult?: (values: Record<string, number>) => {
  value: string; label: string; description: string; colorVar: string;
};
```

In `updateScore()`: if `calc.computeResult` exists, call it instead of sum-and-threshold logic.

### FWD Definition
- **ID**: `fwd`
- **Title**: Free Water Deficit
- **Subtitle**: Hypernatremia Correction
- **Fields**: Serum Na (number, mEq/L), Weight (number, kg), Sex (select: Male TBW=0.6 / Female-Elderly TBW=0.5)
- **Formula**: `TBW × [(Na/140) - 1]` where TBW = weight × factor
- **Result display**: Liters of free water needed + correction guidance (mild <3L / moderate 3-6L / severe >6L)
- **Linked from**: Node `na-hyper-fwd` via `calculatorLinks: [{ id: 'fwd', label: 'Free Water Deficit' }]`

### Registration
- Add `FWD_CALCULATOR` definition
- Register in `CALCULATORS` map: `'fwd': FWD_CALCULATOR`
- Add to `CALCULATOR_LIST` array for Med-Calc category display

---

## Category Registration

In `src/data/categories.ts`:

**Nephro/Rheum/Endo** (alongside Potassium):
```typescript
{
  id: 'sodium',
  title: 'Sodium Disorders',
  subtitle: 'HypoNa vs HyperNa → Etiology → Treatment → Monitoring',
  categoryId: 'nephro-rheum-endo',
  version: '1.0',
  nodeCount: 28,
  entryNodeId: 'na-start',
}
```

**Emergency Medicine** (cross-listed):
Same entry with `categoryId: 'emergency-medicine'`.

---

## Tree Registration

In `src/components/tree-wizard.ts`:
- Import `SODIUM_NODES, SODIUM_CITATIONS, SODIUM_MODULE_LABELS` from `'../data/trees/sodium.js'`
- Add to `TREE_CONFIGS`:
```typescript
'sodium': {
  nodes: SODIUM_NODES,
  entryNodeId: 'na-start',
  categoryId: 'nephro-rheum-endo',
  moduleLabels: SODIUM_MODULE_LABELS,
  citations: SODIUM_CITATIONS,
},
```

---

## Citations (16)

| # | Source |
|---|--------|
| 1 | Adrogué HJ et al. Diagnosis and Management of Hyponatremia. JAMA. 2022;328(3):280-291. |
| 2 | Miller NE et al. Sodium Disorders: Hyponatremia and Hypernatremia. AFP. 2023;108(5):476-486. |
| 3 | Hoorn EJ, Zietse R. Diagnosis and Treatment of Hyponatremia: Guidelines. JASN. 2017;28(5):1340-1349. |
| 4 | Seay NW et al. Body Tonicity Disorders Core Curriculum. AJKD. 2020;75(2):272-286. |
| 5 | Spasovski G et al. Clinical Practice Guideline on Hyponatraemia. Eur J Endocrinol. 2014;170(3):G1-G47. |
| 6 | Adrogué HJ, Madias NE. Syndrome of Inappropriate Antidiuresis. NEJM. 2023;389(16):1499-1509. |
| 7 | Sterns RH. Disorders of Plasma Sodium. NEJM. 2015;372(1):55-65. |
| 8 | Verbalis JG et al. Hyponatremia: Expert Panel Recommendations. Am J Med. 2013;126(10S1):S1-42. |
| 9 | Decaux G et al. Treatment of Euvolemic Hyponatremia by Urea. Crit Care. 2010;14(5):R184. |
| 10 | Adrogué HJ, Madias NE. Hypernatremia. NEJM. 2000;342(20):1493-1499. |
| 11 | Feigin E et al. Correction Rate and Mortality in Severe Hypernatremia. JAMA Netw Open. 2023;6(9):e2335415. |
| 12 | Bichet DG. Diagnosis and Management of Nephrogenic DI. Semin Nephrol. 2023;43(2):151402. |
| 13 | Lindner G et al. Hypernatremia in Critically Ill. J Crit Care. 2013;28(2):216.e11-20. |
| 14 | Baek SH et al. SALSA Trial: Bolus vs Continuous 3% Saline. JAMA Intern Med. 2021;181(1):81-92. |
| 15 | Ayus JC et al. Correction Rates in Severe Hyponatremia Meta-Analysis. JAMA Intern Med. 2025;185(1):38-51. |
| 16 | Polderman KH et al. Hypernatremia in the ICU: Quality of Care. Crit Care Med. 1999;27(6):1105-8. |

---

## Files to Modify

| File | Action | What |
|------|--------|------|
| `src/data/trees/sodium.ts` | CREATE | 28 nodes, module labels, citations |
| `src/data/drug-store.ts` | MODIFY | 5 new drugs + update Furosemide + ALL_DRUGS + NAME_TO_ID |
| `src/components/info-page.ts` | MODIFY | 8 info pages + register in INFO_PAGES |
| `src/components/calculator.ts` | MODIFY | `computeResult` interface extension + FWD calculator + register + update `updateScore()` |
| `src/components/tree-wizard.ts` | MODIFY | Import sodium tree + add to TREE_CONFIGS |
| `src/data/categories.ts` | MODIFY | Add to nephro-rheum-endo + emergency-medicine |
| `docs/sw.js` | MODIFY | Bump cache version + add sodium.js to cache |

---

## Implementation Sequence

1. Create `src/data/trees/sodium.ts` — all 28 nodes + exports
2. Add 5 new drugs to `drug-store.ts` + update Furosemide + ALL_DRUGS + NAME_TO_ID
3. Add 8 info pages to `info-page.ts` + register in INFO_PAGES
4. Extend calculator architecture + add FWD calculator to `calculator.ts`
5. Register tree in `tree-wizard.ts` (import + TREE_CONFIGS)
6. Register in categories in `categories.ts` (two entries)
7. Compile with `bunx tsc` — verify no errors
8. Bump SW cache + add sodium.js in `docs/sw.js`
9. Test: walk through both HypoNa and HyperNa paths, verify drug links, info pages, calculator, cross-tree link to potassium
10. Deploy with `/deploy`

---

## Key Design Decisions

- **Single consult** covering both HypoNa and HyperNa (mirrors Potassium pattern)
- **Info pages** carry dense reference material (DDAVP clamp protocol, SIAD causes, ODS risk) while tree nodes stay focused on clinical decision points
- **Steps Summary** as first link in start node (mandatory — severe hyponatremia is emergent)
- **No vaptans** in drug store (clinical content explicitly argues against them — uncontrolled overcorrection risk)
- **Cross-tree link** to Potassium for concurrent hypokalemia
- **Formula-based calculator** extends existing architecture with `computeResult` function — reusable for future formula calcs (corrected calcium, CrCl, etc.)
- **3% NaCl as drug entry** — follows calcium gluconate pattern from Potassium consult (IV fluid with critical dosing/monitoring)
- **Thiamine as new drug** — ODS prevention is standard-of-care and referenced across multiple consults

---

## Clinical Content Sources

The tree content is synthesized from:
- **IBCC (Internet Book of Critical Care)** — primary clinical reference for DDAVP clamp protocol, oral urea therapy, vaptan critique, soy sauce emergency treatment
- **JAMA 2022** (Adrogué et al) — hyponatremia diagnostic/treatment algorithm
- **NEJM 2023** (Adrogué & Madias) — SIAD review
- **NEJM 2000** (Adrogué & Madias) — hypernatremia management
- **AFP 2023** (Miller et al) — ED-focused sodium disorders overview
- **European Guidelines 2014** (Spasovski et al) — correction rate limits
- **SALSA Trial 2021** — bolus vs continuous hypertonic saline
- **JAMA Network Open 2023** — hypernatremia correction rate and mortality

---

## Verification Checklist

- [ ] Nephro/Rheum/Endo → Sodium Disorders appears alongside Potassium
- [ ] EM → Sodium Disorders appears cross-listed
- [ ] HypoNa severe path: start → symptoms (severe) → 3% saline → correction limits → DDAVP clamp
- [ ] HypoNa mild path: start → symptoms (mild) → labs → urine osm → urine Na → SIAD → treatment
- [ ] HyperNa depleted path: start → assessment → volume depleted → FWD calculator → monitoring
- [ ] HyperNa DI path: start → assessment → polyuria → DI workup → central DI → DDAVP
- [ ] All drug links open correct dosing cards with indication scroll
- [ ] Info page links open/close correctly with node jump navigation
- [ ] FWD calculator: Na 160, 70kg male → ~6L deficit displayed
- [ ] Steps Summary links jump to correct nodes
- [ ] Cross-tree link to Potassium consult works
- [ ] `bunx tsc` compiles without errors
- [ ] SW cache version bumped
