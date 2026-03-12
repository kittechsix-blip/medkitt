-- =====================================================================
-- MedKitt — Abnormal Uterine Bleeding Consult: Supabase INSERT Statements
-- Generated: 2026-03-10
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'aub',
  'Abnormal Uterine Bleeding',
  'Stability → Workup → PALM-COEIN → Treatment → Disposition',
  '1.0',
  21,
  'aub-start',
  '["Initial Assessment","Workup","Etiology","Treatment","Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('ob-gyn', 'aub', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (10 citations)
DELETE FROM tree_citations WHERE tree_id = 'aub';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('aub', 1, 'Mendez K. ER Evaluation of Abnormal Uterine Bleeding: Special Focus in the Obese Patient. OB/GYN-UPR Lecture Series.'),
('aub', 2, 'ACOG Committee Opinion No. 557. Management of Acute Abnormal Uterine Bleeding in Nonpregnant Reproductive-Aged Women. Obstet Gynecol. 2013;121(4):891-896. Reaffirmed 2019.'),
('aub', 3, 'Tintinalli JE, et al. Emergency Medicine: A Comprehensive Study Guide. 9th ed. McGraw-Hill; 2020. Chapter 98: Vaginal Bleeding.'),
('aub', 4, 'Munro MG, Critchley HOD, Broder MS, Fraser IS. FIGO classification system (PALM-COEIN) for causes of abnormal uterine bleeding in nongravid women of reproductive age. Int J Gynaecol Obstet. 2011;113(1):3-13.'),
('aub', 5, 'Kouides PA, Conard J, Peyvandi F, et al. Hemostasis and menstruation: appropriate investigation for underlying disorders of hemostasis in women with excessive menstrual bleeding. Fertil Steril. 2005;84(5):1345-1351.'),
('aub', 6, 'James AH, Kouides PA, Abdul-Kadir R, et al. Evaluation and management of acute menorrhagia in women with and without underlying bleeding disorders: consensus from an international expert panel. Eur J Obstet Gynecol Reprod Biol. 2011;158:124-134.'),
('aub', 7, 'DeVore GR, Owens O, Kase N. Use of intravenous Premarin in the treatment of dysfunctional uterine bleeding — a double-blind randomized control study. Obstet Gynecol. 1982;59(3):285-291.'),
('aub', 8, 'Munro MG, Mainor N, Basu R, Brisinger M, Barreda L. Oral medroxyprogesterone acetate and combination oral contraceptives for acute uterine bleeding: a randomized controlled trial. Obstet Gynecol. 2006;108:924-929.'),
('aub', 9, 'Lethaby A, Farquhar C, Cooke I. Antifibrinolytics for heavy menstrual bleeding. Cochrane Database Syst Rev. 2000;(4):CD000249.'),
('aub', 10, 'Singh S, Best C, Dunn S, et al. No. 292 — Abnormal Uterine Bleeding in Pre-Menopausal Women. J Obstet Gynaecol Can. 2018;40(5):e391-e415.');

DELETE FROM decision_nodes WHERE tree_id = 'aub';

-- 4. decision_nodes (22 nodes)

-- MODULE 1: INITIAL ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-start', 'aub', 'info', 1,
 'Abnormal Uterine Bleeding',
 'Emergency management of **acute AUB in nonpregnant reproductive-aged women**.

Acute AUB refers to heavy bleeding requiring immediate intervention to prevent further blood loss. May occur spontaneously or within the context of chronic AUB (present >6 months).

**Etiologies classified by PALM-COEIN:**
• **PALM** (structural) — Polyp, Adenomyosis, Leiomyoma, Malignancy/hyperplasia
• **COEIN** (non-structural) — Coagulopathy, Ovulatory dysfunction, Endometrial, Iatrogenic, Not classified

Up to **13% of women** with heavy menstrual bleeding have von Willebrand disease; up to **20%** have an underlying coagulopathy.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-hemodynamic', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-hemodynamic', 'aub', 'question', 1,
 'Hemodynamic Assessment',
 'Assess vitals for signs of hemodynamic instability:
• **Tachycardia** (HR >100)
• **Hypotension** (SBP <90)
• **Orthostatic changes** (SBP drop >20 or HR rise >20 on standing)
• **Altered mental status**

Signs of significant hemorrhage: pallor, diaphoresis, delayed capillary refill, cool extremities.',
 '[1,3]'::jsonb, '[{"label":"Hemodynamically unstable","description":"Tachycardia, hypotension, orthostasis, or active hemorrhage","next":"aub-unstable","urgency":"critical"},{"label":"Hemodynamically stable","description":"Normal vitals, no signs of acute hemorrhage","next":"aub-pregnancy"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-unstable', 'aub', 'info', 1,
 'Unstable AUB — Resuscitate',
 '**Immediate resuscitation:**
• 2 large-bore IVs, IV crystalloid bolus
• **Type & crossmatch** — prepare for PRBC transfusion
• Activate MTP if massive hemorrhage
• **hCG stat** — must rule out pregnancy

