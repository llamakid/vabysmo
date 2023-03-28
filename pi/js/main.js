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

// function backToPage() {
// 	let page = sessionStorage.getItem("lastPage");
// 	goToSlide(page);
// }

function backToPage() {
	let page = sessionStorage.getItem("lastPage");
	window.location.href = "../" + page + ".html";
}

function goToSlide(slideId) {
	console.log(`Going to ${slideId}`)
	com.veeva.clm.gotoSlide(slideId + ".zip", "");
}