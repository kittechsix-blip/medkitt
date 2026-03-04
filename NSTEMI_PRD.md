# NSTEMI Clinical Decision Tree — Product Requirements Document

> Source of truth for all clinical content, evidence, and decision logic for the NSTEMI consult.
> All evidence provided by Andy (EM physician) from peer-reviewed guidelines and literature.

---

## Overview

**Consult title:** NSTEMI
**Category:** Cardiology (primary) + EM (cross-listed)
**Tree ID:** `nstemi`
**Entry node:** `nstemi-start`

**Best evidence summary:** The best evidence for managing non-ST-elevation myocardial infarction (NSTEMI) supports early risk stratification followed by dual antiplatelet therapy, anticoagulation, and an invasive strategy tailored to patient risk, with very high-risk patients requiring emergent catheterization and most others benefiting from early intervention within 24 hours.

---

## Part 1: Definition & Diagnostic Criteria

NSTEMI is defined as acute myocardial injury with evidence of myocardial ischemia but without ST-segment elevation on electrocardiography.

Per the Fourth Universal Definition of Myocardial Infarction, NSTEMI requires a rise and/or fall in cardiac troponin values (with at least one value above the 99th percentile upper reference limit) accompanied by clinical evidence of acute myocardial ischemia. Evidence of ischemia includes at least one of:
- Ischemic symptoms
- New ischemic ECG changes (ST-segment depression or T-wave inversion)
- Development of pathological Q waves
- Imaging evidence of new loss of viable myocardium or new regional wall motion abnormality
- Identification of a coronary thrombus by angiography or autopsy

The key distinction from STEMI is the absence of new ST-segment elevation meeting specific voltage criteria on ECG. Patients without ST-segment elevation at presentation are designated as having NSTEMI (if cardiac biomarkers are elevated) or unstable angina (if biomarkers remain normal).

The ECG in NSTEMI may show new or presumed new horizontal or down-sloping ST-segment depression >=0.5 mm in >=2 contiguous leads and/or T-wave inversion >1 mm in >=2 contiguous leads with prominent R wave, or transient ST-segment elevation, though many patients have either nonspecific changes or a normal ECG.

NSTEMI is classified as Type 1 myocardial infarction when caused by atherothrombotic coronary artery disease with plaque disruption, distinguishing it from Type 2 MI (supply-demand mismatch) and other forms of myocardial injury.

### Diagnostic Criteria Detail

**Cardiac biomarkers**: Elevated cardiac troponin I or T (preferably) or CK-MB above the 99th percentile upper reference limit, with a characteristic rise and/or fall pattern. High-sensitivity troponin assays have improved early detection and allow for rapid rule-out algorithms using measurements at 0 and 1-3 hours. The dynamic change in troponin concentration (rising and/or falling pattern) distinguishes acute myocardial infarction from chronic myocardial injury.

**Clinical evidence of ischemia** must accompany the troponin elevation and may include ischemic symptoms (chest discomfort, dyspnea), new ECG changes suggestive of ischemia, imaging evidence of new myocardial dysfunction, or angiographic evidence of coronary thrombus. The ECG may show T-wave inversions or ST-segment depressions, though these findings are commonly absent and not required for diagnosis.

**Serial sampling** is essential, with at least two samples collected at least 6 hours apart (or 1-3 hours with high-sensitivity assays) to establish the dynamic pattern of biomarker release. If no biomarker elevation is detected, the diagnosis is unstable angina rather than NSTEMI.

### Differential Diagnosis

NSTEMI must be differentiated from:
- **Unstable angina** (ischemic symptoms without biomarker elevation)
- **Type 2 MI** (supply-demand mismatch without atherothrombotic plaque disruption) — has higher mortality than Type 1 MI despite different pathophysiology
- **Non-ischemic myocardial injury** (troponin elevation without ischemic features)

---

## Part 2: Initial Medical Management

Immediate therapy includes aspirin and systemic anticoagulation upon presentation. Dual antiplatelet therapy (DAPT) with aspirin plus a P2Y12 inhibitor should be initiated promptly, with ticagrelor or prasugrel preferred over clopidogrel based on superior outcomes in clinical trials. The ACC/AHA recommend ticagrelor for NSTE-ACS management, while prasugrel is favored when PCI is planned in patients without high bleeding risk.

