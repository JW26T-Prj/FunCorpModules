for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"help","kill","restart"} do
	system.disableChatCommandDisplay(g)
end
tfm.exec.setRoomMaxPlayers(45)
ground_id=24
loop=-20
grounds={0,5,6,7,10,11,12,15,17,18}
maps={'<C><P H="400" L="1600" /><Z><S><S L="10" X="800" H="10" v="10000" Y="70" T="0" P="0,0,0,0,0,0,0,0" /></S><D><DS Y="50" X="800" /></D><O /></Z></C>','<C><P L="1600" D="x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,188,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,376,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,564,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,752,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,940,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1128,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1316,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1504,0;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,0,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,188,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,376,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,564,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,752,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,940,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1128,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1316,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1504,187;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,0,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,188,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,376,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,564,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,752,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,940,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1128,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1316,374;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,1504,374;" H="561" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="1000" o="3d95b8" X="-500" c="4" Y="280" T="12" H="1000" /><S H="1000" L="3000" o="3d95b8" X="800" c="4" Y="-500" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S H="1000" L="1000" o="3d95b8" X="2100" c="4" Y="280" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="3d95b8" X="800" c="4" Y="1061" T="12" H="1000" /><S L="10" X="800" H="10" Y="80" v="10000" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="60" X="800" /></D><O /></Z></C>','<C><P H="600" L="1600" /><Z><S><S X="800" L="3000" o="50010" H="3000" c="4" Y="200" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="100020" X="800" c="4" Y="300" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="150030" H="10" c="4" Y="3180" T="13" X="800" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="200040" X="800" c="4" Y="3140" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="5d0097" X="800" c="4" Y="3200" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="8200d3" X="800" c="4" Y="3260" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="ab00ff" X="800" c="4" Y="3320" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="be39ff" X="800" c="4" Y="3380" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="dc94ff" X="800" c="4" Y="3440" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="efcdff" X="800" c="4" Y="3500" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="fcecff" X="800" c="4" N="" Y="3560" T="13" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" X="800" v="10000" Y="80" T="0" H="10" /></S><D><P X="599" Y="440" T="110" P="0,0" /><P X="413" Y="400" T="110" P="0,0" /><P X="1116" Y="397" T="110" P="0,0" /><P X="1086" Y="371" T="111" P="0,0" /><P X="1118" Y="395" T="111" P="0,0" /><DS Y="60" X="800" /></D><O /></Z></C>','<C><P H="550" L="1600" DS="m;800,60,800,59" /><Z><S><S c="4" L="3000" o="535e64" H="1000" X="800" Y="-450" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="3e464b" X="800" c="4" Y="100" T="12" H="100" /><S H="100" L="3000" o="32373b" X="800" c="4" Y="200" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="222527" X="800" c="4" Y="300" T="12" H="100" /><S H="100" L="3000" o="191b1c" X="800" c="4" Y="400" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="131415" X="800" c="4" Y="500" T="12" H="100" /><S H="1000" L="3000" o="a0b0b" X="800" c="4" Y="1050" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" v="10000" X="800" Y="85" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><P P="1,0" Y="453" T="45" X="85" /><P X="882" Y="453" T="45" P="1,0" /><P P="1,0" Y="453" T="45" X="1679" /></D><O /></Z></C>','<C><P L="1600" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="10" X="800" v="10000" Y="55" T="0" H="10" /></S><D><P X="0" Y="0" T="138" P="0,0" /><P P="0,1" Y="0" T="138" X="1600" /><DS Y="32" X="800" /></D><O /></Z></C>','<C><P F="4" L="1600" /><Z><S><S L="10" H="10" v="10000" X="800" Y="75" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="55" X="800" /></D><O /></Z></C>'}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function eventChatCommand(name,message)
	if message == "help" then
		showMessage("<J>The objective of this module is survive! Test your luck and discover what ground will not be removed!<br><br><ROSE>Module made by Spectra_phantom#6089",name)
	end
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Viego#0345" then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventNewGame()
	ground_id=24
	loop=-20
	for i=1,24 do
		size=math.random(20,50)
		tfm.exec.addPhysicObject(i,math.random(100,1500),math.random(150,350),{
		type=grounds[math.random(#grounds)],
		width=size,
		height=size,
		friction=0.3,
		groundCollision=true,
		miceCollision=true,
		color=math.random(1,2147483647)
		})
		tfm.exec.setGameTime(68)
	end
end
function eventNewPlayer(name)
	showMessage("<J><b>Welcome to Falling Grounds!</b><br><br>The objective of this module is survive! Test your luck and discover what ground will not be removed!<br><br><ROSE>Module made by Spectra_phantom#6089",name)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	ui.setMapName("Falling Grounds <ROSE><b>RTM 2610.003</b> <J>- made by <N><R><b>Spectra_phantom#6089</b><")
	loop=loop+1
	if loop >= 4 and ground_id >= 2 then
		tfm.exec.removePhysicObject(ground_id)
		ground_id=ground_id-1
		loop=0
	end
	if f <= 1 then
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
		end
		tfm.exec.newGame(maps[math.random(#maps)])
	end
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in next,tfm.get.room.playerList do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		tfm.exec.setGameTime(5)
		showMessage("<R>No winners!")
	end
end
tfm.exec.newGame(maps[math.random(#maps)])
