-- =====================================================================
-- MedKitt — PE Treatment Consult: Supabase INSERT Statements
-- Generated: 2026-03-10
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'pe-treatment',
  'PE Treatment',
  'Risk Stratification → Management',
  '1.0',
  14,
  'pe-start',
  '["Risk Stratification","Massive PE","Submassive PE","Low-Risk PE","Anticoagulation Selection"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('critical-care', 'pe-treatment', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('emergency-medicine', 'pe-treatment', NULL, NULL, NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (5 citations)
DELETE FROM tree_citations WHERE tree_id = 'pe-treatment';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('pe-treatment', 1, 'Konstantinides SV, Meyer G, Becattini C, et al. 2019 ESC Guidelines for the Diagnosis and Management of Acute Pulmonary Embolism. Eur Heart J. 2020;41(4):543-603. https://academic.oup.com/eurheartj/article/41/4/543/5556506'),
('pe-treatment', 2, 'Torbicki A, Perrier A, Konstantinides S, et al. Guidelines on the Diagnosis and Management of Acute Pulmonary Embolism. Eur Heart J. 2008;29(18):2276-315.'),
('pe-treatment', 3, 'Jaff MR, McMurtry MS, Archer SL, et al. Management of Massive and Submassive Pulmonary Embolism. Circulation. 2011;123(16):1788-830.'),
('pe-treatment', 4, 'Stevens SM, Woller SC, Kreuziger LB, et al. Antithrombotic Therapy for VTE Disease: Second Update of the CHEST Guideline. CHEST. 2021;160(6):e545-e608.'),
('pe-treatment', 5, 'Warkentin TE, Greinacher A, Gruel Y, et al. Heparin-Induced Thrombocytopenia in the Cardiovascular Patient. Circulation. 2021;144(5):e1-e22.');

DELETE FROM decision_nodes WHERE tree_id = 'pe-treatment';

-- 4. decision_nodes (14 nodes)

-- MODULE 1: RISK STRATIFICATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-start', 'pe-treatment', 'question', 1,
 'PE Risk Stratification',
 'Confirmed or high-probability acute pulmonary embolism. Risk stratification guides treatment.

Assess **hemodynamic status** first:
• SBP, heart rate, signs of shock
• Bedside echo for RV strain
• Troponin and BNP

Use [PESI](#/calculator/pesi) or [sPESI](#/calculator/spesi) to risk-stratify normotensive patients.',
 '[1,3]'::jsonb, '[{"label":"Massive PE (High-Risk)","description":"Hypotension, cardiogenic shock, or cardiac arrest","next":"pe-massive","urgency":"critical"},{"label":"Submassive PE (Intermediate-Risk)","description":"Normotensive with RV dysfunction or elevated biomarkers","next":"pe-submassive","urgency":"urgent"},{"label":"Low-Risk PE","description":"Normal hemodynamics, no RV dysfunction, normal biomarkers","next":"pe-low-risk"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[{"id":"pesi","label":"PESI Score"},{"id":"spesi","label":"sPESI Score"}]'::jsonb, 0)
;


-- MODULE 2: MASSIVE PE
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-massive', 'pe-treatment', 'info', 2,
 'Massive PE — High-Risk',
 'Sustained hypotension (SBP <90 mmHg or drop ≥40 mmHg for >15 min), cardiogenic shock, or cardiac arrest.

**Mortality >15%** without immediate treatment.

**ICD-10:** I26.02 (saddle embolus with acute cor pulmonale), I26.09, I26.90',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-massive-tx', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-massive-tx', 'pe-treatment', 'info', 2,
 'Immediate Interventions',
 '**1. Anticoagulation** — start immediately:
