// MedKitt — Lab Interpreter Component
// Voice/text input for lab values with AI-powered interpretation

import { interpretLabs, LAB_REFERENCE_RANGES } from '../services/lab-parser.js';
import { router } from '../services/router.js';

/**
 * Render the Lab Interpreter view
 * @param {HTMLElement} container - The main content container
 */
export function renderLabInterpreter(container) {
  container.innerHTML = '';

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
  header.querySelector('.back-btn').addEventListener('click', () => router.navigate('/'));
  container.appendChild(header);

  // Input section
  const inputSection = document.createElement('div');
  inputSection.className = 'lab-input-section';
  inputSection.innerHTML = `
    <div class="input-instructions">
      <p>Enter lab values (e.g., "sodium 128, potassium 5.2, creatinine 2.1")</p>
    </div>
    <div class="lab-input-wrapper">
      <textarea
        id="lab-input"
        class="lab-textarea"
        placeholder="Paste or type labs here...&#10;&#10;Examples:&#10;Na 128, K 5.2, Cr 2.1&#10;Troponin 0.15&#10;Lactate 4.2"
        rows="5"
      ></textarea>
      <div class="input-actions">
        <button id="voice-btn" class="voice-btn" aria-label="Voice input">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 14c1.66 0 3-1.34 3-3V5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3z"/>
            <path d="M17 11c0 2.76-2.24 5-5 5s-5-2.24-5-5H5c0 3.53 2.61 6.43 6 6.92V21h2v-3.08c3.39-.49 6-3.39 6-6.92h-2z"/>
          </svg>
        </button>
        <button id="interpret-btn" class="interpret-btn">
          Interpret
        </button>
      </div>
    </div>
  `;
  container.appendChild(inputSection);

  // Results section (hidden initially)
  const resultsSection = document.createElement('div');
  resultsSection.className = 'lab-results-section';
  resultsSection.id = 'lab-results';
  resultsSection.style.display = 'none';
  container.appendChild(resultsSection);

  // Quick reference section
  const quickRef = document.createElement('details');
  quickRef.className = 'quick-reference';
  quickRef.innerHTML = `
    <summary>Supported Labs</summary>
    <div class="quick-ref-content">
      <div class="ref-category">
        <strong>BMP:</strong> Na, K, Cl, CO2/Bicarb, BUN, Cr, Glucose, Ca, Mg, Phos
      </div>
      <div class="ref-category">
        <strong>CBC:</strong> WBC, Hgb/Hemoglobin, Hct, Platelets
      </div>
      <div class="ref-category">
        <strong>LFTs:</strong> AST, ALT, Alk Phos, Bilirubin, Albumin
      </div>
      <div class="ref-category">
        <strong>Cardiac:</strong> Troponin, BNP, NT-proBNP
      </div>
      <div class="ref-category">
        <strong>Coags:</strong> PT, INR, PTT, Fibrinogen, D-dimer
      </div>
      <div class="ref-category">
        <strong>Other:</strong> Lactate, pH, pCO2, pO2, Lipase, TSH, A1c
      </div>
    </div>
  `;
  container.appendChild(quickRef);

  // Disclaimer
  const disclaimer = document.createElement('div');
  disclaimer.className = 'lab-disclaimer';
  disclaimer.innerHTML = `
    <p><strong>Clinical Decision Support</strong> - Not a diagnosis. All outputs must be verified by a licensed clinician. Reference ranges may vary by lab.</p>
  `;
  container.appendChild(disclaimer);

  // Event handlers
  const labInput = document.getElementById('lab-input');
  const interpretBtn = document.getElementById('interpret-btn');
  const voiceBtn = document.getElementById('voice-btn');

  interpretBtn.addEventListener('click', () => {
    const input = labInput.value.trim();
    if (input) {
      displayResults(input, resultsSection);
    }
  });

  // Voice input
  voiceBtn.addEventListener('click', () => {
    startVoiceInput(labInput, voiceBtn);
  });

  // Enter key to interpret
  labInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && e.metaKey) {
      e.preventDefault();
      interpretBtn.click();
    }
  });
}

/**
 * Start voice input using Web Speech API
 */
