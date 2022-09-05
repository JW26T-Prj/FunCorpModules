admin={""} -- Insira o nome dos FunCorps aqui!
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog","reset","skins"} do
	system.disableChatCommandDisplay(f)
end

function eventNewGame()
	if changed == false then
		xml2=tfm.get.room.xmlMapInfo.xml
		ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		tfm.exec.setGameTime(5)
	else
		ui.removeTextArea(0,nil)
	end
end

shaman=""; ratos=0; alives=0; z=0; data={}; mode="wait"; loop=0; timer=0; xml=''; time_passed=0; time_remain=0; changed=false; xml2='';
powerups={x1=-1,x2=-1,x3=-1,x4=-1,y1=-1,y2=-1,y3=-1,y4=-1,t1=0,t2=0,t3=0,t4=0}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,message,name,250,100,300,true)
	end
end
function defineShaman()
	max_score=0
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].score >= max_score and not n == shaman then
			shaman=name
			tfm.exec.setPlayerScore(shaman,-1,false)
			tfm.exec.movePlayer(shaman,2600,-550,false,0,0,false)
			showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez de caçador!",name)
			showMessage("<ROSE><b>"..shaman.." <N>é o caçador! Fuja dele do jeito que for possível!",name)
			alives=alives-1
			max_score=tfm.get.room.playerList[name].score
			break
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
	for i=0,1 do
		tfm.exec.addImage("181f9cf5fc5.png", "?1", -800+(i*7180), 487, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("181f9cf5fc5.png", "!1", -800+(i*7180), 487, name, 1.0, 1.0, 0, 0.7)
		tfm.exec.addImage("181f9cfac65.png", "!1", -800+(i*7180), 545, name, 10, 16, 0, 1.0)
	end
	for b=0,1 do
		tfm.exec.addImage("181f9cff961.jpg","?1",-10,545+(b*3440),name,4.5,4)
	end
	for w=1,6 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(50,5000),math.random(-100,200),name,0.75,0.75)
	end
	for x=1,6 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(50,5000),math.random(-100,200),name,0.75,0.75)
	end
	for y=1,6 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(50,5000),math.random(-100,200),name,0.75,0.75)
	end
	for z=1,6 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(50,5000),math.random(-100,200),name,0.75,0.75)
	end
