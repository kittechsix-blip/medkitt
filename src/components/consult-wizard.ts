// MedKitt — Consult Wizard (Mayo/Stroke MD Pattern)
// Step-by-step clinical decision support with minimal UI
// Based on JMIR 2025 design guidelines

import { router } from '../services/router.js';

// -------------------------------------------------------------------
// Types
// -------------------------------------------------------------------

export interface WizardOption {
  id: string;
  label: string;
  shortLabel?: string;
  variant?: 'default' | 'urgent' | 'safe' | 'warning';
  nextStep?: string;
  isTerminal?: boolean;
  info?: string;
}

export interface WizardStep {
  id: string;
  title: string;
  question: string;
  subtitle?: string;
  options: WizardOption[];
  info?: string;
}

export interface TerminalStep {
  title: string;
  summary: string;
  actions: string[];
  returnPrecautions?: string[];
}

export interface ConsultWizardData {
  id: string;
  name: string;
  category: string;
  accentColor?: string;
  steps: WizardStep[];
  terminalSteps: Record<string, TerminalStep>;
}

interface PathEntry {
  stepId: string;
  stepTitle: string;
  choiceLabel: string;
}

// -------------------------------------------------------------------
// State
// -------------------------------------------------------------------

let currentConsult: ConsultWizardData | null = null;
let currentStepId: string = '';
let path: PathEntry[] = [];
let isComplete: boolean = false;
let terminalId: string | null = null;
let expandedInfo: string | null = null;

// -------------------------------------------------------------------
// Colors (Burnt Umber Brand)
// -------------------------------------------------------------------

const COLORS = {
  brand: '#8B4513',
  brandLight: '#A0522D',
  brandDark: '#6B3410',
  brandBg: '#FDF5F0',
  danger: '#DC2626',
  warning: '#D97706',
  success: '#059669',
  textPrimary: '#1A1A2E',
  textSecondary: '#4A4A5A',
  textMuted: '#9A9AB0',
  border: '#E5E7EB',
  surface: '#F8F9FA',
  bg: '#FFFFFF',
};

// -------------------------------------------------------------------
// Main Render Function
// -------------------------------------------------------------------

export function renderConsultWizard(container: HTMLElement, consultData: ConsultWizardData): void {
  currentConsult = consultData;
  currentStepId = consultData.steps[0].id;
  path = [];
  isComplete = false;
  terminalId = null;
  expandedInfo = null;

  render(container);
}

function render(container: HTMLElement): void {
  if (!currentConsult) return;

  container.innerHTML = '';
  container.className = 'consult-wizard';

  if (isComplete && terminalId) {
    renderCompletionScreen(container);
  } else {
    renderStepScreen(container);
  }
}

// -------------------------------------------------------------------
// Step Screen
// -------------------------------------------------------------------

