function omnitureUpdate() {
	
	var target = event.target || event.srcElement;
	var id = target.id;
	
	
	//alert(event.target.id);
	
	if(id == 'pi0_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_highlights");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_highlights");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi0_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_contents");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_contents");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
	
	}
	else if (id == 'pi0_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_boxed-warnings");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_boxed-warnings");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi1_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
		
	}
	else if (id == 'pi1_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
		
	}
	else if (id == 'pi1_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi1_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi1_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi1_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_1-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
		
	}
	else if (id == 'pi2_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_6') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-6");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-6");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_7') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-7");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-7");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi2_8') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-8");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_2-8");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi3_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_3-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_3-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi4_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_4-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_4-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_6') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-6");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-6");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_7') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-7");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-7");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_8') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-8");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-8");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_9') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-9");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-9");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_10') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-10");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-10");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_11') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-11");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-11");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_12') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-12");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-12");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_13') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-13");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-13");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi5_14') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-14");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_5-14");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi6_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_6-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi7_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_7-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_7-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi8_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_8-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi10_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_10-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_10-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi11_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_11-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_11-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi12_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi12_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi12_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi12_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_12-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi13_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi13_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi13_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_13-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_1') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-1");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-1");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_2') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-2");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-2");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_3') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-3");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-3");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_4') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-4");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-4");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_5') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-5");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-5");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi14_6') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-6");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_14-6");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi16_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_16-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_16-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi17_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_17-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_17-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
	else if (id == 'pi18_0') {
		smOmnitureAdd("pageName", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_18-0");
		smOmnitureAdd("eVar20", "rituxanheme-idetail:all:hcp:ipi:prescribing-information_18-0");
		smOmnitureAdd("events","event15");
		smOmnitureAdd("channel", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("hier1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("eVar1", "rituxanheme-idetail:all:hcp:rituxanheme_hcp");
		smOmnitureAdd("prop21","[ACCOUNTID]");
		smOmnitureAdd("prop71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("eVar71", "rituxanheme-idetail:all:hcp:rituxanheme_hcp_v[VERSION]");
		smOmnitureAdd("prop45", "hcp");
		smOmnitureAdd("eVar45", "hcp");
		smOmnitureAdd("prop46", "all");
		smOmnitureAdd("eVar46", "all");
		smOmnitureAdd("prop29", "[USERID]");
		smOmnitureAdd("eVar29", "[USERID]");
		smOmnitureSend();
		
	}
}