function replaceImg(img) {
	document.getElementById("namd_week_0_img").classList.add("hidden");
	document.getElementById("namd_week_16_img").classList.add("hidden");
	document.getElementById("namd_week_24_img").classList.add("hidden");
	document.getElementById("namd_week_48_img").classList.add("hidden");
	
	document.getElementById(img).classList.remove("hidden");

}