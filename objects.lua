tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(25)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
for _,f in next,{"help","kill","run","restart","shutdown"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550","@7120063","@7607195","@7627535","@7627546","@7627556","@7631682","@7634571","@4916014","@4005264","@7033610","@7308352","@3222646","@5937915","@7114147","@7288402","@7756165","@7757983","@7754765","@7754518"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition","White and Black","Mortal Cinema","Background Directions","Without Plans","Defilante Maze","Testing Purposes","Under the Darkness","Fallen Layers","Defilante Platform","Threshold of Boxes","Simple Black","Grassy Walls","Thickness of Clouds","Unreal Illusion","Testing Lava Cave","Ninja Directions","Limits of Tomorrow","",""}
objects={1,2,3,6,10,17,23,35,39,40,45,46,54,60,61,68,85,89,90}
actual_map=""
actual_creator=""
bar=""
loop=0
winner=false
functs={running=false,level=0,count=8}
times=0
function eventChatCommand(name,message)
	if message == "help" then
		tfm.exec.chatMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that is falling! The last alive player wins the game!<br><br><ROSE>Module made by Spectra_phantom#6089.",name)
	end
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Varusofeyzan#0000" then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if (message:sub(0,3) == "run") then
			tfm.exec.newGame(message:sub(5))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
		if message == "shutdown" then
			system.exit()
		end
	end
end
function eventNewGame()
	functs.running=false
	functs.level=0
	functs.count=8
	times=0
	tfm.exec.setGameTime(100)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	changeBar()
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Objects.",name)
		end
	end
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
end
function showBar()
	for i=1,41 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."</b>  <BL>|   <N>Difficulty : "..bar.."  <BL>|  <N>#objects RTM 7552.036<")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b>  <BL>|   <N>Difficulty : "..bar.."  <BL>|  <N>#objects RTM 7552.036<")
			end
		end
	end
end
function showText(text)
	ui.addTextArea(1,"<font size='56'><p align='center'><font color='#222222'>"..text.."",nil,103,93,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='56'><p align='center'><font color='#ffffff'>"..text.."",nil,100,90,600,80,0,0,1.0,true)
end
function showTextSmall(text)
	ui.addTextArea(1,"<font size='32'><p align='center'><font color='#222222'>"..text.."",nil,103,103,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='32'><p align='center'><font color='#ffffff'>"..text.."",nil,100,100,600,80,0,0,1.0,true)
end
function changeBar()
	if functs.level == 1 then
		bar="<font face='Segoe UI Symbol'><VP>▁   <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 2 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂  <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 3 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃ <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 4 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 5 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅ <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 6 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 7 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>▇ <font face='Verdana'>"
	elseif functs.level >= 8 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>▇█<font face='Verdana'>"
	else
		bar="<font face='Segoe UI Symbol'><VP>    <J>  <font color='#ff0000'>  <font face='Verdana'>"
	end
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
	tfm.exec.chatMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that is falling! The last alive player wins the game!<br><br><ROSE>Module made by Spectra_phantom#6089.",name)
end
function eventLoop(p,f)
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
		if functs.count <= 3 then
			showText(""..math.ceil(functs.count).."")
		end
		if functs.count <= 0 and p < 20000 and winner == false then
			functs.running=true
			functs.level=1
			showText("Go!")
		end
	end
	if functs.running == true then
		loop=loop+1
		changeBar()
		object=objects[math.random(#objects)]
		if loop >= 10-functs.level and winner == false then
			removeText()
			times=times+1
			if times >= 3 and functs.level <= 7 then
				times=0
				functs.level=functs.level+1
			end
			loop=0
			if functs.level <= 6 then
				for i=1,functs.level do
					throw()
				end
			else
				for i=1,6 do
					throw()
				end
			end
		end
	end
end
function eventPlayerDied(name)
	if functs.running == true then
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
end
tfm.exec.newGame(mapas[math.random(#mapas)])
