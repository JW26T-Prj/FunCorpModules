tfm.exec.disableAutoNewGame(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAllShamanSkills(true)
enabled=true; vivo=0; vivos=0; loop=0; prox=false; shaman=""; remain=10; players={}; p={};
mapas={"@7284500","@7282115","@7282073","@7284814","@6958866","@7177229","@3859389","@7285283"}
tfm.exec.newGame(mapas[math.random(#mapas)])
function eventLoop(p,f)
	ui.setMapName("<N><J>"..tfm.get.room.currentMap.."   <G>|   <N>Vivos : <V>"..vivos.."")
	if vivo == 2 then
		tfm.exec.killPlayer(shaman)
	end
	if f <= 5000 and f >= 4400 and vivo >= 2 then
		eventWin()
		tfm.exec.chatMessage("<N>Tempo esgotado! <VP><b>"..vivos.."</b> <N>ratos permaneceram vivos.",nil)
	end
	if f <= 500 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	loop=loop+0.5
	if enabled == true then
		remain=remain-0.5
	end	
	if remain == 3 then imageId = tfm.exec.addImage("17a4e9afa86.png",":1",358,280,nul) end
	if remain == 2.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 2 then imageId = tfm.exec.addImage("17a4e9ae302.png",":1",358,280,nul) end
	if remain == 1.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 1 then imageId = tfm.exec.addImage("17a4e9acb8f.png",":1",358,280,nul) end
	if remain == 0.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 0 then
		imageId = tfm.exec.addImage("17a4e9ab41f.png",":1",303,280,nul)
		enabled=true;
	end
	if remain <= -1 then
		ui.removeTextArea(0,nil)
		enabled=false
		remain=10
		tfm.exec.removeImage(imageId,true)
	end
	vivos=vivo-1
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
function eventSummoningStart(name)
	tfm.exec.chatMessage("<R>Não é permitido o uso de objetos de shaman! Use somente a seta pra baixo.",name)
end
function eventSummoningEnd(name)
	tfm.exec.killPlayer(name)
end
function eventNewGame()
	tfm.exec.chatMessage("<R>Não é permitido o uso de objetos de shaman! Use somente a seta pra baixo.",nil)
	vivo=0
	prox=false
	obterJogadores()
	enabled=true
	remain=10
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>Você precisa estar logado no Transformice para poder participar deste jogo.",name)
			tfm.exec.setPlayerScore(name,-1,false)
		end
		if tfm.get.room.playerList[name].isShaman then
			shaman=name
			tfm.exec.setPlayerScore(name,0,false)
		end
		vivo=vivo+1
	end
	tfm.exec.setGameTime(90)
end
function eventNewPlayer(name)
	tfm.exec.bindKeyboard(name,40,true,true)
	tfm.exec.bindKeyboard(name,83,true,true)
	tfm.exec.chatMessage("<VP><b>Sniper!</b><br><N>Sobreviva às bigornas do shaman! Criado por Patrick_mahomes#1795.<br><br>versão 1.8.3: mudanças internas",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function obterJogadores()
	players={}
	for name,player in pairs(tfm.get.room.playerList) do
		table.insert(players,name)
	end
end
function eventKeyboard(name,key,down,x,y)
	if y < 150 then
		if enabled == false then
			if loop >= 1 then
				tfm.exec.addShamanObject(10,x,y+60,90,0,25,false)
				loop=0
			end
		end
	end
end
obterJogadores()
function eventPlayerDied(name)
	vivo=vivo-1
	if tfm.get.room.playerList[name].isShaman then
		eventWin()
	end
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	elseif i==1 then
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setGameTime(5)
	end
end
function eventWin()
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.killPlayer(shaman)
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
		tfm.exec.setGameTime(5)
	end
end
function eventPlayerWon(name)
	vivo=vivo-1
end
