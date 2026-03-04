# Deploy MedKitt

Compile TypeScript, validate exports, verify all compiled files are staged, bump the service worker cache, and push to GitHub Pages.

## Steps

1. **Compile TypeScript:**
   Run `bunx tsc` from the project root. Verify zero errors.

2. **Validate compiled exports match app imports (CRITICAL):**
   Run the following check BEFORE staging anything. This catches broken compilations that silently rewrite export formats.

   ```bash
   # Extract every export name that tree-wizard.js imports from docs/data/trees/
   # Then verify each export actually exists in its compiled JS file
   ERRORS=0
   while IFS= read -r line; do
     # Parse: import { EXPORT1, EXPORT2 } from '../data/trees/filename.js'
     FILE=$(echo "$line" | grep -o "trees/[^'\"]*" | sed 's|trees/||')
     EXPORTS=$(echo "$line" | grep -o '{[^}]*}' | tr -d '{},' | tr ' ' '\n' | grep -v '^$')
     for exp in $EXPORTS; do
       if ! grep -q "export.*$exp" "docs/data/trees/$FILE" 2>/dev/null; then
         echo "BROKEN: docs/data/trees/$FILE missing export '$exp'"
         ERRORS=$((ERRORS + 1))
       fi
     done
   done < <(grep "from.*trees/" docs/components/tree-wizard.js)
   if [ $ERRORS -gt 0 ]; then
     echo "DEPLOY BLOCKED: $ERRORS missing exports. Compilation broke tree files."
     echo "Restore from git: git checkout HEAD -- docs/data/trees/"
   else
     echo "All exports verified."
   fi
   ```

   If ANY exports are missing: **DO NOT DEPLOY.** Restore the compiled files from git with `git checkout HEAD -- docs/data/trees/` and investigate why the TS source doesn't match the expected export format.

3. **Verify ALL compiled files are staged:**
   Run `git status docs/` and check for ANY unstaged changes. Every modified file in `docs/` MUST be committed.
   This is critical — the `src/` TypeScript source and the `docs/` compiled output can get out of sync if compiled JS files are forgotten. This has caused production bugs before (e.g., 8 drugs existed in source but were never deployed).

4. **Bump SW cache version:**
   Open `docs/sw.js` and increment the number in `const CACHE_NAME = 'medkitt-vNN';`
   (e.g., v50 → v51). This triggers the service worker update on users' devices.

5. **Stage, commit, and push:**
   Stage all changed files in BOTH `src/` and `docs/`, commit with a descriptive message, and push to `main`.

6. **Sync dev fork:**
   After pushing to main, sync the dev fork:
   ```bash
   cd ~/Desktop/medkitt-dev && git fetch upstream && git merge upstream/main --no-edit && git push origin main
   ```
   Then return to `~/Desktop/medkitt`.

7. **Verify deployment:**
   Run `gh api repos/kittechsix-blip/medkitt/pages/builds --jq '.[0] | {status, created_at}'` to confirm GitHub Pages built successfully.

8. **Update MEMORY.md:**
   Update the SW cache version in `~/.claude/projects/-Users-kittechsix/memory/MEMORY.md`.

## Important Notes

- NEVER push without checking `git status docs/` first — forgotten compiled files are silent production bugs
- NEVER commit compiled tree files without validating exports first — broken compilations silently rewrite export formats (this has caused 4 consults to break in production before)
- ALWAYS bump the SW cache version on every deploy — this triggers auto-updates on users' phones
- ALWAYS sync dev fork after deploying to main — prevents drift between the two repos
- The SW uses network-first for JS/HTML/CSS + auto-reload via `client.navigate()` on upgrade
- If a user reports stale content, send them to: `https://kittechsix-blip.github.io/medkitt/clear.html`