end
function eventPlayerDied(n)
	if changed == true then
		if not shaman == n then
			alives=alives-1
		end
		if mode == "hide" or mode == "game" then
			if shaman == n then
				showMessage("<J>O caçador morreu, está ausente ou saiu da sala. Iniciando nova partida...")
				mode="end"
				shaman=""
				tfm.exec.setGameTime(10)
				for n,_ in next,tfm.get.room.playerList do
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
					ui.removeTextArea(300,n)
				end
			end
		end
		if alives <= 0 then
			if mode == "game" then
				mode="end"
				tfm.exec.removeImage(data[shaman].shark_id)
				tfm.exec.changePlayerSize(shaman,1)
				shaman=""
				tfm.exec.setGameTime(15)
				showMessage("<VP><b>O caçador matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
			end
		end
		data[n].o=0
	end
end
function eventPlayerLeft(name)
	ratos=ratos-1;
end
function eventNewPlayer(name)
	if changed == true then
		tfm.exec.setPlayerScore(name,1,false)
		ui.setBackgroundColor("#5FA9D4")
		newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["moved"]=0; ["imaget"]=5; ["intoWater"]=false; ["shark_id"]=0; ["shark"]=3; ["active_imgs"]={};
	};
		data[name] = newData;
		ratos=ratos+1;
		showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module criado por Morganadxana#0000 e Akwimos#1937.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
		data[name].imaget=5
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
	end
	showWater(name)
	tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
	tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo oceano e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>8</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,76,520,315,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do oceano.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 25%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do oceano, você provavelmente será levado para o fundo dele.<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Akwimos#1937</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original, criação do mapa e das artes")
	end
	if message == "skins" then
		showMenu(name,0x949494,140,90,520,220,"Skins","As skins de tubarão serão exibidas apenas quando você for shaman, e estiver dentro do oceano!")
		showAvailableSharks(name)
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,100,"Changelog da Versão 3.5.2","• Não há mais shamans em questão. Isto foi adicionado para evitar uso de cubos de gelo.")
	end
	if (message:sub(0,2) == "tc") then
		if not shaman == n then
			for n,_ in next,tfm.get.room.playerList do
				if not shaman == n then
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
function activatePowerup(name,id,number)
	if id == 1 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
		dropPlayer(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 2 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
		data[name].o=data[name].o+40
		if data[name].o > 100 then
			data[name].o=100
		end
		tfm.exec.playSound("/deadmaze/objectif2.mp3", 75, nil, nil, name)
	elseif id == 3 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
		if tfm.get.room.playerList[name].isFacingRight == true then
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
		data[name].o=data[name].o-25
		if data[name].o < 1 then
			data[name].o=1
		end
		tfm.exec.playSound("/cite18/combo2.mp3", 75, nil, nil, name)
	elseif id == 7 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
		congelar(name)
	elseif id == 8 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
		queijo(name)
	elseif id == 9 then
		showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
		reduzir(name)
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
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				activatePowerup(name,math.random(1,9),1)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				activatePowerup(name,math.random(1,9),2)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				activatePowerup(name,math.random(1,9),3)
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				activatePowerup(name,math.random(1,9),4)
			end
		end
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if data[name].moved == 0 then
			data[name].moved=1
		end
		if shaman == name and data[name].shark >= 1 then
			if data[name].intoWater == true then
				tfm.exec.changePlayerSize(name,0.2)
				if key == 39 or key == 68 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,false)
				elseif key == 37 or key == 65 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,true)
				end
				if key == 38 or key == 40 or key == 83 or key == 87 then
					if tfm.get.room.playerList[name].isFacingRight then
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
function reset()
	if ratos >= 2 then
		mode="hide"; shaman=""; alives=0;
		for n,p in next,tfm.get.room.playerList do
			tfm.exec.respawnPlayer(n)
			tfm.exec.setShaman(n,false)
			tfm.exec.removeImage(data[n].shark_id)
			for i=32,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			tfm.exec.giveMeep(n,false)
			alives=alives+1
			data[n].o=99; data[n].moved=0; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		for i=1000,3000 do
			tfm.exec.removeObject(i)
		end
		defineShaman()
		ui.setBackgroundColor("#5FA9D4")
		z=-1; mode="hide";
		ui.removeTextArea(22,nil)
		tfm.exec.setGameTime(60)
	else
		mode="wait"
		showMessage("<R>São necessários pelo menos 2 ratos para jogar este module.")
		tfm.exec.setGameTime(20)
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
		ui.addTextArea(100,"<font size='18'><p align='center'>?",nil,x,y,22,22,0x161636,0x121224,1.0,false)
		powerups.x1=x; powerups.y1=y; powerups.t1=type;
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>?",nil,x,y,22,22,0x161636,0x121224,1.0,false)
		powerups.x2=x; powerups.y2=y; powerups.t2=type;
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>?",nil,x,y,22,22,0x161636,0x121224,1.0,false)
		powerups.x3=x; powerups.y3=y; powerups.t3=type;
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>?",nil,x,y,22,22,0x161636,0x121224,1.0,false)
		powerups.x4=x; powerups.y4=y; powerups.t4=type;
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=8
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
	tfm.exec.playSound("/transformice/son/tp.mp3", 70, nil, nil, name)
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=14
	tfm.exec.playSound("/transformice/son/resu.mp3", 55, nil, nil, name)
