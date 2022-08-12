admin={""} -- Insira o nome dos FunCorps aqui!
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog"} do
	system.disableChatCommandDisplay(f)
end
rd = {title = 117, look = "201;0,6_2651d3+3d65a6,23,34,40,63_21f1f6+475edc+471ebb+5991d7+19809b,33_2b7dde+538be1,58,18_86b78+b78d1",x = 268,y = 1893,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
ld = {title = 42, look = "138;228,49_332301+c38a07+bc7718+570e00,63_242b2c+5d7250+562d1a+572f14,11,44,82,0,0,36_3d0807+6a720a",x = 4391,y = 4058,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
ku = {title = 35, look = "201;224,48_131313+0,27,74_141b22+70d,2_1a1a1a,40_23566c+f0f0f,36,2,0",x = 3009,y = 4808,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
mf = {title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 5018,y = 319,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
dr = {title = 43, look = "150;194,6_c926d3+a63d91,39,0,0,0,0,0,0",x = 4574,y = 2329,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
cs = {title = 257, look = "1;44,40,87,3,62,91,37,52,0",x = 2475,y = 359,female = true,lookLeft = false,lookAtPlayer = true,interactive = true}
dw = {title = 2, look = "1;203,50,20,41,42,103,50,0,0",x = 2726,y = 359,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
kp = {title = 11, look = "1;16,5,20,73,26,94,29,62,46",x = 3698,y = 435,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
ag = {title = 9, look = "4;225,43,38,0,54,104,0,0,20",x = 60,y = 409,female = false,lookLeft = false,lookAtPlayer = true,interactive = true}
tfm.exec.newGame("@7913164")

function initNPC(name)
	tfm.exec.addNPC("Rheylean Darther",rd,name)
	tfm.exec.addNPC("Lord Dowryammer",ld,name)
	tfm.exec.addNPC("Keith Under",ku,name)
	tfm.exec.addNPC("Mayra Flowers",mf,name)
	tfm.exec.addNPC("Dylan Reigns",dr,name)
	tfm.exec.addNPC("Camille Sanders",cs,name)
	tfm.exec.addNPC("Daniel Winngs",dw,name)
	tfm.exec.addNPC("King Pirate",kp,name)
	tfm.exec.addNPC("Aaron Grand",ag,name)
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

tfm.exec.setRoomMaxPlayers(40)
shaman=""; ratos=0; alives=0; cannons=6; z=0; data={}; mode="wait"; loop=0; timer=0; xml=''; time_passed=0; time_remain=0; changed=false; xml2='';
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
		if tfm.get.room.playerList[name].score >= max_score and not tfm.get.room.playerList[name].isShaman then
			shaman=name
			tfm.exec.setShaman(shaman)
			tfm.exec.setPlayerScore(shaman,-1,false)
			tfm.exec.setShamanMode(shaman,1)
			tfm.exec.movePlayer(shaman,2600,-550,false,0,0,false)
			showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez como shaman!",name)
			alives=alives-1
			max_score=tfm.get.room.playerList[name].score
			break
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
	tfm.exec.addImage("17f74387366.png","!1",-600,513,name,20,2.75,0,1)
	tfm.exec.addImage("17f74378b9a.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f7437d864.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f74378b9a.png","!1",-600,471,name,1,1,0,0.44)
	tfm.exec.addImage("17f74382569.jpg","?1",-600,513,name,2,1.375,0,1)
end
function eventTalkToNPC(name, npc)
	if npc == "Rheylean Darther" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Rheylean Darther] <N>Quem ousa a mergulhar nas minhas sagradas águas, e interromper a paz de <ROSE><b>Rheylean Darther</b>?<br><br><BL>Ah, é só mais um desavisado... <J>SAIA DE MINHA PRESENÇA AGORA, OU SENTIRÁ A MINHA FÚRIA!",name)
		else
			showMessage("<V>[Rheylean Darther] <VP>Vá, e devore todos estes enfadonhos em meu nome! <b>AGORA!</b>",name)
		end
	elseif npc == "Lord Dowryammer" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Lord Dowryammer] <N>Seja bem-vindo(a) ao meu recife de peixes.<br><br>Desde que o cataclisma começou, usei meus poderes secretos para aprender a mergulhar. Pensa como isso foi importante para mim...<br><br>Graças a isso, criei um recife de peixes, onde os crio para sobreviver até tudo isso acabar.<br><br><J>Mas... mal sabe você que o cataclisma não é o maior problema... O grande problema é o tal do <VP>shaman...<br><J>Falando nisso, ele ainda está aqui?",name)
		else
			showMessage("<V>[Lord Dowryammer] <R>Saia daqui agora, seu monstro imundo! Você nunca vai conseguir me pegar de novo!",name)
		end
	elseif npc == "Keith Under" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Keith Under] <N>Você tem muita coragem de estar aqui no mar profundo. Não achei que você sobreviveria. Acho que aqui o <VP>shaman<N> não me encontra. Você o viu?<br><br><R>Espera... Você o viu? Onde ele está? Se estiver por perto, preciso sair daqui AGORA!",name)
		else
			showMessage("<V>[Keith Under] <N>Entre razões e emoções, a saída... Que barulho foi esse?<br><br><J><b>AH, ELE DE NOVO NÃO! SAIA DE MIM AGORA!</b>",name)
		end
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
	elseif npc == "Dylan Reigns" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Dylan Reigns] <N>Oi. Me chame de Dylan Reigns. Sou uma das sobreviventes daquela tragédia catastrófica, e queria...<br><R>O MONSTRO ESTÁ VINDO! CORRA!!",name)
		else
			showMessage("<V>[Dylan Reigns] <R>O MONSTRO ESTÁ AQUI! ALGUÉM ME TIRE DAQUI!",name)
		end
	elseif npc == "Camille Sanders" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Camille Sanders] <N>Sou uma náufraga.<br><br>Há pouco tempo, um grande cataclisma mágico aconteceu e agora estou aqui, no meio deste oceano.<br><br>Recebi boatos de que guardiões muito poderosos estão guardando este lugar, mas não tenho como descer para descobrir.<br><br>O que sei, é que um monstro horroroso chamado <VP>shaman <N>está nos caçando para nos devorar. <br><br>Você precisa fazer de tudo para sobreviver neste lugar.<br>Seja lá como for.",name)
		else
			showMessage("<V>[Camille Sanders] <N>Olha só quem está aqui... Se não é o tal do <VP>shaman...<br><br><N>Preciso contar para... Espera, aquele é mesmo o <VP>shaman<N>?<br><br><J><b>FUJAM TODOS!!</b>",name)
		end
	elseif npc == "Daniel Winngs" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Daniel Winngs] <N>Eu era guia turístico desta região, até o momento do grande cataclisma acontecer e acabar com tudo o que eu tinha.<br><br>Agora, depois de muita luta, consegui descer até o fundo do mar e descobrir o que realmente existe lá.<br><br>E vi que ele está tomado por guardiões desconhecidos que podem até mesmo te prender no fundo do mar.<br><br>Portanto, tenha cuidado se for entrar no mar. Talvez seja um caminho sem volta.<br><br>Ah, e tome cuidado com um certo <VP>shaman<N>. Ele não quer a gente vivo, digo isso porque quase fui engolido por ele...",name)
		else
			showMessage("<V>[Daniel Winngs] <N>Saia daqui agora, seu bicho fedorento!",name)
		end
	elseif npc == "King Pirate" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[King Pirate] <N>Todos a bordo, marujos!<br>Ah, esqueci. Não tenho mais marujos. Perdi todos naquele grande cataclisma.<br>Mas gostei do seu visual. Me lembra bastante os dos meus antigos marujos...<br><br>Infelizmente sei que tenho quase certeza que não saio vivo daqui. O tal <VP>shaman<N> está no fundo do mar pronto para me engolir. E se fosse você, sairia logo daqui. Só estou aqui porque não há muito o que eu fazer...",name)
		else
			showMessage("<V>[King Pirate] <N>Pelas barbas do pirata! O monstro está aqui!<br><br><VP>Evacuar navio agora! Ah!",name)
		end
	elseif npc == "Aaron Grand" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Aaron Grand] <N>Não sei se considero isso uma saudação. Meu mental está destruído depois daquilo tudo que presenciei.<br><br>E como se não bastasse, o pior ainda está por vir. Um grande <VP>shaman<N> submarino está vindo nos devorar. Se você fosse, sairia logo daqui...<br><br>Mas já que não quer, fique um pouco aqui. Vamos conversar.",name)
		else
			showMessage("<V>[Aaron Grand] <N>Qual será sua intenção? Tirar minha vida com suas próprias mãos? Nunca!",name)
		end
	end
