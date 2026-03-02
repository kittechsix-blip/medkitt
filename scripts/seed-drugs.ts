// MedKitt — Seed drugs table from hardcoded drug-store.ts
// Run: SUPABASE_URL=... SUPABASE_SERVICE_KEY=... bun scripts/seed-drugs.ts

import { getAllDrugs } from '../src/data/drug-store.js';

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_KEY env vars');
  process.exit(1);
}

async function seedDrugs() {
  const drugs = getAllDrugs();
  console.log(`Seeding ${drugs.length} drugs...`);

  const rows = drugs.map((drug, index) => ({
    id: drug.id,
    name: drug.name,
    generic_name: drug.genericName,
    drug_class: drug.drugClass,
    route: drug.route,
    indications: drug.indications,
    dosing: drug.dosing,
    contraindications: drug.contraindications ?? [],
    cautions: drug.cautions ?? [],
    monitoring: drug.monitoring ?? null,
    notes: drug.notes ?? null,
    image: drug.image ?? null,
    citations: drug.citations,
    sort_order: index,
  }));

  // Upsert all drugs in one request
  const res = await fetch(`${SUPABASE_URL}/rest/v1/drugs`, {
    method: 'POST',
    headers: {
      'apikey': SUPABASE_SERVICE_KEY,
      'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'resolution=merge-duplicates',
    },
    body: JSON.stringify(rows),
  });

  if (!res.ok) {
    const text = await res.text();
    console.error(`Failed: ${res.status} ${text}`);
    process.exit(1);
  }

  console.log(`Successfully seeded ${drugs.length} drugs.`);
}

seedDrugs();