end
function eventLoop(p,r)
	if changed == true then
	loop=loop+0.5
	time_passed=math.ceil(p/1000)
	time_remain=math.ceil(r/1000)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v3.5.2</b><N> - criado por <ROSE><b>Morganadxana#0000</b> <N>e <BL><b>Akwimos#1937</b><")
	local m=math.floor(r/60000)
	local s=math.floor((((m*60000)-r) * -1) / 1000)
	ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	if s < 10 then
		ui.addTextArea(-1,"<font size='45'><font face='Trebuchet MS'><font color='#222222'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	end
	if mode == "wait" then
		if time_remain < 1 then
			reset()
		end
	end
	if mode == "hide" then
		if time_remain <= 30 and time_remain >= 29 then
			for n,p in next,tfm.get.room.playerList do
				if data[n].moved == 0 then
					tfm.exec.killPlayer(n)
				end
			end
		end
	end
	if mode == "game" then
		if loop >= 16 then
			if time_passed >= 60 then
				for i=1,4 do
					genPowerup(i,math.random(1,11),math.random(500,4700),math.random(450,1500))
				end
					tfm.exec.playSound("/transformice/son/invoc.mp3", 40, nil, nil, nil)
				loop=0
			end
		end
	end
	if mode == "game" or mode == "hide" then
		local lives=alives-1
		ui.addTextArea(31,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..lives.."</b>",n,135,22,70,54,0,0,1.0,true)
		ui.addTextArea(30,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..lives.."</b>",n,132,19,70,54,0,0,1.0,true)
		if timer > 0 then
			timer=timer-0.5
			tfm.exec.setWorldGravity(0,22)
		elseif timer == 0 then
			tfm.exec.setWorldGravity(0,10.5)
		end
	else
		for i=-6,104 do
			ui.removeTextArea(i,nil)
		end
	end
	for n,q in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[n].y <= 495 then
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: 0m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		else
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: "..math.floor(math.pow(tfm.get.room.playerList[n].y-495,1.6875)/2500).."m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		end
		if data[n] then
			data[n].x=tfm.get.room.playerList[n].x
			data[n].yp=tfm.get.room.playerList[n].y
			if mode == "game" then
				if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
					if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
						if not n == shaman then
							tfm.exec.killPlayer(n)
							tfm.exec.playSound("/deadmaze/monstres/m_4/attaque1.mp3", 90, nil, nil, n)
							tfm.exec.playSound("/deadmaze/monstres/m_4/touche_0.mp3", 60, nil, nil, shaman)
						end
					end
				end
			end
			if data[n].t > 0 then
				data[n].t=data[n].t-0.5
				if data[n].t <= 0 then
					tfm.exec.removeObject(data[n].i)
					tfm.exec.freezePlayer(n,false)
					tfm.exec.removeCheese(n)
					tfm.exec.changePlayerSize(n,1)
				end
			end
			if not tfm.get.room.playerList[n].isDead then
				if mode == "game" or mode == "hide" then
					if tfm.get.room.playerList[n].y < 500 then
						data[n].intoWater=false
						if data[n].o < 99 then
							data[n].o=data[n].o+1
						end
						data[n].y=0
					else
						data[n].intoWater=true
						tfm.exec.playSound("/transformice/son/bulle2.mp3", 5, nil, nil, n)
						if shaman == n then
							if tfm.get.room.playerList[n].y <= 1700 then
								data[n].o=data[n].o-0.2; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 1700 and tfm.get.room.playerList[n].y <= 2500 then
								data[n].o=data[n].o-0.4; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 2500 and tfm.get.room.playerList[n].y <= 3660 then
								data[n].o=data[n].o-0.6; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 3700 then
								data[n].o=data[n].o-0.8; data[n].c=0;
							end
						else
							if tfm.get.room.playerList[n].y <= 1700 then
								data[n].o=data[n].o-0.3; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 1700 and tfm.get.room.playerList[n].y <= 2500 then
								data[n].o=data[n].o-0.6; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 2500 and tfm.get.room.playerList[n].y <= 3660 then
								data[n].o=data[n].o-0.9; data[n].c=0;
							elseif tfm.get.room.playerList[n].y > 3660 then
								data[n].o=data[n].o-1.2; data[n].c=0;
							end
						end
					end
				end
				if data[n].o <= 0 then
					tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, n)
					tfm.exec.killPlayer(n)
					showMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
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
				if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 598 then
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
	if r <= 2000 and mode == "hide" then
		mode="game"
		tfm.exec.setGameTime(180+math.ceil(alives*2.6))
		ui.removeTextArea(22,nil)
		showMessage("<J><b>O caçador foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>?<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o caçador saiba.")
		for n,p in next,tfm.get.room.playerList do
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
		end
		tfm.exec.movePlayer(shaman,2600,196,false,0,0,false)
	end
	if r <= 1000 and mode == "game" then
		tfm.exec.setGameTime(15)
		mode="end"
		for n,p in next,tfm.get.room.playerList do
			if not n == shaman and not tfm.get.room.playerList[n].isDead then
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
			end
		end
		tfm.exec.killPlayer(shaman)
		shaman=""
		local final_a=alives-1
		showMessage("<VP>Tempo esgotado! <b>"..final_a.."</b> ratos sobreviveram! Iniciando nova partida...")
		ui.removeTextArea(300,n)
	end
	if p >= 5000 and p <= 6125 then
		for n,p in next,tfm.get.room.playerList do
			if data[n] and tfm.get.room.playerList[n].y == 334 then
				showMessage("<R>Aviso: Não há mais memória disponível para o Transformice. Para poder entrar neste mapa, saia do jogo e entre novamente.",name)
			end
		end
	end
	if r <= 200 and mode == "end" then
		reset()
	end
	else
		if r <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
			for name,player in next,tfm.get.room.playerList do
				eventNewPlayer(name)
			end
			reset()
		end
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a><br><a href='event:skins'>Skins</a>",name,355,85,90,75,0x000001,0x000001,0.80,true)
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
tfm.exec.newGame("@7914623")