end
function eventPlayerDied(n)
	if changed == true then
		if not tfm.get.room.playerList[n].isShaman then
			alives=alives-1
		end
		if mode == "hide" or mode == "game" then
			if tfm.get.room.playerList[n].isShaman then
				showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
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
			mode="end"
			shaman=""
			tfm.exec.setGameTime(15)
			showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
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
		showWater(name)
		initNPC(name)
		newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["moved"]=0; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["imaget"]=5;
	};
		data[name] = newData;
		ratos=ratos+1;
		showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module e mapa criados por Morganadxana#0000.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
		data[name].imageid2 = tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
		data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
		data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
		data[name].imaget=5
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
	end
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>6</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,76,520,315,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 25%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação do mapa e das artes")
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,120,"Changelog da Versão 3.1.0","• Correções de bugs nos NPCs<br>• Correções de bugs no contador de mortes<br>• Várias mudanças de funcionamento<br>• Redução da duração do powerup QUEIJO para 4 segundos")
	end
	if (message:sub(0,2) == "tc") then
		if tfm.get.room.playerList[name].isShaman == false then
			for n,_ in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[n].isShaman == false then
					showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
				end
			end
		end
	end
	if name == "Morganadxana#0000" or verifyAdmin(name) == true then
		if (message:sub(0,3) == "msg") then
			showMessage("<VP>• [FunCorp - <b>"..name.."</b>] "..message:sub(5).."")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
	end
