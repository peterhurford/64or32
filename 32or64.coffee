window.onload = ->
	w = window.navigator.platform
	b = 64 if w == 'MacIntel'  										# 64 bit MacOS + (64 bit Safari or 32 bit Chrome)
	b = 32 if w == 'Win32'											# 32 bit windows + safari
	b = 64 if w == 'Win64' and window.navigator.cpuClass == 'x64' 	# 64 bit Windows + 64 bit IE
	b = 64 if w == 'Win32' and window.navigator.cpuClass == 'x86'	# 64 bit Windows + 32 bit IE
	b = 64 if w == 'Win32'											# 64 bit Windows + 32 Firefox (or Chrome)
	b = 32 if w == 'Linux i686'										# 32 bit linux mint (i686) + Firefox
	b = 64 if w == 'Linux i686'										# 64 bit Ubuntu (x86_64) + 32 bit Chrome
	b = 64 if w == 'Linux x86_64'									# 64 bit Ubuntu + 64 bit Epiphany
	b = 0 if  w == 'Linux armv7l' || w == 'iPad' || w == 'Linux i686' || w == 'iPhone'		# Phones and tablets

	if b != 0
		r = "Your processor is <div id='bit'>#{b}</div> bit."
	else
		r = "You're on a phone or a tablet."

	document.getElementById('page').innerHTML = "<div class='main'>#{r}</div>
		<div class='sub'>Platform: #{window.navigator.platform}, cpuClass: #{window.navigator.cpuClass}</div>"