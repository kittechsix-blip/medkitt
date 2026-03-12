-- =====================================================================
-- MedKitt — Subarachnoid Hemorrhage Consult: Supabase INSERT Statements
-- Generated: 2026-03-11
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'sah',
  'Subarachnoid Hemorrhage',
  'Recognition → Diagnostics → Severity → ED Management → Disposition',
  '1.0',
  25,
  'sah-start',
  '["Recognition","Diagnostics","Severity","ED Management","Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('neurology', 'sah', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('emergency-medicine', 'sah', NULL, NULL, NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (15 citations)
DELETE FROM tree_citations WHERE tree_id = 'sah';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('sah', 1, 'Godwin SA, Cherkas DS, Panagos PD, et al. Clinical policy: critical issues in the evaluation and management of adult patients presenting to the emergency department with acute headache. Ann Emerg Med. 2019;74(4):e41-e74.'),
('sah', 2, 'Connolly ES Jr, Rabinstein AA, Carhuapoma JR, et al. Guidelines for the management of aneurysmal subarachnoid hemorrhage: a guideline for healthcare professionals from the American Heart Association/American Stroke Association. Stroke. 2012;43(6):1711-1737.'),
('sah', 3, 'Diringer MN, Bleck TP, Claude Hemphill J 3rd, et al. Critical care management of patients following aneurysmal subarachnoid hemorrhage: recommendations from the Neurocritical Care Society''s Multidisciplinary Consensus Conference. Neurocrit Care. 2011;15(2):211-240.'),
('sah', 4, 'Perry JJ, Stiell IG, Sivilotti ML, et al. Clinical decision rules to rule out subarachnoid hemorrhage for acute headache. JAMA. 2013;310(12):1248-1255.'),
('sah', 5, 'Perry JJ, Stiell IG, Sivilotti ML, et al. Sensitivity of computed tomography performed within six hours of onset of headache for diagnosis of subarachnoid haemorrhage: prospective cohort study. BMJ. 2011;343:d4277.'),
('sah', 6, 'Dubosh NM, Bellolio MF, Rabinstein AA, et al. Sensitivity of early brain computed tomography to exclude aneurysmal subarachnoid hemorrhage: a systematic review and meta-analysis. Stroke. 2016;47(3):750-755.'),
('sah', 7, 'Hunt WE, Hess RM. Surgical risk as related to time of intervention in the repair of intracranial aneurysms. J Neurosurg. 1968;28(1):14-20.'),
('sah', 8, 'Frontera JA, Claassen J, Schmidt JM, et al. Prediction of symptomatic vasospasm after subarachnoid hemorrhage: the modified Fisher scale. Neurosurgery. 2006;59(1):21-27.'),
('sah', 9, 'Pickard JD, Murray GD, Illingworth R, et al. Effect of oral nimodipine on cerebral infarction and outcome after subarachnoid haemorrhage: British aneurysm nimodipine trial. BMJ. 1989;298(6674):636-642.'),
('sah', 10, 'Dorhout Mees SM, Rinkel GJ, Feigin VL, et al. Calcium antagonists for aneurysmal subarachnoid haemorrhage. Cochrane Database Syst Rev. 2007(3):CD000277.'),
('sah', 11, 'Molyneux A, Kerr R, Stratton I, et al. International Subarachnoid Aneurysm Trial (ISAT) of neurosurgical clipping versus endovascular coiling in 2143 patients with ruptured intracranial aneurysms: a randomised trial. Lancet. 2002;360(9342):1267-1274.'),
('sah', 12, 'Boogaarts HD, van Amerongen MJ, de Vries J, et al. Caseload as a factor for outcome in aneurysmal subarachnoid hemorrhage: a systematic review and meta-analysis. J Neurosurg. 2014;120(3):605-611.'),
('sah', 13, 'Perry JJ, Spacek A, Forbes M, et al. Is the combination of negative computed tomography result and negative lumbar puncture result sufficient to rule out subarachnoid hemorrhage? Ann Emerg Med. 2008;51(6):707-713.'),
('sah', 14, 'Larsen CC, Astrup J. Rebleeding after aneurysmal subarachnoid hemorrhage: a literature review. World Neurosurg. 2013;79(2):307-312.'),
('sah', 15, 'Perry JJ, Sivilotti MLA, Émond M, et al. Prospective Implementation of the Ottawa Subarachnoid Hemorrhage Rule and 6-Hour Computed Tomography Rule. Stroke. 2020;51(2):424-430.');

DELETE FROM decision_nodes WHERE tree_id = 'sah';

-- 4. decision_nodes (25 nodes)

-- MODULE 1: RECOGNITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-start', 'sah', 'info', 1,
 'Subarachnoid Hemorrhage',
 '[SAH Steps Summary](#/info/sah-summary) — quick reference.

Spontaneous SAH (sSAH) results from extravasation of blood into the CSF. **85% are caused by aneurysm rupture.** 10% are nonaneurysmal perimesencephalic hemorrhage (better prognosis).

• Incidence: ~10 per 100,000/year in the US
• Mortality: ~40% at 1 week; 10-15% die prehospital
• Misdiagnosis rate: up to 5% on initial ED visit
• Delayed or missed diagnosis → significantly worse outcomes

**Risk factors:** Hypertension, smoking, heavy alcohol use, cocaine, family history of aSAH, polycystic kidney disease, connective tissue disorders, female sex.',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-presentation', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-presentation', 'sah', 'info', 1,
 'Clinical Presentation',
 '**Classic:** Sudden-onset severe headache ("worst headache of my life") peaking within seconds — **thunderclap headache**. Neither sensitive nor specific for SAH.

• 10-16% of thunderclap headaches are SAH
• 70% present with headache alone, no focal symptoms
• **Normal neurologic exam in 75%** of aSAH patients
• Transient LOC in ~25%
• Vomiting in ~70%; neck stiffness in ~60%
• Seizures or cranial nerve palsies suggest serious pathology

**Atypical presentations:**
• Isolated neck/back pain (8% have no headache)
• General malaise without typical headache
• Sentinel/warning headache (10-43%) days to weeks before major SAH — **10x higher rebleeding risk**