function renderStepScreen(container: HTMLElement): void {
  if (!currentConsult) return;

  const currentStep = currentConsult.steps.find(s => s.id === currentStepId);
  if (!currentStep) return;

  const stepIndex = currentConsult.steps.findIndex(s => s.id === currentStepId);
  const progress = ((stepIndex + 1) / currentConsult.steps.length) * 100;
  const accentColor = currentConsult.accentColor || COLORS.brand;

  // Header
  const header = document.createElement('div');
  header.className = 'cw-header';
  header.innerHTML = `
    <button class="cw-back-btn" aria-label="Go back">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="${accentColor}" stroke-width="2">
        <path d="M15 18l-6-6 6-6"/>
      </svg>
    </button>
    <h1 class="cw-title" style="color: ${accentColor}">${currentConsult.name}</h1>
    <div class="cw-header-spacer"></div>
  `;
  container.appendChild(header);

  // Back button handler
  header.querySelector('.cw-back-btn')?.addEventListener('click', handleBack);

  // Progress bar
  const progressContainer = document.createElement('div');
  progressContainer.className = 'cw-progress';
  progressContainer.innerHTML = `
    <div class="cw-progress-track">
      <div class="cw-progress-fill" style="width: ${progress}%; background: ${accentColor}"></div>
    </div>
    <span class="cw-progress-text">Step ${stepIndex + 1} of ${currentConsult.steps.length}</span>
  `;
  container.appendChild(progressContainer);

  // Running summary (path chips)
  if (path.length > 0) {
    const summary = document.createElement('div');
    summary.className = 'cw-running-summary';
    summary.style.background = COLORS.brandBg;
    summary.innerHTML = path.map(entry =>
      `<span class="cw-chip" style="background: ${accentColor}">${entry.choiceLabel}</span>`
    ).join('');
    container.appendChild(summary);
  }

  // Main content
  const content = document.createElement('div');
  content.className = 'cw-content';

  // Step header
  const stepHeader = document.createElement('div');
  stepHeader.className = 'cw-step-header';
  stepHeader.innerHTML = `
    <h2 class="cw-step-title">${currentStep.title}</h2>
    ${currentStep.subtitle ? `<p class="cw-step-subtitle">${currentStep.subtitle}</p>` : ''}
  `;
  content.appendChild(stepHeader);

  // Question card
  const questionCard = document.createElement('div');
  questionCard.className = 'cw-question-card';
  questionCard.innerHTML = `
    <p class="cw-question-text">${currentStep.question}</p>
    ${currentStep.info ? `
      <button class="cw-info-toggle" data-info-id="${currentStep.id}">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="${accentColor}" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <path d="M12 16v-4M12 8h.01"/>
        </svg>
        <span style="color: ${accentColor}">${expandedInfo === currentStep.id ? 'Hide details' : 'Learn more'}</span>
      </button>
      ${expandedInfo === currentStep.id ? `
        <div class="cw-info-content">
          <p>${currentStep.info}</p>
        </div>
      ` : ''}
    ` : ''}
  `;
  content.appendChild(questionCard);

  // Info toggle handler
  questionCard.querySelector('.cw-info-toggle')?.addEventListener('click', () => {
    expandedInfo = expandedInfo === currentStep.id ? null : currentStep.id;
    render(container);
  });

  // Options
  const optionsContainer = document.createElement('div');
  optionsContainer.className = 'cw-options';

  currentStep.options.forEach(option => {
    const btn = document.createElement('button');
    btn.className = `cw-option cw-option-${option.variant || 'default'}`;
    btn.innerHTML = `
      <span class="cw-option-label">${option.label}</span>
      ${option.info ? `
        <button class="cw-option-info" data-option-info="${option.id}" aria-label="More info">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="${COLORS.textMuted}" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <path d="M12 16v-4M12 8h.01"/>
          </svg>
        </button>
      ` : ''}
    `;

    btn.addEventListener('click', (e) => {
      // Don't trigger if clicking the info button
      if ((e.target as HTMLElement).closest('.cw-option-info')) return;
      handleOptionSelect(option, container);
    });

    optionsContainer.appendChild(btn);

    // Option info expansion
    if (expandedInfo === option.id && option.info) {
      const infoDiv = document.createElement('div');
      infoDiv.className = 'cw-option-info-content';
      infoDiv.innerHTML = `<p>${option.info}</p>`;
      optionsContainer.appendChild(infoDiv);
    }
  });

  // Option info handlers
  optionsContainer.querySelectorAll('.cw-option-info').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const optionId = (btn as HTMLElement).dataset.optionInfo;
      if (optionId) {
        expandedInfo = expandedInfo === optionId ? null : optionId;
        render(container);
      }
    });
  });

  content.appendChild(optionsContainer);
  container.appendChild(content);

  // Footer disclaimer
  const footer = document.createElement('div');
  footer.className = 'cw-footer';
  footer.innerHTML = `
    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="${COLORS.textMuted}" stroke-width="2">
      <circle cx="12" cy="12" r="10"/>
      <path d="M12 16v-4M12 8h.01"/>
    </svg>
    <span>Clinical decision support only - NOT FDA cleared</span>
  `;
  container.appendChild(footer);
}

// -------------------------------------------------------------------
// Completion Screen
// -------------------------------------------------------------------

