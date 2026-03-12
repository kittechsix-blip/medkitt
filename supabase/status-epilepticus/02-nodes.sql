BEGIN;
-- 4. decision_nodes (26 nodes)

-- MODULE 1: RECOGNITION & STABILIZATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-start', 'status-epilepticus', 'info', 1,
 'Status Epilepticus',
 '[SE Steps Summary](#/info/se-summary) — time-critical escalating treatment pathway.

**Status epilepticus (SE)** is defined as a seizure lasting >5 minutes or recurrent seizures without recovery between episodes.

SE that persists despite first-line and second-line treatments often necessitates intubation and anesthetic infusions. Underrecognition and delays in treatment increase morbidity and mortality.

**Key principle:** Benzodiazepines become less effective the longer SE persists — GABAA receptors are internalized from the cell surface during prolonged seizure activity. Early, adequate-dose treatment is critical.

**Up to 30% morbidity and mortality** in adults. Etiology drives ~80% of SE-related mortality.',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-is-this-se', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-is-this-se', 'status-epilepticus', 'question', 1,
 'Is This Status Epilepticus?',
 '**Convulsive SE:** Generalized tonic-clonic activity >5 min, or recurrent seizures without recovery of consciousness between episodes.

**Subtle / late SE:** After prolonged generalized seizure, motor activity may diminish — look for subtle signs: facial twitching, nystagmus, eye deviation.

**Key history:** Duration of seizure activity, witnessed motor features, prior seizure history, current medications, recent drug/alcohol use, trauma, pregnancy status.

Physical exam: lateral tongue lacerations suggest seizure over syncope. Check for meningeal signs, focal neurologic deficits, signs of trauma.',
 '[1,2]'::jsonb, '[{"label":"Yes — Active seizure >5 min or recurrent","description":"Convulsive SE confirmed or highly suspected","next":"se-abcs","urgency":"critical"},{"label":"Altered consciousness, not convulsing","description":"Possible NCSE — subtle signs, postictal, or unexplained AMS","next":"se-ncse","urgency":"urgent"},{"label":"Likely not SE — consider differential","description":"Syncope, PNES, movement disorder, or other mimic","next":"se-differential"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-abcs', 'status-epilepticus', 'info', 1,
 'ABCs & Initial Stabilization',
 '**Airway:** Position in left lateral decubitus if actively seizing. Suction available. Nasopharyngeal airway if needed — do NOT use bite block or oral airway (risk of obstruction and provider injury). Do NOT attempt intubation during active tonic-clonic seizure unless airway compromise.

**Breathing:** High-flow O2 via non-rebreather. Monitor SpO2 continuously. Respiratory failure can occur from seizure itself or from benzodiazepines.

**Circulation:** Cardiac monitor, IV access × 2. Vital signs including temperature.

**Protect from injury** — pad side rails, remove hazards. Do NOT restrain.

**Start the clock** — time from seizure onset drives treatment decisions.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-glucose-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-glucose-labs', 'status-epilepticus', 'info', 1,
 'Glucose & Diagnostic Workup',
 '**Fingerstick glucose STAT** — hypoglycemia is a common, easily reversible seizure trigger.
• If glucose <60 mg/dL: D50W 25 g IV (adults) or D10W 2-5 mL/kg (peds)