• [UFH](#/drug/ufh/pe) 80 units/kg bolus → 18 units/kg/hr infusion
• Preferred over LMWH if thrombolysis anticipated

**2. Systemic thrombolysis** (if no contraindications):
• [Alteplase](#/drug/alteplase/pulmonary) 100 mg IV over 2 hours
• OR accelerated regimen: 0.6 mg/kg (max 50 mg) over 15 min in cardiac arrest

**3. If thrombolysis contraindicated:**
• Catheter-directed therapy (CDT)
• Surgical embolectomy
• Consider ECMO as bridge in refractory shock

**Volume resuscitation:** Cautious — >500 mL can worsen RV failure. Use vasopressors (norepinephrine preferred) for hemodynamic support.',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-anticoag-selection', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;


-- MODULE 3: SUBMASSIVE PE
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-submassive', 'pe-treatment', 'question', 3,
 'Submassive PE — Intermediate-Risk',
 'Normotensive but with evidence of RV strain or myocardial injury.

Assess for **both**:
• **RV dysfunction** — echo (RV/LV ratio >0.9, McConnell sign, TAPSE <16mm) or CT (RV/LV ≥0.9)
• **Elevated biomarkers** — troponin AND/OR BNP/NT-proBNP',
 '[1,3]'::jsonb, '[{"label":"Intermediate-High Risk","description":"BOTH RV dysfunction AND elevated biomarkers","next":"pe-submassive-high","urgency":"urgent"},{"label":"Intermediate-Low Risk","description":"Either RV dysfunction OR elevated biomarkers (not both)","next":"pe-submassive-low"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-submassive-high', 'pe-treatment', 'info', 3,
 'Intermediate-High Risk Management',
 '**Anticoagulation** — start immediately:
• [Enoxaparin](#/drug/enoxaparin/pe) 1 mg/kg SC q12h, OR
• [UFH](#/drug/ufh/pe) if considering escalation to thrombolysis, OR
• [Fondaparinux](#/drug/fondaparinux/pe) 5–10 mg SC daily (weight-based)

**ICU monitoring recommended.** Watch closely for clinical deterioration.

**Rescue thrombolysis** if hemodynamic decompensation:
• [Alteplase](#/drug/alteplase/pulmonary) 100 mg IV over 2h
• Half-dose alteplase (50 mg) may reduce bleeding risk — emerging evidence

**Consider catheter-directed therapy** if thrombolysis contraindicated but patient deteriorating.',
 '[1,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-anticoag-selection', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-submassive-low', 'pe-treatment', 'info', 3,
 'Intermediate-Low Risk Management',
 'Either RV dysfunction OR elevated biomarkers, but **not both**.

**Anticoagulation alone** — thrombolysis not indicated:
• [Enoxaparin](#/drug/enoxaparin/pe) 1 mg/kg SC q12h, OR
• [UFH](#/drug/ufh/pe) if CrCl <30 or concern for rapid escalation

**Hospital admission** for monitoring (typically step-down unit).

Reassess if clinical deterioration → escalate to intermediate-high risk pathway.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-anticoag-selection', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;


-- MODULE 4: LOW-RISK PE
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-low-risk', 'pe-treatment', 'info', 4,
 'Low-Risk PE',
 'No RV dysfunction on imaging, normal cardiac biomarkers, no hypotension.

**PESI Class I–II** or **sPESI = 0**.

Use [PESI](#/calculator/pesi) or [sPESI](#/calculator/spesi) to confirm low-risk classification.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-outpatient-check', NULL, NULL, NULL, '[]'::jsonb, '[{"id":"pesi","label":"PESI Score"},{"id":"spesi","label":"sPESI Score"}]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-outpatient-check', 'pe-treatment', 'question', 4,
 'Outpatient Treatment Eligible?',
 'Assess for **outpatient management** (Hestia criteria or institutional protocol):

• Hemodynamically stable
• No need for supplemental O₂
• No active bleeding or high bleeding risk
• No severe renal impairment (CrCl >30)
• No severe pain requiring IV analgesics
• Good social support and reliable follow-up
• Able to take oral medications
• No pregnancy',
 '[1,4]'::jsonb, '[{"label":"Yes — Outpatient eligible","description":"Meets all outpatient criteria","next":"pe-outpatient-tx"},{"label":"No — Brief inpatient stay","description":"Any concern for outpatient safety","next":"pe-inpatient-low"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-outpatient-tx', 'pe-treatment', 'info', 4,
 'Outpatient Anticoagulation',
 '**DOACs preferred** (no parenteral bridge needed):
• [Apixaban](#/drug/apixaban/pe) 10 mg BID × 7 days → 5 mg BID
• [Rivaroxaban](#/drug/rivaroxaban/pe) 15 mg BID × 21 days → 20 mg daily with food

**Follow-up:** Within 3–7 days with primary care or hematology.

**Patient education:**
• Return for worsening dyspnea, chest pain, hemoptysis, syncope
• Adherence to anticoagulation is critical
• Minimum 3 months of therapy; reassess for extended treatment',
 '[1,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-anticoag-selection', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-inpatient-low', 'pe-treatment', 'info', 4,
 'Brief Inpatient Stay',
 'Admit for **24–48h observation** with initiation of anticoagulation.

Start oral DOAC therapy:
• [Apixaban](#/drug/apixaban/pe) 10 mg BID × 7 days → 5 mg BID, OR
• [Rivaroxaban](#/drug/rivaroxaban/pe) 15 mg BID × 21 days → 20 mg daily

Transition to outpatient when clinically stable and oral intake confirmed.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pe-anticoag-selection', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;


-- MODULE 5: ANTICOAGULATION SELECTION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-anticoag-selection', 'pe-treatment', 'question', 5,
 'Anticoagulation Selection',
 'Choice depends on renal function, bleeding risk, patient preference, and cost.

**Key decision points:**
• CrCl <30 mL/min → UFH preferred
• Cancer-associated VTE → DOAC (apixaban/rivaroxaban) or LMWH
• Pregnancy → LMWH only (DOACs contraindicated)
• HIT → argatroban or fondaparinux',
 '[4]'::jsonb, '[{"label":"DOAC (Preferred)","description":"Apixaban, rivaroxaban, edoxaban, dabigatran","next":"pe-doac"},{"label":"LMWH → Warfarin","description":"Enoxaparin bridge to warfarin (INR target 2–3)","next":"pe-lmwh-warfarin"},{"label":"Renal/Hepatic Impairment","description":"CrCl <30 or severe hepatic disease","next":"pe-renal-hepatic"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-doac', 'pe-treatment', 'info', 5,
 'DOAC Regimens (Preferred)',
 '**Single-drug approach (no parenteral lead-in):**
• [Apixaban](#/drug/apixaban/pe) 10 mg BID × 7 days → 5 mg BID
• [Rivaroxaban](#/drug/rivaroxaban/pe) 15 mg BID × 21 days → 20 mg daily (with food)

**Parenteral lead-in required (5–10 days LMWH/UFH first):**
• [Edoxaban](#/drug/edoxaban/pe) 60 mg daily (30 mg if CrCl 15–50, weight ≤60 kg, or P-gp inhibitor)
• [Dabigatran](#/drug/dabigatran/pe) 150 mg BID

**Duration:** Minimum 3 months. Extended treatment for unprovoked PE, recurrent VTE, or persistent risk factors.',
 '[4]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-lmwh-warfarin', 'pe-treatment', 'info', 5,
 'LMWH Bridge to Warfarin',
 '• [Enoxaparin](#/drug/enoxaparin/pe) 1 mg/kg SC q12h (or 1.5 mg/kg daily)
• Start warfarin on day 1 — overlap until INR 2.0–3.0 for ≥24 hours
• Discontinue LMWH after INR therapeutic × 2 consecutive days
• Target INR: 2.0–3.0

**Duration:** Minimum 3 months. Extended for unprovoked or recurrent VTE.

**Monitoring:** INR weekly until stable, then monthly.',
 '[4]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pe-renal-hepatic', 'pe-treatment', 'info', 5,
 'Renal or Hepatic Impairment',
 '**CrCl <30 mL/min:**
• [UFH](#/drug/ufh/pe) preferred — renally independent clearance
• Adjust LMWH dose for CrCl 15–30 (enoxaparin 1 mg/kg SC daily)
• Apixaban may be used cautiously (least renal elimination of DOACs)

**Severe hepatic disease (Child-Pugh C):**
• UFH preferred
• DOACs contraindicated in severe hepatic impairment

**HIT (heparin-induced thrombocytopenia):**
• Discontinue ALL heparin products immediately
• [Fondaparinux](#/drug/fondaparinux/pe) or argatroban as alternatives
• Bridge to warfarin only after platelet recovery (>150k)',
 '[4,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;


-- 5. drugs (5 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('alteplase', 'Alteplase (tPA)', 'Alteplase', 'Thrombolytic (tissue plasminogen activator)', 'IV',
 '["Massive (high-risk) pulmonary embolism","Acute ischemic stroke","Acute STEMI"]'::jsonb,
 '[{"indication":"High-risk PE","regimen":"100 mg IV over 2 hours: 0.6 mg/kg (max 50 mg) over first 15 min, remainder over next 1 hr 45 min. Stop UFH drip before infusion. Post-infusion: check PTT — if ≤75 restart UFH without bolus; if >75 repeat PTT q2hr until ≤75.","weightCalc":{"dosePerKg":0.6,"unit":"mg","maxDose":50,"label":"Bolus (first 15 min)"}},{"indication":"Acute ischemic stroke (0–4.5h)","regimen":"0.9 mg/kg IV (max 90 mg): Give 10% as IV bolus over 1 min, remaining 90% infused over 60 min. BP must be <185/110 before and <180/105 for 24h after. No antithrombotics × 24h post-infusion.","weightCalc":{"dosePerKg":0.9,"unit":"mg","maxDose":90}}]'::jsonb,
 '["Absolute: Haemorrhagic stroke or stroke of unknown origin, Ischaemic stroke within 6 months, CNS neoplasm, Major trauma/surgery/head injury within 3 weeks, Bleeding diathesis, Active bleeding","Relative: TIA within 6 months, Oral anticoagulation, Pregnancy or first postpartum week, Non-compressible puncture sites, Traumatic resuscitation, Refractory HTN (SBP >180), Advanced liver disease, Infective endocarditis, Active peptic ulcer"]'::jsonb,
 '[]'::jsonb,
 'Assess hemodynamic response 1–2 hours post-infusion. Check PTT before restarting heparin.',
 'Fibrinolytic therapy is the first-line reperfusion strategy for high-risk PE with hemodynamic instability (ESC 2019, Class I, Level B).',
 NULL,
 '["Konstantinides SV, et al. 2019 ESC Guidelines for Acute Pulmonary Embolism. Eur Heart J. 2020;41(4):543-603."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('dabigatran', 'Dabigatran', 'Dabigatran etexilate', 'Direct oral anticoagulant (Direct thrombin inhibitor)', 'PO',
 '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)"]'::jsonb,
 '[{"indication":"PE / DVT treatment","regimen":"Requires 5–10 days parenteral anticoagulation (LMWH or UFH) first, then 150 mg twice daily."}]'::jsonb,
 '[]'::jsonb,
 '["CrCl <30 mL/min — contraindicated (predominantly renal clearance ~80%)","Strong P-gp inhibitors in CrCl <50 mL/min — dose reduction or avoidance","No dose adjustment for hepatic impairment (not hepatically metabolized)"]'::jsonb,
 NULL,
 'Requires initial parenteral anticoagulation bridge (unlike apixaban/rivaroxaban). Specific reversal agent: idarucizumab (Praxbind).',
 NULL,
 '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('edoxaban', 'Edoxaban', 'Edoxaban', 'Direct oral anticoagulant (Factor Xa inhibitor)', 'PO',
 '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)"]'::jsonb,
 '[{"indication":"PE / DVT treatment","regimen":"Requires 5–10 days parenteral anticoagulation (LMWH) first, then 60 mg once daily. Reduce to 30 mg once daily if: CrCl 15–50 mL/min, body weight <60 kg, or concomitant P-glycoprotein inhibitors."}]'::jsonb,
 '[]'::jsonb,
 '["CrCl >95 mL/min — reduced efficacy vs warfarin (avoid in AF indication)","CrCl <15 mL/min — not recommended","Moderate-severe hepatic impairment — not recommended"]'::jsonb,
 NULL,
 'Requires initial parenteral anticoagulation bridge. Once-daily dosing may improve adherence.',
 NULL,
 '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('enoxaparin', 'Enoxaparin (LMWH)', 'Enoxaparin sodium', 'Low molecular weight heparin', 'SC',
 '["Pulmonary embolism","Deep vein thrombosis","ACS","VTE prophylaxis"]'::jsonb,
 '[{"indication":"PE / DVT treatment","regimen":"1 mg/kg SC every 12 hours, or 1.5 mg/kg SC once daily.","weightCalc":[{"dosePerKg":1,"unit":"mg","label":"BID dosing"},{"dosePerKg":1.5,"unit":"mg","label":"Daily dosing"}]},{"indication":"VTE prophylaxis","regimen":"40 mg SC once daily."},{"indication":"ACS / NSTEMI","regimen":"1 mg/kg SC every 12 hours. Duration: until invasive strategy or up to 8 days. CrCl <30 mL/min: 1 mg/kg SC once daily. If PCI >8h after last SC dose: supplemental 0.3 mg/kg IV bolus in cath lab.","weightCalc":{"dosePerKg":1,"unit":"mg"}}]'::jsonb,
 '["Heparin-induced thrombocytopenia (HIT) — absolute contraindication due to cross-reactivity with HIT antibodies","Active major bleeding"]'::jsonb,
 '["Severe renal insufficiency (CrCl ≤30 mL/min) — significantly increased bleeding risk (OR 2.25 for major bleeding). Consider UFH when CrCl <25–30 mL/min.","Neuraxial anesthesia — administer LMWH ≥12 hr before catheter placement/removal; delay dosing ≥4 hr after removal. No twice-daily LMWH with indwelling neuraxial catheter.","Extreme body weight (<40 kg or >100 kg), pregnancy, pediatrics — consider anti-Xa monitoring. Monitor if >150 kg.","Effects cannot be completely reversed by protamine sulfate."]'::jsonb,
 'Anti-Xa levels if renal impairment, extremes of weight, or pregnancy. Platelet count if > 4 days of therapy (HIT screening).',
 NULL,
 NULL,
 '["Konstantinides SV, et al. 2019 ESC Guidelines for Acute Pulmonary Embolism. Eur Heart J. 2020.","Garcia DA, et al. Parenteral Anticoagulants: ACCP Evidence-Based Clinical Practice Guidelines. Chest. 2012."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('ufh', 'Unfractionated Heparin (UFH)', 'Heparin sodium', 'Unfractionated heparin (indirect thrombin/Xa inhibitor)', 'IV',
 '["Pulmonary embolism (all risk levels)","DVT","ACS","Bridge anticoagulation"]'::jsonb,
 '[{"indication":"High-risk / Massive PE","regimen":"Bolus 80 units/kg (or 5,000 units) IV, then continuous infusion at 18 units/kg/hour. Titrate to aPTT 60–80 seconds (1.5–2.5× control)."},{"indication":"Standard PE / DVT","regimen":"Bolus 80 units/kg IV, then 18 units/kg/hr continuous infusion. Adjust per institutional nomogram."},{"indication":"ACS / NSTEMI","regimen":"Bolus: 60 units/kg IV (max 4,000 units). Infusion: 12 units/kg/hr (max 1,000 units/hr). Target aPTT: 50-70 seconds (1.5-2.0× control). Lower doses than PE due to concurrent dual antiplatelet therapy. Adjust per institutional nomogram."}]'::jsonb,
 '["Active major hemorrhage","Severe thrombocytopenia (platelets <25,000)","History of heparin-induced thrombocytopenia (HIT)","Spinal procedure or epidural within 12 hours"]'::jsonb,
 '["Renal insufficiency: UFH preferred over LMWH when CrCl <25–30 mL/min (not renally cleared)","Obesity: may require higher initial doses and more frequent aPTT monitoring"]'::jsonb,
 'aPTT every 6 hours until therapeutic, then every 12–24 hours. Platelet count at baseline and every 2–3 days (HIT screening).',
 'Preferred over LMWH when: CrCl <30 mL/min, high bleeding risk (short half-life, fully reversible with protamine), or thrombolysis anticipated. Fully reversible with protamine sulfate.',
 NULL,
 '["Konstantinides SV, et al. 2019 ESC Guidelines for Acute Pulmonary Embolism. Eur Heart J. 2020.","Garcia DA, et al. Parenteral Anticoagulants: ACCP Evidence-Based Clinical Practice Guidelines. Chest. 2012."]'::jsonb,
 4)
;


-- 5b. drugs — UPDATE existing entries (3 drugs)
-- Updating Apixaban with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)"]'::jsonb,
  dosing = '[{"indication":"PE / DVT treatment","regimen":"10 mg twice daily × 7 days, then 5 mg twice daily × 3–6 months. Extended therapy: 5 mg or 2.5 mg twice daily."},{"indication":"Atrial fibrillation (stroke prevention)","regimen":"5 mg BID. Dose-reduce to 2.5 mg BID if ≥2 of: age ≥80, weight ≤60 kg, creatinine ≥1.5 mg/dL."}]'::jsonb,
  contraindications = '[]'::jsonb,
  cautions = '["Severe renal impairment (CrCl <25 mL/min) — limited data","Moderate hepatic impairment (Child-Pugh B) — use with caution","Strong CYP3A4 and P-gp inhibitors/inducers — avoid concomitant use"]'::jsonb,
  monitoring = NULL,
  notes = 'Single-drug oral therapy — no initial parenteral heparin required. Particularly convenient for outpatient PE management.',
  citations = '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022.","Renner E, Barnes GD. Antithrombotic Management of VTE: JACC Focus Seminar. J Am Coll Cardiol. 2020."]'::jsonb
WHERE id = 'apixaban';

-- Updating Fondaparinux (Arixtra) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["ACS / NSTEMI (conservative management)","DVT/PE treatment","VTE prophylaxis"]'::jsonb,
  dosing = '[{"indication":"NSTEMI (conservative / ischemia-guided strategy)","regimen":"2.5 mg SC once daily. Start on presentation, continue until discharge or up to 8 days. If patient goes to PCI: supplement with UFH 60 units/kg bolus (catheter thrombosis risk)."}]'::jsonb,
  contraindications = '["CrCl <30 mL/min — contraindicated","Active major bleeding","Bacterial endocarditis","Body weight <50 kg — increased bleeding risk"]'::jsonb,
  cautions = '["Catheter thrombosis if used alone during PCI — must supplement with UFH bolus in cath lab","Cannot monitor with aPTT — use anti-Xa levels if monitoring needed","Neuraxial anesthesia — risk of spinal/epidural hematoma","No reversal agent available"]'::jsonb,
  monitoring = 'Renal function at baseline. Anti-Xa levels only if needed (not routine). CBC for bleeding. Signs of catheter thrombosis if proceeding to PCI.',
  notes = 'OASIS-5 trial: fondaparinux 2.5 mg daily was noninferior to enoxaparin for ischemic events in NSTEMI but with 50% reduction in major bleeding (2.2% vs 4.1%) and significantly lower mortality at 6 months. Preferred anticoagulant for conservative/ischemia-guided management strategy. Must supplement with UFH if patient undergoes PCI due to catheter thrombosis risk.',
  citations = '["Yusuf S, et al. Comparison of Fondaparinux and Enoxaparin in Acute Coronary Syndromes (OASIS-5). N Engl J Med. 2006;354(14):1464-1476.","Amsterdam EA, et al. 2014 AHA/ACC Guideline for Management of NSTE-ACS. J Am Coll Cardiol. 2014;64(24):e189-e228."]'::jsonb
WHERE id = 'fondaparinux';

-- Updating Rivaroxaban with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Pulmonary embolism","Deep vein thrombosis","Atrial fibrillation (stroke prevention)","CAD/PAD secondary prevention"]'::jsonb,
  dosing = '[{"indication":"PE / DVT treatment","regimen":"15 mg twice daily with food × 21 days, then 20 mg once daily with food × 3–6 months. Extended therapy: 20 mg or 10 mg once daily."},{"indication":"Atrial fibrillation (stroke prevention)","regimen":"20 mg daily with food (CrCl >50 mL/min). 15 mg daily with food (CrCl 15-50 mL/min). Avoid if CrCl <15 mL/min."}]'::jsonb,
  contraindications = '[]'::jsonb,
  cautions = '["CrCl <30 mL/min — avoid (limited data, increased drug exposure)","Moderate hepatic impairment (Child-Pugh B) — use with caution","Must take with food (increases bioavailability by 39%)","Strong CYP3A4 and P-gp inhibitors/inducers — avoid concomitant use"]'::jsonb,
  monitoring = NULL,
  notes = 'Single-drug oral therapy — no initial parenteral heparin required. Take with food to ensure adequate absorption.',
  citations = '["Kahn SR, de Wit K. Pulmonary Embolism. N Engl J Med. 2022.","Freund Y, et al. Acute Pulmonary Embolism: A Review. JAMA. 2022."]'::jsonb
WHERE id = 'rivaroxaban';

COMMIT;
