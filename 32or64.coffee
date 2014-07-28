window.ThirtyTwoorSixtyFour = ->
	return 64 if window.navigator.platform == 'MacIntel'  										# 64 bit MacOS + (64 bit Safari or 32 bit Chrome)
	return 32 if window.navigator.platform == 'Win32'											# 32 bit windows + safari
	return 64 if window.navigator.platform == 'Win64' and window.navigator.cpuClass == 'x64' 	# 64 bit Windows + 64 bit IE
	return 64 if window.navigator.platform == 'Win32' and window.navigator.cpuClass == 'x86'	# 64 bit Windows + 32 bit IE
	return 64 if window.navigator.platform == 'Win32'											# 64 bit Windows + 32 Firefox (or Chrome)
	return 32 if window.navigator.platform == 'Linux i686'										# 32 bit linux mint (i686) + Firefox
	return 64 if window.navigator.platform == 'Linux i686'										# 64 bit Ubuntu (x86_64) + 32 bit Chrome
	return 64 if window.navigator.platform == 'Linux x86_64'									# 64 bit Ubuntu + 64 bit Epiphany
	"<Error>"

document.write "Your computer is <div id='bit'>#{ThirtyTwoorSixtyFour()}</div> bit."