end
function eventSummoningEnd(name,id,x,y)
	if time_passed >= 60 then
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
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage("<R>Você não pode mais usar objetos! Invocar um objeto fará com que você morra e a partida termine!",name)
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
					data[name].o=data[name].o-25
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
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if data[name].moved == 0 then
			data[name].moved=1
		end
	end
end
function reset()
	if ratos >= 4 then
		mode="hide"
		shaman=""
		alives=0
		for n,p in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[n].isShaman then
				tfm.exec.setPlayerScore(n,0,false)
			end
			tfm.exec.respawnPlayer(n)
			tfm.exec.setShaman(n,false)
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
		defineShaman()
		ui.setBackgroundColor("#5FA9D4")
		z=-1
		cannons=6
		ui.removeTextArea(22,nil)
		mode="hide"
		tfm.exec.setGameTime(60)
	else
		mode="wait"
		showMessage("<R>São necessários pelo menos 4 ratos para jogar este module.")
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
		ui.addTextArea(100,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x1=x
		powerups.y1=y
		powerups.t1=type
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x2=x
		powerups.y2=y
		powerups.t2=type
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x3=x
		powerups.y3=y
		powerups.t3=type
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x4=x
		powerups.y4=y
		powerups.t4=type
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=8
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=14
end
function eventLoop(p,r)
	if changed == true then
	loop=loop+0.5
	time_passed=math.ceil(p/1000)
	time_remain=math.ceil(r/1000)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v3.1.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
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
		if tfm.get.room.playerList[n].y <= 495 then
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: 0m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		else
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: "..math.floor(math.pow(tfm.get.room.playerList[n].y-495,1.735)/2500).."m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		end
		if data[n] then
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
						if data[n].o < 99 then
							data[n].o=data[n].o+1
						end
						data[n].y=0
					else
						if tfm.get.room.playerList[n].y <= 1200 then
							data[n].o=data[n].o-0.3
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 1200 and tfm.get.room.playerList[n].y <= 3500 then
							data[n].o=data[n].o-0.4
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 3500 then
							data[n].o=data[n].o-0.8
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
		if mode == "game" or mode == "hide" then
			if data[n].o > 30 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
				data[n].d=0
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
	if r <= 2000 and mode == "hide" then
		mode="game"
		tfm.exec.setGameTime(240+math.ceil(alives*2.4))
		ui.removeTextArea(22,nil)
		showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>!<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
		for n,p in next,tfm.get.room.playerList do
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
		end
		tfm.exec.movePlayer(shaman,2600,196,false,0,0,false)
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
		end
		tfm.exec.killPlayer(shaman)
		shaman=""
		showMessage("<VP>Tempo esgotado! <b>"..alives.."</b> ratos sobreviveram! Iniciando nova partida...")
		ui.removeTextArea(300,n)
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
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a>",name,355,85,90,60,0x000001,0x000001,0.80,true)
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
