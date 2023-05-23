admin={""} -- Insira o nome dos FunCorps aqui!

for _,f in next,{"AutoNewGame","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables","PrespawnPreview","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog","reset","skins"} do
	system.disableChatCommandDisplay(f)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(40) end

shaman=""; alives=0; cannons=10; z=0; data={}; mode="load"; changed=false; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
active_imgs={}; active_imgs2={}; powerups_x={}; powerups_y={}; powerups_types={}; oxygen_x={}; oxygen_y={};
d1={2670,5585,3580}; d2={1040,1900,1820};
e1={5170,4288,3942,3080,2808,2398,123,744,4335,5777,543}; e2={760,1578,850,840,1441,999,987,2144,1953,2578,1132};
e3={5150,4944,4350,3885,3499,1610,3696,2870,1997,3100,1366,950,5660}; e4={1280,1488,1190,1080,819,750,1449,2330,2090,2700,1666,1400,1720};

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		debug.disableEventLog(true)
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
	-- 1883efa1974.png
	for _,link in next,{"18309d69a5a.png","18309d64e58.png","18309d7325a.png","18412b7b55e.png","18412b71ce2.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",83,60+(i*49),name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"18309d6029f.png","18412b7695c.png","1883efa677b.png","18309d6e65a.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",293,60+(i*48),name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1883efa1974.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",293,305,name,0.2,0.2,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"185c2e9722e.png","185c2ea0c4f.png","185c2e9bf2f.png","1883efb0ba3.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",503,60+(i*54),name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	ui.addTextArea(1006,"<i><font size='11.5'><b>Tubarão Normal 1</b><br><br><a href='event:a1'>Usar!</a><br><br><b>Tubarão Normal 2</b><br><br><a href='event:a2'>Usar!</a><br><br><b>Tubarão Normal 3</b><br><br><a href='event:a3'>Usar!</a><br><br><b>Tubarão Normal 4</b><br><br><a href='event:a6'>Usar!</a><br><br><b>Barracuda</b><br><br><a href='event:a13'>Usar!</a>",name,170,100,175,315,0,0,1.0,true)
	ui.addTextArea(1007,"<i><font size='11.5'><b>Tubarão Branco 1</b><br><br><a href='event:a4'>Usar!</a><br><br><b>Tubarão Branco 2</b><br><br><a href='event:a7'>Usar!</a><br><br><b>Tubarão Branco 3</b><br><br><a href='event:a5'>Usar!</a><br><br><b>Tubarão-Martelo</b><br><br><a href='event:a8'>Usar!</a><br><br><b>Baleia 3</b><br><br><a href='event:a14'>Usar!</a>",name,380,100,175,265,0,0,1.0,true)
	ui.addTextArea(1008,"<i><font size='11.5'><b>Peixe Diabo-Negro</b><br><br><a href='event:a9'>Usar!</a><br><br><b>Tubarão-Tigre</b><br><br><a href='event:a11'>Usar!</a><br><br><b>Baleia 1</b><br><br><a href='event:a10'>Usar!</a><br><br><b>Baleia 2</b><br><br><a href='event:a12'>Usar!</a><br><br><br><b><a href='event:a0'>Desativar skins</a>",name,590,100,175,265,0,0,1.0,true)
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
			data[name].shark_id=tfm.exec.addImage("1883efa677b.png","$"..name.."",-90,-45,nil,1,1)
		else
			data[name].shark_id=tfm.exec.addImage("1883efa677b.png","$"..name.."",80,-45,nil,-1,1)
		end
	elseif type == 6 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b7b55e.png","$"..name.."",85,-40,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b7b55e.png","$"..name.."",-90,-40,nil,1,1)
		end
	elseif type == 7 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b7695c.png","$"..name.."",65,-39,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b7695c.png","$"..name.."",-70,-39,nil,1,1)
		end
	elseif type == 8 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",85,-55,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",-90,-55,nil,1,1)
		end
	elseif type == 9 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2e9722e.png","$"..name.."",35,-60,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2e9722e.png","$"..name.."",-40,-60,nil,1,1)
		end
	elseif type == 10 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2e9bf2f.png","$"..name.."",65,-44,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2e9bf2f.png","$"..name.."",-70,-44,nil,1,1)
		end
	elseif type == 11 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2ea0c4f.png","$"..name.."",75,-36,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2ea0c4f.png","$"..name.."",-80,-36,nil,1,1)
		end
	elseif type == 12 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("1883efb5982.png","$"..name.."",-145,-30,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("1883efb5982.png","$"..name.."",130,-30,nil,-0.5,0.5)
		end
	elseif type == 13 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b71ce2.png","$"..name.."",75,-26,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b71ce2.png","$"..name.."",-80,-26,nil,1,1)
		end
	elseif type == 14 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("1883efa1974.png","$"..name.."",-115,-37,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("1883efa1974.png","$"..name.."",100,-37,nil,-0.5,0.5)
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
	for d=1,rawlen(d2) do
		tfm.exec.addImage("1860ee29c2f.png","?1",d1[d],d2[d],name)
	end
	for e=1,rawlen(e2) do
		tfm.exec.addImage("1860ee24f31.png","?1",e1[e],e2[e],name,0.5,0.5)
	end
	for f=1,rawlen(e4) do
		tfm.exec.addImage("1860ee24f31.png","?1",e3[f],e4[f],name,-0.5,0.5)
	end
	tfm.exec.addImage("1860ee2e933.png","?1",1600,2480,name,-1,1)
	tfm.exec.addImage("1860ee2e933.png","?1",4250,2300,name)
	for a=0,4 do
		tfm.exec.addImage("1860ee4bc27.png","?1",-800+(a*1762),680,name,1,1,0,1)
		tfm.exec.addImage("1860ee4bc27.png","!1",-800+(a*1762),680,name,1,1,0,0.6)
	end
	for b=0,10 do
		tfm.exec.addImage("1860ee46b2e.jpg","?1",-800+(b*690),1012,name,1,3.2,0,1)
		tfm.exec.addImage("1860ee41de2.png","!1",-800+(b*690),1012,name,1,3.2,0,1)
		tfm.exec.addImage("1860ee46b2e.jpg","?1",-800+(b*690),4852,name,1,-3.2,0,1)
		tfm.exec.addImage("1860ee41de2.png","!1",-800+(b*690),4852,name,1,-3.2,0,1)
	end
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-800,-1000,name,11,1.6,0,1)
	tfm.exec.addImage("1860ee201fd.png","!1",1640,1888,name,-1,1)
	tfm.exec.addImage("1860ee201fd.png","!1",5282,1291,name)
	tfm.exec.addImage("1860ee201fd.png","!1",330,1169,name,-1,1)
	tfm.exec.addImage("1860ee201fd.png","!1",4000,1304,name,-1,1)
	for _,m in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","!1",-1200+(m*1400),3198,name,1,-1.5,0,1)
	end
	for _,n in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","!1",200+(n*1400),3198,name,-1,-1.5,0,1)
	end
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","!1",-1200+(h*1400),2700,name,1,0.5,0,1)
	end
	for _,j in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","!1",200+(j*1400),2700,name,-1,0.5,0,1)
	end
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
		tfm.exec.setPlayerScore(n,1,true)
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage("<R>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			tfm.exec.setPlayerScore(shaman,-2,false)
			mode="end"
			tfm.exec.setGameTime(10)
			for n,_ in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isDead then
					tfm.exec.setPlayerScore(n,1,true)
					alives=alives+1
					ui.removeTextArea(300,n)
				end
			end
		end
	end
end
function moveShaman()
	position=math.random(1,3)
	if position == 1 then
		tfm.exec.movePlayer(shaman,380,340,false,0,0,false)
	elseif position == 2 then
		tfm.exec.movePlayer(shaman,3280,500,false,0,0,false)
	elseif position == 3 then
		tfm.exec.movePlayer(shaman,5645,400,false,0,0,false)
	end
end
function checkOxygenZones(name)
	if tfm.get.room.playerList[name].x >= 545 and tfm.get.room.playerList[name].x <= 625 then
		if tfm.get.room.playerList[name].y >= 1555 and tfm.get.room.playerList[name].y <= 1650 then
			return true
		end
	end
	if  tfm.get.room.playerList[name].x >= 1960 and tfm.get.room.playerList[name].x <= 2080 then
		if tfm.get.room.playerList[name].y >= 2640 and tfm.get.room.playerList[name].y <= 2710 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 4510 and tfm.get.room.playerList[name].x <= 4630 then
		if tfm.get.room.playerList[name].y >= 1900 and tfm.get.room.playerList[name].y <= 1985 then
			return true
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	showWater(name)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <VP><b>v5.2.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
	newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["shark_id"]=0; ["shark"]=0; ["active_imgs"]={};
	};
	data[name] = newData;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><VP>Fuja do shaman (tubarão) e sobreviva no perigoso rio!<br><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module criado por Morganadxana#0000.",name)
	data[name].imageid2 = tfm.exec.addImage("1860ee3d02a.png","&1",724,224,name)
	data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,370,name,0.5,0.5)
	data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",152,370,name,0.5,0.5)
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,250,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do rio e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <N>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups.<br><br><N>Caso você seja shaman, você tem um limite de <b>10</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,100,520,270,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• VAMPIRO</b><N><br>Transforma seu rato em um vampiro, forçando você a ir para fora do rio.<br><ROSE><b>• ESCURIDÃO</b><N><br>Reduz drasticamente o campo de visão do seu rato.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma curta anomalia que puxa todos os ratos em direção ao fundo do rio.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio. Caso seu nível de oxigênio esteja muito baixo e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do rio, você provavelmente será levado para o fundo dele.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,150,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Shun_kazami#7014</b><N> - Criação do mapa<br><ROSE><b>• Akwimos#1937</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação das artes")
	end
	if message == "skins" then
		if name == "Morganadxana#0000" or name == "Akwimos#1937" or name == "Spectra_phantom#6089" or verifyAdmin(name) == true then
			showMessage("<R>As skins de tubarão serão exibidas quando você for shaman, e estiver dentro do rio!",name)
			showMenu(name,0x949494,65,68,670,285,"Skins","")
			showAvailableSharks(name)
		else
			if tfm.get.room.playerList[name].isShaman == true then
				showMessage("<R>As skins de tubarão serão exibidas quando você for shaman, e estiver dentro do rio!",name)
				showMenu(name,0x949494,65,68,670,285,"Skins","")
				showAvailableSharks(name)
			else
				showMessage("<J>Para evitar bugs, não é mais possível trocar de skin de tubarão enquanto for shaman.",name)
			end
		end
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,130,520,115,"Changelog da Versão 5.2.0","• Pequenas correções de bugs<br>• Adição de 3 novos animais: Baleia 2, Baleia 3 e Tubarão-Martelo 3<br>• A física personalizada da água foi removida<br>• Redução do número de objetos usáveis pelo shaman de 12 para 10")
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
		showMessage("<R>Você não pode mais invocar objetos! Fazer isso ocasionará na sua morte e na perda de sua vez de shaman.",name)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame("@7928958")
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
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VAMPIRO!</b>")
		dropPlayer(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 2 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
		queijo(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 3 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>ESCURIDÃO!</b>")
		escuro(name)
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
			count=math.random(20,50)
			data[name].o=data[name].o-count
			if data[name] and data[name].o <= 1 then
				data[name].o=1
			end
		end
		tfm.exec.playSound("/cite18/combo2.mp3", 75, nil, nil, name)
	elseif id == 7 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
		congelar(name)
	end
	powerups_x[number]=-1024; powerups_y[number]=-1024; powerups_types[number]=-1;
	tfm.exec.removeImage(active_imgs[number])
end
function activateOxygen(name,number)
	if data[name] then
		count=math.random(10,65);
		data[name].o=data[name].o+count
		if data[name].o > 100 then
			data[name].o=100
		end
	end
	oxygen_x[number]=-1024; oxygen_y[number]=-1024;
	tfm.exec.removeImage(active_imgs2[number])
end
function eventKeyboard(name,key,down,x,y)
	if key == 32 and mode == "game" and time_passed >= 125 then
		for i=1,6 do
			if x >= powerups_x[i] and x <= powerups_x[i]+51 then
				if y >= powerups_y[i] and y <= powerups_y[i]+51 then
					activatePowerup(name,powerups_types[i],i)
				end
			end
		end
		for i=1,7 do
			if x >= oxygen_x[i] and x <= oxygen_x[i]+51 then
				if y >= oxygen_y[i] and y <= oxygen_y[i]+51 then
					activateOxygen(name,i)
				end
			end
		end
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if shaman == name and data[name].shark >= 1 then
			if data[name] and tfm.get.room.playerList[name].y >= 705 then
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
		for n,p in next,tfm.get.room.playerList do
			showWater(n)
			tfm.exec.giveMeep(n,false)
			tfm.exec.removeImage(data[n].shark_id)
			tfm.exec.changePlayerSize(n,1)
			if n:sub(1,1) == "*" then
				tfm.exec.killPlayer(n)
				showMessage("<R>Jogadores convidados não podem jogar este jogo. Logue em uma conta para jogar #watercatch.",name)
				tfm.exec.setPlayerScore(n,-2,false)
			end
			alives=alives+1
			data[n].o=100; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
			for i=32,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			if tfm.get.room.playerList[n].isShaman then
				tfm.exec.setShamanMode(n,0)
				tfm.exec.setPlayerScore(n,-1,false)
				if tfm.get.room.isTribeHouse == false then
					tfm.exec.setPlayerSync(n)
				end
				showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez de shaman!",n)
				shaman=n
				alives=alives-1
			end
			ui.addTextArea(300,"",n,740,255,8,145,0x202020,0x121212,1.0,true)
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
function genPowerup()
	for i=1,6 do
		temp_x=math.random(500,5500); temp_y=math.random(750,2950); type=math.random(1,7);
		imageId = tfm.exec.addImage("1860ee33630.png","!1",temp_x,temp_y,nil)
		table.insert(powerups_x,temp_x); table.insert(powerups_y,temp_y); table.insert(powerups_types,type);
		table.insert(active_imgs,imageId)
	end
end
function genOxygen()
	for i=1,7 do
		temp_x1=math.random(500,5500); temp_y1=math.random(750,2950);
		imageId1 = tfm.exec.addImage("1860ee38326.png","!1",temp_x1,temp_y1,nil)
		table.insert(oxygen_x,temp_x1); table.insert(oxygen_y,temp_y1);
		table.insert(active_imgs2,imageId1)
	end
end
function removePowerups()
	for i=1,rawlen(active_imgs) do
		tfm.exec.removeImage(active_imgs[i])
	end
	for i=1,rawlen(active_imgs2) do
		tfm.exec.removeImage(active_imgs2[i])
	end
	active_imgs={}; active_imgs2={}; powerups_x={}; powerups_y={}; powerups_types={}; oxygen_x={}; oxygen_y={};
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=9
	tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=8
end
function escuro(name)
	tfm.exec.setPlayerNightMode(true, name)
	data[name].t=10
end
function dropPlayer(name)
	tfm.exec.setVampirePlayer(name, true)
	tfm.exec.setPlayerGravityScale(name, 0.35, 1)
	data[name].t=10
	tfm.exec.playSound("/transformice/son/tp.mp3", 70, nil, nil, name)
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/500)
	time_remain=math.ceil(r/500)
	if time_passed >= 12 and tfm.get.room.currentMap == "@7928958" then
		tfm.exec.disableAutoShaman(false)
		resetMap()
	end
	if changed == true then
		ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <VP><b>v5.2.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
		local m=math.floor(r/60000)
		local s=math.floor((((m*60000)-r) * -1) / 1000)
		ui.addTextArea(-1,"<font size='30'><font color='#222222'><font face='Calisto MT,Times New Roman'><b>"..m..":"..s.."</b>",n,222,368,125,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..m..":"..s.."</b>",n,220,366,125,54,0,0,1.0,true)
		if s < 10 then
			ui.addTextArea(-1,"<font size='30'><font face='Calisto MT,Times New Roman'><font color='#222222'><b>"..m..":0"..s.."</b>",n,222,368,125,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..m..":0"..s.."</b>",n,220,366,125,54,0,0,1.0,true)
		end
		if mode == "game" then
			if loop >= 30 then
				if time_passed >= 120 then
					removePowerups()
					genPowerup()
					genOxygen()
					loop=0
					tfm.exec.playSound("/transformice/son/invoc.mp3", 40, nil, nil, nil)
				end
			end
			if time_remain == 120 then
				showMessage("<ROSE>Restam 60 segundos!")
			end
			if time_remain == 60 then
				showMessage("<ROSE>Restam 30 segundos!")
			end
		end
		if mode == "game" or mode == "hide" then
			ui.addTextArea(31,"<font size='30'><font color='#222222'><font face='Calisto MT,Times New Roman'><b>"..alives.."</b>",n,72,368,80,54,0,0,1.0,true)
			ui.addTextArea(30,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..alives.."</b>",n,70,366,80,54,0,0,1.0,true)
			if timer > 0 then
				timer=timer-0.5
				tfm.exec.setWorldGravity(0,22)
			elseif timer == 0 then
				tfm.exec.setWorldGravity(0,10)
			end
			for n,q in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isShaman then
					if not tfm.get.room.playerList[n].isDead then
						if mode == "game" or mode == "hide" then
							if tfm.get.room.playerList[n].y < 695 then
								if data[n].o < 99 then
									data[n].o=data[n].o+1
								end
							data[n].y=0
						else
							if checkOxygenZones(n) == true then
								data[n].o=data[n].o+0.1
							else
								tfm.exec.playSound("/transformice/son/bulle2.mp3", 6, nil, nil, n)
								if tfm.get.room.playerList[n].y <= 1500 then
									data[n].o=data[n].o-0.3
									data[n].c=0
								elseif tfm.get.room.playerList[n].y > 1500 and tfm.get.room.playerList[n].y <= 2400 then
									data[n].o=data[n].o-0.45
									data[n].c=0
								elseif tfm.get.room.playerList[n].y > 2400 then
									data[n].o=data[n].o-0.6
									data[n].c=0
								end
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
				data[n].x=tfm.get.room.playerList[n].x
				data[n].yp=tfm.get.room.playerList[n].y
				if mode == "game" then
					if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
						if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
							if not tfm.get.room.playerList[n].isShaman then
								tfm.exec.killPlayer(n)
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
							tfm.exec.setPlayerNightMode(false, n)
							tfm.exec.setVampirePlayer(n, false)
							tfm.exec.setPlayerGravityScale(n, 1, 1)
						end
					end
					if not tfm.get.room.playerList[n].isDead then
						if data[n].o <= 0 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, n)
							tfm.exec.killPlayer(n)
							showMessage("<J>O jogador <b>"..n.."</b> morreu afogado!")
							tfm.exec.addShamanObject(59, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
						end
					end
				end
				if mode == "game" or mode == "hide" then
					if data[n].o > 30 then
						ui.addTextArea(10,"",n,740,400-(data[n].o*1.45),8,145,0xf0f0f0,0x808080,1.0,true)
						data[n].d=0
					elseif data[n].o > 0 then
						tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, n)
						ui.addTextArea(10,"",n,740,400-(data[n].o*1.45),8,145,0x801500,0xa01000,1.0,true)
						data[n].d=data[n].d+1
						if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 498 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mh0.mp3", 35+(30-math.floor(data[n].o)), nil, nil, n)
							showMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
						end
						if data[n].d > 10 then
							data[n].d=0
						end
					end
				else
					ui.removeTextArea(10,nil)
					ui.removeTextArea(300,nil)
				end
			end
		end
		if r <= 1500 and mode == "hide" then
			mode="game"
			tfm.exec.setGameTime(225+(alives*5))
			ui.removeTextArea(22,nil)
			showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
			moveShaman()
			for n,p in next,tfm.get.room.playerList do
				ui.addTextArea(300,"",n,740,255,8,145,0x202020,0x121212,1.0,true)
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
				end
				ui.removeTextArea(300,n)
			end
			showMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
		end
		if time_remain <= 0 and mode == "end" then
			resetMap()
		end
	else
		if time_passed >= 10 and changed == false and mode == "load" then
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
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008} do
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
		tfm.exec.changePlayerSize(name,1)
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
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Branco 1.</b>",name)
	end
	if callback == "a5" then
		data[name].shark=5
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Branco 3.</b>",name)
	end
	if callback == "a6" then
		data[name].shark=6
		showMessage("<VP>Você está agora usando a skin <b>Tubarão Normal 4.</b>",name)
	end
	if callback == "a7" then
		data[name].shark=7
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Branco 2.</b>",name)
	end
	if callback == "a8" then
		data[name].shark=8
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Martelo.</b>",name)
	end
	if callback == "a9" then
		data[name].shark=9
		showMessage("<VP>Você está agora usando a skin <b>Peixe Diabo-Negro.</b>",name)
	end
	if callback == "a10" then
		data[name].shark=10
		showMessage("<VP>Você está agora usando a skin <b>Baleia 1.</b>",name)
	end
	if callback == "a11" then
		data[name].shark=11
		showMessage("<VP>Você está agora usando a skin <b>Tubarão-Tigre.</b>",name)
	end
	if callback == "a12" then
		data[name].shark=12
		showMessage("<VP>Você está agora usando a skin <b>Baleia 2.</b>",name)
	end
	if callback == "a13" then
		data[name].shark=13
		showMessage("<VP>Você está agora usando a skin <b>Barracuda.</b>",name)
	end
	if callback == "a14" then
		data[name].shark=14
		showMessage("<VP>Você está agora usando a skin <b>Baleia 3.</b>",name)
	end
end
resetMap()
