// MedKitt — Seed categories + decision_trees + category_trees from hardcoded data
// Run: SUPABASE_URL=... SUPABASE_SERVICE_KEY=... bun scripts/seed-categories.ts

import { DEFAULT_CATEGORIES, CATEGORY_COLORS } from '../src/data/categories.js';

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
  console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_KEY env vars');
  process.exit(1);
}

const headers = {
  'apikey': SUPABASE_SERVICE_KEY,
  'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
  'Content-Type': 'application/json',
  'Prefer': 'resolution=merge-duplicates',
};

async function post(table: string, rows: unknown[]) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: 'POST',
    headers,
    body: JSON.stringify(rows),
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${table}: ${res.status} ${text}`);
  }
}

async function seed() {
  // 1. Seed categories
  const categoryRows = DEFAULT_CATEGORIES.map((cat, i) => {
    const colors = CATEGORY_COLORS[cat.id];
    return {
      id: cat.id,
      name: cat.name,
      icon: cat.icon,
      is_custom: cat.isCustom,
      card_color: colors?.card ?? null,
      icon_bg: colors?.iconBg ?? null,
      text_color: colors?.textColor ?? null,
      outline: colors?.outline ?? null,
      sort_order: i,
    };
  });
  console.log(`Seeding ${categoryRows.length} categories...`);
  await post('categories', categoryRows);
  console.log('  Categories done.');

  // 2. Collect unique trees across all categories
  const treesMap = new Map<string, { id: string; title: string; subtitle: string; version: string; nodeCount: number; entryNodeId: string }>();
  for (const cat of DEFAULT_CATEGORIES) {
    for (const tree of cat.decisionTrees) {
      if (!treesMap.has(tree.id)) {
        treesMap.set(tree.id, {
          id: tree.id,
          title: tree.title,
          subtitle: tree.subtitle,
          version: tree.version,
          nodeCount: tree.nodeCount,
          entryNodeId: tree.entryNodeId,
        });
      }
    }
  }

  const treeRows = Array.from(treesMap.values()).map(t => ({
    id: t.id,
    title: t.title,
    subtitle: t.subtitle,
    version: t.version,
    node_count: t.nodeCount,
    entry_node_id: t.entryNodeId,
  }));
  console.log(`Seeding ${treeRows.length} decision trees...`);
  await post('decision_trees', treeRows);
  console.log('  Decision trees done.');

  // 3. Seed category_trees junction (with overrides where tree metadata differs)
  const junctionRows: { category_id: string; tree_id: string; display_title: string | null; display_subtitle: string | null; entry_node_id: string | null; sort_order: number }[] = [];

  for (const cat of DEFAULT_CATEGORIES) {
    for (let i = 0; i < cat.decisionTrees.length; i++) {
      const tree = cat.decisionTrees[i];
      const canonical = treesMap.get(tree.id)!;

      // Only set override fields if they differ from canonical
      const displayTitle = tree.title !== canonical.title ? tree.title : null;
      const displaySubtitle = tree.subtitle !== canonical.subtitle ? tree.subtitle : null;
      const entryNodeId = tree.entryNodeId !== canonical.entryNodeId ? tree.entryNodeId : null;

      junctionRows.push({
        category_id: cat.id,
        tree_id: tree.id,
        display_title: displayTitle,
        display_subtitle: displaySubtitle,
        entry_node_id: entryNodeId,
        sort_order: i,
      });
    }
  }
  console.log(`Seeding ${junctionRows.length} category-tree links...`);
  await post('category_trees', junctionRows);
  console.log('  Junction table done.');

  console.log('\nAll category data seeded successfully.');
}

seed().catch(e => {
  console.error(e);
  process.exit(1);
});
