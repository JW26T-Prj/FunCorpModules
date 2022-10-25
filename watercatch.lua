admin={""} -- Insira o nome dos FunCorps aqui!

for _,f in next,{"AutoNewGame","AutoShaman","AutoScore","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog","reset","skins"} do
	system.disableChatCommandDisplay(f)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(40) end
shaman=""; alives=0; cannons=10; z=0; data={}; mode="load"; changed=false; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
powerups={x1=-1,x2=-1,x3=-1,x4=-1,x5=-1,y1=-1,y2=-1,y3=-1,y4=-1,y5=-1,t1=0,t2=0,t3=0,t4=0,t5=0}

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
function showAvailableSharks(name)
	i=0
	for _,link in next,{"18309d64e58.png","18309d6029f.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",163,170+(i*50),name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"18309d69a5a.png","18309d7325a.png","18309d6e65a.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",383,110+(i*50),name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	ui.addTextArea(1006,"<i><font size='11.5'><b>Rato Normal</b><br><br><a href='event:a0'>Usar!</a><br><br><b>Tubarão Padrão 2</b><br><br><a href='event:a2'>Usar!</a><br><br><b>Tubarão-Branco</b><br><br><a href='event:a4'>Usar!</a>",name,248,157,175,215,0,0,1.0,true)
	ui.addTextArea(1007,"<i><font size='11.5'><b>Tubarão Normal 1</b><br><br><a href='event:a1'>Usar!</a><br><br><b>Tubarão Normal 3</b><br><br><a href='event:a3'>Usar!</a><br><br><b>Tubarão-Martelo</b><br><br><a href='event:a5'>Usar!</a>",name,478,157,175,215,0,0,1.0,true)
end
function removeImagePlayers(name)
	if rawlen(data[name].active_imgs) > 0 then
		for _,id in next,data[name].active_imgs do
			tfm.exec.removeImage(id)
		end
		data[name].active_imgs={}
	end
end
function displayShark(name,type,reverse)
	if type == 1 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d69a5a.png","$"..name.."",85,-42,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d69a5a.png","$"..name.."",-90,-42,nil,1,1)
		end
	elseif type == 2 then
		if reverse == true then
			data[name].shark_id=tfm.exec.addImage("18309d64e58.png","$"..name.."",85,-31,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d64e58.png","$"..name.."",-90,-31,nil,1,1)
		end
	elseif type == 3 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d7325a.png","$"..name.."",78,-50,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d7325a.png","$"..name.."",-80,-50,nil,1,1)
		end
	elseif type == 4 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d6029f.png","$"..name.."",70,-29,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d6029f.png","$"..name.."",-50,-29,nil,1,1)
		end
	elseif type == 5 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",85,-55,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",-90,-55,nil,1,1)
		end
	end
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function showWater(name)
	for _,as in next,{0,2,4} do
		tfm.exec.addImage("183bac46d1a.png","?1",-800+(as*1488),1945,name,1,-1.5,0,1)
	end
	for _,at in next,{1,3,5} do
		tfm.exec.addImage("183bac46d1a.png","?1",688+(at*1488),1945,name,-1,-1.5,0,1)
	end
	for i=0,1 do
		tfm.exec.addImage("18200689108.png", "?1", -800+(i*7180), 487, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("18200689108.png", "!1", -800+(i*7180), 487, name, 1.0, 1.0, 0, 0.56)
		tfm.exec.addImage("1820068de62.png", "!1", -800+(i*7180), 545, name, 6, 2.5, 0, 0.8)
	end
	for b=0,1 do
		tfm.exec.addImage("18200692b61.jpg","?1",-800+(b*1795),545,name,4,4)
	end
	for _,m in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","!1",-1200+(m*1400),2337,name,1,-1.5,0,1)
	end
	for _,n in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","!1",200+(n*1400),2337,name,-1,-1.5,0,1)
	end
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","!1",-1200+(h*1400),1865,name,1,0.4,0,1)
	end
	for _,j in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","!1",200+(j*1400),1865,name,-1,0.4,0,1)
	end
	for w=1,3 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(50,4500),math.random(-50,250),name,0.5,0.5)
	end
	for x=1,3 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(50,4500),math.random(-50,250),name,0.5,0.5)
	end
	for y=1,4 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(50,4500),math.random(-50,250),name,0.5,0.5)
	end
	for z=1,4 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(50,4500),math.random(-50,250),name,0.5,0.5)
	end
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,-500,name,8.5,1,0,1)
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			tfm.exec.setPlayerScore(shaman,-1,false)
			mode="end"
			tfm.exec.setGameTime(10)
			for n,_ in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isDead then
					alives=alives+1
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
					ui.removeTextArea(300,n)
					tfm.exec.setPlayerScore(n,2,true)
				end
			end
		end
	end
