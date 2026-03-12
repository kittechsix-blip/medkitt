-- =====================================================================
-- MedKitt — A-Fib RVR Consult: Supabase INSERT Statements
-- Generated: 2026-03-10
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'afib-rvr',
  'A-Fib RVR',
  'Stability → Rate Control → Refractory → Anticoagulation',
  '1.0',
  20,
  'afib-start',
  '["Initial Assessment","Unstable Pathway","Rate Control","Refractory","Anticoagulation","Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('cardiology', 'afib-rvr', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('procedures', 'afib-rvr', 'Synchronized Cardioversion', 'A-Fib RVR: Stability → Cardioversion Protocol', NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (10 citations)
DELETE FROM tree_citations WHERE tree_id = 'afib-rvr';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('afib-rvr', 1, 'Joglar JA, Chung MK, et al. 2023 ACC/AHA/ACCP/HRS Guideline for the Diagnosis and Management of Atrial Fibrillation. J Am Coll Cardiol. 2024;83(1):109-279.'),
('afib-rvr', 2, 'Wigginton JG, Agarwal S, et al. Part 9: Adult Advanced Life Support: 2025 AHA Guidelines for CPR and ECC. Circulation. 2025;152(16_suppl_2):S538-S577.'),
('afib-rvr', 3, 'Ko D, Chung MK, et al. Atrial Fibrillation: A Review. JAMA. 2025;333(4):329-342.'),
('afib-rvr', 4, 'Prystowsky EN, Padanilam BJ, Fogel RI. Treatment of Atrial Fibrillation. JAMA. 2015;314(3):278-88.'),
('afib-rvr', 5, 'Panchal AR, Bartos JA, et al. Part 3: Adult Basic and Advanced Life Support: 2020 AHA Guidelines for CPR and ECC. Circulation. 2020;142(16_suppl_2):S366-S468.'),
('afib-rvr', 6, 'Michaud GF, Stevenson WG. Atrial Fibrillation. N Engl J Med. 2021;384(4):353-361.'),
('afib-rvr', 7, 'Bosch NA, Cimini J, Walkey AJ. Atrial Fibrillation in the ICU. Chest. 2018;154(6):1424-1434.'),
('afib-rvr', 8, 'Chyou JY, Barkoudah E, et al. Atrial Fibrillation Occurring During Acute Hospitalization: AHA Scientific Statement. Circulation. 2023;147(15):e676-e698.'),
('afib-rvr', 9, 'Long B, Brady WJ, Gottlieb M. Emergency Medicine Updates: Atrial Fibrillation with Rapid Ventricular Response. Am J Emerg Med. 2023;74:57-64.'),
('afib-rvr', 10, 'Wolfes J, Ellermann C, et al. Comparison of Latest ESC, ACC/AHA/ACCP/HRS, and CCS Guidelines on AF Management. JACC Clin Electrophysiol. 2025;11(4):836-849.');

DELETE FROM decision_nodes WHERE tree_id = 'afib-rvr';

-- 4. decision_nodes (18 nodes)

-- MODULE 1: INITIAL ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-start', 'afib-rvr', 'info', 1,
 'A-Fib RVR: Initial Assessment',
 '[A-Fib RVR Management Steps](#/info/afib-summary) — quick-reference for rate control, cardioversion, and anticoagulation.

Atrial fibrillation with rapid ventricular response (RVR) is characterized by an irregularly irregular rhythm with a ventricular rate typically 120–180 bpm. Confirm with 12-lead ECG.

COMMON PRECIPITANTS
• Electrolyte abnormalities (K⁺, Mg²⁺)
• Sepsis / infection
• Pulmonary embolism
• Thyrotoxicosis
• Alcohol use / withdrawal
• Pain / agitation
• Respiratory failure / hypoxia
• Underlying cardiac disease (valvular, ischemic, HF)

Always treat underlying causes alongside rate control. A-Fib RVR is often a symptom of another process — rate control alone may be insufficient if the precipitant is not addressed.',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-stability', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-stability', 'afib-rvr', 'question', 1,
 'Hemodynamic Stability',
 'Is the patient hemodynamically stable?',
 '[]'::jsonb, '[{"label":"Hemodynamically stable","description":"Adequate BP, perfusion, no acute HF or ischemia","next":"afib-stable-drugs"},{"label":"Hemodynamically unstable","description":"Hypotension, acute HF, ongoing ischemia, altered mental status, or shock","next":"afib-unstable-wpw","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;


-- MODULE 2: UNSTABLE PATHWAY
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-unstable-wpw', 'afib-rvr', 'question', 2,
 'WPW / Pre-Excitation Screen',
 'Is there evidence of WPW / pre-excitation syndrome?

Look for: irregular wide-complex tachycardia, rate >200, variable QRS morphology, delta waves on prior ECG. WPW + A-Fib is a life-threatening emergency.',
 '[]'::jsonb, '[{"label":"Yes — WPW / pre-excitation suspected","description":"Irregular wide-complex tachycardia, delta waves, rate >200","next":"afib-wpw-result","urgency":"critical"},{"label":"No — No pre-excitation","description":"Standard A-Fib RVR without accessory pathway","next":"afib-cardioversion-protocol"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-wpw-result', 'afib-rvr', 'result', 2,
 'WPW + A-Fib Management',
 'WPW with atrial fibrillation is a life-threatening emergency.

AV nodal blocking agents are ABSOLUTELY CONTRAINDICATED — including beta-blockers, calcium channel blockers, digoxin, and IV amiodarone. These agents may paradoxically accelerate ventricular response through the accessory pathway and precipitate ventricular fibrillation.',
 '[2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Immediate [synchronized cardioversion](#/info/cardioversion-afib) (200J biphasic). If cardioversion is not immediately available, [Procainamide](#/drug/procainamide) may be used as a temporizing measure.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-cardioversion-protocol', 'afib-rvr', 'info', 2,
 'Synchronized Cardioversion Protocol',
 'SYNCHRONIZED CARDIOVERSION PROTOCOL