**Key pearl:** No headache features reliably distinguish SAH from benign causes. Pain responding to analgesics does NOT exclude SAH.',
 '[1,4,13,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-ottawa', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-ottawa', 'sah', 'question', 1,
 'Ottawa SAH Rule',
 'For patients with **acute nontraumatic headache** reaching maximal intensity within 1 hour and a **normal neurologic examination**, apply the Ottawa SAH Rule.

**Further workup required if ANY present:**
• Age ≥40 years
• Neck pain or stiffness
• Witnessed loss of consciousness
• Onset during exertion
• Thunderclap headache (peaks within 1 minute)
• Limited neck flexion on examination

Sensitivity **100%** (validation studies). Specificity 27.5%.

2019 ACEP Clinical Policy supports using this rule to identify patients who may not require imaging.',
 '[1,4,15]'::jsonb, '[{"label":"≥1 criteria present","description":"Patient meets one or more Ottawa SAH Rule criteria","next":"sah-ct","urgency":"urgent"},{"label":"All criteria absent","description":"No criteria present — may avoid imaging per ACEP 2019","next":"sah-low-risk","urgency":"routine"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[{"id":"ottawa-sah","label":"Ottawa SAH Rule"}]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-low-risk', 'sah', 'result', 1,
 'Ottawa Rule Negative — Low Risk',
 'Patient meets **no Ottawa SAH Rule criteria** (age <40, no neck pain/stiffness, no LOC, no exertional onset, no thunderclap, normal neck flexion).

2019 ACEP Clinical Policy supports that these patients may not require imaging for SAH.

**However**, if clinical suspicion remains high based on overall presentation, proceeding with CT is still appropriate. The rule is designed to identify the lowest-risk cohort, not to replace clinical judgment.

**Discharge instructions:**
• Return immediately for worsening headache, new neurologic symptoms, or altered consciousness
• Follow up with primary care within 1-2 weeks',
 '[1,4,15]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Low-risk per Ottawa SAH Rule — may discharge with return precautions if clinical suspicion is low', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 3)
;


-- MODULE 2: DIAGNOSTICS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-ct', 'sah', 'info', 2,
 'Noncontrast CT Head',
 'The initial test for suspected sSAH is **noncontrast head CT**. CT sensitivity is time-dependent — blood is degraded and diluted by CSF circulation over time.

**CT sensitivity by timing:**
• Within 6 hours: **98.7%** (meta-analysis of 8,907 patients)
• Day 0: 92-100%
• Day 1: 86%
• Day 2: 76%
• Day 5: 58%

**Conditions for highest sensitivity (≤6h):**
• Third-generation or newer scanner
• Interpreted by attending radiologist
• Normal neurologic examination
• Normal hematocrit (anemia may make blood isodense with CSF)

**Key pearl:** A negative CT does not rule out SAH, especially with later presentations.',
 '[1,5,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-ct-result', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-ct-result', 'sah', 'question', 2,
 'CT Result',
 'Interpret the noncontrast head CT result in the context of **time from symptom onset.**

**CT positive:** Hyperdensity in the basal cisterns (typical aneurysmal pattern) or cerebral convexities (consider traumatic or convexal SAH).

**CT negative ≤6h:** In a prospective study of 3,132 patients, CT within 6 hours had 100% sensitivity. A meta-analysis reports 98.7% sensitivity with appropriate conditions.

**CT negative >6h:** Sensitivity decreases progressively — additional testing is needed.',
 '[5,6,13]'::jsonb, '[{"label":"CT positive for SAH","description":"Subarachnoid blood identified","next":"sah-confirmed","urgency":"critical"},{"label":"CT negative, ≤6h from onset","description":"Normal CT within 6 hours of headache onset","next":"sah-early-neg"},{"label":"CT negative, >6h from onset","description":"Normal CT more than 6 hours after headache onset","next":"sah-lp","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-early-neg', 'sah', 'question', 2,
 'CT Negative Within 6 Hours',
 'A negative CT within 6 hours of symptom onset has very high sensitivity for SAH, **but may not be 100%** depending on scanner generation and interpretation.

**ACEP 2019 Level B recommendation:** In patients presenting within 6 hours with a negative CT on a third-generation or newer scanner read by an attending radiologist, a normal neurologic exam, and no anemia, sSAH may be ruled out without LP.

**Consider proceeding to LP if:**
• High clinical suspicion despite negative CT
• Uncertain scanner generation
• CT read by non-radiologist
• Patient has anemia (Hct <30%)
• Symptom onset time uncertain',
 '[1,5,6]'::jsonb, '[{"label":"All criteria met — rule out SAH","description":"3rd-gen+ scanner, attending radiologist, normal neuro exam, normal Hct, low suspicion","next":"sah-negative-workup","urgency":"routine"},{"label":"Criteria not met or high suspicion","description":"Proceed to lumbar puncture for definitive evaluation","next":"sah-lp","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-lp', 'sah', 'info', 2,
 'Lumbar Puncture',
 '[LP Interpretation Guide](#/info/sah-lp-guide) — detailed reference.

For patients with negative CT and ongoing suspicion for SAH, LP is the next diagnostic step.

**Technique:**
• Patient in lateral recumbent position
• Measure **opening pressure** (elevated >20 cm H₂O in 60% of sSAH)
• Collect **4 serial tubes** of CSF
• Send last tube for cell count AND xanthochromia

**Key considerations:**
• Traumatic tap occurs in 10-15% of patients
• Xanthochromia takes up to 12 hours to develop
• If LP performed <12h after onset, accept either RBCs or xanthochromia as positive
• Finding normal CSF at any time point excludes SAH

**Opening pressure clues:** Elevated → SAH, cerebral venous thrombosis, or idiopathic intracranial hypertension. Decreased → spontaneous intracranial hypotension.',
 '[1,2,13]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-lp-results', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-lp-results', 'sah', 'question', 2,
 'LP Interpretation',
 '**Assess the CSF results:**

**Positive for SAH:**
• Xanthochromia (yellow color from hemoglobin breakdown) — highly suggestive, unlikely with traumatic tap
• Persistent RBCs constant across all 4 tubes (usually in thousands)

**Equivocal:**
• Partial clearing of RBCs (e.g., 3,000 in tube 1, 400 in tube 4) — may be traumatic tap OR SAH
• >10,000 RBCs in final tube = 6x more likely SAH

