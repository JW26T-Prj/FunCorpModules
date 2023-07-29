admin={""} -- FunCorps, insiram seus nomes aqui! / FunCorps, insert your nicknames here!

for _,f in next,{"AutoNewGame","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables","PrespawnPreview","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog","reset","skins"} do
	system.disableChatCommandDisplay(f)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(40) end

shaman=""; alives=0; cannons=12; z=0; data={}; lang={}; mode="load"; changed=false; loop=0; timer=0; xml=''; time_passed=0; time_remain=1024;
active_imgs={}; active_imgs2={}; powerups_x={}; powerups_y={}; powerups_types={}; oxygen_x={}; oxygen_y={}; id=0; round=0;

lang.br = {
	welcome = "<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><VP>Fuja do shaman (tubarão) e sobreviva no perigoso mar!<br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module ",
	changelog = "• Novo tema de mapa: Ilha dos Piratas!<br>• Mudanças na física da água<br>• Aumento do número de objetos usáveis pelo shaman de 10 para 12<br>• Adição de novas mensagens de informação<br>• Mudanças nos tempos dos powerups<br>• English translation!",
	help = "O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do mar e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os círculos marcados por <N>'?'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups.<br><br><N>Caso você seja shaman, você tem um limite de <b>12</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.",
	powerups = "<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• VAMPIRO</b><N><br>Transforma seu rato em um vampiro, forçando você a ir para fora do mar.<br><ROSE><b>• ESCURIDÃO</b><N><br>Reduz drasticamente o campo de visão do seu rato.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma curta anomalia que puxa todos os ratos em direção ao fundo do mar.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio. Caso seu nível de oxigênio esteja muito baixo e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do mar, você provavelmente será levado para o fundo dele.",
	thecredits = "As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código e do mapa<br><ROSE><b>• Shun_kazami#7014</b><N> - Desenvolvimento do do mapa<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original, criação das artes e desenvolvimento do mapa<br><ROSE><b>• Lynet#8558</b><N> - análise de avaliação e envio das imagens<br><ROSE><b>• Perdiaconta#2529</b><N> - análise de avaliação<br><ROSE><b>• Lacoste#8972</b><N> - análise de avaliação<br><ROSE><b>• Maramara4#0000</b><N> - análise de avaliação<br><ROSE><b>• Yuh#0748</b><N> - análise de avaliação<br><ROSE><b>• Rafaelmorai#0000</b><N> - análise de avaliação",
	shark = "Tubarão",
	whale = "Baleia",
	pdn = "Peixe Diabo-Negro",
	ws = "Tubarão-Branco",
	use = "Usar!",
	tt = "Tubarão-Tigre",
	tm = "Tubarão-Martelo",
	dskins = "Desativar skins",
	shamwin = "<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.",
	nosham = "<R>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...",
	watercatch_help = "Ajuda do Module #watercatch",
	watercatch_power = "Powerups do Module #watercatch",
	credits = "Créditos",
	skinwarn = "<R>As skins de tubarão serão exibidas quando você for shaman, e estiver dentro do mar!",
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	noobjects = "<VP>O shaman não pode mais usar objetos!",
	invoke1 = "<VP>O shaman agora pode usar",
	invoke2 = "objetos",
	nobjects = "<R>Você não pode mais invocar objetos! Fazer isso ocasionará na sua morte e na perda de sua vez de shaman.",
	activate = "acionou o powerup",
	vampire = "VAMPIRO", cheese = "QUEIJO", darkness = "ESCURIDÃO", submerge = "AFUNDAR", suffocation = "SUFOCO", freeze = "CONGELAR",
	madeby = "desenvolvido por",
	nosouris = "<R>Jogadores convidados não podem jogar este jogo. Logue em uma conta para jogar #watercatch.",
	shammove = "<ROSE>Não esqueça de se mover, ou você perderá sua vez de shaman!",
	drowned = "morreu afogado!",
	lowoxygen = "<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",
	goshaman = "<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.<br><br><VP>Tenha cuidado! As águas-vivas presentes no mar matam os ratos que as tocarem!",
	timeup = "Tempo esgotado!", survived = "ratos sobreviveram! Iniciando nova partida...",
	using = "Você está agora usando a skin", disabled = "<N>Você desativou as skins de tubarão.",
	alivemice = "Ratos Vivos", remaint = "Tempo Restante",
	remain60 = "<ROSE>Restam 60 segundos!", remain30 = "<ROSE>Restam 30 segundos!", 
}
lang.en = {
	welcome = "<font color='#0080ff'><b>Welcome to the #watercatch module!</b><br><VP>Run away from the shark (shaman) and survive in the dangerous sea!<br><J>Type !help to see the game help.<br><br><N>Module ",
	changelog = "• New map theme: Pirate Island!<br>• Changes on water physics<br>• Increased number of shaman usable objects from 10 to 12<br>• Added new information messages<br>• Changes on powerups timers<br>• English translation!",
	help = "The goal is very simple: <b>Run away from the shaman</b>, hiding in the sea and keeping caution to don't drown!<br><R><b>Shamans, don't forget to move, or they will dead by AFK!</b><br><br><VP>The circles marked with <N>'?'<VP> are powerups, that generate random effects to your mice.<J><br>These powerups can be activated pressing SPACEBAR on top of them.<br><N>You can see all the possible effects of the powerups going to the Menu and pressing 'Powerups'.<br><br><N>If you are the shaman, you cannot invoke more than <b>12</b> objects, or you will lose your shaman turn.",
	powerups = "<font size='11'>The following powerups are available at moment:<br><ROSE><b>• VAMPIRE</b><N><br>Turns your mouse into a vampire, forcing you out of the sea.<br><ROSE><b>• DARKNESS</b><N><br>Drastically reduces your mouse's field of view.<br><ROSE><b>• SUBMERGE</b><N><br>Create an anomaly that pushes all the mices to the seabed.<br><ROSE><b>• MEEP</b><N><br>Gives the MEEP ability!<br><ROSE><b>• SUFFOCATE</b><N><br>Reduces your oxygen level. If your oxygen level is very low and you enable this powerup, you will drown in the sea.<br><ROSE><b>• FREEZE</b><N><br>Freeze your mice.<br><ROSE><b>• CHEESE</b><N><br>Give cheese to your mice. If you are in the sea and enable this powerup, you will go to the seabed.",
	thecredits = "The following people helped with the development of this module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Code and map development<br><ROSE><b>• Shun_kazami#7014</b><N> - Map development<br><ROSE><b>• Spectra_phantom#6089</b><N> - Original idea, art creation and map development<br><ROSE><b>• Lynet#8558</b><N> - evaluation analysis and image sending<br><ROSE><b>• Perdiaconta#2529</b><N> - evaluation analysis<br><ROSE><b>• Lacoste#8972</b><N> - evaluation analysis<br><ROSE><b>• Maramara4#0000</b><N> - evaluation analysis<br><ROSE><b>• Yuh#0748</b><N> - evaluation analysis<br><ROSE><b>• Rafaelmorai#0000</b><N> - evaluation analysis",
	shark = "Shark",
	whale = "Whale",
	pdn = "Black Devil Fish",
	ws = "White Shark",
	use = "Enable!",
	tt = "Tiger Shark",
	tm = "Hammer Shark",
	dskins = "Remove skins",
	shamwin = "<VP><b>The shaman killed all the mices and won the game!</b><br><N>Next round starting in 15 seconds.",
	nosham = "<R>The shaman died, is AFK or leaved the room. Starting new round...",
	watercatch_help = "#watercatch Help",
	watercatch_power = "#watercatch Powerups",
	credits = "#watercatch Credits",
	skinwarn = "<R>The shark skins will only be visible when you are the shaman, and when you are underwater!",
	loadingmap = "Loading map. Please wait...<",
	noobjects = "<VP>The shaman cannot invoke objects!",
	invoke1 = "<VP>The shaman now can invoke",
	invoke2 = "objects",
	nobjects = "<R>You reached the object limit! Invoke another object will cause your death and the lose of your shaman turn.",
	activate = "enabled the following powerup:",
	vampire = "VAMPIRE", cheese = "CHEESE", darkness = "DARKNESS", submerge = "SUBMERGE", suffocation = "SUFFOCATION", freeze = "FREEZE",
	madeby = "developed by",
	nosouris = "<R>Souris players cannot enter this game. Login into an account to play #watercatch.",
	shammove = "<ROSE>Don't forget to move, or you will lose your shaman turn!",
	drowned = "drowned in the sea!",
	lowoxygen = "<R>Your oxygen level is very low! Get out of the water as quickly as possible or you will drown!",
	goshaman = "<J><b>The shaman was released! Salvem-se quem puder!</b><br><br><ROSE>Use the !tc [text] command to talk with other players, without the shaman influence.<br><br><VP>Take care! The jellyfish present in the sea kill the mice that touch them!",
	timeup = "Time is up!", survived = "mices survived! Starting new round...",
	using = "You are now using the following skin:", disabled = "<N>You disabled the shark skins.",
	alivemice = "Alive Mices", remaint = "Remaining Time",
	remain60 = "<ROSE>60 seconds remaining!", remain30 = "<ROSE>30 seconds remaining!", 
}

