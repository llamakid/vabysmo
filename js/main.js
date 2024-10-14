let idleTime = 0;
let idleInterval;
// const screensaverTimeout = 120000; // 2 minutes
const screensaverTimeout = 20000; // 20 seconds
const screensaverVideo = document.getElementById('screensaver-video');

// Reset idle timer on user activity
function resetIdleTimer() {
	idleTime = 0;
	if (screensaverVideo.style.display === 'block') {
	  // Exit fullscreen and stop video
	  screensaverVideo.style.display = 'none';
	//   document.exitFullscreen();
	  screensaverVideo.pause();
	}
  }

  // Track user activity
  window.onload = function() {
	document.onclick = resetIdleTimer;

	idleInterval = setInterval(function() {
	  idleTime += 1000;
	  if (idleTime >= screensaverTimeout) {
		// Activate screensaver (play video in fullscreen)
		screensaverVideo.style.display = 'block';
		// screensaverVideo.requestFullscreen();
		screensaverVideo.play();
	  }
	}, 1000); // check every second
  };


function showPopup(popup) {
	if(isActive === false) {
		document.getElementById(popup).style.display = "block";
		isActive = true;
	}
}

function hidePopup(popup) {
	if(isActive === true) {
		document.getElementById(popup).style.display = "none";
		isActive = false;
	}
}

function showButtonPopup(popup) {
	if(isActiveButton === false) {
		document.getElementById(popup).style.display = "block";
		isActiveButton = true;
	}
}

function hideButtonPopup(popup) {
	if(isActiveButton === true) {
		document.getElementById(popup).style.display = "none";
		isActiveButton = false;
	}
}

function showISIPopup(popup) {
	document.getElementById(popup).classList.remove("hidden");
}

function hideISIPopup(popup) {
	document.getElementById(popup).classList.add("hidden");
}

function setLastPage(setPage) {
	sessionStorage.setItem("lastPage", setPage);
}

function backToPage() {
	let page = sessionStorage.getItem("lastPage");
	window.location.href = "../" + page + ".html";
}

function goToPage(page) {
	console.log("Going to page: " + page);
	if(page === "prescribing-info") {
		window.location.href = "pi/index.html";
	}else {
		window.location.href = page + ".html";
	}
	
}

function goToDryingIndication(indication) {
	if(indication === 'dme') {
		goToPage('drying-dme-01')
	}else if(indication === 'namd') {
		goToPage('drying-namd-01')
	}else if(indication === 'rvo') {
		goToPage('drying-rvo-01')
	}else {
		goToPage('drying-namd-01')
	}
}

function goToDurabilityIndication(indication) {
	if(indication === 'dme') {
		goToPage('durability-dme-01')
	}else if(indication === 'namd') {
		goToPage('durability-namd-01')
	}else {
		goToPage('durability-namd-01')
	}
}

function goToVisionIndication(indication) {
	if(indication === 'dme') {
		goToPage('vision-dme-01')
	}else if(indication === 'namd') {
		goToPage('vision-namd-01')
	}else if(indication === 'rvo') {
		goToPage('vision-rvo-01')
	}else {
		goToPage('vision-namd-01')
	}
}