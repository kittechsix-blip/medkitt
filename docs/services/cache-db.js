// MedKitt — IndexedDB Cache Layer
// Stores Supabase data locally for offline access.
// Each data type gets its own object store with version tracking.
const DB_NAME = 'medkitt-cache';
const DB_VERSION = 1;
let dbPromise = null;
function openDB() {
    if (dbPromise)
        return dbPromise;
    dbPromise = new Promise((resolve, reject) => {
        const request = indexedDB.open(DB_NAME, DB_VERSION);
        request.onerror = () => reject(request.error);
        request.onsuccess = () => resolve(request.result);
        request.onupgradeneeded = (event) => {
            const db = event.target.result;
            if (!db.objectStoreNames.contains('drugs')) {
                db.createObjectStore('drugs', { keyPath: 'id' });
            }
            if (!db.objectStoreNames.contains('sync_meta')) {
                db.createObjectStore('sync_meta', { keyPath: 'key' });
            }
        };
    });
    return dbPromise;
}
/** Get all records from a store */
export async function cacheGetAll(storeName) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
        const tx = db.transaction(storeName, 'readonly');
        const request = tx.objectStore(storeName).getAll();
        request.onsuccess = () => resolve(request.result);
        request.onerror = () => reject(request.error);
    });
}
/** Replace all records in a store */
export async function cachePutAll(storeName, records) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
        const tx = db.transaction(storeName, 'readwrite');
        const store = tx.objectStore(storeName);
        store.clear();
        for (const record of records) {
            store.put(record);
        }
        tx.oncomplete = () => resolve();
        tx.onerror = () => reject(tx.error);
    });
}
/** Record last sync time for a data type */
export async function setLastSync(dataType) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
        const tx = db.transaction('sync_meta', 'readwrite');
        tx.objectStore('sync_meta').put({ key: dataType, timestamp: Date.now() });
        tx.oncomplete = () => resolve();
        tx.onerror = () => reject(tx.error);
    });
}
/** Get last sync time for a data type (null if never synced) */
export async function getLastSync(dataType) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
        const tx = db.transaction('sync_meta', 'readonly');
        const request = tx.objectStore('sync_meta').get(dataType);
        request.onsuccess = () => resolve(request.result?.timestamp ?? null);
        request.onerror = () => reject(request.error);
    });
}
