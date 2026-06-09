// script.js

// Function to generate the carousel images dynamically
function loadGallery(containerId, folder, prefix, startIndex, endIndex) {
    const container = document.getElementById(containerId);
    
    // If the container isn't on the current page, stop running.
    if (!container) return;

    for (let i = startIndex; i <= endIndex; i++) {
        const img = document.createElement('img');
        
        // Construct the file path (e.g., images/lawn/lawn1.webp)
        img.src = `images/${folder}/${prefix}${i}.webp`;
        img.alt = `H S Garden Maintenance - ${folder} ${i}`;
        img.className = 'carousel-img';
        
        // If an image number is skipped or missing, hide the broken icon smoothly
        img.onerror = function() {
            this.style.display = 'none';
        };

        container.appendChild(img);
    }
}

// Wait for the web page to fully load before running the script
document.addEventListener('DOMContentLoaded', () => {
    
    // Loads the Lawn images: images/lawn/lawn1.webp to lawn53.webp
    loadGallery('lawn-gallery', 'lawn', 'lawn', 1, 53);

    // Loads the Hedge images: images/hedge/hedge1.webp to hedge28.webp
    loadGallery('hedge-gallery', 'hedge', 'hedge', 1, 28);

    // Loads the Logs images: images/logs/logs11.webp to logs17.webp 
    // (Note: Using 'logs' as prefix based on your brief)
    loadGallery('logs-gallery', 'logs', 'logs', 1, 17);

    // Placeholder for Tree Work (Uncomment and adjust numbers when you have the photos)
    // loadGallery('tree-gallery', 'treework', 'tree', 1, 10);
});