end
function moveShaman()
	position=math.random(1,3)
	if position == 1 then
		tfm.exec.movePlayer(shaman,631,181,false,0,0,false)
	elseif position == 2 then
		tfm.exec.movePlayer(shaman,2769,90,false,0,0,false)
	elseif position == 3 then
		tfm.exec.movePlayer(shaman,4721,212,false,0,0,false)
	end
end
function checkOxygenZones(name)
	if tfm.get.room.playerList[name].x >= 2328 and tfm.get.room.playerList[name].x <= 2474 then
		if tfm.get.room.playerList[name].y >= 1190 and tfm.get.room.playerList[name].y <= 1300 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x <= 785 then
		if tfm.get.room.playerList[name].y >= 1800 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 3918 and tfm.get.room.playerList[name].x <= 4066 then
		if tfm.get.room.playerList[name].y >= 1270 and tfm.get.room.playerList[name].y <= 1405 then
			return true
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	showWater(name)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <VP><b>v4.0.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
	newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["imaget"]=5; ["shark_id"]=0; ["shark"]=0; ["active_imgs"]={};
	};
	data[name] = newData;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module criado por Morganadxana#0000.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
	data[name].imageid = tfm.exec.addImage("17a53e210bf.png","&1",180,90,name)
	data[name].imageid2 = tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
	data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
	data[name].imaget=5
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <N>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>10</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,86,520,290,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 35%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,160,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Akwimos#1937</b><N> - Criação do mapa e tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação das artes")
	end
	if message == "skins" then
		showMenu(name,0x949494,140,90,520,220,"Skins","As skins de tubarão serão exibidas apenas quando você for shaman, e estiver dentro do lago!")
		showAvailableSharks(name)
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,205,"Changelog da Versão 4.0.0","• Novo mapa!<br>• Aumento do limite de objetos para 10<br>• Retorno das zonas de oxigênio<br>• Os shamans agora podem ficar por tempo ilimitado dentro do lago!<br>• Correções de bugs no contador de ratos vivos<br>• Mudanças no esquema de execução do mapa<br>• O powerup SUFOCO agora remove 35% do oxigênio do rato<br>• Aumento do número de quadrados de powerups para 5<br>• Otimizações gerais de código<br>• Correções de bugs em alguns powerups")
	end
	if (message:sub(0,2)== "tc") then
		if tfm.get.room.playerList[name].isShaman == false then
			for n,_ in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[n].isShaman == false then
					showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
				end
			end
		end
	end
	if name == "Morganadxana#0000" or name == "Akwimos#1937" or name == "Spectra_phantom#6089" or verifyAdmin(name) == true then
		if (message:sub(0,3) == "msg") then
			showMessage("<VP>• [FunCorp - <b>"..name.."</b>] "..message:sub(5).."")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "reset" then
			reset()
		end
	end
end
function eventSummoningEnd(name,id,x,y)
	if id >= 1 then
		cannons=cannons-1
		if cannons >= 1 then
			showMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
		elseif cannons == 0 then
			showMessage("<VP>O shaman não pode mais usar objetos!")
			showMessage("<R>Você não pode mais invocar objetos! Fazer isso ocasionará na sua morte e na perda de sua vez de shaman.",shaman)
		elseif cannons <= -1 then
			showMessage("<R>O shaman excedeu o limite de objetos utilizáveis!")
			tfm.exec.killPlayer(shaman)
		end
	end
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage("<R>Você não pode mais usar objetos! Invocar um objeto fará com que você morra e a partida termine!",name)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame("@7918679")
		ui.setMapName("Carregando mapa. Por favor, aguarde...<")
		changed=false
		mode="load"
	else
		changed=true
		tfm.exec.newGame(xml)
	end
