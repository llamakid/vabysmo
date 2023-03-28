/* Copyright (c) 2012, Pragmatic Data, LLC. All rights reserved. */
function convertToTwoColumns() {
	convert(document.getElementById("Highlights"));
	convert(document.getElementById("Index"));
}

var halfLength;
function convert(originalNode) {
	try {
		if (!originalNode)
			return;
		var firstDivElement = originalNode.children[0].children[0].children[0].children[0].children[0];
		var secondDivElement = originalNode.children[0].children[0].children[0].children[1].children[0];
		halfLength = secondDivElement.offsetHeight / 2;
		appendNode : while (true) {
			var firstChild = secondDivElement.children[0];
			var elementHeight = firstChild.offsetHeight;
			
			// This is to avoid the case of having just section text heading in the first column and its contents in second column
			if (firstChild.attributes && firstChild.attributes.getNamedItem("class") && firstChild.attributes.getNamedItem("class").nodeValue == "HighlightSection" && Math.abs(secondDivElement.offsetHeight - halfLength) < 20) {
				break appendNode;
			}
			
			if (secondDivElement.offsetHeight - elementHeight < halfLength) {
				moveToFirstTD(firstDivElement, secondDivElement);
				break appendNode;
				
			}
			
			firstDivElement.appendChild(firstChild);
		}
	} catch (e) {
		alert(e.message);
	}
}

function moveToFirstTD(firstDivElement, secondDivElement, innerElement, lastClonedNode) {
	
	var next = secondDivElement.children[0];
	var nextChild;
	if (innerElement) {
		if (!innerElement.children) {
			return;
		}
		next = innerElement.children[0];
;
	}
	while (next) {
		if (firstDivElement.done || /*next.getAttribute("class") == "HighlightSection" &&*/
			secondDivElement.offsetHeight < halfLength) {
			firstDivElement.done = true;
			return;
		}
		var child = next;
		next = next.nextElementSibling;
		var clonedNode;
		var childNodeName = child.nodeName.toLowerCase();
		var copyCompleteElement = child.childElementCount == 0 || childNodeName == "h1" || childNodeName == "li" || childNodeName == "p" || childNodeName == "table" || childNodeName == "h2" || childNodeName == "dt" || childNodeName == "dd";
		if (copyCompleteElement) {
			clonedNode = child;  
			nextChild = child.nextSibling;
		 	 
		} else {
			clonedNode = child.cloneNode(false);
			if (child.attributes && child.attributes.getNamedItem("class") && child.attributes.getNamedItem("class").nodeValue == "HighlightSection") {
				child.attributes.removeNamedItem("class");
			}
		}
		
		if (lastClonedNode) {
			if (secondDivElement.offsetHeight > halfLength) { // TODO Decide whether to move the last element to left
				lastClonedNode.appendChild(clonedNode);
				
			} else {
				firstDivElement.done = true;
				return;
			}
		} else {
			firstDivElement.appendChild(clonedNode);
		}
		
		if (!firstDivElement.done) {
			if (copyCompleteElement) {
				moveToFirstTD(firstDivElement, secondDivElement, nextChild ? nextChild.parentNode : null, lastClonedNode ? lastClonedNode : clonedNode);
			} else {
				moveToFirstTD(firstDivElement, secondDivElement, child, lastClonedNode ? lastClonedNode : clonedNode);
			}
		}
		
	}
	
}
