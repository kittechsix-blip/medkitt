-- =====================================================================
-- MedKitt — Acute Diarrhea Consult: Supabase INSERT Statements
-- Generated: 2026-03-11
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'diarrhea',
  'Acute Diarrhea',
  'Assessment → Red Flags → Diagnostics → Treatment → Disposition',
  '1.0',
  24,
  'diarrhea-start',
  '["Initial Assessment","Risk Stratification","Diagnostics","Treatment","Special Populations & Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('gastroenterology', 'diarrhea', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('emergency-medicine', 'diarrhea', NULL, NULL, NULL, 1)
ON CONFLICT (category_id, tree_id) DO UPDATE SET
  display_title = EXCLUDED.display_title,
  display_subtitle = EXCLUDED.display_subtitle,
  entry_node_id = EXCLUDED.entry_node_id,
  sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (9 citations)
DELETE FROM tree_citations WHERE tree_id = 'diarrhea';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('diarrhea', 1, 'Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24.'),
('diarrhea', 2, 'Guerrant RL, Van Gilder T, Steiner TS, et al. Practice Guidelines for the Management of Infectious Diarrhea. Clin Infect Dis. 2001;32(3):331-351.'),
('diarrhea', 3, 'Cincinnati Children''s Hospital Medical Center. Evidence Based Clinical Practice Guideline for Children with Acute Gastroenteritis (AGE). 2001.'),
('diarrhea', 4, 'Riddle MS, DuPont HL, Connor BA. ACG Clinical Guideline: Diagnosis, Treatment, and Prevention of Acute Diarrheal Infections in Adults. Am J Gastroenterol. 2016;111(5):602-622.'),
('diarrhea', 5, 'Shane AL, Mody RK, Crump JA, et al. 2017 IDSA Clinical Practice Guidelines for the Diagnosis and Management of Infectious Diarrhea. Clin Infect Dis. 2017;65(12):e45-e80.'),
('diarrhea', 6, 'McDonald LC, Gerding DN, Johnson S, et al. Clinical Practice Guidelines for Clostridium difficile Infection in Adults and Children: 2017 Update by IDSA and SHEA. Clin Infect Dis. 2018;66(7):987-994.'),
('diarrhea', 7, 'DuPont HL. Guidelines on Acute Infectious Diarrhea in Adults. The Practice Parameters Committee of the American College of Gastroenterology. Am J Gastroenterol. 1997;92(11):1962-1975.'),
('diarrhea', 8, 'Freedman SB, Adler M, Laptook AR, et al. Oral Ondansetron for Gastroenteritis in a Pediatric Emergency Department. N Engl J Med. 2006;354(16):1698-1705.'),
('diarrhea', 9, 'Centers for Disease Control and Prevention. Travelers'' Diarrhea. CDC Yellow Book 2024.');

DELETE FROM decision_nodes WHERE tree_id = 'diarrhea';

-- 4. decision_nodes (24 nodes)

-- MODULE 1: INITIAL ASSESSMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-start', 'diarrhea', 'question', 1,
 'Acute Diarrhea',
 '[Acute Diarrhea Steps Summary](#/info/diarrhea-summary)

Emergency evaluation of acute diarrhea — identifying serious illness and guiding treatment.

Diarrhea is a change in bowel movements characterized by increased water content, volume, or frequency (>200 g/day or >3 stools/day). Most cases are self-limited, but **serious disease processes can present with diarrhea as the chief complaint**.

**Definitions:**
• **Acute** — ≤14 days
• **Persistent** — 14-30 days
• **Chronic** — >30 days

**Classification:**
• **Secretory** — abnormal electrolyte transport, does NOT stop with fasting (e.g., cholera)
• **Osmotic** — non-absorbable solute, stops with fasting (e.g., sorbitol)
• **Inflammatory** — bloody, fever, cramps (invasive bacteria, IBD)
• **Non-inflammatory** — watery, nausea, vomiting (viral, toxin-mediated)',
 '[1,2]'::jsonb, '[{"label":"Hemodynamically unstable","next":"diarrhea-resuscitate","urgency":"critical"},{"label":"Hemodynamically stable","next":"diarrhea-history"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-resuscitate', 'diarrhea', 'info', 1,
 'Resuscitation',
 '**Immediate interventions:**
• **ABCs** — secure airway if altered mental status
• **2 large-bore IVs** — NS or LR bolus 20 mL/kg
• **Cardiac monitor** — assess for arrhythmia from electrolyte derangement
• **POC glucose** — hypoglycemia common in pediatric patients

**Assess for sepsis:**
• Fever + tachycardia + hypotension → septic diarrhea until proven otherwise
• **Lactate**, **blood cultures** if sepsis suspected
• Broad-spectrum antibiotics per sepsis protocol if indicated

**Labs:** CBC, BMP (electrolytes, renal function, glucose), lactate, blood cultures, type & screen if severe anemia suspected

Once stabilized, proceed with targeted history.',
 '[1]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-history', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-history', 'diarrhea', 'question', 1,
 'Targeted History & Red Flag Assessment',
 '**Key history elements:**
• **Stool character:** frequency, volume, blood, mucus, melena (patients may not recognize black stool as blood — ask specifically)
• **Duration:** <48h likely viral; >48h raises suspicion for bacterial cause
• **Associated symptoms:** nausea/vomiting (suggests viral), fever >38.5°C (suggests invasive bacteria), tenesmus
• **Travel:** recent foreign travel, lake/stream exposure
• **Diet:** raw/undercooked meat, seafood, eggs, unpasteurized milk/juice
• **Medications:** antibiotics in past 3 months (C. difficile risk), laxatives, antacids, new medications
• **Contacts:** ill contacts, day care, nursing home, food handlers
• **PMH:** immunocompromised (HIV, transplant, chemo), IBD, diabetes

**Red flags:**
• Severe dehydration or hemodynamic instability
• Bloody diarrhea or dysentery
• Fever >38.5°C (101.3°F) with systemic illness
• Immunocompromised patient
• Severe abdominal pain (concern for surgical etiology)
• Elderly with comorbidities
• Neurologic involvement (paresthesias, weakness)',
 '[1,2,4]'::jsonb, '[{"label":"Red flags present","next":"diarrhea-red-flag-eval","urgency":"urgent"},{"label":"No red flags — mild, self-limited presentation","next":"diarrhea-mild"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-red-flag-eval', 'diarrhea', 'question', 1,
 'Red Flag Category',
 'Identify the **primary concern** to guide workup and management. Multiple red flags may be present — address the most critical first.',
 '[1,2]'::jsonb, '[{"label":"Bloody diarrhea / dysentery","next":"diarrhea-bloody","urgency":"urgent"},{"label":"Fever >38.5°C + systemic illness","next":"diarrhea-febrile","urgency":"urgent"},{"label":"Severe dehydration","next":"diarrhea-dehydration","urgency":"urgent"},{"label":"Immunocompromised","next":"diarrhea-immunocompromised"},{"label":"Concern for surgical abdomen","next":"diarrhea-surgical-ddx","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;


-- MODULE 2: RISK STRATIFICATION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-bloody', 'diarrhea', 'info', 2,
 'Bloody Diarrhea / Dysentery',
 '**Differential diagnosis:**
• **Shigella** — fever, bloody mucoid stool, tenesmus
• **Salmonella** — fever, cramping, may be bloody
• **Campylobacter** — fever, headache, bloody diarrhea 2-5 days after exposure
• **E. coli O157:H7 (EHEC/STEC)** — bloody diarrhea, often afebrile, undercooked beef or unpasteurized products
• **C. difficile** — recent antibiotic use, can be bloody
• **IBD** — chronic/recurrent, family history
• **Ischemic colitis** — elderly, vascular disease, severe pain