1. PREPARATION
• Confirm synchronization is enabled on defibrillator
• Apply pads: anterior/lateral placement preferred (EPIC trial)
• Hyperinflation may impair conduction — cardiovert at end-expiration if possible

2. SEDATION
• Midazolam 3–5 mg IV bolus, additional 2 mg q2min PRN to adequate sedation
• Alternative: MidaKet for patients resistant to midazolam
• Flumazenil 0.5–1 mg IV available for reversal

3. CARDIOVERSION
• Start at 200J biphasic (use maximal energy available)
• Escalate energy if initial attempt unsuccessful

4. POST-CARDIOVERSION
• Consider [Amiodarone](#/drug/amiodarone) to maintain sinus rhythm (150mg IV bolus, then 1 mg/min infusion)
• Consider IV [Magnesium Sulfate](#/drug/magnesium-sulfate) 2–4g to enhance cardioversion success
• If cardioversion not immediately feasible, IV [Amiodarone](#/drug/amiodarone) may be used as temporizing measure',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-cardioversion-result', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-cardioversion-result', 'afib-rvr', 'result', 2,
 'Post-Cardioversion Management',
 'Patient has undergone or is undergoing cardioversion for hemodynamically unstable A-Fib RVR.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Continue [Amiodarone](#/drug/amiodarone) infusion to prevent recurrence. Monitor for reversion to A-Fib. Treat underlying precipitants (sepsis, PE, electrolyte abnormalities). Consider anticoagulation assessment once stabilized.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 5)
;


-- MODULE 3: RATE CONTROL
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-stable-drugs', 'afib-rvr', 'info', 3,
 'First-Line Rate Control Agents',
 'FIRST-LINE AGENTS FOR RATE CONTROL

Beta-Blockers (Class 1 recommendation):
• [Metoprolol](#/drug/metoprolol) — 2.5–5 mg IV q5min, up to 15 mg total
• [Esmolol](#/drug/esmolol) — Ultra-short-acting, ideal when rapid titration needed
• Safe in COPD (multiple studies confirm no adverse respiratory effects)
• Preferred in CAD or compensated HFrEF
• Use cautiously in decompensated heart failure

Calcium Channel Blockers:
• [Diltiazem](#/drug/diltiazem) — 0.25 mg/kg IV bolus, onset within minutes
• [Verapamil](#/drug/verapamil) — Alternative CCB, less commonly used
• 90% rate control vs 74% with amiodarone or digoxin
• ⚠️ CONTRAINDICATED if EF ≤40% or decompensated HF (Class 3: Harm)
• Obtain echo or check history for EF if unknown

Adjunctive:
• IV [Magnesium Sulfate](#/drug/magnesium-sulfate) — Reasonable to add (Class 2a). Blocks slow Ca channels at AV node with minimal toxicity.

⚠️ Do NOT combine beta-blockers with calcium channel blockers — risk of synergistic hypotension.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-rate-controlled', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-rate-controlled', 'afib-rvr', 'question', 3,
 'Rate Control Assessment',
 'Is the ventricular rate now controlled?

Target heart rate:
• ICU / critically ill: <130 bpm may be reasonable
• Outpatient / stable: <100–110 bpm (RACE II trial)
• Titrate primarily to control symptoms rather than strict targets
• Some patients may benefit from mild compensatory tachycardia — do not aggressively normalize if rate is due to underlying process',
 '[]'::jsonb, '[{"label":"Yes — Rate controlled","description":"Heart rate at target, symptoms improved","next":"afib-onset-assessment"},{"label":"No — Rate still uncontrolled","description":"Heart rate remains above target despite first-line agent","next":"afib-refractory","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;


-- MODULE 4: REFRACTORY
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-refractory', 'afib-rvr', 'question', 4,
 'Refractory Rate Control',
 'Select second-line intervention for refractory rate control.

First-line agent was insufficient. Re-evaluate for underlying causes (sepsis, hypovolemia, pain, PE). Ensure adequate trial of first-line agent before escalating.

⚠️ Avoid combining beta-blockers with calcium channel blockers.',
 '[]'::jsonb, '[{"label":"Add IV Magnesium","description":"Blocks slow Ca channels at AV node. Excellent safety profile.","next":"afib-refractory-mg"},{"label":"Add Digoxin","description":"Adjunctive when hypotension limits beta-blocker/CCB titration.","next":"afib-refractory-dig"},{"label":"Switch to Amiodarone","description":"More hemodynamically stable. May achieve cardioversion.","next":"afib-refractory-amio"},{"label":"Consider Rhythm Control","description":"When rate control strategy has failed.","next":"afib-rhythm-control"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-refractory-mg', 'afib-rvr', 'info', 4,
 'Add IV Magnesium',
 'IV [Magnesium Sulfate](#/drug/magnesium-sulfate)

• 2–4 grams IV bolus, may follow with continuous infusion
• Blocks slow calcium channels in SA and AV nodes
• Minimal toxicity — one meta-analysis detected no adverse events
• Even if cardioversion doesn’t occur, magnesium reduces heart rate and augments efficacy of other antiarrhythmics
• Contraindicated if GFR <30 mL/min or oliguria — use intermittent boluses instead
• Target serum level ~3–4 mg/dL for optimal antiarrhythmic effect',
 '[1,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-refractory-reassess', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-refractory-dig', 'afib-rvr', 'info', 4,
 'Add Digoxin',
 '[Digoxin](#/drug/digoxin)

• Useful when hypotension limits further titration of beta-blockers or CCBs
• Slow onset: ~3 hours to achieve rate control (vs 5 min for diltiazem)
• Limited efficacy during exertion — slows primarily resting heart rate
• ⚠️ Post hoc analyses associate digoxin with increased mortality in A-Fib
• Use at low doses, typically in combination with other AV nodal agents
• May be particularly useful in patients with concurrent heart failure',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-refractory-reassess', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-refractory-amio', 'afib-rvr', 'info', 4,
 'Switch to Amiodarone',
 '[Amiodarone](#/drug/amiodarone)

• Load with 150 mg IV bolus over 10 min, then 1 mg/min infusion
• May need to re-bolus 150 mg x2–3 (total 150–450 mg in boluses)
• More hemodynamically stable than beta-blockers or CCBs
• May achieve chemical cardioversion — beneficial if rhythm control desired
• 74% rate control achieved in clinical trials
• ⚠️ Do not conclude amiodarone has failed without adequate re-bolusing
• If cardioversion occurs, continue infusion until critical illness resolves',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-refractory-reassess', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-rhythm-control', 'afib-rvr', 'info', 4,
 'Consider Rhythm Control',
 'RHYTHM CONTROL STRATEGY

Consider when rate control strategy has failed or in new-onset AF where conversion is desirable.

Stepwise approach:
1. IV [Magnesium Sulfate](#/drug/magnesium-sulfate) infusion (front-line, excellent safety)
2. [Amiodarone](#/drug/amiodarone) if magnesium alone insufficient
3. DC cardioversion (especially in intubated patients)

Factors favoring rhythm control:
• New-onset AF (NOAF) — likely to revert
• Pulmonary hypertension, mitral stenosis, diastolic dysfunction
• Heart failure with reduced EF
• Failure of rate control

Factors favoring rate control:
• Chronic/longstanding AF
• Onset >48 hours without anticoagulation
• Ongoing severe physiological stress',
 '[1,3,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-refractory-reassess', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-refractory-reassess', 'afib-rvr', 'question', 4,
 'Post-Intervention Reassessment',
 'Is the rate now controlled after second-line intervention?',
 '[]'::jsonb, '[{"label":"Yes — Rate controlled","description":"Heart rate at target, symptoms improved","next":"afib-onset-assessment"},{"label":"No — Still refractory","description":"Consider combining agents or rhythm control if not yet attempted","next":"afib-refractory","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;


-- MODULE 5: ANTICOAGULATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-onset-assessment', 'afib-rvr', 'question', 5,
 'AF Onset Assessment',
 'Is this new-onset AF or known/chronic AF?

Distinguishing onset is important for anticoagulation decisions and rhythm control candidacy.

New-onset AF (NOAF): First episode, occurring during current hospitalization or acute illness. Often reverts spontaneously as underlying cause resolves.

Known/Chronic AF: Pre-existing AF documented prior to current presentation, or AF duration >48 hours.',
 '[]'::jsonb, '[{"label":"New-onset AF (NOAF)","description":"First episode during current illness/hospitalization","next":"afib-noaf-anticoag"},{"label":"Known/Chronic AF or onset >48 hours","description":"Pre-existing AF or duration exceeds 48 hours","next":"afib-cha2ds2vasc"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-noaf-anticoag', 'afib-rvr', 'info', 5,
 'NOAF — Anticoagulation Considerations',
 'NEW-ONSET AF IN CRITICAL ILLNESS

Anticoagulation is generally NOT recommended for NOAF:
• Retrospective studies show anticoagulation increases bleeding risk without reducing stroke incidence
• Most patients with NOAF will revert to sinus rhythm as critical illness resolves
• Survey of UK intensivists: 64% do not routinely anticoagulate NOAF

Exceptions — consider anticoagulation if:
• AF persists >48 hours
• High stroke risk with low bleeding risk
• AF continues beyond resolution of acute illness

If AF persists for weeks, reassess with [CHA₂DS₂-VASc scoring](#/calculator/cha2ds2vasc) as chronic AF management becomes appropriate.',
 '[3,8,9]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-cha2ds2vasc', 'afib-rvr', 'info', 5,
 'CHA₂DS₂-VASc Assessment',
 'ANTICOAGULATION FOR KNOWN/CHRONIC AF

Assess stroke risk using [CHA₂DS₂-VASc score](#/calculator/cha2ds2vasc):

Anticoagulation Recommendations:
• Score ≥2 (men) or ≥3 (women) → Anticoagulate (strong recommendation)
• Score 1 (men) or 2 (women) → Consider anticoagulation
• Score 0 (men) or 1 (women) → May omit anticoagulation

Preferred agents: [Apixaban](#/drug/apixaban/atrial fibrillation), [Rivaroxaban](#/drug/rivaroxaban/atrial fibrillation) (DOACs preferred over warfarin)

⚠️ If AF duration >48 hours and patient is NOT anticoagulated:
• Consider TEE to exclude left atrial appendage thrombus before cardioversion
• Or initiate anticoagulation for ≥3 weeks before elective cardioversion',
 '[1,3,10]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'afib-disposition', NULL, NULL, NULL, '[]'::jsonb, '[{"id":"cha2ds2vasc","label":"Calculate CHA₂DS₂-VASc"}]'::jsonb, 16)
;


-- MODULE 6: DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('afib-disposition', 'afib-rvr', 'result', 6,
 'A-Fib RVR — Disposition & Follow-Up',
 'DISPOSITION CONSIDERATIONS

• Continue rate control agent that achieved control
• Target resting HR <100–110 bpm for outpatient management
• Assess heart rate response during exertion (ambulatory monitoring or brisk walk)
• Ensure electrolytes are corrected (K⁺, Mg²⁺)
• Address underlying precipitants
• Cardiology follow-up for: new-onset AF, rhythm control consideration, AV node ablation candidacy
• For patients with refractory symptoms despite optimal medical therapy, AV node ablation with permanent pacemaker may be considered',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Disposition based on clinical stability and rate control achieved. Ensure anticoagulation addressed per [CHA₂DS₂-VASc](#/calculator/cha2ds2vasc). Arrange cardiology follow-up. Review [Discharge Instructions](#/info/afib-discharge) with patient before discharge.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 17)
;


-- 5. drugs (10 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('amiodarone', 'Amiodarone', 'Amiodarone hydrochloride', 'Class III antiarrhythmic (multichannel blocker)', 'IV / PO',
 '["A-Fib / A-Flutter rate control","A-Fib / A-Flutter rhythm control (cardioversion)","Ventricular tachycardia","Cardiac arrest (VF/pulseless VT)"]'::jsonb,
 '[{"indication":"A-Fib rate control","regimen":"Load: 150 mg IV over 10 min. Infusion: 1 mg/min x 6 hr, then 0.5 mg/min x 18 hr. May re-bolus 150 mg x2-3 PRN (total 150-450 mg boluses). Do not conclude failure without adequate re-bolusing."},{"indication":"A-Fib rhythm control (cardioversion)","regimen":"Load: 300 mg (or 5-7 mg/kg) IV over 30-60 min. Then 1 mg/min infusion. Total 24hr IV dose: 1,200-3,000 mg. Convert to PO 400 mg BID after >24hr IV, until 10g cumulative dose reached, then 200 mg daily maintenance.","weightCalc":{"dosePerKg":5,"unit":"mg","label":"Load (5 mg/kg)"}},{"indication":"Cardiac arrest (VF/pVT)","regimen":"300 mg IV/IO push. May repeat 150 mg x1."}]'::jsonb,
 '["Cardiogenic shock","Severe sinus node dysfunction without pacemaker","Second/third-degree AV block without pacemaker","Known hypersensitivity to iodine (contains iodine)"]'::jsonb,
 '["QT prolongation — monitor QTc, hold if QTc >500ms","Hepatotoxicity — check LFTs at baseline and periodically","Thyroid dysfunction (both hypo and hyper) — contains 37% iodine by weight","Pulmonary toxicity with chronic use — baseline CXR and PFTs recommended","Phlebitis with peripheral IV — use central line when possible for infusions >24hr","Potentiates warfarin — reduce warfarin dose by 30-50% when initiating"]'::jsonb,
 'Continuous telemetry during IV loading. QTc interval. LFTs, TFTs, CXR at baseline. For chronic use: TFTs, LFTs, PFTs, ophthalmologic exam every 6-12 months.',
 'Amiodarone is useful for critically ill patients due to relative hemodynamic stability compared to beta-blockers and CCBs. Achieves rate control in ~74% of patients. Chemical cardioversion may occur — continue infusion until critical illness resolves to prevent AF recurrence. Chronic use causes numerous side effects — plan transition to safer long-term agent (e.g., beta-blocker) after recovery.',
 NULL,
 '["Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for AF. J Am Coll Cardiol. 2024;83(1):109-279.","Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577.","Bosch NA, et al. Atrial Fibrillation in the ICU. Chest. 2018;154(6):1424-1434."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('apixaban', 'Apixaban', 'Apixaban', 'Direct oral anticoagulant (Factor Xa inhibitor)', 'PO',
 '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)"]'::jsonb,
 '[{"indication":"PE / DVT treatment","regimen":"10 mg twice daily × 7 days, then 5 mg twice daily × 3–6 months. Extended therapy: 5 mg or 2.5 mg twice daily."},{"indication":"Atrial fibrillation (stroke prevention)","regimen":"5 mg BID. Dose-reduce to 2.5 mg BID if ≥2 of: age ≥80, weight ≤60 kg, creatinine ≥1.5 mg/dL."}]'::jsonb,
 '[]'::jsonb,
 '["Severe renal impairment (CrCl <25 mL/min) — limited data","Moderate hepatic impairment (Child-Pugh B) — use with caution","Strong CYP3A4 and P-gp inhibitors/inducers — avoid concomitant use"]'::jsonb,
 NULL,
 'Single-drug oral therapy — no initial parenteral heparin required. Particularly convenient for outpatient PE management.',
 NULL,
 '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022.","Renner E, Barnes GD. Antithrombotic Management of VTE: JACC Focus Seminar. J Am Coll Cardiol. 2020."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('digoxin', 'Digoxin', 'Digoxin', 'Cardiac glycoside', 'IV / PO',
 '["A-Fib / A-Flutter rate control (adjunctive)","Heart failure with reduced EF"]'::jsonb,
 '[{"indication":"A-Fib rate control (acute)","regimen":"IV loading: 0.25 mg IV every 2 hours, up to 1.5 mg total. Onset: ~3 hours (vs 5 min for diltiazem). Slow onset makes it unsuitable as sole agent for acute rate control."},{"indication":"A-Fib rate control (maintenance)","regimen":"0.125-0.25 mg PO daily. Adjust for renal function and age."}]'::jsonb,
 '["Hypertrophic obstructive cardiomyopathy (HOCM)","WPW syndrome with atrial fibrillation","Ventricular tachycardia/fibrillation","Severe hypokalemia (increases toxicity risk)"]'::jsonb,
 '["Renal impairment — reduce dose, monitor levels (CrCl <50: reduce dose 50%)","Hypokalemia and hypomagnesemia potentiate toxicity","Post hoc analyses associate digoxin with increased mortality in AF — use at low doses","Limited exertional efficacy — slows primarily resting heart rate","Narrow therapeutic index — toxicity at levels >2.0 ng/mL","Drug interactions: amiodarone increases digoxin levels 70-100%"]'::jsonb,
 'Serum digoxin level (target 0.5-0.9 ng/mL for AF). Serum potassium, magnesium, creatinine. ECG for toxicity signs (ST scooping, PAT with block, bidirectional VT).',
 'Best used as adjunctive therapy when hypotension limits further titration of beta-blockers or CCBs. Particularly useful in patients with concurrent heart failure. Avoid as sole agent for acute rate control due to slow onset. Use at lowest effective dose given mortality concerns.',
 NULL,
 '["Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for AF. J Am Coll Cardiol. 2024;83(1):109-279.","Michaud GF, Stevenson WG. Atrial Fibrillation. N Engl J Med. 2021;384(4):353-361.","Ko D, et al. Atrial Fibrillation: A Review. JAMA. 2025;333(4):329-342."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('diltiazem', 'Diltiazem', 'Diltiazem hydrochloride', 'Nondihydropyridine calcium channel blocker', 'IV',
 '["A-Fib / A-Flutter rate control","Supraventricular tachycardia"]'::jsonb,
 '[{"indication":"A-Fib rate control (acute)","regimen":"Initial bolus: 0.25 mg/kg IV over 2 min (typically 20-25 mg). If inadequate response after 15 min, second bolus: 0.35 mg/kg IV over 2 min. Then continuous infusion: 5-15 mg/hr, titrate to heart rate.","weightCalc":[{"dosePerKg":0.25,"unit":"mg","label":"Initial bolus"},{"dosePerKg":0.35,"unit":"mg","label":"Second bolus (if needed)"}]}]'::jsonb,
 '["EF ≤40% or moderate-to-severe LV systolic dysfunction (Class 3: Harm)","Decompensated heart failure","Severe hypotension (SBP <90)","Sick sinus syndrome without pacemaker","Second/third-degree AV block without pacemaker","WPW with atrial fibrillation","Concurrent IV beta-blocker use"]'::jsonb,
 '["Hypotension — most common adverse effect, especially with continuous infusion","Obtain echo or check history for EF if unknown — CCBs are dangerous in HFrEF","Accumulation with prolonged infusions — monitor closely and titrate down when able","Negative inotropic effects may worsen borderline hemodynamics","Consider metoprolol over diltiazem in critically ill patients due to lower hypotension risk"]'::jsonb,
 'Continuous heart rate and blood pressure monitoring during IV infusion. Reassess hemodynamics frequently. Transition to oral rate control agent when stable.',
 'Achieves rate control more rapidly than digoxin or amiodarone (90% vs 74%, with faster time to HR <90). First-line for A-Fib rate control when EF >40%. Do NOT combine with IV beta-blockers — risk of synergistic hypotension and bradycardia.',
 NULL,
 '["Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for AF. J Am Coll Cardiol. 2024;83(1):109-279.","Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('esmolol', 'Esmolol', 'Esmolol hydrochloride', 'Ultra-short-acting beta-1 selective blocker', 'IV',
 '["A-Fib / A-Flutter rate control","Supraventricular tachycardia","Perioperative tachycardia/hypertension"]'::jsonb,
 '[{"indication":"A-Fib rate control","regimen":"Loading dose: 500 mcg/kg IV over 1 minute. Infusion: 50-200 mcg/kg/min, titrate by 50 mcg/kg/min every 4 min. May repeat loading dose with each infusion increase."}]'::jsonb,
 '["Severe sinus bradycardia","Heart block greater than first degree without pacemaker","Cardiogenic shock","Decompensated heart failure","WPW with atrial fibrillation"]'::jsonb,
 '["Hypotension — may occur especially at higher infusion rates","Must be given as continuous infusion — eliminated within 9 min of stopping","Use cautiously in patients on calcium channel blockers — risk of additive bradycardia/hypotension","Bronchospasm — theoretical risk, though beta-1 selectivity is lost at high doses"]'::jsonb,
 'Continuous heart rate and blood pressure monitoring during infusion. Effects resolve within minutes of discontinuation — ideal for titration.',
 'Ultra-short-acting beta-blocker (half-life ~9 min). Particularly useful when rapid titration or reversal is needed — if hypotension occurs, effects resolve within minutes of stopping infusion. Ideal for patients with uncertain hemodynamics or when testing beta-blocker tolerance before committing to longer-acting agents.',
 NULL,
 '["Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577.","Prystowsky EN, et al. Treatment of Atrial Fibrillation. JAMA. 2015;314(3):278-88."]'::jsonb,
 4)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('magnesium-sulfate', 'Magnesium Sulfate', 'Magnesium sulfate', 'Electrolyte / Antiarrhythmic adjunct', 'IV',
 '["A-Fib / A-Flutter adjunctive rate and rhythm control","Torsades de pointes","Hypomagnesemia","Eclampsia / Pre-eclampsia seizure prophylaxis","Hypomagnesemia / Hypokalemia adjunct"]'::jsonb,
 '[{"indication":"A-Fib (adjunctive)","regimen":"Bolus: 2-4 g IV over 15-30 min. For aggressive repletion: continuous infusion per institutional protocol. Target serum level ~3-4 mg/dL for antiarrhythmic effect. Most administered magnesium is renally excreted — continuous infusion may be needed to replete intracellular stores."},{"indication":"Torsades de pointes","regimen":"1-2 g IV over 5-60 min (faster for unstable patients)."},{"indication":"Hypomagnesemia / Hypokalemia (adjunct)","regimen":"2 g IV over 1 hour. Correct hypomagnesemia before potassium repletion — hypokalemia is refractory until Mg is repleted."}]'::jsonb,
 '["Severe renal failure (GFR <30 mL/min or oliguria) for continuous infusion — use intermittent boluses instead","Hypermagnesemia (>4 mg/dL)","Myasthenia gravis (may worsen weakness)"]'::jsonb,
 '["Monitor for hypermagnesemia: loss of deep tendon reflexes (first sign), respiratory depression, cardiac arrest","Check renal function before continuous infusion","Calcium gluconate 1g IV is the antidote for magnesium toxicity"]'::jsonb,
 'Serum magnesium levels every 6-8 hours during infusion. Deep tendon reflexes. Respiratory rate. Renal function.',
 'Excellent safety profile — one meta-analysis detected no reported adverse events. Blocks slow calcium channels in SA and AV nodes. Even when cardioversion does not occur, magnesium reduces heart rate and augments efficacy of other antiarrhythmics and DC cardioversion. In one RCT, continuous magnesium infusion was superior to amiodarone for new-onset AF. The combination of aggressive magnesium loading plus amiodarone achieved 90% cardioversion rate in critically ill patients.',
 NULL,
 '["Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for AF. J Am Coll Cardiol. 2024;83(1):109-279.","Moran JL, et al. Parenteral MgSO4 vs Amiodarone for Atrial Tachyarrhythmias. Crit Care Med. 1995;23(11):1816-24.","Bosch NA, et al. Atrial Fibrillation in the ICU. Chest. 2018;154(6):1424-1434."]'::jsonb,
 5)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('metoprolol', 'Metoprolol', 'Metoprolol tartrate (IV) / Metoprolol succinate (PO)', 'Beta-1 selective adrenergic blocker', 'IV / PO',
 '["A-Fib / A-Flutter rate control","Hypertension","Heart failure (compensated, oral succinate)","Post-MI"]'::jsonb,
 '[{"indication":"A-Fib rate control (acute)","regimen":"IV: 2.5-5 mg IV push over 2 min. Repeat every 5 min as needed, up to 15 mg total (3 doses)."},{"indication":"A-Fib rate control (maintenance)","regimen":"PO tartrate: 25-100 mg BID. PO succinate (Toprol XL): 25-200 mg daily."},{"indication":"ACS / NSTEMI (anti-ischemic)","regimen":"IV: 5 mg IV push over 2 min, repeat every 5 min × 3 doses (total 15 mg). Hold if HR <60 or SBP <100. PO: 25-50 mg PO q6h starting 15 min after last IV dose. Target HR: <70 bpm. Transition to metoprolol succinate 50-200 mg daily for long-term."}]'::jsonb,
 '["Severe sinus bradycardia (HR <50)","Heart block greater than first degree without pacemaker","Cardiogenic shock","Decompensated heart failure (acute)","WPW with atrial fibrillation"]'::jsonb,
 '["Safe in COPD — multiple studies demonstrate no adverse respiratory effects","Use cautiously in decompensated HF but safe in compensated HFrEF","May mask hypoglycemia symptoms in diabetic patients","Do NOT combine with IV calcium channel blockers","Cocaine/methamphetamine-associated ACS — avoid beta-blockers acutely (may worsen coronary vasospasm due to unopposed alpha stimulation). Use benzodiazepines and nitroglycerin instead.","Intermittent dosing naturally encourages dose-by-dose reassessment — advantage over continuous infusions in unstable patients"]'::jsonb,
 'Heart rate and blood pressure before each IV dose. Hold if SBP <90 or HR <55.',
 'First-line for A-Fib rate control (Class 1 recommendation). Preferred in patients with CAD or compensated HFrEF. Many critically ill patients develop AF due to increased sympathetic tone — beta-blockers address the underlying physiological problem. A retrospective ICU study found lower failure rates with metoprolol vs diltiazem.',
 NULL,
 '["Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for AF. J Am Coll Cardiol. 2024;83(1):109-279.","Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577.","Moskowitz A, et al. Management of AF with RVR in the ICU. Shock. 2017;48(4):436-440."]'::jsonb,
 6)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('procainamide', 'Procainamide', 'Procainamide hydrochloride', 'Class IA antiarrhythmic (sodium channel blocker)', 'IV',
 '["WPW with atrial fibrillation","Wide-complex tachycardia of uncertain origin","Atrial fibrillation (pharmacologic cardioversion — second-tier)"]'::jsonb,
 '[{"indication":"WPW + A-Fib / Wide-complex tachycardia","regimen":"Loading: 20-50 mg/min IV infusion until arrhythmia suppressed, hypotension occurs, QRS widens >50%, or max dose 17 mg/kg reached. Maintenance: 1-4 mg/min IV infusion."}]'::jsonb,
 '["QT prolongation (QTc >500 ms)","Torsades de pointes","Complete heart block without pacemaker","Systemic lupus erythematosus (drug may exacerbate)"]'::jsonb,
 '["Hypotension with rapid infusion — administer slowly","QRS and QT prolongation — stop if QRS widens >50% from baseline","Drug-induced lupus with chronic use","Reduce dose in renal impairment (active metabolite NAPA is renally cleared)","Monitor QTc continuously during loading"]'::jsonb,
 'Continuous ECG monitoring during loading. Blood pressure every 5 min. QRS width and QT interval. NAPA levels if chronic use.',
 'Key role in WPW + A-Fib where AV nodal blockers (beta-blockers, CCBs, digoxin, IV amiodarone) are contraindicated. Slows conduction through the accessory pathway. Also useful for wide-complex tachycardia of uncertain origin. Second-tier recommendation for pharmacologic cardioversion of AF per 2025 AHA guidelines.',
 NULL,
 '["Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577.","Panchal AR, et al. 2020 AHA Guidelines: Adult BLS and ALS. Circulation. 2020;142(16_suppl_2):S366-S468."]'::jsonb,
 7)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('rivaroxaban', 'Rivaroxaban', 'Rivaroxaban', 'Direct oral anticoagulant (Factor Xa inhibitor)', 'PO',
 '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)","CAD/PAD secondary prevention"]'::jsonb,
 '[{"indication":"PE / DVT treatment","regimen":"15 mg twice daily with food × 21 days, then 20 mg once daily with food × 3–6 months. Extended therapy: 20 mg or 10 mg once daily."},{"indication":"Atrial fibrillation (stroke prevention)","regimen":"20 mg daily with food (CrCl >50 mL/min). 15 mg daily with food (CrCl 15-50 mL/min). Avoid if CrCl <15 mL/min."}]'::jsonb,
 '[]'::jsonb,
 '["CrCl <30 mL/min — avoid (limited data, increased drug exposure)","Moderate hepatic impairment (Child-Pugh B) — use with caution","Must take with food (increases bioavailability by 39%)","Strong CYP3A4 and P-gp inhibitors/inducers — avoid concomitant use"]'::jsonb,
 NULL,
 'Single-drug oral therapy — no initial parenteral heparin required. Take with food to ensure adequate absorption.',
 NULL,
 '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022.","Freund Y, et al. Acute Pulmonary Embolism: A Review. JAMA. 2022."]'::jsonb,
 8)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('verapamil', 'Verapamil', 'Verapamil hydrochloride', 'Nondihydropyridine calcium channel blocker', 'IV',
 '["A-Fib / A-Flutter rate control","Supraventricular tachycardia"]'::jsonb,
 '[{"indication":"A-Fib rate control (acute)","regimen":"2.5-5 mg IV over 2 min. May repeat with 5-10 mg every 15-30 min as needed. Maximum total dose: 20 mg."}]'::jsonb,
 '["EF ≤40% or moderate-to-severe LV systolic dysfunction","Decompensated heart failure","Severe hypotension","Sick sinus syndrome without pacemaker","Second/third-degree AV block without pacemaker","WPW with atrial fibrillation","Concurrent IV beta-blocker use","Wide-complex tachycardia of uncertain origin"]'::jsonb,
 '["Hypotension — more common than with diltiazem","Negative inotropic effects — may worsen borderline hemodynamics","Randomized clinical trials examining verapamil for A-Fib are lacking","Diltiazem is generally preferred among nondihydropyridine CCBs"]'::jsonb,
 'Continuous heart rate and blood pressure monitoring. Assess hemodynamic response after each dose.',
 'Alternative to diltiazem when diltiazem is unavailable. Generally less preferred due to limited RCT evidence and similar contraindication profile. Same EF restriction as diltiazem: CONTRAINDICATED if EF ≤40%.',
 NULL,
 '["Wigginton JG, et al. 2025 AHA Guidelines: Adult Advanced Life Support. Circulation. 2025;152(16_suppl_2):S538-S577.","Prystowsky EN, et al. Treatment of Atrial Fibrillation. JAMA. 2015;314(3):278-88."]'::jsonb,
 9)
;


-- 6. info_pages (3 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('afib-discharge', 'Discharge Instructions', 'Atrial Fibrillation with Rapid Ventricular Response',
 '[{"heading":"Return to the ED Immediately If You Experience","body":"**Serious Warning Signs:**\n• Chest pain or pressure\n• Severe shortness of breath or difficulty breathing\n• Fainting or loss of consciousness\n• Severe dizziness or lightheadedness\n• Confusion or difficulty speaking\n• Weakness or numbness on one side of your body (signs of stroke)\n• Heart rate that feels extremely fast or irregular and does not improve with rest\n• Coughing up blood\n• Severe bleeding (especially if you are taking blood thinners)\n\n**Other Concerning Symptoms:**\n• Palpitations (racing or fluttering heartbeat) that are much worse than usual or do not go away\n• Swelling in your legs, ankles, or abdomen that is new or worsening\n• Persistent nausea or vomiting\n• Inability to take your prescribed medications"},{"heading":"What to Do at Home","body":"**Take Your Medications:**\n• Take all medications exactly as prescribed, including rate control medications (beta-blockers or calcium channel blockers), blood thinners (anticoagulants) if prescribed, and any other heart medications\n• Do not stop or change your medications without talking to your doctor first\n• Set reminders to help you remember to take your medications on time\n\n**Monitor Your Symptoms:**\n• Check your pulse regularly as instructed by your doctor\n• Rest and stay calm if you feel your heart racing\n• Keep a log of any symptoms you experience, including when they occur and how long they last\n\n**Lifestyle Modifications:**\n• Limit or avoid alcohol — it can trigger atrial fibrillation episodes\n• Avoid caffeine if it worsens your symptoms\n• Get adequate sleep and manage stress\n• Maintain a healthy weight\n• Stay hydrated but follow any fluid restrictions your doctor has given you"},{"heading":"Follow-Up Care","body":"**Appointments:**\n• Schedule follow-up with your primary care doctor or cardiologist within 1–2 weeks (or as directed)\n• Keep all scheduled appointments, even if you are feeling better\n• Bring a list of your current medications and any questions\n\n**Blood Work:**\n• If you are taking blood thinners, you may need regular blood tests to monitor their effectiveness\n• Follow your doctor’s instructions about when to have these tests done\n\n**Questions to Ask Your Doctor:**\n• What is my target heart rate?\n• How often should I check my pulse?\n• What activities are safe for me?\n• Do I need to make any changes to my diet?\n• When can I return to work or normal activities?"},{"heading":"Important Reminders","body":"• Atrial fibrillation increases your risk of stroke — this is why blood thinners may be prescribed\n• Even if you feel better, continue taking all medications as prescribed\n• Call your doctor’s office if you have questions or concerns that are not emergencies\n• Wear a medical alert bracelet if you are taking blood thinners"}]'::jsonb,
 '[{"num":1,"text":"Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for the Diagnosis and Management of Atrial Fibrillation. J Am Coll Cardiol. 2024;83(1):109-279."}]'::jsonb,
 true,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('afib-summary', 'A-Fib RVR Management Steps', 'Quick-reference for rate control, cardioversion, and anticoagulation',
 '[{"heading":"1. Initial Assessment","body":"• [Confirm A-Fib RVR on 12-lead ECG — identify precipitants](#/node/afib-start)\n• [Assess hemodynamic stability](#/node/afib-stability)"},{"heading":"2. Unstable — Cardiovert","body":"• [Screen for WPW — if yes, AV nodal blockers are CONTRAINDICATED](#/node/afib-unstable-wpw)\n• [Synchronized cardioversion 200J biphasic + sedation](#/node/afib-cardioversion-protocol)"},{"heading":"3. Stable — Rate Control","body":"• [Beta-blocker (Metoprolol) or CCB (Diltiazem) — do NOT combine](#/node/afib-stable-drugs)\n• [CCB contraindicated if EF ≤40% or decompensated HF](#/node/afib-stable-drugs)\n• [IV Magnesium as adjunct — blocks slow Ca channels at AV node](#/node/afib-stable-drugs)"},{"heading":"4. Refractory — Escalate","body":"• [Add IV Magnesium, Digoxin, or switch to Amiodarone](#/node/afib-refractory)\n• [Consider rhythm control if rate control fails](#/node/afib-rhythm-control)"},{"heading":"5. Anticoagulation","body":"• [NOAF — generally do NOT anticoagulate (will revert)](#/node/afib-noaf-anticoag)\n• [Known/Chronic AF — CHA₂DS₂-VASc score guides anticoagulation](#/node/afib-cha2ds2vasc)"},{"heading":"6. Disposition","body":"• [Continue agent that achieved rate control — target HR <100–110](#/node/afib-disposition)\n• [Cardiology follow-up for new-onset AF or refractory symptoms](#/node/afib-disposition)"}]'::jsonb,
 '[{"num":1,"text":"Joglar JA, et al. 2023 ACC/AHA/ACCP/HRS Guideline for Atrial Fibrillation. J Am Coll Cardiol. 2024."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('cardioversion-afib', 'Synchronized Cardioversion', 'Procedure for Atrial Fibrillation / Flutter',
 '[{"body":"Synchronized cardioversion is the definitive treatment for hemodynamically unstable A-Fib/Flutter and for WPW with atrial fibrillation. Success depends on energy selection, pad placement, synchronization, and pre/post-treatment with antiarrhythmics."},{"heading":"1. Preparation","body":"• Confirm synchronization is enabled on the defibrillator\n• Apply pads: anterior/lateral placement preferred (EPIC trial found superior to anterior/posterior) [1]\n• Hyperinflation may impair conduction — cardiovert at end-expiration if possible\n• If ventilated and cardioversion failing, briefly disconnect to promote chest deflation (if oxygenation allows)"},{"heading":"2. Sedation (Non-Intubated Patients)","body":"• Midazolam 3–5 mg IV bolus, then 2 mg IV q2min PRN to adequate sedation\n• Target: eyes closed, no response to gentle stimuli, sluggish response to loud commands\n• Alternative: MidaKet for patients resistant to midazolam\n• Flumazenil 0.5–1 mg IV available for reversal if adverse effects (hypoxemia, excessive somnolence, laryngospasm)"},{"heading":"3. Energy & Synchronization","body":"• Use 200J biphasic (maximal energy available) [2]\n• Rationale: No evidence that a single high-energy shock is more dangerous than low-energy. Higher initial energy reduces need for repeat cardioversion — critical in non-intubated patients where sedation may wear off.\n• Ensure shock delivery is synchronized to the QRS complex\n• If initial attempt unsuccessful, escalate energy and reconfirm pad contact"},{"heading":"4. Post-Cardioversion","body":"• Amiodarone 150 mg IV over 10 min, then 1 mg/min infusion to maintain sinus rhythm\n• IV Magnesium Sulfate 2–4 g to augment cardioversion success\n• Continue amiodarone until critical illness significantly improved — stopping early risks reversion to A-Fib (42% reversion rate in one study) [3]\n• Monitor for post-cardioversion bradycardia (especially if baseline HR was <100)"},{"heading":"Special Considerations","body":"• WPW + A-Fib: Cardioversion is first-line. Do NOT use AV nodal blockers (beta-blockers, CCBs, digoxin, IV amiodarone) [1][2]\n• Critically ill patients: Standalone DC cardioversion often fails — patients frequently revert to A-Fib. Pre/post-treatment with amiodarone + magnesium improves sustained conversion [3]\n• Anticoagulation: If AF duration >48 hours and not anticoagulated, consider TEE to exclude atrial thrombus before elective cardioversion"}]'::jsonb,
 '[{"num":1,"text":"Wigginton JG, et al. Part 9: Adult Advanced Life Support: 2025 AHA Guidelines for CPR and ECC. Circulation. 2025;152(16_suppl_2):S538-S577."},{"num":2,"text":"Panchal AR, et al. Part 3: Adult Basic and Advanced Life Support: 2020 AHA Guidelines for CPR and ECC. Circulation. 2020;142(16_suppl_2):S366-S468."},{"num":3,"text":"Bosch NA, Cimini J, Walkey AJ. Atrial Fibrillation in the ICU. Chest. 2018;154(6):1424-1434."}]'::jsonb,
 false,
 2)
;

COMMIT;
