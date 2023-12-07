import consumer from "channels/consumer"

consumer.subscriptions.create("UpdateScoresChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected")
    this.startUpdating();
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected")
    this.stopUpdating();
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Data", data)
    const parsedData = JSON.parse(data);
    if (location.href = "/") {
      console.log(document.getElementById(`${parsedData.year}-turing`))
      document.getElementById(`${parsedData.year}-turing`).textContent = parsedData.turing;
      document.getElementById(`${parsedData.year}-winston`).textContent = parsedData.winston;
      document.getElementById(`${parsedData.year}-sharman`).textContent = parsedData.sharman;
      document.getElementById(`${parsedData.year}-ennis`).textContent = parsedData.ennis;
    }
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
