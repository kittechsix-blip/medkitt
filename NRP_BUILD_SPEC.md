# Neonatal Resuscitation (NRP) Consult — Build Plan

## Context

Andy requested a new clinical consult: **Neonatal Resuscitation (NRP)** in the Pediatrics category. This is consult #19 for MedKitt. Source material: handwritten case notes (Cases 1-5 covering progressive NRP scenarios), the official 2025 AHA/AAP NRP Algorithm PDF, and 2025 guideline updates on cord management, ventilation, and temperature. The existing Precipitous Delivery consult already cross-links to `#/tree/neonatal-resus` (3 references), so this tree ID is locked in.

---

## Tree Specification

- **Tree ID:** `neonatal-resus`
- **Entry node:** `nrp-start`
- **Categories:** Pediatrics (primary) + EM (cross-list)
- **Nodes:** 25 total, 6 modules
- **Citations:** 8 references
- **Clinical notes:** 6 key teaching points

---

## Node Map (25 nodes, 6 modules)

### Module 1: Preparation & Initial Assessment (6 nodes)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-start` | info | Overview, Steps Summary link, 90%/10%/<1% stats, module overview, cross-links to Precipitous Delivery + Shoulder Dystocia |
| `nrp-preparation` | info | Team briefing (roles, NRP pre-brief questions), equipment checklist (radiant warmer, T-piece, pulse ox, cardiac monitor, suction, intubation, UVC kit, meds) |
| `nrp-cord-mgmt` | info | DCC 30-60s vigorous, ICM ≥35wk non-vigorous (2025 update), NOT for <28wk, clamp immediately if resus needed |
| `nrp-preterm` | info | Viability assessment, plastic wrap <32wk, higher starting FiO2, temperature critical, gestational age estimation |
| `nrp-initial-eval` | question | "Term? Breathing/Crying? Good Tone?" → Yes to ALL = `nrp-routine` / No to ANY = `nrp-initial-steps` |
| `nrp-routine` | result | Vigorous → skin-to-skin, DCC, routine care, maintain normothermia, APGAR 1+5 min |

### Module 2: Initial Steps — Golden 30 Seconds (4 nodes)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-initial-steps` | info | Warm (radiant heater, NO blankets on top), Dry, Position (sniffing), Stimulate (flick feet, rub back), Clear airway PRN (mouth then nose, avoid vigorous) |
| `nrp-meconium` | info | Meconium stained fluid: vigorous → normal steps; non-vigorous → DO NOT delay PPV for suctioning (2025); ET suction only if airway obstructed; meconium aspirator declining |
| `nrp-golden30-eval` | question | 30-sec reassessment: (1) "Breathing, HR ≥100" → `nrp-postresus` / (2) "Labored breathing or persistent cyanosis" → `nrp-breathing-support` / (3) "Apnea/gasping OR HR <100" → `nrp-ppv` [critical] |
| `nrp-breathing-support` | info | Pulse ox (right wrist = preductal), supplemental O2, CPAP, monitor → `nrp-postresus` |

### Module 3: Positive Pressure Ventilation (7 nodes)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-ppv` | info | T-piece preferred (2025), C-E grip, mask seal, sniffing position, PIP 20-25 cmH2O, rate 40-60/min, 21% FiO2 ≥35wk, confirm chest rise, SpO2 targets table inline |
| `nrp-spo2-targets` | info | Target SpO2 by minute: 1'=60-65%, 2'=65-70%, 3'=70-75%, 4'=75-80%, 5'=80-85%, 10'=85-95%. Preductal monitoring. Avoid hyperoxia. |
| `nrp-ppv-eval` | question | 30-sec check: "HR ≥100" → `nrp-postresus` / "HR <100, not improving" → `nrp-corrective` [urgent] |
| `nrp-corrective` | info | MR SOPA: Mask adjust, Reposition, Suction, Open mouth, Pressure increase, Alternative airway |
| `nrp-advanced-airway` | info | ETT intubation vs LMA (≥34wk, >2kg per 2025). Cardiac monitor. Link to ETT sizing |
| `nrp-ett-sizing` | info | ETT = GA(wk)/10. Table: 23-24wk=2.5, 25-28=3.0, 29-34=3.5, ≥35=3.5-4.0. Blade: Miller 0 (most), 00 (extreme preterm). Depth: 6+wt(kg) cm at lip. Securing tips |
| `nrp-hr60-check` | question | "HR <60 after effective ventilation?" → Yes = `nrp-cpr` [critical] / No = continue PPV → `nrp-postresus` |

