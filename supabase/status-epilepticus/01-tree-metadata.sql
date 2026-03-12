-- =====================================================================
-- MedKitt — Status Epilepticus Consult: Supabase INSERT Statements
-- Generated: 2026-03-11
-- Paste this into Supabase SQL Editor and run.
-- =====================================================================

BEGIN;

-- 1. decision_trees (metadata)
INSERT INTO decision_trees (id, title, subtitle, version, node_count, entry_node_id, module_labels)
VALUES (
  'status-epilepticus',
  'Status Epilepticus',
  'BZD → 2nd-Line ASM → RSE Infusions → cEEG',
  '1.0',
  26,
  'se-start',
  '["Recognition & Stabilization","Phase 1: Benzodiazepines","Phase 2: Urgent Control","Refractory SE","Special Populations","Differential & NCSE"]'::jsonb
)
;

-- 2. category_trees
INSERT INTO category_trees (category_id, tree_id, display_title, display_subtitle, entry_node_id, sort_order)
VALUES ('neurology', 'status-epilepticus', NULL, NULL, NULL, 0)
ON CONFLICT (category_id, tree_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

-- 3. tree_citations (11 citations)
DELETE FROM tree_citations WHERE tree_id = 'status-epilepticus';
INSERT INTO tree_citations (tree_id, num, text) VALUES
('status-epilepticus', 1, 'Betjemann JP, Bhatt J, Engel A. Status Epilepticus. Emergency Medicine Practice (EB Medicine). 2025;27(9):1-28.'),
('status-epilepticus', 2, 'Brophy GM, Bell R, Claassen J, et al. Guidelines for the Evaluation and Management of Status Epilepticus. Neurocrit Care. 2012;17(1):3-23.'),
('status-epilepticus', 3, 'Glauser T, Shinnar S, Gloss D, et al. Evidence-Based Guideline: Treatment of Convulsive Status Epilepticus in Children and Adults. Epilepsy Curr. 2016;16(1):48-61.'),
('status-epilepticus', 4, 'Kapur J, Elm J, Chamberlain JM, et al. Randomized Trial of Three Anticonvulsant Medications for Status Epilepticus (ESETT). N Engl J Med. 2019;381(22):2103-2113.'),
('status-epilepticus', 5, 'Silbergleit R, Durkalski V, Lowenstein D, et al. Intramuscular versus Intravenous Therapy for Prehospital Status Epilepticus (RAMPART). N Engl J Med. 2012;366(7):591-600.'),
('status-epilepticus', 6, 'Dalziel SR, et al. Levetiracetam versus Phenytoin for Second-Line Treatment of Convulsive Status Epilepticus in Children (EcLiPSE/ConSEPT). Lancet. 2019;393(10186):2125-2134.'),
('status-epilepticus', 7, 'Yasiry Z, Shorvon SD. The Relative Effectiveness of Five Antiepileptic Drugs in Treatment of Benzodiazepine-Resistant Convulsive Status Epilepticus: A Meta-Analysis. Epilepsia. 2014;55(9):1349-1361.'),
('status-epilepticus', 8, 'Claassen J, Hirsch LJ, Emerson RG, Mayer SA. Treatment of Refractory Status Epilepticus with Pentobarbital, Propofol, or Midazolam: A Systematic Review. Epilepsia. 2002;43(2):146-153.'),
('status-epilepticus', 9, 'Swor DE, et al. Management of Status Epilepticus in Pregnancy: A Survey of Neurologists and Neurointensivists. Neurocrit Care. 2024.'),
('status-epilepticus', 10, 'ACOG Practice Bulletin No. 222: Gestational Hypertension and Preeclampsia. Obstet Gynecol. 2020;135(6):e237-e260.'),
('status-epilepticus', 11, 'Trinka E, Cock H, Hesdorffer D, et al. A Definition and Classification of Status Epilepticus — Report of the ILAE Task Force on Classification of Status Epilepticus. Epilepsia. 2015;56(10):1515-1523.');

DELETE FROM decision_nodes WHERE tree_id = 'status-epilepticus';

COMMIT;
