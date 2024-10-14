let idleTime = 0;
let idleInterval;
const screensaverTimeout = 120000; // 2 minutes in milliseconds
// const screensaverTimeout = 2000; // 2 seconds in milliseconds

// Reset idle timer on user activity
function resetIdleTimer(screensaverVideo) {
  idleTime = 0;
  if (screensaverVideo && screensaverVideo.style.display === 'block') {
    screensaverVideo.style.display = 'none';
    // document.exitFullscreen();
    screensaverVideo.pause();
  }
}

// Track user activity
function initializeScreensaver() {
  const screensaverVideo = document.getElementById('screensaver-video');
  
  if (!screensaverVideo) {
    console.log('Screensaver video not found on this page.');
    return; // Exit the function if the video doesn't exist on the page
  }

  document.onmousemove = () => resetIdleTimer(screensaverVideo);
  document.onkeypress = () => resetIdleTimer(screensaverVideo);
  document.onscroll = () => resetIdleTimer(screensaverVideo);
  document.onclick = () => resetIdleTimer(screensaverVideo);

  idleInterval = setInterval(function() {
    idleTime += 1000;
    if (idleTime >= screensaverTimeout) {
      // Activate screensaver (play video in fullscreen)
      screensaverVideo.style.display = 'block';
    //   screensaverVideo.requestFullscreen();
      screensaverVideo.play();
    }
  }, 1000); // check every second
}

window.onload = initializeScreensaver;