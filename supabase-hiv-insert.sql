-- =====================================================================
-- MedKitt — HIV ED Management Consult: Supabase INSERT Statements
-- Generated: 2026-03-11
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'hiv',
  'HIV ED Management',
  'Assessment → Seroconversion → Complications → OI → Meds → Prevention',
  '1.0',
  34,
  'hiv-start',
  '["Initial Assessment","Seroconversion & Testing","Well-Controlled HIV","Immunocompromised / OI","Medication Effects","Prevention & Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('infectious-disease', 'hiv', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('emergency-medicine', 'hiv', NULL, NULL, NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (64 citations)
DELETE FROM tree_citations WHERE tree_id = 'hiv';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('hiv', 1, 'U.S. Centers for Disease Control and Prevention. CDC Fact Sheet: Vital Signs, 2019. (CDC data report)'),
('hiv', 2, 'U.S. Centers for Disease Control and Prevention. HIV in the United States and Dependent Areas. (CDC statistics)'),
('hiv', 3, 'Branson BM, Handsfield HH, Lampe MA, et al. Revised recommendations for HIV testing of adults, adolescents, and pregnant women in health-care settings. MMWR Recomm Rep. 2006;55(RR-14):1-17. (Practice guidelines)'),
('hiv', 4, 'Mohareb AM, Rothman RE, Hsieh YH. Emergency department (ED) utilization by HIV-infected ED patients in the United States in 2009 and 2010. HIV Med. 2013;14(10):605-613. (Comparative study; 1,192,535 ED visits)'),
('hiv', 5, 'Napoli AM, Fischer CM, Pines JM, et al. Absolute lymphocyte count in the emergency department predicts a low CD4 count in admitted HIV-positive patients. Acad Emerg Med. 2011;18(4):385-389. (Retrospective cohort; 866 patients)'),
('hiv', 6, 'Shapiro NI, Karras DJ, Leech SH, et al. Absolute lymphocyte count as a predictor of CD4 count. Ann Emerg Med. 1998;32(3 Pt 1):323-328. (Retrospective; 807 samples)'),
('hiv', 7, 'U.S. Preventive Services Task Force. Final Recommendation Statement: Human Immunodeficiency Virus (HIV) Infection: Screening. Grade A recommendation. (Guidelines)'),
('hiv', 8, 'American College of Emergency Physicians. Policy Compendium 2021 — section on HIV testing and screening in EDs. (ACEP policies)'),
('hiv', 9, 'White DAE, Giordano TP, Pasalar S, et al. Acute HIV discovered during routine HIV screening with HIV antigen-antibody combination tests in 9 US emergency departments. Ann Emerg Med. 2018;72(1):29-40. (Retrospective; 9 EDs, 214,524 patients)'),
('hiv', 10, 'Rodger AJ, Cambiano V, Bruun T, et al. Risk of HIV transmission through condomless sex in serodifferent gay couples with the HIV-positive partner taking suppressive antiretroviral therapy (PARTNER 2). Lancet. 2019;393(10189):2428-2438. (Multicenter prospective observational; 972 gay couples)'),
('hiv', 11, 'Bavinton BR, Pinto AN, Phanuphak N, et al. Viral suppression and HIV transmission in serodiscordant male couples (Opposites Attract). Lancet HIV. 2018;5(8):e438-e447. (Prospective observational; 358 couples)'),
('hiv', 12, 'Saag MS, Gandhi RT, Hoy JF, et al. Antiretroviral drugs for treatment and prevention of HIV infection in adults: 2020 recommendations of the International Antiviral Society-USA panel. JAMA. 2020;324(16):1651-1669. (Guidelines)'),
('hiv', 13, 'U.S. Department of Health and Human Services. Guidelines for the Use of Antiretroviral Agents in Adults and Adolescents with HIV. (Guidelines)'),
('hiv', 14, 'Palella FJ Jr, Baker RK, Moorman AC, et al. Mortality in the highly active antiretroviral therapy era: changing causes of death and disease in the HIV outpatient study. J Acquir Immune Defic Syndr. 2006;43(1):27-34. (Prospective multicenter observational; 6945 patients)'),
('hiv', 15, 'Almeida A, Boattini M. Community-acquired pneumonia in HIV-positive patients: an update on etiologies, epidemiology and management. Curr Infect Dis Rep. 2017;19(1):2. (Review)'),
('hiv', 16, 'Cilloniz C, Garcia-Vidal C, Moreno A, et al. Community-acquired bacterial pneumonia in adult HIV-infected patients. Expert Rev Anti Infect Ther. 2018;16(7):579-588. (Review)'),
('hiv', 17, 'Almeida A, Almeida AR, Castelo Branco S, et al. CURB-65 and other markers of illness severity in community-acquired pneumonia among HIV-positive patients. Int J STD AIDS. 2016;27(11):998-1004. (Retrospective; 396 patients)'),
('hiv', 18, 'Fitzpatrick M, Brooks JT, Kaplan JE. Epidemiology of HIV-associated lung disease in the United States. Semin Respir Crit Care Med. 2016;37(2):181-198. (Review)'),
('hiv', 19, 'Crothers K, Butt AA, Gibert CL, et al. Increased COPD among HIV-positive compared to HIV-negative veterans. Chest. 2006;130(5):1326-1333. (Prospective observational; 1014 HIV+ and 713 HIV- men)'),
('hiv', 20, 'Alvaro-Meca A, Ryan P, Martinez-Larrull E, et al. Epidemiological trends of deep venous thrombosis in HIV-infected subjects (1997-2013). Eur J Intern Med. 2018;48:69-74. (Retrospective)'),
('hiv', 21, 'Rasmussen LD, Dybdal M, Gerstoft J, et al. HIV and risk of venous thromboembolism: a Danish nationwide population-based cohort study. HIV Med. 2011;12(4):202-210. (Population-based cohort; 4333 patients)'),
('hiv', 22, 'Ballocca F, D''Ascenzo F, Gili S, et al. Cardiovascular disease in patients with HIV. Trends Cardiovasc Med. 2017;27(8):558-563. (Review)'),
('hiv', 23, 'Barnes RP, Lacson JC, Bahrami H. HIV infection and risk of cardiovascular diseases beyond coronary artery disease. Curr Atheroscler Rep. 2017;19(5):20. (Review)'),
('hiv', 24, 'Dorjee K, Choden T, Baxi SM, et al. Risk of cardiovascular disease associated with exposure to abacavir among individuals with HIV: a systematic review and meta-analyses of results from 17 epidemiologic studies. Int J Antimicrob Agents. 2018;52(5):541-553. (Systematic review; 17 studies)'),
('hiv', 25, 'Elion RA, Althoff KN, Zhang J, et al. Recent abacavir use increases risk of type 1 and type 2 myocardial infarctions among adults with HIV. J Acquir Immune Defic Syndr. 2018;78(1):62-72. (Retrospective; 8265 patients)'),
('hiv', 26, 'Al-Kindi SG, ElAmm C, Ginwalla M, et al. Heart failure in patients with human immunodeficiency virus infection: epidemiology and management disparities. Int J Cardiol. 2016;218:43-46. (Database review; 36,400 patients)'),
('hiv', 27, 'Alonso A, Barnes AE, Guest JL, et al. HIV infection and incidence of cardiovascular diseases: an analysis of a large healthcare database. J Am Heart Assoc. 2019;8(14):e012241. (Database statistical analysis)'),
('hiv', 28, 'Sullivan PS, Dworkin MS, Jones JL, et al. Epidemiology of thrombosis in HIV-infected individuals. AIDS. 2000;14(3):321-324. (Prospective observational; 42,935 patients)'),
('hiv', 29, 'Howard JFB, Rokx C, Smit C, et al. Incidence of a first venous thrombotic event in people with HIV in the Netherlands. Lancet HIV. 2019;6(3):e173-e181. (Retrospective cohort; 14,389 patients)'),
('hiv', 30, 'Shah ASV, Stelzle D, Lee KK, et al. Global burden of atherosclerotic cardiovascular disease in people living with HIV: systematic review and meta-analysis. Circulation. 2018;138(11):1100-1112. (Systematic review; 80 studies, 793,635 patients)'),
('hiv', 31, 'Heaton RK, Franklin DR Jr, Deutsch R, et al. Neurocognitive change in the era of HIV combination antiretroviral therapy: the longitudinal CHARTER study. Clin Infect Dis. 2015;60(3):473-480. (Longitudinal cohort; 436 HIV-infected participants)'),
('hiv', 32, 'daCosta DiBonaventura M, Gupta S, Cho M, et al. The association of HIV/AIDS treatment side effects with health status, work productivity, and resource use. AIDS Care. 2012;24(6):744-755. (Cross-sectional survey; 953 patients)'),
('hiv', 33, 'Dikman AE, Schonfeld E, Srisarajivakul NC, et al. Human immunodeficiency virus-associated diarrhea: still an issue in the era of antiretroviral therapy. Dig Dis Sci. 2015;60(8):2236-2245. (Review)'),
('hiv', 34, 'Collini PJ, Kuijper E, Dockrell DH. Clostridium difficile infection in patients with HIV/AIDS. Curr HIV/AIDS Rep. 2013;10(3):273-282. (Review)'),
('hiv', 35, 'Radwan D, Cachay E, Falade-Nwulia O, et al. HCV screening and treatment uptake among patients in HIV care during 2014-2015. J Acquir Immune Defic Syndr. 2019;80(5):559-567. (Prospective observational; 29,071 patients)'),
('hiv', 36, 'Chun HM, Fieberg AM, Hullsiek KH, et al. Epidemiology of hepatitis B virus infection in a US cohort of HIV-infected individuals during the past 20 years. Clin Infect Dis. 2010;50(3):426-436. (Observational cohort; 1078 patients)'),
('hiv', 37, 'Gupta SK, Anderson AM, Ebrahimi R, et al. Fanconi syndrome accompanied by renal function decline with tenofovir disoproxil fumarate. PLoS One. 2014;9(3):e92717. (Prospective case-control; 19 cases, 37 controls)'),
('hiv', 38, 'Arribas JR, Thompson M, Sax PE, et al. Randomized, double-blind comparison of tenofovir alafenamide (TAF) vs tenofovir disoproxil fumarate (TDF): week 144 results. J Acquir Immune Defic Syndr. 2017;75(2):211-218. (RCT double-blind; 1733 patients)'),
('hiv', 39, 'Arumainayagam N, Gresty H, Shamsuddin A, et al. Human immunodeficiency virus (HIV)-related stone disease — a potential new paradigm? BJU Int. 2015;116(5):684-686. (Review)'),
('hiv', 40, 'Izzedine H, Lescure FX, Bonnet F. HIV medication-based urolithiasis. Clin Kidney J. 2014;7(2):121-126. (Review)'),
('hiv', 41, 'Becker S, Fusco G, Fusco J, et al. HIV-associated thrombotic microangiopathy in the era of highly active antiretroviral therapy: an observational study. Clin Infect Dis. 2004;39 Suppl 5:S267-S275. (Multicenter observational; 6022 patients)'),
('hiv', 42, 'Non LR, Escota GV, Powderly WG. HIV and its relationship to insulin resistance and lipid abnormalities. Transl Res. 2017;183:41-56. (Review)'),
('hiv', 43, 'Willig AL, Overton ET. Metabolic complications and glucose metabolism in HIV infection: a review of the evidence. Curr HIV/AIDS Rep. 2016;13(5):289-296. (Review)'),
('hiv', 44, 'Weetman A. Immune reconstitution syndrome and the thyroid. Best Pract Res Clin Endocrinol Metab. 2009;23(6):693-702. (Review)'),
('hiv', 45, 'Hadigan C, Kattakuzhy S. Diabetes mellitus type 2 and abnormal glucose metabolism in the setting of human immunodeficiency virus. Endocrinol Metab Clin North Am. 2014;43(3):685-696. (Review)'),
('hiv', 46, 'Takhar SS, Hendey GW. Orthopedic illnesses in patients with HIV. Emerg Med Clin North Am. 2010;28(2):335-342. (Review)'),
('hiv', 47, 'Hoy J, Young B. Do people with HIV infection have a higher risk of fracture compared with those without HIV infection? Curr Opin HIV AIDS. 2016;11(3):301-305. (Review)'),
('hiv', 48, 'Marquez J, Restrepo CS, Candia L, et al. Human immunodeficiency virus-associated rheumatic disorders in the HAART era. J Rheumatol. 2004;31(4):741-746. (Prospective; 75 patients)'),
('hiv', 49, 'Nedelcovych MT, Manning AA, Semenova S, et al. The psychiatric impact of HIV. ACS Chem Neurosci. 2017;8(7):1432-1434. (Review)'),
('hiv', 50, 'Martins CR. Cutaneous drug reactions associated with newer antiretroviral agents. J Drugs Dermatol. 2006;5(10):976-982. (Review)'),
('hiv', 51, 'Smith RL, Ripps CS, Lewis ML. Elevated lactate dehydrogenase values in patients with Pneumocystis carinii pneumonia. Chest. 1988;93(5):987-992. (Case comparison; 7 cases)'),
('hiv', 52, 'Mallal S, Nolan D, Witt C, et al. Association between presence of HLA-B*5701 and hypersensitivity to HIV-1 reverse-transcriptase inhibitor abacavir. Lancet. 2002;359(9308):727-732. (Cohort; 200 participants)'),
('hiv', 53, 'U.S. Centers for Disease Control and Prevention. Preexposure Prophylaxis for the Prevention of HIV Infection in the United States — 2017 Update: A Clinical Practice Guideline. (CDC guidelines)'),
('hiv', 54, 'Mayer KH, Molina JM, Thompson MA, et al. Emtricitabine and tenofovir alafenamide vs emtricitabine and tenofovir disoproxil fumarate for HIV pre-exposure prophylaxis (DISCOVER). Lancet. 2020;396(10246):239-254. (RCT phase 3; 5857 participants)'),
('hiv', 55, 'Cespedes MS, Aberg JA. Neuropsychiatric complications of antiretroviral therapy. Drug Saf. 2006;29(10):865-874. (Review)'),
('hiv', 56, 'Gatell JM, Morales-Ramirez JO, Hagins DP, et al. Doravirine dose selection and 96-week safety and efficacy versus efavirenz. Antivir Ther. 2019;24(6):425-435. (Phase IIb double-blind; 558 participants)'),
('hiv', 57, 'Molina JM, Squires K, Sax PE, et al. Doravirine versus ritonavir-boosted darunavir in antiretroviral-naive adults with HIV-1 (DRIVE-FORWARD): 96-week results. Lancet HIV. 2020;7(1):e16-e26. (RCT phase 3; 769 participants)'),
('hiv', 58, 'Stellbrink HJ, Arribas JR, Stephens JL, et al. Co-formulated bictegravir, emtricitabine, and tenofovir alafenamide versus dolutegravir with emtricitabine and tenofovir alafenamide: week 96 results. Lancet HIV. 2019. (RCT phase 3; 657 patients)'),
('hiv', 59, 'U.S. Centers for Disease Control and Prevention. Interim Statement Regarding Potential Fetal Harm from Exposure to Dolutegravir — Implications for HIV Post-exposure Prophylaxis (PEP). (CDC statement)'),
('hiv', 60, 'Dominguez KL, Smith DK, Vasavi T, et al. Updated Guidelines for Antiretroviral Postexposure Prophylaxis After Sexual, Injection Drug Use, or Other Nonoccupational Exposure to HIV — United States, 2016. (Practice guideline)'),
('hiv', 61, 'Bogoch II, Scully EP, Zachary KC, et al. Patient attrition between the emergency department and clinic among individuals presenting for HIV nonoccupational postexposure prophylaxis. Clin Infect Dis. 2014;58(11):1618-1624. (Observational; 180 patients)'),
('hiv', 62, 'McCormack S, Dunn DT, Desai M, et al. Pre-exposure prophylaxis to prevent the acquisition of HIV-1 infection (PROUD): effectiveness results from the pilot phase. Lancet. 2016;387(10013):53-60. (Open-label RCT; 544 participants)'),
('hiv', 63, 'Barbee LA, Khosropour CM, Dombrowski JC, et al. New human immunodeficiency virus diagnosis independently associated with rectal gonorrhea and Chlamydia in men who have sex with men. Sex Transm Dis. 2017;44(7):385-389. (Case-control; 176 cases, 704 controls)'),
('hiv', 64, 'Llata E, Braxton J, Asbel L, et al. New human immunodeficiency virus diagnoses among men who have sex with men attending sexually transmitted disease clinics. Sex Transm Dis. 2018;45(9):577-582. (Retrospective; 640 diagnoses in 14,824 MSM)');

