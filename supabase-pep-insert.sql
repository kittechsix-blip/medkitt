-- =====================================================================
-- MedKitt — Post Exposure Prophylaxis Consult: Supabase INSERT Statements
-- Generated: 2026-03-10
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'pep',
  'Post Exposure Prophylaxis',
  'Exposure → HIV Assessment → Initiation → Follow-Up',
  '1.0',
  15,
  'pep-start',
  '["Exposure Assessment","HIV Assessment","Initiation","Follow-Up"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('infectious-disease', 'pep', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('emergency-medicine', 'pep', NULL, NULL, NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (7 citations)
DELETE FROM tree_citations WHERE tree_id = 'pep';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('pep', 1, 'Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV — CDC Recommendations, 2025. MMWR. 2025;74(1):1-56.'),
('pep', 2, 'Kofman AD, et al. 2025 US PHS Guidelines for Management of Occupational Exposures to HIV. Infect Control Hosp Epidemiol. 2025;46(9):863-873.'),
('pep', 3, 'Kuhar DT, et al. Updated US PHS Guidelines for Management of Occupational Exposures to HIV. Infect Control Hosp Epidemiol. 2013;34(9):875-92.'),
('pep', 4, 'Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV: 2022 IAS-USA Recommendations. JAMA. 2023;329(1):63-84.'),
('pep', 5, 'CDC. Preexposure Prophylaxis for the Prevention of HIV Infection — 2021 Update. Clinical Practice Guideline.'),
('pep', 6, 'Workowski KA, et al. STI Treatment Guidelines, 2021. MMWR. 2021;70(4):1-187.'),
('pep', 7, 'Schillie S, et al. Prevention of HBV Infection: ACIP Recommendations. MMWR. 2018;67(1):1-31.');

DELETE FROM decision_nodes WHERE tree_id = 'pep';

-- 4. decision_nodes (15 nodes)

-- MODULE 1: EXPOSURE ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-start', 'pep', 'question', 1,
 'Exposure Type',
 '[Patient Info Sheet: PEP](#/info/pep-patient-info) — printable summary of transmission risk, treatment effectiveness, and side effects.

What type of HIV exposure occurred?',
 '[]'::jsonb, '[{"label":"Occupational","description":"Needlestick, sharps injury, or mucous membrane/non-intact skin splash","next":"pep-timing"},{"label":"Nonoccupational","description":"Sexual exposure, injection drug use, or other non-work-related contact","next":"pep-fluid"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-fluid', 'pep', 'question', 1,
 'Substantial Risk Fluid?',
 'Was the exposure to a substantial-risk body fluid?

SUBSTANTIAL RISK
• Blood
• Semen / vaginal secretions
• Rectal secretions
• Breast milk
• Any visibly bloody body fluid

NEGLIGIBLE RISK
• Urine, saliva, sweat, tears (without visible blood)',
 '[1]'::jsonb, '[{"label":"Yes — Substantial-risk fluid","description":"Blood, semen, vaginal/rectal secretions, or visibly bloody fluid","next":"pep-timing"},{"label":"No — Negligible-risk fluid only","description":"Urine, saliva, sweat, tears without visible blood","next":"pep-low-risk"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-low-risk', 'pep', 'result', 1,
 'PEP Not Indicated',
 'Exposure involved only negligible-risk body fluids. No documented cases of HIV transmission from these fluids.',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'PEP is not recommended. Provide reassurance and risk reduction counseling.