Anti-ischemic therapy with beta-blockers, nitrates, and ACE inhibitors or ARBs should be initiated as clinically indicated.

**CRITICAL:** Fibrinolytic therapy is contraindicated in NSTEMI and may be harmful. NSAIDs should be avoided due to increased risks of mortality, reinfarction, and myocardial rupture.

---

## Part 3: Risk Stratification & Invasive Strategy Selection

Early risk stratification using clinical criteria and validated risk scores (e.g., GRACE score, TIMI score) is central to determining management strategy. The timing of coronary angiography depends on patient risk profile:

### Immediate Invasive Strategy (Within 2 Hours)

Urgent/immediate coronary angiography with intent to revascularize is indicated for NSTEMI patients with:
- Refractory angina despite intensive medical therapy
- Hemodynamic instability or cardiogenic shock
- Electrical instability (sustained VT, VF, cardiac arrest)
- Signs or symptoms of heart failure or new/worsening mitral regurgitation
- Recurrent angina or ischemia at rest or with low-level activities despite optimal medical therapy

These very high-risk patients have been consistently excluded from clinical trials evaluating optimal timing, but immediate angiography is intuitively expected to improve outcomes if revascularization stabilizes the clinical condition.

### Early Invasive Strategy (Within 24 Hours)

Indicated for initially stabilized patients with elevated risk:
- GRACE risk score >140
- TIMI risk score >=4
- Elevated cardiac biomarkers (troponin or CK-MB)
- New or presumably new ST-segment depression
- Dynamic ECG changes or persistent high-risk ECG findings
- Temporal change in troponin suggesting ongoing myocardial injury
- Continuing steep rise in cardiac biomarkers despite optimized medical therapy

The TIMACS and VERDICT trials showed no significant difference in MACE between early vs delayed invasive approaches in overall populations, but there was a signal toward reduction in events with earlier intervention in higher-risk patients with GRACE scores >140. Meta-analyses suggest factors favoring an earlier invasive approach include GRACE score >140, diabetes, age >75 years, and elevated cardiac biomarkers.

### Delayed Invasive Strategy (25-72 Hours or Before Discharge)

For initially stabilized patients at intermediate or low risk:
- Intermediate-risk scores (TIMI 2-3, GRACE 109-140)
- Diabetes mellitus
- Renal insufficiency (GFR <60 mL/min/1.73 m2)
- Reduced left ventricular systolic function (EF <40%)
- Early postinfarction angina
- Prior PCI within 6 months or prior CABG

### Selective Invasive (Ischemia-Guided) Strategy

Reasonable for:
- Low-risk scores (TIMI 0-1, GRACE <109)
- Low-risk troponin-negative female patients
- Patient or clinician preference in the absence of high-risk features

---

## Part 4: TIMI Risk Score for UA/NSTEMI

The TIMI Risk Score is a simple seven-point scoring system that predicts 14-day risk of death, MI, or urgent revascularization. One point assigned for each:

1. Age >=65 years
2. >=3 risk factors for CAD (family history, hypertension, hypercholesterolemia, diabetes, current smoker)
3. Known coronary stenosis >=50%
4. ST-segment deviation >=0.5 mm on presenting ECG
5. >=2 anginal events in prior 24 hours
6. Aspirin use in prior 7 days
7. Elevated cardiac biomarkers (troponin or CK-MB)

### Risk Stratification by TIMI Score:
- 0-1 points: 4.7% event rate (low risk)
- 2 points: 8.3% event rate
- 3 points: 13.2% event rate
- 4 points: 19.9% event rate
- 5 points: 26.2% event rate
- 6-7 points: 40.9% event rate (high risk)

Score >=4 indicates high risk warranting early invasive approach within 24 hours. The score also identifies patients who derive greater benefit from more aggressive antithrombotic therapy and early invasive strategy.

### GRACE Risk Score (Reference)

Uses eight variables: age, heart rate, systolic blood pressure, serum creatinine, Killip class, cardiac arrest at admission, ST-segment deviation, and elevated cardiac enzymes. A GRACE score >140 identifies high-risk patients who benefit most from early invasive strategy within 24 hours. Scores 109-140 indicate intermediate risk. The GRACE score has been more extensively validated in clinical trials and provides continuous risk estimation, while the TIMI score offers simplicity and ease of bedside calculation.

