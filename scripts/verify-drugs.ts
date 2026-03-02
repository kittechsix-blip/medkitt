// MedKitt — Verify drugs in Supabase match hardcoded data
// Run: bun scripts/verify-drugs.ts

import { getAllDrugs } from '../src/data/drug-store.js';

const SUPABASE_URL = 'https://kzzqloklnxlqbccxbxgr.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6enFsb2tsbnhscWJjY3hieGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI0NzA4MDMsImV4cCI6MjA4ODA0NjgwM30.lCqD2KymgqQf3h8xUHIht7PeBcmvPVSXxvqsL45Mrko';

async function verify() {
  const hardcoded = getAllDrugs();

  const res = await fetch(`${SUPABASE_URL}/rest/v1/drugs?select=id,name&order=sort_order`, {
    headers: {
      'apikey': SUPABASE_ANON_KEY,
      'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
    },
  });

  if (!res.ok) {
    console.error(`Supabase fetch failed: ${res.status} ${await res.text()}`);
    process.exit(1);
  }

  const remote = await res.json() as { id: string; name: string }[];

  console.log(`Hardcoded: ${hardcoded.length} drugs`);
  console.log(`Supabase:  ${remote.length} drugs`);

  const remoteIds = new Set(remote.map(r => r.id));
  const hardcodedIds = new Set(hardcoded.map(h => h.id));

  let issues = 0;
  for (const h of hardcoded) {
    if (!remoteIds.has(h.id)) {
      console.warn(`  MISSING in Supabase: ${h.id} (${h.name})`);
      issues++;
    }
  }
  for (const r of remote) {
    if (!hardcodedIds.has(r.id)) {
      console.warn(`  EXTRA in Supabase: ${r.id} (${r.name})`);
      issues++;
    }
  }

  if (issues === 0) {
    console.log('All drugs match. Seed verified.');
  } else {
    console.log(`${issues} issue(s) found.`);
  }
}

verify();
