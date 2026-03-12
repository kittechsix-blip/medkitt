// MedKitt — Lab Interpreter Component
// Panel-based lab entry with structured fields

import { LAB_PANELS, PANEL_CATEGORIES } from '../data/lab-panels.js';
import { router } from '../services/router.js';

/** Current state */
let selectedPanel = null;
let labValues = {};

/**
 * Render the Lab Interpreter view
 * @param {HTMLElement} container - The main content container
 */
export function renderLabInterpreter(container) {
  container.innerHTML = '';
  selectedPanel = null;
  labValues = {};

  // Header
  const header = document.createElement('div');
  header.className = 'lab-interpreter-header';
  header.innerHTML = `
    <button class="back-btn" aria-label="Go back">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M19 12H5M12 19l-7-7 7-7"/>
      </svg>
    </button>
    <h1>Lab Interpreter</h1>
    <div class="header-spacer"></div>
  `;
  header.querySelector('.back-btn').addEventListener('click', () => {
    if (selectedPanel) {
      // Go back to panel selection
      renderLabInterpreter(container);
    } else {
      router.navigate('/');
    }
  });
  container.appendChild(header);

  // Main content area
  const content = document.createElement('div');
  content.className = 'lab-content';
  content.id = 'lab-content';
  container.appendChild(content);

  // Render panel selection
  renderPanelSelection(content);

  // Disclaimer
  const disclaimer = document.createElement('div');
  disclaimer.className = 'lab-disclaimer';
  disclaimer.innerHTML = `
    <p><strong>Clinical Decision Support</strong> — Not a diagnosis. All outputs must be verified by a licensed clinician. Reference ranges may vary by lab.</p>
  `;
  container.appendChild(disclaimer);
}

/**
 * Render panel selection grid
 */
function renderPanelSelection(container) {
  container.innerHTML = '';

  const intro = document.createElement('p');
  intro.className = 'lab-intro';
  intro.textContent = 'Select a lab panel to interpret:';
  container.appendChild(intro);

  for (const category of PANEL_CATEGORIES) {
    const section = document.createElement('div');
    section.className = 'panel-category';

    const categoryHeader = document.createElement('h3');
    categoryHeader.className = 'panel-category-header';
    categoryHeader.textContent = category.name;
    section.appendChild(categoryHeader);

    const grid = document.createElement('div');
    grid.className = 'panel-grid';

    for (const panelId of category.panels) {
      const panel = LAB_PANELS[panelId];
      if (!panel) continue;

      const card = document.createElement('button');
      card.className = 'panel-card';
      card.innerHTML = `
        <span class="panel-icon">${panel.icon}</span>
        <span class="panel-name">${panel.name}</span>
        <span class="panel-count">${panel.labs.length} values</span>
      `;
      card.addEventListener('click', () => {
        selectedPanel = panel;
        labValues = {};
        renderPanelEntry(container, panel);
      });
      grid.appendChild(card);
    }

    section.appendChild(grid);
    container.appendChild(section);
  }
}

/**
 * Render panel entry form
 */
function renderPanelEntry(container, panel) {
  container.innerHTML = '';

  // Panel header
  const panelHeader = document.createElement('div');
  panelHeader.className = 'panel-entry-header';
  panelHeader.innerHTML = `
    <span class="panel-icon-large">${panel.icon}</span>
    <h2>${panel.name}</h2>
  `;
  container.appendChild(panelHeader);

  // Lab fields
  const form = document.createElement('div');
  form.className = 'lab-form';

  for (const lab of panel.labs) {
    const field = document.createElement('div');
    field.className = 'lab-field';

    if (lab.isQualitative) {
      // Qualitative (pos/neg) field
      field.innerHTML = `
        <label class="lab-label">${lab.name}</label>
        <div class="lab-input-row">
          <div class="qualitative-toggle" data-lab-id="${lab.id}">
            <button type="button" class="qual-btn" data-value="">—</button>
            <button type="button" class="qual-btn qual-neg" data-value="negative">NEG</button>
            <button type="button" class="qual-btn qual-pos" data-value="positive">POS</button>
          </div>
        </div>
      `;
      const toggle = field.querySelector('.qualitative-toggle');
      toggle.querySelectorAll('.qual-btn').forEach(btn => {
        btn.addEventListener('click', () => {
          toggle.querySelectorAll('.qual-btn').forEach(b => b.classList.remove('active'));
          btn.classList.add('active');
          labValues[lab.id] = btn.dataset.value || null;
        });
      });
    } else {
      // Quantitative field
      const rangeText = `${lab.low}–${lab.high}`;
      field.innerHTML = `
        <label class="lab-label">${lab.name}</label>
        <div class="lab-input-row">
          <input
            type="number"
            step="any"
            class="lab-input"
            id="lab-${lab.id}"
            placeholder="${rangeText}"
            inputmode="decimal"
          >
          <span class="lab-unit">${lab.unit}</span>
        </div>
        <span class="lab-range">${rangeText} ${lab.unit}</span>
      `;
      const input = field.querySelector('input');
      input.addEventListener('input', () => {
        const value = parseFloat(input.value);
        labValues[lab.id] = isNaN(value) ? null : value;
        updateFieldStatus(field, lab, value);
      });
    }

    form.appendChild(field);
  }

  container.appendChild(form);

  // Action buttons
  const actions = document.createElement('div');
  actions.className = 'lab-actions';
  actions.innerHTML = `
    <button class="btn-secondary" id="clear-btn">Clear All</button>
    <button class="btn-primary" id="evaluate-btn">Evaluate</button>
  `;
  container.appendChild(actions);

  // Results area (hidden initially)
  const resultsArea = document.createElement('div');
  resultsArea.className = 'lab-results-area';
  resultsArea.id = 'lab-results';
  resultsArea.style.display = 'none';
  container.appendChild(resultsArea);

  // Event handlers
  document.getElementById('clear-btn').addEventListener('click', () => {
    labValues = {};
    form.querySelectorAll('input').forEach(input => {
      input.value = '';
      input.closest('.lab-field').classList.remove('low', 'high', 'critical-low', 'critical-high', 'normal');
    });
    form.querySelectorAll('.qual-btn').forEach(btn => btn.classList.remove('active'));
    resultsArea.style.display = 'none';
  });

  document.getElementById('evaluate-btn').addEventListener('click', () => {
    evaluatePanel(panel, resultsArea);
  });
}

