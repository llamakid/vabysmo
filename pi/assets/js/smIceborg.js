var eventDataArray = new Array();

function smOmnitureAdd(event,value) {
    var eventData = new Object;
    eventData.event = event;
    eventData.value = value;
    eventDataArray.push(eventData);
}

function smOmnitureSend() {
	//alert('sent');

    var analytics = new Object;
    analytics.library = "omniture";
    analytics.eventData = eventDataArray;
    analyticsStr = JSON.stringify(analytics);
    analyticsStrEncoded = encodeURIComponent(analyticsStr);
    eventDataArray.length = 0;
   window.location.href = "sm://analytics/?" + analyticsStrEncoded; 
}