if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end

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
	ui.addTextArea(1006,"<i><font size='11.5'><b>"..text.shark.." 1</b><br><br><a href='event:a1'>"..text.use.."</a><br><br><b>"..text.shark.." 2</b><br><br><a href='event:a2'>"..text.use.."</a><br><br><b>"..text.shark.." 3</b><br><br><a href='event:a3'>"..text.use.."</a><br><br><b>"..text.shark.." 4</b><br><br><a href='event:a6'>"..text.use.."</a><br><br><b>Barracuda</b><br><br><a href='event:a13'>"..text.use.."</a>",name,170,100,175,315,0,0,1.0,true)
	ui.addTextArea(1007,"<i><font size='11.5'><b>"..text.ws.." 1</b><br><br><a href='event:a4'>"..text.use.."</a><br><br><b>"..text.ws.." 2</b><br><br><a href='event:a7'>"..text.use.."</a><br><br><b>"..text.ws.." 3</b><br><br><a href='event:a5'>"..text.use.."</a><br><br><b>"..text.tm.."</b><br><br><a href='event:a8'>"..text.use.."</a><br><br><b>"..text.whale.." 3</b><br><br><a href='event:a14'>"..text.use.."</a>",name,380,100,175,265,0,0,1.0,true)
	ui.addTextArea(1008,"<i><font size='11.5'><b>"..text.pdn.."</b><br><br><a href='event:a9'>"..text.use.."</a><br><br><b>"..text.tt.."</b><br><br><a href='event:a11'>"..text.use.."</a><br><br><b>"..text.whale.." 1</b><br><br><a href='event:a10'>"..text.use.."</a><br><br><b>"..text.whale.." 2</b><br><br><a href='event:a12'>"..text.use.."</a><br><br><br><b><a href='event:a0'>"..text.dskins.."</a>",name,590,100,175,265,0,0,1.0,true)
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
	tfm.exec.addImage("18773209c5b.png", "?1",838,125,name)
	tfm.exec.addImage("18773209c5b.png", "?1",4334,5,name)
	tfm.exec.addImage("1877321eda8.png", "?1",1634,-30,name)
	tfm.exec.addImage("1877321eda8.png", "?1",4811,-152,name)
	tfm.exec.addImage("187732271a7.png", "?1",2649,160,name)
	tfm.exec.addImage("1877322de4e.png", "?1",3532,-20,name)
	tfm.exec.addImage("1877322de4e.png", "?1",6235,137,name,-1,1)
	tfm.exec.addImage("1883b1394a4.png", "?1",1955,-170,name,0.5,0.5)
	tfm.exec.addImage("1877322de4e.png", "?1",916,-47,name,-1,1)
	tfm.exec.addImage("189746f8a21.png", "?1",-80,1650,name,1,1,-0.1)
	tfm.exec.addImage("189746c6144.png", "?1",7120,1395,name)
	tfm.exec.addImage("1860ee201fd.png", "!1",520,2308,name)
	tfm.exec.addImage("189746ed93c.png", "+24", -90, -90, name,0.3,0.3)
	tfm.exec.addImage("1860ee29c2f.png", "+25", -35, -90, name)
	tfm.exec.addImage("1860ee29c2f.png", "+26", -35, -90, name)
	tfm.exec.addImage("1883efb5982.png", "+38", -300, -68, name)
	tfm.exec.addImage("1897471d01c.png", "+39", -490, -563, name,1,1,-0.0875)
	tfm.exec.addImage("1883efabd65.png", "+40", -240, -115, name,1,1)
	for i=0,4 do
 		tfm.exec.addImage("1897a810bb2.png", "!-1023", -1200+(i*2400), 535, name, 1, 1, 0, 1)
	end
	for i=0,4 do
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), 2340, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), 2880, name, 1, -2, 0, 1)
	end
	for i=0,11 do
		tfm.exec.addImage("1897a80b341.png", "!-1024", -1200+(i*840), 500, name, 3.5, 0.8, 0, 1)
		tfm.exec.addImage("1897a80b341.png", "!-1024", -1200+(i*840), 4500, name, 3.5, -0.8, 0, 1)
	end
	for i=0,3 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-200,8000),math.random(-150,200),name)
	end
	for i=0,3 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(-200,8000),math.random(-150,200),name)
	end
	for i=0,3 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(-200,8000),math.random(-150,200),name)
	end
	for i=0,3 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(-200,8000),math.random(-150,200),name)
	end
	tfm.exec.addImage("189749ce857.png", "?1", -1200, 600, name, 8, 6, 0, 1)
	tfm.exec.addImage("189749d63fa.png", "?1", -1200, -750, name, 6, 6, 0, 1)
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
		tfm.exec.setPlayerScore(n,1,true)
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		showMessage(text.shamwin)
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage(text.nosham)
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
	position=math.random(1,4)
	if position == 1 then
		tfm.exec.movePlayer(shaman,670,330,false,0,0,false)
	elseif position == 2 then
		tfm.exec.movePlayer(shaman,4000,305,false,0,0,false)
	elseif position == 3 then
		tfm.exec.movePlayer(shaman,6070,120,false,0,0,false)
	elseif position == 4 then
		tfm.exec.movePlayer(shaman,7670,540,false,0,0,false)
	end