end
function activatePowerup(name,id,number)
	if id == 1 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
		dropPlayer(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 2 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
		if not tfm.get.room.playerList[name].isShaman then
			data[name].o=data[name].o+40
			if data[name] and data[name].o > 100 then
				data[name].o=100
			end
		end
		tfm.exec.playSound("/deadmaze/objectif2.mp3", 75, nil, nil, name)
	elseif id == 3 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
		if tfm.get.room.playerList[name].movingRight == true then
			tfm.exec.movePlayer(name,0,0,true,120,0,false)
		else
			tfm.exec.movePlayer(name,0,0,true,-120,0,false)
		end
		tfm.exec.playSound("/transformice/son/chamane2.mp3", 65, nil, nil, name)
	elseif id == 4 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
		timer=1
		tfm.exec.playSound("/transformice/son/bulle2.mp3", 75, nil, nil, name)
	elseif id == 5 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
		tfm.exec.giveMeep(name,true)
		tfm.exec.playSound("/transformice/son/emote.mp3", 75, nil, nil, name)
	elseif id == 6 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
		if not tfm.get.room.playerList[name].isShaman then
			data[name].o=data[name].o-35
			if data[name] and data[name].o < 1 then
				data[name].o=1
			end
		end
		tfm.exec.playSound("/cite18/combo2.mp3", 75, nil, nil, name)
	elseif id == 7 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
		congelar(name)
	elseif id == 8 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
		queijo(name)
	end
	if number == 1 then
		powerups.x1=-1; powerups.y1=-1;
		ui.removeTextArea(100,nil)
	elseif number == 2 then
		powerups.x2=-1; powerups.y2=-1;
		ui.removeTextArea(101,nil)
	elseif number == 3 then
		powerups.x3=-1; powerups.y3=-1;
		ui.removeTextArea(102,nil)
	elseif number == 4 then
		powerups.x4=-1; powerups.y4=-1;
		ui.removeTextArea(103,nil)
	elseif number == 5 then
		powerups.x5=-1; powerups.y5=-1;
		ui.removeTextArea(104,nil)
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				activatePowerup(name,math.random(1,8),1)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				activatePowerup(name,math.random(1,8),2)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				activatePowerup(name,math.random(1,8),3)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				activatePowerup(name,math.random(1,8),4)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x5-10 and tfm.get.room.playerList[name].x < powerups.x5+34 then
			if tfm.get.room.playerList[name].y > powerups.y5-10 and tfm.get.room.playerList[name].y < powerups.y5+34 then
				activatePowerup(name,math.random(1,8),5)
			end
		end
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if shaman == name and data[name].shark >= 1 then
			if data[name] and tfm.get.room.playerList[name].y >= 505 then
				tfm.exec.changePlayerSize(name,0.2)
				if key == 39 or key == 68 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,false)
				elseif key == 37 or key == 65 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,true)
				end
				if key == 38 or key == 40 or key == 83 or key == 87 then
					if tfm.get.room.playerList[name].movingRight then
						tfm.exec.removeImage(data[name].shark_id)
						displayShark(name,data[name].shark,false)
					else
						tfm.exec.removeImage(data[name].shark_id)
						displayShark(name,data[name].shark,true)
					end
				end
			else
				tfm.exec.changePlayerSize(name,1)
				tfm.exec.removeImage(data[name].shark_id)
			end
		end
	end