function renderCompletionScreen(container: HTMLElement): void {
  if (!currentConsult || !terminalId) return;

  const terminal = currentConsult.terminalSteps[terminalId];
  if (!terminal) return;

  const accentColor = currentConsult.accentColor || COLORS.brand;

  // Header
  const header = document.createElement('div');
  header.className = 'cw-header';
  header.innerHTML = `
    <button class="cw-back-btn" aria-label="Go back">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="${accentColor}" stroke-width="2">
        <path d="M15 18l-6-6 6-6"/>
      </svg>
    </button>
    <h1 class="cw-title" style="color: ${accentColor}">${currentConsult.name}</h1>
    <button class="cw-restart-btn" aria-label="Restart">
      <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="${accentColor}" stroke-width="2">
        <path d="M1 4v6h6M23 20v-6h-6"/>
        <path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"/>
      </svg>
    </button>
  `;
  container.appendChild(header);

  header.querySelector('.cw-back-btn')?.addEventListener('click', handleBack);
  header.querySelector('.cw-restart-btn')?.addEventListener('click', () => handleRestart(container));

  // Content
  const content = document.createElement('div');
  content.className = 'cw-content cw-completion';

  // Summary banner
  const banner = document.createElement('div');
  banner.className = 'cw-summary-banner';
  banner.style.background = accentColor;
  banner.innerHTML = `
    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#FFF" stroke-width="2">
      <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
      <polyline points="22 4 12 14.01 9 11.01"/>
    </svg>
    <span class="cw-summary-title">${terminal.title}</span>
  `;
  content.appendChild(banner);

  // Path taken
  const pathSection = document.createElement('div');
  pathSection.className = 'cw-section';
  pathSection.innerHTML = `
    <h3 class="cw-section-label">PATH TAKEN</h3>
    <div class="cw-path-container">
      ${path.map((entry, i) => `
        <div class="cw-path-item">
          <div class="cw-path-dot" style="background: ${accentColor}"></div>
          <div class="cw-path-content">
            <span class="cw-path-step">${entry.stepTitle}</span>
            <span class="cw-path-choice">${entry.choiceLabel}</span>
          </div>
          ${i < path.length - 1 ? `<div class="cw-path-line" style="background: ${accentColor}"></div>` : ''}
        </div>
      `).join('')}
    </div>
  `;
  content.appendChild(pathSection);

  // Summary
  const summarySection = document.createElement('div');
  summarySection.className = 'cw-section';
  summarySection.innerHTML = `
    <h3 class="cw-section-label">SUMMARY</h3>
    <p class="cw-summary-text">${terminal.summary}</p>
  `;
  content.appendChild(summarySection);

  // Actions
  const actionsSection = document.createElement('div');
  actionsSection.className = 'cw-section';
  actionsSection.innerHTML = `
    <h3 class="cw-section-label">NEXT ACTIONS</h3>
    ${terminal.actions.map(action => `
      <div class="cw-action-item">
        <div class="cw-action-bullet" style="background: ${accentColor}"></div>
        <span>${action}</span>
      </div>
    `).join('')}
  `;
  content.appendChild(actionsSection);

  // Return precautions
  if (terminal.returnPrecautions?.length) {
    const precautionsSection = document.createElement('div');
    precautionsSection.className = 'cw-section';
    precautionsSection.innerHTML = `
      <h3 class="cw-section-label">RETURN PRECAUTIONS</h3>
      ${terminal.returnPrecautions.map(precaution => `
        <div class="cw-precaution-item">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="${COLORS.warning}" stroke-width="2">
            <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/>
            <line x1="12" y1="9" x2="12" y2="13"/>
            <line x1="12" y1="17" x2="12.01" y2="17"/>
          </svg>
          <span>${precaution}</span>
        </div>
      `).join('')}
    `;
    content.appendChild(precautionsSection);
  }

  // Share button
  const shareBtn = document.createElement('button');
  shareBtn.className = 'cw-share-btn';
  shareBtn.style.background = accentColor;
  shareBtn.innerHTML = `
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#FFF" stroke-width="2">
      <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
      <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
    </svg>
    <span>Copy to EMR</span>
  `;
  shareBtn.addEventListener('click', () => copyToClipboard(terminal));
  content.appendChild(shareBtn);

  container.appendChild(content);
}

// -------------------------------------------------------------------
// Event Handlers
// -------------------------------------------------------------------

function handleOptionSelect(option: WizardOption, container: HTMLElement): void {
  if (!currentConsult) return;

  const currentStep = currentConsult.steps.find(s => s.id === currentStepId);
  if (!currentStep) return;

  // Add to path
  path.push({
    stepId: currentStepId,
    stepTitle: currentStep.title,
    choiceLabel: option.shortLabel || option.label,
  });

  if (option.isTerminal) {
    terminalId = option.id;
    isComplete = true;
  } else if (option.nextStep) {
    currentStepId = option.nextStep;
  }

  expandedInfo = null;
  render(container);
}

function handleBack(): void {
  if (path.length === 0) {
    // Exit to category view
    if (currentConsult) {
      router.navigate(`/category/${currentConsult.category}`);
    } else {
      router.navigate('/');
    }
    return;
  }

  const lastEntry = path.pop();
  if (lastEntry) {
    currentStepId = lastEntry.stepId;
  }
  isComplete = false;
  terminalId = null;
  expandedInfo = null;

  const container = document.querySelector('.consult-wizard') as HTMLElement;
  if (container) render(container);
}

function handleRestart(container: HTMLElement): void {
  if (!currentConsult) return;
  currentStepId = currentConsult.steps[0].id;
  path = [];
  isComplete = false;
  terminalId = null;
  expandedInfo = null;
  render(container);
}

function copyToClipboard(terminal: TerminalStep): void {
  if (!currentConsult) return;

  const text = `
${currentConsult.name} - ${terminal.title}

PATH: ${path.map(p => p.choiceLabel).join(' > ')}

SUMMARY:
${terminal.summary}

NEXT ACTIONS:
${terminal.actions.map(a => `- ${a}`).join('\n')}

${terminal.returnPrecautions ? `RETURN PRECAUTIONS:\n${terminal.returnPrecautions.map(p => `- ${p}`).join('\n')}` : ''}

Generated by MedKitt
  `.trim();

  navigator.clipboard.writeText(text).then(() => {
    const btn = document.querySelector('.cw-share-btn') as HTMLElement;
    if (btn) {
      const originalHTML = btn.innerHTML;
      btn.innerHTML = `
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#FFF" stroke-width="2">
          <polyline points="20 6 9 17 4 12"/>
        </svg>
        <span>Copied!</span>
      `;
      setTimeout(() => {
        btn.innerHTML = originalHTML;
      }, 2000);
    }
  });
}
