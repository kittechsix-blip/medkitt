-- =====================================================================
-- MedKitt — Acute Meningitis/Encephalitis Consult: Supabase INSERT Statements
-- Generated: 2026-03-11
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'meningitis',
  'Acute Meningitis/Encephalitis',
  'Recognition → Workup → Empiric Treatment → CSF & Tailored Therapy → Disposition',
  '1.0',
  28,
  'mening-start',
  '["Recognition","Workup","Empiric Treatment","CSF & Tailored Therapy","Disposition"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('infectious-disease', 'meningitis', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (25 citations)
DELETE FROM tree_citations WHERE tree_id = 'meningitis';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('meningitis', 1, 'van de Beek D, Cabellos C, Dzupova O, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62.'),
('meningitis', 2, 'Brouwer MC, van de Beek D. Epidemiology of community-acquired bacterial meningitis. Curr Opin Infect Dis. 2018;31(1):78-84.'),
('meningitis', 3, 'Durand ML, Calderwood SB, Weber DJ, et al. Acute bacterial meningitis in adults. A review of 493 episodes. N Engl J Med. 1993;328(1):21-28.'),
('meningitis', 4, 'Bijlsma MW, Brouwer MC, Kasanmoentalib ES, et al. Community-acquired bacterial meningitis in adults in the Netherlands, 2006-14: a prospective cohort study. Lancet Infect Dis. 2016;16(3):339-347.'),
('meningitis', 5, 'van de Beek D, de Gans J, Spanjaard L, et al. Clinical features and prognostic factors in adults with bacterial meningitis. N Engl J Med. 2004;351(18):1849-1859.'),
('meningitis', 6, 'Wright WF, Pinto CN, Palisoc K, et al. Viral (aseptic) meningitis: a review. J Neurol Sci. 2019;398:176-183.'),
('meningitis', 7, 'Whitley RJ, Alford CA, Hirsch MS, et al. Vidarabine versus acyclovir therapy in herpes simplex encephalitis. N Engl J Med. 1986;314(3):144-149.'),
('meningitis', 8, 'Venkatesan A, Tunkel AR, Bloch KC, et al. Case definitions, diagnostic algorithms, and priorities in encephalitis: consensus statement of the International Encephalitis Consortium. Clin Infect Dis. 2013;57(8):1114-1128.'),
('meningitis', 9, 'Attia J, Hatala R, Cook DJ, et al. The rational clinical examination. Does this adult patient have acute meningitis? JAMA. 1999;282(2):175-181.'),
('meningitis', 10, 'Julián-Jiménez A, Morales-Casado MI. Usefulness of blood and cerebrospinal fluid laboratory testing to predict bacterial meningitis in the emergency department. Neurologia (Engl Ed). 2019;34(2):105-113.'),
('meningitis', 11, 'Sakushima K, Hayashino Y, Kawaguchi T, et al. Diagnostic accuracy of cerebrospinal fluid lactate for differentiating bacterial meningitis from aseptic meningitis: a meta-analysis. J Infect. 2011;62(4):255-262.'),
('meningitis', 12, 'McGill F, Heyderman RS, Michael BD, et al. The UK joint specialist societies guideline on the diagnosis and management of acute meningitis and meningococcal sepsis in immunocompetent adults. J Infect. 2016;72(4):405-438.'),
('meningitis', 13, 'Nakao JH, Jafri FN, Shah K, et al. Jolt accentuation of headache and other clinical signs: poor predictors of meningitis in adults. Am J Emerg Med. 2014;32(1):24-28.'),
('meningitis', 14, 'Costerus JM, Brouwer MC, Bijlsma MW, et al. Community-acquired bacterial meningitis. Curr Opin Infect Dis. 2017;30(1):135-141.'),
('meningitis', 15, 'George BP, Schneider EB, Venkatesan A. Encephalitis hospitalization rates and inpatient mortality in the United States, 2000-2010. PLoS One. 2014;9(9):e104169.'),
('meningitis', 16, 'Vikse J, Henry BM, Roy J, et al. The role of serum procalcitonin in the diagnosis of bacterial meningitis in adults: a systematic review and meta-analysis. Int J Infect Dis. 2015;38:68-76.'),
('meningitis', 17, 'Temfack E, Rim JJB, Spijker R, et al. Cryptococcal antigen in serum and cerebrospinal fluid for detecting cryptococcal meningitis in adults living with HIV: systematic review and meta-analysis. Clin Infect Dis. 2021;72(7):1268-1278.'),
('meningitis', 18, 'Costerus JM, Brouwer MC, Sprengers MES, et al. Cranial computed tomography, lumbar puncture, and clinical deterioration in bacterial meningitis: a nationwide cohort study. Clin Infect Dis. 2018;67(6):920-926.'),
('meningitis', 19, 'Aronin SI, Peduzzi P, Quagliarello VJ. Community-acquired bacterial meningitis: risk stratification for adverse clinical outcome and effect of antibiotic timing. Ann Intern Med. 1998;129(11):862-869.'),
('meningitis', 20, 'Proulx N, Fréchette D, Toye B, et al. Delays in the administration of antibiotics are associated with mortality from adult acute bacterial meningitis. QJM. 2005;98(4):291-298.'),
('meningitis', 21, 'Brouwer MC, McIntyre P, Prasad K, et al. Corticosteroids for acute bacterial meningitis. Cochrane Database Syst Rev. 2015(9):CD004405.'),
('meningitis', 22, 'Tenforde MW, Shapiro AE, Rouse B, et al. Treatment for HIV-associated cryptococcal meningitis. Cochrane Database Syst Rev. 2018;7:CD005647.'),
('meningitis', 23, 'Nigrovic LE, Kuppermann N, Macias CG, et al. Clinical prediction rule for identifying children with cerebrospinal fluid pleocytosis at very low risk of bacterial meningitis. JAMA. 2007;297(1):52-60.'),
('meningitis', 24, 'Hasbun R. Update and advances in community acquired bacterial meningitis. Curr Opin Infect Dis. 2019;32(3):233-238.'),
('meningitis', 25, 'Bardak-Ozcem S, Sipahi OR. An updated approach to healthcare-associated meningitis. Expert Rev Anti Infect Ther. 2014;12(3):333-342.');

DELETE FROM decision_nodes WHERE tree_id = 'meningitis';

-- 4. decision_nodes (28 nodes)

-- MODULE 1: RECOGNITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-start', 'meningitis', 'info', 1,
 'Acute Meningitis & Encephalitis',
 '[Meningitis/Encephalitis Steps Summary](#/info/mening-steps-summary) — quick reference.

Infectious meningitis and encephalitis are life-threatening conditions requiring **time-critical empiric treatment**. Untreated bacterial meningitis approaches **100% mortality**; even with therapy, mortality is **14–25%**. [1,3,5]

Herpes simplex encephalitis mortality was **70%** prior to antiviral therapy; now **~9%** with treatment. [7]

• **Meningitis** = inflammation of meninges and subarachnoid space
• **Encephalitis** = inflammation of brain parenchyma itself
• Focal neurological deficits indicate brain tissue involvement (encephalitis) [8]

**Key principle:** Empiric antimicrobials must be given **within 1 hour** of suspicion — do NOT delay for imaging or LP. [1,19]',
 '[1,3,5,7,8,19]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-clinical', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 0)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-clinical', 'meningitis', 'info', 1,
 'Clinical Suspicion',
 'The classic triad of **fever, neck stiffness, and altered mental status** is present in only **44–66%** of bacterial meningitis cases. [3,5]

However, when **headache** is added as a 4th symptom:
• At least **2 of 4** symptoms are present in **95%** of cases [5]
• At least **1 of 4** is present in **99–100%** of cases [5]

**Stated differently:** Absence of ALL 4 symptoms (headache, fever, neck stiffness, altered mental status) effectively **rules out** meningitis/encephalitis. [9]

**Individual symptom frequencies in ABM:**
• Headache: 84–87%
• Fever: 78%
• Neck stiffness: 73–83%
• Altered mental status (GCS <14): 79–80% [5]

**Risk factors to elicit:** Immunocompromise (HIV, transplant, immunosuppressants), recent neurosurgery, CSF leaks, basilar skull fracture, recent otitis/sinusitis, herpes history, travel/geographic exposure, animal/insect contact, vaccination status. [9,22,25]',
 '[3,5,9,22,25]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-exam', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 1)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-exam', 'meningitis', 'info', 1,
 'Physical Examination',
 '**Kernig and Brudzinski signs:**
• Sensitivity: only **2%** (essentially useless for ruling out) [13]
• Specificity: **97–98%** (useful when positive, but rarely positive) [13]

**Jolt accentuation of headache:**
• Originally reported sensitivity 65–97%, but subsequent studies show only **21% sensitivity**, 82% specificity [13]
• Inadequate to confirm or refute diagnosis

**Key exam findings suggesting specific etiologies:**
• Petechial rash (palms/soles) → *N. meningitidis* (also other bacterial causes) [9]
• Dermatomal vesicular rash → VZV meningitis/encephalitis [6]
• Swollen parotid glands (unvaccinated) → mumps [6]

**Findings suggesting encephalitis (brain parenchyma involvement):**
• Motor weakness / hemiparesis
• Aphasia
• Personality changes, hallucinations, psychosis
• Dysautonomia
• Seizures [8]',
 '[6,8,9,13]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-focal-deficits', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 2)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-focal-deficits', 'meningitis', 'question', 1,
 'Focal Neurological Deficits?',
 'Focal deficits (hemiparesis, aphasia, personality changes, seizures) indicate **brain parenchyma involvement** and the presence of **encephalitis** rather than isolated meningitis. [8]

This distinction guides both the diagnostic workup (MRI utility) and empiric treatment (acyclovir).',
 '[8]'::jsonb, '[{"label":"Yes — encephalitis features","description":"Focal deficits, seizures, personality changes, or neuropsychiatric symptoms","next":"mening-encephalitis-pathway","urgency":"critical"},{"label":"No focal deficits","description":"Meningeal signs without focal neurological findings","next":"mening-ct-decision"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 3)