**Acute hemostatic therapy:**
• [Tranexamic Acid](#/drug/tranexamic-acid/aub) 1 g IV over 10 min
• [Conjugated Estrogen (Premarin)](#/drug/conjugated-estrogen/unstable aub) 25 mg IV q4-6h
• **Emergent GYN consult**

**If GYN unavailable — intrauterine tamponade:**
• 26F Foley catheter — inflate balloon with **30 mL saline** in uterine cavity
• Bakri balloon (up to 300 mL) if available or uterus enlarged
• Alternative: gauze packing impregnated with **5000 units thrombin** in 5 mL sterile saline
• Stabilize cervix with tenaculum or ring forceps before insertion
• Thread balloon/gauze through cervical os into uterus',
 '[1,3,6,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-treatment-unstable', NULL, NULL, NULL, '[{"src":"images/aub/aub-tamponade.jpg","alt":"Intrauterine balloon tamponade on pelvic model","caption":"Intrauterine balloon tamponade — Foley catheter inserted through cervical os and inflated in uterine cavity"}]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-pregnancy', 'aub', 'question', 1,
 'Pregnancy Excluded?',
 '**Pregnancy MUST be ruled out** before initiating any hormonal therapy.

• Urine hCG (qualitative) — rapid screening
• Serum beta-hCG (quantitative) — if clinical suspicion despite negative urine test

All hormonal treatments for AUB (estrogen, progestins, OCPs) are **contraindicated in pregnancy**.',
 '[1,3]'::jsonb, '[{"label":"Pregnancy excluded (hCG negative)","description":"Proceed with AUB workup","next":"aub-history"},{"label":"Pregnant (hCG positive)","description":"This consult does not apply — evaluate per OB differential","next":"aub-pregnant-exit"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-pregnant-exit', 'aub', 'result', 1,
 'Pregnancy Confirmed — Consult Does Not Apply',
 'This AUB consult covers **nonpregnant reproductive-aged women** only.

For vaginal bleeding in pregnancy, evaluate per trimester:
• **1st trimester:** Ectopic pregnancy, threatened/missed abortion, molar pregnancy
• **2nd/3rd trimester:** Placenta previa, placental abruption, preterm labor

See [Pregnancy Bleeding](#/tree/pregnancy-bleeding) consult (coming soon).

Obtain **OB consultation**. Consider Rh status (RhoGAM if Rh-negative).',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Evaluate pregnancy-related vaginal bleeding per trimester-specific differential. OB consult.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 4)
;


-- MODULE 2: WORKUP
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-history', 'aub', 'info', 2,
 'Focused History & Exam',
 '**Bleeding history:**
• Amount — pads/tampons per hour, passage of clots
• Duration — days of current episode
• Timing — relation to menstrual cycle, LMP
• Chronic vs acute — AUB >6 months is chronic

**Screen for coagulopathy:**
• Heavy menstrual bleeding since menarche?
• PPH, surgical/dental bleeding?
• Easy bruising, epistaxis, family history of bleeding disorder?

**Associated symptoms:**
• Fever/chills → infection (PID, UTI)
• Pelvic pain → ovarian cyst, torsion, adenomyosis
• Weight gain, hirsutism, irregular periods → **PCOS**
• Fatigue, cold intolerance, constipation → hypothyroidism

**Medications:** anticoagulants, HRT, OCPs, IUD, tamoxifen

**Pelvic exam:**
• **Speculum** — identify source of bleeding, cervical lesions, foreign body, discharge
• **Bimanual** — uterine size/contour, adnexal mass/tenderness, CMT',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-labs', 'aub', 'info', 2,
 'Laboratory Workup',
 '**Core labs:**
• **CBC** with platelets — assess anemia severity
• **Type & screen**
• **Pregnancy test** (if not already done)
• **TSH** — thyroid dysfunction is common contributor
• **Iron studies** (ferritin) — if anemia present
• **Chlamydia** screening

**If coagulopathy suspected:**
• PT / PTT / INR / fibrinogen
• [Coagulopathy Screening Tool](#/info/aub-coag-screen) — ACOG structured screening questions
• If screen positive → **vWF antigen**, **ristocetin cofactor**, **Factor VIII**

**Consider:** LFTs (liver disease), prolactin (pituitary), serum hCG (quantitative)',
 '[2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-imaging', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-imaging', 'aub', 'question', 2,
 'Imaging & Endometrial Sampling',
 '**Transvaginal ultrasound** — first-line imaging to evaluate for structural causes (fibroids, polyps, endometrial thickness, adnexal pathology).

**Endometrial biopsy** indications (ACOG):
• Age **≥45** — first-line test for all AUB
• Age **<45** with: obesity, PCOS, chronic anovulation (unopposed estrogen), failed medical management, or persistent AUB

[Endometrial Cancer Risk Factors](#/info/aub-endo-cancer-risk)',
 '[1,2]'::jsonb, '[{"label":"Structural abnormality on US","description":"Fibroid, polyp, adnexal mass, or uterine irregularity","next":"aub-structural"},{"label":"Endometrial thickening or biopsy indicated","description":"Age ≥45, obesity/PCOS, or other risk factors","next":"aub-endometrial-sampling"},{"label":"Normal imaging, no biopsy criteria","description":"Likely non-structural etiology — proceed to classification","next":"aub-classify"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-endometrial-sampling', 'aub', 'info', 2,
 'Endometrial Sampling',
 '**Endometrial biopsy** is indicated to rule out hyperplasia or malignancy.

[Endometrial Cancer Risk Factors](#/info/aub-endo-cancer-risk) — risk factor table with relative risks

**ED considerations:**
• If active heavy bleeding, sampling may be deferred until bleeding is controlled
• Office endometrial biopsy (Pipelle) if available in ED
• Otherwise, arrange **urgent GYN referral** for biopsy
• Do NOT delay acute bleeding management for biopsy

**Ensure GYN follow-up** for pathology results and definitive management.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-classify', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;


-- MODULE 3: ETIOLOGY
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-classify', 'aub', 'question', 3,
 'PALM-COEIN Classification',
 'Classify the most likely etiology to guide treatment.

[PALM-COEIN Classification](#/info/aub-palm-coein) — full classification with clinical features

**Structural causes (PALM)** often need procedural intervention.
**Non-structural causes (COEIN)** are typically managed medically.

**Ovulatory dysfunction** (AUB-O) is the **most common cause** of non-structural AUB — responsible for ~80% of dysfunctional uterine bleeding. Common in obesity, PCOS, extremes of reproductive age.',
 '[2,4]'::jsonb, '[{"label":"Structural (Polyp, Adenomyosis, Leiomyoma, Malignancy)","description":"US findings suggest anatomic cause","next":"aub-structural"},{"label":"Coagulopathy suspected","description":"Positive coag screening, known bleeding disorder, or abnormal labs","next":"aub-coagulopathy"},{"label":"Ovulatory dysfunction (most common)","description":"Anovulatory bleeding — PCOS, obesity, perimenarchal, perimenopausal","next":"aub-treatment-medical"},{"label":"Endometrial / Iatrogenic / Not classified","description":"Endometrial cause, medication-related, or no clear etiology","next":"aub-treatment-medical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-structural', 'aub', 'info', 3,
 'Structural Causes (PALM)',
 '**Polyp (AUB-P):**
Endometrial or cervical polyps. Hysteroscopic polypectomy is definitive treatment. Often found incidentally on US.

**Adenomyosis (AUB-A):**
Endometrial tissue within myometrium. Presents with dysmenorrhea + heavy bleeding. Diffuse uterine enlargement on exam. Medical management or hysterectomy for refractory cases.

**Leiomyoma (AUB-L):**
**Submucosal fibroids** most likely to cause AUB. Size and location guide management. May require myomectomy or uterine artery embolization.

**Malignancy/Hyperplasia (AUB-M):**
Endometrial biopsy is **mandatory**. Risk factors: age >45, obesity, PCOS, unopposed estrogen, tamoxifen, Lynch syndrome. **GYN oncology referral** if malignancy confirmed.

All structural causes warrant **GYN referral** for definitive management. In the ED, control acute bleeding medically, then arrange follow-up.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-treatment-medical', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-coagulopathy', 'aub', 'info', 3,
 'Coagulopathy-Related AUB',
 'Up to **20% of women** with heavy menstrual bleeding have an underlying bleeding disorder. **von Willebrand disease** is most common (up to 13%).

**Testing:**
• vWF antigen, ristocetin cofactor activity, Factor VIII
• Consult hematology for interpretation

**Treatment of AUB with coagulopathy:**
• [Tranexamic Acid](#/drug/tranexamic-acid/aub) — first-line adjunct, reduces bleeding 30-55%
• **Desmopressin (DDAVP)** 0.3 mcg/kg IV — for known vWD responders. Use with caution: risk of fluid retention and hyponatremia. Do NOT give with massive hemorrhage + IV fluid resuscitation.
• Recombinant factor VIII and vWF concentrate for severe vWD
• Hormonal therapy (OCPs, progestins) also effective
• **Avoid NSAIDs** — impair platelet aggregation

**Hematology consult** recommended for all confirmed coagulopathies.',
 '[2,5,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-treatment-medical', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;


-- MODULE 4: TREATMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-treatment-unstable', 'aub', 'question', 4,
 'Ongoing Unstable Bleeding',
 'Reassess hemodynamics after initial resuscitation and IV conjugated estrogen.

**If bleeding controlled:** transition to oral medical management.
**If refractory** despite IV estrogen and tamponade: emergent procedural intervention needed.',
 '[1,3]'::jsonb, '[{"label":"Bleeding controlled","description":"Hemodynamics improved — proceed to oral medical management","next":"aub-treatment-medical"},{"label":"Refractory — needs procedural intervention","description":"Ongoing hemorrhage despite medical therapy and tamponade","next":"aub-surgical","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-treatment-medical', 'aub', 'question', 4,
 'Medical Management Selection',
 'Medical therapy is the **preferred initial treatment** for most patients with acute AUB.

[AUB Treatment Regimens](#/info/aub-treatment-table) — comparison table with dosing, efficacy, and contraindications

Choose regimen based on severity, contraindications, and patient factors. All hormonal therapies require **pregnancy exclusion** (already confirmed).',
 '[1,2]'::jsonb, '[{"label":"IV Conjugated Estrogen (Premarin)","description":"Heavy active bleeding — most rapid onset (72% efficacy in 8h)","next":"aub-rx-estrogen","urgency":"urgent"},{"label":"Combined OCPs","description":"Moderate bleeding, no estrogen contraindications (88% efficacy)","next":"aub-rx-ocp"},{"label":"Medroxyprogesterone (MPA)","description":"Estrogen contraindicated — VTE, migraine, smoker >35 (76% efficacy)","next":"aub-rx-mpa"},{"label":"Tranexamic Acid (TXA)","description":"Adjunct to hormonal therapy, or when hormones contraindicated","next":"aub-rx-txa"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-rx-estrogen', 'aub', 'info', 4,
 'IV Conjugated Estrogen (Premarin)',
 '[Conjugated Estrogen](#/drug/conjugated-estrogen/unstable aub) **25 mg IV** q4-6h for up to **24 hours** (max 6 doses).

**Efficacy:** 72% stop bleeding within 8 hours.

Only FDA-approved treatment for acute AUB.

**MUST follow with progestin** — [Medroxyprogesterone](#/drug/medroxyprogesterone/post-estrogen stabilization) 10 mg PO daily × 10 days after bleeding controlled. Unopposed estrogen risks endometrial hyperplasia and rebound bleeding.

**Start antiemetic prophylactically** (ondansetron) — IV estrogen causes significant nausea.

**Contraindications:**
• Active or past VTE/PE
• Breast cancer (estrogen-receptor positive)
• Active hepatic disease
• Known thrombophilia

Use with **caution** in patients with cardiovascular or thromboembolic risk factors.',
 '[2,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-rx-ocp', 'aub', 'info', 4,
 'Combined OCP Regimen',
 'Monophasic OCP containing **35 mcg ethinyl estradiol** — **1 tablet TID × 7 days**, then taper to 1 tablet daily.

**Efficacy:** 88% stop bleeding within median 3 days.

Preferred for **ovulatory dysfunction AUB** — provides cycle regulation as well as acute control. Can transition directly to daily OCP use for long-term maintenance.

**Contraindications (CDC MEC):**
• Age >35 + cigarette smoking
• Uncontrolled hypertension
• History of DVT/PE or known thrombophilia
• Migraine with aura
• Current or past breast cancer
• Severe liver disease
• Major surgery with prolonged immobilization

Consult CDC Medical Eligibility Criteria (MEC) for comprehensive list.',
 '[2,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-rx-mpa', 'aub', 'info', 4,
 'Medroxyprogesterone Acetate (MPA)',
 '[Medroxyprogesterone](#/drug/medroxyprogesterone/aub) **20 mg PO TID × 7 days**.

**Efficacy:** 76% stop bleeding within median 3 days.

**Preferred when estrogen is contraindicated:**
• History of VTE/PE
• Migraine with aura
• Smoker age >35
• Known thrombophilia

**Especially appropriate for obese/PCOS patients** — anovulation is the mechanism, and progesterone withdrawal stabilizes the endometrium.

**Contraindications:**
• Active VTE/PE
• Current or past breast cancer
• Severe hepatic disease
• Known or suspected pregnancy

Other progestins (norethindrone acetate) may also be effective.',
 '[2,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-rx-txa', 'aub', 'info', 4,
 'Tranexamic Acid (TXA)',
 '[Tranexamic Acid](#/drug/tranexamic-acid/aub) — antifibrinolytic that prevents fibrin degradation.

**Dosing:**
• **Oral:** 1.3 g PO TID × 5 days
• **IV:** 10 mg/kg IV (max 600 mg/dose) q8h

**Efficacy:** Reduces menstrual blood loss **30-55%**.

Can be used **alone** if hormonal therapy is contraindicated, or as **adjunct** to hormonal regimens for more rapid hemostasis.

Does not affect fertility or cycle regularity.

**Contraindications:**
• Active thromboembolic disease (DVT, PE)
• Impaired color vision
• Subarachnoid hemorrhage

**Caution:** Uncertain thrombotic risk — use carefully in patients with thrombosis history. Concurrent OCP use requires careful consideration of additive thrombotic risk.',
 '[2,9]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'aub-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-surgical', 'aub', 'result', 4,
 'Surgical / Procedural Management',
 '[Surgical Management Options](#/info/aub-surgical) — procedure comparison table

**Indications for surgical management:**
• Hemodynamically unstable despite medical therapy
• Failure of medical management
• Suspected structural pathology requiring tissue diagnosis
• Contraindications to all medical therapies

**Options (GYN to determine):**
• **D&C with hysteroscopy** — diagnostic + therapeutic, preferred if intrauterine pathology suspected
• **Endometrial ablation** — only if childbearing complete and malignancy excluded
• **Uterine artery embolization (UAE)** — for fibroids or refractory bleeding
• **Hysterectomy** — definitive treatment for refractory cases

D&C alone (without hysteroscopy) is inadequate for evaluation and provides only temporary reduction in bleeding.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Emergent GYN consult. Admit for procedural intervention.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 18)
;


-- MODULE 5: DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-disposition', 'aub', 'question', 5,
 'Disposition',
 '**Admit if:**
• Hemodynamic instability
• Hgb <7 g/dL (or symptomatic anemia requiring transfusion)
• Failed outpatient management
• Need for procedural intervention
• Suspected malignancy requiring urgent workup

**Discharge if:**
• Hemodynamically stable
• Bleeding controlled or significantly improved
• Hgb stable and adequate
• Reliable GYN follow-up available

[Long-term Maintenance Options](#/info/aub-maintenance) — levonorgestrel IUD, cyclic OCPs, progestins',
 '[1,2]'::jsonb, '[{"label":"Admit","description":"Unstable, severe anemia, procedural need, or suspected malignancy","next":"aub-admit","urgency":"urgent"},{"label":"Discharge with GYN follow-up","description":"Stable, bleeding controlled, reliable follow-up","next":"aub-discharge"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-admit', 'aub', 'result', 5,
 'Admit',
 '**Admission orders:**
• GYN consult (or Medicine with GYN consult)
• Continue medical management (IV estrogen, TXA, progestins as indicated)
• Serial CBC q6-8h
• Type & crossmatch — keep active
• Transfuse PRBCs if Hgb <7 or symptomatic
• Reassess need for procedural intervention
• Hematology consult if coagulopathy identified
• VTE prophylaxis once hemostasis achieved',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Admit to GYN or Medicine. Continue IV hormonal therapy. Serial Hgb monitoring.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 20)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('aub-discharge', 'aub', 'result', 5,
 'Discharge with GYN Follow-up',
 '[AUB Discharge Instructions](#/info/aub-discharge) — shareable patient handout

**Discharge with:**
• Prescription for chosen oral regimen (OCP or MPA) — **complete full 7-day course**
• **Iron supplementation** — ferrous sulfate 325 mg PO daily if anemic
• GYN follow-up within **1-2 weeks**
• All patients with significant anemia should be started on iron

**Return precautions:**
• Soaking >1 pad/hour for 2+ consecutive hours
• Lightheadedness, dizziness, or syncope
• Persistent heavy bleeding despite completing prescribed regimen
• Fever

**Obese/PCOS patients:** Emphasize need for long-term hormonal management to prevent endometrial hyperplasia and reduce cancer risk.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Discharge with oral hormonal regimen, iron supplementation, and GYN follow-up in 1-2 weeks.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 21)
;


-- 5. drugs (2 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('conjugated-estrogen', 'Conjugated Estrogen (Premarin)', 'Conjugated equine estrogens', 'Estrogen', 'IV',
 '["Acute abnormal uterine bleeding (unstable or heavy)"]'::jsonb,
 '[{"indication":"Unstable AUB / Acute Heavy Bleeding","regimen":"25 mg IV over 5 min, may repeat q4-6h for up to 24h (max 6 doses). 72% stop bleeding within 8h (only FDA-approved treatment for acute AUB). MUST follow with progestin (medroxyprogesterone 10 mg PO daily × 10 days) after bleeding controlled to stabilize endometrium and prevent rebound. Start antiemetic prophylaxis (ondansetron) — IV estrogen causes significant nausea."}]'::jsonb,
 '["Active or past venous thromboembolism (DVT/PE)","Active or past arterial thromboembolic disease (stroke, MI)","Breast cancer (estrogen-receptor positive)","Active hepatic disease or liver dysfunction","Known thrombophilia"]'::jsonb,
 '["VTE risk increases with duration of use — limit to 24h acute treatment","Nausea/vomiting very common with IV dosing — premedicate with ondansetron","Must be followed by progestin therapy to stabilize endometrium","Use with caution in patients with cardiovascular risk factors","Not for long-term use — transition to OCPs or progestin for maintenance"]'::jsonb,
 'Bleeding reassessment q4-6h. Hemodynamics. CBC q6h if unstable. Watch for signs of VTE.',
 'Only treatment specifically FDA-approved for acute AUB. Mechanism: promotes rapid endometrial growth over denuded areas, stabilizing fragile vessels. DeVore 1982 RCT showed 72% efficacy vs 38% placebo within 8h. Must always be followed by a progestin course to prevent unopposed estrogen effects (endometrial hyperplasia).',
 NULL,
 '["ACOG Committee Opinion No. 557. Management of Acute AUB in Nonpregnant Reproductive-Aged Women. Obstet Gynecol. 2013;121(4):891-896.","DeVore GR, et al. IV Premarin for dysfunctional uterine bleeding. Obstet Gynecol. 1982;59(3):285-291."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('medroxyprogesterone', 'Medroxyprogesterone Acetate (MPA)', 'Medroxyprogesterone acetate', 'Progestin', 'PO',
 '["Acute abnormal uterine bleeding","Endometrial stabilization post-estrogen"]'::jsonb,
 '[{"indication":"AUB — Acute Management","regimen":"20 mg PO TID × 7 days. 76% efficacy in stopping acute bleeding. Preferred when estrogen is contraindicated (VTE history, migraine with aura, smoker >35). Especially appropriate for obese/PCOS patients — progesterone withdrawal stabilizes the endometrium."},{"indication":"Post-IV Estrogen Stabilization","regimen":"10 mg PO daily × 10 days. Must follow IV conjugated estrogen to prevent rebound bleeding from unopposed estrogen stimulation of the endometrium."}]'::jsonb,
 '["Active deep vein thrombosis or pulmonary embolism","Active or recent arterial thromboembolic disease","Current or past breast cancer","Impaired liver function or liver disease","Known or suspected pregnancy"]'::jsonb,
 '["Breakthrough bleeding common during first cycle of treatment","May cause mood changes, headache, bloating, breast tenderness","Transition to long-term hormonal therapy (LNG-IUD, OCPs) after acute course","For obese/PCOS patients: ongoing hormonal management needed to prevent endometrial hyperplasia"]'::jsonb,
 'Bleeding pattern reassessment at GYN follow-up (1-2 weeks). CBC if anemic at discharge.',
 'Munro 2006 RCT compared MPA 20 mg TID vs OCPs TID for acute AUB: MPA stopped bleeding in 76% vs 88% for OCPs. MPA is preferred over OCPs when estrogen is contraindicated. Mechanism: stabilizes endometrium by providing the progesterone that anovulatory patients lack, then organized withdrawal bleeding occurs after stopping the course.',
 NULL,
 '["ACOG Committee Opinion No. 557. Management of Acute AUB in Nonpregnant Reproductive-Aged Women. Obstet Gynecol. 2013;121(4):891-896.","Munro MG, et al. Oral MPA and combination OCPs for acute uterine bleeding: RCT. Obstet Gynecol. 2006;108:924-929."]'::jsonb,
 1)
;


-- 5b. drugs — UPDATE existing entries (1 drugs)
-- Updating Tranexamic Acid (TXA) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["ICH hemostasis (adjunct)","Abnormal uterine bleeding (AUB)","Trauma hemorrhage","Postpartum hemorrhage","Thrombolysis reversal (adjunct)"]'::jsonb,
  dosing = '[{"indication":"ICH hemostasis (adjunct — within 3h of onset)","regimen":"1 g IV over 10 min. Reduced hematoma expansion (OR 0.82, TICH-2) but no improvement in mortality or functional outcome. Consider as adjunct."},{"indication":"Abnormal Uterine Bleeding (AUB)","regimen":"Oral: 1.3 g PO TID × 5 days. IV: 10 mg/kg IV (max 600 mg/dose) q8h. Reduces menstrual blood loss 30–55%. Can be used alone if hormonal therapy is contraindicated, or as adjunct to hormonal regimens. Does not affect fertility or cycle regularity.","weightCalc":{"dosePerKg":10,"unit":"mg","maxDose":600,"label":"IV dosing (q8h)"}}]'::jsonb,
  contraindications = '["Active thromboembolic disease (DVT, PE, stroke)","Subarachnoid hemorrhage (risk of vasospasm)","Impaired color vision (acquired defective)"]'::jsonb,
  cautions = '["Seizure risk at high doses (>2 g)","Renal impairment — dose reduce if CrCl <50 mL/min","Thrombotic risk — avoid in patients with active DVT/PE","Concurrent OCP use requires careful consideration of additive thrombotic risk"]'::jsonb,
  monitoring = 'ICH: Repeat CT at 6h to assess hematoma stability. AUB: Bleeding pattern assessment. Watch for thrombotic complications.',
  notes = 'Competitively inhibits plasminogen activation, stabilizing clots. ICH: TICH-2 trial (2,325 patients) showed significant reduction in hematoma expansion but no functional outcome benefit. AUB: Cochrane review (Lethaby 2000) showed 30–55% reduction in menstrual blood loss. FDA-approved for cyclic heavy menstrual bleeding (Lysteda).',
  citations = '["Sprigg N, et al. Tranexamic acid for hyperacute primary IntraCerebral Haemorrhage (TICH-2). Lancet. 2018;391(10135):2107-2115.","Steiner T, et al. ESO/EANS guideline on stroke due to spontaneous ICH. Eur Stroke J. 2025;10(4):1007-1086."]'::jsonb
WHERE id = 'tranexamic-acid';


-- 6. info_pages (7 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-coag-screen', 'Coagulopathy Screening Tool', 'ACOG screening for underlying bleeding disorders in AUB',
 '[{"heading":"Positive Screen Criteria (ACOG)","body":"A positive screening result comprises:\n\n• **Heavy menstrual bleeding since menarche**\n\nPLUS one of the following:\n• Postpartum hemorrhage\n• Surgery-related bleeding\n• Bleeding associated with dental work\n\nOR two or more of the following:\n• Bruising 1–2 times per month\n• Epistaxis 1–2 times per month\n• Frequent gum bleeding\n• Family history of bleeding symptoms"},{"heading":"If Screening is Positive","body":"• Order: **von Willebrand factor antigen**, **ristocetin cofactor activity**, **Factor VIII**\n• Consult hematology for interpretation\n• Up to 13% of women with heavy menstrual bleeding have von Willebrand disease\n• Up to 20% may have some underlying coagulation disorder\n• Also consider: other coagulation factor deficiencies, platelet function disorders, hemophilia carriers"},{"heading":"Other Lab Considerations","body":"• Systemic diseases (leukemia, liver failure) can impair coagulation\n• Medications (anticoagulants, chemotherapy) should be reviewed\n• Adolescents with heavy menses since menarche presenting with acute AUB should undergo vWD testing regardless of screening result"}]'::jsonb,
 '[{"num":1,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB in Nonpregnant Reproductive-Aged Women. Obstet Gynecol. 2013;121(4):891-896."},{"num":2,"text":"Kouides PA, et al. Hemostasis and menstruation. Fertil Steril. 2005;84(5):1345-1351."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-palm-coein', 'PALM-COEIN Classification', 'FIGO classification system for causes of AUB',
 '[{"heading":"PALM — Structural Causes","body":"**Polyp (AUB-P)**\nEndometrial or endocervical growths. Often asymptomatic but can cause intermenstrual or heavy bleeding. Diagnosed by US or hysteroscopy. Treatment: polypectomy.\n\n**Adenomyosis (AUB-A)**\nEndometrial tissue within the myometrium. Causes heavy, painful periods with diffuse uterine enlargement. Diagnosed by MRI or US. Treatment: medical or hysterectomy.\n\n**Leiomyoma (AUB-L)**\nBenign smooth muscle tumors. Submucosal fibroids (AUB-LₛM) most likely to cause AUB. Size and location guide management. Treatment: medical, myomectomy, UAE, or hysterectomy.\n\n**Malignancy & Hyperplasia (AUB-M)**\nEndometrial hyperplasia or carcinoma. Diagnosed by endometrial biopsy. Risk factors: age, obesity, unopposed estrogen, PCOS, tamoxifen, Lynch syndrome. Requires GYN oncology referral."},{"heading":"COEIN — Non-Structural Causes","body":"**Coagulopathy (AUB-C)**\nInherited or acquired bleeding disorders. vWD most common (up to 13% of HMB). Screen with structured tool.\n\n**Ovulatory Dysfunction (AUB-O)**\nMost common cause of dysfunctional uterine bleeding (~80%). Anovulatory cycles lead to unopposed estrogen → endometrial proliferation → irregular shedding. Common in: PCOS, obesity, perimenarchal, perimenopausal, stress, weight changes.\n\n**Endometrial (AUB-E)**\nPrimary endometrial disorder with normal ovulatory cycles. Defects in local hemostasis, inflammation, or angiogenesis.\n\n**Iatrogenic (AUB-I)**\nMedication-related: anticoagulants, hormonal therapy, IUD, chemotherapy, steroids.\n\n**Not Yet Classified (AUB-N)**\nRare or poorly understood etiologies (e.g., AV malformations, myometrial hypertrophy)."}]'::jsonb,
 '[{"num":1,"text":"Munro MG, et al. FIGO classification system (PALM-COEIN) for causes of AUB. Int J Gynaecol Obstet. 2011;113(1):3-13."},{"num":2,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB. Obstet Gynecol. 2013;121(4):891-896."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-endo-cancer-risk', 'Endometrial Cancer Risk Factors', 'Who needs endometrial biopsy?',
 '[{"heading":"Risk Factors & Relative Risk","body":"• **Increasing age** — 1.4% prevalence in women 50–70\n• **Unopposed estrogen therapy** — RR 2–10\n• **Tamoxifen therapy** — RR 2\n• **Early menarche** — increased risk\n• **Late menopause (after age 55)** — RR 2\n• **Nulliparity** — RR 2\n• **PCOS (chronic anovulation)** — RR 3\n• **Obesity** — RR 2–4\n• **Diabetes mellitus** — RR 2\n• **Lynch syndrome (HNPCC)** — 22–50% lifetime risk\n• **Cowden syndrome** — 13–19% lifetime risk\n• **Family history** of endometrial, ovarian, breast, or colon cancer"},{"heading":"Biopsy Indications (ACOG)","body":"• **Age ≥45** with AUB — first-line test\n• **Age <45** with any of:\n  — Obesity or PCOS (unopposed estrogen exposure)\n  — Chronic anovulation\n  — Failed medical management of AUB\n  — Persistent AUB\n• Postmenopausal bleeding (always evaluate)\n\n**Obese patients** are at particularly high risk — adipose tissue converts androgens to estrogen via aromatase, creating chronic unopposed estrogen stimulation of the endometrium."}]'::jsonb,
 '[{"num":1,"text":"Smith RA, et al. ACS guidelines for early detection of cancer. CA Cancer J Clin. 2001;51:38."},{"num":2,"text":"ACOG Practice Bulletin No. 128. Diagnosis of AUB in reproductive-aged women. Obstet Gynecol. 2012;120:197-206."}]'::jsonb,
 false,
 2)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-treatment-table', 'AUB Treatment Regimens', 'Medical management comparison — dosing, efficacy, and contraindications',
 '[{"heading":"IV Conjugated Equine Estrogen (Premarin)","body":"**Dose:** 25 mg IV q4–6h for up to 24h\n**Efficacy:** 72% stop bleeding within 8h\n**Key CI:** Active VTE, breast cancer, hepatic disease\n**Notes:** Only FDA-approved treatment for acute AUB. Must follow with progestin (MPA 10 mg PO × 10d). Premedicate with antiemetic."},{"heading":"Combined Oral Contraceptives (OCPs)","body":"**Dose:** Monophasic OCP with 35 mcg ethinyl estradiol, 1 tab TID × 7 days\n**Efficacy:** 88% stop bleeding (median 3 days)\n**Key CI:** Smoking + age >35, HTN, VTE history, migraine with aura, breast cancer\n**Notes:** Preferred for ovulatory dysfunction AUB. Provides cycle regulation. Can transition to daily OCP for maintenance."},{"heading":"Medroxyprogesterone Acetate (MPA)","body":"**Dose:** 20 mg PO TID × 7 days\n**Efficacy:** 76% stop bleeding (median 3 days)\n**Key CI:** Active VTE, breast cancer, hepatic disease\n**Notes:** Preferred when estrogen contraindicated. Good for obese/PCOS patients. Alternative progestins (norethindrone acetate) may also be effective."},{"heading":"Tranexamic Acid (TXA)","body":"**Dose:** 1.3 g PO TID × 5 days OR 10 mg/kg IV (max 600 mg) q8h\n**Efficacy:** Reduces menstrual blood loss 30–55%\n**Key CI:** Active thrombosis, impaired color vision\n**Notes:** Antifibrinolytic — can use alone or as adjunct. Does not affect fertility. Caution with concurrent OCPs (additive thrombotic risk)."},{"heading":"Intrauterine Tamponade (Procedural)","body":"**Method:** 26F Foley catheter inflated with 30 mL saline in uterine cavity. Bakri balloon (up to 300 mL) for enlarged uterus. Alternative: gauze packing with thrombin.\n**When:** GYN unavailable and medical therapy insufficient\n**Notes:** Temporizing measure while arranging definitive care. Consult GYN STAT."}]'::jsonb,
 '[{"num":1,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB. Obstet Gynecol. 2013;121(4):891-896."},{"num":2,"text":"DeVore GR, et al. IV Premarin for DUB. Obstet Gynecol. 1982;59(3):285-291."},{"num":3,"text":"Munro MG, et al. Oral MPA and OCPs for acute uterine bleeding: RCT. Obstet Gynecol. 2006;108:924-929."}]'::jsonb,
 false,
 3)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-surgical', 'Surgical Management Options', 'When medical therapy fails or is contraindicated',
 '[{"heading":"Indications for Surgery","body":"• Clinically unstable despite medical management\n• Failed medical therapy\n• Contraindications to all medical therapies\n• Suspected structural pathology requiring tissue diagnosis\n• Known malignancy"},{"heading":"D&C with Hysteroscopy","body":"**Diagnostic + therapeutic.** Preferred if intrauterine pathology suspected (polyp, submucosal fibroid). D&C alone (without hysteroscopy) is inadequate for evaluation and provides only temporary reduction — subsequent cycles are not improved. Preserves fertility."},{"heading":"Endometrial Ablation","body":"Destroys the endometrial lining. Only if:\n• Other treatments ineffective or contraindicated\n• **Childbearing complete** (pregnancy after ablation is dangerous)\n• Endometrial/uterine cancer **reliably ruled out**\n\nMultiple techniques: thermal balloon, radiofrequency, cryoablation."},{"heading":"Uterine Artery Embolization (UAE)","body":"Interventional radiology procedure. Most effective for fibroid-related AUB. Reduces blood supply to fibroids. May affect future fertility — discuss with patient. Case reports show successful use for acute AUB control."},{"heading":"Hysterectomy","body":"**Definitive treatment** for controlling heavy bleeding. Reserved for:\n• Failure of all medical and less-invasive surgical options\n• Completed childbearing\n• Known malignancy\n• Patient preference after counseling\n\nMay be performed vaginally, laparoscopically, or via laparotomy depending on clinical context."}]'::jsonb,
 '[{"num":1,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB. Obstet Gynecol. 2013;121(4):891-896."}]'::jsonb,
 false,
 4)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-maintenance', 'Long-term Maintenance Options', 'After acute AUB is controlled',
 '[{"heading":"Levonorgestrel IUD (Mirena)","body":"Most effective medical option for long-term AUB management. Reduces menstrual blood loss by up to **97%**. Lasts 5–8 years. Especially beneficial for obese/PCOS patients — provides continuous endometrial suppression and reduces endometrial cancer risk."},{"heading":"Cyclic OCPs","body":"Monthly or extended-cycle regimens. Regulate ovulation, thin endometrium, reduce blood loss. Good first-line for younger patients who also need contraception. Review CDC MEC for eligibility."},{"heading":"Progestin Therapy","body":"• **Oral progestins** (MPA, norethindrone) — cyclic (days 14–25) or continuous\n• **Depo-medroxyprogesterone** (DMPA) 150 mg IM q3 months\n• **Etonogestrel implant** (Nexplanon)\n\nPreferred when estrogen is contraindicated. Critical for obese/PCOS patients to prevent endometrial hyperplasia from chronic unopposed estrogen."},{"heading":"Tranexamic Acid","body":"1.3 g PO TID during menses (first 5 days). Non-hormonal option. Can be combined with hormonal therapies. Does not affect fertility or cycle regularity."},{"heading":"NSAIDs","body":"Ibuprofen, naproxen, mefenamic acid. Reduce menstrual blood loss by 20–50% via prostaglandin inhibition. Take during menses only. **Avoid in patients with bleeding disorders** (impair platelet aggregation)."}]'::jsonb,
 '[{"num":1,"text":"NICE. Heavy menstrual bleeding: assessment and management. Clinical guideline CG44. 2007 (updated 2018)."},{"num":2,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB. Obstet Gynecol. 2013;121(4):891-896."}]'::jsonb,
 false,
 5)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('aub-discharge', 'Discharge Instructions', 'Abnormal Uterine Bleeding',
 '[{"heading":"Your Diagnosis","body":"You were seen in the emergency department for abnormal uterine bleeding. You have been started on medication to help control the bleeding."},{"heading":"Medications","body":"• Take your prescribed medication exactly as directed\n• Complete the **full course** (usually 7 days) even if bleeding improves\n• You may experience nausea with hormonal medications — take with food\n• If prescribed iron supplements, take on an empty stomach with vitamin C for best absorption (or with food if nausea occurs)"},{"heading":"Return to the ED Immediately If","body":"• Soaking through more than 1 pad or tampon per hour for 2 or more hours in a row\n• Feeling dizzy, lightheaded, or faint\n• Passing out (syncope)\n• Chest pain or difficulty breathing\n• Fever (temperature above 100.4°F / 38°C)\n• Severe abdominal or pelvic pain\n• Bleeding does not improve after completing your medication course"},{"heading":"Follow-Up Care","body":"• **See a gynecologist (OB/GYN) within 1–2 weeks**\n• Your doctor may recommend additional testing or long-term treatment to prevent future episodes\n• If you have obesity or irregular periods, long-term hormonal management is important to reduce your risk of future complications\n• Continue iron supplements if you were told you are anemic"},{"heading":"Important Reminders","body":"• Do not skip doses of your medication\n• Avoid aspirin and ibuprofen unless approved by your doctor (they can worsen bleeding)\n• Stay well hydrated\n• Rest as needed — you may feel tired from blood loss\n• Keep track of your bleeding pattern to share with your gynecologist"}]'::jsonb,
 '[{"num":1,"text":"ACOG Committee Opinion No. 557. Management of Acute AUB. Obstet Gynecol. 2013;121(4):891-896."}]'::jsonb,
 true,
 6)
;

COMMIT;