[SE Diagnostic Workup](#/info/se-labs) — complete lab panel and imaging guide.

**Priority labs:** BMP (Na, Ca, Mg, Phos), CBC, lactate, VBG, urine drug screen, serum tox, ASM levels (if on therapy), troponin, CK, pregnancy test.

**Imaging:** CT head non-contrast after stabilization — evaluate for structural cause. MRI when stable.

**EEG:** Order early if available — 48% of patients with altered consciousness post-SE have ongoing NCSE on EEG.

**Lumbar puncture:** If signs of meningitis, fever with no clear source, or immunocompromised.',
 '[1,3,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-iv-access', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-iv-access', 'status-epilepticus', 'question', 1,
 'IV Access Available?',
 'Route of administration determines first-line benzodiazepine choice.

**IV access preferred** but should NOT delay treatment. If IV is not immediately available, give IM midazolam — the RAMPART trial showed IM midazolam is non-inferior to IV lorazepam and faster to administer.

Underdosing of benzodiazepines leads to poor response and increased likelihood of refractory SE.',
 '[1,5]'::jsonb, '[{"label":"Yes — IV established","description":"IV lorazepam is preferred first-line","next":"se-iv-bzd","urgency":"critical"},{"label":"No — IM/IN/PR route","description":"IM midazolam is first-line when no IV access","next":"se-no-iv-bzd","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;


-- MODULE 2: PHASE 1: BENZODIAZEPINES
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-iv-bzd', 'status-epilepticus', 'info', 2,
 'IV Lorazepam (First-Line)',
 '[Lorazepam](#/drug/lorazepam/status epilepticus) 0.1 mg/kg IV (max 4 mg/dose), push over 2 min.

**May repeat once** in 5-10 minutes if seizure persists. Total max: 8 mg.

**Alternative if lorazepam unavailable:**
• [Diazepam](#/drug/diazepam/status epilepticus iv) 0.15-0.2 mg/kg IV (max 10 mg), repeat once

Lorazepam is preferred over diazepam — higher seizure termination rate (65% vs 56%) and longer duration of action.

**Monitor for respiratory depression** — have bag-valve mask and suction at bedside. Patients who received multiple BZD doses from EMS are at higher risk.',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-bzd-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-no-iv-bzd', 'status-epilepticus', 'info', 2,
 'IM Midazolam (No IV Access)',
 '[Midazolam](#/drug/midazolam/status epilepticus im) 0.2 mg/kg IM (max 10 mg) into deltoid or vastus lateralis.

**RAMPART trial:** IM midazolam terminated seizures in 73% vs 63% for IV lorazepam (p<.001). Faster time to treatment offset the slightly slower IM onset.

**Weight-based dosing:**
• ≥40 kg: 10 mg IM
• 13-40 kg: 5 mg IM

**Alternative routes:**
• Intranasal midazolam: 0.2 mg/kg via mucosal atomizer (less effective than IM per Guterman et al)
• [Diazepam](#/drug/diazepam/status epilepticus rectal) 0.2-0.5 mg/kg PR (max 20 mg) — no longer recommended as first-line

**Continue attempting IV access** — will be needed for 2nd-line agents if BZD fails.',
 '[1,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-bzd-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-bzd-response', 'status-epilepticus', 'question', 2,
 'Seizure Response to Benzodiazepine?',
 'Assess **5 minutes** after BZD administration. Up to 2 doses of first-line BZD may be given.

If second dose given, reassess after 5 additional minutes.

**Seizure terminated** = cessation of all motor activity AND progressive improvement in consciousness. Subtle motor signs (facial twitching, nystagmus) may indicate ongoing SE.',
 '[1,2]'::jsonb, '[{"label":"Seizure terminated","description":"Motor activity stopped, consciousness improving","next":"se-bzd-success"},{"label":"Still seizing after adequate BZD","description":"Benzodiazepine-refractory — proceed to 2nd line","next":"se-special-pop","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-bzd-success', 'status-epilepticus', 'result', 2,
 'Seizure Terminated After Benzodiazepine',
 'Seizure terminated with first-line benzodiazepine therapy.

**Post-seizure management:**
• Monitor for recurrence — recurrence risk is significant
• Complete diagnostic workup (labs, imaging, EEG if available)
• Determine etiology — drives 80% of outcome
• Consider ASM loading for seizure prophylaxis if first unprovoked seizure with high recurrence risk, known epilepsy with subtherapeutic levels, or structural lesion identified
• [Levetiracetam](#/drug/levetiracetam/status epilepticus) 20-60 mg/kg IV (max 4500 mg) is preferred for ASM loading

**If patient does not return to baseline within 30-60 min**, consider ongoing NCSE — obtain urgent EEG.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Seizure terminated with BZD. Monitor for recurrence, complete etiology workup. Load maintenance ASM if indicated. If no return to baseline within 30-60 min, obtain EEG to rule out NCSE.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 8)
;


-- MODULE 3: PHASE 2: URGENT CONTROL
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-special-pop', 'status-epilepticus', 'question', 3,
 'Special Population?',
 'Before selecting 2nd-line antiseizure medication, identify if the patient belongs to a special population that changes management.

If none apply, proceed directly to standard 2nd-line ASM selection.',
 '[1]'::jsonb, '[{"label":"Pregnant / suspected eclampsia","description":"Magnesium sulfate first; avoid teratogenic agents","next":"se-pregnancy","urgency":"critical"},{"label":"Known/suspected toxic ingestion","description":"INH → pyridoxine; phenytoin often ineffective","next":"se-substance","urgency":"critical"},{"label":"Pediatric considerations","description":"Same agents, weight-based dosing, consider pyridoxine-dependent epilepsy","next":"se-peds","urgency":"urgent"},{"label":"Standard adult — no special population","description":"Proceed to 2nd-line ASM selection","next":"se-2nd-line-choice","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-2nd-line-choice', 'status-epilepticus', 'question', 3,
 'Second-Line ASM Selection',
 'BZD-refractory convulsive SE. Administer within **5-10 minutes** of BZD failure.

**ESETT trial (2019):** Levetiracetam, fosphenytoin, and valproate had **equivalent efficacy** (~47% seizure cessation at 60 min). No significant difference in adverse events between the three agents.

Choice should be tailored to patient''s comorbidities and contraindications.

[2nd-Line ASM Comparison](#/info/se-asm-comparison) — side-by-side efficacy, contraindications, and side effects.',
 '[1,2,6]'::jsonb, '[{"label":"Levetiracetam (Keppra)","description":"Fewest drug interactions. Safe in hepatic/renal disease. Safe in pregnancy.","next":"se-levetiracetam"},{"label":"Valproate (Depacon)","description":"Avoid in pregnancy, liver disease, mitochondrial disorders, thrombocytopenia","next":"se-valproate"},{"label":"Fosphenytoin (Cerebyx)","description":"Avoid if drug/alcohol-induced SE. Cardiac monitoring required.","next":"se-fosphenytoin"},{"label":"Phenobarbital","description":"If above unavailable. Higher sedation and respiratory depression risk.","next":"se-phenobarbital"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-levetiracetam', 'status-epilepticus', 'info', 3,
 'Levetiracetam (Keppra)',
 '[Levetiracetam](#/drug/levetiracetam/status epilepticus) 60 mg/kg IV (max 4500 mg) over 10-15 min.

**ESETT:** 47% seizure termination at 60 min (equivalent to fosphenytoin and valproate).

**Advantages:**
• No cardiac effects — no telemetry requirement during infusion
• No hepatic metabolism — no drug interactions
• Safe in renal impairment (dose adjust if CrCl <50)
• Safe in pregnancy (Category C, low teratogenicity — preferred 2nd line in pregnant patients)
• Minimal drug-drug interactions

**Side effects:** Psychiatric symptoms (irritability, agitation), drowsiness. Use with caution in patients with mood disorders.',
 '[1,6,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-valproate', 'status-epilepticus', 'info', 3,
 'Valproate Sodium (Depacon)',
 '[Valproate](#/drug/valproate/status epilepticus) 40 mg/kg IV (max 3000 mg) over 10 min.

**ESETT:** 46% seizure termination at 60 min.

**Contraindicated in:**
• Pregnancy (teratogenic — neural tube defects, Category X)
• Hepatic disease / liver failure
• Mitochondrial disorders (Alpers syndrome — fatal hepatotoxicity)
• Known or suspected urea cycle disorders
• Pancreatitis

**Cautions:**
• Thrombocytopenia / coagulopathy — check platelets
• May cause hyperammonemia — check ammonia if altered mental status persists after seizure cessation
• Well-tolerated even with larger doses and faster rates of infusion',
 '[1,6,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-fosphenytoin', 'status-epilepticus', 'info', 3,
 'Fosphenytoin (Cerebyx)',
 '[Fosphenytoin](#/drug/fosphenytoin/status epilepticus) 20 mg PE/kg IV (max 1500 mg PE) at max rate 150 mg PE/min.

**ESETT:** 45% seizure termination at 60 min.

**Requires cardiac monitoring** during and for 20 min after infusion — risk of:
• Hypotension
• Cardiac arrhythmia (bradycardia, QT prolongation)
• AV block

**INEFFECTIVE** for drug/alcohol-induced seizures — phenytoin''s selective action on voltage-gated sodium channels is insufficient for diffuse CNS toxicity.

**Contraindicated in:**
• Sinus bradycardia, SA/AV block, Adams-Stokes syndrome
• Decompensated heart failure

**Note:** Fosphenytoin (water-soluble prodrug) is preferred over phenytoin — no risk of purple glove syndrome, can be given IM. Dosed in **PE (phenytoin equivalents)**.',
 '[1,6,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-2nd-line-response', 'status-epilepticus', 'question', 3,
 '2nd-Line ASM Response?',
 'Assess **20 minutes** after start of infusion.

If seizure persists or recurs, this is now **refractory status epilepticus (RSE)**.

~30-40% of patients fail 2nd-line therapy. As SE duration increases, GABAA receptor internalization progresses and benzodiazepine/ASM resistance increases.

If the first 2nd-line agent fails, guidelines recommend either:
• Adding another 2nd-line ASM, OR
• Proceeding directly to anesthetic infusions',
 '[1,2]'::jsonb, '[{"label":"Seizure terminated","description":"Clinical and EEG seizure cessation","next":"se-2nd-success"},{"label":"Still seizing — refractory SE","description":"Failed BZD + 2nd-line ASM — escalate to anesthetic agents","next":"se-rse-prep","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;


-- MODULE 4: REFRACTORY SE
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-phenobarbital', 'status-epilepticus', 'info', 4,
 'Phenobarbital',
 '[Phenobarbital](#/drug/phenobarbital/status epilepticus) 15-20 mg/kg IV at max rate 50-100 mg/min. Max single dose: 2000 mg.

**Use when ESETT agents (levetiracetam, valproate, fosphenytoin) are unavailable** or contraindicated.

**Significant risks:**
• Respiratory depression — may precipitate need for intubation
• Hypotension
• Excessive sedation

**Have intubation supplies ready** before administration.

**Also first-line for:**
• Neonatal seizures
• Benzodiazepine-resistant alcohol withdrawal seizures

When benzodiazepines are completely unavailable, phenobarbital IV 15-20 mg/kg may be used as first-line emergent therapy.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-response', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-2nd-success', 'status-epilepticus', 'result', 4,
 'Seizure Terminated After 2nd-Line ASM',
 'Seizure terminated with 2nd-line antiseizure medication.

**Critical: Monitor for NCSE** — ESETT data showed 48% of patients with altered consciousness post-SE had ongoing nonconvulsive seizures on EEG.

**Post-seizure management:**
• Continuous EEG monitoring recommended — minimum 24h
• Continue maintenance dosing of the ASM that terminated seizure
• Complete etiology workup (labs, imaging, LP if indicated)
• Consider adding a second ASM for prophylaxis if high recurrence risk
• ICU admission for close monitoring',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Seizure terminated with 2nd-line ASM. Admit to ICU. Continuous EEG monitoring × 24-48h recommended. Continue maintenance ASM. Complete etiology workup.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-rse-prep', 'status-epilepticus', 'info', 4,
 'Refractory SE — Intubation & Preparation',
 '**Refractory SE (RSE)** = failure of first-line BZD AND adequate second-line ASM.

Occurs in ~30-40% of SE presentations.

**Immediate actions:**
• Secure airway with rapid sequence intubation
• Avoid prolonged paralysis — use short-acting agent (succinylcholine preferred over rocuronium) to allow clinical seizure assessment
• Arterial line for continuous BP monitoring
• Central venous access for vasopressors if needed
• **Continuous EEG monitoring — MANDATORY** (cannot assess seizure activity in paralyzed/sedated patient)

[RSE Management Principles](#/info/se-rse-principles) — intubation considerations, EEG targets, weaning protocol.

**Consider adding another 2nd-line ASM** (e.g., [Lacosamide](#/drug/lacosamide/status epilepticus) 200-400 mg IV) as adjunct before or concurrent with anesthetic infusion.',
 '[1,2,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-rse-infusion', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-rse-infusion', 'status-epilepticus', 'question', 4,
 'RSE — Continuous Infusion Selection',
 '**Goal:** EEG seizure suppression or burst suppression for 24-48 hours before weaning attempt.

No large RCTs demonstrate clear superiority between agents. Choice based on clinical factors.

All agents require mechanical ventilation and ICU-level care.

[Continuous Infusion Comparison](#/info/se-infusion-comparison) — dosing, hemodynamic effects, and unique risks for each agent.',
 '[1,8]'::jsonb, '[{"label":"Midazolam infusion","description":"Load 0.2 mg/kg, infuse 0.05-2 mg/kg/hr. Lowest hemodynamic impact, easier to wean.","next":"se-rse-monitoring"},{"label":"Propofol infusion","description":"Load 1-2 mg/kg, infuse 30-200 mcg/kg/min. Watch for propofol infusion syndrome (PRIS).","next":"se-rse-monitoring"},{"label":"Pentobarbital infusion","description":"Load 5-15 mg/kg, infuse 0.5-5 mg/kg/hr. Deepest suppression, most hemodynamic compromise.","next":"se-rse-monitoring"},{"label":"Ketamine infusion","description":"Load 0.5-3 mg/kg, infuse 0.1-5 mg/kg/hr. NMDA antagonist — different mechanism, may avoid intubation.","next":"se-rse-monitoring"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 18)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-rse-monitoring', 'status-epilepticus', 'info', 4,
 'RSE/SRSE Monitoring & Weaning',
 '**Continuous EEG targets:**
• Burst suppression (3-10 sec bursts, <50% suppression ratio)
• OR complete seizure suppression (depending on clinical scenario)

**Maintenance:** 24-48 hours of seizure suppression before first wean attempt.

**Weaning protocol:**
• Reduce infusion by 25% every 4-6 hours with continuous EEG
• If seizures recur on wean → restart at effective dose, extend 24h, retry

**Super-refractory SE (SRSE):** SE persists or recurs despite 24 hours of anesthetic therapy.

**SRSE options:**
• Switch to different anesthetic agent
• [Lacosamide](#/drug/lacosamide/status epilepticus) as adjunct
• Immunotherapy if autoimmune etiology suspected (IVIG, steroids, plasmapheresis)
• Therapeutic hypothermia (32-35°C)
• Ketogenic diet
• Neurology and neurointensive care consultation essential

**NORSE (new-onset refractory SE):** No prior seizure history, no identifiable cause. ~50% remain cryptogenic. Consider autoimmune/paraneoplastic encephalitis panel.',
 '[1,2,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-disposition', 'status-epilepticus', 'result', 4,
 'Disposition & Ongoing Management',
 '**All SE patients require ICU admission.**

**Monitoring:**
• Continuous EEG monitoring × minimum 24-48h
• Detect NCSE, guide treatment, monitor for recurrence

**Workup to complete:**
• MRI brain (when stable) — superior to CT for structural causes
• LP if infectious or autoimmune etiology suspected
• Autoimmune encephalitis panel if no clear etiology (NMDA-receptor Ab, LGI1, CASPR2)
• ASM levels (therapeutic drug monitoring)

**Maintenance ASM:**
• Continue the agent(s) that terminated SE
• [Levetiracetam](#/drug/levetiracetam/status epilepticus) is most commonly used for maintenance

**Goals of care:** Discuss with family early if RSE/SRSE — prognosis depends primarily on underlying etiology.

**Neurology consultation** for all SE patients.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Admit to ICU. Continuous EEG × 24-48h. Complete etiology workup (MRI, LP if indicated, autoimmune panel if cryptogenic). Continue maintenance ASM. Neurology consultation.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 20)
;


-- MODULE 5: SPECIAL POPULATIONS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-pregnancy', 'status-epilepticus', 'info', 5,
 'Pregnancy / Eclampsia',
 '**First question: Is this eclampsia or epilepsy?**

**Eclampsia** if: hypertension, proteinuria, edema, >20 weeks gestation, or new-onset seizure in pregnancy without prior seizure history.

**Eclampsia treatment:**
• [Magnesium Sulfate](#/drug/magnesium-sulfate/eclampsia) 4-6 g IV over 15-20 min, then 1-2 g/hr infusion
• If seizures persist despite magnesium → benzodiazepines (lorazepam)
• **OB consultation STAT** — consider emergent delivery
• Fetal monitoring

**Epilepsy in pregnancy (breakthrough SE):**
• Standard BZD first-line
• For 2nd-line: **prefer [Levetiracetam](#/drug/levetiracetam/status epilepticus)** — 89% of neurologists chose it as first-line after BZD in pregnancy
• **AVOID [Valproate](#/drug/valproate/status epilepticus)** — teratogenic (neural tube defects), Category X
• Fosphenytoin acceptable if needed (teratogenic risk mainly with chronic exposure, less concern for acute SE)
• Refractory SE: midazolam or propofol infusion + consider early delivery

**All pregnant patients with new seizure** should receive empiric magnesium while further workup obtained.',
 '[1,9,10]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-choice', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 21)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-substance', 'status-epilepticus', 'info', 5,
 'Substance-Induced SE',
 '**9% of SE cases are substance-induced.**

**Isoniazid (INH) toxicity:**
• [Pyridoxine (Vitamin B6)](#/drug/pyridoxine/inh toxicity) is the specific antidote
• Dose: gram-for-gram to amount ingested, OR 5 g IV empiric if amount unknown
• INH depletes pyridoxine → GABA synthesis fails → refractory seizures
• Standard ASMs are ineffective without pyridoxine

**Alcohol withdrawal:**
• Benzodiazepines are first-line (high-dose may be needed)
• [Phenobarbital](#/drug/phenobarbital/status epilepticus) is effective adjunct
• Fosphenytoin/phenytoin INEFFECTIVE for alcohol withdrawal seizures

**Sympathomimetic toxicity** (cocaine, methamphetamine, MDMA):
• BZDs first-line
• Avoid phenytoin

**General principle:** Phenytoin/fosphenytoin is often **ineffective** for drug-induced seizures — phenytoin''s selective action on voltage-gated sodium channels cannot overcome diffuse CNS toxicity from other drug mechanisms.

**Treat the underlying toxidrome** alongside seizure management.',
 '[1,11]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-choice', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 22)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-peds', 'status-epilepticus', 'info', 5,
 'Pediatric Considerations',
 '**Same treatment algorithm as adults** — BZD first-line, then 2nd-line ASM, then anesthetic infusions.

**BZD dosing (weight-based):**
• IV Lorazepam: 0.1 mg/kg (max 4 mg), repeat × 1
• IM Midazolam: 13-40 kg → 5 mg; ≥40 kg → 10 mg (0.2 mg/kg, max 10 mg)
• Rectal Diazepam: 0.2-0.5 mg/kg (max 20 mg)

**2nd-line ASM:** Same agents and weight-based dosing as adults (per ESETT, which included pediatric patients).
• EcLiPSE and ConSEPT trials confirmed levetiracetam and phenytoin are equivalent in pediatric convulsive SE

**Pediatric-specific considerations:**
• **Pyridoxine-dependent epilepsy** (age <2 yr): Give [Pyridoxine](#/drug/pyridoxine/pyridoxine dependent epilepsy) 100 mg IV if SE is refractory and no clear etiology — especially neonates with refractory seizures
• **Febrile SE:** Most common etiology in children — workup directed at fever source
• **Inborn errors of metabolism:** Consider in neonates/infants with unexplained SE
• **Phenobarbital** remains first-line for neonatal seizures

**Weight estimation:** <1 yr: (months × 0.5) + 3.5 kg | 1-10 yr: (years × 2) + 10 kg | >10 yr: (years × 2) + 20 kg',
 '[1,2,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-2nd-line-choice', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 23)
;


-- MODULE 6: DIFFERENTIAL & NCSE
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-ncse', 'status-epilepticus', 'info', 6,
 'Nonconvulsive Status Epilepticus (NCSE)',
 'NCSE accounts for up to **48% of patients with altered consciousness post-SE** (ESETT data).

**Suspect NCSE if:**
• Unexplained altered mental status after convulsive SE
• Subtle motor signs: eye deviation, nystagmus, lip smacking, eyelid fluttering, myoclonus
• Failure to return to baseline after initial seizure treatment
• Acutely ill ICU patients (especially on neurotoxic medications: cephalosporins, methotrexate, baclofen, lithium, opioids)

**Diagnosis:** Requires **EEG** — cannot diagnose clinically.

[NCSE Diagnostic Criteria](#/info/se-ncse-criteria) — Salzburg criteria and BZD trial protocol.

**BZD trial (diagnostic + therapeutic):**
• Administer lorazepam 1-2 mg IV while monitoring EEG
• Clinical AND EEG improvement → confirms NCSE diagnosis

**Treatment:** Same escalating algorithm as convulsive SE (BZD → 2nd-line → anesthetic infusions), but **urgency of aggressive treatment is debated** — weigh risks of anesthetic agents and intubation against ongoing nonconvulsive seizure activity.

NCSE generally has lower mortality than convulsive SE, but delay in diagnosis worsens outcomes.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'se-iv-access', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 24)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('se-differential', 'status-epilepticus', 'result', 6,
 'Not SE — Differential Diagnosis',
 '**Common SE mimics:**

• **Psychogenic nonepileptic seizures (PNES):** Most common mimic. Features suggesting PNES: side-to-side head movements, pelvic thrusting, forced eye closure (seizures: eyes open), emotional outbursts, asynchronous limb movements, waxing/waning pattern, absence of postictal confusion. Video EEG is definitive.

• **Syncope with myoclonus:** Brief jerking movements after loss of consciousness — self-limited, resolves when horizontal. Lasts seconds (not minutes).

• **Movement disorders:** Dystonic reactions (from dopamine-blocking medications), oculogyric crisis (20-30 min, no loss of consciousness), tremor, myoclonus.

• **Metabolic encephalopathy:** Uremia, hyperammonemia, hepatic encephalopathy, myxedema coma.

• **Drug toxicity / intoxication:** Alcohol, delirium tremens, serotonin syndrome.

• **Locked-in syndrome:** Anterior pontine infarction — appears unresponsive but conscious. Test with vertical eye movements.

• **Decerebrate/decorticate posturing:** From structural brain injury — not rhythmic.

**Key differentiators:**
• Lateral tongue laceration suggests seizure over syncope
• Lactate >2.45 mmol/L: 88% sensitivity, 87% specificity for GTC seizure vs syncope/PNES
• Prolactin elevated 10-20 min post-seizure: 53% sensitivity, 93% specificity for convulsive SE

**If uncertain, treat as SE** until effectively ruled out — delayed treatment worsens outcomes.',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Consider alternative diagnosis. If uncertain, treat as SE until proven otherwise. PNES is the most common mimic — video EEG is definitive. Do not administer antiseizure medications for confirmed PNES.', NULL, 'consider', '[]'::jsonb, '[]'::jsonb, 25)
;


COMMIT;