### Module 4: Chest Compressions (2 nodes)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-cpr` | info | MUST intubate/LMA first. 2-thumb encircling, 1/3 AP diameter, 3:1 ratio (1-2-3-breathe), 120 events/min, 100% FiO2, establish UVC/IO |
| `nrp-cpr-eval` | question | "HR after 60s CPR?" → "≥60" = stop compressions, PPV → `nrp-postresus` / "<60" → `nrp-epinephrine` [critical] |

### Module 5: Medications & Vascular Access (5 nodes)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-epinephrine` | info | Drug link: `[Epinephrine](#/drug/epinephrine/neonatal resuscitation)`. IV/IO: 0.01-0.03 mg/kg (0.1-0.3 mL/kg of 1:10,000) q3-5min. ET: 0.05-0.1 mg/kg if no IV. IV preferred. |
| `nrp-uvc` | info | UVC procedure: 2 arteries (thick, small), 1 vein (thin, large). Catheter: 5F term, 3.5F preterm. Umbilical tape first. Prime. Insert 2-4cm until aspirates. |
| `nrp-persistent` | question | "HR still <60 after epi?" → "Suspect hypovolemia" → `nrp-volume` / "Suspect pneumothorax" → cross-link to PTX POCUS / "No response after 20 min" → `nrp-discontinuation` |
| `nrp-volume` | info | NS 10 mL/kg for hypovolemia. O-neg pRBCs 10 mL/kg for blood loss. D10W 2 mL/kg if glucose <40. Naloxone NO LONGER recommended. → `nrp-postresus` |
| `nrp-discontinuation` | result | When to stop: no HR after 20 min of comprehensive resuscitation. Team + family discussion. Document everything. |

### Module 6: Post-Resuscitation (1 node)

| Node ID | Type | Content |
|---------|------|---------|
| `nrp-postresus` | result | APGAR 1+5+10 min. Normothermia (36.5-37.5C). Glucose monitoring. NICU transfer. Therapeutic hypothermia criteria (≥36wk, mod-severe HIE, within 6hr). Communicate with family. Team debrief. |

---

## Images (3 clinical reference photos)

All images go in `docs/images/neonatal-resus/`. These are linked from specific tree nodes AND referenced from the Steps Summary via node links.

### Image 1: `neonatal-monitoring.png` → Node: `nrp-preparation`
**Neonatal Monitoring Setup** — Annotated photo showing proper placement of all monitoring equipment on a newborn:
- O2 Sat probe on right hand/wrist (PREDUCTAL — this is critical, not left hand)
- Temperature probe over liver (target 36.5-37.5°C)
- EKG probes on chest
- Endotracheal tube, nasogastric tube
- Pulse oximeter (also can go on left foot)
- Umbilical arterial catheter
- Peripheral/central catheter
- Chest tube (if needed)
- Alt text: "Annotated photo of neonatal monitoring setup showing preductal O2 sat on right hand, temperature probe over liver (36.5-37.5°C), EKG probes, ETT, and umbilical catheter placement"
- Caption: "Neonatal monitoring: SpO2 on right hand (preductal). Temperature probe over liver (36.5-37.5°C)."

### Image 2: `neonatal-numbers.png` → Node: `nrp-ett-sizing`
**Neonatal Numbers Quick Reference** — Term vs Pre-Term comparison table:
| | TERM | PRE-TERM |
|---|---|---|
| Blade | Miller 0 | Miller 00 |
| ET | 3.0-3.5 | 2.0-2.5 |
| UVC | 5.0 F | 3.5 F |
| EPI | 0.01 mg/kg 1:10K | 0.01 mg/kg 1:10K |
| Glucose | D10 2cc/kg | D10 2cc/kg |
| Fluid/Blood | 20cc/kg / 10cc/kg | 20cc/kg / 10cc/kg |
- Alt text: "Quick reference table comparing neonatal equipment sizes and medication doses for term versus preterm newborns"
- Caption: "Neonatal Numbers: Term vs Pre-Term equipment sizing and medication dosing."

### Image 3: `uvc-anatomy.png` → Node: `nrp-uvc`
**UVC Anatomy & Insertion** — Two-panel illustration:
- Left: Cross-section of umbilical cord showing 2 umbilical arteries (thick-walled, small lumen, at top) and 1 umbilical vein (thin-walled, large lumen, at bottom)
- Right: Side view of umbilical stump with catheter inserted through vein, umbilical tape tied at base
- Key text: "Insert only 2 cm deep"
- Alt text: "Umbilical cord cross-section showing 2 arteries and 1 vein, with side view of UVC insertion through umbilical stump — insert only 2 cm deep"
- Caption: "UVC anatomy: 2 arteries (thick, small) + 1 vein (thin, large). Insert catheter only 2 cm deep."