[Differential Diagnosis Pitfalls](#/info/diarrhea-ddx-pitfalls)

⚠️ **CRITICAL — Shiga toxin-producing E. coli (STEC):**
• Do **NOT** give antibiotics if STEC suspected — increases risk of **hemolytic uremic syndrome (HUS)**
• Do **NOT** give antimotility agents — delays pathogen clearance
• Suspect STEC: bloody diarrhea + afebrile + history of undercooked beef or unpasteurized products

**Mandatory workup:** stool culture, CBC with platelets (screen for HUS), BMP',
 '[1,2,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-febrile', 'diarrhea', 'info', 2,
 'Febrile Diarrhea',
 'Temperature **>38.5°C (101.3°F)** usually indicates intestinal inflammation from **invasive bacteria** (Shigella, Salmonella, Campylobacter) or toxin-producing organisms (C. difficile, Entamoeba histolytica).

**Workup:**
• **Fecal leukocytes or fecal lactoferrin** — screens for inflammatory diarrhea
• **Stool culture** — indicated when fever + positive fecal markers
• **C. difficile toxin** — if antibiotic use in past 3 months
• **CBC, BMP** — assess for leukocytosis, electrolyte derangement, renal function

[Empiric Antibiotic Criteria](#/info/diarrhea-abx-criteria)

Fecal lactoferrin is **more sensitive** than fecal leukocytes for detecting invasive pathogens and does not require a fresh specimen.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-dehydration', 'diarrhea', 'info', 2,
 'Severe Dehydration Assessment',
 '[Dehydration Assessment Guide](#/info/diarrhea-dehydration-assessment)

**Adults:**
• **Dry axilla** — supports hypovolemia diagnosis
• **Moist mucous membranes + tongue without furrows** — argues against hypovolemia
• Capillary refill and skin turgor have **no proven diagnostic value** in adults
• Orthostatic vitals, BUN/Cr ratio

**Children:**
• **Acute body weight change** — best measure of dehydration
• Mucous membrane hydration, capillary refill >2 sec, absence of tears, altered mental status — next best measures
• Sunken anterior fontanelle in infants

**IV rehydration:**
• NS or LR bolus 20 mL/kg, repeat as needed
• Monitor urine output as marker of volume status
• BMP for electrolyte correction
• Reassess after each bolus',
 '[1,3]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-immunocompromised', 'diarrhea', 'info', 2,
 'Immunocompromised Patient',
 'HIV/AIDS, transplant recipients, chemotherapy, chronic steroids, and other immunocompromised patients have a **broader differential** and require **more aggressive workup**.

**Additional pathogens to consider:**
• Cryptosporidium, Microsporidium, Isospora — profuse watery diarrhea, weight loss
• CMV — bloody diarrhea in advanced disease
• Mycobacterium avium complex (MAC) — chronic diarrhea, advanced HIV
• GI malignancies — lymphoma, Kaposi sarcoma

**Workup:**
• Stool culture (standard pathogens)
• C. difficile toxin assay
• **Ova and parasites** — indicated in this population
• CBC, BMP, lactate
• Consider CD4 count if HIV status unknown

**Disposition:** Lower threshold for admission. Consider early GI or infectious disease consultation. If stool studies negative, endoscopy referral may be needed for definitive diagnosis.',
 '[1,4,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-surgical-ddx', 'diarrhea', 'info', 2,
 'Surgical Differential',
 'Diarrhea can be a presenting feature of several **surgical emergencies**. Maintain high suspicion in patients with severe abdominal pain.

[Differential Diagnosis Pitfalls](#/info/diarrhea-ddx-pitfalls)

**Appendicitis:**
• Vomiting typically **follows** pain (in gastroenteritis, vomiting **precedes** pain)
• 1-2 loose stools (not voluminous like gastroenteritis)
• 15% of appendices are in atypical locations
• 27% of children initially misdiagnosed — diarrhea is a common confounding symptom
• Serial exams improve diagnostic accuracy

**Ischemic bowel:**
• Consider in adults **>50 years** or with peripheral vascular disease
• Severe pain out of proportion to exam
• Voluminous diarrhea (small bowel ischemia) or bloody diarrhea (ischemic colitis)
• Risk factors: arrhythmias, CHF, vasoconstrictors, cocaine
• Occult blood in up to 75% of patients

**Other surgical causes:** bowel obstruction, toxic megacolon, diverticulitis, intussusception (pediatric)

**CT abdomen/pelvis** indicated for surgical concern. If surgical etiology identified → surgical consult.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-labs', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 8)
;


-- MODULE 3: DIAGNOSTICS
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-labs', 'diarrhea', 'question', 3,
 'Diagnostic Evaluation',
 '[Empiric Antibiotic Criteria](#/info/diarrhea-abx-criteria)

**Selective testing — routine labs are NOT indicated for most patients:**

**Fecal leukocytes / lactoferrin:** community-acquired, traveler''s, nosocomial, or diarrhea >7 days

**Stool culture:** bloody stool, fever >38.5°C + positive fecal markers, immunocompromised, severe/persistent illness. Yield is low (1.5-5.6%) but identifies public health threats. Routine labs identify Shigella, Campylobacter, Salmonella.

**C. difficile toxin:** antibiotic use in past 3 months, recent hospitalization, nursing home

**Ova & parasites:** rarely indicated in acute diarrhea. Consider if >14 days, immunocompromised, no response to antibiotics, travel to endemic area

**CBC/BMP:** severe illness, bloody diarrhea (screen for HUS — platelets), elderly, immunocompromised, significant dehydration

**What is the suspected etiology?**',
 '[1,2,5]'::jsonb, '[{"label":"C. difficile suspected","description":"Antibiotic use in past 3 months, recent hospitalization","next":"diarrhea-cdiff"},{"label":"Traveler''s diarrhea","description":"Recent foreign travel to endemic area","next":"diarrhea-travelers"},{"label":"Community-acquired / other","description":"No specific risk factors identified, or multiple possible etiologies","next":"diarrhea-treatment"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-cdiff', 'diarrhea', 'info', 3,
 'C. difficile Evaluation',
 '**Suspect C. difficile if:**
• Antibiotic use in past **3 months** (especially clindamycin, fluoroquinolones, cephalosporins)
• Recent hospitalization or nursing home residence
• Diarrhea developing **≥3 days after hospitalization** (C. diff testing has 15-20% yield in nosocomial diarrhea vs <5% for standard stool cultures)

**Testing:**
• **C. difficile toxin assay** — preferred: NAAT (PCR) or GDH + toxin two-step algorithm
• Toxin A/B immunoassay alone has lower sensitivity

**Key management:**
• **STOP the offending antibiotic** if possible
• Start empiric treatment if strong clinical suspicion — stop if toxin assay returns negative

**Severity classification:**
• **Non-severe:** WBC ≤15K, Cr <1.5
• **Severe:** WBC >15K, Cr >1.5, albumin <3
• **Fulminant:** hypotension, ileus, megacolon → surgical consult',
 '[1,5,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-cdiff-treatment', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-cdiff-treatment', 'diarrhea', 'result', 3,
 'C. difficile Treatment',
 '**Non-severe (first episode):**
• [Vancomycin](#/drug/vancomycin/c difficile) 125 mg PO QID × 10-14 days (preferred)
• Alternative: [Metronidazole](#/drug/metronidazole/c difficile) 500 mg PO TID × 10-14 days

**Severe (WBC >15K, Cr >1.5):**
• [Vancomycin](#/drug/vancomycin/c difficile) 125 mg PO QID × 10-14 days
• Do NOT use metronidazole alone for severe disease

**Fulminant (hypotension, ileus, megacolon):**
• [Vancomycin](#/drug/vancomycin/c difficile) 500 mg PO/NG QID
• PLUS [Metronidazole](#/drug/metronidazole/c difficile) 500 mg IV q8h
• Consider rectal vancomycin enema if ileus present
• **Surgical consult** — colectomy may be lifesaving

**Disposition:** Admit severe and fulminant cases. Non-severe may be discharged with close follow-up.

[Special Populations](#/node/diarrhea-special-pops)',
 '[5,6]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Stop offending antibiotic. Oral vancomycin is first-line for all C. difficile. Admit severe and fulminant cases.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 11)
;


-- MODULE 4: TREATMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-travelers', 'diarrhea', 'question', 4,
 'Traveler''s Diarrhea',
 'Recent travel to endemic area (Latin America, Africa, South/Southeast Asia). Most common cause is enterotoxigenic E. coli.

**Key considerations:**
• **Southeast Asia** — >80% fluoroquinolone-resistant Campylobacter; use azithromycin instead
• Combination therapy (antibiotic + loperamide) is most efficacious
• Prevention counseling: carbonated/hot beverages, avoid buffets, leafy vegetables, ice',
 '[1,4,9]'::jsonb, '[{"label":"Mild (tolerable, non-distressing)","next":"diarrhea-travelers-mild"},{"label":"Moderate-Severe (incapacitating, bloody, or febrile)","next":"diarrhea-travelers-severe"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-travelers-mild', 'diarrhea', 'result', 4,
 'Mild Traveler''s Diarrhea',
 '**Symptomatic therapy:**
• [Loperamide](#/drug/loperamide/traveler diarrhea) 4 mg PO initially, then 2 mg after each loose stool (max 16 mg/day)
• [Bismuth Subsalicylate](#/drug/bismuth-subsalicylate/traveler diarrhea) 524 mg PO q30-60 min PRN (max 8 doses/day) — also helps nausea

Loperamide and bismuth subsalicylate have similar efficacy, but loperamide reduces stool frequency faster. Bismuth subsalicylate has additional antiemetic properties.

**Antibiotics not typically needed** for mild traveler''s diarrhea.

Discharge with return precautions. [Diarrhea Discharge Instructions](#/info/diarrhea-discharge)

[Special Populations](#/node/diarrhea-special-pops)',
 '[1,4,9]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Symptomatic treatment with loperamide or bismuth subsalicylate. Discharge with return precautions.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-travelers-severe', 'diarrhea', 'result', 4,
 'Moderate-Severe Traveler''s Diarrhea',
 '**Empiric antibiotics indicated:**
• [Ciprofloxacin](#/drug/ciprofloxacin/traveler diarrhea) 500 mg PO BID × 3 days (first-line for most regions)
• **Southeast Asia:** [Azithromycin](#/drug/azithromycin/traveler diarrhea) 1000 mg PO × 1 dose or 500 mg PO daily × 3 days (fluoroquinolone-resistant Campylobacter >80%)
• **Children:** [TMP-SMX](#/drug/tmp-smx/traveler diarrhea)

**Adjunct therapy:**
• [Loperamide](#/drug/loperamide/traveler diarrhea) with antibiotic — combination therapy reduces diarrhea duration by 1 additional day
• IV rehydration if unable to tolerate oral fluids

**Avoid loperamide** if bloody diarrhea or high fever.

[Special Populations](#/node/diarrhea-special-pops)',
 '[1,4,5,9]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Empiric fluoroquinolone (or azithromycin for SE Asia) plus adjunct loperamide. Reassess for admission if not improving.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 14)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-treatment', 'diarrhea', 'question', 4,
 'Treatment Approach',
 '**Rehydration is the cornerstone** of diarrhea management.

[Antimotility Contraindications](#/info/diarrhea-antimotility-ci)

Oral rehydration is preferred when tolerated — it is effective, low-cost, and an indicator of discharge readiness. Solutions should contain sodium, potassium, and glucose. Commercial ORS (Pedialyte) preferred over sports drinks (inadequate sodium replacement).

**BRAT diet** (bananas, rice, applesauce, toast) has no proven advantage over resuming the patient''s normal diet.',
 '[1,2,4]'::jsonb, '[{"label":"Mild — oral rehydration + symptomatic","next":"diarrhea-mild"},{"label":"Moderate — IV fluids + symptomatic","next":"diarrhea-moderate-rx"},{"label":"Severe or empiric antibiotics indicated","description":"Fever >38.5°C + positive fecal markers, dysentery, or duration >48h","next":"diarrhea-empiric-abx"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-mild', 'diarrhea', 'result', 4,
 'Mild / Self-Limited Diarrhea',
 '**Rehydration:**
• Oral rehydration solution (ORS) with sodium, potassium, glucose
• Commercial options: Pedialyte, Lytren, Rehydrolyte
• Resume normal diet at earliest opportunity — early refeeding improves recovery

**Symptomatic relief:**
• [Loperamide](#/drug/loperamide/acute diarrhea) 4 mg PO initially, then 2 mg after each loose stool (max 16 mg/day) — preferred antimotility agent (no CNS effects, not habit-forming)
• [Bismuth Subsalicylate](#/drug/bismuth-subsalicylate/acute diarrhea) 524 mg PO q30-60 min PRN — preferred when nausea/vomiting is prominent
• [Ondansetron](#/drug/ondansetron/acute diarrhea) 4 mg IV or ODT for vomiting preventing oral intake

[Antimotility Contraindications](#/info/diarrhea-antimotility-ci) — **AVOID** antimotility agents with bloody diarrhea, high fever, suspected inflammatory cause, or immunocompromised patients.

[Diarrhea Discharge Instructions](#/info/diarrhea-discharge)

[Special Populations](#/node/diarrhea-special-pops)',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Oral rehydration, symptomatic relief, discharge with return precautions.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-moderate-rx', 'diarrhea', 'info', 4,
 'Moderate Diarrhea Treatment',
 '**IV rehydration:**
• NS or LR bolus, reassess after each liter
• Target: urine output, improved vitals, ability to tolerate oral fluids

**Antiemetics:**
• [Ondansetron](#/drug/ondansetron/acute diarrhea) 4 mg IV q4-6h PRN for vomiting preventing oral intake

**Antimotility (if no contraindications):**
• [Loperamide](#/drug/loperamide/acute diarrhea) 4 mg PO then 2 mg PRN (max 16 mg/day)

**Assess for empiric antibiotic criteria:**
• Diarrhea >48 hours (higher probability non-viral)
• Fever >38.5°C + fecal leukocytes/lactoferrin positive or heme-positive stools
• Acute dysentery

If meets criteria → proceed to empiric antibiotics.',
 '[1,2,4]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'diarrhea-empiric-abx', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-empiric-abx', 'diarrhea', 'result', 4,
 'Empiric Antibiotic Therapy',
 '[Empiric Antibiotic Criteria](#/info/diarrhea-abx-criteria)

**Adults (fever >38.5°C + positive fecal markers, dysentery, or >48h):**
• [Ciprofloxacin](#/drug/ciprofloxacin/acute diarrhea) 500 mg PO BID × 3-5 days

**Children:**
• [TMP-SMX](#/drug/tmp-smx/acute diarrhea) (dose by weight) × 3-5 days

**Persistent diarrhea (2-4 weeks) without systemic symptoms:**
• [Metronidazole](#/drug/metronidazole/persistent diarrhea) 250 mg PO TID × 7-10 days (covers Giardia)

**Elderly considerations:** fluoroquinolones can increase theophylline and warfarin levels, and can alter phenytoin levels. Metronidazole can cause nausea/vomiting and has disulfiram-like reaction with alcohol.

⚠️ **Do NOT give antibiotics if STEC (E. coli O157:H7) suspected** — increases HUS risk.

[Diarrhea Discharge Instructions](#/info/diarrhea-discharge)

[Special Populations](#/node/diarrhea-special-pops)',
 '[1,2,4,5]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Empiric fluoroquinolone for adults, TMP-SMX for children. Duration 3-5 days. Avoid antibiotics if STEC suspected.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 18)
;


-- MODULE 5: SPECIAL POPULATIONS & DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-special-pops', 'diarrhea', 'question', 5,
 'Special Population Considerations',
 'Certain populations require modified workup, treatment, and disposition decisions.',
 '[]'::jsonb, '[{"label":"Pregnant patient","next":"diarrhea-pregnant"},{"label":"Pediatric patient","next":"diarrhea-pediatric"},{"label":"Elderly with comorbidities","next":"diarrhea-elderly"},{"label":"None — proceed to disposition","next":"diarrhea-disposition"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-pregnant', 'diarrhea', 'result', 5,
 'Diarrhea in Pregnancy',
 '**Dehydration is dangerous for both mother and fetus** — aggressive rehydration is top priority.

**Safest antimotility:**
• [Loperamide](#/drug/loperamide/pregnancy) — acts peripherally (FDA Category B), safest option
• **AVOID** diphenoxylate (CNS effects) and bismuth subsalicylate (contains salicylates)

**Antibiotics:**
• [Metronidazole](#/drug/metronidazole/pregnancy) — Category B after first trimester, can be used if benefits outweigh risks
• **AVOID fluoroquinolones** — cartilage toxicity risk
• **AVOID TMP-SMX** — folate antagonism, teratogenic risk (especially first trimester and near term)

If doubts about antibiotic safety, coordinate treatment with the patient''s OB/GYN.

Low threshold for admission if unable to maintain oral hydration.',
 '[1,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Aggressive rehydration. Loperamide is safest antimotility. Metronidazole (Cat B) after first trimester if needed. Avoid fluoroquinolones and TMP-SMX.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 20)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-pediatric', 'diarrhea', 'result', 5,
 'Pediatric Diarrhea',
 '**Key differences from adults:**
• **Rotavirus** is the most common cause in children
• **ORS is preferred** over IV — evidence-based and WHO-endorsed. Use commercial ORS (Pedialyte), NOT sports drinks or plain water
• **No antimotility agents** — not recommended in children with acute gastroenteritis
• **No routine antiemetics** in children with acute gastroenteritis, except:
  [Ondansetron](#/drug/ondansetron/pediatric diarrhea) 0.15 mg/kg IV/ODT (max 4 mg) — facilitates oral rehydration in vomiting children

⚠️ **E. coli O157:H7 and HUS:**
• Most common cause of acute kidney failure in children
• Do **NOT** give antibiotics if STEC suspected — increases HUS risk
• Monitor: platelet count, hemolytic anemia, renal function
• Signs: pallor, bruising, petechiae, decreased urine output

**Admit if:** severe dehydration, altered mental status, inability to maintain oral hydration, suspected HUS, very young (<3 months)

Excessive consumption of sugary clear liquids can itself cause watery stools — ask about intake.',
 '[1,3,5,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'ORS rehydration. No antimotility agents. Ondansetron to facilitate oral intake in vomiting children. Admit if severe dehydration or suspected HUS.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 21)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-elderly', 'diarrhea', 'result', 5,
 'Diarrhea in the Elderly',
 '**Higher risk of serious etiologies:**
• **Ischemic colitis** — consider in any elderly patient with diarrhea + abdominal pain
• **C. difficile** — more common and more lethal in the elderly
• **Diverticulitis** — can present with diarrhea
• **Colonic malignancy** — occult in presentation
• **E. coli O157:H7** — more common in elderly

**Dehydration risks:** age-related disordered thirst mechanism, medications (diuretics), diabetes, limited fluid access (infirmity). Profound dehydration is common.

**IV rehydration caution:** cardiovascular disease and renal dysfunction may limit rapid large-volume fluid administration.

**Drug interactions with fluoroquinolones:**
• Increases theophylline and warfarin levels
• Can increase or decrease phenytoin levels
• Antacids reduce fluoroquinolone absorption

**Lower threshold for:** CT abdomen, admission, surgical consultation.

[Diarrhea Discharge Instructions](#/info/diarrhea-discharge)',
 '[1,2,7]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Higher suspicion for serious etiologies. Lower threshold for CT, admission, and surgical consult. Careful rehydration in those with cardiac/renal disease.', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 22)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('diarrhea-disposition', 'diarrhea', 'result', 5,
 'Disposition',
 '[Diarrhea Discharge Instructions](#/info/diarrhea-discharge)

**Discharge if:**
• Hemodynamically stable
• Benign abdominal examination
• Tolerating oral fluids without vomiting
• Adequate urine output
• Low risk for complications
• Reliable follow-up and understanding of return precautions

**Admit or observe if:**
• Failed ED rehydration or unable to tolerate oral fluids
• Severe or persistent dehydration
• Diagnostic dilemma (atypical presentation, unclear etiology)
• Extremes of age (very young, elderly) with comorbidities
• Immunocompromised
• Possible surgical etiology
• Significant electrolyte derangement

**Chronic diarrhea (>30 days):** usually exceeds ED scope. Exclude serious illness, ensure stability, begin infectious workup, refer to gastroenterology.

**Before discharge:** Reassess vitals, repeat abdominal exam, confirm oral tolerance, provide written discharge instructions.',
 '[1,2]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Discharge stable patients who tolerate oral fluids with clear return precautions. Admit those failing ED treatment, immunocompromised, or with diagnostic uncertainty.', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 23)
;


-- 5. drugs (6 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('ondansetron', 'Ondansetron (Zofran)', 'Ondansetron hydrochloride', '5-HT3 receptor antagonist / Antiemetic', 'IV/PO (ODT)',
 '["Nausea and vomiting of pregnancy (NVP)","Hyperemesis gravidarum","Postoperative nausea/vomiting","Acute diarrhea with nausea/vomiting","Pediatric gastroenteritis (facilitates oral rehydration)"]'::jsonb,
 '[{"indication":"NVP / Hyperemesis — IV","regimen":"4-8 mg IV over 15 min every 12 hours. Effective for all severities. Reserve as second-line IV agent — exhaust metoclopramide first given possible small risk of fetal cardiac abnormalities."},{"indication":"NVP — oral","regimen":"4-8 mg PO every 8-12 hours as needed. Consider only after pyridoxine/doxylamine and other agents have been tried."},{"indication":"Acute diarrhea","regimen":"4 mg IV or 4 mg ODT (orally disintegrating tablet) every 4-6 hours PRN. Max 16 mg per day."},{"indication":"Pediatric diarrhea","regimen":"0.15 mg/kg IV or ODT. Max 4 mg/dose. Single dose often sufficient to facilitate oral rehydration.","weightCalc":{"dosePerKg":0.15,"unit":"mg","maxDose":4}}]'::jsonb,
 '["Known hypersensitivity","Congenital long QT syndrome","Concurrent use of apomorphine"]'::jsonb,
 '["Possible small increased risk of fetal cardiac abnormalities (cleft palate, cardiac septal defects) — 2016 systematic review","QT prolongation — avoid in patients with baseline prolongation or electrolyte abnormalities","Serotonin syndrome risk when combined with serotonergic agents","May mask progressive ileus — monitor for abdominal distension","Use lowest effective dose in hepatic impairment (max 8 mg/day)","Constipation (common side effect)","Headache"]'::jsonb,
 'Symptom improvement. ECG if concurrent QT-prolonging medications or QT prolongation risk factors. Consider baseline ECG in patients with cardiac history.',
 'Highly effective antiemetic but ACOG recommends exhausting other options first in pregnancy due to a possible small risk of fetal cardiac abnormalities. Key role in pediatric gastroenteritis: a single dose significantly reduces vomiting and facilitates oral rehydration, decreasing the need for IV fluids and hospital admission. In adults with diarrheal illness, useful when vomiting prevents adequate oral fluid intake.',
 NULL,
 '["ACOG Practice Bulletin No. 189: Nausea and Vomiting of Pregnancy. Obstet Gynecol. 2018;131(1):e15-e30.","Danielsson B, Noor AH, Hoog A, et al. Association of ondansetron use in early pregnancy with congenital malformations. JAMA. 2018;320(23):2429-2437.","Freedman SB, et al. Oral Ondansetron for Gastroenteritis in a Pediatric Emergency Department. N Engl J Med. 2006;354(16):1698-1705.","Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('loperamide', 'Loperamide (Imodium)', 'Loperamide hydrochloride', 'Opioid receptor agonist (peripheral)', 'PO',
 '["Acute diarrhea (symptomatic relief)","Traveler''s diarrhea (adjunct)","Diarrhea in pregnancy"]'::jsonb,
 '[{"indication":"Acute diarrhea","regimen":"4 mg PO initially, then 2 mg after each loose stool. Max 16 mg per day."},{"indication":"Traveler diarrhea","regimen":"4 mg PO initially, then 2 mg after each loose stool. Max 16 mg per day. Use as adjunct with antibiotics — combination reduces duration by 1 additional day."},{"indication":"Pregnancy","regimen":"4 mg PO initially, then 2 mg after each loose stool. Max 16 mg per day. FDA Category B — safest antimotility option in pregnancy."}]'::jsonb,
 '["Bloody diarrhea or dysentery","Suspected Shiga toxin-producing E. coli (STEC) — increases HUS risk","High fever (>38.5°C) with suspected invasive bacterial pathogen","Children under 2 years"]'::jsonb,
 '["Avoid in immunocompromised patients with suspected infectious diarrhea","Avoid with suspected inflammatory diarrhea (positive fecal leukocytes)","Risk of toxic megacolon with C. difficile or IBD","Not recommended in children for acute gastroenteritis","Overdose can cause cardiac arrhythmias — do not exceed recommended dose"]'::jsonb,
 'Clinical response. Discontinue if symptoms worsen, fever develops, or abdominal distension occurs.',
 'Preferred antimotility agent — slows intraluminal flow by inhibiting peristalsis, increasing intestinal absorption of fluid and electrolytes. Peripheral opioid that does NOT penetrate the CNS: no central side effects or addiction potential. When combined with antibiotics in traveler''s diarrhea, reduces illness duration by 1 additional day.',
 NULL,
 '["Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24.","Riddle MS, et al. ACG Clinical Guideline: Diagnosis, Treatment, and Prevention of Acute Diarrheal Infections in Adults. Am J Gastroenterol. 2016;111(5):602-622."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('bismuth-subsalicylate', 'Bismuth Subsalicylate (Pepto-Bismol)', 'Bismuth subsalicylate', 'Antisecretory / antimicrobial', 'PO',
 '["Acute diarrhea (symptomatic relief)","Traveler''s diarrhea (treatment and prevention)","Nausea/dyspepsia with diarrhea"]'::jsonb,
 '[{"indication":"Acute diarrhea","regimen":"524 mg (2 tablets or 30 mL) PO every 30-60 minutes PRN. Max 8 doses per day (4.2 g/day)."},{"indication":"Traveler diarrhea","regimen":"524 mg PO every 30-60 minutes PRN. Max 8 doses per day. For prevention: 524 mg QID during travel."}]'::jsonb,
 '["Aspirin/salicylate allergy","Children or teenagers recovering from chickenpox or flu (Reye syndrome risk)","Concurrent anticoagulant therapy (contains salicylate)"]'::jsonb,
 '["Contains salicylate — avoid in pregnancy","May cause black tongue and black stools (benign)","Avoid in patients taking aspirin or other salicylates (additive toxicity)","Not recommended for children under 12"]'::jsonb,
 'Salicylate levels if overdose suspected. Inform patients that black stools are expected and benign.',
 'Anti-diarrheal effects via antisecretory mechanism, bacterial toxin binding, and inherent antimicrobial activity. Also alleviates nausea/vomiting by topical effect on gastric mucosa — preferred when nausea is a prominent complaint. In prevention trials, reduced traveler''s diarrhea from 61% to 23%.',
 NULL,
 '["DuPont HL, et al. Prevention of Traveler''s Diarrhea: Prophylactic Administration of Subsalicylate Bismuth. JAMA. 1980;243(3):237-241.","Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('metronidazole', 'Metronidazole (Flagyl)', 'Metronidazole', 'Nitroimidazole antibiotic / antiprotozoal', 'PO/IV',
 '["C. difficile infection (alternative)","Persistent diarrhea (Giardia coverage)","Diarrhea in pregnancy (after first trimester)"]'::jsonb,
 '[{"indication":"C difficile","regimen":"Non-severe: 500 mg PO TID × 10-14 days. Alternative to vancomycin (vancomycin preferred per 2017 IDSA). Fulminant: 500 mg IV q8h (combined with PO/rectal vancomycin)."},{"indication":"Persistent diarrhea","regimen":"250 mg PO TID × 7-10 days. Empiric coverage for Giardia in diarrhea lasting 2-4 weeks without systemic symptoms or dysentery."},{"indication":"Pregnancy","regimen":"500 mg PO TID × 10 days. FDA Category B — use after first trimester when benefits outweigh risks. Coordinate with OB/GYN."}]'::jsonb,
 '["First trimester of pregnancy (relative)","Concurrent alcohol use — disulfiram-like reaction","Concurrent disulfiram use within past 2 weeks","Known hypersensitivity to nitroimidazoles"]'::jsonb,
 '["Disulfiram-like reaction with alcohol — strictly avoid alcohol during treatment and for 3 days after","Can cause nausea and vomiting — problematic in GI illness","Increases warfarin, phenytoin, and phenobarbital levels","Peripheral neuropathy with prolonged use","Metallic taste common"]'::jsonb,
 'CBC with prolonged use. LFTs if hepatic disease. INR if on warfarin. Monitor for peripheral neuropathy.',
 'Alternative to vancomycin for non-severe C. difficile infection. First-line empiric therapy for persistent diarrhea (2-4 weeks) targeting Giardia. For fulminant C. difficile, used IV in combination with oral/rectal vancomycin. No longer recommended as sole first-line for C. difficile per 2017 IDSA/SHEA guidelines.',
 NULL,
 '["McDonald LC, et al. Clinical Practice Guidelines for Clostridium difficile Infection in Adults and Children: 2017 Update by IDSA and SHEA. Clin Infect Dis. 2018;66(7):987-994.","Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('azithromycin', 'Azithromycin (Zithromax)', 'Azithromycin', 'Macrolide antibiotic', 'PO/IV',
 '["Traveler''s diarrhea (fluoroquinolone-resistant regions)","Acute infectious diarrhea"]'::jsonb,
 '[{"indication":"Traveler diarrhea","regimen":"1000 mg PO × 1 dose, or 500 mg PO daily × 3 days. Preferred for Southeast Asia travel (>80% fluoroquinolone-resistant Campylobacter)."},{"indication":"Pediatric diarrhea","regimen":"10 mg/kg PO daily × 3 days. Max 500 mg/dose.","weightCalc":{"dosePerKg":10,"unit":"mg","maxDose":500}}]'::jsonb,
 '["Known hypersensitivity to azithromycin or macrolides","History of cholestatic jaundice/hepatic dysfunction with prior azithromycin use"]'::jsonb,
 '["QT prolongation risk — avoid with other QT-prolonging agents","Hepatotoxicity — monitor for signs of liver injury"]'::jsonb,
 'QTc if concurrent QT-prolonging agents. LFTs if prolonged use or hepatic disease.',
 'First-line for traveler''s diarrhea from Southeast Asia due to high rates of fluoroquinolone-resistant Campylobacter (>80%). Also effective for Shigella and non-typhoidal Salmonella.',
 NULL,
 '["Riddle MS, et al. ACG Clinical Guideline: Diagnosis, Treatment, and Prevention of Acute Diarrheal Infections in Adults. Am J Gastroenterol. 2016;111(5):602-622.","CDC. Travelers'' Diarrhea. Yellow Book 2024."]'::jsonb,
 4)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('tmp-smx', 'TMP-SMX (Bactrim)', 'Trimethoprim-sulfamethoxazole', 'Sulfonamide antibiotic combination', 'PO',
 '["Acute infectious diarrhea (pediatric first-line)","Traveler''s diarrhea"]'::jsonb,
 '[{"indication":"Acute diarrhea","regimen":"Adult: 1 DS tablet (160/800 mg) PO BID × 3-5 days."},{"indication":"Traveler diarrhea","regimen":"Adult: 1 DS tablet (160/800 mg) PO BID × 3-5 days. Combination with loperamide is most efficacious regimen."},{"indication":"Pediatric diarrhea","regimen":"8 mg/kg/day (TMP component) divided BID × 3-5 days. Max 320 mg TMP per day.","weightCalc":{"dosePerKg":8,"unit":"mg TMP","maxDose":320,"dailyDivided":2}}]'::jsonb,
 '["Sulfonamide allergy","Pregnancy (especially first trimester and near term) — folate antagonism","Severe hepatic or renal insufficiency","Megaloblastic anemia due to folate deficiency","Infants under 2 months"]'::jsonb,
 '["Photosensitivity — advise sun protection","Can cause hyperkalemia — monitor potassium in renal impairment","Increases warfarin effect — monitor INR","Increases phenytoin levels","Stevens-Johnson syndrome risk (rare)","G6PD deficiency — risk of hemolytic anemia"]'::jsonb,
 'CBC, renal function, potassium. INR if on warfarin. Watch for rash (discontinue immediately).',
 'First-line empiric antibiotic for children with acute infectious diarrhea. In adults, used as alternative to fluoroquinolones. Only 71% susceptibility among E. coli isolates limits utility in some settings. Combination with loperamide is the most efficacious regimen for traveler''s diarrhea.',
 NULL,
 '["Ericsson CD, et al. Treatment of Traveler''s Diarrhea with Sulfamethoxazole and Trimethoprim and Loperamide. JAMA. 1990;263(2):257-261.","Shane AL, et al. 2017 IDSA Clinical Practice Guidelines for the Diagnosis and Management of Infectious Diarrhea. Clin Infect Dis. 2017;65(12):e45-e80."]'::jsonb,
 5)
;


-- 5b. drugs — UPDATE existing entries (2 drugs)
-- Updating Ciprofloxacin with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Pediatric UTI (IgE-mediated allergy to penicillins AND cephalosporins)","Complicated UTI","Acute infectious diarrhea (adults)","Traveler''s diarrhea (adults)"]'::jsonb,
  dosing = '[{"indication":"Pediatric UTI","regimen":"20 mg/kg/day divided BID. Max 750 mg/dose (oral).","weightCalc":{"dosePerKg":20,"unit":"mg","maxDose":750,"dailyDivided":2}},{"indication":"Acute diarrhea","regimen":"500 mg PO BID × 3-5 days. First-line empiric antibiotic for adults with fever >38.5°C + positive fecal markers, acute dysentery, or diarrhea >48 hours."},{"indication":"Traveler diarrhea","regimen":"500 mg PO BID × 3 days. First-line for most regions. For Southeast Asia: use azithromycin instead (>80% fluoroquinolone-resistant Campylobacter)."}]'::jsonb,
  contraindications = '["Concurrent tizanidine use","QT prolongation risk"]'::jsonb,
  cautions = '["FDA black box warnings (tendon rupture, peripheral neuropathy, CNS effects)","Generally avoided in children except when benefits outweigh risks","Musculoskeletal adverse events in pediatric patients"]'::jsonb,
  monitoring = 'Renal function, QTc if concurrent QT-prolonging agents. Monitor for tendon pain, neuropathy symptoms.',
  notes = 'Reserved for IgE-mediated allergy to penicillins AND cephalosporins in pediatric UTI. Use with caution in pediatric patients — FDA approval limited. TMP-SMX only 71% susceptible among E. coli isolates, making ciprofloxacin preferred fluoroquinolone alternative.',
  citations = '["Dell Children''s EBOC. First Febrile Urinary Tract Infection Clinical Pathway. May 2017.","Roberts KB. Urinary tract infection: clinical practice guideline for febrile infants and children 2 to 24 months. Pediatrics. 2011;128(3):595-610."]'::jsonb
WHERE id = 'ciprofloxacin';

-- Updating Vancomycin with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Meningitis (>28 days, added to Ceftriaxone for MRSA/resistant organism coverage)","C. difficile infection (first-line, ORAL)"]'::jsonb,
  dosing = '[{"indication":"Meningitic","regimen":"15 mg/kg IV q6h."},{"indication":"Non-meningitic","regimen":"15 mg/kg IV q8h."},{"indication":"C difficile","regimen":"Non-severe and severe: 125 mg PO QID × 10-14 days. Fulminant: 500 mg PO/NG QID + IV metronidazole 500 mg q8h ± rectal vancomycin enema. NOTE: This is ORAL vancomycin — not systemically absorbed."}]'::jsonb,
  contraindications = '["Known hypersensitivity to vancomycin"]'::jsonb,
  cautions = '["Red Man Syndrome — infuse over at least 1 hour","Nephrotoxicity — especially with concurrent aminoglycosides","Ototoxicity with prolonged use"]'::jsonb,
  monitoring = 'Obtain trough before 4th dose (goal trough 15-20 mcg/mL for meningitis). Renal function (BUN, creatinine). Drug levels needed if >2 doses anticipated.',
  notes = 'Added to Ceftriaxone for meningitis in infants >28 days to cover MRSA and resistant GBS/pneumococcus. Not needed in the 0-28 day empiric sepsis regimen (Ampicillin + Gentamicin or Ampicillin + Ceftriaxone provides adequate coverage).',
  citations = '["Tunkel AR, et al. Practice Guidelines for the Management of Bacterial Meningitis. Clin Infect Dis. 2004;39(9):1267-1284.","Red Book: 2021-2024 Report of the Committee on Infectious Diseases. American Academy of Pediatrics."]'::jsonb
WHERE id = 'vancomycin';


-- 6. info_pages (6 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-summary', 'Acute Diarrhea Steps Summary', 'Quick-reference checklist for ED evaluation of acute diarrhea',
 '[{"heading":"Initial Assessment","body":"• [Assess hemodynamic stability — ABCs if unstable](#/node/diarrhea-start)\n• [Resuscitate: 2 large-bore IVs, NS/LR 20 mL/kg, cardiac monitor](#/node/diarrhea-resuscitate)\n• [Targeted history: stool character, duration, travel, meds, contacts](#/node/diarrhea-history)"},{"heading":"Red Flag Evaluation","body":"• [Bloody diarrhea — stool culture, avoid antimotility, avoid abx if STEC](#/node/diarrhea-bloody)\n• [Febrile (>38.5°C) — fecal leukocytes/lactoferrin, stool culture](#/node/diarrhea-febrile)\n• [Severe dehydration — IV rehydration, monitor urine output](#/node/diarrhea-dehydration)\n• [Immunocompromised — broader workup, O&P, lower admission threshold](#/node/diarrhea-immunocompromised)\n• [Surgical concern — appendicitis, ischemic bowel, CT abdomen](#/node/diarrhea-surgical-ddx)"},{"heading":"Diagnostics & Treatment","body":"• [Selective lab testing — fecal markers, stool culture, C. diff toxin](#/node/diarrhea-labs)\n• [C. difficile — stop offending abx, oral vancomycin first-line](#/node/diarrhea-cdiff)\n• [Traveler''s diarrhea — fluoroquinolone or azithromycin ± loperamide](#/node/diarrhea-travelers)\n• [Mild/self-limited — ORS, loperamide, ondansetron PRN](#/node/diarrhea-mild)\n• [Empiric antibiotics — ciprofloxacin (adults), TMP-SMX (children)](#/node/diarrhea-empiric-abx)"},{"heading":"Special Populations & Disposition","body":"• [Pregnant — loperamide safest, avoid fluoroquinolones](#/node/diarrhea-pregnant)\n• [Pediatric — ORS, ondansetron, no antimotility, watch for HUS](#/node/diarrhea-pediatric)\n• [Elderly — higher risk etiologies, drug interactions, lower admit threshold](#/node/diarrhea-elderly)\n• [Disposition — discharge criteria, admit criteria, follow-up](#/node/diarrhea-disposition)"}]'::jsonb,
 '[{"num":1,"text":"Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-discharge', 'Diarrhea Discharge Instructions', 'Patient information for managing diarrhea at home',
 '[{"heading":"Return to the ED Immediately If","body":"• You are very thirsty, weak, dizzy, or feel faint\n• You have a fever over 101.5°F (38.6°C)\n• You have blood, pus, or mucus in your stool\n• You have black or wine-colored stool\n• You have severe pain in your stomach or abdomen\n• You are vomiting and cannot eat or drink for more than 24 hours\n• Your diarrhea lasts more than 7 days\n• You are not getting better or you are getting worse\n• Your skin is dry, loose, or you feel confused"},{"heading":"How to Stay Hydrated (Adults)","body":"**First 1-2 days:**\n• Drink lots of fluids — caffeine-free sodas, oral rehydration solutions (available at pharmacy), or flavored mineral water\n• Nibble on salted crackers or pretzels (your body needs the salt)\n• Drink orange juice or eat bananas for potassium\n• You are drinking enough if you are not thirsty and your urine is pale yellow\n\n**After the first 1-2 days:**\n• Try plain potatoes, noodles, rice, bread, and other bland foods\n• Return to your regular diet as your diarrhea improves\n\n**Avoid:**\n• Milk and dairy products for 2-3 days\n• Caffeine (tea, cola, coffee)\n• Alcohol\n• Fruit juices like prune, apple, or grape juice (these can worsen diarrhea)"},{"heading":"How to Stay Hydrated (Children)","body":"• Use an oral rehydration solution (such as Pedialyte) from the pharmacy or supermarket\n• Let your child eat a regular diet as soon as possible\n• If your child is vomiting, try very small, frequent sips of liquid until the vomiting stops\n\n**Do NOT:**\n• Do not use plain water or sports drinks to rehydrate your child — use oral rehydration solution instead\n• Do not withhold dairy products from your child\n• Do not give fruit juices (prune, apple, grape) — these can worsen diarrhea"},{"heading":"Medications","body":"• Take all medications exactly as your doctor prescribed\n• Anti-diarrheal medicine (like Imodium) can help adults — take as directed\n• Do NOT use anti-diarrheal medicine if you have a high fever, bloody diarrhea, or if your doctor told you not to\n• Do NOT give anti-diarrheal medicine to children unless prescribed by a doctor"},{"heading":"Preventing Spread","body":"• Wash your hands thoroughly with soap and water after using the bathroom and before eating\n• Do not prepare food for others while you are sick\n• Clean and disinfect bathroom surfaces frequently\n• Do not return to work or school until you have been diarrhea-free for at least 24 hours\n• Keep sick children home from day care"},{"heading":"Follow-Up","body":"• See your own doctor in 2-3 days if you are not improving\n• See your doctor sooner if you are getting worse\n• If you were prescribed antibiotics, finish the entire course even if you feel better"}]'::jsonb,
 '[{"num":1,"text":"Burg MD, Hovanessian HC. Diarrhea: Identifying Serious Illness and Providing Relief. Emergency Medicine Practice. 2004;6(7):1-24."}]'::jsonb,
 true,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-ddx-pitfalls', 'Differential Diagnosis Pitfalls', 'Common diagnostic traps in diarrheal illness',
 '[{"heading":"Appendicitis Mimicking Gastroenteritis","body":"• Vomiting typically **follows** abdominal pain in appendicitis (precedes pain in gastroenteritis)\n• Appendicitis: 1-2 loose stools, NOT voluminous\n• 15% of appendices are in atypical locations\n• **27% of children** with appendicitis are initially misdiagnosed — diarrhea is a common confounding symptom [1]\n• 57% of children under 3 with appendicitis are initially misdiagnosed [1]\n• **Serial abdominal exams** are key — gastroenteritis improves with fluids, appendicitis does not\n• Gastroenteritis can cause higher fevers (>103°F) than appendicitis"},{"heading":"Ischemic Bowel Disease","body":"• Consider in adults **>50 years** or with peripheral vascular disease\n• Severe pain **out of proportion** to physical findings — classic presentation\n• Voluminous diarrhea (small bowel ischemia) or bloody diarrhea (ischemic colitis)\n• Occult blood in up to 75% of patients\n• Risk factors: arrhythmias, CHF, hypovolemia, sepsis, vasoconstrictors (digitalis, pseudoephedrine, cocaine, amphetamines) [2]\n• May progress to **infarction** unless detected early"},{"heading":"Medication-Induced Diarrhea","body":"• **Antibiotics** — especially C. difficile risk within past 3 months\n• **Magnesium/calcium antacids**\n• **Colchicine**\n• **Alpha-glucosidase inhibitors** (acarbose, miglitol) — abdominal pain, bloating, diarrhea\n• **Sorbitol/mannitol** (artificial sweeteners) — osmotic diarrhea\n• **Laxative abuse** — consider in patients with eating disorders or weight loss attempts\n• **Enteral tube feedings**\n• Herbal preparations may also cause diarrhea"},{"heading":"Melena Misidentified as Diarrhea","body":"• Melanotic stools are usually liquid — patients may describe as \"diarrhea\"\n• Always ask specifically about **black or tarry stools**\n• Rectal exam can determine stool characteristics\n• GI bleed requires completely different management — see GI Bleeding consult"},{"heading":"Other Diagnostic Traps","body":"• **Fecal impaction** — chronic constipation followed by watery diarrhea (overflow)\n• **IBD first presentation** — chronic/recurrent bloody diarrhea, family history, young patient\n• **Hyperthyroidism** — diarrhea as part of thyrotoxicosis\n• **Intussusception** (pediatric) — currant jelly stool, episodic crying\n• **DKA, pneumonia** — extra-abdominal conditions that can present with abdominal complaints"}]'::jsonb,
 '[{"num":1,"text":"Rothrock SG, et al. Clinical Features of Misdiagnosed Appendicitis in Children. Ann Emerg Med. 1991;20(1):45-50."},{"num":2,"text":"Burns BJ, Brandt LJ. Intestinal Ischemia. Gastroenterol Clin North Am. 2003;32(4):1127-1143."}]'::jsonb,
 false,
 2)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-abx-criteria', 'Empiric Antibiotic Criteria', 'When to start antibiotics for acute diarrhea',
 '[{"heading":"When to Give Empiric Antibiotics","body":"**1. Fever >38.5°C (101.3°F)** PLUS one of:\n• Guaiac-positive stools\n• Fecal leukocytes or fecal lactoferrin positive\n\n**2. Acute dysentery** (bloody diarrhea with fever and cramping)\n\n**3. Moderate-to-severe traveler''s diarrhea**\n\n**4. Diarrhea lasting >48 hours** (higher probability of non-viral cause)\n\n**5. Nosocomial diarrhea** with suspected C. difficile — stop offending antibiotic, start metronidazole or vancomycin"},{"heading":"When NOT to Give Antibiotics","body":"• **Suspected STEC (E. coli O157:H7)** — antibiotics increase HUS risk. Suspect if: bloody diarrhea + afebrile + exposure to undercooked beef or unpasteurized products\n• **Vomiting as prominent symptom** — viral etiology more likely, antibiotics will have low yield\n• **Mild, self-limited diarrhea** in healthy patient\n• **Salmonellosis** (non-typhoidal) — antibiotics can prolong carrier state and increase relapse rate"},{"heading":"Drug Selection","body":"","drugTable":[{"drug":"Ciprofloxacin 500 mg PO BID × 3-5d","regimen":"Adults — first-line for most community-acquired and traveler''s diarrhea"},{"drug":"Azithromycin 1g PO ×1 or 500 mg daily ×3d","regimen":"SE Asia travel (fluoroquinolone-resistant Campylobacter >80%)"},{"drug":"TMP-SMX (Bactrim DS) BID × 3-5d","regimen":"Children — first-line empiric therapy"},{"drug":"Metronidazole 250 mg PO TID × 7-10d","regimen":"Persistent diarrhea 2-4 weeks (covers Giardia)"},{"drug":"Vancomycin 125 mg PO QID × 10-14d","regimen":"C. difficile — first-line (preferred over metronidazole)"},{"drug":"Metronidazole 500 mg PO TID × 10-14d","regimen":"C. difficile — alternative for non-severe cases"}]},{"heading":"Patient Expectations","body":"Antibiotics shorten illness duration by **1-2 days** when effective. This benefit must be weighed against drug side effects, expense, and antibiotic resistance concerns.\n\nStudies show that patient satisfaction with diarrheal illness care correlates **poorly** with receiving antibiotics — physicians are not adept at identifying which patients expect them [1]."}]'::jsonb,
 '[{"num":1,"text":"Karras DJ, et al. Antibiotic Use for ED Patients with Acute Diarrhea: Prescribing Practices, Patient Expectations, and Patient Satisfaction. Ann Emerg Med. 2003;42(6):835-842."},{"num":2,"text":"Shane AL, et al. 2017 IDSA Clinical Practice Guidelines for the Diagnosis and Management of Infectious Diarrhea. Clin Infect Dis. 2017;65(12):e45-e80."}]'::jsonb,
 false,
 3)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-antimotility-ci', 'Antimotility Agent Contraindications', 'When to avoid loperamide, diphenoxylate, and similar agents',
 '[{"heading":"Avoid Antimotility Agents When","body":"• **High fever** (>38.5°C / 101.3°F)\n• **Bloody diarrhea** or suspected dysentery\n• **Suspected inflammatory diarrhea** (positive fecal leukocytes/lactoferrin)\n• **Suspected Shiga toxin-producing E. coli (STEC/EHEC)** — can worsen HUS\n• **Sepsis** or severe systemic illness\n• **Immunocompromised patients**\n• **Pediatric patients** — not recommended for children with acute gastroenteritis"},{"heading":"Why Avoid?","body":"• **Delayed clearance** of enteric pathogens\n• **Prolonged fever** in invasive bacterial diarrhea\n• **Toxic megacolon** risk — especially with C. difficile and inflammatory bowel disease\n• **Increased HUS risk** with STEC infection\n\nSome authorities argue antimotility agents may be used in **non-dysenteric** forms of diarrhea caused by enteroinvasive pathogens **as long as antibiotics are also prescribed** — but this remains controversial."},{"heading":"Safe Use","body":"• **Afebrile patients** with non-bloody, non-inflammatory diarrhea\n• **Chronic diarrhea** associated with inflammatory bowel disease (with appropriate IBD treatment)\n• **Traveler''s diarrhea** — loperamide as adjunct WITH antibiotics reduces duration by 1 additional day\n• **Preferred agent:** Loperamide (Imodium) — peripheral opioid, no CNS effects, not habit-forming\n• **Alternative:** Bismuth subsalicylate (Pepto-Bismol) — also has antimicrobial and antiemetic properties"}]'::jsonb,
 '[{"num":1,"text":"Thielman NM, Guerrant RL. Acute Infectious Diarrhea. N Engl J Med. 2004;350(1):38-47."},{"num":2,"text":"Gore JI, Surawicz C. Severe Acute Diarrhea. Gastroenterol Clin North Am. 2003;32(4):1249-1267."}]'::jsonb,
 false,
 4)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('diarrhea-dehydration-assessment', 'Dehydration Assessment Guide', 'Clinical assessment of volume status in diarrheal illness',
 '[{"heading":"Adult Assessment","body":"**Most reliable findings:**\n• **Dry axilla** — supports hypovolemia diagnosis\n• **Moist mucous membranes + tongue without furrows** — argues against hypovolemia\n\n**Unreliable in adults:**\n• Capillary refill time — no proven diagnostic value\n• Skin turgor — no proven diagnostic value\n\n**Other indicators:**\n• Orthostatic vital signs (SBP drop >20 or HR rise >20)\n• Urine output and color\n• BUN/Creatinine ratio >20:1 suggests dehydration\n• Thirst, dizziness, syncope"},{"heading":"Pediatric Assessment","body":"**Gold standard:** Acute body weight change (compare to recent known weight)\n\n**Next best measures:**\n• Mucous membrane hydration\n• Capillary refill time (>2 seconds)\n• Absence of tears when crying\n• Altered mental status (lethargy, irritability)\n\n**Also assess:**\n• Sunken anterior fontanelle (infants)\n• Sunken eyes\n• Skin turgor (tenting)\n• Urine output (fewer wet diapers)\n\n**Severity:**\n• **Mild (3-5%):** slightly dry mucous membranes, mildly decreased urine\n• **Moderate (6-9%):** dry mucous membranes, decreased tears, tachycardia, oliguria\n• **Severe (≥10%):** absent tears, sunken eyes, very delayed capillary refill, altered mental status, anuria"},{"heading":"Oral Rehydration Solutions","body":"**WHO ORS composition:**\n• Sodium 75 mmol/L\n• Potassium 20 mmol/L\n• Glucose 75 mmol/L\n• Total osmolarity 245 mOsm/L\n\n**Commercial options:** Pedialyte, Lytren, Rehydrolyte\n\n**Sports drinks** (Gatorade, etc.) have inadequate sodium for diarrheal losses. Can supplement with salted crackers or pretzels.\n\n**Plain water** is NOT appropriate for rehydration in children — risk of hyponatremia.\n\n**IV rehydration:** NS or LR 20 mL/kg bolus, repeat as needed. Consider in moderate-severe dehydration or when vomiting prevents oral intake."}]'::jsonb,
 '[{"num":1,"text":"McGee S, Abernethy WB, Simel DL. Is This Patient Hypovolemic? JAMA. 1999;281(11):1022-1029."},{"num":2,"text":"Cincinnati Children''s Hospital Medical Center. Evidence Based Clinical Practice Guideline for Children with Acute Gastroenteritis (AGE). 2001."}]'::jsonb,
 false,
 5)
;

COMMIT;
