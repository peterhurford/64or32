window.onload = ->
	w = window.navigator.platform
	c = window.navigator.cpuClass
	if w == 'MacIntel'  					# 64 bit MacOS + (64 bit Safari or 32 bit Chrome)
		b = 64
	else if w == 'Win32'					# 32 bit windows + safari
	 	b = -1
	else if w == 'Win64' and c == 'x64' 	# 64 bit Windows + 64 bit IE
		b = 64
	else if w == 'Win32' and c == 'x86'		# 64 bit Windows + 32 bit IE
		b = 64
	else if w == 'Win32'					# 64 bit Windows + 32 Firefox (or Chrome)
		b = -1
	else if w == 'Linux i686'				# 32 bit linux mint (i686) + Firefox
		b = -1
	else if w == 'Linux i686'				# 64 bit Ubuntu (x86_64) + 32 bit Chrome
		b = -1
	else if w == 'Linux x86_64'				# 64 bit Ubuntu + 64 bit Epiphany
		b = 64
	else if w == 'Linux armv7l' || w == 'iPad' || w == 'iPhone' || w == 'Android' || w == 'iPod' || w == 'BlackBerry'   # Phones and tablets
		b = 0

	if b == 0
		r = "You're on a phone or a tablet."
	else if b == 32 || b == 64
		r = "Your processor is <div id='bit'>#{b}</div> bit."
	else
		r = "We're having some trouble.  Sorry. :("

	document.getElementById('page').innerHTML = "<div class='main'>#{r}</div>
		<div class='sub'>Platform: #{w}, cpuClass: #{c}</div>"