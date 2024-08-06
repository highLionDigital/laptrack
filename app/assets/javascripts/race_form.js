function initializeRaceForm() {
  const raceForm = document.getElementById('race-form');
  if (raceForm) {
    const circuitSelect = document.getElementById('circuit-select');
    const trackSelect = document.getElementById('track-select');

    circuitSelect.addEventListener('change', function(event) {
      const circuitId = event.target.value;

      if (circuitId) {
        fetch(`/circuits/${circuitId}/tracks.json`)
          .then(response => {
            if (!response.ok) {
              throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
          })
          .then(tracks => {
            console.log('Tracks received:', tracks);
            trackSelect.innerHTML = '<option value="">Select a Track</option>';
            tracks.forEach(track => {
              const option = new Option(track.name, track.id);
              trackSelect.add(option);
            });
            trackSelect.disabled = false;
          })
          .catch(error => {
            console.error('There was a problem fetching the tracks:', error);
            trackSelect.innerHTML = '<option value="">Error loading tracks</option>';
            trackSelect.disabled = true;
          });
      } else {
        trackSelect.innerHTML = '<option value="">Select a Track</option>';
        trackSelect.disabled = true;
      }
    });
  }
}

// Listen for DOMContentLoaded event
document.addEventListener('DOMContentLoaded', initializeRaceForm);

// Listen for Turbolinks load event
document.addEventListener('turbolinks:load', initializeRaceForm);
