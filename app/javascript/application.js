// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// Monitor and adjust font size based on content lengths of the leading form and year
(() => {
    const leadingForm = document.getElementById('leading-form-text');
    const leadingYear = document.getElementById('leading-year-text');

    if (!leadingForm || !leadingYear) {
        console.error("Error: Required elements 'leading-form-text' or 'leading-year-text' not found.");
        return;
    }

    const adjustFontSize = () => {
        // Calculate the combined length of text content
        const totalLength = leadingForm.textContent.length + leadingYear.textContent.length;

        // Adjust font size based on the total length
        let fontSize;
        if (totalLength < 45) {
            fontSize = '4vw';
        } else if (totalLength <= 62) {
            fontSize = '3vw';
        } else {
            fontSize = '2vw';
        }

        // Apply the calculated font size
        leadingForm.style.fontSize = fontSize;
        leadingYear.style.fontSize = fontSize;
    };

    // Create a MutationObserver to detect changes in the elements
    const observer = new MutationObserver(() => adjustFontSize());

    // Observe changes in child elements and text content
    const observerConfig = { childList: true, characterData: true, subtree: true };
    observer.observe(leadingForm, observerConfig);
    observer.observe(leadingYear, observerConfig);

    adjustFontSize();
})();
