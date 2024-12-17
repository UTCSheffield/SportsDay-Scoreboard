import { Application } from "@hotwired/stimulus"
import ScoreboardResizeController from "controllers/scoreboardResize";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Update leading formand year group size
document.addEventListener("turbo:load", () => {
    application.register("scoreboard-resize", ScoreboardResizeController);
});

export { application }
