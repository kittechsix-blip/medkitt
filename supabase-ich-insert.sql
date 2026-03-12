-- =====================================================================
-- MedKitt — Intracerebral Hemorrhage Consult: Supabase INSERT Statements
-- Generated: 2026-03-09
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'ich',
  'Intracerebral Hemorrhage',
  'Assessment → Reversal → BP Control → Surgery → ICU',
  '1.0',
  17,
  'ich-start',
  '["Initial Assessment","Coagulation Optimization","Blood Pressure Control","Surgical Considerations","ICU Management","Disposition & Prognosis"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('neurology', 'ich', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (16 citations)
DELETE FROM tree_citations WHERE tree_id = 'ich';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('ich', 1, 'Greenberg SM, Ziai WC, Cordonnier C, et al. 2022 Guideline for the Management of Patients With Spontaneous Intracerebral Hemorrhage. Stroke. 2022;53(7):e282-e361.'),
('ich', 2, 'Steiner T, Purrucker JC, Aguiar de Sousa D, et al. European Stroke Organisation (ESO) and European Association of Neurosurgical Societies (EANS) guideline on stroke due to spontaneous intracerebral haemorrhage. Eur Stroke J. 2025;10(4):1007-1086.'),
('ich', 3, 'Nobleza COS. Intracerebral Hemorrhage. Continuum (Minneap Minn). 2021;27(5):1246-1277.'),
('ich', 4, 'Tomaselli GF, Mahaffey KW, Cuker A, et al. 2020 ACC Expert Consensus Decision Pathway on Management of Bleeding in Patients on Oral Anticoagulants. J Am Coll Cardiol. 2020;76(5):594-622.'),
('ich', 5, 'Frontera JA, Lewin JJ, Rabinstein AA, et al. Guideline for Reversal of Antithrombotics in Intracranial Hemorrhage. Crit Care Med. 2016;44(12):2251-2257.'),
('ich', 6, 'Baharoglu MI, Cordonnier C, Al-Shahi Salman R, et al. Platelet transfusion versus standard care after acute stroke due to spontaneous cerebral haemorrhage (PATCH). Lancet. 2016;387(10038):2605-2613.'),
('ich', 7, 'Anderson CS, Heeley E, Huang Y, et al. Rapid blood-pressure lowering in patients with acute intracerebral hemorrhage (INTERACT2). N Engl J Med. 2013;368(25):2355-2365.'),
('ich', 8, 'Qureshi AI, Palesch YY, Barsan WG, et al. Intensive Blood-Pressure Lowering in Patients with Acute Cerebral Hemorrhage (ATACH-2). N Engl J Med. 2016;375(11):1033-1043.'),
('ich', 9, 'Mendelow AD, Gregson BA, Fernandes HM, et al. Early surgery versus initial conservative treatment in patients with spontaneous supratentorial intracerebral haematomas (STITCH). Lancet. 2005;365(9457):387-397.'),
('ich', 10, 'Mendelow AD, Gregson BA, Rowan EN, et al. Early surgery versus initial conservative treatment in patients with spontaneous supratentorial lobar intracerebral haematomas (STITCH II). Lancet. 2013;382(9890):397-408.'),
('ich', 11, 'Schrag M, Kirshner H. Management of Intracerebral Hemorrhage: JACC Focus Seminar. J Am Coll Cardiol. 2020;75(15):1819-1831.'),
('ich', 12, 'Nieuwkamp DJ, de Gans K, Rinkel GJ, Algra A. Treatment and outcome of severe intraventricular extension in patients with subarachnoid or intracerebral hemorrhage: a systematic review. J Neurol. 2000;247(2):117-121.'),
('ich', 13, 'Hanley DF, Lane K, McBee N, et al. Thrombolytic removal of intraventricular haemorrhage in treatment of severe stroke (CLEAR III). Lancet. 2017;389(10069):603-611.'),
('ich', 14, 'Magid-Bernstein J, Girard R, Polster S, et al. Cerebral Hemorrhage: Pathophysiology, Treatment, and Future Directions. Circ Res. 2022;130(8):1204-1229.'),
('ich', 15, 'Hemphill JC 3rd, Greenberg SM, Anderson CS, et al. Guidelines for the Management of Spontaneous Intracerebral Hemorrhage: A Guideline for Healthcare Professionals (AHA/ASA). Stroke. 2015;46(7):2032-2060.'),
('ich', 16, 'O''Carroll CB, Brown BL, Freeman WD. Intracerebral Hemorrhage: A Common yet Disproportionately Deadly Stroke Subtype. Mayo Clin Proc. 2021;96(6):1639-1654.');

DELETE FROM decision_nodes WHERE tree_id = 'ich';

-- 4. decision_nodes (17 nodes)

-- MODULE 1: INITIAL ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-start', 'ich', 'info', 1,
 'Intracerebral Hemorrhage (ICH)',
 '[ICH Steps Summary](#/info/ich-summary) — time-critical hemorrhage management.

Spontaneous ICH accounts for 10–15% of all strokes with ~40% 30-day mortality. Early hemostatic therapy, BP control, and neurosurgical consultation are the cornerstones of acute management.

**Immediate actions:**
• Non-contrast CT head — confirm diagnosis, estimate hematoma volume
• Establish IV access ×2
• Activate stroke/neurosurgery team
• NPO (potential surgical candidate)

**Do NOT delay anticoagulant reversal while awaiting labs** — empiric reversal should be given immediately if clinical suspicion of anticoagulant use is high.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-labs', 'ich', 'info', 1,
 'Evaluation & Imaging',
 '**Initial labs:**
• CBC, BMP, Mg, Phos
• INR, PTT, fibrinogen
• Anti-Xa level if on oral Xa inhibitors (apixaban, rivaroxaban)
• Toxicology screen (if clinically warranted)
• Type & screen
• ABG/VBG if intubated

**Hematoma volume (ABC/2):**
A × B × C ÷ 2 (cm) = volume in mL
• A = largest diameter on axial CT
• B = perpendicular diameter on same slice
• C = number of slices with hemorrhage × slice thickness
• <30 mL = relatively favorable prognosis
• >30 mL = moderate-to-severe