---

## Part 5: Medication Dosages

### Antiplatelet Therapy

**P2Y12 Inhibitor Selection:**
- P2Y12 pretreatment before catheterization is no longer recommended as routine strategy in patients with planned early invasive management (2025 guidelines)

**Aspirin:** Loading dose 162-325 mg orally (non-enteric coated, chewed when possible), followed by maintenance dose 75-100 mg daily. Higher maintenance doses (up to 325 mg daily) are associated with increased bleeding without improved outcomes.

**Clopidogrel:** Loading dose 300-600 mg orally, followed by maintenance 75 mg daily. The 600 mg loading dose produces more rapid and reliable platelet inhibition.

**Ticagrelor:** Loading dose 180 mg orally, followed by maintenance 90 mg twice daily. Preferred over clopidogrel for moderate- to high-risk patients.

**Prasugrel:** Loading dose 60 mg orally, followed by maintenance 10 mg daily (if weight >=60 kg and age <75). Recommended when PCI is planned in patients not at high bleeding risk.

### Anticoagulant Therapy

**Unfractionated heparin (UFH):** Loading dose 60 IU/kg (max 4,000 IU), with initial infusion 12 IU/kg/hour (max 1,000 IU/hour), adjusted to maintain aPTT 60-80 seconds.

**Enoxaparin:** 1 mg/kg subcutaneously every 12 hours for initial therapy. Reduce to 1 mg/kg daily if creatinine clearance <30 mL/min.

**Fondaparinux:** 2.5 mg subcutaneously daily. Contraindicated if creatinine clearance <30 mL/min.

**Bivalirudin:** 0.75 mg/kg bolus, followed by 1.75 mg/kg/hour IV infusion during PCI. Reduce infusion to 1 mg/kg/hour if creatinine clearance <30 mL/min.

### Additional Medical Therapies

**Beta-blockers:** Early oral initiation (within 24 hours) is recommended, titrated to heart rate and blood pressure response. Avoid in acute heart failure, cardiogenic shock, severe bradycardia, or high-degree heart block.

**ACE inhibitors/ARBs:** Initiated within 24 hours, particularly in high-risk patients (LVEF <=40%, hypertension, diabetes).

**Statins:** High-intensity statin therapy initiated or continued immediately, regardless of baseline cholesterol levels. Atorvastatin 40-80 mg daily or rosuvastatin 20-40 mg daily.

---

## Part 6: Contraindications to Antiplatelet Therapy

**Absolute contraindications to aspirin:** Documented hypersensitivity/allergy (particularly asthma with nasal polyps), active bleeding, hemophilia, severe untreated hypertension, and active peptic ulcer or serious GI/GU bleeding. For patients with aspirin hypersensitivity, desensitization is preferred when possible.

**Relative contraindications and cautions for P2Y12 inhibitors:** High bleeding risk, planned urgent surgery (particularly CABG), and diagnostic uncertainty where aortic dissection or other contraindications remain possible.

**Prasugrel is contraindicated** in patients with prior stroke/TIA (net clinical harm in TRITON-TIMI 38 subgroup). Generally avoid in age >=75 or weight <60 kg.

**Bleeding mitigation strategies:** Radial over femoral access for catheterization, PPI for patients with GI bleeding history, low-dose aspirin (75-100 mg) for maintenance.

---

## Part 7: Conservative (Ischemia-Guided) Management

A selective invasive (conservative) strategy is appropriate for:
- Low-risk NSTEMI patients
- Those with significant comorbidities increasing procedural risk
- Patients with preferences against invasive procedures
- Those at prohibitively high risk from angiography

Specific populations favoring conservative management:
- Older adults with frailty (particularly >=75 years with Clinical Frailty Scale score >=4)
- Patients with extensive comorbidities
- Those with low likelihood of ACS who are troponin-negative
- Patients with known coronary anatomy or preferences that preclude revascularization

The SENIOR-RITA trial found no clear survival advantage with invasive strategy in patients >=75 years with NSTEMI, though there was reduced recurrent MI at the cost of increased bleeding. In frail older adults, a conservative strategy may result in more days alive and out of hospital.