end
function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
	ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
	if changed == true then
		ui.removeTextArea(0,nil)
		z=-1
		cannons=10
		ui.removeTextArea(22,nil)
		alives=0
		mode="hide"
		showMessage("<J>Caso o mapa do jogo não esteja aparecendo, saia do jogo e entre novamente.<br>Isto é um problema de memória do Transformice e não do module.")
		for n,p in next,tfm.get.room.playerList do
			tfm.exec.giveMeep(n,false)
			tfm.exec.removeImage(data[n].shark_id)
			tfm.exec.changePlayerSize(n,1)
			if n:sub(1,1) == "*" then
				tfm.exec.killPlayer(n)
				showMessage("<R>Jogadores convidados não podem jogar este jogo. Logue em uma conta para jogar #watercatch.",name)
			end
			alives=alives+1
			data[n].o=99; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
			for i=32,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			if tfm.get.room.playerList[n].isShaman then
				tfm.exec.setShamanMode(n,0)
				if tfm.get.room.isTribeHouse == false then
					tfm.exec.setPlayerSync(n)
				end
				showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez como shaman!",n)
				shaman=n
				alives=alives-1
				showWater(name)
			end
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		tfm.exec.setGameTime(60)
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,20,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function genPowerup(pos,type,x,y)
	if pos == 1 then
		ui.addTextArea(100,"<font size='18'><font color='#010101'><p align='center'>?",nil,x,y,22,22,0xd0d0d0,0x808080,1.0,false)
		powerups.x1=x; powerups.y1=y; powerups.t1=type;
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><font color='#010101'><p align='center'>?",nil,x,y,22,22,0xd0d0d0,0x808080,1.0,false)
		powerups.x2=x; powerups.y2=y; powerups.t2=type;
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><font color='#010101'><p align='center'>?",nil,x,y,22,22,0xd0d0d0,0x808080,1.0,false)
		powerups.x3=x; powerups.y3=y; powerups.t3=type;
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><font color='#010101'><p align='center'>?",nil,x,y,22,22,0xd0d0d0,0x808080,1.0,false)
		powerups.x4=x; powerups.y4=y; powerups.t4=type;
	elseif pos == 5 then
		ui.addTextArea(104,"<font size='18'><font color='#010101'><p align='center'>?",nil,x,y,22,22,0xd0d0d0,0x808080,1.0,false)
		powerups.x5=x; powerups.y5=y; powerups.t5=type;
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=12
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
	tfm.exec.playSound("/transformice/son/tp.mp3", 70, nil, nil, name)
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/1000)
	time_remain=math.ceil(r/1000)
	if time_passed >= 6 and tfm.get.room.currentMap == "@7918679" then
		tfm.exec.disableAutoShaman(false)
		resetMap()
	end
	if changed == true then
		ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <VP><b>v4.0.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
		local m=math.floor(r/60000)
		local s=math.floor((((m*60000)-r) * -1) / 1000)
		ui.addTextArea(-1,"<font size='49'><font color='#222222'><font face='Castellar,Times New Roman'><b>"..m..":"..s.."</b>",n,557,22,125,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='49'><font color='#d0d0d0'><font face='Castellar,Times New Roman'><b>"..m..":"..s.."</b>",n,554,19,125,54,0,0,1.0,true)
		if s < 10 then
			ui.addTextArea(-1,"<font size='49'><font face='Castellar,Times New Roman'><font color='#222222'><b>"..m..":0"..s.."</b>",n,557,22,125,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='49'><font color='#d0d0d0'><font face='Castellar,Times New Roman'><b>"..m..":0"..s.."</b>",n,554,19,125,54,0,0,1.0,true)
		end
		if mode == "game" then
			if loop >= 16 then
				if time_passed >= 60 then
					for i=1,5 do
						genPowerup(i,math.random(1,9),math.random(100,4700),math.random(600,1800))
					end
					loop=0
					tfm.exec.playSound("/transformice/son/invoc.mp3", 40, nil, nil, nil)
				end
			end
			if time_remain == 61 then
				showMessage("<ROSE>Restam 60 segundos!")
			end
			if time_remain == 31 then
				showMessage("<ROSE>Restam 30 segundos!")
			end
		end
		if mode == "game" or mode == "hide" then
			ui.addTextArea(31,"<font size='49'><font color='#222222'><font face='Castellar,Times New Roman'><b>"..alives.."</b>",n,135,22,80,54,0,0,1.0,true)
			ui.addTextArea(30,"<font size='49'><font color='#d0d0d0'><font face='Castellar,Times New Roman'><b>"..alives.."</b>",n,132,19,80,54,0,0,1.0,true)
			if timer > 0 then
				timer=timer-0.5
				tfm.exec.setWorldGravity(0,22)
			elseif timer == 0 then
				tfm.exec.setWorldGravity(0,10.5)
			end
			for n,q in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isShaman then
					if mode == "game" or mode == "hide" then
						if tfm.get.room.playerList[n].y < 498 then
							if data[n].o < 99 then
								data[n].o=data[n].o+1
							end
						data[n].y=0
					else
						if checkOxygenZones(n) == true then
							data[n].o=data[n].o-0.1
						else
							tfm.exec.playSound("/transformice/son/bulle2.mp3", 6, nil, nil, n)
							if tfm.get.room.playerList[n].y <= 1550 then
								data[n].o=data[n].o-0.5
								data[n].c=0
								elseif tfm.get.room.playerList[n].y > 1550 then
									data[n].o=data[n].o-0.8
									data[n].c=0
								end
							end
						end
					end
				end
			end
		else
			for i=-6,104 do
				ui.removeTextArea(i,nil)
			end
		end
		for n,q in next,tfm.get.room.playerList do
			if data[n] then
				if data[n].imaget >= 0 then
					data[n].imaget=data[n].imaget-0.5
				end
				if data[n].imaget == 0 then
					tfm.exec.removeImage(data[n].imageid)
				end
				data[n].x=tfm.get.room.playerList[n].x
				data[n].yp=tfm.get.room.playerList[n].y
				if mode == "game" then
					if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
						if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
							if not tfm.get.room.playerList[n].isShaman then
								tfm.exec.killPlayer(n)
								tfm.exec.setPlayerScore(n,1,true)
								tfm.exec.playSound("/deadmaze/monstres/m_4/attaque1.mp3", 90, nil, nil, n)
								tfm.exec.playSound("/deadmaze/monstres/m_4/touche_0.mp3", 60, nil, nil, shaman)
							end
						end
					end
					if data[n].t > 0 then
						data[n].t=data[n].t-0.5
						if data[n].t <= 0 then
							tfm.exec.removeObject(data[n].i)
							tfm.exec.freezePlayer(n,false)
							tfm.exec.removeCheese(n)
						end
					end
					if not tfm.get.room.playerList[n].isDead then
						if data[n].o <= 0 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, n)
							tfm.exec.killPlayer(n)
							showMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
							tfm.exec.addShamanObject(54, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
						end
					end
				end
				if mode == "game" or mode == "hide" then
					if data[n].o > 30 then
						ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
						data[n].d=0
						tfm.exec.setNameColor(n,0xc2c2da)
					elseif data[n].o > 0 then
						tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, n)
						ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0x801500,0xa01000,1.0,true)
						data[n].d=data[n].d+1
						tfm.exec.setNameColor(n,0xff4500)
						if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 498 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mh0.mp3", 25+(30-math.floor(data[n].o)), nil, nil, n)
							showMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
						end
						if data[n].d > 7 then
							data[n].d=0
						end
					end
				else
					ui.removeTextArea(10,nil)
					ui.removeTextArea(300,nil)
				end
			end
		end
		if r <= 2000 and mode == "hide" then
			mode="game"
			tfm.exec.setGameTime(210+math.floor(alives*2.5))
			ui.removeTextArea(22,nil)
			showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <b>!</b> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.<br><br><VP>As áreas marcadas por preto e amarelo são zonas de oxigênio. Fique nelas para ter seu consumo de oxigênio reduzido.")
			moveShaman()
			for n,p in next,tfm.get.room.playerList do
				ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
				tfm.exec.playSound("cite18/squelette-spawn.mp3", 80, nil, nil, n)
			end
		end
		if r <= 1000 and mode == "game" then
			tfm.exec.setGameTime(15)
			mode="end"
			local lives=0
			for n,p in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
					lives=lives+1
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
					tfm.exec.setPlayerScore(n,10,true)
				end
				ui.removeTextArea(300,n)
			end
			showMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
		end
		if time_remain <= 0 and mode == "end" then
			resetMap()
		end
	else
		if time_passed >= 5 and changed == false and mode == "load" then
			tfm.exec.disableAutoShaman(false)
			resetMap()
			changed=true
			mode="hide"
		end
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a><br><a href='event:skins'>Skins</a>",name,355,55,90,75,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
		removeImagePlayers(name)
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "cred" then
		eventChatCommand(name,"creditos")
	end
	if callback == "change" then
		eventChatCommand(name,"changelog")
	end
	if callback == "skins" then
		eventChatCommand(name,"skins")
	end
	if callback == "a0" then
		data[name].shark=0
		tfm.exec.removeImage(data[name].shark_id)
		showMessage("<N>Você desativou as skins de tubarão.",name)
	end
	if callback == "a1" then
		data[name].shark=1
		showMessage("<VP>Você está agora usando a skin <b>Tubarão Normal 1.</b>",name)
	end
	if callback == "a2" then
		data[name].shark=2
		showMessage("<VP>Você está agora usando a skin <b>Tubarão Normal 2.</b>",name)
	end
	if callback == "a3" then
		data[name].shark=3
		showMessage("<VP>Você está agora usando a skin <b>Tubarão Normal 3.</b>",name)
	end
	if callback == "a4" then
		data[name].shark=4
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Branco.</b>",name)
	end
	if callback == "a5" then
		data[name].shark=5
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Martelo.</b>",name)
	end
end
resetMap()