[CT Markers of Expansion](#/info/ich-ct-markers) — swirl sign, black hole sign, spot sign

**CT Angiography:** Obtain for nearly all patients unless classic hypertensive location in an older patient. **Mandatory** if:
• Lobar ICH in patient <70 years
• Deep/posterior fossa ICH in patient <45 years
• Deep ICH in patient 45–70 without hypertension history

**Serial CT:** Repeat at ~6h and 24h for stable patients. More frequent if neuro decline or sedated.',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-anticoag', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;


-- MODULE 2: COAGULATION OPTIMIZATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-anticoag', 'ich', 'question', 2,
 'Anticoagulation Status',
 '**Determine anticoagulant/antiplatelet status immediately.**

Do NOT wait for lab results before initiating reversal — empiric reversal should begin as soon as the agent is identified.

[Causes of ICH](#/info/ich-causes) — hypertensive, CAA, vascular malformation, coagulopathy',
 '[1,2]'::jsonb, '[{"label":"Warfarin","description":"INR likely elevated — urgent PCC + Vitamin K","next":"ich-warfarin-rev","urgency":"critical"},{"label":"Dabigatran (Pradaxa)","description":"Direct thrombin inhibitor — idarucizumab reversal","next":"ich-dabi-rev","urgency":"critical"},{"label":"Xa Inhibitor (apixaban, rivaroxaban, edoxaban)","description":"Factor Xa inhibitor — andexanet alfa or PCC","next":"ich-xa-rev","urgency":"critical"},{"label":"Heparin / LMWH","description":"Protamine sulfate reversal","next":"ich-heparin-rev","urgency":"urgent"},{"label":"Not on anticoagulation","description":"Antiplatelet only or no antithrombotics","next":"ich-coag-adj"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-warfarin-rev', 'ich', 'info', 2,
 'Warfarin Reversal',
 '**Goal: INR <1.4 as rapidly as possible.**

**First-line: [4-Factor PCC](#/drug/pcc-4factor/warfarin ich)**
• 25–50 IU/kg IV based on INR and weight
• Onset: 10–15 minutes
• Superior to FFP — faster correction, less volume

**PLUS [Vitamin K](#/drug/vitamin-k/warfarin ich)**
• 10 mg IV slow push (over 15–30 min)
• Prevents INR rebound after PCC wears off (6–8h)
• IV route preferred — oral takes 12–24h

**FFP** (15 mL/kg) only if PCC unavailable — slower, volume overload risk

**Monitoring:**
• Recheck INR 15–30 min post-PCC
• If INR still >1.4 → repeat PCC dose
• Recheck INR at 6h (Vitamin K sustains correction)',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-bp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-dabi-rev', 'ich', 'info', 2,
 'Dabigatran Reversal',
 '**First-line: [Idarucizumab](#/drug/idarucizumab/dabigatran ich) (Praxbind)**
• 5 g IV as two consecutive 2.5 g bolus doses
• Onset: immediate — complete reversal within minutes
• Specific monoclonal antibody fragment for dabigatran

**If idarucizumab unavailable:**
• [4-Factor PCC](#/drug/pcc-4factor/doac ich) 50 IU/kg IV
• OR activated PCC (FEIBA) 50 IU/kg IV

**Adjuncts:**
• Hemodialysis can remove dabigatran (60% reduction in 2–3h) — consider if idarucizumab unavailable and severe bleeding
• Activated charcoal 50 g if ingestion within 2h (intubated patients only)

**Note:** Dabigatran is the only DOAC with a specific reversal agent.',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-bp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-xa-rev', 'ich', 'info', 2,
 'Xa Inhibitor Reversal',
 '**Applies to: apixaban, rivaroxaban, edoxaban**

**Option 1: [4-Factor PCC](#/drug/pcc-4factor/doac ich)**
• 50 IU/kg IV
• Most widely available option
• Onset: 15–30 minutes

**Option 2: Andexanet alfa (Andexxa)**
• Specific Xa inhibitor reversal agent
• Dosing depends on agent and time since last dose
• Note: recently withdrawn from US market due to thrombotic concerns — availability varies

**If last dose within 2h (intubated patient):**
• Activated charcoal 50 g via OG/NG tube

**Monitoring:**
• Anti-Xa levels if available (not required before treatment)
• Repeat CT at 6h to assess for expansion
• Watch for thrombotic complications post-reversal',
 '[1,2,4,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-bp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-heparin-rev', 'ich', 'info', 2,
 'Heparin / LMWH Reversal',
 '**Unfractionated Heparin (UFH):**
• [Protamine](#/drug/protamine/heparin reversal) 1 mg per 100 units UFH given in prior 2–3h
• Max single dose: 50 mg
• Onset: 5 minutes — complete reversal
• Check PTT 15 min after administration

**LMWH (enoxaparin):**
• [Protamine](#/drug/protamine/lmwh reversal) — partial reversal only (~60%)
• If enoxaparin given within 8h: Protamine 1 mg per 1 mg enoxaparin
• If 8–12h: Protamine 0.5 mg per 1 mg enoxaparin
• If >12h: likely no benefit

**Thrombolysis-associated ICH:**
• Cryoprecipitate 10 units (to replenish fibrinogen)
• [Tranexamic acid](#/drug/tranexamic-acid/ich hemostasis) 1 g IV
• Target fibrinogen >200 mg/dL
• Platelets if count <100,000',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-bp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-coag-adj', 'ich', 'info', 2,
 'Hemostatic Adjuncts',
 '**Not on anticoagulation — consider adjunct measures:**

**Tranexamic acid (TXA):**
• [TXA](#/drug/tranexamic-acid/ich hemostasis) 1 g IV over 10 min (within 3h of onset)
• Significant reduction in hematoma expansion (OR 0.82)
• Did NOT improve mortality or functional outcomes in TICH-2
• May be considered — TICH-3 trial underway

**Antiplatelet agents:**
• Platelet transfusion is **NOT recommended** (PATCH trial — worse outcomes)
• DDAVP 0.3 mcg/kg IV may be considered (limited evidence, DASH pilot)

**Thrombocytopenia:**
• Target platelets >100,000 if possible
• Transfuse platelets if count <100,000

**Coagulation factors:**
• Check fibrinogen — supplement with cryoprecipitate if <200 mg/dL
• Correct any identified coagulopathy',
 '[1,2,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-bp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;


-- MODULE 3: BLOOD PRESSURE CONTROL
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-bp', 'ich', 'info', 3,
 'Blood Pressure Control',
 '**Treat pain and anxiety FIRST** — hypertension may be secondary. Proper analgesia/sedation (especially in intubated patients) can significantly improve BP.

**AHA/ASA 2022 BP Targets:**
• SBP 150–220 → target **130–150 mmHg** (reasonable)
• SBP >220 → target **140–180 mmHg** (less evidence)
• **Avoid SBP <130** — potentially harmful
• **Avoid drops >70 mmHg** in first hour

**Timing:** Maximum benefit when started immediately (hematoma expansion risk highest in first 3h). Transition to oral agents after >24h if stable.

**Preferred IV agents:**
• [Clevidipine](#/drug/clevidipine/ich blood pressure) — smoothest titration (t½ ~1 min)
• [Nicardipine](#/drug/nicardipine/ich blood pressure) — more widely available, less expensive
• [Labetalol](#/drug/labetalol/ich blood pressure) — bolus dosing option

**Avoid:** Nitroprusside, nitroglycerin, hydralazine — may increase ICP.',
 '[1,2,7,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-location', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;


-- MODULE 4: SURGICAL CONSIDERATIONS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-location', 'ich', 'question', 4,
 'Hematoma Location',
 'Hematoma location determines surgical approach and prognosis.

**Supratentorial (most common):**
• Basal ganglia/external capsule (60–65%)
• Thalamus (15–20%)
• Lobar (cortical)

**Infratentorial:**
• Cerebellar (5–10%) — unique urgency
• Pontine (5%) — poor prognosis regardless

**Intraventricular extension** occurs in >40% and worsens prognosis.',
 '[1,3]'::jsonb, '[{"label":"Supratentorial","description":"Basal ganglia, thalamic, or lobar hemorrhage","next":"ich-supra-surg"},{"label":"Cerebellar","description":"Posterior fossa — risk of brainstem compression","next":"ich-cerebellar-surg","urgency":"critical"},{"label":"Significant Intraventricular Hemorrhage","description":"Blood in ventricles ± hydrocephalus","next":"ich-ivh-evd","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-supra-surg', 'ich', 'info', 4,
 'Supratentorial Hematoma',
 '**Evidence for surgical evacuation is limited:**

**STITCH-I Trial** (1,033 patients): No benefit from early surgery overall. Possible trend toward benefit for hematomas within 1 cm of cortical surface and lobar hemorrhage with GCS 9–12.

**STITCH-II Trial** (601 patients): Focused on predicted surgical benefit subgroup — still no significant difference vs conservative management.

**Possible indications for craniotomy:**
• Large hematoma with significant midline shift
• Elevated ICP refractory to medical management
• Hemorrhage secondary to resectable lesion (AVM, tumor)
• Lobar location, no IVH extension, very early presentation

**Emerging:** Minimally invasive surgery (MISTIE III) — may be more promising than traditional craniotomy.

**Decompressive hemicraniectomy:** Consider for massive edema with impending herniation when other options exhausted.

Consult neurosurgery for all supratentorial ICH — even if medical management planned initially.',
 '[9,10,11]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-seizures', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-cerebellar-surg', 'ich', 'info', 4,
 'Cerebellar Hematoma — Surgical Emergency',
 '**The cerebellum is unique — patients may deteriorate rapidly (12–24h).**

Risks of cerebellar hemorrhage:
• Direct brainstem compression → catastrophic damage
• 4th ventricle compression → obstructive hydrocephalus
• Upward transtentorial herniation

**Paradox:** Cerebellar ICH patients tend to have better prognosis than other ICH types IF timely surgical intervention is performed.

**AHA/ASA 2022 — Immediate surgical evacuation if:**
• Hematoma volume **>15 mL**
• Neurological deterioration
• Brainstem compression
• Hydrocephalus

**Important:** Ventriculostomy (EVD) alone without posterior fossa decompression is **NOT recommended** — increases risk of upward transtentorial herniation.

EVD pressure may not accurately reflect posterior fossa pressure.

Consult neurosurgery **immediately** — this is a time-critical surgical emergency.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-seizures', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-ivh-evd', 'ich', 'info', 4,
 'Intraventricular Hemorrhage & EVD',
 '**IVH occurs in >40% of ICH patients and worsens prognosis.**

Complications:
• Hydrocephalus and elevated ICP
• Central (neurogenic) fever

**External Ventricular Drain (EVD):**
• **Indicated** for hydrocephalus contributing to reduced consciousness
• Ideal candidate: initially well, then develops hydrocephalus with neuroworsening
• **Caveat:** EVD increases survival but may not increase rate of good neurologic outcome

**Intraventricular tPA (CLEAR III Trial):**
• 500 patients randomized to intraventricular tPA vs saline via EVD
• Improved survival but did NOT increase good functional outcomes
• May be considered when: predominantly IVH without large parenchymal hematoma, and hydrocephalus might resolve with clot dissolution

Consult neurosurgery for EVD placement. Monitor ICP continuously.',
 '[1,12,13]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-seizures', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;


-- MODULE 5: ICU MANAGEMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-seizures', 'ich', 'info', 5,
 'Seizure Management',
 '**Incidence:** ~10% convulsive seizures; subclinical seizure rate is substantially higher.

**Risk factors:**
• Cortical involvement (lobar hemorrhages)
• Coexisting subarachnoid or subdural hemorrhage
• Rebleeding

**Continuous EEG monitoring indications:**
• Impaired consciousness disproportionate to CT findings
• Unexplained fluctuations in mental status
• Any witnessed seizure or clinical signs of seizure

**Treatment:**
• **Seizure prophylaxis is NOT recommended** — prior evidence showed no benefit with phenytoin, and phenytoin has numerous side effects
• **Treat witnessed seizure, EEG seizure, or nonconvulsive status epilepticus:**
  – [Levetiracetam](#/drug/levetiracetam/ich seizure) 20 mg/kg IV (max 3000 mg) — preferred first-line
  – Avoid phenytoin (may worsen outcomes in ICH)',
 '[1,14,15]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-icp-fever', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-icp-fever', 'ich', 'info', 5,
 'ICP, Sodium & Fever',
 '**Intracranial Pressure:**
• ICP elevation from mass effect, perihematomal edema, and/or obstructive hydrocephalus
• **Edema peaks at ~5–6 days** — anticipate delayed neurological deterioration
• Boluses of hypertonic saline or hypertonic bicarbonate for acute ICP crisis (bridge to EVD or surgery)
• Routine hypertonic saline not supported by evidence

**Sodium:**
• Avoid hyponatremia or rapid decreases in sodium — worsens cerebral edema
• Target Na >135 mEq/L

**Fever:**
• Treat aggressively with acetaminophen — also provides analgesic benefit
• **Neurogenic fever** may occur, especially with IVH extension — diagnosis of exclusion
• Work up infection first (blood/urine cultures, CXR)
• For refractory neurogenic fever: bromocriptine
• INTREPID trial: automated surface cooling does NOT improve outcomes — do not use enforced normothermia devices routinely',
 '[1,16]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-dvt', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-dvt', 'ich', 'info', 5,
 'DVT Prophylaxis',
 '**AHA/ASA 2022 recommendations:**

**Immediately:**
• Intermittent pneumatic compression (IPC) — start on admission

**After 24–48 hours:**
• If ICH has demonstrated stability on serial imaging:
  – Low-dose [UFH](#/drug/ufh/dvt prophylaxis) 5000 units SQ q8–12h
  – OR [Enoxaparin](#/drug/enoxaparin/dvt prophylaxis) 40 mg SQ daily
  – Starting chemical DVT prophylaxis is reasonable

**Caution:**
• Patients with underlying coagulopathy or imaging evidence of ongoing hemorrhage expansion may require individualized approach
• Weigh bleeding risk vs thromboembolism risk (ICH patients are immobilized, high VTE risk)

High-risk for DVT: immobilization, weakness/paralysis, older age, obesity.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'ich-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;


-- MODULE 6: DISPOSITION & PROGNOSIS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('ich-disposition', 'ich', 'result', 6,
 'Disposition & Prognosis',
 '**All ICH patients → ICU admission** for continuous neuro monitoring and BP management.

**Ongoing care:**
• Neuro checks q1h minimum (more frequent during acute phase)
• Serial CT: 6h, 24h, and with any neuro decline
• ICP monitoring if EVD placed
• Transition IV antihypertensives to PO after >24h if stable
• DVT prophylaxis per protocol
• Early rehabilitation consultation
• Goals of care discussion with family — especially for severe ICH

**Prognostication:**
• [ICH Score](#/calculator/ich-score) — 30-day mortality prediction (0–6 points)
• [FUNC Score](#/calculator/func-score) — 90-day functional independence (0–11 points)
• [Prognostication Details & Limitations](#/info/ich-prognostication)

**Overall prognosis:**
• 30-day mortality: ~40%
• 1-year survival: ~50%
• Functional independence at 1 year: ~20%

**[Cerebral Amyloid Angiopathy](#/info/ich-caa)** — if lobar ICH in elderly, normotensive patient

Restart anticoagulation decisions should be individualized (typically deferred ≥4 weeks, and avoided entirely in CAA).',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Admit to ICU. Serial CT at 6h and 24h. IPC for DVT. Transition to PO antihypertensives when stable >24h. Early rehab and goals-of-care discussions.', NULL, 'definitive', '[]'::jsonb, '[{"id":"ich-score","label":"ICH Score"},{"id":"func-score","label":"FUNC Score"}]'::jsonb, 16)
;


-- 5. drugs (6 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('pcc-4factor', '4-Factor PCC (Kcentra)', 'Prothrombin complex concentrate (human)', 'Coagulation factor replacement (Factors II, VII, IX, X, Protein C & S)', 'IV',
 '["Warfarin reversal in life-threatening bleeding","DOAC reversal (off-label)","Coagulopathy reversal for urgent surgery"]'::jsonb,
 '[{"indication":"Warfarin reversal — ICH (goal INR <1.4)","regimen":"INR-based dosing: INR 2–3.9 → 25 IU/kg; INR 4–6 → 35 IU/kg; INR >6 → 50 IU/kg. Max single dose 5000 IU. Infuse at 0.12 mL/kg/min (max 8.4 mL/min). Onset: 10–15 min. Always co-administer Vitamin K 10 mg IV to prevent INR rebound.","weightCalc":[{"dosePerKg":25,"unit":"IU","maxDose":2500,"label":"INR 2–3.9"},{"dosePerKg":35,"unit":"IU","maxDose":3500,"label":"INR 4–6"},{"dosePerKg":50,"unit":"IU","maxDose":5000,"label":"INR >6"}]},{"indication":"DOAC reversal — ICH (Xa inhibitor, off-label)","regimen":"50 IU/kg IV (fixed dose regardless of anti-Xa level). Use when andexanet alfa unavailable. Less targeted than specific reversal but widely available.","weightCalc":{"dosePerKg":50,"unit":"IU","maxDose":5000}}]'::jsonb,
 '["Known anaphylaxis to PCC components","Disseminated intravascular coagulation (DIC) — relative","Heparin-induced thrombocytopenia (contains heparin) — use aPCC (FEIBA) instead"]'::jsonb,
 '["Thrombotic risk — contains prothrombotic factors; use lowest effective dose","Contains heparin — contraindicated in HIT","Volume overload less likely than FFP but still possible in CHF","Shorter duration of effect (~6–8h) than Vitamin K — always co-administer Vitamin K for warfarin reversal"]'::jsonb,
 'INR at 15–30 min post-infusion, then at 6h and 24h. Anti-Xa level if reversing Xa inhibitor. Watch for thrombotic complications.',
 'Superior to FFP for warfarin reversal: faster INR correction (minutes vs hours), smaller volume (avoids TACO), and reduced hematoma expansion (INCH trial: 18.3% vs 27.1%). 4-factor contains all vitamin K-dependent factors (II, VII, IX, X) plus Protein C and S. 3-factor PCC (Profilnine) lacks Factor VII and is inferior for warfarin reversal.',
 NULL,
 '["Sarode R, et al. Efficacy and Safety of a 4-Factor PCC vs Plasma for Urgent Vitamin K Antagonist Reversal (INCH). Lancet. 2013;382(9899):1251-1256.","Tomaselli GF, et al. 2020 ACC Expert Consensus: Management of Bleeding on Oral Anticoagulants. J Am Coll Cardiol. 2020;76(5):594-622."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('vitamin-k', 'Vitamin K (Phytonadione)', 'Phytonadione (Vitamin K1)', 'Vitamin K (coagulation cofactor)', 'IV',
 '["Warfarin reversal","Coagulopathy due to vitamin K deficiency"]'::jsonb,
 '[{"indication":"Warfarin reversal — ICH (always with PCC)","regimen":"10 mg IV slow push over 15–30 min. IV route preferred — oral takes 12–24h. Prevents INR rebound after PCC wears off (6–8h). Must co-administer with PCC for immediate reversal; Vitamin K alone is too slow."}]'::jsonb,
 '["Hypersensitivity to phytonadione (rare)"]'::jsonb,
 '["Anaphylactoid reaction risk with IV administration — infuse slowly","IV route can rarely cause cardiovascular collapse if given too rapidly","SC route has erratic absorption — avoid in emergencies","Renders patient warfarin-resistant for 1–2 weeks (relevant for re-anticoagulation)"]'::jsonb,
 'INR at 6h and 24h post-administration. Confirm sustained correction (not just PCC effect).',
 'Essential adjunct to PCC for warfarin reversal in ICH. PCC provides immediate but temporary factor replacement (~6–8h), while Vitamin K stimulates hepatic synthesis of factors II, VII, IX, X over 12–24h. Without Vitamin K, INR will rebound when PCC effect wears off, risking hematoma re-expansion.',
 NULL,
 '["Greenberg SM, et al. 2022 Guideline for Management of Spontaneous ICH. Stroke. 2022;53(7):e282-e361.","Tomaselli GF, et al. 2020 ACC: Management of Bleeding on Oral Anticoagulants. J Am Coll Cardiol. 2020;76(5):594-622."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('idarucizumab', 'Idarucizumab (Praxbind)', 'Idarucizumab', 'Monoclonal antibody fragment (dabigatran-specific reversal)', 'IV',
 '["Dabigatran reversal in life-threatening bleeding or urgent surgery"]'::jsonb,
 '[{"indication":"Dabigatran reversal — ICH or life-threatening bleeding","regimen":"5 g IV total: two consecutive 2.5 g bolus doses (each infused over 5–10 min or as bolus). Complete reversal within minutes. Specific for dabigatran only — does not reverse other DOACs."}]'::jsonb,
 '["None absolute in life-threatening hemorrhage"]'::jsonb,
 '["Thrombotic events reported post-reversal — reflects underlying prothrombotic state of the patient","No redosing has been formally studied","Hereditary fructose intolerance (contains sorbitol)"]'::jsonb,
 'Diluted thrombin time (dTT) or ecarin clotting time (ECT) to confirm reversal. Clinical hemostasis assessment.',
 'Humanized monoclonal antibody fragment that binds dabigatran with 350× higher affinity than thrombin. RE-VERSE AD trial: 100% reversal of anticoagulant effect within minutes in 88% of patients. Only effective for dabigatran — no activity against Xa inhibitors or warfarin.',
 NULL,
 '["Pollack CV, et al. Idarucizumab for Dabigatran Reversal — Full Cohort Analysis (RE-VERSE AD). N Engl J Med. 2017;377(5):431-441.","Frontera JA, et al. Guideline for Reversal of Antithrombotics in Intracranial Hemorrhage. Crit Care Med. 2016;44(12):2251-2257."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('protamine', 'Protamine Sulfate', 'Protamine sulfate', 'Heparin antagonist', 'IV',
 '["Heparin reversal","LMWH reversal (partial)"]'::jsonb,
 '[{"indication":"Heparin reversal — ICH or life-threatening bleeding","regimen":"1 mg per 100 units UFH given in prior 2–3 hours. Infuse slowly over 10 min. Max single dose: 50 mg. Onset: 5 minutes. Check PTT 15 min after."},{"indication":"LMWH (enoxaparin) reversal","regimen":"If enoxaparin given within 8h: 1 mg protamine per 1 mg enoxaparin. If 8–12h since dose: 0.5 mg per 1 mg enoxaparin. If >12h: likely no benefit. Only ~60% reversal of LMWH anti-Xa activity."}]'::jsonb,
 '["Allergy to protamine, fish, or fish-derived products"]'::jsonb,
 '["Anaphylaxis/anaphylactoid reactions — higher risk in patients with fish allergy, prior protamine exposure, or NPH insulin use","Hypotension — infuse slowly (max 5 mg/min); rapid infusion causes cardiovascular collapse","Protamine excess can paradoxically cause anticoagulation — do not overdose","Heparin rebound may occur 8–18h later (protamine has shorter t½ than UFH)"]'::jsonb,
 'PTT or ACT 15 min post-dose. Repeat if incomplete reversal. Monitor for anaphylaxis during infusion.',
 'Derived from salmon sperm. Binds heparin electrostatically to form inactive complex. Complete reversal of UFH, but only partial reversal of LMWH (~60% of anti-Xa activity neutralized). Does NOT reverse fondaparinux.',
 NULL,
 '["Frontera JA, et al. Guideline for Reversal of Antithrombotics in Intracranial Hemorrhage. Crit Care Med. 2016;44(12):2251-2257."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('tranexamic-acid', 'Tranexamic Acid (TXA)', 'Tranexamic acid', 'Antifibrinolytic (lysine analog)', 'IV',
 '["ICH hemostasis (adjunct)","Trauma hemorrhage","Postpartum hemorrhage","Thrombolysis reversal (adjunct)"]'::jsonb,
 '[{"indication":"ICH hemostasis (adjunct — within 3h of onset)","regimen":"1 g IV over 10 min. Reduced hematoma expansion (OR 0.82, TICH-2) but no improvement in mortality or functional outcome. Consider as adjunct."}]'::jsonb,
 '["Active thromboembolic disease (DVT, PE, stroke)","Subarachnoid hemorrhage (risk of vasospasm)"]'::jsonb,
 '["Seizure risk at high doses (>2 g)","Renal impairment — dose reduce if CrCl <50 mL/min","Thrombotic risk — avoid in patients with active DVT/PE"]'::jsonb,
 'Repeat CT at 6h to assess hematoma stability. Watch for thrombotic complications.',
 'Competitively inhibits plasminogen activation, stabilizing clots. TICH-2 trial (2,325 patients): significant reduction in hematoma expansion but no functional outcome benefit. TICH-3 trial underway. Most beneficial when given within 3h of onset, before clot stabilization.',
 NULL,
 '["Sprigg N, et al. Tranexamic acid for hyperacute primary IntraCerebral Haemorrhage (TICH-2). Lancet. 2018;391(10135):2107-2115.","Steiner T, et al. ESO/EANS guideline on stroke due to spontaneous ICH. Eur Stroke J. 2025;10(4):1007-1086."]'::jsonb,
 4)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('levetiracetam', 'Levetiracetam (Keppra)', 'Levetiracetam', 'Antiepileptic (SV2A ligand)', 'IV / PO',
 '["Seizure treatment in ICH","Status epilepticus (adjunct)","Seizure disorders"]'::jsonb,
 '[{"indication":"ICH seizure treatment","regimen":"20 mg/kg IV (max 3000 mg) as loading dose over 15 min. Maintenance: 500–1500 mg IV/PO q12h. Preferred over phenytoin in ICH — fewer side effects and drug interactions.","weightCalc":{"dosePerKg":20,"unit":"mg","maxDose":3000,"label":"Loading dose"}}]'::jsonb,
 '["Hypersensitivity to levetiracetam"]'::jsonb,
 '["Behavioral changes (irritability, agitation) — more common at higher doses","Reduce dose in renal impairment (CrCl <80 mL/min)","Suicidal ideation risk — FDA black box warning for all antiepileptics"]'::jsonb,
 'Seizure frequency, mental status, renal function. Drug levels not routinely needed (poor correlation with efficacy).',
 'Preferred first-line antiepileptic in neurocritical care. No hepatic metabolism, no drug interactions with warfarin/DOACs, no cardiac effects. Phenytoin should be avoided in ICH — associated with worse outcomes, numerous drug interactions, and cardiac toxicity.',
 NULL,
 '["Greenberg SM, et al. 2022 Guideline for the Management of Patients With Spontaneous Intracerebral Hemorrhage. Stroke. 2022;53(7):e282-e361.","Naidech AM, et al. Anticonvulsant Use and Outcomes After Intracerebral Hemorrhage. Stroke. 2009;40(12):3810-3815."]'::jsonb,
 5)
;


-- 5b. drugs — UPDATE existing entries (3 drugs)
-- Updating Clevidipine (Cleviprex) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute hypertension in stroke (pre/post thrombolysis)","Perioperative hypertension","Hypertensive emergency"]'::jsonb,
  dosing = '[{"indication":"Acute stroke BP management","regimen":"Start 1–2 mg/hr IV. Double dose every 90 seconds until target BP achieved. Usual maintenance: 4–6 mg/hr. Max 21 mg/hr (or 1000 mL per 24h due to lipid load)."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"Start 1–2 mg/hr IV. Double every 90 sec until SBP 130–150 mmHg. Usual maintenance 4–6 mg/hr. Max 21 mg/hr. Smoothest titration agent — ultra-short t½ (~1 min). Avoid SBP <130 or drops >70 mmHg in first hour."}]'::jsonb,
  contraindications = '["Severe aortic stenosis","Defective lipid metabolism (e.g., pathologic hyperlipidemia, lipoid nephrosis, acute pancreatitis with hyperlipidemia)","Allergy to soy or egg products (lipid emulsion vehicle)"]'::jsonb,
  cautions = '["Lipid emulsion vehicle — contributes 2 kcal/mL to caloric intake","No preservative — must be used within 12 hours of puncture","Rebound hypertension possible if discontinued abruptly — transition to oral agent","Reflex tachycardia may occur"]'::jsonb,
  monitoring = 'Continuous arterial BP monitoring recommended. Heart rate. Lipid panel if prolonged use >24h.',
  notes = 'Ultra-short half-life (~1 min) allows precise, rapid BP titration. Achieves target BP faster than nicardipine in clinical trials. Arterial-selective vasodilator — reduces afterload without venodilation. Does not reduce cerebral blood flow. Consider when nicardipine is unavailable or faster titration is needed.',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Pollack CV, et al. Clevidipine for Acute Hypertension: A Systematic Review and Meta-Analysis. Crit Care Med. 2019."]'::jsonb
WHERE id = 'clevidipine';

-- Updating Nicardipine (Cardene) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute stroke BP management (pre/post thrombolysis)","Hypertensive emergency","Perioperative hypertension"]'::jsonb,
  dosing = '[{"indication":"Pre-thrombolysis BP (target <185/110)","regimen":"5 mg/hr IV infusion. Titrate by 2.5 mg/hr every 5–15 min. Max 15 mg/hr. Once target achieved, decrease to 3 mg/hr and titrate to maintain."},{"indication":"Post-thrombolysis BP (target <180/105 × 24h)","regimen":"5 mg/hr IV infusion, titrate by 2.5 mg/hr every 5–15 min to maintain BP <180/105. Max 15 mg/hr."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"5 mg/hr IV infusion. Titrate by 2.5 mg/hr every 5–15 min. Target SBP 130–150. More widely available and less expensive than clevidipine. Monitor closely — overshoot hypotension possible. Avoid SBP <130 or drops >70 mmHg in first hour. Max 15 mg/hr."}]'::jsonb,
  contraindications = '["Advanced aortic stenosis","Hypersensitivity to nicardipine or other dihydropyridine CCBs"]'::jsonb,
  cautions = '["Reflex tachycardia — may need to combine with beta-blocker","Peripheral phlebitis — change IV site every 12h or use central line","Hepatic impairment — reduce dose (extensively hepatically metabolized)","Transition to oral antihypertensive when stable — onset of oral agent overlaps with nicardipine wean"]'::jsonb,
  monitoring = 'Continuous arterial BP monitoring recommended. Heart rate. IV site inspection every 4–6h (phlebitis risk).',
  notes = 'Second-line to labetalol for acute stroke BP management. Preferred when beta-blocker contraindicated (asthma, bradycardia, HF). Onset: 5–10 min. Does not increase ICP. Arterial-selective vasodilator. More predictable dose-response than labetalol for continuous infusion.',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Liu-Deryke X, et al. Management of Hypertension in Acute Ischemic Stroke. Ann Pharmacother. 2006;40(12):2234-46."]'::jsonb
WHERE id = 'nicardipine';

-- Updating Labetalol with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute stroke BP management (pre/post thrombolysis)","Hypertensive emergency","Preeclampsia/eclampsia"]'::jsonb,
  dosing = '[{"indication":"Pre-thrombolysis BP (target <185/110)","regimen":"10–20 mg IV bolus over 1–2 min. May repeat once. If BP still >185/110 after 2 doses, consider nicardipine infusion. Do NOT proceed with thrombolysis if BP remains uncontrolled."},{"indication":"Post-thrombolysis BP (target <180/105 × 24h)","regimen":"10 mg IV bolus, then 2–8 mg/min continuous infusion. Titrate to maintain BP <180/105. Max 300 mg/24h."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"10–20 mg IV bolus over 1–2 min. May repeat every 10–15 min. If repeated boluses needed, start infusion at 2–8 mg/min. Target SBP 130–150. Avoid SBP <130 or drops >70 mmHg in first hour. Max 300 mg/24h."}]'::jsonb,
  contraindications = '["Severe bradycardia (HR <60)","Heart block greater than first degree without pacemaker","Cardiogenic shock or decompensated HF","Severe reactive airway disease / status asthmaticus","Pheochromocytoma (without prior alpha-blockade)"]'::jsonb,
  cautions = '["Bronchospasm — beta-2 blockade at higher doses may precipitate bronchospasm in asthma/COPD","Bradycardia — monitor HR; hold if HR <55","Hepatotoxicity — rare idiosyncratic reaction; monitor LFTs if prolonged use","Orthostatic hypotension — keep patient supine during IV administration"]'::jsonb,
  monitoring = 'Continuous BP monitoring (arterial line preferred). Heart rate. Neuro checks every 15 min during active titration.',
  notes = 'First-line IV antihypertensive for acute stroke per AHA/ASA guidelines. Onset: 2–5 min IV. Duration: 2–4 hours. Alpha:beta blockade ratio is ~1:7 (predominantly beta). Does not increase intracranial pressure. Preferred over nitroprusside (which can raise ICP).',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Whelton PK, et al. 2017 ACC/AHA Guideline for Prevention, Detection, Evaluation, and Management of High Blood Pressure. J Am Coll Cardiol. 2018;71(19):e127-e248."]'::jsonb
WHERE id = 'labetalol';


-- 6. info_pages (5 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('ich-summary', 'ICH Steps Summary', 'Time-critical hemorrhage management pathway',
 '[{"heading":"1. Initial Assessment","body":"• [Non-contrast CT head — confirm ICH, estimate volume (ABC/2)](#/node/ich-start)\n• [Labs: CBC, BMP, INR/PTT/fibrinogen, anti-Xa level if on DOAC](#/node/ich-labs)\n• [CTA for nearly all patients (mandatory if lobar <70y or deep <45y)](#/node/ich-labs)"},{"heading":"2. Coagulation Optimization","body":"• [Identify anticoagulant — do NOT wait for labs before reversing](#/node/ich-anticoag)\n• [Warfarin → 4-Factor PCC + Vitamin K 10 mg IV](#/node/ich-warfarin-rev)\n• [Dabigatran → Idarucizumab 5 g IV](#/node/ich-dabi-rev)\n• [Xa inhibitor → 4-Factor PCC 50 IU/kg or andexanet alfa](#/node/ich-xa-rev)\n• [Heparin/LMWH → Protamine sulfate](#/node/ich-heparin-rev)"},{"heading":"3. Blood Pressure Control","body":"• [Treat pain/anxiety FIRST](#/node/ich-bp)\n• [SBP 150–220 → target 130–150 mmHg](#/node/ich-bp)\n• [SBP >220 → target 140–180 mmHg](#/node/ich-bp)\n• [Avoid SBP <130 and drops >70 mmHg in first hour](#/node/ich-bp)"},{"heading":"4. Surgical Considerations","body":"• [Supratentorial: limited evidence for early evacuation — consult neurosurgery](#/node/ich-supra-surg)\n• [Cerebellar >15 mL with brainstem compression → IMMEDIATE surgical evacuation](#/node/ich-cerebellar-surg)\n• [IVH with hydrocephalus → EVD placement](#/node/ich-ivh-evd)"},{"heading":"5. ICU Management","body":"• [Seizure prophylaxis NOT recommended — treat if witnessed/EEG-confirmed](#/node/ich-seizures)\n• [ICP management, sodium monitoring, fever treatment](#/node/ich-icp-fever)\n• [DVT prophylaxis: IPC immediately, chemical ppx after 24–48h if stable](#/node/ich-dvt)"},{"heading":"6. Disposition","body":"• [ICU admission for all ICH patients](#/node/ich-disposition)\n• [Serial CT at 6h and 24h](#/node/ich-disposition)\n• [Early goals-of-care discussion](#/node/ich-disposition)"}]'::jsonb,
 '[{"num":1,"text":"Greenberg SM, et al. 2022 Guideline for the Management of Patients With Spontaneous Intracerebral Hemorrhage. Stroke. 2022;53(7):e282-e361."},{"num":2,"text":"Steiner T, et al. ESO/EANS guideline on stroke due to spontaneous intracerebral haemorrhage. Eur Stroke J. 2025;10(4):1007-1086."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('ich-ct-markers', 'CT Markers of Hemorrhage Expansion', 'Non-contrast CT and CTA signs predicting hematoma growth',
 '[{"heading":"Non-contrast CT Signs","body":"**Swirl sign** — Areas of varying density within the hematoma. Fresh unclotted blood is hypodense relative to clotted blood. Indicates active hemorrhage.\n\n**Black hole sign** — Relatively dark area within the hematoma not connected to adjacent brain tissue. Predicts hematoma growth (32% sensitivity, 94% specificity).\n\n**Blend sign** — Hematoma contains both hyperdense and hypodense regions.\n\n**Fluid-fluid level** — Highly specific for coagulopathy or anticoagulant use. If present and no anticoagulant identified, search aggressively for occult coagulopathy.\n\n**Island sign** — ≥3 small hemorrhages separated from the main hematoma.\n\n**Isodense/hypodense blood** — On initial CT, may indicate coagulopathy (clotting retarded by anticoagulant effect)."},{"heading":"CT Angiography: Spot Sign","body":"**Spot sign** — Leakage of contrast into the hematoma. 51% sensitivity, 85% specificity for predicting expansion. Must NOT be in anatomic continuity with adjacent blood vessels.\n\nThe spot sign is a key indicator for early hematoma expansion risk and may influence aggressiveness of BP management and reversal strategy."},{"heading":"Edema","body":"Edema takes several hours to develop — usually not seen on initial CT.\n\n**Unusually extensive or irregular edema** raises suspicion for:\n• Cerebral venous thrombosis (CVT) with secondary hemorrhage\n• Ischemic stroke with hemorrhagic transformation\n• Tumor with intratumoral hemorrhage\n\nPerihematomal edema peaks at ~5–6 days. This is cytotoxic edema — does NOT respond to steroids."}]'::jsonb,
 '[{"num":1,"text":"Boulouis G, et al. Noncontrast CT Markers of Intracerebral Hemorrhage Expansion. Stroke. 2017;48(4):1120-1125."},{"num":2,"text":"Menon BK. Neuroimaging in Acute Stroke. Continuum (Minneap Minn). 2020;26(2):287-309."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('ich-causes', 'Causes of ICH', 'Etiologic classification of spontaneous intracerebral hemorrhage',
 '[{"heading":"Small Vessel Disease (“Primary ICH”) — ~80%","body":"**Hypertensive ICH** — most common cause. Same arterial lipohyalinization that causes lacunar strokes.\n• Basal ganglia / external capsule (60–65%)\n• Thalamus (15–20%)\n• Pons or deep cerebellar nuclei (10%)\n\n**Cerebral amyloid angiopathy (CAA)** — ~15% of all spontaneous ICH. Most common cause of lobar hemorrhage in normotensive elderly patients. Beta-amyloid deposition in cortical and leptomeningeal vessels. Associated with Alzheimer disease. [See CAA details](#/info/ich-caa)"},{"heading":"Macrovascular Etiologies","body":"Most common cause of ICH in young adults. Often require surgical or endovascular intervention.\n\n• **Aneurysmal rupture** — usually has subarachnoid component; frontal (ACA/AComm) or temporal (MCA) location\n• **Arteriovenous malformation (AVM)** — key in young patients\n• **Cerebral venous thrombosis (CVT)** — consider if younger patient, hypercoagulable state, bilateral hemorrhages, or excess edema\n• **Cavernous malformation** — popcorn-like appearance on T2 MRI\n• **Dural arteriovenous fistula (dAVF)**\n• **Mycotic aneurysm** — endocarditis/bacteremia\n• **Moyamoya disease**"},{"heading":"Other Etiologies","body":"• **Malignancy** — primary brain tumor or hemorrhagic metastasis\n• **Ischemic stroke with hemorrhagic conversion**\n• **RCVS** (reversible cerebral vasospasm syndrome)\n• **Coagulopathy** — warfarin, DOACs, liver disease, DIC\n• **Sympathomimetic drug use** — cocaine, amphetamines\n• **Vasculitis** — PAN, lupus, ANCA vasculitis, drug-induced"}]'::jsonb,
 '[{"num":1,"text":"Nobleza COS. Intracerebral Hemorrhage. Continuum (Minneap Minn). 2021;27(5):1246-1277."},{"num":2,"text":"McGurgan IJ, et al. Acute intracerebral haemorrhage: diagnosis and management. Pract Neurol. 2021;21(2):128-136."}]'::jsonb,
 false,
 2)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('ich-caa', 'Cerebral Amyloid Angiopathy (CAA)', 'Beta-amyloid vasculopathy causing lobar ICH in the elderly',
 '[{"heading":"Overview","body":"Cerebrovascular disorder caused by beta-amyloid deposition in small-to-medium cortical and leptomeningeal arteries. Prevalence ~5% in people >65 years. Accounts for ~15% of all spontaneous ICH. Associated with Alzheimer disease.\n\nMost common cause of **lobar hemorrhage in normotensive elderly** patients. However, half of lobar ICH in the elderly is NOT due to CAA."},{"heading":"Imaging Features","body":"• **Location:** Lobar hemorrhage (occipital and parietal lobes most common)\n• **Finger-like projections** extending from the hemorrhage\n• Extension may involve subarachnoid, subdural, or intraventricular spaces\n• **MRI GRE/SWI:** Multiple microhemorrhages at grey-white junction and/or convexity, with hemosiderosis\n\n**Clinical hint:** Elderly patient + cognitive decline + lobar hemorrhage + small amount of cortical subarachnoid hemorrhage = likely amyloid angiopathy."},{"heading":"Prognosis & Implications","body":"Short-term prognosis is often favorable, but **high recurrence risk (~7.5%/year)** and progressive cognitive decline.\n\n**Critical:** Patients diagnosed with CAA should generally **NOT be restarted on anticoagulation** due to very high risk of recurrent hemorrhage. This is a key management decision that differs from non-CAA ICH.\n\nAntiplatelet monotherapy may be considered with careful risk-benefit analysis."},{"heading":"Inflammatory CAA (CAA-ri)","body":"Rare variant where perivascular beta-amyloid triggers inflammation. Mean onset in 70s.\n\n**Presentation:** Acute/subacute headache, reduced consciousness, behavioral change, focal neurologic signs, seizures.\n\n**MRI:** Vasogenic edema in subcortical white matter with mass effect + underlying CAA features (microhemorrhages).\n\n**Treatment:** May respond to steroids followed by cyclophosphamide."}]'::jsonb,
 '[{"num":1,"text":"Schrag M, Kirshner H. Management of Intracerebral Hemorrhage: JACC Focus Seminar. J Am Coll Cardiol. 2020;75(15):1819-1831."},{"num":2,"text":"Nobleza COS. Intracerebral Hemorrhage. Continuum (Minneap Minn). 2021;27(5):1246-1277."}]'::jsonb,
 false,
 3)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('ich-prognostication', 'ICH Prognostication', 'ICH Score and FUNC Score for risk stratification',
 '[{"heading":"Overall Prognosis","body":"30-day mortality: ~40%\n1-year survival: ~50%\n5-year survival: ~30%\nFunctional independence at 1 year: ~20%\n\n**Predictors of poor outcome:**\n• Hematoma volume >60 mL\n• GCS <8\n• Deep or infratentorial location\n• Intraventricular extension\n• Increasing age"},{"heading":"ICH Score (30-Day Mortality)","body":"**Components (0–6 points):**\n• GCS 3–4: +2 pts | GCS 5–12: +1 pt | GCS 13–15: 0 pts\n• Hematoma volume ≥30 mL: +1 pt\n• Intraventricular hemorrhage: +1 pt\n• Infratentorial origin: +1 pt\n• Age ≥80: +1 pt\n\n**Mortality by score:**\n• ICH 0: ~0%\n• ICH 1: ~13%\n• ICH 2: ~26%\n• ICH 3: ~72%\n• ICH 4: ~97%\n• ICH 5–6: ~100%"},{"heading":"ICH Score Limitations","body":"• Transient impairment (sedation, hypercapnia) may inflate the score\n• Hydrocephalus may cause reversible consciousness impairment — treatable with EVD\n• No distinction between tiny vs massive IVH\n• No distinction between pontine (poor) vs cerebellar (treatable) infratentorial bleeds\n• No distinction between age 18 and 79\n• Does not account for pre-existing functional status/frailty\n\n**Caution:** These scores should NOT be used to justify withdrawal of care. Self-fulfilling prophecy bias is a known limitation — aggressive early treatment may improve outcomes beyond what the scores predict."},{"heading":"FUNC Score (90-Day Functional Independence)","body":"**Components (0–11 points):**\n• ICH volume: <30 mL (+4) | 30–59 mL (+2) | ≥60 mL (0)\n• Age: <70 (+2) | 70–79 (+1) | ≥80 (0)\n• Location: Lobar (+2) | Deep (+1) | Infratentorial (0)\n• GCS: ≥9 (+2) | <9 (0)\n• Pre-ICH cognitive impairment: No (+1) | Yes (0)\n\n**Probability of functional independence at 90 days:**\n• FUNC 0–4: 0–2%\n• FUNC 5–7: 6–29%\n• FUNC 8: 42%\n• FUNC 9–10: 55–66%\n• FUNC 11: 80%"}]'::jsonb,
 '[{"num":1,"text":"Hemphill JC 3rd, et al. The ICH Score: A Simple, Reliable Grading Scale for Intracerebral Hemorrhage. Stroke. 2001;32(4):891-897."},{"num":2,"text":"Rost NS, et al. Prediction of Functional Outcome in Patients With Primary Intracerebral Hemorrhage: The FUNC Score. Stroke. 2008;39(8):2304-2309."}]'::jsonb,
 false,
 4)
;

COMMIT;