When conservative management is selected, a structured plan for noninvasive evaluation is essential, including early echocardiography to identify significant LV dysfunction. Patients with positive findings should be promptly referred for angiography.

---

## Part 8: Secondary Prevention & Discharge Therapy

All NSTEMI patients require comprehensive secondary prevention including statins, ACE inhibitors/ARBs, beta-blockers, and continuation of DAPT. Population-level data from 2003-2013 demonstrated significant increases in guideline-directed medical therapy use, with aspirin (98.4%), beta-blockers (95.4%), statins (96.6%), ACE inhibitors/ARBs (92.6%), and P2Y12 inhibitors (94.9%) at discharge, all associated with improved survival.

Risk factor modification through lifestyle interventions and cardiac rehabilitation is essential. Aldosterone antagonists should be considered in appropriate patients.

---

## Part 9: MINOCA (MI with Non-Obstructive Coronary Arteries)

For patients with myocardial infarction with non-obstructive coronary arteries (MINOCA), therapy should be individualized based on underlying etiology. Aspirin and statins are reasonable for all MINOCA patients with any atherosclerotic plaque. Beta-blockers and ACE inhibitors/ARBs are indicated for those with LV dysfunction, though routine use of all cardioprotective therapies in MINOCA remains uncertain and should be tailored to the specific mechanism (e.g., beta-blockers may be contraindicated in coronary spasm).

---

## Part 10: POCUS Echo for NSTEMI

Point-of-care echocardiography (POCUS) can identify high-risk NSTEMI patients requiring urgent catheterization by detecting regional wall motion abnormalities (RWMA), reduced ejection fraction, and mechanical complications, though it is not formally incorporated into risk scores like GRACE or TIMI.

### Role in Triage
The ACC recommends that high-risk patients with elevated troponin should undergo comprehensive TTE. Before a formal echocardiogram, a focused urgent bedside ultrasound can provide valuable triage information. The European Association of Cardiovascular Imaging and ASE recommend TTE should be available in all ERs and performed in all patients with chest pain.

### Findings Indicating Urgent Catheterization
- New wall motion abnormalities in patients with ongoing chest discomfort or ST depression
- Heart failure (Killip class III-IV)
- Ejection fraction <40%
- Mechanical complications (acute MR, VSD, free wall rupture)
- RV dysfunction

### Diagnostic Accuracy
- Pre-hospital TTE by emergency physicians: 90.9% sensitivity, 100% specificity for NSTEMI when RWMA identified
- Prehospital POCUS by paramedics: RWMA had 96% NPV for NSTEMI
- In 14% of NSTEMI cases, RWMA was the only positive finding (normal ECG and initial troponin)

### Limitations
- Cannot distinguish acute from chronic ischemia
- Cannot detect high-grade stenosis without resting wall motion abnormalities
- Most useful when ongoing symptoms at time of imaging
- Should be interpreted by those with appropriate training

**NOTE:** A full POCUS Echo for NSTEMI consult tree will be added as a future feature. Save a placeholder hyperlink in the tree.

---

## References