### Steps Summary image references
The NRP Steps Summary links to these nodes so users can tap through to see the images:
- Preparation section → `[Monitoring setup: SpO2 right wrist (preductal), temp over liver](#/node/nrp-preparation)` (links to Image 1)
- CPR section → `[Neonatal numbers: ETT, blade, UVC, epi, glucose, fluids](#/node/nrp-ett-sizing)` (links to Image 2)
- Medications section → `[UVC procedure: 2 arteries, 1 vein — insert 2 cm](#/node/nrp-uvc)` (links to Image 3)

---

## Files to Modify (6 files)

### 1. CREATE: `src/data/trees/neonatal-resus.ts`
- All 25 nodes in `NEONATAL_RESUS_NODES` array
- `NEONATAL_RESUS_MODULE_LABELS` (6 labels)
- `NEONATAL_RESUS_CITATIONS` (8 citations)
- `NEONATAL_RESUS_CLINICAL_NOTES` (6 notes)
- Follow exact pattern from `precip-delivery.ts`

### 2. MODIFY: `src/components/tree-wizard.ts`
- **Line 23** area: Add import `import { NEONATAL_RESUS_NODES, NEONATAL_RESUS_CITATIONS, NEONATAL_RESUS_MODULE_LABELS } from '../data/trees/neonatal-resus.js';`
- **Line 171** area: Add `'neonatal-resus'` entry to `TREE_CONFIGS`

### 3. MODIFY: `src/data/categories.ts`
- Pediatrics array (~line 226): Add NRP entry (title: "Neonatal Resuscitation (NRP)")
- EM array (~line 56): Add NRP cross-list entry

### 4. MODIFY: `src/components/reference-table.ts`
- Add import for `NEONATAL_RESUS_CITATIONS, NEONATAL_RESUS_CLINICAL_NOTES`
- Add `'neonatal-resus'` entry to `TREE_REFERENCE_DATA`

### 5. MODIFY: `src/components/info-page.ts`
- Add `NRP_SUMMARY` InfoPage constant (before registry, ~line 1458)
- Add `'nrp-summary': NRP_SUMMARY` to `INFO_PAGES` map (~line 1501)

### 6. MODIFY: `src/data/drug-store.ts`
- Update EPINEPHRINE `route`: `'IV/IO/SQ/ET/Intracavernosal'`
- Add `'Neonatal resuscitation (NRP)'` to `indications` array
- Add 2 new dosing cards with `weightCalc`:
  - NRP IV/IO: 0.01-0.03 mg/kg of 1:10,000, q3-5min
  - NRP ET: 0.05-0.1 mg/kg of 1:10,000
- Add NRP citation to citations array

---

## Citations (8)

1. AHA/AAP. 2025 Guidelines for Neonatal Resuscitation. Circulation. 2025;152(Suppl 1):S399-S445.
2. Weiner GM, ed. Textbook of Neonatal Resuscitation (NRP). 8th ed. AAP; 2021.
3. Aziz K, Lee HC, Escobedo MB, et al. Part 5: Neonatal Resuscitation. Circulation. 2020;142(16 suppl 2):S524-S550.
4. Wyckoff MH, et al. Neonatal Life Support: 2020 ILCOR Consensus. Circulation. 2020;142(16 suppl 1):S185-S221.
5. ACOG Committee Opinion No. 684: Delayed Umbilical Cord Clamping. Obstet Gynecol. 2017;129(1):e5-e10.
6. Perlman JM, et al. Part 7: Neonatal Resuscitation. 2015 ILCOR Consensus. Circulation. 2015;132(16 suppl 1):S204-S241.
7. Kattwinkel J, et al. Part 15: Neonatal Resuscitation. Circulation. 2010;122(18 suppl 3):S909-S919.
8. McFarlin A. ED Management of Precipitous Delivery and Neonatal Resuscitation. Emerg Med Rep. 2019;40(11).

---

## Clinical Notes (for reference table)