BASELINE LABS STILL RECOMMENDED
• HIV Ag/Ab combo (4th gen)
• Hepatitis B [surface Ag](#/info/hbv-serology), [surface Ab](#/info/hbv-serology), [core Ab](#/info/hbv-serology)
• Hepatitis C Ab', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-timing', 'pep', 'question', 1,
 'Time Since Exposure',
 'Has it been ≤72 hours since the exposure?

PEP must be initiated as soon as possible. Efficacy decreases with delay and is not recommended after 72 hours.',
 '[1,2]'::jsonb, '[{"label":"Yes — ≤72 hours","description":"Within the treatment window","next":"pep-patient-hiv","urgency":"urgent"},{"label":"No — >72 hours","description":"Outside the recommended treatment window","next":"pep-late"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-late', 'pep', 'result', 1,
 'PEP Not Indicated',
 'Exposure occurred >72 hours ago. PEP is not recommended beyond this window due to lack of efficacy data.',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'PEP is not recommended. Provide risk reduction counseling. Discuss [PrEP](#/info/prep-info) for ongoing risk.

BASELINE LABS STILL RECOMMENDED
• HIV Ag/Ab combo (4th gen) — repeat at 4–6 weeks and 3 months
• Hepatitis B [surface Ag](#/info/hbv-serology), [surface Ab](#/info/hbv-serology), [core Ab](#/info/hbv-serology)
• Hepatitis C Ab', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 4)
;


-- MODULE 2: HIV ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-patient-hiv', 'pep', 'question', 2,
 'Patient HIV Status',
 'What is the exposed patient’s HIV status?',
 '[]'::jsonb, '[{"label":"HIV-negative or unknown","description":"Proceed with PEP evaluation","next":"pep-source"},{"label":"Known HIV-positive","description":"Already living with HIV","next":"pep-positive"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-positive', 'pep', 'result', 2,
 'Not a PEP Candidate',
 'Patient is already HIV-positive. PEP is prophylaxis for HIV-negative individuals only.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Refer to HIV specialist for ART management. Verify viral load and treatment adherence. PEP is not applicable.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-source', 'pep', 'question', 2,
 'Source HIV Status',
 'What is the source person’s HIV status?

If source is known HIV+ on ART with sustained undetectable viral load (<200 copies/mL), transmission risk is negligible (U=U). PEP may still be offered per patient preference.',
 '[1,2,4]'::jsonb, '[{"label":"HIV-positive or unknown","description":"Source is HIV+, unknown status, or cannot be tested","next":"pep-workup","urgency":"urgent"},{"label":"Confirmed HIV-negative","description":"Source has documented negative HIV test","next":"pep-source-neg"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-source-neg', 'pep', 'result', 2,
 'PEP Not Indicated',
 'Source is confirmed HIV-negative. No HIV transmission risk from this exposure.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'PEP is not recommended. If source HIV test was a rapid test, confirm with lab-based assay. Consider window period if source has recent high-risk behavior.

BASELINE LABS STILL RECOMMENDED
• HIV Ag/Ab combo (4th gen)
• Hepatitis B [surface Ag](#/info/hbv-serology), [surface Ab](#/info/hbv-serology), [core Ab](#/info/hbv-serology)
• Hepatitis C Ab', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 8)
;


-- MODULE 3: INITIATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-workup', 'pep', 'info', 3,
 'Start PEP Immediately',
 '**Do not delay PEP for test results.** Start medications now; adjust later based on labs.

BASELINE LABS
• HIV Ag/Ab combo (4th gen)
• Hepatitis B [surface Ag](#/info/hbv-serology), [surface Ab](#/info/hbv-serology), [core Ab](#/info/hbv-serology)
• Hepatitis C Ab
• BMP (creatinine for renal dosing)
• CBC
• Pregnancy test (if applicable)
• STI screening (GC/CT, syphilis RPR)

For occupational exposures, also test the source patient for HIV, HBV, and HCV.',
 '[1,2,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pep-special', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-special', 'pep', 'question', 3,
 'Special Population?',
 'Does the patient have any of the following?',
 '[]'::jsonb, '[{"label":"Pregnant","description":"Known or suspected pregnancy","next":"pep-pregnancy"},{"label":"Renal impairment (CrCl <50)","description":"Requires dose adjustment","next":"pep-renal"},{"label":"None of the above","description":"Standard regimen","next":"pep-regimen"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-pregnancy', 'pep', 'info', 3,
 'Pregnancy Considerations',
 'PEP is safe and recommended in pregnancy. Use the same preferred regimen.

• [Biktarvy](#/drug/biktarvy) (BIC/FTC/TAF) — preferred single-tablet regimen, extensive safety data in pregnancy
• Alternative: [TDF/FTC](#/drug/tdf-ftc) + [Dolutegravir](#/drug/dolutegravir)
• Avoid efavirenz-based regimens
• OB/HIV specialist consultation recommended',
 '[1,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pep-regimen', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-renal', 'pep', 'info', 3,
 'Renal Impairment',
 'Dose adjustment required for CrCl <50 mL/min.

• Use TAF-based regimen (TAF is preferred over TDF in renal impairment)
• [Biktarvy](#/drug/biktarvy) — do not use if CrCl <30
• If CrCl <30: consult ID/pharmacy for alternative regimen
• Avoid TDF if CrCl <60 (nephrotoxic)',
 '[1,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pep-regimen', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-regimen', 'pep', 'info', 3,
 '28-Day Regimen',
 '**PREFERRED REGIMEN**
[Biktarvy](#/drug/biktarvy) (bictegravir/emtricitabine/TAF) — 1 tablet PO daily x 28 days

**ALTERNATIVE REGIMEN**
[TDF/FTC](#/drug/tdf-ftc) (Truvada) 1 tablet PO daily + [Dolutegravir](#/drug/dolutegravir) (Tivicay) 50 mg PO daily x 28 days

**SECOND ALTERNATIVE**
[TDF/FTC](#/drug/tdf-ftc) + [Darunavir](#/drug/darunavir) 800 mg PO daily + [Ritonavir](#/drug/ritonavir) 100 mg PO daily x 28 days

Prescribe full 28-day course from the ED. Do not dispense starter packs — patients may not follow up for refills.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'pep-followup', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;


-- MODULE 4: FOLLOW-UP
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('pep-followup', 'pep', 'result', 4,
 'Follow-Up & Disposition',
 'HIV TESTING SCHEDULE
• Baseline: HIV Ag/Ab (4th gen) at initial visit
• 4–6 weeks: Repeat HIV test
• 3 months: Repeat HIV test (final if 4th gen used)

MEDICATION FOLLOW-UP
• 2-week visit: Assess adherence, side effects, renal function
• Complete full 28 days — early discontinuation reduces efficacy

HEPATITIS B & C FOLLOW-UP
• Review baseline Hepatitis B [surface Ag](#/info/hbv-serology), [surface Ab](#/info/hbv-serology), [core Ab](#/info/hbv-serology) results
• If susceptible (all negative): start HBV vaccine series; give HBIG if source HBV+
• HCV: Baseline + 6-month HCV Ab; if seroconversion, early DAA treatment cures >95%

OCCUPATIONAL EXPOSURES
• Report to occupational health / employee health

PrEP TRANSITION
• For patients with ongoing HIV risk, transition to PrEP after completing PEP and confirming HIV-negative status
• No gap needed between PEP and PrEP',
 '[1,2,5,6,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Prescribe full 28-day course. Schedule follow-up at 2 weeks. Arrange HIV testing at 4–6 weeks and 3 months. Review HBV serology and vaccinate if susceptible. Discuss PrEP for ongoing risk. For occupational exposures, report to employee health.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 14)
;


-- 5. drugs (5 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('biktarvy', 'Biktarvy (BIC/FTC/TAF)', 'Bictegravir / Emtricitabine / Tenofovir alafenamide', 'INSTI + dual NRTI combination (single-tablet regimen)', 'PO',
 '["HIV post-exposure prophylaxis (PEP)","HIV treatment (ART)"]'::jsonb,
 '[{"indication":"HIV PEP","regimen":"1 tablet (50/200/25 mg) PO once daily x 28 days. Take with or without food. Start as soon as possible, within 72 hours of exposure."}]'::jsonb,
 '["Co-administration with dofetilide","Co-administration with rifampin (reduces bictegravir levels)"]'::jsonb,
 '["CrCl <30 mL/min — not recommended (limited data)","Lactic acidosis / severe hepatomegaly with steatosis — rare but serious class effect of NRTIs","HBV co-infection — severe hepatitis flare may occur upon discontinuation (contains FTC/TAF, active against HBV)","Drug interactions — avoid polyvalent cation-containing antacids within 2 hours"]'::jsonb,
 'Renal function (BMP) at baseline and 2 weeks. HIV testing at baseline, 4–6 weeks, and 3 months.',
 'Preferred single-tablet PEP regimen per 2025 CDC guidelines. High barrier to resistance. Well tolerated with low discontinuation rates. TAF has less renal/bone toxicity than TDF.',
 NULL,
 '["Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV. MMWR. 2025;74(1):1-56.","Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('darunavir', 'Darunavir (Prezista)', 'Darunavir', 'Protease inhibitor (PI)', 'PO',
 '["HIV post-exposure prophylaxis (alternative regimen)","HIV treatment (ART)"]'::jsonb,
 '[{"indication":"HIV PEP (alternative)","regimen":"800 mg PO once daily + ritonavir 100 mg PO once daily x 28 days. Must be taken with food. Always co-administer with ritonavir (pharmacokinetic booster)."}]'::jsonb,
 '["Co-administration with alfuzosin, ergot derivatives, cisapride, pimozide, oral midazolam/triazolam, St. John’s wort, lovastatin, simvastatin","Severe hepatic impairment (Child-Pugh C)"]'::jsonb,
 '["Sulfonamide allergy — darunavir contains a sulfonamide moiety; use with caution","Hepatotoxicity — monitor LFTs, especially in HBV/HCV co-infection","Multiple CYP3A4 drug interactions — review full medication list","Skin rash — including rare Stevens-Johnson syndrome"]'::jsonb,
 'LFTs at baseline and 2 weeks. Renal function. HIV testing at baseline, 4–6 weeks, and 3 months.',
 'Alternative 3rd agent for PEP when INSTI-based regimen cannot be used. Must be boosted with ritonavir. Higher pill burden and more drug interactions than dolutegravir.',
 NULL,
 '["Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV. MMWR. 2025;74(1):1-56.","Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('dolutegravir', 'Dolutegravir (Tivicay)', 'Dolutegravir', 'Integrase strand transfer inhibitor (INSTI)', 'PO',
 '["HIV post-exposure prophylaxis (PEP)","HIV treatment (ART)"]'::jsonb,
 '[{"indication":"HIV PEP","regimen":"50 mg PO once daily x 28 days (with TDF/FTC backbone). Take with or without food."}]'::jsonb,
 '["Co-administration with dofetilide (increased dofetilide levels)"]'::jsonb,
 '["Drug interactions — avoid polyvalent cation-containing antacids/supplements within 2 hours (chelation reduces absorption)","Metformin — dolutegravir increases metformin levels; limit metformin to 1000 mg/day","Insomnia and neuropsychiatric effects — reported in some patients","Weight gain — observed with long-term INSTI use"]'::jsonb,
 'HIV testing at baseline, 4–6 weeks, and 3 months. Renal function if on TDF backbone.',
 'Preferred 3rd agent for PEP when used with TDF/FTC backbone. High barrier to resistance. Well tolerated. Safe in pregnancy.',
 NULL,
 '["Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV. MMWR. 2025;74(1):1-56.","Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('ritonavir', 'Ritonavir (Norvir)', 'Ritonavir', 'Protease inhibitor (pharmacokinetic booster)', 'PO',
 '["Pharmacokinetic booster for darunavir (PEP alternative)","Pharmacokinetic booster for other PIs"]'::jsonb,
 '[{"indication":"PK booster for darunavir (PEP)","regimen":"100 mg PO once daily x 28 days. Always co-administer with darunavir 800 mg. Take with food."}]'::jsonb,
 '["Co-administration with alfuzosin, amiodarone, flecainide, ergot derivatives, lovastatin, simvastatin, pimozide, sildenafil (for PAH), oral midazolam/triazolam"]'::jsonb,
 '["Potent CYP3A4 inhibitor — extensive drug interactions; review full medication list","GI side effects (nausea, diarrhea, dysgeusia) — common at boosting doses","Hepatotoxicity — monitor LFTs in hepatic impairment","Lipid elevations with prolonged use"]'::jsonb,
 'LFTs at baseline. Review drug interaction list before prescribing.',
 'Used at sub-therapeutic dose (100 mg) solely as a pharmacokinetic booster to increase darunavir levels via CYP3A4 inhibition. Not used as a standalone antiretroviral at this dose.',
 NULL,
 '["Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('tdf-ftc', 'Tenofovir/Emtricitabine (Truvada)', 'Tenofovir disoproxil fumarate / Emtricitabine', 'Dual NRTI combination (backbone)', 'PO',
 '["HIV post-exposure prophylaxis (PEP backbone)","HIV pre-exposure prophylaxis (PrEP)","HIV treatment (ART backbone)"]'::jsonb,
 '[{"indication":"HIV PEP (backbone)","regimen":"1 tablet (300/200 mg) PO once daily x 28 days. Combine with dolutegravir 50 mg daily or darunavir/ritonavir. Take with or without food."}]'::jsonb,
 '["CrCl <60 mL/min for TDF-based formulations (nephrotoxic)"]'::jsonb,
 '["Renal toxicity (TDF) — monitor creatinine at baseline and 2 weeks; avoid if CrCl <60","Bone mineral density decrease — TDF associated with bone loss (TAF-based alternatives preferred if risk factors)","Lactic acidosis / hepatomegaly with steatosis — rare NRTI class effect","HBV co-infection — severe hepatitis flare may occur upon discontinuation (both FTC and TDF active against HBV)"]'::jsonb,
 'Renal function at baseline and 2 weeks. HIV testing at baseline, 4–6 weeks, and 3 months. HBV serology at baseline.',
 'Preferred dual-NRTI backbone for PEP when used with a 3rd agent (dolutegravir or darunavir/r). Also used for PrEP. TAF-based alternatives (e.g., Biktarvy, Descovy) have less renal/bone toxicity.',
 NULL,
 '["Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV. MMWR. 2025;74(1):1-56.","Gandhi RT, et al. Antiretroviral Drugs for Treatment and Prevention of HIV. JAMA. 2023;329(1):63-84."]'::jsonb,
 4)
;


-- 6. info_pages (3 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('hbv-serology', 'Hepatitis B Serology', 'Interpretation & Post-Exposure Management',
 '[{"heading":"The Three Markers","body":"**HBsAg (Surface Antigen)** — present on the virus surface. Positive = active infection (acute or chronic).\n\n**HBsAb (Surface Antibody)** — also called anti-HBs. Positive = immunity (from vaccination or resolved infection).\n\n**HBcAb (Core Antibody)** — also called anti-HBc. Positive = prior or current infection (does not develop from vaccination)."},{"heading":"Interpretation","body":"","drugTable":[{"drug":"Susceptible (not immune)","regimen":"HBsAg (−), HBsAb (−), HBcAb (−) — never infected, not vaccinated. Needs vaccination."},{"drug":"Immune (vaccination)","regimen":"HBsAg (−), HBsAb (+), HBcAb (−) — successfully vaccinated. No action needed."},{"drug":"Immune (natural infection)","regimen":"HBsAg (−), HBsAb (+), HBcAb (+) — prior infection, now resolved with immunity. No action needed."},{"drug":"Acute infection","regimen":"HBsAg (+), HBsAb (−), HBcAb (+), IgM core Ab (+) — actively infected, early stage. Refer for monitoring; most adults clear spontaneously."},{"drug":"Chronic infection","regimen":"HBsAg (+), HBsAb (−), HBcAb (+), IgM core Ab (−) — persistent infection >6 months. Refer hepatology for treatment evaluation."},{"drug":"Isolated core Ab+","regimen":"HBsAg (−), HBsAb (−), HBcAb (+) — possible resolved infection with waned antibody, false positive, or occult infection. Check HBV DNA if clinical concern."}]},{"heading":"Post-Exposure Actions","body":"**If exposed patient is susceptible (all markers negative):**\n• Source HBV-positive or unknown: give HBIG (0.06 mL/kg IM) + start HBV vaccine series\n• Source HBV-negative: start HBV vaccine series (no HBIG needed)\n• HBIG is most effective within 24 hours; give within 7 days of exposure\n\n**If exposed patient was previously vaccinated (HBsAb+):**\n• HBsAb ≥10 mIU/mL: protected, no treatment needed\n• HBsAb <10 mIU/mL (non-responder): give HBIG + vaccine booster\n\n**If exposed patient has chronic HBV (HBsAg+):**\n• HBIG and vaccine will not help — refer hepatology\n• Ensure patient is connected to HBV care"},{"heading":"HBV Vaccine Series","body":"• Standard: 0, 1, and 6 months (3-dose series)\n• Accelerated: Heplisav-B (HepB-CpG) — 2 doses, 1 month apart\n• Check HBsAb 1–2 months after final dose to confirm response (≥10 mIU/mL)"}]'::jsonb,
 '[{"num":1,"text":"Schillie S, et al. Prevention of Hepatitis B Virus Infection in the United States: Recommendations of the ACIP. MMWR. 2018;67(1):1-31."},{"num":2,"text":"Terrault NA, et al. Update on Prevention, Diagnosis, and Treatment of Chronic Hepatitis B: AASLD 2018 Hepatitis B Guidance. Hepatology. 2018;67(4):1560-1599."},{"num":3,"text":"Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV — CDC Recommendations, 2025. MMWR. 2025;74(1):1-56."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('pep-patient-info', 'PEP: What You Need to Know', 'Patient Information — Post-Exposure Prophylaxis for HIV',
 '[{"heading":"What Is PEP?","body":"PEP stands for post-exposure prophylaxis. It is a 28-day course of HIV medications taken after a possible exposure to HIV. PEP can prevent HIV infection if started within 72 hours of exposure. The sooner you start, the better it works."},{"heading":"How Likely Is HIV Transmission?","body":"The risk of getting HIV from a single exposure varies by type:\n\n• Receptive anal intercourse: ~1.4% per exposure (highest sexual risk)\n• Receptive vaginal intercourse: ~0.08% per exposure\n• Insertive anal or vaginal intercourse: ~0.04–0.11% per exposure\n• Needlestick injury: ~0.23% per exposure\n• Mucous membrane splash: ~0.09% per exposure\n• Sharing injection drug needles: ~0.63% per exposure\n\nRisk is higher if the source person has a high viral load (not on treatment) and lower if the source person is on HIV treatment with an undetectable viral load."},{"heading":"How Well Does PEP Work?","body":"PEP is highly effective when taken correctly:\n\n• Reduces HIV risk by approximately 80% or more\n• Most effective when started within hours of exposure — ideally within 2 hours\n• Must be taken every day for the full 28 days to work\n• Missing doses or stopping early significantly reduces effectiveness\n• PEP does not protect against other sexually transmitted infections"},{"heading":"Common Side Effects","body":"Most people tolerate PEP well. Side effects are usually mild and improve over the first 1–2 weeks:\n\n• Nausea (most common — take with food to help)\n• Fatigue or tiredness\n• Headache\n• Diarrhea or stomach discomfort\n• Difficulty sleeping\n\n**When to call your doctor:**\n• Severe nausea or vomiting that prevents you from taking the medication\n• Yellowing of skin or eyes\n• Dark-colored urine\n• Rash\n• Any severe or worsening symptoms"},{"heading":"Important Reminders","body":"• Take your medication at the same time every day\n• Complete all 28 days — do not stop early even if you feel fine\n• You will need follow-up HIV testing at 4–6 weeks and 3 months\n• Visit your doctor at 2 weeks to check for side effects and blood work\n• Use condoms and safe practices during and after PEP until your final HIV test is negative\n• If you have ongoing risk for HIV, ask your doctor about PrEP (pre-exposure prophylaxis) — a daily medication to prevent HIV before exposure"}]'::jsonb,
 '[{"num":1,"text":"Tanner MR, et al. Antiretroviral PEP After Sexual, IDU, or Other Nonoccupational Exposure to HIV — CDC Recommendations, 2025. MMWR. 2025;74(1):1-56."},{"num":2,"text":"Kofman AD, et al. 2025 US PHS Guidelines for Management of Occupational Exposures to HIV. Infect Control Hosp Epidemiol. 2025;46(9):863-873."}]'::jsonb,
 true,
 1)
;

-- WARNING: Info page "prep-info" not found!
COMMIT;
