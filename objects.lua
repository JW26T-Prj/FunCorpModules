for _,f in next,{"help","kill","restart"} do
	system.disableChatCommandDisplay(f)
end
for _,G in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables"} do
	tfm.exec["disable"..G](true)
end

tfm.exec.setRoomMaxPlayers(35)
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550","@7120063","@7607195","@7627535","@7627546","@7627556","@7631682","@7634571","@4916014","@4005264","@7033610","@7308352","@3222646","@5937915","@7114147","@7288402","@7756165","@7757983","@7754765","@7754518"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition","White and Black","Mortal Cinema","Background Directions","Without Plans","Defilante Maze","Testing Purposes","Under the Darkness","Fallen Layers","Defilante Platform","Threshold of Boxes","Simple Black","Grassy Walls","Thickness of Clouds","Unreal Illusion","Testing Lava Cave","Ninja Directions","Limits of Tomorrow","",""}
objects={1,2,3,4,6,7,10,33,35,39,40,45,46,54,60,61,65,68,69,85,89,90}
actual_map=""; remaining=0; imageId=-1; actual_creator=""; bar=""; loop=0; winner=false; times=0;
functs={running=false,level=0,count=8}
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
		showMessage("<J>The objective of this module is survive! Don't hit the objects that are falling! The last alive player wins the game!<br><br><ROSE>Module made by Hecarimjhenx#0000",name)
	end
	if name == "Hecarimjhenx#0000" or name == "Malzahar#8178" or name == "Leblanc#5342" then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventNewGame()
	functs.running=false; functs.level=0; functs.count=8; times=0;
	tfm.exec.setGameTime(100)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	showMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Objects.",name)
		end
	end
end
function showBar()
	for i=1,41 do
		if mapas[i] == tfm.get.room.currentMap then
			local diff=functs.level
			if map_names[i] == "" then
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."   </b><V>|   <N>Difficulty : <R>"..diff.."   <V>|   <N>#objects <ROSE>RTM 9466.050 LTS<")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b> <BL>- "..tfm.get.room.currentMap.."   <V>|   <N>Difficulty : <R>"..diff.."   <V>|   <N>#objects <ROSE>RTM 9466.050 LTS<")
			end
		end
	end
end
function showText(text)
	ui.addTextArea(1,"<i><font size='52'><p align='center'><font color='#222222'>"..text.."",nil,103,93,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<i><font size='52'><p align='center'><font color='#ffffff'>"..text.."",nil,100,90,600,80,0,0,1.0,true)
end
function showTextSmall(text)
	ui.addTextArea(1,"<i><font size='29'><p align='center'><font color='#222222'>"..text.."",nil,103,103,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<i><font size='29'><p align='center'><font color='#ffffff'>"..text.."",nil,100,100,600,80,0,0,1.0,true)
end
function removeText()
	for i=0,1 do
		ui.removeTextArea(i,nil)
	end
end
function throw()
	position=math.random(0,800)
	tfm.exec.addShamanObject(object,position,-300,0,0,1,false)
	tfm.exec.addShamanObject(0,position,100,0,0,1,false)
end
function eventNewPlayer(name)
	showMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that are falling! The last alive player wins the game!<br><br><ROSE>Module made by Hecarimjhenx#0000",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	remaining=math.floor(f/1000)
	showBar()
	if f <= 3000 and functs.running == true and winner == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			functs.running=false
			showText("Time is up!")
		end
	end
	if f <= 1 and functs.running == false then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if functs.running == false and winner == false and p < 20000 then
		functs.count=functs.count-0.5
		if functs.count == 3 then imageId = tfm.exec.addImage("17a4e9afa86.png","&1",358,80,nul) end
		if functs.count == 2.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count == 2 then imageId = tfm.exec.addImage("17a4e9ae302.png","&1",358,80,nul) end
		if functs.count == 1.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count == 1 then imageId = tfm.exec.addImage("17a4e9acb8f.png","&1",358,80,nul) end
		if functs.count == 0.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count <= 0 and p < 20000 and winner == false then
			functs.running=true
			functs.level=1
			loop=9
		end
	end
	if functs.running == true then
		loop=loop+1
		object=objects[math.random(#objects)]
		if loop >= 10-functs.level and winner == false then
			removeText()
			times=times+1
			if times >= 3 and functs.level <= 7 then
				times=0
				functs.level=functs.level+1
			end
			loop=0
			if functs.level <= 7 then
				for i=1,functs.level do
					throw()
				end
			else
				for i=1,7 do
					throw()
				end
			end
		end
	end
end
function eventPlayerDied(name)
	local i=0
	local name
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			name=pname
		end
	end
	if i==0 then
		functs.running=false
		winner=true
		showText("No winners!")
		tfm.exec.setGameTime(5)
	elseif i==1 then
		functs.running=false
		showTextSmall(""..name.." wins the game!")
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.setGameTime(5)
		winner=true
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