**Negative:**
• Zero RBCs in final tube = traumatic tap
• Normal CSF (no RBCs, no xanthochromia) = SAH excluded

**Visual xanthochromia:** Centrifuge last tube, compare against water on white background. Sensitivity 93%, specificity 95%, NPV 99%.',
 '[1,6,13]'::jsonb, '[{"label":"Xanthochromia or persistent RBCs","description":"CSF positive for subarachnoid hemorrhage","next":"sah-confirmed","urgency":"critical"},{"label":"Equivocal — partial clearing","description":"RBCs decrease but do not clear to zero","next":"sah-equivocal","urgency":"urgent"},{"label":"Normal CSF","description":"No RBCs and no xanthochromia — SAH excluded","next":"sah-negative-workup","urgency":"routine"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-equivocal', 'sah', 'question', 2,
 'Equivocal CSF Results',
 'With partial clearing of RBCs, the distinction between traumatic tap and true SAH can be difficult.

**Obtain CTA** to evaluate for aneurysm. CTA sensitivity for aneurysms is **97-99%** compared to digital subtraction angiography.

**Key findings:**
• Patients with bloody CSF and negative cerebrovascular imaging are at low risk for subsequent SAH
• CTA may identify incidental aneurysms (2% of population) — require neurosurgical consultation
• Aneurysm detection decreases for aneurysms <4 mm

**Consult neurosurgery** for shared decision-making regarding further workup or observation.',
 '[2,6]'::jsonb, '[{"label":"Aneurysm identified on CTA","description":"Vascular abnormality found — treat as confirmed SAH","next":"sah-confirmed","urgency":"critical"},{"label":"CTA negative","description":"No aneurysm found — low risk for subsequent SAH","next":"sah-negative-workup","urgency":"routine"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-negative-workup', 'sah', 'result', 2,
 'SAH Excluded',
 'SAH has been excluded by the diagnostic workup.

**Negative CT + negative LP** = SAH confidently ruled out, supported by multiple prospective studies with long-term follow-up (no subsequent SAH over 3+ years).

**Negative CT within 6h** (with appropriate conditions) = SAH ruled out per ACEP 2019 Level B recommendation.

**Consider alternative diagnoses:**
• Migraine or other primary headache syndrome
• Cerebral venous sinus thrombosis
• Idiopathic intracranial hypertension
• Spontaneous intracranial hypotension
• Meningitis
• Reversible cerebral vasoconstriction syndrome (RCVS)

**Discharge safely** with outpatient follow-up and return precautions for worsening symptoms.',
 '[1,13]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'SAH excluded — safe discharge with outpatient follow-up and clear return precautions', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 10)
;


-- MODULE 3: SEVERITY
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-confirmed', 'sah', 'info', 3,
 'SAH Confirmed',
 '**Subarachnoid hemorrhage is confirmed.** Immediately:

• **Obtain neurosurgical consultation** — arrange definitive therapy
• **Order CTA** (if not already done) to identify the aneurysm
• Begin ED management and monitoring

**CT hemorrhage patterns:**
• **Basal cisterns** — typical aneurysmal SAH
• **Cerebral convexities** — traumatic SAH, or convexal SAH (RCVS if <60y, cerebral amyloid angiopathy if >60y)
• **Perimesencephalic** — blood around midbrain with normal angiogram; 10% of sSAH, excellent prognosis (98% survive without deficits)

**Aneurysm locations** (85% of sSAH):
• 70% in anterior communicating, posterior communicating, or middle cerebral arteries
• Remainder in posterior circulation',
 '[2,3,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-grading', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-grading', 'sah', 'info', 3,
 'Clinical Severity Grading',
 '**Grade severity** to guide management and predict outcomes.

**Hunt & Hess Scale** — most widely used clinically:
• Grade 1: Asymptomatic or mild headache
• Grade 2: Severe headache, stiff neck, no focal deficits
• Grade 3: Drowsy, mild focal deficit
• Grade 4: Stupor, moderate-severe hemiparesis
• Grade 5: Coma, decerebrate posturing

Higher grade = higher mortality. Grades 4-5 historically 70-90% mortality, improved with modern care.

**Modified Fisher Scale** — predicts vasospasm risk from CT:
• Grade 0-1: Low vasospasm risk
• Grade 2-3: Moderate-high risk
• Grade 4: Thick SAH with IVH → highest vasospasm risk',
 '[7,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-vasospasm-risk', NULL, NULL, NULL, '[]'::jsonb, '[{"id":"hunt-hess","label":"Hunt & Hess Scale"},{"id":"modified-fisher","label":"Modified Fisher Scale"}]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-vasospasm-risk', 'sah', 'info', 3,
 'Vasospasm Risk Assessment',
 '**Cerebral vasospasm** is a delayed complication developing **days to 2 weeks** post-SAH, with peak incidence at **7-10 days**.

**Risk prediction (Modified Fisher Scale):**
• Thick clot and intraventricular hemorrhage → highest risk
• Thin SAH without IVH → lowest risk

**Vasospasm may be:**
• **Asymptomatic** — detected only on imaging
• **Symptomatic** — delayed neurologic deterioration causing significant morbidity

