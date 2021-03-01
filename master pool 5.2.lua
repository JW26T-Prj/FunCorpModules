tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.newGame("@7601768")
xml2=''
run_time=0
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	ui.setMapName("<font color='#14ACEE'><font size='12'>The Master Pool 5.2 - Advanced LUA Map made by <b>Aurelianlua#0000</b><")
end
function eventPlayerDied(name)
	eventNewPlayer(name)
end
function eventNewGame()
	xml2=tfm.get.room.xmlMapInfo.xml
end
function eventLoop()
	if run_time <= 3.5 then
		run_time=run_time+0.5
		if run_time >= 4 then
			tfm.exec.newGame(xml2)
			ui.setMapName("<font color='#14ACEE'><font size='12'>The Master Pool 5.2 - Advanced LUA Map made by <b>Aurelianlua#0000</b><")
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].y > 800 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-15,0,-0.6,0,-0.05,nil)
		end
		if tfm.get.room.playerList[name].y > 850 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-28,0,-0.6,0,-0.05,nil)
		end
		if tfm.get.room.playerList[name].y > 900 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-41,0,-0.6,0,-0.05,nil)
		end
	end
end