DELETE FROM decision_nodes WHERE tree_id = 'hiv';

-- 4. decision_nodes (34 nodes)

-- MODULE 1: INITIAL ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-start', 'hiv', 'info', 1,
 'HIV in the Emergency Department',
 '[HIV ED Management Steps Summary](#/info/hiv-steps-summary) — quick reference.

HIV is now a manageable chronic disease with HAART, but ~14% of HIV-infected persons remain unaware of their status, driving continued transmission. [1] Approximately 80% of new transmissions are from persons not yet diagnosed or not in regular care.

The ED plays a critical role in:
• Identifying undiagnosed HIV infection
• Managing complications of chronic HIV and its treatment
• Initiating [PEP](#/tree/pep) for potential exposures
• Referring candidates for PrEP

**Key first step:** Determine the patient''s HIV disease status — this drives the entire differential diagnosis.',
 '[1,2,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-scenario', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-scenario', 'hiv', 'question', 1,
 'Clinical Scenario',
 'What brings this patient to the ED?',
 '[]'::jsonb, '[{"label":"Known HIV — presenting with acute complaint","description":"Assess disease control status, then complaint-driven workup","next":"hiv-status-assess"},{"label":"Suspected acute HIV / seroconversion","description":"Fever, rash, lymphadenopathy, recent exposure — no respiratory symptoms","next":"hiv-seroconversion","urgency":"urgent"},{"label":"Medication adverse effects / drug questions","description":"ARV side effects, drug interactions, stopping therapy concerns","next":"hiv-med-overview"},{"label":"HIV exposure / prevention (PEP or PrEP)","description":"Sexual, needlestick, or other potential HIV exposure","next":"hiv-prevention"},{"label":"Screening opportunity — patient may have undiagnosed HIV","description":"Risk factors, STI diagnosis, or routine screening","next":"hiv-screening"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-status-assess', 'hiv', 'question', 1,
 'HIV Disease Status Assessment',
 '**Ask the patient:**
• Most recent CD4 count and viral load (or at least if VL is "undetectable")
• Current antiretroviral medications and compliance
• Prior opportunistic infections
• Recent travel or sick contacts

Patients unaware of their CD4/VL or not engaged in care should be considered at **higher risk** for OIs and complications of untreated infection. [4]

CD4 counts and viral load can be ordered from the ED but results will typically not be available for real-time decision-making. An **absolute lymphocyte count <950 cells/mcL** may suggest CD4 <200, though guidelines do not advocate this as a reliable estimate. [5, 6]',
 '[4,5,6]'::jsonb, '[{"label":"Well-controlled (CD4 >200, undetectable VL, on HAART)","description":"Treatment-adherent, engaged in care","next":"hiv-well-controlled"},{"label":"Poorly controlled or unknown status","description":"CD4 <200, detectable VL, not in care, nonadherent, or unknown values","next":"hiv-immunocompromised","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-screening', 'hiv', 'info', 1,
 'HIV Screening & Testing',
 '[HIV Testing & Screening Guide](#/info/hiv-testing-guide) — universal vs risk-based approach.

**CDC (2006):** Routine opt-out HIV screening for ages 13-64 in healthcare settings where undiagnosed prevalence ≥0.1%. [3]
**USPSTF (Grade A):** Routine screening ages 15-65. [7]
**ACEP:** Endorsed ED HIV testing since 2007. [8]

**High-risk patients who should NOT be missed:**
• Sexually active MSM
• Persons who inject drugs and their sex partners
• Persons who exchange sex for money or drugs
• Sex partners of HIV-infected persons
• Patients with new STI diagnosis

**Testing technology:**
• **Fourth-generation (preferred):** Detects HIV antibody + p24 antigen — can identify infection as early as **2 weeks** post-exposure [9]
• Rapid point-of-care tests available (fingerstick slightly less accurate than lab-based)
• If acute infection suspected and 4th-gen test negative → **must send HIV viral load**

A 2018 study of >200,000 ED patients showed 0.4% new-diagnosis yield with nontargeted 4th-gen screening, of which 14.5% were acute HIV. [9]',
 '[3,7,8,9]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-scenario', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;


-- MODULE 2: SEROCONVERSION & TESTING
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-seroconversion', 'hiv', 'info', 2,
 'Acute Retroviral Syndrome',
 '[Acute Seroconversion Features](#/info/hiv-seroconversion-features) — clinical presentation guide.

After HIV exposure, local viral replication occurs over several days before entering the bloodstream with high viremia. **75-90% of patients** develop an acute illness during seroconversion. [1]

**Classic presentation:**
• Fever, headache, malaise
• Sore throat (**without exudate**)
• Lymphadenopathy (generalized)
• GI symptoms (nausea, diarrhea)

**More distinctive features:**
• Genital or mucocutaneous ulcers
• Nondescript **macular rash** (face, trunk, upper extremities) — mimics viral exanthem
• **Notably absent:** respiratory or pulmonary symptoms

CD4 count may drop acutely during seroconversion, rarely causing OIs (e.g., thrush). CD4 typically rebounds once the body gains some viral control.

The syndrome lasts **weeks** and patients frequently seek ED evaluation.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-seroconversion-testing', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-seroconversion-testing', 'hiv', 'info', 2,
 'Diagnosing Acute HIV',
 '**Diagnosis of acute seroconversion is challenging:**

• Third-generation (antibody-only) tests may miss early infection — **no longer recommended as first-line**
• **Fourth-generation tests** (antibody + p24 antigen) can often identify infection as early as **2 weeks** post-exposure — preferred initial test [9]
• Early infection can still be missed within 2 weeks of exposure

**Critical rule:** When acute infection is suspected and 4th-gen test is NEGATIVE → **order HIV viral load.** [9]

**Why diagnosis matters:**
• Patients with acute infection have **extremely high viral loads** and are more infectious than at any other stage
• Identification allows prompt referral and rapid ART initiation
• Undetectable = untransmittable (U=U) — the PARTNER 2 study showed zero transmissions when HIV+ partner had undetectable VL [10, 11]

**Window periods:**
• 4th-gen test: ~2 weeks
• 3rd-gen antibody test: ~3-4 weeks
• Viral load: ~10 days (earliest detection)',
 '[1,9,10,11]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-new-diagnosis', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-new-diagnosis', 'hiv', 'result', 2,
 'New HIV Diagnosis — ED Management',
 '**Confirmed or highly suspected new HIV infection:**

**Immediate actions:**
• Baseline labs: CBC, BMP, hepatic function, CD4 count, viral load
• Screen for co-infections: hepatitis B, hepatitis C, syphilis (RPR/VDRL), other STIs
• Pregnancy test if applicable

**Rapid ART initiation:**
Current HHS and IAS-USA guidelines recommend **same-day initiation** of ART for newly diagnosed patients — reduces time to viral suppression and improves linkage to care. [12, 13]

Most initial regimens use an **INSTI + 2 NRTIs:**
• [Biktarvy](#/drug/biktarvy/hiv treatment) (BIC/FTC/TAF) — preferred single-tablet regimen
• [TDF/FTC](#/drug/tdf-ftc/hiv prep) + [Dolutegravir](#/drug/dolutegravir/hiv pep)

**ED role:**
• Urgent referral to HIV specialist for same-day or next-day appointment
• Ensure baseline labs are drawn
• Counsel on transmission risk and safe practices
• Document for linkage-to-care programs

**If the patient has acute seroconversion illness,** treat symptoms supportively while expediting referral.',
 '[1,12,13]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Confirmed/suspected new HIV diagnosis. Draw baseline labs (CBC, BMP, LFTs, CD4, VL, HBV/HCV, syphilis, STI panel). Urgent referral to HIV specialist for same-day ART initiation. Counsel on transmission risk.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 6)
;


-- MODULE 3: WELL-CONTROLLED HIV
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-well-controlled', 'hiv', 'question', 3,
 'Well-Controlled HIV — Chief Complaint',
 'Patients with **well-controlled HIV** (CD4 >200, undetectable VL, treatment-adherent) are living longer and now present with **typical diseases of aging**, adverse medication effects, and chronic inflammatory state complications rather than OIs. [14]

Treat these patients similarly to immunocompetent individuals, with attention to:
• Higher baseline cardiovascular risk
• Chronic inflammatory state → hypercoagulability
• Medication side effects and interactions

What is the primary complaint?',
 '[14]'::jsonb, '[{"label":"Respiratory (cough, dyspnea, chest pain)","description":"Pneumonia, COPD, PE risk","next":"hiv-respiratory"},{"label":"Cardiovascular (chest pain, edema, syncope)","description":"ACS, heart failure, VTE — increased risk","next":"hiv-cardiovascular"},{"label":"Neurologic (headache, weakness, cognitive changes)","description":"Stroke risk, HAND, low threshold for imaging","next":"hiv-neuro"},{"label":"GI / Hepatobiliary (diarrhea, abdominal pain, jaundice)","description":"Medication-related diarrhea most common; HCV co-infection","next":"hiv-gi"},{"label":"Renal (flank pain, hematuria, AKI)","description":"TDF nephrotoxicity, PI radiolucent stones","next":"hiv-renal"},{"label":"Other systems (heme, endocrine, MSK, psych, derm)","description":"Cytopenias, metabolic syndrome, fracture risk, psychiatric comorbidities","next":"hiv-other-systems"},{"label":"Generalized weakness / unclear etiology","description":"Broad differential — common presentation in HIV patients","next":"hiv-weakness"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-respiratory', 'hiv', 'info', 3,
 'Respiratory Complaints — Well-Controlled HIV',
 '**Well-controlled HIV patients** develop **traditional pulmonary infections** of immunocompetent patients. **Streptococcus pneumoniae** is the most common cause of bacterial pneumonia — treatment does not differ from non-HIV patients. [15, 16]

**Disposition** can mirror practice for non-HIV patients, as well-controlled patients have similar pneumonia mortality. CURB-65 can be applied, though one small study found higher mortality with scores ≥2 AND CD4 <200. [17]

**COPD** is an increasing concern:
• HIV patients smoke at **2× the rate** of the general population [18]
• Lung injury from prior OIs and drug effects contribute
• Chronic HIV may be an independent risk factor [19]
• Treatment is the same as for non-HIV patients

**Venous thromboembolism / PE:**
• Chronic inflammatory state → **hypercoagulability** → higher VTE rates [20, 21]
• Consider PE with pleuritic chest pain, dyspnea — even if COPD is known
• PERC criteria may not be validated for HIV patients (HIV status not reported in original study)

**Key pitfall:** Do not anchor on COPD for an HIV patient with pleuritic chest pain — consider PE.',
 '[15,16,17,18,19,20,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-cardiovascular', 'hiv', 'info', 3,
 'Cardiovascular Disease in HIV',
 'HIV patients have **increased cardiovascular risk** from multiple factors: traditional risk factors, chronic inflammatory state, and medication effects (metabolic syndrome, abacavir MI association). [22, 23]

**Acute coronary syndromes:**
• HIV and some treatments are associated with CAD **absent traditional risk factors**
• Abacavir has been associated with MI in retrospective studies (not yet confirmed prospectively) [24, 25]
• Do NOT dismiss ACS in younger HIV patients — age alone does not rule it out

**Heart failure:**
• Prevalence 7.2% in HIV vs 4.4% in controls (P <.0001) [26]
• Hazard ratio 3.2 for developing HF compared to non-HIV patients [27]
• Only slightly lower rates even in patients on ARVs

**Venous thromboembolism:**
• 2.6 per 1000 patient-years [28]
• Risk factors: CD4 <200, VL >100,000, current/recent OIs [29]
• Chronic inflammatory state is the primary driver

**Management:** Standard evidence-based protocols. Be aware of **drug interactions** between ARVs and anticoagulants, statins, and antiarrhythmics — especially with PI-based regimens.',
 '[22,23,24,25,26,27,28,29]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-neuro', 'hiv', 'info', 3,
 'Neurologic Complaints in HIV',
 '**Guide evaluation by CD4 count.** Even well-controlled HIV carries slightly higher cerebrovascular risk.

**Stroke:**
• Risk ratio **2.56** (95% CI 1.43-4.61) compared to non-HIV [30]
• Multifactorial: inflammatory state, atherosclerosis, smoking, metabolic medication effects
• Follow standard evidence-based stroke algorithms

**HIV-associated neurocognitive disorder (HAND):**
• Most frequently identified neurologic disorder in HIV
• Subacute cognitive deficits, central motor abnormalities, behavioral changes
• Does NOT meet criteria for dementia
• Rates decrease with longer periods of undetectable virus [31]

**CNS OIs** (toxo, crypto, PML) are rare with well-controlled disease but increase dramatically with CD4 <200 → see [Immunocompromised pathway](#/node/hiv-cns-oi)

**Imaging considerations:**
• Immunocompetent HIV patient with headache probably does not need CT
• But if CD4 is decreasing → CNS OIs and malignancy risk increases → neuroimaging indicated
• CT may require **contrast** to identify infections or lymphoma
• MRI provides better identification of smaller lesions and leptomeningeal enhancement
• LP required if meningitis suspected',
 '[30,31]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-gi', 'hiv', 'info', 3,
 'GI & Hepatobiliary Complaints',
 '**Diarrhea** is one of the most common HIV presentations in the ED. Up to **60% of patients on treatment** report an episode in the prior month. [32]

**In well-controlled patients, OIs are rarely the cause.** More common etiologies:
• **Medication side effect** — leading diagnosis for isolated diarrhea [33]
• HIV enteropathy
• Same pathogens that affect non-HIV individuals

**Critical exception: C. difficile** — more common in HIV than non-HIV patients. Careful history for recent antibiotics or hospitalizations. [34]

**Hepatobiliary disease:**
• **61% of HIV patients are co-infected with HCV** in a large US analysis [35]
• 10% co-infected with HBV [36]
• Nearly all ARVs have hepatotoxicity potential, worsened by viral hepatitis co-infection
• ED visit is an opportunity to **screen for HCV** in HIV patients not previously tested

**Atazanavir** (PI) inhibits UDP-glucuronosyltransferase → **indirect hyperbilirubinemia and jaundice** — benign, resolves when drug is stopped.

**Key pitfall:** Do not assume diarrhea is always a medication side effect — exclude C. difficile and assess for red flags.',
 '[32,33,34,35,36]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-renal', 'hiv', 'info', 3,
 'Renal Disease in HIV',
 'Renal disease can be caused by HIV infection itself AND nephrotoxic medications.

**Tenofovir disoproxil fumarate (TDF) nephrotoxicity:**
• Can cause **Fanconi syndrome** — polyuria, polydipsia, dehydration [37]
• Labs: elevated creatinine, reduced GFR, acidemia, hypochloremia, hypokalemia, hypophosphatemia
• UA: glucosuria, proteinuria
• Higher risk in patients with pre-existing renal impairment
• **TAF (tenofovir alafenamide)** has reduced risk — better renal biomarkers out to 144 weeks [38]
• Withhold TDF and other nephrotoxins (e.g., ibuprofen) while resuscitating

**PI-associated nephrolithiasis (CRITICAL for ED):**
• [Atazanavir](#/drug/atazanavir/nephrolithiasis) and indinavir cause kidney stones
• PIs have poor solubility + significant urinary excretion → stone formation
• **Stones are RADIOLUCENT** if composed purely of drug metabolites [39, 40]
• May NOT be visible on standard noncontrast CT
• Look for **secondary signs**: hydroureter, perinephric stranding
• If ongoing symptoms → urology consult for ureteroscopy
• Discuss with HIV provider regarding medication adjustment

**AKI treatment** is the same as for non-HIV patients.',
 '[37,38,39,40]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-other-systems', 'hiv', 'info', 3,
 'Other System Complications',
 '[HIV System-Based Complications](#/info/hiv-system-complications) — comprehensive reference.

**Hematologic:**
• Cytopenias of all cell lines common — bone marrow suppression in uncontrolled HIV
• Medication-induced anemia often macrocytic (diagnosis of exclusion) [28]
• Higher VTE rates (2.6/1000 patient-years)
• Evaluate for thrombotic thrombocytopenic purpura (TTP) if hemolytic anemia + thrombocytopenia [41]

**Endocrine & Metabolic:**
• Metabolic syndrome: dyslipidemia, insulin resistance, truncal obesity (HIV-associated lipodystrophy) [42, 43]
• Thyrotoxicosis/Graves disease with immune reconstitution (IRIS) — 8-33 months after starting HAART [44]
• Glucocorticoid deficiency from adrenal involvement in AIDS — consider in hypotensive AIDS patients
• Diabetes: both ARVs (especially PIs) and chronic inflammation increase risk [45]

**Musculoskeletal:**
• Lower bone mineral density → increased **fracture risk** [46, 47]
• Higher rates of **avascular necrosis** — HIV and ARVs both implicated
• As CD4 drops: spinal infections, osteomyelitis, discitis, atypical organisms (TB, NTM) [48]

**Psychiatric:**
• Depression, anxiety, substance use disorders are highly prevalent [49]
• **Demoralization syndrome** — similar to depression but without anhedonia; does NOT respond to antidepressants
• New-onset mania → evaluate for organic etiology (especially in untreated disease)
• Screen all HIV patients for suicidal/homicidal ideation

**Dermatologic:**
• Drug-related skin reactions common → medication noncompliance [50]
• Folliculitis (MRSA most common pathogen), HSV, HPV warts, seborrheic dermatitis, molluscum
• Disseminated VZV in poorly controlled HIV — can cross dermatomes, may be superinfected',
 '[28,41,42,43,44,45,46,47,48,49,50]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-weakness', 'hiv', 'info', 3,
 'Weakness in HIV — Broad Differential',
 '**Weakness is one of the most challenging presentations** in HIV patients.

Common causes of weakness in non-HIV patients are also common in HIV:
• **Sepsis** — from any source
• **Metabolic:** Hypoglycemia, electrolyte derangements (K+, Ca2+, Na+)
• **Carbon monoxide poisoning** (in winter months)
• **Anemia** — medication-induced or HIV-related

**HIV-specific considerations:**
• **OIs** (if CD4 <200 or unknown) — PJP, TB, disseminated MAC
• **Medication adverse effects** — lactic acidosis (rare with current NRTIs), Fanconi syndrome (TDF)
• **Adrenal insufficiency** — consider in AIDS patients with hypotension
• **Malignancy** — lymphoma, Kaposi sarcoma

**Workup:**
• CBC, BMP (glucose, K+, Ca2+, Na+), hepatic function, lactate, VBG
• If CD4 unknown or <200: expand workup (cultures, CXR, CT as indicated)
• Consider serum lactic acid if anion gap metabolic acidosis or severe illness
• CD4 and viral load (results not available for ED decisions but guide outpatient management)

**HIV patients receive ~4.5 lab tests per ED visit** compared to 3.5 for non-HIV patients. [4]',
 '[4,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;


-- MODULE 4: IMMUNOCOMPROMISED / OI
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-immunocompromised', 'hiv', 'question', 4,
 'Immunocompromised HIV — OI Risk Assessment',
 'Patient has **CD4 <200, detectable viral load, not in care, or unknown status.** These patients are at risk for opportunistic infections AND chronic disease complications.

**AIDS** is defined by CD4 <200 cells/mcL OR development of certain OIs or cancers.

**After acute illness, untreated HIV has ~8-10 years of clinical latency** before AIDS develops. Many remain asymptomatic but have lymphadenopathy. Chronic untreated infection causes a persistent inflammatory state predisposing to CAD, VTE, and COPD. [1]

What is the primary concern?',
 '[1]'::jsonb, '[{"label":"Respiratory (cough, dyspnea, fever)","description":"PJP, TB, atypical pneumonia — high suspicion if CD4 <200","next":"hiv-pulm-oi","urgency":"urgent"},{"label":"Neurologic (headache, focal deficits, AMS)","description":"Toxo, cryptococcal meningitis, PML, CNS lymphoma","next":"hiv-cns-oi","urgency":"urgent"},{"label":"GI (diarrhea, abdominal pain)","description":"C. difficile, CMV, Cryptosporidium, MAC (if CD4 very low)","next":"hiv-gi-oi"},{"label":"General / constitutional / other","description":"Fever, weight loss, cytopenias, skin findings","next":"hiv-other-oi"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-pulm-oi', 'hiv', 'info', 4,
 'Pulmonary OIs — PJP, TB, Atypical Infections',
 '**Pneumocystis jirovecii pneumonia (PJP):**
• Classic: indolent, **nonproductive cough** + exertional dyspnea
• CXR: perihilar or **"batwing" infiltrate** (see image below)
• **LDH typically elevated** — a normal LDH helps rule OUT PJP [51]
• LDH is not specific (elevated in lymphoma, TB, toxoplasmosis)
• Prophylaxis: [TMP-SMX](#/drug/tmp-smx/pjp prophylaxis) when CD4 <200

**Tuberculosis:**
• HIV patients at increased risk for both novel infection and reactivation
• Risk increases with poorly controlled infection
• In the US, most common in persons who inject drugs
• Consider in any HIV patient with cough, fever, weight loss, night sweats

**With disease progression and advanced immunosuppression:**
• At risk for drug-resistant and atypical organisms
• Consider expanding antibiotic coverage
• Consult infectious disease

**Treatment for common pneumonias** (Strep. pneumoniae) is the same as for non-HIV patients. [15, 16]',
 '[15,16,51]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-immunocompromised-disposition', NULL, NULL, NULL, '[{"src":"images/hiv/pjp-cxr.png","alt":"Chest X-ray showing bilateral perihilar \"batwing\" infiltrates characteristic of Pneumocystis jirovecii pneumonia (PJP)","caption":"PJP: Bilateral perihilar \"batwing\" infiltrates in an immunocompromised HIV patient"}]'::jsonb, '[]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-cns-oi', 'hiv', 'info', 4,
 'CNS Opportunistic Infections',
 'CNS OIs typically do **not appear until CD4 <200.** Rates have decreased significantly with treatment adherence.

**Toxoplasmosis:**
• Ring-enhancing mass lesion(s) on contrast CT or MRI
• Fever, headache, focal neurologic deficits, seizures
• Most common CNS mass lesion in AIDS

**Cryptococcal meningitis:**
• Subacute headache, fever, meningismus
• May have only headache with subtle findings
• LP with opening pressure (often elevated), CSF cryptococcal antigen, India ink

**Progressive multifocal leukoencephalopathy (PML):**
• JC virus — progressive white matter lesions
• Subacute cognitive decline, focal deficits without fever
• No effective antiviral — treatment is immune reconstitution with ART

**CNS lymphoma:**
• Ring-enhancing lesion (can mimic toxoplasmosis)
• Often periventricular

**Imaging considerations:**
• **Nonenhanced CT may miss lesions** — contrast required
• **MRI is superior** for smaller lesions and leptomeningeal enhancement
• LP required for suspected meningitis/encephalitis

**Key pitfall:** Do not accept a normal nonenhanced CT in an immunocompromised patient with neurologic symptoms — get contrast or MRI.',
 '[1,30]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-immunocompromised-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-gi-oi', 'hiv', 'info', 4,
 'GI Opportunistic Infections',
 'As CD4 drops, GI OI risk increases significantly.

**C. difficile** — more common in HIV vs non-HIV patients regardless of CD4 count. Careful history: recent antibiotics, hospitalizations. [34]

**With progressive immunosuppression (CD4 <100-200):**
• **Cryptosporidium** — watery diarrhea, can be chronic/severe
• **Cytomegalovirus (CMV)** — bloody diarrhea, colitis, can cause perforation
• **Microsporidiosis** — chronic watery diarrhea
• **Mycobacterium avium complex (MAC)** — fever, weight loss, diarrhea, hepatosplenomegaly (usually CD4 <50)

**Stool studies** guided by disease stage:
• All patients: C. difficile toxin, bacterial cultures, ova/parasites
• Immunosuppressed: add AFB stool culture, Cryptosporidium antigen, microsporidium stain, CMV evaluation

**Key point:** Initiation of ART to restore GI immune function will help eradicate many of these OIs. Link patients to HIV care.

**Hepatobiliary OIs:**
• Acalculous cholecystitis (CMV, Cryptosporidium)
• MAC hepatitis
• Peliosis hepatis (Bartonella)',
 '[1,33,34]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-immunocompromised-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 18)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-other-oi', 'hiv', 'info', 4,
 'Other OIs & Complications of Advanced HIV',
 '**Constitutional symptoms:**
• Fever, weight loss, night sweats → evaluate for disseminated MAC, TB, lymphoma
• Pancytopenia from bone marrow suppression

**Dermatologic:**
• **Kaposi sarcoma** — purple-red nodular lesions (HHV-8 associated)
• Disseminated VZV — can cross dermatomes, may be superinfected
• Severe molluscum contagiosum, extensive seborrheic dermatitis
• Oral hairy leukoplakia (EBV — cannot be scraped off, unlike thrush)

**Ocular:**
• **CMV retinitis** (CD4 <50) — "pizza pie" fundoscopy, painless vision loss
• Refer urgently to ophthalmology

**Oropharyngeal:**
• Oral candidiasis (thrush) — suggests CD4 <200
• Oral hairy leukoplakia
• Aphthous ulcers

**When to strongly consider AIDS:**
• CD4 <200 (by definition) or CD4 unknown
• Any OI or AIDS-defining cancer
• Recurrent bacterial pneumonia
• Cervical cancer, lymphoma

**All immunocompromised patients need:**
• Comprehensive physical exam including oral mucosa and skin
• Low threshold for imaging
• Infectious disease consultation',
 '[1,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-immunocompromised-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-immunocompromised-disposition', 'hiv', 'result', 4,
 'Immunocompromised HIV — Disposition',
 '**Low threshold for admission** in immunocompromised HIV patients.

**Admit if:**
• Suspected or confirmed OI requiring inpatient treatment (PJP, cryptococcal meningitis, toxoplasmosis, CMV)
• Hemodynamic instability, sepsis
• CNS symptoms with abnormal imaging or LP
• Inability to tolerate oral medications or nutrition
• Social barriers to outpatient follow-up

**If discharging:**
• Urgent follow-up with HIV specialist or infectious disease (within 24-72 hours)
• Ensure patient has access to medications
• Emphasize linkage to care — this is a critical opportunity
• Start or resume OI prophylaxis if indicated ([TMP-SMX](#/drug/tmp-smx/pjp prophylaxis) for CD4 <200)

**Do NOT stop HAART** for GI side effects or most complaints — viral resistance develops with inconsistent compliance. Very few scenarios warrant stopping: **Stevens-Johnson syndrome** and **nevirapine-associated hepatic failure** are clear indications. [1]

**Involve the patient''s HIV provider** or ID consultant in all decisions to modify or stop ART.',
 '[1,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Low admission threshold for immunocompromised HIV patients. Consult ID for suspected OIs. Do NOT stop HAART without specialist guidance. Ensure linkage to HIV care on discharge.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 20)
;


-- MODULE 5: MEDICATION EFFECTS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-med-overview', 'hiv', 'question', 5,
 'Antiretroviral Drug Classes',
 '[ARV Drug Classes & Side Effects](#/info/hiv-arv-classes) — comprehensive reference table.

Most current regimens use an **INSTI + 2 NRTIs** (e.g., Biktarvy). INSTI-based regimens are preferred for tolerability, reduced pill burden, and faster viral suppression. [12, 13]

Which drug class or concern?',
 '[12,13]'::jsonb, '[{"label":"NRTI / NtRTI effects","description":"Tenofovir (Fanconi, bone loss), abacavir (hypersensitivity, MI), lactic acidosis, HBV flare","next":"hiv-nrti-effects"},{"label":"NNRTI effects","description":"Efavirenz (neuropsych), SJS/TEN, hepatotoxicity (nevirapine)","next":"hiv-nnrti-effects"},{"label":"PI effects","description":"Radiolucent stones, metabolic syndrome, jaundice (atazanavir), drug interactions","next":"hiv-pi-effects"},{"label":"INSTI & other classes","description":"Generally well-tolerated; dolutegravir neural tube concern; entry inhibitors","next":"hiv-insti-effects"},{"label":"HBV reactivation / stopping therapy","description":"Tenofovir, emtricitabine, lamivudine — risk of fatal HBV flare on discontinuation","next":"hiv-hbv-caution","urgency":"urgent"},{"label":"Drug-drug interactions","description":"CYP3A4 interactions with PIs/cobicistat — anticoagulants, statins, antiarrhythmics","next":"hiv-drug-interactions"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 21)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-nrti-effects', 'hiv', 'info', 5,
 'NRTI / NtRTI Adverse Effects',
 'NRTIs/NtRTIs inhibit reverse transcription of HIV RNA into DNA. Current drugs are relatively well tolerated. [12]

**Tenofovir disoproxil fumarate (TDF):**
• **Fanconi syndrome** — polyuria, polydipsia, dehydration, elevated creatinine [37]
• Labs: acidemia, hypokalemia, hypophosphatemia, glucosuria, proteinuria
• Bone density loss and fractures
• **TAF** (tenofovir alafenamide) has reduced renal and bone toxicity [38]

**Abacavir:**
• **Hypersensitivity reaction** in 3-5% — fever, rash, GI/respiratory symptoms, usually within first 6 weeks [52]
• Associated with **HLA-B*5701 allele** — screening is mandatory before starting
• If HLA-B*5701 positive → abacavir is **contraindicated**
• **NEVER rechallenge** after hypersensitivity — can be fatal
• Retrospective association with **myocardial infarction** (not confirmed prospectively) [24, 25]

**Class effects (rare with current drugs):**
• GI upset, nausea, headache, insomnia
• Lactic acidosis — extremely rare with current regimens
• Transaminitis — rare

**For PrEP:** Both TDF/FTC and TAF/FTC are FDA-approved. TAF/FTC is NOT approved for use in heterosexual women (not studied). [53, 54]',
 '[12,24,25,37,38,52,53,54]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-med-overview', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 22)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-nnrti-effects', 'hiv', 'info', 5,
 'NNRTI Adverse Effects',
 'NNRTIs directly bind and inactivate HIV reverse transcriptase. Examples: efavirenz, rilpivirine, doravirine, nevirapine, etravirine.

**Efavirenz — neuropsychiatric effects:**
• Vivid dreams, nightmares, insomnia, confusion (often resolve after first weeks) [55]
• **Severe cases:** psychosis, suicidal ideation, attempted/completed suicide
• **Immediate discontinuation** if severe psychosis or suicidality
• Often avoided in patients with psychiatric history
• Rilpivirine: may cause insomnia/depression but lower risk than efavirenz [13]

**Doravirine (newest NNRTI):**
• Fewer CNS adverse events than efavirenz [56, 57]
• Favorable lipid profile
• Most commonly used in treatment-experienced patients with limited options

**Skin reactions (all NNRTIs):**
• Rash, GI upset, headache, dizziness — common
• Infrequently: **Stevens-Johnson syndrome, toxic epidermal necrolysis, erythema multiforme** (more common with nevirapine)

**Nevirapine — hepatotoxicity:**
• FDA black box warning (2000)
• Most frequent in first 6 weeks
• Higher risk: chronic hepatitis, female CD4 >250, male CD4 >400 [12, 13]
• Can cause liver failure',
 '[12,13,55,56,57]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-med-overview', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 23)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-pi-effects', 'hiv', 'info', 5,
 'Protease Inhibitor Adverse Effects',
 'PIs prevent cleavage of essential polyproteins needed for mature HIV virion production. Most common today: **atazanavir** and **darunavir**, used with a booster (low-dose ritonavir or cobicistat). [13]

**Common side effects:** Nausea, diarrhea, abdominal discomfort.

**Metabolic effects:**
• Lipodystrophy (central fat accumulation, peripheral wasting)
• Dyslipidemia, hypertriglyceridemia
• Type 2 diabetes (less common with lower-dose ritonavir boosting)
• Rarely: pancreatitis from hypertriglyceridemia

**[Atazanavir](#/drug/atazanavir/hiv jaundice):**
• Inhibits UDP-glucuronosyltransferase → **indirect hyperbilirubinemia and jaundice** — benign, resolves on discontinuation
• **RADIOLUCENT kidney stones** — PIs have poor solubility and significant urinary excretion [39, 40]
• Stones may NOT be seen on noncontrast CT — look for hydroureter, perinephric stranding
• Requires **acidic environment** for absorption → PPIs and H2 blockers may interfere

**Drug interactions (CRITICAL):**
• PIs (especially boosted with ritonavir/cobicistat) inhibit **CYP3A4** → major interactions with anticoagulants, statins, corticosteroids, antiarrhythmics, antiepileptics, antidepressants [13]
• Much higher interaction risk than INSTI or NNRTI regimens
• See [Drug Interactions](#/node/hiv-drug-interactions)',
 '[13,39,40]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-med-overview', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 24)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-insti-effects', 'hiv', 'info', 5,
 'INSTI & Entry Inhibitor Effects',
 '**Integrase strand transfer inhibitors (INSTIs):** Block incorporation of viral DNA into host cell DNA. First-line for most patients. [12, 13]

Examples: [Biktarvy](#/drug/biktarvy/hiv treatment) (bictegravir), [Dolutegravir](#/drug/dolutegravir/hiv pep), elvitegravir/cobicistat, raltegravir.

**Generally very well tolerated** — rare discontinuations in clinical trials.
• ~90% of patients attain and maintain undetectable VL through 96 weeks [58]
• Raltegravir has the lowest drug interaction risk
• Elvitegravir requires cobicistat booster → higher drug interaction risk and GI intolerance

**Dolutegravir pregnancy concern:**
• Initial Botswana data showed 4 neural tube defects in dolutegravir-exposed pregnancies [59]
• Subsequent studies: risk exists but is lower than initially feared
• **Review guidelines before using dolutegravir for PEP in women of childbearing age**

**Entry inhibitors (rarely used):**
• **Enfuvirtide** — injection site nodules; largely replaced by INSTIs
• **Maraviroc** — CCR5 blocker; rare hepatotoxicity, hypotension with renal impairment
• **Ibalizumab** — monoclonal antibody; hypersensitivity risk during/after infusion
• Reserved for treatment-experienced patients with limited options',
 '[12,13,58,59]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-med-overview', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 25)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-hbv-caution', 'hiv', 'result', 5,
 'HBV Reactivation Risk — Stopping Therapy',
 '**CRITICAL:** Several NRTIs/NtRTIs have dual activity against HIV AND hepatitis B:
• **Tenofovir alafenamide (TAF)**
• **Tenofovir disoproxil fumarate (TDF)**
• **Emtricitabine (FTC)**
• **Lamivudine (3TC)**

**If a patient co-infected with HBV stops any of these medications**, there is risk of **acute hepatitis B flare** — fatalities have been reported. [1, 36]

~10% of HIV patients are co-infected with HBV. [36]

**ED presentation:**
• Patient recently stopped or ran out of ARV medication
• Elevated transaminases, jaundice, RUQ pain
• May progress to fulminant hepatic failure

**Management:**
• Supportive care
• **Consult infectious disease** for treatment options and reinitiation of therapy
• Evaluate for other etiologies of hepatitis in parallel
• Do NOT delay specialist consultation

**When to stop HAART (very few scenarios):**
• Stevens-Johnson syndrome
• Nevirapine-associated hepatic failure
• All other decisions to stop → involve HIV provider',
 '[1,36]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'HBV co-infection + ARV discontinuation → risk of fatal hepatitis flare. Provide supportive care, consult ID urgently for medication reinitiation. Never stop HAART for mild GI side effects.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 26)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-drug-interactions', 'hiv', 'info', 5,
 'Drug-Drug Interactions',
 '**PI-based regimens** (especially boosted with ritonavir or cobicistat) carry the highest risk of drug interactions through **CYP3A4 inhibition**. [13]

**High-risk combinations in the ED:**
• **Anticoagulants** — warfarin, DOACs: altered metabolism
• **Statins** — lovastatin and simvastatin contraindicated with PIs; use atorvastatin/rosuvastatin with dose adjustment
• **Corticosteroids** — fluticasone + ritonavir → iatrogenic Cushing syndrome
• **Antiarrhythmics** — amiodarone, flecainide, lidocaine: levels may be dangerously altered
• **Antiepileptics** — carbamazepine, phenytoin: bidirectional interactions
• **Antimalarials, antidepressants** — various interactions

**INSTI-based regimens** have fewer interactions but:
• Dolutegravir/bictegravir: chelation with polyvalent cations (antacids, Ca2+, Fe2+)
• Dolutegravir increases metformin levels

**Atazanavir absorption** requires acidic environment — PPIs and H2 blockers interfere.

**Before prescribing any new medication** to an HIV patient on PIs:
• Use an HIV drug interaction checker
• When in doubt, consult pharmacy or infectious disease

**Key ED takeaway:** Always check drug interactions when prescribing to HIV patients, especially those on PI-based or cobicistat-boosted regimens.',
 '[13]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-med-overview', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 27)
;


-- MODULE 6: PREVENTION & DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-prevention', 'hiv', 'question', 6,
 'HIV Prevention — PEP & PrEP',
 'The ED plays a vital role in preventing new HIV infections through PEP and PrEP awareness. [1, 60]

Which prevention scenario?',
 '[1,60]'::jsonb, '[{"label":"Potential HIV exposure — PEP indicated","description":"Sexual exposure, needlestick, assault — within 72 hours","next":"hiv-pep-overview","urgency":"urgent"},{"label":"High-risk patient — PrEP referral","description":"MSM with STI, ongoing high-risk behavior, PrEP candidate","next":"hiv-prep-referral"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 28)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-pep-overview', 'hiv', 'info', 6,
 'Postexposure Prophylaxis (PEP)',
 '**PEP is most effective when given ASAP** — ideally within 2 hours of exposure.

**NOT recommended when care is sought >72 hours after exposure.** [60]

**Indications:** Sexual exposure, needlestick/percutaneous, mucous membrane exposure, sexual assault.

**Preferred regimens (28 days):**
• [Biktarvy](#/drug/biktarvy/hiv pep) 1 tablet daily — preferred single-tablet regimen
• [TDF/FTC](#/drug/tdf-ftc/hiv pep) + [Dolutegravir](#/drug/dolutegravir/hiv pep) — alternative
• [TDF/FTC](#/drug/tdf-ftc/hiv pep) + [Darunavir](#/drug/darunavir/hiv pep)/[Ritonavir](#/drug/ritonavir/hiv pep) — second alternative

**Baseline testing:** HIV test on exposed patient.

**Adherence is critical:** One study showed <60% follow-up rates and <25% completed full 28-day course. [61] Emphasize adherence and arrange follow-up.

**For the complete PEP decision pathway** including exposure risk assessment, special populations, and follow-up: [Post Exposure Prophylaxis Consult](#/tree/pep)

Risk of transmission depends on type of exposure and viral load of source. Undetectable viral load = virtually zero transmission risk (PARTNER 2 study). [10]',
 '[10,60,61]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'hiv-disposition', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 29)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-prep-referral', 'hiv', 'result', 6,
 'Pre-Exposure Prophylaxis (PrEP) Referral',
 '**PrEP is highly effective:** PROUD trial showed **86% relative risk reduction** in HIV acquisition. IPREX and DISCOVER studies showed >90% reduction with daily adherence. [53, 54, 62]

**FDA-approved PrEP regimens:**
• [TDF/FTC](#/drug/tdf-ftc/hiv prep) (Truvada®) — approved for all genders
• TAF/FTC (Descovy®) — approved for MSM and transgender women only (women not studied) [54]

**PrEP follow-up protocol:**
• Daily medication, follow-up every 3 months
• HIV testing at each visit
• STI symptom assessment, side effect evaluation
• Renal function at 3 months, then every 6 months [53]

**Who to refer from the ED:**
• MSM (especially with recent STI diagnosis) [63, 64]
• Persons who inject drugs and their sex partners
• Persons exchanging sex for money or drugs
• Sex partners of HIV-infected persons with detectable VL
• Any patient requesting PrEP information

**ED role:** Educate, provide referral to PrEP provider. Do NOT start PrEP from the ED without baseline HIV testing and renal function.',
 '[53,54,62,63,64]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Refer appropriate patients to PrEP provider. Counsel on high effectiveness (>86% risk reduction) with daily adherence. Ensure baseline HIV test and renal function before starting.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 30)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-disposition', 'hiv', 'question', 6,
 'Disposition Decision',
 'Based on the clinical assessment, determine appropriate disposition.',
 '[]'::jsonb, '[{"label":"Admit — suspected OI, unstable, or requires IV treatment","description":"ICU for critical illness; floor for workup/treatment of OIs","next":"hiv-admit","urgency":"urgent"},{"label":"Discharge with close follow-up","description":"Stable patient with well-controlled or manageable complaint","next":"hiv-discharge"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 31)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-admit', 'hiv', 'result', 6,
 'Admission',
 '**Admission criteria:**
• Suspected or confirmed OI requiring inpatient treatment
• Hemodynamic instability, sepsis, respiratory failure
• CNS symptoms with concerning imaging or LP findings
• New diagnosis with acute seroconversion illness and complications
• Inability to tolerate oral medications
• Social barriers to safe discharge and follow-up

**Orders:**
• Continue home HAART regimen (do NOT hold unless directed by ID)
• Infectious disease consultation for OI management
• CD4 count and viral load if not recently available
• Screen for co-infections (HBV, HCV) if not previously documented
• Medication reconciliation — alert pharmacy to ARV drug interactions

**If patient has fallen out of care:**
• Social work consultation for linkage to HIV services
• This hospitalization is an opportunity to re-engage the patient in treatment',
 '[1,14]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Admit for OI workup/treatment, acute illness, or inability to manage outpatient. Continue HAART, consult ID, check CD4/VL, screen HBV/HCV. Social work for linkage to care.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 32)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('hiv-discharge', 'hiv', 'result', 6,
 'Discharge with Follow-Up',
 '**Discharge criteria:**
• Stable vital signs, able to tolerate PO
• No suspected OI requiring inpatient treatment
• Well-controlled HIV with manageable complaint
• Reliable follow-up available

**Discharge instructions:**
• Continue all HIV medications as prescribed — **do NOT stop HAART**
• Follow up with HIV provider within 1-2 weeks (or sooner per complaint)
• Return for worsening symptoms, new fever, inability to take medications

**Linkage to care opportunities:**
• If not engaged in HIV care → provide contact information for local HIV clinic
• If PEP started → arrange follow-up in 3-7 days for adherence check
• If PrEP candidate identified → refer to PrEP provider
• If newly diagnosed → urgent HIV specialist referral (same day if possible)
• If untested → offer HIV testing before discharge or provide referral

**The ED visit is a critical touchpoint** — 80% of new transmissions come from those not diagnosed or not in care. Identifying and linking these patients is one of the highest-impact interventions the ED can provide. [1]',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Discharge with continued HAART. Follow up with HIV provider. Link to care if not engaged. Offer HIV testing if untested. Refer for PEP/PrEP as indicated.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 33)
;


-- 5. drugs (1 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('atazanavir', 'Atazanavir (Reyataz)', 'Atazanavir', 'Protease inhibitor (PI)', 'PO',
 '["HIV treatment","HIV — ED management"]'::jsonb,
 '[{"indication":"HIV Treatment (boosted)","regimen":"300 mg PO once daily + ritonavir 100 mg PO once daily. Must take with food. Requires acidic environment for absorption — avoid PPIs, separate H2 blockers by 12h."},{"indication":"HIV — Nephrolithiasis / Jaundice","regimen":"Atazanavir causes RADIOLUCENT kidney stones (drug metabolite stones not visible on standard noncontrast CT — look for secondary signs: hydroureter, perinephric stranding). Also causes benign indirect hyperbilirubinemia via UDP-glucuronosyltransferase inhibition → jaundice (resolves on discontinuation). Discuss with HIV provider regarding dose adjustment or alternative."}]'::jsonb,
 '["Severe hepatic impairment"]'::jsonb,
 '["Radiolucent kidney stones — CT may be falsely negative","Indirect hyperbilirubinemia/jaundice (benign)","CYP3A4 substrate — multiple drug interactions","Requires acidic gastric pH for absorption — PPIs contraindicated","QTc prolongation reported"]'::jsonb,
 'Serum bilirubin (expected elevation), renal function, urinalysis if flank pain',
 'Most commonly used PI alongside darunavir. Stones from PIs are radiolucent if composed purely of concentrated drug metabolites. In patients with ongoing renal colic symptoms, consult urology for ureteroscopy.',
 NULL,
 '["Saag MS, Gandhi RT, Hoy JF, et al. Antiretroviral drugs for treatment and prevention of HIV infection in adults: 2020 recommendations of the International Antiviral Society-USA panel. JAMA. 2020;324(16):1651-1669.","Izzedine H, Lescure FX, Bonnet F. HIV medication-based urolithiasis. Clin Kidney J. 2014;7(2):121-126."]'::jsonb,
 0)
;


-- 5b. drugs — UPDATE existing entries (2 drugs)
-- Updating Biktarvy (BIC/FTC/TAF) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["HIV post-exposure prophylaxis (PEP)","HIV treatment (ART)"]'::jsonb,
  dosing = '[{"indication":"HIV PEP","regimen":"1 tablet (50/200/25 mg) PO once daily x 28 days. Take with or without food. Start as soon as possible, within 72 hours of exposure."},{"indication":"HIV Treatment (ongoing therapy)","regimen":"1 tablet (50/200/25 mg) PO once daily. Preferred INSTI-based single-tablet regimen per HHS and IAS-USA guidelines. ~90% of patients attain undetectable VL through 96 weeks."}]'::jsonb,
  contraindications = '["Co-administration with dofetilide","Co-administration with rifampin (reduces bictegravir levels)"]'::jsonb,
  cautions = '["CrCl <30 mL/min — not recommended (limited data)","Lactic acidosis / severe hepatomegaly with steatosis — rare but serious class effect of NRTIs","HBV co-infection — severe hepatitis flare may occur upon discontinuation (contains FTC/TAF, active against HBV)","Drug interactions — avoid polyvalent cation-containing antacids within 2 hours"]'::jsonb,
  monitoring = 'Renal function (BMP) at baseline and 2 weeks. HIV testing at baseline, 4–6 weeks, and 3 months.',
  notes = 'Preferred single-tablet PEP regimen per 2025 CDC guidelines. High barrier to resistance. Well tolerated with low discontinuation rates. TAF has less renal/bone toxicity than TDF.',
  citations = '["Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV. MMWR. 2025;74(1):1-56.","Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb
WHERE id = 'biktarvy';

-- Updating TMP-SMX (Bactrim) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Acute infectious diarrhea (pediatric first-line)","Traveler''s diarrhea","PJP prophylaxis (HIV, CD4 <200)"]'::jsonb,
  dosing = '[{"indication":"Acute diarrhea","regimen":"Adult: 1 DS tablet (160/800 mg) PO BID × 3-5 days."},{"indication":"Traveler diarrhea","regimen":"Adult: 1 DS tablet (160/800 mg) PO BID × 3-5 days. Combination with loperamide is most efficacious regimen."},{"indication":"Pediatric diarrhea","regimen":"8 mg/kg/day (TMP component) divided BID × 3-5 days. Max 320 mg TMP per day.","weightCalc":{"dosePerKg":8,"unit":"mg TMP","maxDose":320,"dailyDivided":2}},{"indication":"PJP Prophylaxis (CD4 <200)","regimen":"1 DS tablet (160/800 mg) PO daily OR 1 DS tablet PO 3x/week. Continue until CD4 >200 for ≥3 months on ART."}]'::jsonb,
  contraindications = '["Sulfonamide allergy","Pregnancy (especially first trimester and near term) — folate antagonism","Severe hepatic or renal insufficiency","Megaloblastic anemia due to folate deficiency","Infants under 2 months"]'::jsonb,
  cautions = '["Photosensitivity — advise sun protection","Can cause hyperkalemia — monitor potassium in renal impairment","Increases warfarin effect — monitor INR","Increases phenytoin levels","Stevens-Johnson syndrome risk (rare)","G6PD deficiency — risk of hemolytic anemia"]'::jsonb,
  monitoring = 'CBC, renal function, potassium. INR if on warfarin. Watch for rash (discontinue immediately).',
  notes = 'First-line empiric antibiotic for children with acute infectious diarrhea. In adults, used as alternative to fluoroquinolones. Only 71% susceptibility among E. coli isolates limits utility in some settings. Combination with loperamide is the most efficacious regimen for traveler''s diarrhea.',
  citations = '["Ericsson CD, et al. Treatment of Traveler''s Diarrhea with Sulfamethoxazole and Trimethoprim and Loperamide. JAMA. 1990;263(2):257-261.","Shane AL, et al. 2017 IDSA Clinical Practice Guidelines for the Diagnosis and Management of Infectious Diarrhea. Clin Infect Dis. 2017;65(12):e45-e80."]'::jsonb
WHERE id = 'tmp-smx';


-- 6. info_pages (5 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hiv-steps-summary', 'HIV ED Management Steps Summary', 'Quick-Reference Checklist',
 '[{"body":"Quick-reference checklist for managing HIV-related presentations in the ED. Tap any step to jump directly to that decision point in the consult."},{"heading":"Initial Assessment","body":"• [Determine HIV status — CD4 count, viral load, current ART regimen](#/node/hiv-status-assess)\n• Route to appropriate pathway based on immune status and presentation"},{"heading":"Acute Seroconversion","body":"• [Recognize acute retroviral syndrome: fever + rash + lymphadenopathy + NO respiratory symptoms](#/node/hiv-seroconversion)\n• 4th generation Ag/Ab test (2-week window period)\n• Send HIV RNA viral load if 4th gen negative but clinical suspicion remains high\n• Never rely on antibody-only test in the acute setting"},{"heading":"Well-Controlled HIV","body":"• [Treat like immunocompetent patient for most acute complaints](#/node/hiv-well-controlled)\n• Watch for chronic inflammatory complications (CAD, COPD, osteoporosis)\n• Screen for ARV medication side effects and drug interactions\n• Verify ART adherence and recent viral load"},{"heading":"Immunocompromised (CD4 <200)","body":"• [High risk for opportunistic infections — low threshold for imaging and admission](#/node/hiv-immunocompromised)\n• PJP (CD4 <200): dyspnea, dry cough, bilateral GGOs, elevated LDH\n• Toxoplasmosis (CD4 <100): ring-enhancing lesions, focal neuro deficits\n• Cryptococcal meningitis (CD4 <100): headache, altered mental status, elevated opening pressure\n• CMV (CD4 <50): retinitis, colitis, esophagitis\n• TB: any CD4 — atypical presentations with low CD4"},{"heading":"Medication Effects","body":"• [Know ARV drug classes and their signature toxicities](#/node/hiv-med-overview)\n• NRTI: TDF → Fanconi syndrome, renal tubular acidosis, bone loss\n• NNRTI: efavirenz → neuropsychiatric effects, vivid dreams, SJS\n• PI: atazanavir → jaundice, radiolucent kidney stones, CYP3A4 drug interactions\n• INSTI: generally well-tolerated, fewest interactions"},{"heading":"Prevention","body":"• [PEP: post-exposure prophylaxis within 72 hours of exposure](#/tree/pep)\n• [PrEP: refer high-risk patients for pre-exposure prophylaxis](#/node/hiv-prep-referral)\n• Document exposure time, source HIV status, and risk level"}]'::jsonb,
 '[{"num":1,"text":"Saag MS, Gandhi RT, Hoy JF, et al. Antiretroviral Drugs for Treatment and Prevention of HIV Infection in Adults: 2020 Recommendations of the International Antiviral Society–USA Panel. JAMA. 2020;324(16):1651-1669."},{"num":2,"text":"Panel on Antiretroviral Guidelines for Adults and Adolescents. Guidelines for the Use of Antiretroviral Agents in Adults and Adolescents with HIV. HHS. 2024."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hiv-seroconversion-features', 'Acute Retroviral Syndrome', 'Clinical Features & Testing Approach',
 '[{"body":"Acute HIV seroconversion presents 2–4 weeks after exposure and is frequently misdiagnosed as mononucleosis, influenza, or strep pharyngitis. Recognizing the pattern prevents missed diagnosis and ongoing transmission."},{"heading":"Characteristic Presentation","body":"• **Fever** — present in 80–90% of cases, often high-grade\n• **Sore throat** — pharyngitis WITHOUT exudate (unlike strep or EBV)\n• **Macular rash** — erythematous, non-pruritic; face, trunk, and upper extremities; appears day 2–3 of illness\n• **Lymphadenopathy** — diffuse, non-tender, symmetric\n• **Mucocutaneous ulcers** — oral and/or genital; shallow, painful\n• **Myalgia / arthralgia** — widespread, non-specific\n• **Headache** — may be severe; consider aseptic meningitis if meningismus present\n• **Weight loss / diarrhea** — in some cases"},{"heading":"Key Distinguishing Features","body":"• **NO respiratory symptoms** — absence of cough, rhinorrhea, and congestion distinguishes ARS from influenza and URI\n• **NO exudative pharyngitis** — unlike strep and mononucleosis\n• **Mucocutaneous ulcers** — highly specific; rare in other viral syndromes\n• **Rash + fever + lymphadenopathy + sore throat** without respiratory symptoms should trigger HIV testing\n• Ask about sexual exposure or needle sharing in the preceding 2–6 weeks"},{"heading":"Laboratory Findings","body":"• **Lymphopenia** initially (transient CD4 drop), followed by lymphocytosis with atypical lymphocytes\n• **Thrombocytopenia** — mild, self-limited\n• **Elevated transaminases** — hepatitis in 20–50% of cases\n• **Elevated ESR/CRP** — non-specific but supports viral syndrome"},{"heading":"Testing Approach","body":"• **4th generation Ag/Ab test** (preferred) — detects p24 antigen + HIV-1/2 antibodies; window period ~2 weeks [1]\n• **If 4th gen negative but clinical suspicion high** — send HIV RNA viral load (detectable within 10–12 days of infection)\n• **Never rely on antibody-only (3rd gen) test alone** — window period 3–4 weeks; will miss acute seroconversion\n• **Rapid point-of-care tests** are antibody-only — useful for screening but CANNOT rule out acute infection\n• If ARS confirmed: refer for immediate ART initiation (reduces reservoir size and transmission risk)"},{"heading":"Differential Diagnosis","body":"• Infectious mononucleosis (EBV) — exudative pharyngitis, splenomegaly, positive heterophile\n• Influenza — respiratory symptoms predominate\n• Secondary syphilis — palmar rash, condylomata lata, positive RPR\n• Strep pharyngitis — exudate, anterior cervical LAD, positive rapid strep\n• CMV mononucleosis — heterophile-negative, less pharyngitis\n• Drug reaction — medication exposure history"}]'::jsonb,
 '[{"num":1,"text":"Branson BM, Handsfield HH, Lampe MA, et al. Revised Recommendations for HIV Testing of Adults, Adolescents, and Pregnant Women in Health-Care Settings. MMWR Recomm Rep. 2006;55(RR-14):1-17."},{"num":2,"text":"Cohen MS, Shaw GM, McMichael AJ, Haynes BF. Acute HIV-1 Infection. N Engl J Med. 2011;364(20):1943-1954."},{"num":3,"text":"Daar ES, Little S, Pitt J, et al. Diagnosis of Primary HIV-1 Infection. Ann Intern Med. 2001;134(1):25-29."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hiv-arv-classes', 'Antiretroviral Drug Classes & Side Effects', 'ED-Relevant Toxicities & Interactions',
 '[{"body":"Overview of the five major antiretroviral drug classes, their signature toxicities relevant to ED presentations, and critical drug interactions. Most patients on modern ART take a two- or three-drug combination (often as a single pill). [1][2]"},{"heading":"NRTIs / NtRTIs (Nucleoside/Nucleotide Reverse Transcriptase Inhibitors)","body":"• **Tenofovir disoproxil fumarate (TDF)** — Fanconi syndrome (proximal renal tubular acidosis, glycosuria, phosphaturia, proteinuria), decreased bone mineral density\n• **Tenofovir alafenamide (TAF)** — less renal and bone toxicity than TDF; preferred in renal impairment\n• **Abacavir (ABC)** — HLA-B*5701 hypersensitivity reaction (fever, rash, GI symptoms — can be fatal on rechallenge); associated with increased MI risk in some studies\n• **Lamivudine (3TC) / Emtricitabine (FTC)** — well-tolerated; active against hepatitis B (HBV flare risk if discontinued in co-infected patients)\n• **Zidovudine (AZT)** — macrocytic anemia, neutropenia, myopathy (legacy drug, rarely used)\n• **Class effect:** lactic acidosis with hepatic steatosis (rare but life-threatening, primarily with older NRTIs)"},{"heading":"NNRTIs (Non-Nucleoside Reverse Transcriptase Inhibitors)","body":"• **Efavirenz (EFV)** — neuropsychiatric effects (vivid dreams, depression, psychosis, suicidality), dizziness, Stevens-Johnson syndrome\n• **Nevirapine (NVP)** — severe hepatotoxicity (fulminant hepatitis, especially in women with CD4 >250 or men with CD4 >400), SJS/TEN\n• **Doravirine (DOR)** — fewer CNS side effects than efavirenz; better tolerated\n• **Rilpivirine (RPV)** — requires food and gastric acid for absorption; avoid PPIs (reduced efficacy)\n• **Class effect:** rash (usually mild, self-limited); low barrier to resistance"},{"heading":"PIs (Protease Inhibitors)","body":"• **Atazanavir (ATV)** — indirect hyperbilirubinemia (jaundice without hepatotoxicity), radiolucent kidney stones (invisible on plain film, visible on CT), cholelithiasis, nephrolithiasis\n• **Darunavir (DRV)** — rash (contains sulfonamide moiety), GI intolerance; requires pharmacokinetic booster\n• **Ritonavir / Cobicistat** — used as pharmacokinetic boosters (not for antiviral effect); potent CYP3A4 inhibitors causing major drug interactions\n• **Critical interactions:** Contraindicated with simvastatin, lovastatin, ergot alkaloids, oral midazolam, triazolam, rifampin, St. John’s wort. Significant interactions with calcium channel blockers, warfarin, direct oral anticoagulants, immunosuppressants.\n• **Class effect:** metabolic syndrome (dyslipidemia, insulin resistance, lipodystrophy), GI intolerance (nausea, diarrhea)"},{"heading":"INSTIs (Integrase Strand Transfer Inhibitors)","body":"• **Bictegravir (BIC)** — available only as co-formulated Biktarvy (BIC/TAF/FTC); well-tolerated, high barrier to resistance\n• **Dolutegravir (DTG)** — neural tube defect concern in periconception period (risk ~0.3%); insomnia, weight gain; rare hypersensitivity\n• **Raltegravir (RAL)** — fewest drug interactions of any ARV class; CK elevation, myopathy (rare)\n• **Elvitegravir (EVG)** — requires cobicistat boosting (carries CYP3A4 interaction liability)\n• **Class effect:** generally the best-tolerated ARV class; weight gain (especially with DTG); insomnia and headache"},{"heading":"Entry / Attachment Inhibitors","body":"• **Enfuvirtide (T-20)** — subcutaneous injection-site reactions (nearly universal); used only in heavily treatment-experienced patients\n• **Maraviroc (MVC)** — CCR5 antagonist; hepatotoxicity (with allergic features), postural hypotension; requires tropism testing before use\n• **Ibalizumab (IBA)** — monoclonal antibody; IV infusion; hypersensitivity reactions; reserved for multidrug-resistant HIV\n• **Fostemsavir (FTR)** — attachment inhibitor; QTc prolongation; reserved for multidrug-resistant HIV\n• **Lenacapavir** — first-in-class capsid inhibitor; subcutaneous q6 months; injection-site reactions"},{"heading":"ED Pearls","body":"• **Do not stop ART** in the ED unless directed by HIV specialist — interruptions promote resistance\n• **Check drug interactions** before prescribing any new medication to a patient on ART (especially PIs and cobicistat-boosted regimens)\n• **Radiolucent stones**: if patient on atazanavir presents with renal colic and negative plain film, order CT\n• **Lactic acidosis**: consider in any HIV patient with unexplained metabolic acidosis, especially on older NRTIs\n• **Immune reconstitution inflammatory syndrome (IRIS)**: paradoxical worsening within weeks of ART initiation — unmasking of latent OIs"}]'::jsonb,
 '[{"num":1,"text":"Saag MS, Gandhi RT, Hoy JF, et al. Antiretroviral Drugs for Treatment and Prevention of HIV Infection in Adults: 2020 Recommendations of the International Antiviral Society–USA Panel. JAMA. 2020;324(16):1651-1669."},{"num":2,"text":"Panel on Antiretroviral Guidelines for Adults and Adolescents. Guidelines for the Use of Antiretroviral Agents in Adults and Adolescents with HIV. HHS. 2024."},{"num":3,"text":"Tseng A, Seet J, Phillips EJ. The Evolution of Three Decades of Antiretroviral Therapy: Challenges, Triumphs and the Promise of the Future. Br J Clin Pharmacol. 2015;79(2):182-194."}]'::jsonb,
 false,
 2)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hiv-testing-guide', 'HIV Testing & Screening Guide', 'Universal Screening, Technologies & Window Periods',
 '[{"body":"HIV testing in the ED is a critical public health intervention. An estimated 13% of people living with HIV in the US are unaware of their status. ED-based screening programs have identified new diagnoses in 0.1–0.7% of tested patients. [1][2]"},{"heading":"Universal Screening Recommendations","body":"• **CDC (2006):** Opt-out HIV screening for all patients aged 13–64 in healthcare settings, including EDs; repeat at least annually for high-risk patients [1]\n• **USPSTF (2019):** Grade A recommendation for screening all adolescents and adults aged 15–65; younger and older if at increased risk [2]\n• **ACEP (2022):** Supports routine opt-out ED-based HIV screening as a public health strategy\n• **Separate written consent is NOT required** in most states — general medical consent covers HIV testing\n• Pre-test counseling requirements have been eliminated in most jurisdictions to reduce barriers"},{"heading":"Risk-Based Screening Indications","body":"• Men who have sex with men (MSM)\n• Injection drug use (IDU) or needle sharing\n• Transactional sex or sex work\n• Sexual contact with known HIV-positive partner\n• Diagnosis of another sexually transmitted infection\n• Diagnosis of tuberculosis or hepatitis B/C\n• Occupational exposure (needlestick, mucous membrane splash)\n• Sexual assault\n• Pregnancy (all trimesters — opt-out)\n• Patients requesting PEP or PrEP\n• Incarcerated populations\n• Homeless individuals"},{"heading":"Testing Technologies","body":"• **4th generation Ag/Ab combination immunoassay** (preferred)\n  — Detects HIV-1 p24 antigen + HIV-1/2 antibodies simultaneously\n  — Window period: ~2 weeks (14–18 days)\n  — Sensitivity 99.7%, specificity 99.5%\n  — Laboratory-based; turnaround time typically 1–2 hours\n\n• **3rd generation antibody-only immunoassay**\n  — Detects HIV-1/2 antibodies (IgM and IgG)\n  — Window period: 3–4 weeks (21–28 days)\n  — Will MISS acute seroconversion during the window period\n\n• **Rapid point-of-care tests** (e.g., OraQuick, INSTI)\n  — Antibody-only (most are 3rd generation equivalent)\n  — Results in 1–20 minutes\n  — Useful for screening but CANNOT rule out acute HIV infection\n  — All reactive rapid tests require confirmatory laboratory testing\n\n• **HIV RNA viral load (PCR/NAAT)**\n  — Detects viral RNA directly; earliest marker (detectable 10–12 days post-infection)\n  — NOT a screening test — use when acute seroconversion suspected with negative/indeterminate Ag/Ab\n  — Quantitative result also useful for monitoring treatment response"},{"heading":"Window Periods Summary","body":"• **HIV RNA (NAAT):** 10–12 days\n• **4th gen Ag/Ab:** 14–18 days (p24 antigen appears first)\n• **3rd gen Ab-only:** 21–28 days\n• **Rapid POC tests:** 21–90 days (depending on test)\n• **Self-test (OraQuick Home):** ~90 days\n\nA negative test within the window period does NOT exclude infection. Counsel patients with recent high-risk exposure to retest at appropriate intervals."},{"heading":"Confirmatory Testing Algorithm (CDC)","body":"• Reactive 4th gen Ag/Ab → HIV-1/HIV-2 antibody differentiation immunoassay\n• If differentiation assay is negative or indeterminate → HIV-1 RNA NAAT\n• Positive NAAT = acute HIV-1 infection (antibodies not yet developed)\n• Negative NAAT + negative differentiation = false-positive initial screen\n• Never diagnose HIV on a single reactive screening test — always confirm"},{"heading":"ED Pearls","body":"• **Opt-out > opt-in:** ED programs using opt-out achieve 2–3× higher testing rates\n• **Link to care** is essential: a positive result without a warm handoff to HIV care is a missed opportunity\n• **PEP window:** if exposure was <72 hours ago, initiate PEP while confirmatory results are pending\n• **Acute seroconversion:** the highest-transmission-risk period — viral loads can exceed 10 million copies/mL\n• **Document** exposure history and risk assessment in the chart for all tested patients"}]'::jsonb,
 '[{"num":1,"text":"Branson BM, Handsfield HH, Lampe MA, et al. Revised Recommendations for HIV Testing of Adults, Adolescents, and Pregnant Women in Health-Care Settings. MMWR Recomm Rep. 2006;55(RR-14):1-17."},{"num":2,"text":"US Preventive Services Task Force. Screening for HIV Infection: US Preventive Services Task Force Recommendation Statement. JAMA. 2019;321(23):2326-2336."},{"num":3,"text":"Rothman RE, Lyons MS, Haukoos JS. Optimal HIV Testing Strategies for Emergency Departments. Ann Emerg Med. 2018;72(5):533-545."},{"num":4,"text":"Centers for Disease Control and Prevention. Laboratory Testing for the Diagnosis of HIV Infection: Updated Recommendations. CDC. 2014."}]'::jsonb,
 false,
 3)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hiv-system-complications', 'HIV System-Based Complications', 'Comprehensive Organ-System Reference',
 '[{"body":"People living with HIV face a dual burden: opportunistic infections (primarily when immunocompromised) and chronic inflammatory/metabolic complications (even when virally suppressed). This reference covers ED-relevant complications organized by organ system. [1][2]"},{"heading":"Cardiovascular","body":"• **Coronary artery disease** — 1.5–2× increased risk vs. general population; chronic inflammation, ART metabolic effects (PIs), and traditional risk factors. Treat per standard ACS guidelines. [1]\n• **Heart failure** — HIV-associated cardiomyopathy (dilated, often subclinical); myocarditis from HIV itself or OIs\n• **Venous thromboembolism** — 2–10× increased VTE risk; chronic inflammation, endothelial dysfunction, immobility, OIs\n• **Pulmonary hypertension** — HIV-associated PAH; dyspnea, RV failure; occurs independent of CD4 count\n• **Pericardial disease** — effusion (TB, lymphoma), pericarditis"},{"heading":"Pulmonary","body":"• **PJP (Pneumocystis jirovecii pneumonia)** — CD4 <200; insidious dyspnea, dry cough, bilateral ground-glass opacities on CT, elevated LDH; diagnose with induced sputum or BAL\n• **COPD** — accelerated lung aging; increased prevalence even in non-smokers\n• **Pulmonary embolism** — elevated VTE risk (see Cardiovascular)\n• **Tuberculosis** — any CD4 count; atypical presentations with low CD4 (lower lobe, miliary, extrapulmonary); always isolate and test\n• **Bacterial pneumonia** — most common pulmonary infection at any CD4; S. pneumoniae, H. influenzae; recurrent pneumonia is an AIDS-defining illness\n• **Kaposi sarcoma** — pulmonary KS with bilateral nodular infiltrates, pleural effusions; CD4 typically <100"},{"heading":"Renal","body":"• **HIV-associated nephropathy (HIVAN)** — collapsing FSGS; proteinuria, renal failure; more common in Black patients; improves with ART\n• **Fanconi syndrome** — TDF-induced proximal renal tubular acidosis; glycosuria, phosphaturia, proteinuria, non-anion gap metabolic acidosis\n• **Radiolucent kidney stones** — atazanavir (PI); invisible on plain film; CT required for diagnosis\n• **Acute kidney injury** — multifactorial: medications (TDF, NSAIDs, TMP-SMX), dehydration, sepsis, rhabdomyolysis\n• **Chronic kidney disease** — prevalence 5–30%; TDF, diabetes, hypertension, HIVAN all contribute"},{"heading":"Neurologic","body":"• **Stroke** — increased risk across all age groups; vasculopathy, accelerated atherosclerosis, cardioembolism, opportunistic vasculitis\n• **HIV-associated neurocognitive disorder (HAND)** — spectrum from asymptomatic to HIV-associated dementia; occurs even with viral suppression\n• **CNS opportunistic infections:**\n  — Toxoplasmosis (CD4 <100): ring-enhancing lesions, seizures, focal deficits\n  — Cryptococcal meningitis (CD4 <100): headache, altered mental status, elevated opening pressure >20 cmH₂O\n  — PML/JC virus (CD4 <200): progressive white matter demyelination, no enhancement, no mass effect\n  — CMV encephalitis (CD4 <50): periventricular enhancement\n• **Primary CNS lymphoma** — CD4 <50; single ring-enhancing lesion (vs. multiple in toxo); EBV-driven\n• **Peripheral neuropathy** — distal symmetric polyneuropathy (HIV itself or didanosine/stavudine)"},{"heading":"Gastrointestinal","body":"• **Medication-induced diarrhea** — PIs (especially ritonavir), nelfinavir; common reason for ED visit\n• **C. difficile** — higher incidence and recurrence rates in HIV patients\n• **Hepatitis C co-infection** — present in ~25% of HIV patients; accelerated fibrosis; check HCV status\n• **Hepatitis B co-infection** — TDF/TAF and FTC/3TC treat both; HBV flare if these agents stopped\n• **Esophageal disease** — Candida esophagitis (CD4 <200; odynophagia, white plaques), CMV esophagitis (CD4 <50; deep ulcers), HSV esophagitis\n• **CMV colitis** — CD4 <50; bloody diarrhea, abdominal pain; biopsy for diagnosis\n• **HIV enteropathy** — chronic diarrhea, malabsorption without identifiable pathogen; diagnosis of exclusion"},{"heading":"Hematologic","body":"• **Cytopenias** — anemia (HIV marrow suppression, AZT, parvovirus B19), neutropenia (HIV, AZT, TMP-SMX), thrombocytopenia (immune-mediated, resembles ITP)\n• **Venous thromboembolism** — 2–10× increased risk; consider in any HIV patient with dyspnea or leg swelling\n• **Thrombotic thrombocytopenic purpura (TTP)** — rare but classic association; pentad of thrombocytopenia, MAHA, neuro changes, renal failure, fever\n• **Lymphoma** — non-Hodgkin (Burkitt, DLBCL, primary CNS), Hodgkin lymphoma (not AIDS-defining but increased); B symptoms, lymphadenopathy, cytopenias"},{"heading":"Endocrine & Metabolic","body":"• **Metabolic syndrome** — PI-associated dyslipidemia (elevated TG, LDL), insulin resistance, central lipodystrophy\n• **IRIS thyrotoxicosis** — Graves disease unmasked by immune reconstitution after ART initiation; presents weeks to months into treatment\n• **Diabetes mellitus** — PI-associated insulin resistance; increased prevalence\n• **Adrenal insufficiency** — CMV adrenalitis, ketoconazole use, infiltrative disease; consider in critically ill HIV patient with refractory hypotension\n• **Hypogonadism** — testosterone deficiency; fatigue, weight loss, decreased bone density\n• **Lactic acidosis** — NRTI-induced mitochondrial toxicity; unexplained AG metabolic acidosis with hepatic steatosis"},{"heading":"Musculoskeletal","body":"• **Osteoporosis / fractures** — TDF bone loss, chronic inflammation, hypogonadism; 2–4× increased fracture risk\n• **Avascular necrosis (AVN)** — corticosteroid use, PI-associated dyslipidemia; hip most common; bilateral in 40–80%\n• **Myopathy** — AZT-associated mitochondrial myopathy; proximal weakness, elevated CK\n• **Septic arthritis / osteomyelitis** — increased risk when immunocompromised; atypical organisms possible"},{"heading":"Psychiatric","body":"• **Depression** — 2–3× prevalence vs. general population; screen all patients; major barrier to ART adherence\n• **Demoralization / adjustment disorder** — common at diagnosis and during disease complications\n• **Mania / psychosis** — efavirenz-induced neuropsychiatric effects; CNS OIs (toxo, PML); HIV-associated mania (late-stage)\n• **Suicidality** — increased risk, especially at diagnosis and during efavirenz therapy\n• **Substance use disorders** — high co-occurrence; IDU, methamphetamine, alcohol; critical to address for ART adherence"},{"heading":"Dermatologic","body":"• **Drug rashes** — NNRTIs (SJS/TEN risk with nevirapine, efavirenz), abacavir hypersensitivity, TMP-SMX (10× more common in HIV), dapsone\n• **Eosinophilic folliculitis** — pruritic papules on face, trunk; CD4 <250; improves with ART\n• **Kaposi sarcoma** — HHV-8–driven; violaceous papules/plaques/nodules; skin, oral mucosa, visceral involvement; AIDS-defining\n• **Molluscum contagiosum** — giant or widespread lesions when CD4 <200\n• **Herpes zoster** — multidermatomal or disseminated; may be first sign of immunocompromise\n• **Seborrheic dermatitis** — severe, widespread; common early indicator\n• **Prurigo nodularis** — chronic pruritic nodules; associated with advanced immunosuppression"}]'::jsonb,
 '[{"num":1,"text":"Feinstein MJ, Hsue PY, Benjamin LA, et al. Characteristics, Prevention, and Management of Cardiovascular Disease in People Living With HIV: A Scientific Statement From the American Heart Association. Circulation. 2019;140(2):e98-e124."},{"num":2,"text":"Saag MS, Gandhi RT, Hoy JF, et al. Antiretroviral Drugs for Treatment and Prevention of HIV Infection in Adults: 2020 Recommendations of the International Antiviral Society–USA Panel. JAMA. 2020;324(16):1651-1669."},{"num":3,"text":"Panel on Antiretroviral Guidelines for Adults and Adolescents. Guidelines for the Use of Antiretroviral Agents in Adults and Adolescents with HIV. HHS. 2024."},{"num":4,"text":"Kaplan JE, Benson C, Holmes KK, et al. Guidelines for Prevention and Treatment of Opportunistic Infections in HIV-Infected Adults and Adolescents. MMWR Recomm Rep. 2009;58(RR-4):1-207."}]'::jsonb,
 false,
 4)
;

COMMIT;