1. 90% of newborns need no resuscitation. 10% need early support. <1% need extensive resuscitation (CPR + medications).
2. Ventilation is the single most important intervention in neonatal resuscitation. Most bradycardia in newborns is caused by inadequate ventilation.
3. Primary apnea responds to stimulation. Secondary apnea does NOT respond — requires PPV.
4. T-piece resuscitators are preferred over self-inflating bags (2025). Supraglottic airway (LMA) may be used for ≥34 weeks as an initial interface.
5. Both hypothermia AND hyperthermia worsen outcomes. Target normothermia (36.5-37.5C). Therapeutic hypothermia should begin under NICU conditions, not during resuscitation.
6. Meconium aspirator is no longer routinely recommended — delays time to PPV. Only intubate/suction if airway is obstructed.

---

## Verification

1. `bunx tsc` — compiles without errors
2. `git status docs/` — all compiled files present
3. Browser testing:
   - Pediatrics category → NRP card visible, alphabetically sorted
   - EM category → NRP cross-list card visible
   - Start node → Steps Summary modal opens, all `#/node/` links work
   - Full vigorous path: start → initial-eval → routine (shortest)
   - Full arrest path: start → prep → initial-eval → initial-steps → golden30 → ppv → corrective → hr60-check → cpr → cpr-eval → epi → persistent → discontinuation
   - Existing cross-links from Precipitous Delivery → `#/tree/neonatal-resus` navigates correctly
   - Drug link `[Epinephrine](#/drug/epinephrine/neonatal resuscitation)` opens Pharmacy → NRP dosing card with green outline
   - Weight calculator works for NRP epinephrine
   - Reference table shows 8 citations + 6 clinical notes
4. Bump SW cache `medkitt-v81` → `medkitt-v82`

---

## Source Transcript — Handwritten Case Notes (Cases 1-5)

### CASE 1: Term Baby, Vigorous Response
24 yo female, multip, term pregnancy in active labor. 1 hour ago ruptured membranes — clear. Baby born vertex. Cord clamped. Baby handed to you.
- Initial EVAL: TERM, NOT Crying, Extended Limbs
- STEP 1 Initial Eval: 1. Term 2. Breathing/Crying 3. Tone
- Preterm = high risk needing resus. Tone usually flexed + active.
- 90% need no resus, 10% need early support, 1% need extensive resus
- INITIAL STEPS → Golden 30 seconds → Vigorous Cry, Flexed → Active → Primary Apnea
- WARMTH — Radiant Heater NO BLANKETS
- OPEN Airway → Sniffing position
- CLEAR Airway → Suction Mouth Then Nose (Avoid Vigorous)
- STIMULATE — Flick feet, Rub back
- Having trouble with transition: Always responds to stimuli

### CASE 2: Meconium Stained
Same case, EXCEPT meconium stained.
- STEP 1: Term, Not Crying, Gasping breaths, Flaccid
- Meconium Branch Point: Vigorous → Yes → no change. → No → Suction Mouth + Trachea
- Prevention Meconium Aspiration Syndrome (Only helpful if done Early!!)
- ET TUBE with Meconium Aspirator (*Intubate, Suction Once over 3 Seconds)
- REASSESS → Back on Algorithm
- Meconium Aspirator: throw away if meconium present!! → delays time to PPV. "so now who cares"

### CASE 3: PIH, Apneic → PPV Required
24 yo female with PIH, labor induced at 38 weeks in anticipation of resus. 3kg boy born. Late decels noted. Neonatal NP stuck in traffic. EDMD called to bedside.
- STEP 1: 38 wks, Apneic, Limp → INITIAL STEPS
- 30 SEC REVAL — NO Spontaneous Breaths and Limp. Primary Apnea? NOT responding to stimulation → Secondary Apnea
- STEP 2: PPV. Treatment 2° APNEA = PPV AT SAME TIME O2SAT Monitor
- O2SAT @Wrist = Preductal (1' 60-65, 2' 65-70, 3' 70-75, 4' 75-80, 5' 80-85 ... 10 min 85-95)
- HR: Umbilical Stump/Auscultation
- PPV Procedure: 1) Mask fit, 2) Head Position, 3) C-E RAISE JAW into mask, 4) Avoid BaroTRAUMA 20mmHg, 5) RATE 40/min Squeeze-R-R, 6) Confirm Chest Rise/Breath Sounds, 7) Avoid Hyperoxia 21% FiO2
- 30 sec Reassess: Spontaneous Breathing, Crying, Flexed + Active, O2SAT 80%, HR 120, temp 36.5°C
- CORRECTIVE STEPS (MR SOPA): Adjust Mask, Reposition Airway, Resuction, Open Mouth, INCREASE Pressure

