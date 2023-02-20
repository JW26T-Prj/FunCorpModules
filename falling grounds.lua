for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"help","kill","restart"} do
	system.disableChatCommandDisplay(g)
end
ground_id=30; loop=-20; grounds={0,5,6,7,10,11,12,17,18};
maps={'<C><P H="600" L="1600" /><Z><S><S L="10" X="800" H="10" v="10000" Y="70" T="0" P="0,0,0,0,0,0,0,0" /></S><D><DS Y="50" X="800" /></D><O /></Z></C>'}
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
		showMessage("<J>The objective of this module is survive! Test your luck and discover what ground will not be removed!<br><br><ROSE>Module made by Patrick_mahomes#1795",name)
	end
	if name == "Spectra_phantom#6089" or name == "Patrick_mahomes#1795" or name == "Forzaldenon#0000" or name == "Viego#0345" then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventNewGame()
	ground_id=30
	loop=-20
	for i=1,30 do
		size=math.random(15,60)
		tfm.exec.addPhysicObject(i,math.random(100,1500),math.random(150,550),{
		type=grounds[math.random(#grounds)],
		width=size,
		height=size,
		friction=0.3,
		groundCollision=true,
		miceCollision=true,
		color=math.random(1,16777216)
		})
		tfm.exec.setGameTime(80)
	end
	red = math.random(0,143); green = math.random(0,143); blue = math.random(0,143);
	output_red = string.format("%x", red); output_green = string.format("%x", green); output_blue = string.format("%x", blue); 
	output=output_red..output_green..output_blue
	ui.setBackgroundColor("#"..output.."")
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.giveMeep(name)
	end
end
function eventNewPlayer(name)
	showMessage("<J><b>Welcome to Falling Grounds!</b><br><br>The objective of this module is survive! Test your luck and discover what ground will not be removed!<br><br><ROSE>Module made by Patrick_mahomes#1795",name)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	ui.setMapName("Falling Grounds <ROSE><b>RTM 3113.007</b> <J>- made by <N><R><b>Patrick_mahomes#1795</b><")
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