/**
 * Update field visual status based on value
 */
function updateFieldStatus(field, lab, value) {
  field.classList.remove('low', 'high', 'critical-low', 'critical-high', 'normal');

  if (isNaN(value) || value === null || value === undefined) return;

  if (lab.criticalLow !== undefined && value < lab.criticalLow) {
    field.classList.add('critical-low');
  } else if (lab.criticalHigh !== undefined && value > lab.criticalHigh) {
    field.classList.add('critical-high');
  } else if (value < lab.low) {
    field.classList.add('low');
  } else if (value > lab.high) {
    field.classList.add('high');
  } else {
    field.classList.add('normal');
  }
}

/**
 * Evaluate panel and display results
 */
function evaluatePanel(panel, resultsArea) {
  const results = [];
  const abnormals = [];
  const criticals = [];

  for (const lab of panel.labs) {
    const value = labValues[lab.id];
    if (value === null || value === undefined) continue;

    if (lab.isQualitative) {
      // Qualitative result
      if (value === 'positive') {
        abnormals.push({
          name: lab.name,
          value: 'POSITIVE',
          status: 'abnormal',
          message: 'Positive'
        });
      }
    } else {
      // Quantitative result
      let status = 'normal';
      let severity = 'normal';
      let message = `Normal (${lab.low}–${lab.high})`;

      if (lab.criticalLow !== undefined && value < lab.criticalLow) {
        status = 'critical-low';
        severity = 'critical';
        message = `CRITICAL LOW (<${lab.criticalLow})`;
        criticals.push({ name: lab.name, value, unit: lab.unit, status, message });
      } else if (lab.criticalHigh !== undefined && value > lab.criticalHigh) {
        status = 'critical-high';
        severity = 'critical';
        message = `CRITICAL HIGH (>${lab.criticalHigh})`;
        criticals.push({ name: lab.name, value, unit: lab.unit, status, message });
      } else if (value < lab.low) {
        status = 'low';
        severity = 'abnormal';
        message = `Low (${lab.low}–${lab.high})`;
        abnormals.push({ name: lab.name, value, unit: lab.unit, status, message });
      } else if (value > lab.high) {
        status = 'high';
        severity = 'abnormal';
        message = `High (${lab.low}–${lab.high})`;
        abnormals.push({ name: lab.name, value, unit: lab.unit, status, message });
      }

      results.push({
        name: lab.name,
        value,
        unit: lab.unit,
        status,
        severity,
        message
      });
    }
  }

  // Render results
  resultsArea.innerHTML = '';
  resultsArea.style.display = 'block';

  if (results.length === 0) {
    resultsArea.innerHTML = '<p class="no-results">No values entered. Enter lab values above and tap Evaluate.</p>';
    return;
  }

  // Critical values alert
  if (criticals.length > 0) {
    const criticalAlert = document.createElement('div');
    criticalAlert.className = 'critical-alert';
    criticalAlert.innerHTML = `
      <div class="alert-header">⚠️ CRITICAL VALUES</div>
      ${criticals.map(c => `
        <div class="critical-item">
          <strong>${c.name}:</strong> ${c.value} ${c.unit} — ${c.message}
        </div>
      `).join('')}
    `;
    resultsArea.appendChild(criticalAlert);
  }

  // Abnormal values
  if (abnormals.length > 0) {
    const abnormalSection = document.createElement('div');
    abnormalSection.className = 'results-section abnormal-section';
    abnormalSection.innerHTML = `
      <h3>Abnormal Values</h3>
      <div class="results-grid">
        ${abnormals.map(a => `
          <div class="result-row ${a.status}">
            <span class="result-name">${a.name}</span>
            <span class="result-value">${a.value}${a.unit ? ' ' + a.unit : ''}</span>
            <span class="result-message">${a.message}</span>
          </div>
        `).join('')}
      </div>
    `;
    resultsArea.appendChild(abnormalSection);
  }

  // All values summary
  const allSection = document.createElement('div');
  allSection.className = 'results-section';
  allSection.innerHTML = `
    <h3>All Results</h3>
    <div class="results-grid">
      ${results.map(r => `
        <div class="result-row ${r.status}">
          <span class="result-name">${r.name}</span>
          <span class="result-value">${r.value} ${r.unit}</span>
          <span class="result-indicator ${r.status}"></span>
        </div>
      `).join('')}
    </div>
  `;
  resultsArea.appendChild(allSection);

  // AI interpretation placeholder
  const aiSection = document.createElement('div');
  aiSection.className = 'ai-interpretation';
  aiSection.innerHTML = `
    <h3>🤖 AI Interpretation</h3>
    <p class="ai-coming-soon">AI-powered clinical interpretation coming soon. This will analyze patterns, suggest differential diagnoses, and link to relevant consults.</p>
  `;
  resultsArea.appendChild(aiSection);

  // Scroll to results
  resultsArea.scrollIntoView({ behavior: 'smooth' });
}