### CASE 4: Preterm, Full CPR Required
Pregnant woman arrives by private car. No prenatal, unknown dates. Active labor. Drops a flaccid baby. OB called, Neonatologist watching Frozen.
- Determination of Viability: 23.5 week, 500g (estimation ±20%). Dates MOST ACCURATE 1st trimester 3-5d, ±1-2 weeks after. U/S BPD 5cm, Femur 3.5cm.
- INITIAL EVAL: Guesstimate Preterm ~30ish Weeks, 1kg, Apneic, Limp
- STEP 1: Treat 1° Apnea → Golden 30sec EVAL → Apneic, Flaccid, HR 30
- STEP 2: Treat 2° Apnea → PPV, O2SAT Monitor
- 30sec Reeval — Good chest RISE, O2SAT? HR 40. GOAL #1: Quality Ventilation.
- Initiate CPR [HR < 60]: 1) Prolonged PPV 2-3 min, 2) Initiate CPR, 3) 2 thumbs, 1/3-1/2 AP DIAMETER, RATE 90-120. 3:1 (1, 2, 3, Breath)
- REASSESS 4 min of Life: Starting Spontaneous Breaths. HR 90, O2SAT 80%, Temp 34°C. NP Arrives! Child determined 34 weeks.
- ET TUBE SIZE: Gestational Age Wks/10 = ET TUBE SIZE (MOST 30-35, Extreme Preterm)
- Blade: Miller 0 — most, Extreme preterm 00
- Depth: 6 + wt in Kg. Hold to Roof of Mouth — Extremely EASY to dislodge.

### CASE 5: Full Arrest → Epinephrine → UVC
Pregnant woman drove from Mexico, term, heavy bleeding. Delivers in car. Child brought to you. NP at UT football game.
- INITIAL EVAL: Apneic, Flaccid
- STEP 1: 1° Apnea → Golden 30sec: Apneic, Flaccid
- STEP 2: 2° Apnea, HR 30 → PPV, O2SAT @Wrist, HR → Not Breathing HR 30
- CPR: INTUBATE 3.5, 100% FiO2, 3:1 CPR
- REEVAL at 4min: Not Breathing, HR 30, O2SAT 60%
- Epinephrine: ET TUBE 10x NORMAL → 1cc/Kg of 1:10,000. IV: 0.1cc/Kg
- UVC PROCEDURE: 2 Arteries 1 Vein. Cannula 5F (Term), 3.5F (next size). PLACE UMBILICAL TAPE 1st — Gentle tie → Stop bleeding. Prime, 2 cm below skin or Aspiration — whichever 1st.
- 8min of Life: HR 100, starting to breathe, Pale. O2SAT 90%.
- Titrate FiO2. Fluid 20cc/kg. Blood 10cc/kg. Sugar → >30 D10 5cc/kg. Naloxone 0.1 mg/kg.

---

## 2025 AHA/AAP Guideline Updates (Key Changes)

**Cord Management:**
- DCC recommended 30-60 sec for most term/preterm who don't need immediate resus
- ICM may be reasonable for ≥35wk non-vigorous (compared to immediate clamping)
- ICM for 28-34wk when DCC isn't possible
- NOT recommended for <28wk (risk of brain bleeding)

**Ventilation:**
- Effective ventilation is the most critical step
- T-piece resuscitators preferred over self-inflating bags
- For ≥34wk, supraglottic airway may be used as initial interface

**Temperature:**
- Both hypothermia AND hyperthermia worsen outcomes
- Target normothermia for all infants
- Therapeutic hypothermia under controlled NICU conditions, not during resus
- Normothermia may have better outcomes than therapeutic hypothermia in preemies <36wk

**Team Preparation:**
- Assign roles, review cord management plan before delivery
- Confirm equipment and temperature control
- Communicate: "vigorous" vs "non-vigorous" dictates cord strategy
- Document: cord clamping time, APGARs, time to ventilation
- Post-delivery: timely NICU transition, therapeutic hypothermia eligibility within 6 hours

---

## Image Files to Create

The user must manually save these 3 images to `docs/images/neonatal-resus/`:
1. `neonatal-monitoring.png` — annotated neonatal monitoring photo (O2 sat preductal, temp over liver)
2. `neonatal-numbers.png` — Term vs Pre-Term numbers table (blade, ET, UVC, epi, glucose, fluid)
3. `uvc-anatomy.png` — UVC cross-section anatomy + insertion illustration (2 arteries, 1 vein, insert 2cm)
