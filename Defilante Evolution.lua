for _,f in next,{"AutoScore","AutoNewGame","AutoTimeLeft","AutoScore","MortCommand","AfkDeath","DebugCommand","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"obj","bonus","new","perfil","p","rank"} do
	system.disableChatCommandDisplay(g)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end
dados2={type = 12,width = 10,height = 3000,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0x6a7495,miceCollision = true,groundCollision = true,dynamic = false}
loop=0; pos=0; first=""; objetivo=300; disparador=true; bonus=true; valendo=false; tempo=60; lvexp=0;
mapas={"@3600369","@3618133","@3777799","@3842712","@3880734","@3973560","@4079653","@6974226","@4289602","@4459045","@5013105","@5032380"}
function showMessage(message,name)
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,message,name,250,160,300)
	end
end
function eventNewPlayer(name)
	showMessage("<J>Welcome to Defilante Evolution v1.3!<br><N>Go to the end of the map and get there before everyone else!<br>Type !help to see more information about this game.<br><ROSE>Script managed by Patrick_mahomes#1795.",name)
end
function eventChatCommand(name,message)
	if message == "new" then
		if name == "Patrick_mahomes#1795" then
			if valendo == false then
				tempo=60
				disparador=true
			else
				tfm.exec.newGame(mapas[math.random(#mapas)])
				valendo=true
			end
		end
	end
	if(message:sub(1,3) == "obj") then
		if name == "Patrick_mahomes#1795" then
			objetivo=tonumber(message:sub(5))
			showMessage("<J>Points limit: "..objetivo,nil)
		end
	end
	if message == "help" then
		ui.addPopup(0,0,"<font size='20'><p align='center'>Defilante Evolution<p align='left'><font size='13'><br><br>In this game you must go as fast as possible to the end of the map to get points. The faster you go, the more points you will earn.<br><BR>First place wins 50 points, second place wins 40 points, and so on.<br>The first one to reach a certain score wins the game.",name,140,180,580,true)
	end
end
function eventLoop(p,f)
	if disparador == true then
		tempo=tempo-0.5
		ui.addTextArea(1242,"<font size='16'><b><font color='#0000FF'>Get ready! The match will start in "..math.floor(tempo).." seconds.",nil,200,30,480,50,0,0,0.9,true)
		ui.setMapName("Get ready! The match will start in "..math.floor(tempo).." seconds.<")
		if tempo < 0.5 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.setPlayerScore(name,0,false)
			end
			valendo=true
			disparador=false
			ui.removeTextArea(1242,nil)
		end
	end
	if valendo == true then
	ui.setMapName("Limit: "..objetivo.."")
	for name,player in next,tfm.get.room.playerList do
		ui.removeTextArea(4783,true)
		if tfm.get.room.playerList[name].score >= objetivo and pos == 1 then
			local winner=""
			winner=name
			valendo=false
			tfm.exec.newGame('@6973961')
			showMessage("<b>Congratulations!</b> <CH>"..winner.." <N>wins the game with "..tfm.get.room.playerList[winner].score.." points!")
			ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
			ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script made by Patrick_mahomes#1795",nil,240,120,420,100,0,0,1.0,true)
			if p > 10000 then
				ui.removeTextArea(100,nil)
				ui.removeTextArea(1244,nil)
				ui.removeTextArea(157979,nil)
				ui.removeTextArea(157978,nil)
				ui.removeTextArea(157960,nil)
				ui.removeTextArea(157961,nil)
			end
		end
	end
	if pos >= 1 then
		tempo=tempo-0.5
		if tempo < 0.5 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			ui.removeTextArea(1244,nil)
		end
	end
end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
	tfm.exec.respawnPlayer(name)
	tfm.exec.giveCheese(name)
	tfm.exec.playerVictory(name)
	end
end

function eventTextAreaCallback(id,name,link)
	if link == "fechar" then
		for id=0,3 do
			ui.removeTextArea(id,name)
		end
	end
	if link == "close" then
	for id=-1,2 do
		ui.removeTextArea(id,name)
		ui.removeTextArea(6969+id,name)
		ui.removeTextArea(7979+id,name)
	end
	end
end

function eventPlayerWon(name)
	pos=pos+1
	if pos == 1 then
		first=name
		tfm.exec.setPlayerScore(name,40,true)
	end
	if pos == 2 then
		tfm.exec.setPlayerScore(name,30,true)
	end
	if pos == 3 then
		tfm.exec.setPlayerScore(name,20,true)
	end
	if pos == 4 then
		tfm.exec.setPlayerScore(name,10,true)
	end
	tfm.exec.setPlayerScore(name,10,true)
end

function eventNewGame()
	tfm.exec.addPhysicObject(125,-110,-200,dados2)
	if valendo == true then
	tempo=20
	ui.removeTextArea(4785,nil)
	ui.removeTextArea(4784,nil)
	ui.removeTextArea(4783,nil)
	ui.removeTextArea(4782,nil)
end
	if valendo == false then
		tempo=60
		eventChatCommand("Patrick_mahomes#1795","new")
	end
	pos=0
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

tfm.exec.newGame('@6973961')
ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script made by Patrick_mahomes#1795",nil,240,120,420,100,0,0,1.0,true)