function startVoiceInput(textarea, button) {
  if (!('webkitSpeechRecognition' in window) && !('SpeechRecognition' in window)) {
    alert('Voice input is not supported in this browser. Try Chrome or Safari.');
    return;
  }

  const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
  const recognition = new SpeechRecognition();

  recognition.continuous = false;
  recognition.interimResults = true;
  recognition.lang = 'en-US';

  button.classList.add('listening');
  button.innerHTML = `
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" class="pulse">
      <circle cx="12" cy="12" r="8"/>
    </svg>
  `;

  recognition.onresult = (event) => {
    let transcript = '';
    for (let i = event.resultIndex; i < event.results.length; i++) {
      transcript += event.results[i][0].transcript;
    }
    textarea.value = transcript;
  };

  recognition.onerror = (event) => {
    console.error('Speech recognition error:', event.error);
    resetVoiceButton(button);
  };

  recognition.onend = () => {
    resetVoiceButton(button);
  };

  recognition.start();
}

function resetVoiceButton(button) {
  button.classList.remove('listening');
  button.innerHTML = `
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M12 14c1.66 0 3-1.34 3-3V5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3z"/>
      <path d="M17 11c0 2.76-2.24 5-5 5s-5-2.24-5-5H5c0 3.53 2.61 6.43 6 6.92V21h2v-3.08c3.39-.49 6-3.39 6-6.92h-2z"/>
    </svg>
  `;
}

/**
 * Display interpretation results
 */
function displayResults(input, container) {
  const { parsedLabs, interpretations, conditions } = interpretLabs(input);

  container.style.display = 'block';
  container.innerHTML = '';

  if (interpretations.length === 0) {
    container.innerHTML = `
      <div class="no-results">
        <p>No labs recognized. Try formats like "sodium 128" or "Na 128, K 5.2"</p>
      </div>
    `;
    return;
  }

  // Lab values table
  const labTable = document.createElement('div');
  labTable.className = 'lab-results-table';
  labTable.innerHTML = `<h3>Lab Values</h3>`;

  const table = document.createElement('div');
  table.className = 'lab-grid';

  for (const lab of interpretations) {
    const row = document.createElement('div');
    row.className = `lab-row ${lab.interpretation.severity}`;
    row.innerHTML = `
      <div class="lab-name">${lab.displayName}</div>
      <div class="lab-value">${lab.value}</div>
      <div class="lab-status ${lab.interpretation.status}">${lab.interpretation.message}</div>
    `;
    table.appendChild(row);
  }

  labTable.appendChild(table);
  container.appendChild(labTable);

  // Clinical conditions
  if (conditions.length > 0) {
    const conditionsSection = document.createElement('div');
    conditionsSection.className = 'clinical-conditions';
    conditionsSection.innerHTML = `<h3>Clinical Considerations</h3>`;

    for (const condition of conditions) {
      const card = document.createElement('div');
      card.className = `condition-card ${condition.severity}`;
      card.innerHTML = `
        <div class="condition-header">
          <span class="condition-name">${condition.condition}</span>
          <span class="condition-severity ${condition.severity}">${condition.severity.toUpperCase()}</span>
        </div>
        <div class="condition-guidance">${condition.guidance}</div>
        <div class="condition-actions">
          ${condition.consults.map(c => `
            <button class="action-btn consult-btn" data-type="consult" data-id="${c}">
              View ${formatConsultName(c)} Consult
            </button>
          `).join('')}
          ${condition.calculators.map(c => `
            <button class="action-btn calc-btn" data-type="calculator" data-id="${c}">
              Open ${formatConsultName(c)} Calculator
            </button>
          `).join('')}
        </div>
      `;
      conditionsSection.appendChild(card);
    }

    // Add click handlers for action buttons
    conditionsSection.querySelectorAll('.action-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        const type = btn.dataset.type;
        const id = btn.dataset.id;
        if (type === 'consult') {
          router.navigate(`/tree/${id}`);
        } else if (type === 'calculator') {
          router.navigate(`/calculator/${id}`);
        }
      });
    });

    container.appendChild(conditionsSection);
  }

  // Scroll to results
  container.scrollIntoView({ behavior: 'smooth' });
}

/**
 * Format consult name for display
 */
function formatConsultName(id) {
  return id.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}
