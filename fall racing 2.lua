tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.setRoomMaxPlayers(25)
xml2=''
creator=""
position=0
objective=60
enabled=false
map=""
mapas={"@7411648","@7568910","@7410842","@7568917","@7568919","@7568922","@7568923","@7568928","@7568964","@7568967","@7568965","@7354962","@7569413","@7721624","@6621726","@6316396","@7786244","@7786245","@7786246","@7786247","@7786249","@7786250"}
system.disableChatCommandDisplay("obj")
lobby="@7404106"
changed=false
function eventChatCommand(name,message)
	if(message:sub(1,3) == "obj") then
		if name == "Jhinsword350#0000" or name == "Azirdeathray#0000" or name == "Spectra_phantom#6089" then
			objective=tonumber(message:sub(5))
			tfm.exec.chatMessage("<J>Objective changed to: "..objective,name)
		end
	end
end
function eventNewGame()
	if enabled == true then
		position=0
		if changed == false and enabled == true then
			xml2=tfm.get.room.xmlMapInfo.xml
			creator=tfm.get.room.xmlMapInfo.author
			map=tfm.get.room.currentMap
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	else
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.5",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.5! Script made by <b>Azirdeathray#0000</b>.<")
		tfm.exec.setGameTime(90)
	end
end
function eventLoop(p,f)
	if p >= 5000 and p <= 6000 and changed == false and enabled == true then
		tfm.exec.newGame(xml2)
		changed=true
		ui.setMapName("<J>#fall 2.5   <BL>|   <J>"..creator.." <BL>- "..map.."   <BL>|   <J>Objective : <J>"..objective.." points<")
	end
	if f <= 1 and enabled == true then
		changed=false
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if enabled == false and f >= 1000 then
		ui.addTextArea(11,"<font face='Eras Demi ITC'><font size='18'><font color='#ffff00'>Get ready! The match will start on "..math.floor(f/1000).." seconds.",nil,220,370,600,32,0,0,1.0,true)
	end
	if f <= 10000 and f >= 9000 and enabled == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
			changed=false
		end
	end
	if f <= 1 and enabled == false then
		for i=10,11 do
			ui.removeTextArea(i,nil)
		end
		enabled=true
		tfm.exec.newGame(mapas[math.random(#mapas)])
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].score >= objective and enabled == true then
			enabled=false
			tfm.exec.newGame(lobby)
			tfm.exec.chatMessage("<VP><b>Congratulations!</b> "..name.." wins the game with "..tfm.get.room.playerList[name].score.." points!")
		end
	end
end
function eventPlayerWon(name)
	position=position+1
	if position == 1 then
		tfm.exec.setGameTime(20)
		tfm.exec.setPlayerScore(name,1,true)
	end
	if position <= 8 then
		tfm.exec.setPlayerScore(name,10-position,true)
		if position == 1 then
			tfm.exec.chatMessage("+ 10 points",name)
		else
			tfm.exec.chatMessage("+ "..tostring(10-position).." points",name)
		end
	else
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.chatMessage("+ 1 point",name)
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
	end
end
function eventNewPlayer(name)
	if enabled == false then
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.5",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.5! Script made by <b>Azirdeathray#0000</b>.<")
	end
	tfm.exec.chatMessage("<J>Welcome to the #fall2 module!<br><br>The objective of this room is fall to the end of the map!<br>The player that score more points will win the game!<br><br><R>WARNING: This script require at least 3GB of RAM to work without problems.<J><br><br>Script made by Azirdeathray#0000",name)
end
tfm.exec.newGame(lobby)
