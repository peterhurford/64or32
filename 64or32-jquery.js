//64or32.com | MIT License

//When the page has loaded, run the following code
$(document).ready(function(){

    //Scan the User Agent for a specific string
    function scanUA(str) {
        //If the string is contained in the User Agent return true
        return window.navigator.userAgent.indexOf(str) > -1;
    };

    //set a variable for the browser's reported architecture
    var platform = window.navigator.platform;
    //Set the className variable based on what their User Agent reported
    var className = '';
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
        platform === 'MacIntel' ||
        platform === 'Linux x86_64'
    ) {
        className = 'arch64';
    //Otherwise if it's got any of these it's a mobile device
    } else if (
        platform === 'Linux armv7l' ||
        platform === 'iPad' ||
        platform === 'iPhone' ||
        platform === 'Android' ||
        platform === 'iPod' ||
        platform === 'BlackBerry'
    ) {
        className = 'mobile';
    //This one doesn't report accurately, set it to unknown
    } else if ( platform === 'Linux i686' ) {
        className = 'unknown';
    //Anything else will just be lumped into 32-bit
    } else {
        className = 'arch32';
    }

    //Add the class to the HTML tag at the top of the page
    $('html').addClass(className);

});
