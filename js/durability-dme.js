function replaceImg(img) {
	document.getElementById("dme_case_1_week_0_img").classList.add("hidden");
	document.getElementById("dme_case_1_week_12_img").classList.add("hidden");
	document.getElementById("dme_case_1_week_32_img").classList.add("hidden");
	document.getElementById("dme_case_1_week_96_img").classList.add("hidden");
	document.getElementById("dme_case_2_week_0_img").classList.add("hidden");
	document.getElementById("dme_case_2_week_12_img").classList.add("hidden");
	document.getElementById("dme_case_2_week_44_img").classList.add("hidden");
	document.getElementById("dme_case_2_week_96_img").classList.add("hidden");
	
	document.getElementById(img).classList.remove("hidden");

}

function swapPatientCase(patientCase) {
	if(patientCase === "1") {
		document.getElementById("dme_case_1_week_0_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_12_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_32_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_96_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_0_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_12_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_44_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_96_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_0_btn").classList.add("hidden");
		document.getElementById("dme_case_2_week_12_btn").classList.add("hidden");
		document.getElementById("dme_case_2_week_44_btn").classList.add("hidden");
		document.getElementById("dme_case_2_week_96_btn").classList.add("hidden");
		
		document.getElementById("dme_case_1_week_0_img").classList.remove("hidden");
		document.getElementById("dme_case_1_week_0_btn").classList.remove("hidden");
		document.getElementById("dme_case_1_week_12_btn").classList.remove("hidden");
		document.getElementById("dme_case_1_week_32_btn").classList.remove("hidden");
		document.getElementById("dme_case_1_week_96_btn").classList.remove("hidden");

		document.getElementById("patient_case_1_btn").src = "img/Patient_Case_1_btn_tap.png";
		document.getElementById("patient_case_2_btn").src = "img/Patient_Case_2_btn.png";
		document.getElementById("bgimg").src = "img/Durability_dme_patient_1_bkg.png";


	}else if(patientCase === "2") {
		document.getElementById("dme_case_1_week_0_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_12_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_32_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_96_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_0_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_12_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_44_img").classList.add("hidden");
		document.getElementById("dme_case_2_week_96_img").classList.add("hidden");
		document.getElementById("dme_case_1_week_0_btn").classList.add("hidden");
		document.getElementById("dme_case_1_week_12_btn").classList.add("hidden");
		document.getElementById("dme_case_1_week_32_btn").classList.add("hidden");
		document.getElementById("dme_case_1_week_96_btn").classList.add("hidden");
		
		document.getElementById("dme_case_2_week_0_img").classList.remove("hidden");
		document.getElementById("dme_case_2_week_0_btn").classList.remove("hidden");
		document.getElementById("dme_case_2_week_12_btn").classList.remove("hidden");
		document.getElementById("dme_case_2_week_44_btn").classList.remove("hidden");
		document.getElementById("dme_case_2_week_96_btn").classList.remove("hidden");

		document.getElementById("patient_case_1_btn").src = "img/Patient_Case_1_btn.png";
		document.getElementById("patient_case_2_btn").src = "img/Patient_Case_2_btn_tap.png";
		document.getElementById("bgimg").src = "img/Durability_dme_patient_2_bkg.png";
	}

}