;


-- MODULE 2: WORKUP
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-encephalitis-pathway', 'meningitis', 'info', 2,
 'Encephalitis Suspected',
 '**Immediately start empiric treatment:**
• [Acyclovir](#/drug/acyclovir/encephalitis) 10 mg/kg IV q8h (HSV-1 most common endemic cause) [7]
• PLUS empiric bacterial meningitis coverage (see next steps) [1]

**CT is indicated** in all patients with focal deficits (mass lesion must be excluded before LP). [12,18]

**MRI** is superior to CT for detecting encephalitis and can distinguish subtypes (e.g., HSV → temporal lobe involvement), but should not delay treatment. [8]

Herpes simplex encephalitis mortality: **70% untreated → 9% with acyclovir**. [7,15]',
 '[1,7,8,12,15,18]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-abx-then-ct', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 4)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-ct-decision', 'meningitis', 'question', 2,
 'CT Before Lumbar Puncture?',
 '[CT Before LP Criteria](#/info/mening-ct-criteria) — international guideline comparison.

CT is NOT needed before LP in most patients. CT is insensitive for meningitis/encephalitis. [12]

Herniation after LP is rare: only **0.1%** deteriorated within 1 hour, and **91%** who deteriorated had a prior normal CT. [18]

**CT IS indicated before LP if ANY of the following:** [12,15]',
 '[12,15,18]'::jsonb, '[{"label":"CT indicated","description":"GCS ≤12, papilledema, uncontrolled seizures, new focal deficits, severely immunocompromised with new seizures","next":"mening-abx-then-ct","urgency":"urgent"},{"label":"No CT indications","description":"Alert patient, no focal deficits, no papilledema, no uncontrolled seizures","next":"mening-lp-direct"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 5)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-abx-then-ct', 'meningitis', 'info', 2,
 'Start Antibiotics → CT → LP',
 '**CRITICAL:** Start empiric antibiotics and [Dexamethasone](#/drug/dexamethasone/meningitis) BEFORE CT imaging. Do NOT delay treatment for any diagnostic test. [1,19,20]

Delayed antibiotics correlate with disease progression and **increased mortality**. [19,20]

After CT:
• If no mass lesion or contraindication → proceed to LP
• If mass lesion found → neurosurgical consultation; continue empiric treatment

**Blood cultures** should be drawn before antibiotics when possible (66% yield in ABM). [5]',
 '[1,5,19,20]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-lp-technique', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 6)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-lp-direct', 'meningitis', 'info', 2,
 'Proceed to Lumbar Puncture',
 'No indications for CT before LP — proceed directly.

**Start empiric antibiotics within 1 hour** of suspicion, ideally immediately after LP. [1]

If LP will be delayed for any reason, start antibiotics **first** — never wait. Antibiotics before LP reduce culture sensitivity but PCR remains reliable for days. [11,12]

**Blood cultures** should be drawn before antibiotics (66% yield in ABM). [5]',
 '[1,5,11,12]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-lp-technique', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 7)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-lp-technique', 'meningitis', 'info', 2,
 'Lumbar Puncture & CSF Collection',
 '[CSF Interpretation Guide](#/info/mening-csf-guide) — reference for interpreting results.

**Position:** Lateral decubitus if opening pressure measurement desired.

**Collect 4 tubes (up to 15 mL safely):** [14,23]
• **Tube 1:** WBC and RBC count
• **Tube 2:** Protein, glucose, lactate, PCR
• **Tube 3:** Gram stain, cultures, antigen tests, additional PCR
• **Tube 4:** WBC and RBC count (compare to Tube 1 for traumatic tap)

**Larger volumes increase sensitivity** of diagnostic tests. CSF is produced at 22 mL/hr. [14]

**Traumatic tap?** Use the [CSF Traumatic Tap Correction](#/calculator/csf-correction) calculator to determine predicted WBC from RBC contamination.

**Opening pressure:**
• Normal: <20 cm H₂O
• Elevated in bacterial meningitis; >40 cm H₂O in 39% of ABM cases [5,14]',
 '[5,14,23]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-empiric-timing', NULL, NULL, NULL, '[]'::jsonb, '[{"id":"csf-correction","label":"CSF Traumatic Tap Correction"}]'::jsonb, 8)
;


-- MODULE 3: EMPIRIC TREATMENT
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-empiric-timing', 'meningitis', 'info', 3,
 'Time-Critical Empiric Treatment',
 '[Empiric Antimicrobial Table](#/info/mening-abx-table) — full regimens by risk category.

**Antibiotics within 1 HOUR of suspicion.** [1]

A retrospective study of 269 ABM episodes over 25 years demonstrated that delayed antibiotics correlated with **disease progression and increased mortality**. [19]

Another study of 119 ABM patients showed an **incremental association** between longer delays to antimicrobials and mortality. [20]