1. Rao SV, O'Donoghue ML, Ruel M, et al. 2025 ACC/AHA/ACEP/NAEMSP/SCAI Guideline for the Management of Patients With Acute Coronary Syndromes. J Am Coll Cardiol. 2025;85(22):2135-2237. doi:10.1016/j.jacc.2024.11.009.
2. Amsterdam EA, Wenger NK, Brindis RG, et al. 2014 AHA/ACC Guideline for the Management of Patients With Non-ST-Elevation Acute Coronary Syndromes. J Am Coll Cardiol. 2014;64(24):e139-e228. doi:10.1016/j.jacc.2014.09.017.
3. Bergmark BA, Mathenge N, Merlini PA, et al. Acute Coronary Syndromes. Lancet. 2022;399(10332):1347-1358. doi:10.1016/S0140-6736(21)02391-6.
4. Rodriguez F, Harrington RA. Management of Antithrombotic Therapy after Acute Coronary Syndromes. N Engl J Med. 2021;384(5):452-460. doi:10.1056/NEJMra1607714.
5. Reed GW, Rossi JE, Cannon CP. Acute Myocardial Infarction. Lancet. 2017;389(10065):197-210. doi:10.1016/S0140-6736(16)30677-8.
6. Hall M, Dondo TB, Yan AT, et al. Association of Clinical Factors and Therapeutic Strategies With Improvements in Survival Following Non-ST-Elevation Myocardial Infarction, 2003-2013. JAMA. 2016;316(10):1073-82. doi:10.1001/jama.2016.10766.
7. Anderson JL, Morrow DA. Acute Myocardial Infarction. N Engl J Med. 2017;376(21):2053-2064. doi:10.1056/NEJMra1606915.
8. Thygesen K, Alpert JS, Jaffe AS, et al. Fourth Universal Definition of Myocardial Infarction (2018). J Am Coll Cardiol. 2018;72(18):2231-2264. doi:10.1016/j.jacc.2018.08.1038.
9. Antman EM, Cohen M, Bernink PJ, et al. The TIMI Risk Score for Unstable Angina/Non-ST Elevation MI: A Method for Prognostication and Therapeutic Decision Making. JAMA. 2000;284(7):835-42. doi:10.1001/jama.284.7.835.
10. Bhatt DL, Lopes RD, Harrington RA. Diagnosis and Treatment of Acute Coronary Syndromes: A Review. JAMA. 2022;327(7):662-675. doi:10.1001/jama.2022.0358.
11. Tamis-Holland JE, Jneid H, Reynolds HR, et al. Contemporary Diagnosis and Management of Patients With Myocardial Infarction in the Absence of Obstructive Coronary Artery Disease (MINOCA). Circulation. 2019;139(18):e891-e908. doi:10.1161/CIR.0000000000000670.
12. Wright RS, Anderson JL, Adams CD, et al. 2011 ACCF/AHA Focused Update Incorporated Into the ACC/AHA 2007 Guidelines for the Management of Patients With Unstable Angina/Non-ST-Elevation Myocardial Infarction. J Am Coll Cardiol. 2011;57(19):e215-367. doi:10.1016/j.jacc.2011.02.011.
13. Wiviott SD, Steg PG. Clinical Evidence for Oral Antiplatelet Therapy in Acute Coronary Syndromes. Lancet. 2015;386(9990):292-302. doi:10.1016/S0140-6736(15)60213-6.
14. Sabatine MS, Braunwald E. Thrombolysis in Myocardial Infarction (TIMI) Study Group: JACC Focus Seminar 2/8. J Am Coll Cardiol. 2021;77(22):2822-2845. doi:10.1016/j.jacc.2021.01.060.
15. Sanchis J, Bueno H, Minana G, et al. Effect of Routine Invasive vs Conservative Strategy in Older Adults With Frailty and NSTEMI. JAMA Intern Med. 2023;183(5):407-415. doi:10.1001/jamainternmed.2023.0047.
16. Damluji AA, Nanna MG, Mason P, et al. Coronary Artery Revascularization in the Older Adult Population. Circulation. 2025. doi:10.1161/CIR.0000000000001387.
17. Kontos MC, de Lemos JA, et al. 2022 ACC Expert Consensus Decision Pathway on Evaluation and Disposition of Acute Chest Pain in the ED. J Am Coll Cardiol. 2022;80(20):1925-1960. doi:10.1016/j.jacc.2022.08.750.
18. Bergmann I, et al. Pre-Hospital Transthoracic Echocardiography for Early Identification of NSTEMI. Crit Care. 2018;22(1):29. doi:10.1186/s13054-017-1929-1.
19. Edvardsen T, Asch FM, et al. Non-Invasive Imaging in Coronary Syndromes. J Am Soc Echocardiogr. 2022;35(4):329-354. doi:10.1016/j.echo.2021.12.012.
20. Slipczuk L, et al. Evaluation and Medical Management of Nonobstructive CAD. Circulation. 2025;152(23):e443-e466. doi:10.1161/CIR.0000000000001394.
21. Sandoval Y, Jaffe AS. Type 2 Myocardial Infarction: JACC Review Topic of the Week. J Am Coll Cardiol. 2019;73(14):1846-1860. doi:10.1016/j.jacc.2019.02.018.
