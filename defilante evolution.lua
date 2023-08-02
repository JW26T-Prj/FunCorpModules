dados2={type = 12,width = 10,height = 3000,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0x6a7495,miceCollision = true,groundCollision = true,dynamic = false}
for _,f in next,{"AutoScore","AutoNewGame","AutoTimeLeft","AutoScore","MortCommand","AfkDeath","DebugCommand","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"obj","bonus","new","perfil","p","rank"} do
	system.disableChatCommandDisplay(g)
end
tfm.exec.setRoomMaxPlayers(35)
loop=0; pos=0; first=""; objetivo=300; disparador=true; bonus=true; valendo=false; tempo=60; lvexp=0;
mapas={3600369,3618133,3777799,3842712,3880734,3973560,4079653,6974226,4289602,4459045,5013105,5032380}
function showMessage(message,name)
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,message,name,250,160,300)
	end
end
function eventNewPlayer(name)
	showMessage("<J>Module temporário: Defilante Evolution v1.2<br><N>Vá até o final do mapa e chegue antes de todo mundo!<br>Digite !help para ver a ajuda.<br><ROSE>Module gerenciado por Shun_kazami#7014.",name)
end
function eventChatCommand(name,message)
	if message == "new" then
		if name == "Shun_kazami#7014" then
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
		if name == "Shun_kazami#7014" then
			objetivo=tonumber(message:sub(5))
			showMessage("<J>Objetivo da partida alterado para: "..objetivo,nil)
		end
	end
	if message == "help" then
		ui.addPopup(0,0,"<font size='20'><p align='center'>Defilante Evolution<p align='left'><font size='13'><br><br>Neste minigame você deverá ir o mais rápido possível até o final do mapa para ir obtendo pontos. Quanto mais rápido você for, mais pontos você vai ganhar.<br><BR>O primeiro colocado ganha 50 pontos, o segundo colocado ganha 40 pontos, e assim por diante.<br>O primeiro que chegar a uma determinada pontuação ganha a partida.",name,140,180,580,true)
	end
end
function eventLoop(p,f)
	if disparador == true then
		tempo=tempo-0.5
		ui.addTextArea(1242,"<font size='16'><b><font color='#0000FF'>Se prepare! A partida vai começar em "..math.floor(tempo).." segundos.",nil,200,30,480,50,0,0,0.9,true)
		ui.setMapName("Se prepare! A partida vai começar em "..math.floor(tempo).." segundos.<")
		if tempo < 0.5 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,0,false)
			end
			valendo=true
			disparador=false
			ui.removeTextArea(1242,nil)
		end
	end
	if valendo == true then
	ui.setMapName("Limite: "..objetivo.."")
	for name,player in pairs(tfm.get.room.playerList) do
		ui.removeTextArea(4783,true)
		if tfm.get.room.playerList[name].score >= objetivo and pos == 1 then
			local winner=""
			winner=name
			valendo=false
			tfm.exec.newGame('@6973961')
			showMessage("<b>Parabéns!</b> <CH>"..winner.." <N>venceu a partida com "..tfm.get.room.playerList[winner].score.." pontos!")
			ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
			ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script feito por Shun_kazami#7014",nil,240,120,420,100,0,0,1.0,true)
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
		eventChatCommand("Shun_kazami#7014","new")
	end
	pos=0
end

for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end

tfm.exec.newGame('@6973961')
ui.addTextArea(4785,"<font color='#000001'><font size='48'><font face='Comic Sans MS'>Defilante Evolution",nil,170,50,680,100,0,0,1.0,true)
ui.addTextArea(4784,"<font color='#000001'><font size='20'>Script feito por Shun_kazami#7014",nil,240,120,420,100,0,0,1.0,true)
