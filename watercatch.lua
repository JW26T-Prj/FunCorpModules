for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog"} do
	system.disableChatCommandDisplay(f)
end
tfm.exec.newGame("@7890357")
tfm.exec.setRoomMaxPlayers(35)
shaman=""; alives=0; cannons=10; z=0; data={}; mode="load"; changed=false; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
powerups={x1=-1,x2=-1,x3=-1,x4=-1,x5=-1,y1=-1,y2=-1,y3=-1,y4=-1,y5=-1,t1=0,t2=0,t3=0,t4=0,t5=0}
testmode=false;
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if testmode == false then
		tfm.exec.chatMessage(message,name)
	elseif testmode == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function showWater(name)
	tfm.exec.addImage("17be536e980.png","?1",-200,1820,name,0.5,0.5,0,1)
	tfm.exec.addImage("17be536e980.png","?1",2400,1820,name,0.5,0.5,0,1)
	tfm.exec.addImage("17df24985c5.png","?1",40,330,name)
	tfm.exec.addImage("17def3df6c5.jpg","?1",-300,347,name,1,1.1)
	tfm.exec.addImage("17def3e4466.png","!1",-300,306,name,12,1.7,0,0.95)
	tfm.exec.addImage("17def3da8f8.png","!1",-225,337,name,1,1,0,0.7125)
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
				alives=alives+1
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
				ui.removeTextArea(300,n)
			end
		end
	end
end
function eventNewPlayer(name)
	showWater(name)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v2.2.5</b><N> - criado por <ROSE><b>Morganadxana#0000</b> <N>e <R><b>Spectra_phantom#6089</b><")
	newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["imaget"]=5;
	};
	data[name] = newData;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module criado por Morganadxana#0000. Mapa feito por Spectra_phantom#6089.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
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
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>10</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,76,520,315,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 18%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação do mapa e das artes")
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Changelog da Versão 2.2.5","• Adição de algumas decorações na água<br>• Pequenas mudanças na barra de oxigênio<br>• Aumento na duração das rodadas")
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
	if (message:sub(0,4)== "kill") and name == "Morganadxana#0000" then
		tfm.exec.killPlayer(message:sub(6))
	end
end
function eventSummoningEnd(name,id,x,y)
	if id > 0 then
		cannons=cannons-1
		if cannons >= 1 then
			showMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
		elseif cannons == 0 then
			showMessage("<VP>O shaman não pode mais usar objetos!")
		else
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
		tfm.exec.newGame("@7763582")
		changed=false
		mode="load"
	else
		tfm.exec.newGame(xml)
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				powerups.x1=-1
				powerups.y1=-1
				ui.removeTextArea(100,nil)
				if powerups.t1 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t1 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t1 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t1 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t1 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t1 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t1 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t1 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t1 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				powerups.x2=-1
				powerups.y2=-1
				ui.removeTextArea(101,nil)
				if powerups.t2 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t2 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t2 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t2 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t2 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t2 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t2 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t2 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t2 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				powerups.x3=-1
				powerups.y3=-1
				ui.removeTextArea(102,nil)
				if powerups.t3 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t3 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t3 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t3 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t3 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t3 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t3 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t3 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t3 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				powerups.x4=-1
				powerups.y4=-1
				ui.removeTextArea(103,nil)
				if powerups.t4 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t4 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t4 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t4 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t4 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t4 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t4 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t4 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t4 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x5-10 and tfm.get.room.playerList[name].x < powerups.x5+34 then
			if tfm.get.room.playerList[name].y > powerups.y5-10 and tfm.get.room.playerList[name].y < powerups.y5+34 then
				powerups.x5=-1
				powerups.y5=-1
				ui.removeTextArea(104,nil)
				if powerups.t5 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t5 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t5 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t5 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t5 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t5 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t5 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t5 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t5 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
	end		
end
function eventNewGame()
ui.setBackgroundColor("#867561")
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
	showMessage("<J>Caso o mapa do jogo não esteja aparecendo, saia do jogo e entre novamente.<br>Isto é um problema de memória do Transformice e não do module.")
	tfm.exec.giveMeep(n,false)
	if n:sub(1,1) == "*" then
		tfm.exec.killPlayer(n)
	end
	alives=alives+1
	data[n].o=99; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
	tfm.exec.bindKeyboard(n,32,true,true)
	if tfm.get.room.playerList[n].isShaman then
		tfm.exec.setShamanMode(n,1)
		tfm.exec.setPlayerSync(n)
		ui.addTextArea(22,"",n,-800,-800,2400,2400,0x000001,0x000001,1.0,true)
		showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez como shaman!",n)
		shaman=n
		alives=alives-1
		showWater(name)
	end
	ui.addTextArea(300,"",n,8,386,782,8,0x202020,0x121212,1.0,true)
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
		ui.addTextArea(100,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x163616,0x122412,1.0,false)
		powerups.x1=x
		powerups.y1=y
		powerups.t1=type
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x163616,0x122412,1.0,false)
		powerups.x2=x
		powerups.y2=y
		powerups.t2=type
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x163616,0x122412,1.0,false)
		powerups.x3=x
		powerups.y3=y
		powerups.t3=type
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x163616,0x122412,1.0,false)
		powerups.x4=x
		powerups.y4=y
		powerups.t4=type
	elseif pos == 5 then
		ui.addTextArea(104,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x163616,0x122412,1.0,false)
		powerups.x5=x
		powerups.y5=y
		powerups.t5=type
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=6
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=6
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=6
end
function eventLoop(p,r)
loop=loop+0.5
time_passed=math.ceil(p/1000)
time_remain=math.ceil(r/1000)
if time_passed >= 6 and tfm.get.room.currentMap == "@7763582" then
	tfm.exec.disableAutoShaman(false)
	resetMap()
end
if changed == true then
ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v2.2.5</b><N> - criado por <ROSE><b>Morganadxana#0000</b> <N>e <R><b>Spectra_phantom#6089</b><")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='45'><font face='Trebuchet MS'><font color='#222222'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
end
if mode == "game" then
	if loop >= 24 then
		if time_passed >= 60 then
			for i=1,5 do
				genPowerup(i,math.random(1,11),math.random(1000,4000),math.random(500,1100))
			end
			loop=0
		end
	end
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(31,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,135,22,70,54,0,0,1.0,true)
	ui.addTextArea(30,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,132,19,70,54,0,0,1.0,true)
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
			if mode == "game" then
			if tfm.get.room.playerList[n].y < 348 then
				if data[n].o < 99 then
					data[n].o=data[n].o+1
				end
				data[n].y=0
			else
				if tfm.get.room.playerList[n].y <= 1150 then
					data[n].o=data[n].o-0.4
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 1150 then
					data[n].o=data[n].o-0.7
					data[n].c=0
				end
			end
			end
			if data[n].o <= 0 then
				tfm.exec.killPlayer(n)
				showMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
				tfm.exec.addShamanObject(54, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
			end
		end
		end
		if mode == "game" then
			if data[n].o > 30 then
				if mode == "game" or mode == "hide" then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
				data[n].d=0 end
				tfm.exec.setNameColor(n,0xc2c2da)
			elseif data[n].o > 0 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0x801500,0xa01000,1.0,true)
				data[n].d=data[n].d+1
				tfm.exec.setNameColor(n,0xff4500)
				if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 598 then
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
	tfm.exec.setGameTime(180+math.ceil(alives*3.2))
	ui.removeTextArea(22,nil)
	showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>!<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
	for n,p in next,tfm.get.room.playerList do
		ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.movePlayer(n,2450,160,false,0,0,false)
		end
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
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a>",name,355,55,90,60,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
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
end
