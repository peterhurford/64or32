//64or32.com | MIT License

//Wrap the whole thing in an IFFE for safety
(function(){

//Declare function to detect when the page is ready similar to $(document).ready()
function ready(fn) {
    if (document.readyState != 'loading'){
        fn();
    } else if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', fn);
    } else {
        document.attachEvent('onreadystatechange', function() {
            if (document.readyState != 'loading') {
                fn();
            }
        });
    }
}

//When the page has loaded, run the following code
ready(function(){

    //Scan the User Agent for a specific string
    function scanUA(str) {
        //If the string is contained in the User Agent return true
        return window.navigator.userAgent.indexOf(str) > -1;
    };

    //set a variable for the browser's reported architecture
    var windowUA = window.navigator.platform;
    //define a var to be used later
    var detected = '';
    //if the User Agent has any of the following strings it's 64-Bit
    if (
            scanUA('x86_64') ||
            scanUA('x86-64') ||
            scanUA('Win64') ||
            scanUA('x64;') ||
            scanUA('amd64') ||
            scanUA('AMD64') ||
            scanUA('WOW64') ||
            scanUA('x64_64') ||
            windowUA === 'MacIntel' ||
            windowUA === 'Linux x86_64'
        ) {
            detected = 64;
    //Otherwise if it's got any of these it's a mobile device
    } else if (
            windowUA === 'Linux armv7l' ||
            windowUA === 'iPad' ||
            windowUA === 'iPhone' ||
            windowUA === 'Android' ||
            windowUA === 'iPod' ||
            windowUA === 'BlackBerry'
        ) {
            detected = 0;
    //This one doesn't report accurately, set it to unknown
    } else if (
            windowUA === 'Linux i686'
        ) {
            detected = -1;
    }

    //Set the className variable based on what their User Agent reported
    var className = '';
    if (detected === -1) {
        className = 'unknown';
    } else if (detected === 0) {
        className = 'mobile';
    } else if (detected === 64) {
        className = 'arch64';
    } else {
        className = 'arch32';
    }

    //Set the HTML tag as the element to receive the class
    var el = document.querySelector('html');

    //Run a safety IF statement for older browsers
    if (el.classList) {
        //add the class to the HTML tag
        el.classList.add(className);
    } else {
        //older browser fail-safe
        el.className += ' ' + className;
    }

});

})();