**Key management implications:**
• All confirmed SAH patients should receive [Nimodipine](#/drug/nimodipine/vasospasm prevention) for vasospasm prevention
• High-grade Fisher patients need closer monitoring and earlier neurosurgical intervention
• The VASOGRADE scale (combines WFNS + Modified Fisher) further stratifies risk as green/yellow/red',
 '[8,10]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-initial-mgmt', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;


-- MODULE 4: ED MANAGEMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-initial-mgmt', 'sah', 'info', 4,
 'Initial ED Management',
 '**Prioritize:** Airway management, hemodynamic monitoring, supportive care, and prevention of complications.

**General measures:**
• **Bed rest** with head of bed at 30° (facilitates venous drainage)
• **NPO** until surgical/endovascular treatment plan is decided
• **Continuous cardiac monitoring** — ECG changes in 50-100% of patients
• **Serial neurologic examinations** — monitor for deterioration
• **Adequate analgesia** — [Acetaminophen](#/drug/acetaminophen/headache) 1 g PO/IV q6h. Avoid NSAIDs (platelet dysfunction). Use opioids cautiously (interfere with neuro exam).
• **Antiemetics** as needed for comfort

**Outcomes are best** when care is provided by multidisciplinary teams at specialized high-volume centers (OR 0.77 for in-hospital mortality).',
 '[2,3,12]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-bp-control', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-bp-control', 'sah', 'info', 4,
 'Blood Pressure Management',
 '**Target: SBP <160 mmHg** until aneurysm is secured (AHA/ASA 2012).

Higher pressures may increase rebleeding risk, but aggressive lowering may compromise cerebral perfusion.

**Titratable IV agents:**
• [Labetalol](#/drug/labetalol/sah blood pressure) — 10-20 mg IV bolus over 1-2 min. Repeat or start infusion 2-8 mg/min. Max 300 mg/24h.
• [Nicardipine](#/drug/nicardipine/sah blood pressure) — 5 mg/hr IV, titrate by 2.5 mg/hr q5-15 min. Max 15 mg/hr.
• [Clevidipine](#/drug/clevidipine/sah blood pressure) — 1-2 mg/hr IV, double q90 sec to target. Ultra-short t½ (~1 min).

**Avoid nitroprusside** — increases intracranial pressure and risk of toxicity with prolonged infusion.

**Arterial line** recommended for continuous BP monitoring if extended ED stay anticipated.',
 '[2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-vasospasm-prev', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-vasospasm-prev', 'sah', 'info', 4,
 'Vasospasm Prevention — Nimodipine',
 '[Nimodipine](#/drug/nimodipine/vasospasm prevention) is the **only proven pharmacologic intervention** to reduce morbidity from vasospasm-related ischemia.

**Dosing:** 60 mg PO every 4 hours × 21 days
• If unable to swallow: crush and administer via nasogastric tube
• **No evidence for IV nimodipine** — oral route only
• Give to hemodynamically stable patients
• Part of comprehensive stroke center measures

**Evidence:** Cochrane review of 16 trials — risk ratio 0.67 (95% CI 0.55-0.81) for secondary ischemia. Landmark RCT (554 patients) established the standard regimen.

**Not effective for vasospasm prevention:**
• IV magnesium sulfate
• Statins (no benefit in recent large RCTs despite early promise)

**Note:** Can be initiated in the ED but does not necessarily need to start before transfer. Discuss with specialist team.',
 '[9,10]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-seizure-mgmt', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-seizure-mgmt', 'sah', 'info', 4,
 'Seizure Management',
 'Up to **20% of patients** have a seizure during or soon after aSAH. Seizures can cause rebleeding from an unsecured aneurysm.

**Key points:**
• **No RCTs** on prophylactic antiepileptic drugs (AEDs) in SAH
• **Phenytoin should be avoided** — associated with worse outcomes, functional decline, and cognitive disability
• If prophylaxis is used, prefer a **short course (<3 days)** — same benefit as longer courses without cumulative adverse effects

**If prophylaxis is initiated:**
• [Levetiracetam](#/drug/levetiracetam/sah seizure) 500 mg PO/IV BID — preferred due to better side-effect profile
• No hepatic metabolism, no drug interactions, no cardiac effects

**Reasonable to defer AED initiation** to the inpatient management service in patients who have not already seized. Use in accordance with local institutional protocols.',
 '[2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-rebleed-prev', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-rebleed-prev', 'sah', 'info', 4,
 'Rebleeding Prevention',
 'Rebleeding is **one of the most devastating complications** after aSAH, with the highest mortality of any complication.

• Cumulative incidence: **8-23%** in first 72 hours
• **50-90% of episodes occur within first 6 hours** after primary bleed
• Clinical signs: acute/worsening headache, decreased consciousness, loss of brainstem reflexes, posturing, respiratory arrest, seizures

**Risk factors for rebleeding:**
• High-grade SAH (Hunt & Hess 4-5)
• Larger aneurysms
• Prolonged time to surgery
• Sentinel/warning bleeds
• Catheter angiography

**Prevention strategies:**
• **Early definitive repair** — primary strategy (within 72 hours)
• **Blood pressure control** — SBP <160 mmHg
• **Antifibrinolytics** — short courses may reduce rebleeding; discuss with neurosurgical team before initiating

**Rapid diagnosis + early repair** remains the optimal approach.',
 '[2,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-cardiac-comp', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 18)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-cardiac-comp', 'sah', 'info', 4,
 'Cardiac Complications',
 '[SAH ECG Changes](#/info/sah-ecg-changes) — detailed reference.

Cardiac abnormalities are **common** following acute sSAH due to catecholamine surge and autonomic stimulation.

**ECG changes (50-100% of patients):**
• Nonspecific ST-segment and T-wave changes
• Prolonged QRS, U waves, prolonged QT interval
• ST elevations mimicking MI — coronary angiography typically normal
• Serious arrhythmias in <5% (associated with worse outcomes)

**Troponin:** Elevated in 20-40% of acute cases. Indicates cardiopulmonary complications and worse outcomes.

**Neurogenic stunned myocardium (Takotsubo):**
• Acutely depressed EF (can be as low as 20%)
• Apical akinesis/ballooning with normal coronary arteries
• Transient — most recover over several weeks
• May present with pulmonary edema and ACS symptoms

**Management:** SAH is a **contraindication to thrombolytics and anticoagulants**. Focus on the primary neurologic insult while supporting cardiac dysfunction.',
 '[2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-definitive', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;


-- MODULE 5: DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-definitive', 'sah', 'info', 5,
 'Definitive Aneurysm Repair',
 '**Vascular imaging:** Cerebral angiography (DSA) is the gold standard for preoperative planning. CTA has 97-99% sensitivity. Angiography may be negative in 10-20% (perimesencephalic hemorrhage, vasospasm, thrombosed aneurysm).

**Two approaches to aneurysm repair:**

**Endovascular coiling:**
• ISAT trial (2,143 patients) — improved outcomes vs clipping
• Slightly higher rebleeding risk
• Increasing use as first-line approach

**Microvascular clipping:**
• Higher seizure risk
• May be necessary for certain aneurysm anatomies

**Timing:** Early treatment within 72 hours is the common approach.

The choice depends on **aneurysm anatomy, clinician expertise, and patient factors** — best made by a multidisciplinary team.',
 '[2,11]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-special-pop', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 20)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-special-pop', 'sah', 'info', 5,
 'Special Populations',
 '**Pregnant/Postpartum Women:**
• Pregnancy and postpartum are hypercoagulable states
• Also consider: ischemic stroke, cerebral venous thrombosis, RCVS, pre-eclampsia, PRES
• Management principles are the same

**Anticoagulated Patients:**
• Reverse therapeutic anticoagulation in the acute setting
• **Do NOT reverse antiplatelet agents** unless neurosurgical procedure is planned — transfusion without benefit increases mortality

**Perimesencephalic Hemorrhage:**
• 10% of sSAH; blood confined around midbrain on CT
• Normal angiogram required (DSA is test of choice)
• **Excellent prognosis** — 98% survive without deficits
• Fewer complications than aSAH

**Acute Clinical Deterioration:**
• Repeat CT immediately to identify cause
• Possible causes: rebleeding, cerebral infarction, acute hydrocephalus, subdural extension
• These declines are potentially treatable — early identification is key',
 '[2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'sah-dispo', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 21)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-dispo', 'sah', 'question', 5,
 'Disposition',
 'All patients with confirmed SAH require **ICU admission**, preferably a neurointensive care unit, for continuous monitoring until definitive aneurysm repair.

**Better outcomes at high-volume centers** — meta-analysis of 36,000+ patients: reduction in mortality (OR 0.77, 95% CI 0.60-0.97).

**Transfer considerations:**
• Average 5.2 hours from diagnosis to arrival at neurosurgical center
• 90% arrive without significant GCS deterioration
• Air transport is safe and effective
• Prearranged interfacility agreements facilitate efficient transfer',
 '[2,12]'::jsonb, '[{"label":"Transfer to specialized center","description":"Requires transfer to a high-volume center with neurosurgical/endovascular capability","next":"sah-transfer","urgency":"critical"},{"label":"At specialized center","description":"Already at a center with neurosurgical ICU and repair capabilities","next":"sah-icu","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 22)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-transfer', 'sah', 'result', 5,
 'Transfer to High-Volume Center',
 '**Arrange emergent transfer** to a center with:
• Neurosurgical ICU
• Both surgical (clipping) and endovascular (coiling) capabilities
• Multidisciplinary neurovascular team

**Pre-transfer management:**
• Secure airway if GCS ≤8
• Continuous cardiac monitoring and BP management (SBP <160)
• Start [Nimodipine](#/drug/nimodipine/vasospasm prevention) 60 mg PO q4h if hemodynamically stable
• Communicate Hunt & Hess grade, Fisher grade, and CT findings to receiving team
• NPO for potential procedural intervention
• Bring all imaging on disc or ensure electronic transfer

**Transfer is generally safe** — 90% of patients arrive without significant clinical deterioration.',
 '[2,12]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Emergent transfer to high-volume neurosurgical center for definitive aneurysm repair and neurointensive care', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 23)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('sah-icu', 'sah', 'result', 5,
 'Neuro ICU Admission',
 '**Admit to neurointensive care unit** for:
• Continuous hemodynamic and neuro monitoring
• Definitive aneurysm repair (within 72 hours)
• Vasospasm surveillance (peak risk days 7-10)
• Management of secondary complications

**Ongoing ED management until bed available:**
• BP target SBP <160 with titratable IV agents
• [Nimodipine](#/drug/nimodipine/vasospasm prevention) 60 mg PO q4h
• Serial neuro checks q1h
• NPO status maintained
• Adequate analgesia and antiemetics
• Watch for clinical deterioration — repeat CT immediately if decline

**Prognosis:** In-hospital mortality >30% even at high-volume centers. Aggressive approaches may still be warranted in severe cases (Hunt & Hess 4-5) given improved modern outcomes.',
 '[2,3,12]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Neurointensive care admission with definitive aneurysm repair within 72 hours and vasospasm monitoring for 14 days', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 24)
;


-- 5. drugs (2 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('nimodipine', 'Nimodipine (Nymalize)', 'Nimodipine', 'Dihydropyridine calcium channel blocker', 'PO',
 '["SAH vasospasm prevention"]'::jsonb,
 '[{"indication":"SAH vasospasm prevention","regimen":"60 mg PO every 4 hours × 21 days. If unable to swallow, crush and administer via nasogastric tube. No evidence for IV administration. Give to hemodynamically stable patients. Hold for hypotension (SBP <90)."}]'::jsonb,
 '["Hypotension (SBP <90)","Severe hepatic impairment","Strong CYP3A4 inhibitors"]'::jsonb,
 '["Monitor blood pressure closely — can cause hypotension","Administer at least 1 hour before or 2 hours after meals","Do NOT administer IV — severe hypotension and cardiac arrest reported with inadvertent IV administration of oral capsules","Hepatic impairment — reduce dose or increase interval"]'::jsonb,
 'Blood pressure every 1-2 hours during initiation. Watch for hypotension, especially when combined with other antihypertensives.',
 'Only calcium channel blocker proven to improve outcomes after SAH. Cochrane review (16 trials): RR 0.67 for secondary ischemia. Does not directly prevent vasospasm but reduces ischemic injury. Landmark British Aneurysm Nimodipine Trial (554 patients) established the 60 mg q4h regimen.',
 NULL,
 '["Pickard JD, et al. Effect of oral nimodipine on cerebral infarction and outcome after subarachnoid haemorrhage. BMJ. 1989;298(6674):636-642.","Dorhout Mees SM, et al. Calcium antagonists for aneurysmal subarachnoid haemorrhage. Cochrane Database Syst Rev. 2007(3):CD000277."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('acetaminophen', 'Acetaminophen (Tylenol)', 'Acetaminophen', 'Non-opioid analgesic / Antipyretic', 'PO / IV',
 '["Headache / Analgesia","Fever","Pediatric fever / pain"]'::jsonb,
 '[{"indication":"Headache / Analgesia","regimen":"1000 mg PO or IV every 6 hours. Max 4000 mg/24h (2000 mg/24h in hepatic impairment or chronic alcohol use). IV administered over 15 minutes."},{"indication":"Pediatric fever / pain","regimen":"15 mg/kg PO/PR every 4-6 hours. Max 75 mg/kg/day (not to exceed 4000 mg/day).","weightCalc":{"dosePerKg":15,"unit":"mg","maxDose":1000}}]'::jsonb,
 '["Severe hepatic impairment or active liver disease","Known hypersensitivity"]'::jsonb,
 '["Hepatotoxicity at supratherapeutic doses (>4 g/day)","Reduce max dose to 2 g/day in chronic alcohol use or hepatic impairment","IV formulation: weight-based dosing for patients <50 kg (15 mg/kg, max 750 mg/dose)"]'::jsonb,
 'LFTs if prolonged use or hepatic risk factors. Serum level if overdose suspected.',
 'First-line analgesic for SAH-associated headache. Preferred over NSAIDs (impair platelet function) and opioids (confound neurologic examination). IV onset 5-10 min vs PO 30-60 min.',
 NULL,
 '["Connolly ES Jr, et al. AHA/ASA Guidelines for management of aneurysmal subarachnoid hemorrhage. Stroke. 2012;43(6):1711-1737."]'::jsonb,
 1)
;


-- 5b. drugs — UPDATE existing entries (4 drugs)
-- Updating Labetalol with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute stroke BP management (pre/post thrombolysis)","Hypertensive emergency","Preeclampsia/eclampsia"]'::jsonb,
  dosing = '[{"indication":"Pre-thrombolysis BP (target <185/110)","regimen":"10–20 mg IV bolus over 1–2 min. May repeat once. If BP still >185/110 after 2 doses, consider nicardipine infusion. Do NOT proceed with thrombolysis if BP remains uncontrolled."},{"indication":"Post-thrombolysis BP (target <180/105 × 24h)","regimen":"10 mg IV bolus, then 2–8 mg/min continuous infusion. Titrate to maintain BP <180/105. Max 300 mg/24h."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"10–20 mg IV bolus over 1–2 min. May repeat every 10–15 min. If repeated boluses needed, start infusion at 2–8 mg/min. Target SBP 130–150. Avoid SBP <130 or drops >70 mmHg in first hour. Max 300 mg/24h."},{"indication":"SAH blood pressure control (target SBP <160)","regimen":"10-20 mg IV bolus over 1-2 min. May repeat every 10-15 min. If repeated boluses needed, start infusion at 2-8 mg/min. Target SBP <160 mmHg until aneurysm is secured. Max 300 mg/24h. Avoid nitroprusside (increases ICP)."}]'::jsonb,
  contraindications = '["Severe bradycardia (HR <60)","Heart block greater than first degree without pacemaker","Cardiogenic shock or decompensated HF","Severe reactive airway disease / status asthmaticus","Pheochromocytoma (without prior alpha-blockade)"]'::jsonb,
  cautions = '["Bronchospasm — beta-2 blockade at higher doses may precipitate bronchospasm in asthma/COPD","Bradycardia — monitor HR; hold if HR <55","Hepatotoxicity — rare idiosyncratic reaction; monitor LFTs if prolonged use","Orthostatic hypotension — keep patient supine during IV administration"]'::jsonb,
  monitoring = 'Continuous BP monitoring (arterial line preferred). Heart rate. Neuro checks every 15 min during active titration.',
  notes = 'First-line IV antihypertensive for acute stroke per AHA/ASA guidelines. Onset: 2–5 min IV. Duration: 2–4 hours. Alpha:beta blockade ratio is ~1:7 (predominantly beta). Does not increase intracranial pressure. Preferred over nitroprusside (which can raise ICP).',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Whelton PK, et al. 2017 ACC/AHA Guideline for Prevention, Detection, Evaluation, and Management of High Blood Pressure. J Am Coll Cardiol. 2018;71(19):e127-e248."]'::jsonb
WHERE id = 'labetalol';

-- Updating Nicardipine (Cardene) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute stroke BP management (pre/post thrombolysis)","Hypertensive emergency","Perioperative hypertension"]'::jsonb,
  dosing = '[{"indication":"Pre-thrombolysis BP (target <185/110)","regimen":"5 mg/hr IV infusion. Titrate by 2.5 mg/hr every 5–15 min. Max 15 mg/hr. Once target achieved, decrease to 3 mg/hr and titrate to maintain."},{"indication":"Post-thrombolysis BP (target <180/105 × 24h)","regimen":"5 mg/hr IV infusion, titrate by 2.5 mg/hr every 5–15 min to maintain BP <180/105. Max 15 mg/hr."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"5 mg/hr IV infusion. Titrate by 2.5 mg/hr every 5–15 min. Target SBP 130–150. More widely available and less expensive than clevidipine. Monitor closely — overshoot hypotension possible. Avoid SBP <130 or drops >70 mmHg in first hour. Max 15 mg/hr."},{"indication":"SAH blood pressure control (target SBP <160)","regimen":"5 mg/hr IV infusion. Titrate by 2.5 mg/hr every 5-15 min. Target SBP <160 mmHg. Max 15 mg/hr. Preferred when beta-blocker contraindicated."}]'::jsonb,
  contraindications = '["Advanced aortic stenosis","Hypersensitivity to nicardipine or other dihydropyridine CCBs"]'::jsonb,
  cautions = '["Reflex tachycardia — may need to combine with beta-blocker","Peripheral phlebitis — change IV site every 12h or use central line","Hepatic impairment — reduce dose (extensively hepatically metabolized)","Transition to oral antihypertensive when stable — onset of oral agent overlaps with nicardipine wean"]'::jsonb,
  monitoring = 'Continuous arterial BP monitoring recommended. Heart rate. IV site inspection every 4–6h (phlebitis risk).',
  notes = 'Second-line to labetalol for acute stroke BP management. Preferred when beta-blocker contraindicated (asthma, bradycardia, HF). Onset: 5–10 min. Does not increase ICP. Arterial-selective vasodilator. More predictable dose-response than labetalol for continuous infusion.',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Liu-Deryke X, et al. Management of Hypertension in Acute Ischemic Stroke. Ann Pharmacother. 2006;40(12):2234-46."]'::jsonb
WHERE id = 'nicardipine';

-- Updating Clevidipine (Cleviprex) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute hypertension in stroke (pre/post thrombolysis)","Perioperative hypertension","Hypertensive emergency"]'::jsonb,
  dosing = '[{"indication":"Acute stroke BP management","regimen":"Start 1–2 mg/hr IV. Double dose every 90 seconds until target BP achieved. Usual maintenance: 4–6 mg/hr. Max 21 mg/hr (or 1000 mL per 24h due to lipid load)."},{"indication":"ICH blood pressure control (target SBP 130–150)","regimen":"Start 1–2 mg/hr IV. Double every 90 sec until SBP 130–150 mmHg. Usual maintenance 4–6 mg/hr. Max 21 mg/hr. Smoothest titration agent — ultra-short t½ (~1 min). Avoid SBP <130 or drops >70 mmHg in first hour."},{"indication":"SAH blood pressure control (target SBP <160)","regimen":"Start 1-2 mg/hr IV. Double every 90 sec until SBP <160 mmHg. Usual maintenance 4-6 mg/hr. Max 21 mg/hr. Ultra-short t½ (~1 min) allows precise titration."}]'::jsonb,
  contraindications = '["Severe aortic stenosis","Defective lipid metabolism (e.g., pathologic hyperlipidemia, lipoid nephrosis, acute pancreatitis with hyperlipidemia)","Allergy to soy or egg products (lipid emulsion vehicle)"]'::jsonb,
  cautions = '["Lipid emulsion vehicle — contributes 2 kcal/mL to caloric intake","No preservative — must be used within 12 hours of puncture","Rebound hypertension possible if discontinued abruptly — transition to oral agent","Reflex tachycardia may occur"]'::jsonb,
  monitoring = 'Continuous arterial BP monitoring recommended. Heart rate. Lipid panel if prolonged use >24h.',
  notes = 'Ultra-short half-life (~1 min) allows precise, rapid BP titration. Achieves target BP faster than nicardipine in clinical trials. Arterial-selective vasodilator — reduces afterload without venodilation. Does not reduce cerebral blood flow. Consider when nicardipine is unavailable or faster titration is needed.',
  citations = '["Powers WJ, et al. Guidelines for the Early Management of Acute Ischemic Stroke: 2019 Update. Stroke. 2019;50(12):e344-e418.","Pollack CV, et al. Clevidipine for Acute Hypertension: A Systematic Review and Meta-Analysis. Crit Care Med. 2019."]'::jsonb
WHERE id = 'clevidipine';

-- Updating Levetiracetam (Keppra) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Seizure treatment in ICH","Status epilepticus (adjunct)","Seizure disorders","Status epilepticus (ESETT 2nd-line)"]'::jsonb,
  dosing = '[{"indication":"ICH seizure treatment","regimen":"20 mg/kg IV (max 3000 mg) as loading dose over 15 min. Maintenance: 500–1500 mg IV/PO q12h. Preferred over phenytoin in ICH — fewer side effects and drug interactions.","weightCalc":{"dosePerKg":20,"unit":"mg","maxDose":3000,"label":"Loading dose"}},{"indication":"Status Epilepticus — 2nd line (ESETT)","regimen":"60 mg/kg IV (max 4500 mg) over 10-15 min. ESETT trial: 47% seizure termination (equivalent to fosphenytoin and valproate). Fewest drug interactions, no cardiac effects, safe in pregnancy. Preferred 2nd-line in pregnant patients (89% of neurologists).","weightCalc":{"dosePerKg":60,"unit":"mg","maxDose":4500,"label":"SE loading dose (ESETT)"}},{"indication":"SAH seizure prophylaxis","regimen":"500 mg PO/IV BID. Short course (<3 days) preferred. Phenytoin should be avoided in SAH — associated with worse outcomes, functional decline, and cognitive disability. Reasonable to defer to inpatient team if patient has not seized."}]'::jsonb,
  contraindications = '["Hypersensitivity to levetiracetam"]'::jsonb,
  cautions = '["Behavioral changes (irritability, agitation) — more common at higher doses","Reduce dose in renal impairment (CrCl <80 mL/min)","Suicidal ideation risk — FDA black box warning for all antiepileptics"]'::jsonb,
  monitoring = 'Seizure frequency, mental status, renal function. Drug levels not routinely needed (poor correlation with efficacy).',
  notes = 'Preferred first-line antiepileptic in neurocritical care. No hepatic metabolism, no drug interactions with warfarin/DOACs, no cardiac effects. Phenytoin should be avoided in ICH — associated with worse outcomes, numerous drug interactions, and cardiac toxicity.',
  citations = '["Greenberg SM, et al. 2022 Guideline for the Management of Patients With Spontaneous Intracerebral Hemorrhage. Stroke. 2022;53(7):e282-e361.","Naidech AM, et al. Anticonvulsant Use and Outcomes After Intracerebral Hemorrhage. Stroke. 2009;40(12):3810-3815."]'::jsonb
WHERE id = 'levetiracetam';


-- 6. info_pages (3 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('sah-summary', 'SAH Steps Summary', 'Subarachnoid Hemorrhage — Quick Reference',
 '[{"heading":"Recognition","body":"• [Identify thunderclap headache and risk factors](#/node/sah-presentation)\n• [Apply Ottawa SAH Rule — screen for low-risk patients](#/node/sah-ottawa)"},{"heading":"Diagnostic Workup","body":"• [Obtain noncontrast CT head — sensitivity is time-dependent](#/node/sah-ct)\n• [If CT negative ≤6h: may rule out SAH if criteria met](#/node/sah-early-neg)\n• [If CT negative >6h: proceed to lumbar puncture](#/node/sah-lp)\n• [Interpret LP — xanthochromia, RBC analysis](#/node/sah-lp-results)"},{"heading":"Severity Grading","body":"• [Confirm SAH — order CTA, consult neurosurgery](#/node/sah-confirmed)\n• [Grade with Hunt & Hess and Modified Fisher scales](#/node/sah-grading)"},{"heading":"ED Management","body":"• [Initial care — bed rest, HOB 30°, NPO, cardiac monitoring](#/node/sah-initial-mgmt)\n• [BP control — target SBP <160 with titratable IV agents](#/node/sah-bp-control)\n• [Start nimodipine 60 mg PO q4h for vasospasm prevention](#/node/sah-vasospasm-prev)\n• [Seizure precautions — levetiracetam if needed, avoid phenytoin](#/node/sah-seizure-mgmt)\n• [Monitor for rebleeding — highest risk in first 6 hours](#/node/sah-rebleed-prev)\n• [Watch for cardiac complications — ECG changes, troponin, Takotsubo](#/node/sah-cardiac-comp)"},{"heading":"Disposition","body":"• [Definitive repair — coiling vs clipping within 72 hours](#/node/sah-definitive)\n• [Transfer to high-volume center or admit to neuro ICU](#/node/sah-dispo)"}]'::jsonb,
 '[{"num":1,"text":"Connolly ES Jr, et al. AHA/ASA Guidelines for management of aneurysmal subarachnoid hemorrhage. Stroke. 2012;43(6):1711-1737."},{"num":2,"text":"Diringer MN, et al. NCS Critical care management after aSAH. Neurocrit Care. 2011;15(2):211-240."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('sah-lp-guide', 'LP Interpretation Guide', 'CSF Analysis for Subarachnoid Hemorrhage',
 '[{"heading":"Technique","body":"• Patient in **lateral recumbent position** for accurate opening pressure\n• Measure **opening pressure** — elevated (>20 cm H₂O) in 60% of SAH patients\n• Collect **4 serial tubes** of CSF\n• Send last tube for cell count AND xanthochromia assessment\n• Traumatic tap rate: 10-15% of all LPs"},{"heading":"RBC Analysis","body":"• **Zero RBCs in final tube** = traumatic tap (not SAH)\n• **Persistent RBCs constant across tubes 1-4** (usually thousands) = likely SAH\n• **Partial clearing** (e.g., 3,000→400) = equivocal — may be traumatic tap OR SAH\n• **>10,000 RBCs in final tube** = 6× more likely to be SAH than <100 RBCs [1]\n• RBC count is time-dependent — may clear within 48 hours as CSF circulates\n• No absolute cutoff threshold exists; aneurysm rupture reported with only a few hundred cells"},{"heading":"Xanthochromia","body":"• Yellow color from hemoglobin breakdown (oxyhemoglobin → methemoglobin → bilirubin)\n• Bilirubin formation is **enzyme-dependent and only occurs in vivo** — highly suggestive of SAH\n• Takes **up to 12 hours** to develop; lasts at least 2 weeks\n• Only 20% have visual xanthochromia if tapped within 6 hours\n• **All patients tapped 12h–2 weeks** after SAH will have xanthochromia [2]\n\n**Visual detection method:**\n• Rapidly centrifuge the last tube of CSF\n• Compare against identical tube of water on a white background\n• Yellowish hue = positive\n• Sensitivity 93%, specificity 95%, NPV 99%"},{"heading":"False Positives for Xanthochromia","body":"• Elevated CSF protein (>150 mg/dL)\n• Hyperbilirubinemia (serum bilirubin >10-15 mg/dL)\n• Traumatic tap with delayed processing (in vitro hemolysis)\n• Prior SAH (up to 2-4 weeks)\n• Carotenoids, rifampin, melanoma"},{"heading":"Timing Considerations","body":"• **<12 hours from onset:** Xanthochromia may not yet be present — accept RBCs as positive finding\n• **12 hours to 2 weeks:** Both RBCs and xanthochromia should be present if SAH\n• **>2 weeks:** Xanthochromia may no longer be present\n• Finding **normal CSF at any time point** successfully excludes SAH\n• Some authors recommend waiting 12 hours for LP, but early LP with either RBCs or xanthochromia as positive is also acceptable"}]'::jsonb,
 '[{"num":1,"text":"Czuczman AD, et al. Interpreting red blood cells in lumbar puncture: distinguishing true subarachnoid hemorrhage from traumatic tap. Acad Emerg Med. 2013;20(3):247-256."},{"num":2,"text":"Vermeulen M, et al. Xanthochromia after subarachnoid haemorrhage needs no revisitation. J Neurol Neurosurg Psychiatry. 1989;52(7):826-828."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('sah-ecg-changes', 'ECG Changes in SAH', 'Cardiac Manifestations of Subarachnoid Hemorrhage',
 '[{"heading":"Mechanism","body":"• **Catecholamine surge** from autonomic stimulation causes subendocardial ischemia\n• Neurocardiogenic mechanism — distinct from coronary thrombosis\n• Coronary angiography is typically normal despite ischemic ECG changes"},{"heading":"Common ECG Findings (50-100% of patients)","body":"• Nonspecific **ST-segment and T-wave changes** (most common)\n• **Prolonged QT interval**\n• Prolonged QRS complexes\n• **U waves**\n• ST elevations **mimicking acute MI**\n• Deep T-wave inversions (\"cerebral T waves\")\n• These changes are usually **benign and transient**"},{"heading":"Arrhythmias","body":"• Serious arrhythmias in **<5% of patients**\n• Associated with worse outcomes when present\n• Sinus bradycardia, atrial fibrillation, ventricular tachycardia reported\n• Continuous cardiac monitoring is essential"},{"heading":"Troponin","body":"• Elevated in **20-40%** of acute SAH cases\n• Indicates cardiopulmonary complications\n• Associated with worse outcomes\n• Does NOT necessarily indicate acute coronary syndrome"},{"heading":"Neurogenic Stunned Myocardium (Takotsubo)","body":"• Also called **stress-induced cardiomyopathy**\n• Acutely depressed ejection fraction (can be **as low as 20%**)\n• Left ventricular **apical akinesis or ballooning**\n• Occurs with **normal coronary arteries**\n• **Transient** — most patients recover function over several weeks\n• May present with pulmonary edema and symptoms mimicking ACS\n• Management: support cardiac dysfunction while focusing on primary neurologic insult"},{"heading":"Key Management Points","body":"• SAH is a **contraindication to thrombolytics and anticoagulants**\n• Treat suspected myocardial ischemia conventionally (except thrombolytics/anticoagulation)\n• Focus management on the primary neurologic insult\n• Cardiac dysfunction is usually transient and supportive care is sufficient"}]'::jsonb,
 '[{"num":1,"text":"Frontera JA, et al. Cardiac arrhythmias after subarachnoid hemorrhage: risk factors and impact on outcome. Cerebrovasc Dis. 2008;26(1):71-78."},{"num":2,"text":"Naidech AM, et al. Cardiac troponin elevation, cardiovascular morbidity, and outcome after subarachnoid hemorrhage. Circulation. 2005;112(18):2851-2856."}]'::jsonb,
 false,
 2)
;

COMMIT;
