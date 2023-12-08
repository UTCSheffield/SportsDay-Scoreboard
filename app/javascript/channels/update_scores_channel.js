import consumer from "channels/consumer"

consumer.subscriptions.create("UpdateScoresChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected")
    //this.startUpdating();
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected")
    //this.stopUpdating();
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    document.getElementById(`${data.year}-turing`).textContent = data.turing;
    document.getElementById(`${data.year}-winston`).textContent = data.winston;
    document.getElementById(`${data.year}-sharman`).textContent = data.sharman;
    document.getElementById(`${data.year}-ennis`).textContent = data.ennis;
  },
  updateData() {
    this.perform("update_data");
  },
  startUpdating() {
    // Call updateData every second
    this.updateInterval = setInterval(() => {
      this.updateData();
    }, 1000);
  },

  stopUpdating() {
    // Stop calling updateData
    clearInterval(this.updateInterval);
  },
});