end
function checkOxygenZones(name)
	if tfm.get.room.playerList[name].x >= 195 and tfm.get.room.playerList[name].x <= 335 then
		if tfm.get.room.playerList[name].y >= 2250 and tfm.get.room.playerList[name].y <= 2320 then
			return true
		end
	end
	if  tfm.get.room.playerList[name].x >= 7460 and tfm.get.room.playerList[name].x <= 7600 then
		if tfm.get.room.playerList[name].y >= 2235 and tfm.get.room.playerList[name].y <= 2305 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 3933 and tfm.get.room.playerList[name].x <= 1853 then
		if tfm.get.room.playerList[name].y >= 1570 and tfm.get.room.playerList[name].y <= 1610 then
			return true
		end
	end
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,250,text.watercatch_help,text.help)
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,100,520,270,text.watercatch_power,text.powerups)
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,243,text.credits,text.thecredits)
	end
	if message == "skins" then
		showMessage(text.skinwarn,name)
		showMenu(name,0x949494,65,68,670,285,"Skins","")
		showAvailableSharks(name)
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,130,520,140,"#watercatch Changelog - v6.0.0",text.changelog)
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
			showMessage(""..text.invoke1.." <b>"..cannons.."</b> "..text.invoke2..".")
		elseif cannons == 0 then
			showMessage(text.noobjects)
			showMessage(text.nobjects,shaman)
		elseif cannons <= -1 then
			tfm.exec.killPlayer(shaman)
		end
	end
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage(text.nobjects,name)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame("@7938352")
		ui.setMapName(text.loadingmap)
		changed=false
		mode="load"
	else
		if round == 0 then
			tfm.exec.newGame(xml)
			ui.setMapName(text.loadingmap)
			changed=false
		elseif round >= 1 then
			tfm.exec.disableAutoShaman(false)
			changed=true
			tfm.exec.newGame(xml)
		end
		round=round+1
	end