**For ALL suspected bacterial meningitis:**
• [Dexamethasone](#/drug/dexamethasone/meningitis) 0.15 mg/kg IV q6h × 2–4 days — give WITH or up to 15–20 min BEFORE first antibiotic dose [1,21]
• Add [Acyclovir](#/drug/acyclovir/encephalitis) 10 mg/kg IV q8h if ANY encephalitis features [7]',
 '[1,7,19,20,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-risk-stratify', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 9)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-risk-stratify', 'meningitis', 'question', 3,
 'Patient Risk Category',
 'Select based on age, immune status, and clinical context to determine empiric antimicrobial regimen. [1,24]',
 '[1,24]'::jsonb, '[{"label":"Immunocompetent adult <50y","description":"No immunocompromise, age <50, community-acquired","next":"mening-tx-standard"},{"label":"Age ≥50, pregnant, or immunocompromised","description":"Increased risk for Listeria monocytogenes","next":"mening-tx-expanded","urgency":"urgent"},{"label":"Post-neurosurgical / healthcare-associated","description":"Recent neurosurgery, shunts/drains, CSF leak, basilar skull fracture","next":"mening-tx-nosocomial","urgency":"urgent"},{"label":"HIV/AIDS with subacute presentation","description":"Weeks of evolving symptoms, suspected cryptococcal meningitis","next":"mening-tx-crypto","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 10)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-tx-standard', 'meningitis', 'info', 3,
 'Empiric: Immunocompetent <50y',
 '**Targets:** *S. pneumoniae* (most common), *N. meningitidis* [2]

**Regimen:**
• [Ceftriaxone](#/drug/ceftriaxone/adult meningitis) 2g IV q12h (higher dose for CNS penetration) [1,24]
• [Vancomycin](#/drug/vancomycin/meningitis) 15–20 mg/kg IV q8–12h (for cephalosporin-resistant pneumococci) [1,24]
• [Dexamethasone](#/drug/dexamethasone/meningitis) 0.15 mg/kg IV q6h × 2–4 days [1,21]

**Alternative:** [Meropenem](#/drug/meropenem/meningitis) 2g IV q8h if cephalosporin allergy or concern for multidrug-resistant organisms. [25]

**Add [Acyclovir](#/drug/acyclovir/encephalitis)** 10 mg/kg IV q8h if ANY encephalitis features. [7]',
 '[1,2,7,21,24,25]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-blood-tests', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 11)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-tx-expanded', 'meningitis', 'info', 3,
 'Empiric: Listeria Coverage',
 '**Age ≥50, pregnant, or immunocompromised** patients are at increased risk for *L. monocytogenes* meningitis (mortality **17–30%**). [1,24]

Pregnant women are **10–20× more likely** to contract listerial infections. Infection during pregnancy is often devastating for the fetus. [24]

**Regimen:**
• [Ceftriaxone](#/drug/ceftriaxone/adult meningitis) 2g IV q12h [1]
• [Vancomycin](#/drug/vancomycin/meningitis) 15–20 mg/kg IV q8–12h [1]
• [Ampicillin](#/drug/ampicillin/adult meningitis) 2g IV q4h (Listeria coverage) [1,24]
• [Dexamethasone](#/drug/dexamethasone/meningitis) 0.15 mg/kg IV q6h × 2–4 days [21]

**Note:** [Meropenem](#/drug/meropenem/meningitis) has activity against *L. monocytogenes* — if used, ampicillin may be omitted. [1]

**Add [Acyclovir](#/drug/acyclovir/encephalitis)** if encephalitis features present. [7]',
 '[1,7,21,24]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-blood-tests', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 12)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-tx-nosocomial', 'meningitis', 'info', 3,
 'Empiric: Healthcare-Associated',
 '**Risk factors:** Neurosurgical procedures, shunts/drains, CSF leaks, basilar skull fractures. [25]

**Common pathogens:** Gram-negative bacilli (*P. aeruginosa*, *A. baumannii*), gram-positive skin flora (*Staphylococcus* spp including MRSA). Mortality: **16–41%**. [25]

**Regimen:**
• [Vancomycin](#/drug/vancomycin/meningitis) 15–20 mg/kg IV q8–12h (MRSA coverage) [25]
• [Meropenem](#/drug/meropenem/meningitis) 2g IV q8h (broad gram-negative + Pseudomonas coverage) [25]
• OR [Cefepime](#/drug/cefepime/adult meningitis) 2g IV q8h as alternative to meropenem [25]

**CSF lactate** is particularly useful for diagnosis — postoperative inflammation alters conventional markers but does NOT affect lactate. [25]

Consider Infectious Disease consultation for second-/third-line agents (linezolid). [25]',
 '[25]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-blood-tests', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 13)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-tx-crypto', 'meningitis', 'info', 3,
 'Empiric: Suspected Cryptococcal',
 '**Cryptococcal meningitis** is the 2nd highest cause of mortality in HIV/AIDS patients. *C. neoformans* causes ~1 million cases/year in HIV/AIDS, with ~600,000 annual deaths. [17]

Typically subacute: weeks of evolving headache, neck stiffness, malaise.

**Serum cryptococcal antigen (CrAg):** 99.7% sensitive, 94.1% specific — send immediately. [17]

**Empiric antifungal regimen (after ID consultation):**
• [Amphotericin B liposomal](#/drug/amphotericin-b/cryptococcal meningitis) 3–4 mg/kg/day IV [22]
• [Flucytosine](#/drug/flucytosine/cryptococcal meningitis) 25 mg/kg PO q6h [22]
• Induction × 1 week, then [Fluconazole](#/drug/fluconazole/cryptococcal meningitis) 400–800 mg/day [22]

**ALSO give empiric bacterial coverage** (Ceftriaxone + Vancomycin + Ampicillin) until CSF results available. [1]

**⚠️ Do NOT give corticosteroids** — associated with worsened outcomes in cryptococcal meningitis. [1,21]',
 '[1,17,21,22]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-blood-tests', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 14)
;


-- MODULE 4: CSF & TAILORED THERAPY
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-blood-tests', 'meningitis', 'info', 4,
 'Adjunctive Blood & Serum Studies',
 'No blood test can substitute for CSF analysis. Useful adjuncts:

**Blood cultures:** Up to **66% yield** in ABM — collect before antibiotics. [5]

**Serum procalcitonin (PCT):** Most discriminating biomarker for bacterial vs viral meningitis. [10,16]
• PCT >0.25–0.5 ng/mL: **90–95% sensitivity, 98–100% specificity** for ABM [16]
• More sensitive than any CSF marker for this purpose
• Limited by availability in many EDs

**C-reactive protein (CRP):**
• CRP >37 mg/L: 85% sensitivity, 84% specificity for bacterial vs viral [10]
• Reduced utility in elderly/immunocompromised

**Serum cryptococcal antigen:** 99.7% sensitive for cryptococcal meningitis in immunocompromised patients. [17]

**CBC:** Average WBC 17,500 in ABM vs 11,096 in viral — poor discriminatory value. [10]',
 '[5,10,16,17]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-csf-pattern', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 15)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-csf-pattern', 'meningitis', 'question', 4,
 'CSF Results Pattern',
 '[CSF Interpretation Guide](#/info/mening-csf-guide) — detailed reference with normal values and patterns.

Compare CSF results to expected patterns. **Note:** 6% of culture-proven ABM cases lack elevated WBC, and 10% have lymphocyte-predominant differentials. Early bacterial meningitis may mimic viral patterns. [1,14]',
 '[1,14]'::jsonb, '[{"label":"Bacterial pattern","description":"WBC >100 (neutrophils), CSF:serum glucose <0.36, protein >135, lactate >35 mg/dL","next":"mening-bacterial-mgmt","urgency":"critical"},{"label":"Viral pattern","description":"WBC 5–1000 (lymphocytes), normal–mild glucose decrease, protein ~56 mg/dL","next":"mening-viral-branch"},{"label":"Fungal / subacute pattern","description":"Lymphocytes, very low glucose, immunocompromised, subacute course","next":"mening-fungal-mgmt","urgency":"urgent"},{"label":"Equivocal / borderline","description":"Results do not clearly fit one pattern, or early presentation","next":"mening-equivocal","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[{"id":"csf-correction","label":"CSF Traumatic Tap Correction"}]'::jsonb, 16)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-bacterial-mgmt', 'meningitis', 'info', 4,
 'Bacterial Meningitis — Tailored Management',
 '**Continue empiric antibiotics.** Await Gram stain, culture, and PCR for pathogen identification.

**CSF Gram stain:** 60–99% sensitivity, 97–100% specificity. Sensitivity reduced after antibiotics. Negative Gram stain does NOT exclude bacterial meningitis. [5,14]

**CSF culture:** Definitive diagnosis + antibiotic sensitivities. Sensitivity reduced **>30%** if LP performed >4 hours after antibiotics. *N. meningitidis* cultures may sterilize within 2 hours of antibiotics. [14]

**CSF PCR:** Detects bacterial DNA even days after antibiotics — 87–100% sensitivity, 98–100% specificity. [12]

**CSF lactate >35.1 mg/dL:** 93% sensitivity, 97% specificity for bacterial meningitis (when obtained before antibiotics). Particularly useful in healthcare-associated infections. [11]

[Corticosteroid Guide](#/info/mening-steroid-guide) — continue dexamethasone for pneumococcal meningitis; discontinue if *Listeria* or *Cryptococcus* identified. [21]',
 '[5,11,12,14,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-steroids', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 17)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-viral-branch', 'meningitis', 'question', 4,
 'Viral CSF Pattern — Assess for Encephalitis',
 'Viral meningitis is generally self-limited with lower morbidity than bacterial. However, viral **encephalitis** (especially HSV-1) has high mortality without treatment. [6,7]

**Most common causes:** Non-polio enteroviruses (23–61%), HSV-2, arthropod-borne viruses. [6]

Assess for encephalitis features:',
 '[6,7]'::jsonb, '[{"label":"Encephalitis features present","description":"Focal deficits, seizures, personality changes, neuropsychiatric symptoms","next":"mening-encephalitis-tx","urgency":"critical"},{"label":"Mild viral meningitis","description":"No focal deficits, symptoms controlled, nontoxic appearance","next":"mening-viral-mgmt"},{"label":"Severe symptoms despite viral pattern","description":"Viral CSF but significant systemic illness or diagnostic uncertainty","next":"mening-equivocal","urgency":"urgent"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 18)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-encephalitis-tx', 'meningitis', 'info', 4,
 'Viral Encephalitis Treatment',
 '**HSV-1 is the most common endemic cause** of viral encephalitis in the Western world. [7]

**[Acyclovir](#/drug/acyclovir/encephalitis) 10 mg/kg IV q8h** — continue for all suspected encephalitis. [7]
• In the landmark RCT (208 patients): acyclovir reduced mortality from **70% to 28%** [7]
• Contemporary mortality with acyclovir + ICU care: **~9%** [15]

**If HSV-1 PCR negative but high clinical suspicion:**
• Continue acyclovir — false-negative PCR is possible in the first **72 hours** [7]
• Repeat PCR at **3–7 days** [7]

**MRI findings:** Temporal lobe involvement is characteristic of HSV encephalitis. [8]

**VZV encephalitis:** More common in immunocompromised patients. Continue acyclovir if VZV identified. [6]

**⚠️ Corticosteroids** are NOT indicated for viral encephalitis (unlike bacterial meningitis). Consider if autoimmune encephalitis suspected (relapse weeks after initial infection — consult neurology). [1]',
 '[1,6,7,8,15]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-dispo', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 19)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-viral-mgmt', 'meningitis', 'info', 4,
 'Viral Meningitis Management',
 'Viral meningitis is generally **self-limited** with lower mortality and fewer long-term complications than bacterial causes. [6]

**Management:**
• Supportive care: IV fluids, antiemetics, analgesics
• No directed antiviral therapy has proven to affect outcomes for most viral causes [6]

**Important caveats:**
• Early bacterial meningitis may mimic viral patterns — 25% of *L. monocytogenes* cases have normal or near-normal CSF [1]
• If ANY diagnostic uncertainty, continue empiric antibiotics and admit [14]
• Patients with severe symptoms (refractory headache, persistent vomiting) may still require admission even with viral etiology

**Disposition:** Some low-risk patients may be appropriate for discharge. See disposition criteria. [23]',
 '[1,6,14,23]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-dispo', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 20)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-fungal-mgmt', 'meningitis', 'info', 4,
 'Fungal Meningitis Management',
 'Fungal meningitis is primarily a disease of **immunocompromised** populations. Most cases present **subacutely** with weeks of evolving symptoms. [8]

**Most common cause:** *Cryptococcus neoformans* (~1 million cases/year in HIV/AIDS). [17]

Other causes: *Histoplasma*, *Coccidioides*, *Candida* species.

**Treatment (requires ID consultation):**
• **Induction (1 week):** [Amphotericin B liposomal](#/drug/amphotericin-b/cryptococcal meningitis) 3–4 mg/kg/day IV + [Flucytosine](#/drug/flucytosine/cryptococcal meningitis) 25 mg/kg PO q6h [22]
• **Consolidation:** [Fluconazole](#/drug/fluconazole/cryptococcal meningitis) 400–800 mg/day PO [22]
• This regimen showed lowest mortality in a Cochrane review of 13 studies (2426 participants) [22]

**⚠️ Do NOT give corticosteroids** — dexamethasone is associated with **worsened outcomes** in cryptococcal and listerial meningitis. Discontinue immediately if either pathogen identified. [1,21]',
 '[1,8,17,21,22]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-dispo', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 21)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-equivocal', 'meningitis', 'info', 4,
 'Equivocal CSF Results',
 '**When in doubt, treat as bacterial meningitis.**

**Key pitfalls with equivocal CSF:**
• **6%** of culture-proven ABM cases have NO elevated WBC count [1,14]
• **10%** of ABM cases have lymphocyte-predominant (not neutrophil) differentials [1,14]
• **25%** of *L. monocytogenes* cases have normal or near-normal CSF findings [1]
• Early in disease course, bacterial patterns may be incomplete
• Prior antibiotic administration alters CSF findings

**Management:**
• Continue full empiric antibiotic regimen
• Continue [Dexamethasone](#/drug/dexamethasone/meningitis) pending pathogen identification [21]
• Admit for monitoring and repeat assessment
• Await cultures, PCR, and repeat CSF if needed

**CSF lactate >35.1 mg/dL** favors bacterial cause (93% sensitivity, 97% specificity pre-antibiotics). [11]
**Serum PCT >0.25–0.5 ng/mL** strongly favors bacterial etiology (90–95% sensitivity). [16]',
 '[1,11,14,16,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-steroids', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 22)
;


-- MODULE 5: DISPOSITION
INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-steroids', 'meningitis', 'info', 5,
 'Adjunctive Corticosteroids',
 '[Corticosteroid Guide](#/info/mening-steroid-guide) — detailed evidence and dosing.

**[Dexamethasone](#/drug/dexamethasone/meningitis) 0.15 mg/kg IV q6h × 2–4 days** [1,21]

Give WITH or up to **15–20 minutes BEFORE** first antibiotic dose. [1]

**Evidence (Cochrane 2015, 25 studies, 4121 patients):**
• Overall ABM: nonsignificant mortality reduction (17.8% vs 19.9%) [21]
• **Pneumococcal meningitis in high-income countries:** significant mortality reduction [21]
• **TB meningitis:** corticosteroids reduced mortality by ~25% at 18 months [21]

**⚠️ STOP corticosteroids if pathogen is NOT *S. pneumoniae* or *M. tuberculosis*:**
• *L. monocytogenes:* nonsignificant trend toward **worse outcomes** with corticosteroids [21]
• *C. neoformans:* corticosteroids associated with **worsened outcomes** [1]

[Postexposure Prophylaxis Guide](#/info/mening-pep-guide) — regimens for contacts of *N. meningitidis* and *H. influenzae*.',
 '[1,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, 'mening-dispo', NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 23)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-dispo', 'meningitis', 'question', 5,
 'Disposition',
 '[Disposition Criteria](#/info/mening-dispo-criteria) — discharge vs ward vs ICU criteria.

Most patients with meningitis and encephalitis will be admitted. Determine appropriate level of care: [1,23]',
 '[1,23]'::jsonb, '[{"label":"Discharge — low-risk viral meningitis","description":"Nontoxic, symptoms controlled, reliable follow-up, meets all discharge criteria","next":"mening-discharge"},{"label":"Medical ward admission","description":"Stable vitals, alert, continued IV antibiotics pending results","next":"mening-ward","urgency":"urgent"},{"label":"ICU admission","description":"GCS ≤8, hemodynamic instability, seizures, severe encephalitis","next":"mening-icu","urgency":"critical"}]'::jsonb, '[]'::jsonb, NULL, NULL, NULL, NULL, '[]'::jsonb, '[]'::jsonb, 24)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-discharge', 'meningitis', 'result', 5,
 'Discharge — Low-Risk Viral Meningitis',
 '**Discharge criteria (extrapolated from pediatric data, use clinical judgment):** [23]
• Nontoxic clinical appearance
• Normal serum WBC count
• Mild CSF pleocytosis only
• Negative CSF Gram stain
• Adequate symptom control (headache, nausea, vomiting)
• Reliable support system and follow-up capability

**Return precautions — discuss thoroughly:**
• Worsening headache
• Vomiting
• Confusion or behavioral changes
• Seizures
• Fever >38.5°C
• Neck stiffness worsening

**Follow-up:** Primary care within **3 days** for reassessment. [23]',
 '[23]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Outpatient management of low-risk viral meningitis with strict return precautions and 3-day follow-up', NULL, 'consider', '[]'::jsonb, '[]'::jsonb, 25)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-ward', 'meningitis', 'result', 5,
 'Medical Ward Admission',
 '**Indications:**
• Alert enough to maintain airway
• Stable vital signs
• Not receiving titratable medications
• Does not require close neurological monitoring

**Ward management:**
• Continue IV antibiotics pending CSF analysis results
• Tailor antimicrobial therapy once causative agent identified
• Continue dexamethasone if bacterial meningitis suspected (discontinue if not *S. pneumoniae* or TB) [1,21]
• Patients with viral meningitis who have severe symptoms (refractory headache, persistent vomiting) should be admitted for symptom management
• Serial neurological assessments',
 '[1,21]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'Ward admission for IV antibiotics, neurological monitoring, and tailored therapy based on CSF results', NULL, 'recommended', '[]'::jsonb, '[]'::jsonb, 26)
;

INSERT INTO decision_nodes (id, tree_id, type, module, title, body, citation, options, inputs, next, recommendation, treatment, confidence, images, calculator_links, sort_order) VALUES
('mening-icu', 'meningitis', 'result', 5,
 'ICU Admission',
 '**Indications:**
• GCS score ≤8 — consider advanced airway management [8]
• Hemodynamic instability requiring vasopressors
• Seizure activity or focal neurological deficits
• All cases of **severe encephalitis**
• Rapidly declining level of consciousness

**ICU capabilities required:**
• Continuous electroencephalographic (EEG) monitoring
• Intracranial pressure (ICP) monitoring capability
• Frequent neurological reassessment
• Advanced airway management
• Titratable IV medications

**⚠️ Osmotic agents and therapeutic hypothermia** are NOT recommended — studies stopped early due to concerns for increased mortality in treatment groups. [1]',
 '[1,8]'::jsonb, '[]'::jsonb, '[]'::jsonb, NULL, 'ICU admission for continuous neurological monitoring, possible advanced airway, and aggressive treatment with specialist involvement', NULL, 'definitive', '[]'::jsonb, '[]'::jsonb, 27)
;


-- 5. drugs (5 new drugs)
INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('amphotericin-b', 'Amphotericin B Liposomal (AmBisome)', 'Amphotericin B liposomal', 'Polyene Antifungal', 'IV',
 '["Cryptococcal meningitis (induction)","Invasive fungal infections"]'::jsonb,
 '[{"indication":"Cryptococcal Meningitis (induction)","regimen":"3-4 mg/kg/day IV × 1 week (induction phase). Combine with flucytosine 25 mg/kg PO q6h. Follow with fluconazole 400-800 mg/day for consolidation. Initiate ONLY after ID consultation.","weightCalc":{"dosePerKg":4,"unit":"mg"}}]'::jsonb,
 '["Known hypersensitivity to amphotericin B or any component"]'::jsonb,
 '["Nephrotoxicity — monitor renal function daily; prehydrate with NS","Infusion-related reactions (fever, rigors, hypotension) — premedicate with acetaminophen ± diphenhydramine","Hypokalemia and hypomagnesemia — monitor and replace electrolytes","Liposomal formulation has significantly less nephrotoxicity than conventional amphotericin B deoxycholate"]'::jsonb,
 'Daily: BMP (creatinine, potassium, magnesium). Twice weekly: CBC, LFTs. Monitor for infusion reactions.',
 'Liposomal formulation (AmBisome) is strongly preferred over conventional amphotericin B deoxycholate due to reduced nephrotoxicity. Cochrane review (13 studies, 2426 participants) found 1 week of amphotericin B + flucytosine followed by fluconazole was most effective for HIV-associated cryptococcal meningitis. Do NOT co-administer corticosteroids — worsened outcomes in cryptococcal disease.',
 NULL,
 '["Tenforde MW, et al. Treatment for HIV-associated cryptococcal meningitis. Cochrane Database Syst Rev. 2018;7:CD005647.","Perfect JR, et al. Clinical practice guidelines for the management of cryptococcal disease: 2010 update by IDSA. Clin Infect Dis. 2010;50(3):291-322."]'::jsonb,
 0)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('fluconazole', 'Fluconazole (Diflucan)', 'Fluconazole', 'Triazole Antifungal', 'PO/IV',
 '["Cryptococcal meningitis (consolidation/maintenance)","Invasive candidiasis"]'::jsonb,
 '[{"indication":"Cryptococcal Meningitis (consolidation)","regimen":"400-800 mg PO/IV daily. Begin after 1-week induction with amphotericin B + flucytosine. Continue for minimum 8 weeks consolidation, then 200 mg/day maintenance until immune reconstitution (CD4 >200 for ≥6 months on ART)."}]'::jsonb,
 '["Known hypersensitivity to fluconazole or other azole antifungals","Co-administration with terfenadine (when fluconazole ≥400 mg/day)"]'::jsonb,
 '["QT prolongation — avoid with other QT-prolonging agents","Hepatotoxicity — monitor LFTs","Multiple CYP2C9/CYP3A4 drug interactions — review medication list","Dose adjust for renal impairment (CrCl <50 mL/min)"]'::jsonb,
 'LFTs at baseline and periodically. Renal function. ECG if concurrent QT-prolonging medications. Repeat CSF CrAg to document clearance.',
 'Used for consolidation and maintenance phases of cryptococcal meningitis treatment after induction with amphotericin B + flucytosine. NOT adequate as monotherapy for induction — associated with higher mortality. Maintenance therapy continues until immune reconstitution on ART.',
 NULL,
 '["Perfect JR, et al. Clinical practice guidelines for the management of cryptococcal disease: 2010 update by IDSA. Clin Infect Dis. 2010;50(3):291-322.","Tenforde MW, et al. Treatment for HIV-associated cryptococcal meningitis. Cochrane Database Syst Rev. 2018;7:CD005647."]'::jsonb,
 1)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('flucytosine', 'Flucytosine (Ancobon)', 'Flucytosine (5-fluorocytosine)', 'Antifungal (Pyrimidine Analog)', 'PO',
 '["Cryptococcal meningitis (induction, with amphotericin B)"]'::jsonb,
 '[{"indication":"Cryptococcal Meningitis (induction)","regimen":"25 mg/kg PO q6h × 1 week (induction phase). Always combine with amphotericin B liposomal. Dose adjust for renal impairment. Initiate ONLY after ID consultation.","weightCalc":{"dosePerKg":25,"unit":"mg","dailyDivided":4}}]'::jsonb,
 '["Known hypersensitivity to flucytosine","Severe renal impairment without dose adjustment"]'::jsonb,
 '["Myelosuppression (leukopenia, thrombocytopenia) — dose-related, monitor CBC","Hepatotoxicity — monitor LFTs","GI toxicity (nausea, vomiting, diarrhea)","Renal impairment — dose reduction required; amphotericin B may worsen renal function and increase flucytosine toxicity","Therapeutic drug monitoring recommended when available (target peak 30-80 mcg/mL)"]'::jsonb,
 'CBC twice weekly (myelosuppression). LFTs weekly. Renal function daily (dose adjust if creatinine rises). Flucytosine levels if available (peak 30-80 mcg/mL).',
 'Synergistic with amphotericin B for cryptococcal meningitis — combination reduces mortality vs amphotericin B alone. Never used as monotherapy (rapid resistance development). Limited availability and high cost in some settings. Cochrane evidence supports 1 week of amphotericin B + flucytosine as optimal induction.',
 NULL,
 '["Tenforde MW, et al. Treatment for HIV-associated cryptococcal meningitis. Cochrane Database Syst Rev. 2018;7:CD005647.","Perfect JR, et al. Clinical practice guidelines for the management of cryptococcal disease: 2010 update by IDSA. Clin Infect Dis. 2010;50(3):291-322."]'::jsonb,
 2)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('meropenem', 'Meropenem (Merrem)', 'Meropenem', 'Carbapenem', 'IV',
 '["Bacterial meningitis (cephalosporin allergy or multidrug-resistant organisms)","Healthcare-associated meningitis"]'::jsonb,
 '[{"indication":"Bacterial Meningitis","regimen":"2 g IV q8h. Can replace ceftriaxone for cephalosporin-allergic patients or when multidrug-resistant organisms are suspected. Has activity against L. monocytogenes — if used, ampicillin may be omitted. Combine with vancomycin."},{"indication":"Healthcare-Associated/Nosocomial Meningitis","regimen":"2 g IV q8h. Covers Pseudomonas aeruginosa, Acinetobacter, and other resistant gram-negative organisms. Combine with vancomycin for MRSA coverage. Use for post-neurosurgical, shunt-related, or basilar skull fracture-associated infections."}]'::jsonb,
 '["Severe hypersensitivity to carbapenems","History of anaphylaxis to beta-lactams (use with extreme caution — ~1% cross-reactivity)"]'::jsonb,
 '["Seizure risk — lower than imipenem but still possible, especially with renal impairment or CNS pathology","Dose adjust for renal impairment (CrCl <50 mL/min)","Clostridioides difficile-associated diarrhea risk with prolonged use"]'::jsonb,
 'Renal function (BMP). CBC. Monitor for seizures. C. difficile if diarrhea develops.',
 'Broadest-spectrum beta-lactam for CNS infections. Preferred carbapenem for meningitis (lower seizure risk than imipenem). Covers Listeria monocytogenes, unlike cephalosporins. Key role in healthcare-associated meningitis where resistant gram-negative organisms (P. aeruginosa, A. baumannii) are common pathogens. Mortality in healthcare-associated meningitis: 16-41%.',
 NULL,
 '["van de Beek D, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62.","Bardak-Ozcem S, Sipahi OR. An updated approach to healthcare-associated meningitis. Expert Rev Anti Infect Ther. 2014;12(3):333-342."]'::jsonb,
 3)
;

INSERT INTO drugs (id, name, generic_name, drug_class, route, indications, dosing, contraindications, cautions, monitoring, notes, image, citations, sort_order) VALUES
('rifampin', 'Rifampin (Rifadin)', 'Rifampin', 'Rifamycin Antibiotic', 'PO',
 '["Meningococcal postexposure prophylaxis","H. influenzae postexposure prophylaxis"]'::jsonb,
 '[{"indication":"Meningococcal Postexposure Prophylaxis","regimen":"600 mg PO q12h × 2 days (4 doses total). For close contacts of confirmed N. meningitidis cases. Alternatives: ceftriaxone 250 mg IM × 1 or ciprofloxacin 500 mg PO × 1."},{"indication":"H. influenzae Postexposure Prophylaxis","regimen":"600 mg PO daily × 4 days. For household contacts with incompletely vaccinated children <4 years or immunocompromised children <18 years."}]'::jsonb,
 '["Concurrent use of protease inhibitors or certain antiretrovirals (major CYP3A4 inducer)","Active hepatic disease or jaundice"]'::jsonb,
 '["Potent CYP inducer — reduces levels of oral contraceptives, warfarin, HIV medications, and many other drugs","Hepatotoxicity — monitor LFTs if used beyond prophylaxis duration","Colors body fluids orange-red (urine, tears, sweat) — counsel patients","Contact lens staining"]'::jsonb,
 'No monitoring needed for short-course PEP. For prolonged use: LFTs, CBC.',
 'Used for chemoprophylaxis of close contacts in meningococcal and H. influenzae meningitis. Single-dose alternatives (ceftriaxone IM, ciprofloxacin PO) are often preferred due to simpler regimen and fewer drug interactions. Rifampin should NOT be given to HIV patients on antiretroviral therapy due to severe drug interactions.',
 NULL,
 '["Cohn AC, et al. Prevention and control of meningococcal disease: ACIP recommendations. MMWR Recomm Rep. 2013;62(RR-2):1-28.","Briere EC, et al. Prevention and control of H. influenzae type b disease: ACIP recommendations. MMWR Recomm Rep. 2014;63(Rr-01):1-14."]'::jsonb,
 4)
;


-- 5b. drugs — UPDATE existing entries (6 drugs)
-- Updating Acyclovir with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Neonatal HSV (suspected or confirmed)","HSV encephalitis"]'::jsonb,
  dosing = '[{"indication":"Neonatal HSV (0-3 months)","regimen":"20 mg/kg IV q8h. Duration: minimum 5 doses or until HSV PCR results negative. If PCR not resulted after 5 doses, contact ID."},{"indication":"Adult/Adolescent Encephalitis (HSV, VZV)","regimen":"10 mg/kg IV q8h. Infuse over 1 hour. Continue pending HSV/VZV PCR results. If PCR negative but high clinical suspicion, continue and repeat PCR at 3-7 days. Duration: 14-21 days for confirmed HSV encephalitis.","weightCalc":{"dosePerKg":10,"unit":"mg"}}]'::jsonb,
  contraindications = '[]'::jsonb,
  cautions = '["Crystalline nephropathy — ensure adequate hydration","Infuse over 1 hour"]'::jsonb,
  monitoring = 'Renal function (BUN, creatinine). Urine output. Hold tube #4 CSF for HSV PCR. Surface cultures: conjunctiva, throat, nasopharynx, rectum, vesicle fluid if present.',
  notes = 'Empiric acyclovir should be started in any neonate with suspected HSV — fever, seizures, vesicular rash, CSF pleocytosis, or elevated LFTs without other explanation. Do not wait for PCR results to initiate treatment.',
  citations = '["Kimberlin DW, et al. Guidance on Management of Asymptomatic Neonates Born to Women with Active Genital Herpes Lesions. Pediatrics. 2013;131(2):e572-e579.","Red Book: 2021-2024 Report of the Committee on Infectious Diseases. American Academy of Pediatrics."]'::jsonb
WHERE id = 'acyclovir';

-- Updating Ampicillin with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Neonatal sepsis (empiric)","Meningitis (GBS, Listeria, Enterococcus coverage)"]'::jsonb,
  dosing = '[{"indication":"Non-meningitic (0-7 days)","regimen":"50 mg/kg IV q8h."},{"indication":"Non-meningitic (8-28 days)","regimen":"50 mg/kg IV q6h."},{"indication":"Meningitic (0-7 days)","regimen":"100 mg/kg IV q8h."},{"indication":"Meningitic (8-28 days)","regimen":"75 mg/kg IV q6h."},{"indication":"Meningitic (>28 days, added to Ceftriaxone)","regimen":"75 mg/kg IV q6h."},{"indication":"Adult Meningitis (Listeria coverage)","regimen":"2 g IV q4h. Add to ceftriaxone + vancomycin for patients age ≥50, pregnant, or immunocompromised. Active against L. monocytogenes, which is not covered by cephalosporins. Mortality from listerial meningitis: 17-30%."}]'::jsonb,
  contraindications = '["IgE-mediated penicillin allergy"]'::jsonb,
  cautions = '["Rash common (non-allergic maculopapular rash, especially with concurrent EBV infection)"]'::jsonb,
  monitoring = 'Clinical response. CBC, CRP, blood cultures. CSF cultures if meningitis suspected.',
  notes = 'Covers GBS, Listeria monocytogenes, and Enterococcus — organisms not covered by cephalosporins. Always pair with Gentamicin (0-7d) or Ceftriaxone/Cefepime (8-28d). Meningitic doses are higher to achieve adequate CSF penetration.',
  citations = '["Puopolo KM, et al. Management of Neonates Born at ≥35 0/7 Weeks'' Gestation With Suspected or Proven Early-Onset Bacterial Sepsis. Pediatrics. 2018;142(6):e20182894.","Red Book: 2021-2024 Report of the Committee on Infectious Diseases. American Academy of Pediatrics."]'::jsonb
WHERE id = 'ampicillin';

-- Updating Ceftriaxone with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Neurosyphilis (PCN allergy alternative)","Bacterial meningitis","Various serious infections","Pediatric sepsis / neonatal fever","Pediatric meningitis","Pediatric UTI","Pyelonephritis in pregnancy"]'::jsonb,
  dosing = '[{"indication":"Neurosyphilis (if desensitization not feasible)","regimen":"2 g IV daily × 10–14 days."},{"indication":"Pediatric Fever / Neonatal Sepsis","regimen":"50 mg/kg IV q24h (standard). 50 mg/kg IM/IV x1 (single pre-discharge dose). Max 2 g/dose.","weightCalc":[{"dosePerKg":50,"unit":"mg","maxDose":2000,"label":"Standard (q24h)"},{"dosePerKg":50,"unit":"mg","maxDose":2000,"label":"Single dose (IM/IV x1)"}]},{"indication":"Pediatric Meningitis","regimen":"50 mg/kg IV q12h (meningitic dose). Max 2 g/dose.","weightCalc":{"dosePerKg":50,"unit":"mg","maxDose":2000,"label":"Meningitic (q12h)"}},{"indication":"Pediatric UTI (inpatient/pre-discharge)","regimen":"75 mg/kg IV or IM prior to discharge. Max 2 g/dose.","weightCalc":{"dosePerKg":75,"unit":"mg","maxDose":2000}},{"indication":"Pyelonephritis in pregnancy","regimen":"1 g IV daily. Continue until afebrile 48 hours, then transition to oral cephalexin guided by culture sensitivities. Admit all pregnant patients with pyelonephritis."},{"indication":"Adult Bacterial Meningitis","regimen":"2 g IV q12h. Higher dose required for consistent CNS penetration. Combine with vancomycin (± ampicillin if age ≥50, pregnant, or immunocompromised). Administer with dexamethasone 0.15 mg/kg IV q6h."}]'::jsonb,
  contraindications = '["Severe cephalosporin allergy","Note: ~2–5% cross-reactivity with penicillin allergy — lower than historically believed"]'::jsonb,
  cautions = '["Biliary sludging — avoid co-administration with calcium-containing IV solutions in neonates","Not first-line for neurosyphilis — limited evidence compared to IV penicillin G. Use only if desensitization is not feasible."]'::jsonb,
  monitoring = 'CSF re-examination at 6 months post-treatment to document improvement.',
  notes = NULL,
  citations = '["CDC. Sexually Transmitted Infections Treatment Guidelines. 2021.","Marra CM, et al. Ceftriaxone for Neurosyphilis. Clin Infect Dis. 2019."]'::jsonb
WHERE id = 'ceftriaxone';

-- Updating Dexamethasone with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Croup (standard of care)","Cerebral edema","Antiemetic (chemotherapy)","Bacterial meningitis (adjunctive)","Airway edema"]'::jsonb,
  dosing = '[{"indication":"Croup","regimen":"0.6 mg/kg PO as a single dose (max 16 mg). Low-dose alternative: 0.15 mg/kg PO (non-inferior). If unable to tolerate oral: 0.6 mg/kg IM.","weightCalc":[{"dosePerKg":0.6,"unit":"mg","maxDose":16,"label":"Standard dose"},{"dosePerKg":0.15,"unit":"mg","label":"Low-dose alternative"}]},{"indication":"Cerebral edema","regimen":"10 mg IV loading dose, then 4 mg IV/IM q6h."},{"indication":"Airway edema / post-extubation stridor","regimen":"0.5 mg/kg IV q6h x 4 doses, starting 12-24 hours before planned extubation.","weightCalc":{"dosePerKg":0.5,"unit":"mg"}},{"indication":"Bacterial Meningitis (adjunctive)","regimen":"0.15 mg/kg IV q6h × 2-4 days. Give WITH or up to 15-20 min BEFORE first antibiotic dose. Reduces mortality in pneumococcal meningitis (Cochrane 2015). STOP if Listeria or Cryptococcus identified — worsened outcomes.","weightCalc":{"dosePerKg":0.15,"unit":"mg","dailyDivided":4}}]'::jsonb,
  contraindications = '["Systemic fungal infections","Known hypersensitivity to dexamethasone"]'::jsonb,
  cautions = '["Single-dose use for croup is safe with minimal adverse effects","Hyperglycemia with repeated dosing — monitor glucose in diabetics","Immunosuppression with prolonged use — not a concern with single dose","May mask signs of infection with prolonged use"]'::jsonb,
  monitoring = 'Clinical response. For croup: reassess severity 2-3 hours after dose. For prolonged use: blood glucose, signs of infection.',
  notes = 'Standard of care for croup in ALL severities. A 2023 Cochrane review (45 RCTs, 5,888 children) showed glucocorticoids significantly reduce croup scores at 2, 6, 12, and 24 hours vs placebo. NNT = 7 to prevent one return visit. Single dose provides sustained benefit due to long half-life (~36 hours). Reduces return visits/readmissions by ~50% (RR 0.52). Low-dose (0.15 mg/kg) is non-inferior to standard dose in a 1,252-patient RCT.',
  citations = '["Aregbesola A, et al. Glucocorticoids for Croup in Children. Cochrane Database Syst Rev. 2023;1:CD001955.","Bjornson CL, et al. A Randomized Trial of a Single Dose of Oral Dexamethasone for Mild Croup. N Engl J Med. 2004;351(13):1306-13.","Parker CM, Cooper MN. Prednisolone Versus Dexamethasone for Croup: A Randomized Controlled Trial. Pediatrics. 2019;144(3):e20183772.","Gates A, Johnson DW, Klassen TP. Glucocorticoids for Croup in Children. JAMA Pediatrics. 2019;173(6):595-596."]'::jsonb
WHERE id = 'dexamethasone';

-- Updating Cefepime (Maxipime) with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Neonatal sepsis/meningitis (alternative when Ceftriaxone contraindicated)"]'::jsonb,
  dosing = '[{"indication":"Sepsis/meningitis (0-28 days)","regimen":"50 mg/kg IV q12h."},{"indication":"Meningitis (>28 days)","regimen":"50 mg/kg IV q8h."},{"indication":"Adult Nosocomial/Healthcare-Associated Meningitis","regimen":"2 g IV q8h. Alternative to meropenem for Pseudomonas coverage in post-neurosurgical or healthcare-associated meningitis. Combine with vancomycin for MRSA coverage."}]'::jsonb,
  contraindications = '["Severe cephalosporin allergy"]'::jsonb,
  cautions = '["Neurotoxicity (seizures) — especially in renal impairment","Dose adjust for renal impairment"]'::jsonb,
  monitoring = 'Renal function, CBC. Monitor for neurotoxicity (altered mental status, seizures) especially with renal impairment or prolonged courses.',
  notes = 'Use when Ceftriaxone is contraindicated: GA <37 weeks, postnatal age <7 days, receiving calcium-containing IV products, or bilirubin >10 mg/dL. Broader gram-negative coverage than Ceftriaxone including Pseudomonas aeruginosa.',
  citations = '["Puopolo KM, et al. Management of Neonates Born at ≥35 0/7 Weeks'' Gestation With Suspected or Proven Early-Onset Bacterial Sepsis. Pediatrics. 2018;142(6):e20182894.","Bradley JS, et al. Nelson''s Pediatric Antimicrobial Therapy. 29th ed. American Academy of Pediatrics; 2023."]'::jsonb
WHERE id = 'cefepime';

-- Updating Ciprofloxacin with full current data (includes new burn dosing entries)
UPDATE drugs SET
  indications = '["Pediatric UTI (IgE-mediated allergy to penicillins AND cephalosporins)","Complicated UTI","Acute infectious diarrhea (adults)","Traveler''s diarrhea (adults)"]'::jsonb,
  dosing = '[{"indication":"Pediatric UTI","regimen":"20 mg/kg/day divided BID. Max 750 mg/dose (oral).","weightCalc":{"dosePerKg":20,"unit":"mg","maxDose":750,"dailyDivided":2}},{"indication":"Acute diarrhea","regimen":"500 mg PO BID × 3-5 days. First-line empiric antibiotic for adults with fever >38.5°C + positive fecal markers, acute dysentery, or diarrhea >48 hours."},{"indication":"Traveler diarrhea","regimen":"500 mg PO BID × 3 days. First-line for most regions. For Southeast Asia: use azithromycin instead (>80% fluoroquinolone-resistant Campylobacter)."},{"indication":"Meningococcal Postexposure Prophylaxis","regimen":"500 mg PO × 1 dose. Single-dose alternative to ceftriaxone IM or rifampin for close contacts of confirmed N. meningitidis cases."}]'::jsonb,
  contraindications = '["Concurrent tizanidine use","QT prolongation risk"]'::jsonb,
  cautions = '["FDA black box warnings (tendon rupture, peripheral neuropathy, CNS effects)","Generally avoided in children except when benefits outweigh risks","Musculoskeletal adverse events in pediatric patients"]'::jsonb,
  monitoring = 'Renal function, QTc if concurrent QT-prolonging agents. Monitor for tendon pain, neuropathy symptoms.',
  notes = 'Reserved for IgE-mediated allergy to penicillins AND cephalosporins in pediatric UTI. Use with caution in pediatric patients — FDA approval limited. TMP-SMX only 71% susceptible among E. coli isolates, making ciprofloxacin preferred fluoroquinolone alternative.',
  citations = '["Dell Children''s EBOC. First Febrile Urinary Tract Infection Clinical Pathway. May 2017.","Roberts KB. Urinary tract infection: clinical practice guideline for febrile infants and children 2 to 24 months. Pediatrics. 2011;128(3):595-610."]'::jsonb
WHERE id = 'ciprofloxacin';


-- 6. info_pages (7 pages)
INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-steps-summary', 'Meningitis/Encephalitis Steps Summary', 'Quick Reference — Time-Critical ED Management',
 '[{"heading":"Recognition","body":"• [Suspect CNS infection: ≥2 of 4 symptoms (headache, fever, neck stiffness, AMS) present in 95% of cases](#/node/mening-clinical)\n• [Assess for focal deficits → encephalitis vs meningitis](#/node/mening-focal-deficits)\n• Kernig/Brudzinski signs: only 2% sensitive — do NOT rely on for ruling out"},{"heading":"Workup","body":"• [CT before LP? Only if: GCS ≤12, focal deficits, papilledema, uncontrolled seizures](#/node/mening-ct-decision)\n• [LP technique: 4 tubes, up to 15 mL safe, opening pressure in lateral decubitus](#/node/mening-lp-technique)\n• **NEVER delay antibiotics for imaging or LP**"},{"heading":"Empiric Treatment (≤1 Hour)","body":"• [Immunocompetent <50y: Ceftriaxone 2g IV q12h + Vancomycin + Dexamethasone](#/node/mening-tx-standard)\n• [Age ≥50 / pregnant / immunocompromised: ADD Ampicillin 2g IV q4h (Listeria coverage)](#/node/mening-tx-expanded)\n• [Healthcare-associated: Vancomycin + Meropenem 2g IV q8h](#/node/mening-tx-nosocomial)\n• [Suspected cryptococcal: Amphotericin B + Flucytosine (ID consult)](#/node/mening-tx-crypto)\n• **Add Acyclovir 10 mg/kg IV q8h if ANY encephalitis features**"},{"heading":"CSF Interpretation","body":"• [Interpret CSF pattern: bacterial vs viral vs fungal vs equivocal](#/node/mening-csf-pattern)\n• CSF lactate >35 mg/dL: 93% sensitive for bacterial meningitis\n• Serum PCT >0.25-0.5 ng/mL: 90-95% sensitive for bacterial etiology\n• 6% of culture-proven ABM has NO elevated WBC — when in doubt, treat as bacterial"},{"heading":"Adjunctive Therapy","body":"• [Dexamethasone 0.15 mg/kg IV q6h × 2-4 days — give with or before first antibiotics](#/node/mening-steroids)\n• STOP steroids if Listeria or Cryptococcus identified\n• Contact prophylaxis for N. meningitidis exposures"},{"heading":"Disposition","body":"• [Discharge: low-risk viral meningitis with controlled symptoms and reliable follow-up](#/node/mening-discharge)\n• [Ward: stable, awaiting CSF results, continued IV antibiotics](#/node/mening-ward)\n• [ICU: GCS ≤8, hemodynamic instability, seizures, severe encephalitis](#/node/mening-icu)"}]'::jsonb,
 '[{"num":1,"text":"van de Beek D, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62."},{"num":2,"text":"Aronin SI, et al. Community-acquired bacterial meningitis: risk stratification for adverse clinical outcome and effect of antibiotic timing. Ann Intern Med. 1998;129(11):862-869."}]'::jsonb,
 false,
 0)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-csf-guide', 'CSF Interpretation Guide', 'Cerebrospinal Fluid Analysis for CNS Infections',
 '[{"heading":"Normal CSF Values","body":"• Red blood cells: 0\n• White blood cells: <5 cells/mcL\n• CSF:serum glucose ratio: >0.67\n• Protein: <50 mg/dL\n• Lactate: <35 mg/dL\n• Gram stain: no visible organisms\n• Opening pressure: <20 cm H₂O [1]"},{"heading":"Bacterial Meningitis Pattern","body":"• WBC: 10–10,000 cells/mcL (usually >100), **neutrophil predominance** [1,2]\n• CSF:serum glucose ratio: decreased (cutoff <0.36 → 93% sensitivity/specificity) [1]\n• Protein: elevated, mean ~135 mg/dL [2]\n• Lactate: >35.1 mg/dL (93% sensitivity, 97% specificity pre-antibiotics) [3]\n• Opening pressure: often elevated; >40 cm H₂O in 39% [1]\n• Gram stain: 60–99% sensitive, 97–100% specific [1]\n\n**Caveats:**\n• 6% of culture-proven ABM lacks elevated WBC [2]\n• 10% have lymphocyte-predominant differentials [2]\n• 25% of L. monocytogenes cases have normal/near-normal CSF [1]\n• Early disease or prior antibiotics may mask typical pattern"},{"heading":"Viral Meningitis Pattern","body":"• WBC: generally <250 (range 5–1000), **lymphocyte predominance** [1,4]\n• CSF:serum glucose ratio: normal to mildly decreased [2]\n• Protein: normal to mildly elevated, mean ~56 mg/dL [2]\n• Lactate: usually normal\n• Opening pressure: usually normal (<20 cm H₂O) [1]\n• Gram stain: negative"},{"heading":"Fungal Meningitis Pattern","body":"• WBC: variable, lymphocyte predominance\n• CSF:serum glucose ratio: often very low\n• Protein: elevated\n• Opening pressure: often significantly elevated\n• Subacute presentation (weeks of evolving symptoms)\n• CSF CrAg: highly sensitive for cryptococcal meningitis\n• CSF lactate may be elevated [3]"},{"heading":"Traumatic Tap Correction","body":"When RBCs contaminate CSF from traumatic LP:\n\n**Predicted CSF WBCs = CSF RBCs × (Blood WBCs / Blood RBCs)**\n\nThis formula is more accurate than the traditional rule of subtracting 1 WBC per 500–1500 RBCs. [1]\n\nCompare Tube 1 and Tube 4 cell counts — decreasing RBCs suggest traumatic tap rather than subarachnoid hemorrhage."},{"heading":"Key Diagnostic Biomarkers","body":"**CSF Lactate:** Independent of serum level (crosses BBB slowly). >35.1 mg/dL strongly favors bacterial cause. Particularly useful in healthcare-associated infections where postoperative inflammation alters conventional markers. [3]\n\n**CSF PCR:** Detects bacterial DNA even days after antibiotics (87–100% sensitive, 98–100% specific). Gold standard for viral pathogen identification. [5]\n\n**Serum PCT:** >0.25–0.5 ng/mL has 90–95% sensitivity, 98–100% specificity for distinguishing bacterial from viral meningitis. More sensitive than any CSF marker for this purpose. [6]"}]'::jsonb,
 '[{"num":1,"text":"Costerus JM, et al. Community-acquired bacterial meningitis. Curr Opin Infect Dis. 2017;30(1):135-141."},{"num":2,"text":"Julián-Jiménez A, et al. Usefulness of blood and cerebrospinal fluid laboratory testing to predict bacterial meningitis. Neurologia. 2019;34(2):105-113."},{"num":3,"text":"Sakushima K, et al. Diagnostic accuracy of CSF lactate for differentiating bacterial meningitis from aseptic meningitis: a meta-analysis. J Infect. 2011;62(4):255-262."},{"num":4,"text":"Wright WF, et al. Viral (aseptic) meningitis: a review. J Neurol Sci. 2019;398:176-183."},{"num":5,"text":"McGill F, et al. UK joint specialist societies guideline on acute meningitis. J Infect. 2016;72(4):405-438."},{"num":6,"text":"Vikse J, et al. Serum procalcitonin in the diagnosis of bacterial meningitis: systematic review and meta-analysis. Int J Infect Dis. 2015;38:68-76."}]'::jsonb,
 false,
 1)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-ct-criteria', 'CT Before Lumbar Puncture', 'International Guideline Comparison',
 '[{"heading":"Key Principle","body":"CT is NOT sensitive for detecting meningitis or encephalitis. Its purpose is to exclude mass lesions that could cause herniation with LP. **Most patients do NOT need CT before LP.** [1]\n\nHerniation after LP is rare: only 0.1% of patients deteriorated within 1 hour of LP. Of those who deteriorated, 91% had a prior normal CT. [2]"},{"heading":"IDSA 2004 Criteria (United States)","body":"CT before LP recommended if ANY of:\n• Immunocompromised state\n• History of CNS disease (mass, stroke, focal infection)\n• New-onset seizure (within 1 week)\n• Papilledema\n• Altered consciousness\n• Focal neurologic deficit [3]"},{"heading":"Swedish 2009 Criteria (More Permissive)","body":"CT before LP recommended if ANY of:\n• Focal neurologic signs\n• Papilledema\n• GCS <10\n• Continuous or uncontrolled seizures\n\n**Notably excludes:** altered mental status and self-limited seizures — evidence suggests these are NOT independent risk factors for herniation. [4]"},{"heading":"UK Joint Specialist Societies 2016 Criteria","body":"CT before LP recommended if ANY of:\n• Focal neurologic signs\n• Papilledema\n• Continuous or uncontrolled seizures\n• GCS ≤12\n• Rapidly declining level of consciousness [1]\n\n**Key difference from IDSA:** Does not include immunocompromised state or simple new-onset seizures as indications."},{"heading":"Practical Approach","body":"**ALWAYS start empiric antibiotics before CT if CT is indicated.**\n\nIf NO indications for CT:\n• Proceed directly to LP\n• Start antibiotics within 1 hour of suspicion\n\nIf CT IS indicated:\n• Start empiric antibiotics + dexamethasone IMMEDIATELY\n• Draw blood cultures before antibiotics if possible\n• Obtain CT\n• Perform LP after CT if no contraindication found\n• Antibiotics given >4 hours before LP reduce culture sensitivity >30% [1]"}]'::jsonb,
 '[{"num":1,"text":"McGill F, et al. UK joint specialist societies guideline on the diagnosis and management of acute meningitis. J Infect. 2016;72(4):405-438."},{"num":2,"text":"Costerus JM, et al. Cranial CT, LP, and clinical deterioration in bacterial meningitis: a nationwide cohort study. Clin Infect Dis. 2018;67(6):920-926."},{"num":3,"text":"Tunkel AR, et al. Practice guidelines for the management of bacterial meningitis. Clin Infect Dis. 2004;39(9):1267-1284."},{"num":4,"text":"Glimåker M, et al. Early lumbar puncture in adult bacterial meningitis—rationale for revised guidelines. Scand J Infect Dis. 2013;45(9):657-663."}]'::jsonb,
 false,
 2)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-abx-table', 'Empiric Antimicrobial Regimens', 'By Patient Risk Category',
 '[{"heading":"Immunocompetent Adult <50 Years","body":"**Targets:** S. pneumoniae, N. meningitidis [1]","drugTable":[{"drug":"Ceftriaxone","regimen":"2 g IV q12h"},{"drug":"Vancomycin","regimen":"15-20 mg/kg IV q8-12h"},{"drug":"Dexamethasone","regimen":"0.15 mg/kg IV q6h × 2-4 days"}]},{"heading":"Age ≥50, Pregnant, or Immunocompromised","body":"**Additional target:** L. monocytogenes (not covered by cephalosporins) [1,2]","drugTable":[{"drug":"Ceftriaxone","regimen":"2 g IV q12h"},{"drug":"Vancomycin","regimen":"15-20 mg/kg IV q8-12h"},{"drug":"Ampicillin","regimen":"2 g IV q4h (Listeria coverage)"},{"drug":"Dexamethasone","regimen":"0.15 mg/kg IV q6h × 2-4 days"}]},{"heading":"Healthcare-Associated / Post-Neurosurgical","body":"**Targets:** MRSA, Pseudomonas, resistant gram-negatives [3]","drugTable":[{"drug":"Vancomycin","regimen":"15-20 mg/kg IV q8-12h"},{"drug":"Meropenem","regimen":"2 g IV q8h (or Cefepime 2 g IV q8h)"}]},{"heading":"Suspected Cryptococcal (HIV/AIDS)","body":"**Requires ID consultation before initiation** [4]","drugTable":[{"drug":"Amphotericin B liposomal","regimen":"3-4 mg/kg/day IV (induction)"},{"drug":"Flucytosine","regimen":"25 mg/kg PO q6h (induction)"},{"drug":"Fluconazole","regimen":"400-800 mg/day (consolidation)"}]},{"heading":"Suspected Encephalitis (Any Risk Category)","body":"**Add to ANY regimen above if encephalitis features present:** [5]","drugTable":[{"drug":"Acyclovir","regimen":"10 mg/kg IV q8h (continue pending PCR)"}]},{"heading":"Key Timing Principles","body":"• **Antibiotics within 1 HOUR of suspicion** — delayed abx = increased mortality [6,7]\n• **Dexamethasone** given WITH or up to 15-20 min BEFORE first antibiotic dose [1]\n• **Do NOT delay antibiotics** for CT or LP\n• **Meropenem** covers L. monocytogenes — if used, ampicillin may be omitted [1]\n• **Do NOT give corticosteroids** if cryptococcal or listerial meningitis strongly suspected [1]"}]'::jsonb,
 '[{"num":1,"text":"van de Beek D, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62."},{"num":2,"text":"Hasbun R. Update and advances in community acquired bacterial meningitis. Curr Opin Infect Dis. 2019;32(3):233-238."},{"num":3,"text":"Bardak-Ozcem S, Sipahi OR. An updated approach to healthcare-associated meningitis. Expert Rev Anti Infect Ther. 2014;12(3):333-342."},{"num":4,"text":"Tenforde MW, et al. Treatment for HIV-associated cryptococcal meningitis. Cochrane Database Syst Rev. 2018;7:CD005647."},{"num":5,"text":"Whitley RJ, et al. Vidarabine versus acyclovir therapy in herpes simplex encephalitis. N Engl J Med. 1986;314(3):144-149."},{"num":6,"text":"Aronin SI, et al. Community-acquired bacterial meningitis: risk stratification and effect of antibiotic timing. Ann Intern Med. 1998;129(11):862-869."},{"num":7,"text":"Proulx N, et al. Delays in the administration of antibiotics are associated with mortality from adult ABM. QJM. 2005;98(4):291-298."}]'::jsonb,
 false,
 3)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-steroid-guide', 'Corticosteroid Guide', 'Adjunctive Dexamethasone in Meningitis',
 '[{"heading":"Regimen","body":"**Dexamethasone 0.15 mg/kg IV q6h × 2-4 days**\n\nGive WITH or up to **15-20 minutes BEFORE** first antibiotic dose. [1]"},{"heading":"Evidence Summary","body":"**Cochrane 2015** (25 studies, 4121 participants): [2]\n• Overall ABM: nonsignificant mortality reduction (17.8% vs 19.9%)\n• **Pneumococcal meningitis in high-income countries:** significant mortality reduction\n• Significant reduction in **hearing loss** and other neurological sequelae\n\n**TB meningitis** (Cochrane, 9 trials, 1337 patients): [3]\n• Corticosteroids reduced mortality by ~25% at 18 months\n\n**Mechanism:** Bactericidal antibiotics cause vigorous subarachnoid inflammatory response. Corticosteroids attenuate this inflammation, reducing secondary neurological injury."},{"heading":"When to CONTINUE","body":"• *Streptococcus pneumoniae* meningitis (strongest evidence) [2]\n• *Mycobacterium tuberculosis* meningitis [3]\n• Unknown pathogen (empiric — pneumococcus is most common cause of ABM)"},{"heading":"When to STOP Immediately","body":"• ***Listeria monocytogenes*** identified — nonsignificant trend toward WORSE outcomes (Swedish registry, 1746 patients, 19 years) [4]\n• ***Cryptococcus neoformans*** identified — associated with WORSENED outcomes [1]\n• Pathogen identified is NOT S. pneumoniae or M. tuberculosis [1]\n\n**Caution:** Patients receiving steroids for pneumococcal disease who initially recover face increased risk for **delayed cerebral thrombosis** over subsequent weeks. [1]"},{"heading":"Practical Decision","body":"Because pathogen identification is essentially impossible within the first hour of presentation:\n• Give dexamethasone empirically to most patients with suspected bacterial meningitis [1]\n• The likelihood of appropriately treating pneumococcal meningitis outweighs the chance of harming a patient with listerial or cryptococcal disease\n• If clinical evidence STRONGLY favors Listeria or Cryptococcus, consider withholding\n• Discontinue immediately once these pathogens are confirmed"}]'::jsonb,
 '[{"num":1,"text":"van de Beek D, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62."},{"num":2,"text":"Brouwer MC, et al. Corticosteroids for acute bacterial meningitis. Cochrane Database Syst Rev. 2015(9):CD004405."},{"num":3,"text":"Prasad K, et al. Corticosteroids for managing tuberculous meningitis. Cochrane Database Syst Rev. 2016;4:CD002244."},{"num":4,"text":"Glimåker M, et al. Betamethasone and dexamethasone in adult community-acquired bacterial meningitis: a quality registry study from 1995 to 2014. Clin Microbiol Infect. 2016;22(9):814.e811-e814."}]'::jsonb,
 false,
 4)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-dispo-criteria', 'Disposition Criteria', 'Discharge vs Ward vs ICU Admission',
 '[{"heading":"Discharge Criteria (Low-Risk Viral Meningitis)","body":"Absolute criteria for discharge have NOT been validated in adults. The following are extrapolated from pediatric data and should not replace clinical judgment: [1]\n\n• Nontoxic clinical appearance\n• Normal serum WBC count\n• Mild CSF pleocytosis only\n• Negative CSF Gram stain\n• Adequate symptom control (headache, nausea, vomiting)\n• Reliable support system and follow-up capability\n• Understands return precautions\n\n**Follow-up:** Primary care within **3 days** for reassessment [1]"},{"heading":"Return Precautions","body":"Discuss thoroughly before any discharge:\n• Worsening headache\n• Vomiting\n• Confusion or behavioral changes\n• Seizures\n• High fever (>38.5°C)\n• Worsening neck stiffness"},{"heading":"Medical Ward Admission","body":"• Alert enough to maintain airway\n• Stable vital signs, not requiring titratable medications\n• Does not require close neurological monitoring\n• Can receive IV antibiotics while awaiting CSF results\n• Patients with viral meningitis and severe symptoms (refractory headache, persistent vomiting)"},{"heading":"ICU Admission","body":"• GCS score ≤8\n• Hemodynamic instability requiring vasopressors\n• Seizure activity or focal neurological deficits\n• All cases of **severe encephalitis**\n• Rapidly declining level of consciousness\n• Need for continuous EEG monitoring\n• Need for ICP monitoring\n• Possible need for advanced airway management [2]"},{"heading":"Therapies NOT Recommended","body":"• **Osmotic agents** for ICP reduction: Cochrane review stopped early due to increased mortality in treatment groups [3]\n• **Therapeutic hypothermia**: RCT (98 patients) stopped early due to increased mortality in treatment group [3]"}]'::jsonb,
 '[{"num":1,"text":"Nigrovic LE, et al. Clinical prediction rule for identifying children with CSF pleocytosis at very low risk of bacterial meningitis. JAMA. 2007;297(1):52-60."},{"num":2,"text":"Venkatesan A, et al. Case definitions, diagnostic algorithms, and priorities in encephalitis: consensus statement of the International Encephalitis Consortium. Clin Infect Dis. 2013;57(8):1114-1128."},{"num":3,"text":"van de Beek D, et al. ESCMID guideline: diagnosis and treatment of acute bacterial meningitis. Clin Microbiol Infect. 2016;22:S37-S62."}]'::jsonb,
 false,
 5)
;

INSERT INTO info_pages (id, title, subtitle, sections, citations, shareable, sort_order) VALUES
('mening-pep-guide', 'Postexposure Prophylaxis', 'Chemoprophylaxis for Meningococcal and H. influenzae Contacts',
 '[{"heading":"N. meningitidis Postexposure Prophylaxis","body":"Indicated for **close contacts** of confirmed N. meningitidis cases (household members, intimate contacts, healthcare workers with unprotected exposure to respiratory secretions). [1]\n\n**Options (any one):**","drugTable":[{"drug":"Ceftriaxone","regimen":"250 mg IM × 1 dose (preferred in pregnancy)"},{"drug":"Ciprofloxacin","regimen":"500 mg PO × 1 dose"},{"drug":"Rifampin","regimen":"600 mg PO q12h × 2 days (4 doses total)"}]},{"heading":"H. influenzae Postexposure Prophylaxis","body":"Indicated for household contacts with **incompletely vaccinated children aged <4 years** or immunocompromised children aged <18 years, regardless of vaccination status. [2]","drugTable":[{"drug":"Rifampin","regimen":"600 mg PO daily × 4 days (adults)"}]},{"heading":"Varicella Zoster Virus (VZV)","body":"Consider varicella zoster immunoglobulin for **high-risk individuals** without evidence of immunity who have unprotected exposure to VZV: [3]\n• Immunocompromised patients\n• Pregnant women\n• Neonates\n\n**Administer in consultation with an infectious disease specialist.**"},{"heading":"Prehospital Provider Prophylaxis","body":"EMS professionals with unanticipated exposure to N. meningitidis or H. influenzae should receive appropriate chemoprophylaxis using the regimens above.\n\n**Standard precautions** apply for most CNS infections. **Particulate respirators** should be worn for potentially airborne pathogens (VZV, tuberculosis). [1]"}]'::jsonb,
 '[{"num":1,"text":"Cohn AC, et al. Prevention and control of meningococcal disease: ACIP recommendations. MMWR Recomm Rep. 2013;62(RR-2):1-28."},{"num":2,"text":"Briere EC, et al. Prevention and control of H. influenzae type b disease: ACIP recommendations. MMWR Recomm Rep. 2014;63(Rr-01):1-14."},{"num":3,"text":"U.S. CDC. Updated recommendations for use of VariZIG. MMWR Recomm Rep. 2013;62(28):574-576."}]'::jsonb,
 false,
 6)
;

COMMIT;
