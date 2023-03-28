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
	}else {
		goToPage('vision-namd-01')
	}
}