end
function activatePowerup(name,id,number)
	if id == 1 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.vampire.."!</b>")
		dropPlayer(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 2 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.cheese.."!</b>")
		queijo(name)
		tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
	elseif id == 3 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.darkness.."!</b>")
		escuro(name)
		tfm.exec.playSound("/transformice/son/chamane2.mp3", 65, nil, nil, name)
	elseif id == 4 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.submerge.."!</b>")
		timer=-1
		tfm.exec.playSound("/transformice/son/bulle2.mp3", 75, nil, nil, name)
	elseif id == 5 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>MEEP!</b>")
		tfm.exec.giveMeep(name,true)
		tfm.exec.playSound("/transformice/son/emote.mp3", 75, nil, nil, name)
	elseif id == 6 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.suffocation.."!</b>")
		if not tfm.get.room.playerList[name].isShaman then
			count=math.random(20,50)
			data[name].o=data[name].o-count
			if data[name] and data[name].o <= 1 then
				data[name].o=1
			end
		end
		tfm.exec.playSound("/cite18/combo2.mp3", 75, nil, nil, name)
	elseif id == 7 then
		showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.freeze.."!</b>")
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
function genJail(x,y)
	id=id+1; tfm.exec.addPhysicObject(id, x+387, y-114, {type = 12, width = 800, height = 10, foreground = false, friction = 0, restitution = 1.5, angle = -5, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x, y, {type = 12, width = 10, height = 168, foreground = false, friction = 0, restitution = 1.5, angle = -5, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x+436, y+125, {type = 12, width = 868, height = 10, foreground = false, friction = 0, restitution = 5, angle = 5, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x+800, y+10, {type = 12, width = 10, height = 340, foreground = false, friction = 0, restitution = 3, angle = -25, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
end
function genJail2(x,y)
	id=id+1; tfm.exec.addPhysicObject(id, x+648, y-103, {type = 12, width = 1323, height = 10, foreground = false, friction = 0, restitution = 1.5, angle = -2, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x, y, {type = 12, width = 10, height = 168, foreground = false, friction = 0, restitution = 1.5, angle = -5, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x+701, y+148, {type = 12, width = 1400, height = 10, foreground = false, friction = 0, restitution = 5, angle = 5, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
	id=id+1; tfm.exec.addPhysicObject(id, x+1352, y+43, {type = 12, width = 10, height = 349, foreground = false, friction = 0, restitution = 3, angle = -15, color = 0xffffffff, miceCollision = false, groundCollision = true, dynamic = false})
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
			if data[name] and tfm.get.room.playerList[name].y >= 545 then
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
	for n,p in next,tfm.get.room.playerList do
		showWater(n)
		ui.addTextArea(-3,"<font size='17'><font color='#222222'><font face='Calisto MT,Times New Roman'><b><i>"..text.alivemice.."</b>",n,2,374,155,54,0,0,1.0,true)
		ui.addTextArea(-4,"<font size='17'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b><i>"..text.alivemice.."</b>",n,0,372,155,54,0,0,1.0,true)
		ui.addTextArea(-5,"<font size='17'><font color='#222222'><font face='Calisto MT,Times New Roman'><b><i>"..text.remaint.."</b>",n,142,374,255,54,0,0,1.0,true)
		ui.addTextArea(-6,"<font size='17'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b><i>"..text.remaint.."</b>",n,140,372,255,54,0,0,1.0,true)
		ui.addTextArea(-7,"<font size='17'><font color='#222222'><font face='Calisto MT,Times New Roman'><b><i>Oxygen Level</b>",n,502,354,185,54,0,0,1.0,true)
		ui.addTextArea(-8,"<font size='17'><font color='#f1f1f1'><font face='Calisto MT,Times New Roman'><b><i>Oxygen Level</b>",n,500,352,185,54,0,0,1.0,true)
	end
	if changed == true then
		tfm.exec.addPhysicObject(131, 0, 1000, {type = 12, width = 10, height = 4000, foreground = false, friction = 0, restitution = 0, angle = 0, color = 0xffffffff, miceCollision = true, groundCollision = true, dynamic = false})
		tfm.exec.addPhysicObject(132, 8000, 1000, {type = 12, width = 10, height = 4000, foreground = false, friction = 0, restitution = 0, angle = 0, color = 0xffffffff, miceCollision = true, groundCollision = true, dynamic = false})
		ui.removeTextArea(0,nil)
		z=-1; cannons=12; alives=0; mode="hide";
		ui.removeTextArea(22,nil)
		for n,p in next,tfm.get.room.playerList do
			tfm.exec.giveMeep(n,false)
			tfm.exec.removeImage(data[n].shark_id)
			tfm.exec.changePlayerSize(n,1)
			ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> <VP><b>v6.0.0</b><N> - "..text.madeby.." <ROSE><b>Morganadxana#0000</b><")
			if n:sub(1,1) == "*" then
				tfm.exec.killPlayer(n)
				showMessage(text.nosouris,name)
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
				showMessage(text.shammove,n)
				shaman=n
				alives=alives-1
			end
			ui.addTextArea(300,"",n,400,381,300,8,0x202020,0x121212,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		tfm.exec.setGameTime(60)
	end
	genJail(541,2652); genJail(1541,2622); genJail(2541,2702); genJail2(4041,2752); genJail2(5941,2692);
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
		temp_x=math.random(500,7500); temp_y=math.random(550,1900); type=math.random(1,7);
		imageId = tfm.exec.addImage("1860ee33630.png","!-1025",temp_x,temp_y,nil)
		table.insert(powerups_x,temp_x); table.insert(powerups_y,temp_y); table.insert(powerups_types,type);
		table.insert(active_imgs,imageId)
	end
end
function genOxygen()
	for i=1,7 do
		temp_x1=math.random(500,7500); temp_y1=math.random(550,1900);
		imageId1 = tfm.exec.addImage("1860ee38326.png","!-1025",temp_x1,temp_y1,nil)
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
	data[name].t=8
	tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=8
end
function escuro(name)
	tfm.exec.setPlayerNightMode(true, name)
	data[name].t=8
end
function dropPlayer(name)
	tfm.exec.setVampirePlayer(name, true)
	tfm.exec.setPlayerGravityScale(name, 0.35, 1)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/tp.mp3", 70, nil, nil, name)
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/500)
	time_remain=math.ceil(r/500)
	if changed == true then
		ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> <VP><b>v6.0.0</b><N> - "..text.madeby.." <ROSE><b>Morganadxana#0000</b><")
		local m=math.floor(r/60000)
		local s=math.floor((((m*60000)-r) * -1) / 1000)
		ui.addTextArea(-1,"<font size='30'><font color='#222222'><font face='Calisto MT,Times New Roman'><b>"..m..":"..s.."</b>",n,267,368,125,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..m..":"..s.."</b>",n,265,366,125,54,0,0,1.0,true)
		if s < 10 then
			ui.addTextArea(-1,"<font size='30'><font color='#222222'><font face='Calisto MT,Times New Roman'><b>"..m..":0"..s.."</b>",n,267,368,125,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..m..":0"..s.."</b>",n,265,366,125,54,0,0,1.0,true)
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
				showMessage(text.remain60)
			end
			if time_remain == 60 then
				showMessage(text.remain30)
			end
		end
		if mode == "game" or mode == "hide" then
			ui.addTextArea(31,"<font size='30'><font color='#222222'><font face='Calisto MT,Times New Roman'><b>"..alives.."</b>",n,87,368,80,54,0,0,1.0,true)
			ui.addTextArea(30,"<font size='30'><font color='#d0d0d0'><font face='Calisto MT,Times New Roman'><b>"..alives.."</b>",n,85,366,80,54,0,0,1.0,true)
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
							if tfm.get.room.playerList[n].y < 550 then
								if data[n].o < 99 then
									data[n].o=data[n].o+1
								end
							data[n].y=0
						else
							if checkOxygenZones(n) == true then
								data[n].o=data[n].o+0.1
							else
								tfm.exec.playSound("/transformice/son/bulle2.mp3", 6, nil, nil, n)
								if tfm.get.room.playerList[n].y <= 1450 then
									data[n].o=data[n].o-0.3
									data[n].c=0
								elseif tfm.get.room.playerList[n].y > 1450 and tfm.get.room.playerList[n].y <= 2150 then
									data[n].o=data[n].o-0.45
									data[n].c=0
								elseif tfm.get.room.playerList[n].y > 2150 then
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
			for i=-10,104 do
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
							showMessage("<J><b>"..n.."</b> "..text.drowned.."")
							tfm.exec.addShamanObject(59, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
						end
					end
				end
				if mode == "game" or mode == "hide" then
					if data[n].o > 30 then
						ui.addTextArea(10,"",n,400,381,data[n].o*3,8,0xf0f0f0,0x808080,1.0,true)
						data[n].d=0
					elseif data[n].o > 0 then
						tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, n)
						ui.addTextArea(10,"",n,400,381,data[n].o*3,8,0x801500,0xa01000,1.0,true)
						data[n].d=data[n].d+1
						if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 545 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mh0.mp3", 35+(30-math.floor(data[n].o)), nil, nil, n)
							showMessage(text.lowoxygen,n)
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
			tfm.exec.setGameTime(240+math.ceil(alives*5.5))
			ui.removeTextArea(22,nil)
			showMessage(text.goshaman)
			moveShaman()
			for n,p in next,tfm.get.room.playerList do
				ui.addTextArea(300,"",n,400,381,300,8,0x202020,0x121212,1.0,true)
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
			showMessage("<VP>"..text.timeup.." <b>"..lives.."</b> "..text.survived.."")
		end
		if time_remain <= 0 and mode == "end" then
			resetMap()
		end
	else
		if time_passed >= 12 and changed == false then
			resetMap()
		end
	end
end
function eventNewPlayer(name)
	newData={
		["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["imageid"]=-1; ["shark_id"]=0; ["shark"]=0; ["active_imgs"]={};
	};
	data[name] = newData;
	showWater(name)
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> <VP><b>v6.0.0</b><N> - "..text.madeby.." <ROSE><b>Morganadxana#0000</b><")
	showMessage(text.welcome..text.madeby.." Morganadxana#0000.",name)
	tfm.exec.setPlayerScore(name,0,false)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Credits</a><br><a href='event:change'>Changelog</a><br><a href='event:skins'>Skins</a>",name,355,55,90,75,0x000001,0x000001,0.80,true)
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
		showMessage(text.disabled,name)
		tfm.exec.changePlayerSize(name,1)
	end
	if callback == "a1" then
		data[name].shark=1
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 1.</b>",name)
	end
	if callback == "a2" then
		data[name].shark=2
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 2.</b>",name)
	end
	if callback == "a3" then
		data[name].shark=3
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 3.</b>",name)
	end
	if callback == "a4" then
		data[name].shark=4
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 1.</b>",name)
	end
	if callback == "a5" then
		data[name].shark=5
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 3.</b>",name)
	end
	if callback == "a6" then
		data[name].shark=6
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 4.</b>",name)
	end
	if callback == "a7" then
		data[name].shark=7
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 2.</b>",name)
	end
	if callback == "a8" then
		data[name].shark=8
		showMessage("<VP>"..text.using.." <b>"..text.tm.."</b>",name)
	end
	if callback == "a9" then
		data[name].shark=9
		showMessage("<VP>"..text.using.." <b>"..text.pdn..".</b>",name)
	end
	if callback == "a10" then
		data[name].shark=10
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 1.</b>",name)
	end
	if callback == "a11" then
		data[name].shark=11
		showMessage("<VP>"..text.using.." <b>"..text.tt..".</b>",name)
	end
	if callback == "a12" then
		data[name].shark=12
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 2.</b>",name)
	end
	if callback == "a13" then
		data[name].shark=13
		showMessage("<VP>"..text.using.." <b>Barracuda.</b>",name)
	end
	if callback == "a14" then
		data[name].shark=14
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 3.</b>",name)
	end
end
resetMap()
