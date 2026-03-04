/**
 * MedKitt Consult Trees Index
 * Export all consult trees for use in the application
 */
export { neurosyphilisConsult } from './neurosyphilis';
export { peTreatmentConsult } from './pe-treatment';
export { pneumothoraxConsult } from './pneumothorax';
export { echoViewsConsult } from './echo-views';
/**
 * Registry of all available consult trees
 */
export const consultRegistry = {
    neurosyphilis: () => import('./neurosyphilis'),
    'pe-treatment': () => import('./pe-treatment'),
    pneumothorax: () => import('./pneumothorax'),
    'echo-views': () => import('./echo-views'),
};
/**
 * Get a consult tree by ID
 */
export async function getConsult(consultId) {
    const loader = consultRegistry[consultId];
    if (!loader)
        return null;
    try {
        const module = await loader();
        return module.default;
    }
    catch (error) {
        console.error(`Failed to load consult: ${consultId}`, error);
        return null;
    }
}
/**
 * List all available consults
 */
export function listConsults() {
    // This would normally dynamically load, but for now return static list
    return [
        {
            id: 'neurosyphilis',
            title: 'Neurosyphilis Evaluation & Treatment',
            category: 'Infectious Disease'
        },
        {
            id: 'pe-treatment',
            title: 'Pulmonary Embolism Treatment',
            category: 'Emergency Medicine / Cardiology'
        },
        {
            id: 'pneumothorax',
            title: 'Pneumothorax Evaluation with POCUS',
            category: 'Emergency Medicine / Critical Care Ultrasound'
        },
        {
            id: 'echo-views',
            title: 'Basic Emergency Echocardiography Views',
            category: 'Emergency Medicine / Critical Care Ultrasound'
        }
    ];
}
