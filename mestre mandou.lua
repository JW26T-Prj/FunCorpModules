-- Código do module Mestre Mandou, versão RTM 17208.102, desenvolvido por Rakan_raster#0000.
-- Code of Simon Says module, version RTM 17208.102, developed by Rakan_raster#0000.

-- Atenção: Antes de rodar este código em uma sala, verifique se esta versão coincide com a versão mais recente presente abaixo:
-- https://raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/mestre%20mandou.lua
-- Isto vai garantir que você receba sempre as últimas atualizações e correções de bugs.

-- Warning: Before running this code into a room, check if this version is the same than the latest version located here:
-- https://raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/mestre%20mandou.lua
-- This is a guarantee that you will receive all the latest updates and bugfixes.

admin={""} -- Leia abaixo / Read below!
-- Se estiver rodando este código em uma sala FunCorp, insira o nome dos FunCorps acima e digite !fc para habilitar algumas funções e comandos especiais.
-- If you are running this code into a FunCorp room, insert the FunCorp names above and type !tc to enable some additional commands and functions.

-- If you will run this module on a FunCorp session, type the nickname(s) of FunCorp(s) into 'admin' table above and type !fc to enable special functions and commands.
-- FunCorp Comandos/Commands: !run [@code], !limit [number], !tc [message], !kill [player#tag], !pw [password].

for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
mapas={"@6788085","@6788174","@6788154","@6788715","@6788728","@6789271","@6790527","@6791838","@6789356","@6822331","@7290275","@6754319","@7686598","@7750148","@7688066","@6790295","@6788183","@6784965","@6789235","@6789853","@6790385","@6791944","@6801706","@6792470","@6806109","@6821950","@6866406","@6866437","@6885971","@5328362","@5957905","@7055459","@7525277","@2684847","@7214363","@6792516","@6825340","@6838871","@6788693","@6789272","@6799996","@6799998","@6808957","@6803018","@6809464","@6859175","@6907177","@7404327","@7382263","@6885799","@6790912","@6833993","@7721192","@7309605","@6532621","@6788861","@6789249","@6790484","@6792518","@6794050","@6830799","@6866549","@6834529","@6876563","@6888512","@6893463","@7431981","@7146925","@6937148","@6356881","@6789280","@6790895","@6799997","@6789324","@6803128","@6900149","@3832586","@6791871","@6811934","@7631682","@6876638","@6892608","@6982387","@7404106","@7405103","@7400694","@7400678","@7412412","@7412422","@7491944","@7755685","@6843950","@6810292","@3110915","@6789263","@4411212","@7354947","@3398791","@7201360","@6897042","@5549586","@6809461","@7242361","@7697974","@1966987","@7224471","@6932585","@6888879","@6781398","@5113656","@6920982","@5196033","@1468299","@7894614","@7863458","@7896602","@7897912","@7899697"}
active=0; vivo=0; rato=0; dificuldade=1; rodadas=0; rodada=0; number=0; xpos=0; ypos=0; data={}; lang={}; alives={}; tempo=10; counter=0; q=""; a=""; qtime=10; creator=""; sd_vivo=0;
fc_cmds={1,2,4,5,6,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,28,30,31,32,33,34,35,36,40,41,43,45,46,47,48,49,50,51,53,56,57,58,59,61,62,65,66,67,69,71,75,76,77,78,80,81,82,83}
spiderweb={type = 15,width = 60,height = 60}
map_det={creator="",code=""}
ninjas={"Rakan_raster#0000","Xayah_raster#7598","Aurelianlua#0000","Forzaldenon#0000","Skyymellu#0000"}
fc_mode=false; xpos=0; xpos2=0;
for _,f in next,{"command","pw","limit","run","fc","tc","q","a","t","kill"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N><b>Bem-vindos ao module Mestre Mandou!</b><br>O objetivo deste module é muito simples: Siga tudo o que o jogo mandar e teste seus limites até o fim!<br><VP>Tenha sempre cuidado com os comandos trolls!<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Jessiewind26#2546<br><br><ROSE>Versão RTM 17208.102",
	dancar = "Dance!",
	sentar = "Sente!",
	confetar = "Atire 5 confetes!",
	mouse = "Clique na tela 10 vezes!",
	beijos = "Dê 10 beijos!",
	dormir = "Vocês estão com sono. Durmam para descansar.",
	raiva = "Tigrounette é do mal! Fiquem com raiva dele!",
	chorem = "Vocês não ganharam queijo :( Chorem!",
	nchorem = "Não chorem!",
	esquerda = "Não vá para a esquerda!",
	direita = "Não vá para a direita!",
	numero = "Digite o seguinte número: ",
	digitar = "Digite qualquer coisa e mande para mim.",
	falar = "Não falem nada!",
	pular = "Não pulem!",
	mexer = "Não se mexam!",
	bandeira = "Balance a bandeira de qualquer país!",
	ano = "Em que ano estamos?",
	vesquerda = "Fique virado para a esquerda!",
	vdireita = "Fique virado para a direita!",
	quadradoa = "Fique no quadrado azul!",
	quadradov = "Fique no quadrado vermelho!",
	quadrado = "Fique no quadrado branco!",
	nquadrado = "Não fique no quadrado branco!",
	retangulo = "Fique dentro do retângulo branco!",
	retangulov = "Fique dentro do retângulo vermelho!",
	nretangulo = "Não fique dentro do retângulo branco!",
	nretangulov = "Não fique dentro do retângulo vermelho!",
	preesquerda15 = "Pressione 15 vezes a tecla para ESQUERDA!",
	predireita15 = "Pressione 15 vezes a tecla para DIREITA!",
	preesquerda30 = "Pressione 30 vezes a tecla para ESQUERDA!",
	predireita30 = "Pressione 30 vezes a tecla para DIREITA!",
	preesquerda60 = "Pressione 60 vezes a tecla para ESQUERDA!",
	predireita60 = "Pressione 60 vezes a tecla para DIREITA!",
	preesquerda100 = "Pressione 100 vezes a tecla para ESQUERDA!",
	predireita100 = "Pressione 100 vezes a tecla para DIREITA!",
	espaco = "Pressione a barra de espaço 20 vezes!",
	nome = "Digite o seu nome no jogo (com #número).",
	ndance = "Não dance!",
	key1 = "Pressione a tecla Delete!",
	action1 = "Dance, sente e durma!",
	laugh = "Agora RIAM!",
	laugh2 = "Quem rir agora vai morrer.",
	stone = "Olha a pedra!",
	noob = "Digite: EU SOU NOOB",
	action2 = "Chore depois ria!",
	jump = "Pulem!",
	number = "Digite o seguinte número: ",
	key = "Pressione qualquer tecla!",
	jump2 = "Pulem 5 vezes!",
	action3 = "Dê um beijo depois chore!",
	area = "Descubra onde está o texto escondido e clique nele!",
	dancing = "É hora da festa!",
	freeze = "Todo mundo parado!",
	transform = "Dance e durma!",
	down1 = "Abaixem 3 vezes!",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	mices = "Esta sala requer pelo menos 4 ratos.",
	difficulty = "Dificuldade",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por",
	abaixar = "Abaixem e se levantem!",
	action = "Façam qualquer ação!",
	naction = "Não façam nenhuma ação!",
	math = "Quanto é 1+1?",
	math1 = "Quanto é 2+2?",
	ds = "Dance e sente!",
	seq4 = "Dance, sente, durma e bata palmas!",
	seq5 = "Dance, bata palmas e ria!",
	seq6 = "Dance e chore!",
	spider = "Cuidado com as teias de aranha!",
	key2 = "Pressione F4!",
	clap = "Bata palmas 5 vezes!",
	completed = "Você completou o comando com sucesso!",
	rain = "Chuva de ovelhas!",
	skull = "Cuidado com as caveiras!",
	gravity = "A gravidade foi alterada!",
	version = "Versão",
	black = "Um buraco negro surgiu e está puxando todos vocês!",
	creator = "Quem é o criador deste module?",
	sister = "Quem é a irmã do criador deste module?",
	counts = "Há quantos ratos nesta sala?",
	counts_alive = "Há quantos ratos vivos nesta sala?",
	facepalm = "Coloque a mão no rosto 5 vezes!",
	enterprise = "Qual é a empresa que criou o Transformice?",
	collect = "Colete todos os '+1' do mapa!",
	balls = "Está chovendo bolas!",
	explosion = "Olha a explosão!",
	queijo = "Todos os ratos que estiverem com queijo vão morrer!",
	caps = "Pressione a tecla CAPS LOCK 10 vezes",
	vampire = "Fujam dos vampiros!",
	sudden = "Morte súbita habilitada!",
}
lang.en = {
	welcome = "<N><b>Welcome to Simon Says module!</b><br>This module's goal is easy: Follow everything the game told and test your limits until the end!<br><VP>Be always aware to troll commands!<br><br><J><b>Script developed by Rakan_raster#0000</b><br>Original concept by Jessiewind26#2546<br>Translation by Draw#6691<br><br><ROSE>Version RTM 17208.102",
	dancar = "Dance!",
	sentar = "Sit down!",
	confetar = "Throw 5 confetti!",
	mouse = "Click 10 times on the screen!",
	beijos = "give 10 kisses!",
	dormir = "You are so much sleepy. Sleep to rest.",
	raiva = "Tigrounette is evil! Be mad at him",
	chorem = "You didn't get cheese :( Cry!",
	nchorem = "Dont cry!",
	esquerda = "Dont go to the left!",
	direita = "Dont go to the right!",
	numero = "Type the following number: ",
	digitar = "Type anything and send it to me.",
	falar = "Dont speak!",
	pular = "Dont jump!",
	mexer = "Dont move!",
	bandeira = "Swing any flag of a countrie!",
	ano = "What year are we in?",
	vesquerda = "Stay turned to the left!",
	vdireita = "Stay turned to the right!",
	quadradoa = "Stay on the blue square",
	quadradov = "Stay on the red square!",
	quadrado = "Stay on the white square!",
	nquadrado = "Dont stay on the white square!",
	retangulo = "Stay inside of the white rectangle!",
	retangulov = "Stay inside of the red rectangle!",
	nretangulo = "Dont stay inside of the white rectangle!",
	nretangulov = "Dont stay inside of the red rectangle!",
	preesquerda15 = "Press the left key 15 times!",
	predireita15 = "Press the right key 15 times!",
	preesquerda30 = "Press the left key 30 times!",
	predireita30 = "Press the right key 30 times!",
	preesquerda60 = "Press the left key 60 times!",
	predireita60 = "Press the right key 60 times!",
	preesquerda100 = "Press the left key 100 times!",
	predireita100 = "Press the right key 100 times!",
	espaco = "Press the space bar 20 times!",
	nome = "Type your nickname in game (with #number).",
	ndance = "Dont dance!",
	key1 = "Press the delete key!",
	action1 = "Dance, sit and sleep!",
	laugh = "Laugh now!",
	laugh2 = "who laughs now dies.",
	stone = "Watch out the rock!",
	noob = "Type: I AM A NOOB",
	action2 = "Cry and then laugh!",
	jump = "Jump!",
	number = "Type the following number: ",
	key = "Press any key!",
	jump2 = "Jump 5 times!",
	action3 = "Give a kiss and then cry!",
	area = "Find out where is the hidden text and click on it!",
	dancing = "It's party time!",
	freeze = "Everyone STOP!",
	transform = "Dance and sleep!",
	down1 = "Get down 3 times!",
	mestre = "Simon Says",
	map = "Map",
	time = "Time",
	mice = "Mouses",
	round = "Round",
	mices = "This room request at least 4 mice.",
	difficulty = "Difficulty",
	segundos = "seconds.",
	fim = "The match is over! next starting in ",
	playingmap = "Running map",
	created = "created by",
	abaixar = "Get down and get up!",
	action = "Do any action!",
	naction = "dont do any action!",
	math = "How much it is 1+1?",
	math1 = "How much it is 2+2?",
	ds = "Dance and sit!",
	seq4 = "Dance, sit, sleep and clap!",
	seq5 = "Dance, clap e laught!",
	seq6 = "Dance and cry!",
	spider = "Watch out at the cobwebs!",
	key2 = "Press F4!",
	clap = "Clap 5 times!",
	completed = "You completed the command successfully!",
	rain = "Sheep rain!",
	skull = "Watch out at the skulls!",
	gravity = "The gravity has been changed!",
	version = "Version",
	black = "A black hole has appeared and it's pulling all of you!",
	creator = "Who's this module creator?",
	sister = "Who's the sister of the creator of this module?",
	counts = "How many mice this room has?",
	counts_alive = "How many mice alive this room has?",
	facepalm = "Put your hand on your face 5 times!",
	enterprise = "What company created Transformice?",
	collect = "Collect all the '+1' of the map!",
	balls = "It's raining balls!",
	explosion = "Look the explosion!",
	queijo = "All mices that catched the cheese will die!",
	caps = "Press the CAPS LOCK key 10 times!",
	tribe = "Type the name of your tribe! (if you have)",
	sudden = "Sudden death enabled!",
}
lang.fr = {
	welcome = "<N>Bienvenue sur le module 'Maître a dit' ! Dans ce module tu dois faire tout ce que dit le maître.<br><ROSE>Module créé par <b>Rakan_raster#0000</b>. Traduit par Chatonlina#0000, Eyeground#0000 et Tortuegreen#0000. Version RTM 17208.102",
	dancar = "Danse !",
	sentar = "Assis !",
	confetar = "Lance 5 fois des confettis !",
	mouse = "Clique sur l'écran 10 fois !",
	beijos = "Fais 10 bisous !",
	dormir = "Tu es fatigué. Dors pour te reposer.",
	raiva = "Tigrounette est méchant ! Mets-toi en colère contre lui !",
	chorem = "Pas de fromage pour toi. Pleure !",
	nchorem = "Ne pleure pas !",
	esquerda = "Ne va pas vers la GAUCHE !",
	direita = "Ne va pas vers la DROITE !",
	numero = "Écris ce nombre : ",
	digitar = "Écris n'importe quoi et envoie-le.",
	falar = "Ne parle pas !",
	pular = "Ne saute pas !",
	mexer = "Ne bouge pas!",
	bandeira = "Agite le drapeau de n'importe quel pays !",
	ano = "En quelle année sommes-nous ?",
	vesquerda = "Positionne-toi vers la GAUCHE !",
	vdireita = "Positionne-toi vers la DROITE !",
	quadradoa = "Reste dans le carré bleu !",
	quadradov = "Reste dans le carré rouge !",
	quadrado = "Reste dans le carré blanc !",
	nquadrado = "Ne reste dans le carré blanc !",
	retangulo = "Reste dans le rectangle blanc !",
	retangulov = "Reste dans le rectangle rouge !",
	nretangulo = "Ne reste pas sur le rectangle blanc !",
	nretangulov = "Ne reste pas sur le rectangle rouge !",
	preesquerda15 = "Appuie 15 fois sur la flèche GAUCHE !",
	predireita15 = "Appuie 15 fois sur la flèche DROITE !",
	preesquerda30 = "Appuie 30 fois sur la flèche GAUCHE !",
	predireita30 = "Appuie 30 fois sur la flèche DROITE !",
	preesquerda60 = "Appuie 60 fois sur la flèche GAUCHE !",
	predireita60 = "Appuie 60 fois sur la flèche DROITE !",
	preesquerda100 = "Appuie 100 fois sur la flèche GAUCHE !",
	predireita100 = "Appuie 100 fois sur la flèche DROITE !",
	espaco = "Appuie 20 fois sur la BARRE D'ESPACE !",
	nome = "Écrit ton pseudo (avec le #tag) !",
	ndance = "Ne dance pas !",
	key1 = "Appuie sur la touche SUPPR !",
	action1 = "Dance, assis-toi et dors !",
	laugh = "Rigole !",
	laugh2 = "Ne rigole pas !",
	stone = "Attention aux pierres !",
	noob = "Écris : I AM NOOB",
	action2 = "Pleure et rigole !",
	jump = "Saute !",
	number = "Appuie sur le nombre suivant: ",
	key = "Appuie sur n'importe quelle touche !",
	jump2 = "Saute 5 fois !",
	action3 = "Fais un bisou et pleure !",
	area = "Cherche où se trouve le texte caché et clique dessus !",
	dancing = "C'est l'heure de faire la fête !",
	freeze = "Stop !",
	transform = "Danse et dors !",
	down1 = "Retourne-toi 3 fois !",
	mestre = "Jacques à dit",
	map = "Carte",
	time = "Temps",
	mice = "Souris",
	round = "Tour",
	mices = "Ce salon a besoin d'au moins 4 joueurs.",
	difficulty = "Difficulté",
	segundos = "secondes.",
	fim = "Fin du match ! Le prochain match va commencer dans ",
	playingmap = "Map chargé ",
	created = "créée par",
	abaixar = "Retourne-toi et lève-toi !",
	naction = "Ne fais rien !",
	action = "Faites n'importe quelle action !",
	math = "Combien vaut 1 + 1?",
	math1 = "Combien vaut 2 + 2?",
	ds = "Danse et assis !",
	seq4 = "Dance, assis-toi, dors et applaudir!",
	seq5 = "Dance, tape dans tes mains et rigole !",
	seq6 = "Dance et pleure!",
	spider = "Attention aux toiles d'araignées!",
	key2 = "Appuie sur la touche F4!",
	clap = "Tape dans tes mains 5 fois!",
	completed = "Vous avez terminé la commande !",
	rain = "Attention aux moutons !",
	skull = "Attention aux crânes!",
	gravity = "La gravité a été changée!",
	version = "Version",
	black = "Un trou noir émerge et pousse toutes les souris!",
	creator = "Qui est le créateur de cette module?",
	sister = "Qui est le soeur de créateur de cette module?",
	counts = "How many mices are on this room?",
	counts_alive = "How many alive mices are on this room?",
	facepalm = "Mets ta main sur ton visage 5 fois !",
	enterprise = "Quelle est la société qui a créé Transformice?",
	collect = "Récupérer tous les '+1' badges !",
	rain = "Attention aux balles !",
	explosion = "Attention aux spirits !",
	queijo = "Tous les souris qui attrapent le fromage mourront ! ",
	caps = "Appuie 10 fois sur la CAPS LOCK !",
	vampire = "Ne vous infectez pas ! ",
	sudden = "Mort subite activée ! ",
}

if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
elseif tfm.get.room.community == "fr" then
	text = lang.fr
else
	text = lang.en
end

function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
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
function getAlives()
	alives={}
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isDead == false then
			table.insert(alives,name)
		end
	end
end
function setAllAlive()
	for name,player in next,tfm.get.room.playerList do
		data[name].c=1;
		tfm.exec.setNameColor(name,0x00ff00)
	end
end
function eventNewPlayer(name)
	rato=rato+1
	for k=20, 87 do
		tfm.exec.bindKeyboard(name,k,false,true)
	end
	tfm.exec.bindKeyboard(name,115,false,true)
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			};
	data[name] = newData;
	showMessage("<br><br><br><p align='center'>"..text.welcome.."<br><p align='left'>",name)
	if string.find(tfm.get.room.name,name) then
		table.insert(admin,name)
		showMessage("You are the administrator of this room.<br><br>If you are a FunCorp member, type !fc to enable the FunCorp mode.",name)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	vivo=vivo-1
	local i=0
	local name
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			name=pname
		end
	end
	if i==0 then
		vivo=0
		active=-1
	elseif i==1 then
		active=-1
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
		tfm.exec.setGameTime(10)
	end
end
function completeCommand(name)
	if not tfm.get.room.playerList[name].isDead then
		if tfm.get.room.playerList[name].isDead == false and data[name].c == 0 then
			if data[name].c == 0 then
				showMessage(text.completed,name)
			end
			sd_vivo=sd_vivo+1
			print(""..sd_vivo.."/"..vivo.."")
			data[name].c=1
			tfm.exec.setNameColor(name,0x00ff00)
		end
	end
	if dificuldade >= 7 and sd_vivo == vivo-1 then
		for n,player in next,tfm.get.room.playerList do
			if data[n].c == 0 then
				tfm.exec.killPlayer(n)
			end
		end
	end
end
function eventNewGame()
	map_det.code=tfm.get.room.currentMap
	map_det.creator=tfm.get.room.xmlMapInfo.author
	for i=0,2 do
		ui.removeTextArea(i,nil)
	end
	ui.removeTextArea(250,nil)
	rodada=0; active=0; vivo=0; rato=0;
	dificuldade=1
	tfm.exec.setWorldGravity(0, 10)
	tfm.exec.setGameTime(15)
	showMessage("<J><i>Spectra's map loader v2.219.1</i><br><N>Loading current map information...<br><b>Current Map :</b> <V>"..map_det.code.."<br><N><b>Author :</b> <V>"..map_det.creator.."")
	if fc_mode == true then
		showMessage("<VP><br>The FunCorp mode of this module is now enabled.")
	end
	for name,player in next,tfm.get.room.playerList do
		vivo=vivo+1
		rato=rato+1
		if data[name] then
			data[name].c=0
			data[name].key=0
		end
	end
	rodadas=math.floor(24+math.floor(rato/5))
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	if dificuldade < 7 then
		if fc_mode == false then
			active=math.random(1,83)
		else
			active=tonumber(fc_cmds[math.random(#fc_cmds)])
		end
	else
		active=tonumber(fc_cmds[math.random(#fc_cmds)])
	end
	sd_vivo=0
	getCommand()
end
function addCommandCount(name)
	data[name].s=data[name].s+1
	if data[name].c == 0 then
		if tfm.get.room.playerList[name].isDead == false then
			if data[name].s <= 100 then
				ui.addTextArea(24,"<font size='33'><p align='center'>"..data[name].s.."",name,360,350,80,45,0x000001,0x000001,0.8,true)
			end
		end
	end
end
function eventChatCommand(name,message)
	if verifyNinjas(name) == true or verifyAdmin(name) == true then
		if active <= 0 then
			if(message:sub(0,3) == "run") then
				tfm.exec.newGame(message:sub(5))
				active=0
			end
			if(message:sub(0,5) == "limit") then
				tfm.exec.setRoomMaxPlayers(tonumber(message:sub(7)))
			end
			if message == "fc" then
				if fc_mode == false then
					fc_mode=true
					showMessage("<R>The FunCorp mode of this module is now enabled.<br><br>Available commands: !tc [message], !run [@code], !kill [player#tag], !limit [number], !pw [password].")
				else
					fc_mode=false
					showMessage("<R>The FunCorp mode of this module is now disabled.")
				end
			end
		end
		if(message:sub(0,7) == "command") then
				active=tonumber(message:sub(9))
				getCommand()
		end
		if(message:sub(0,2) == "tc") then
			if fc_mode == true then
				showMessage("<VP>• [FunCorp - <b>"..name.."</b>] "..message:sub(4).."")
			end
		end
		if(message:sub(0,1) == "q") then
			q=message:sub(3)
		end
		if(message:sub(0,1) == "a") then
			a=message:sub(3)
		end
		if(message:sub(0,1) == "t") then
			qtime=tonumber(message:sub(3))
		end
		if(message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if(message:sub(0,2) == "pw") then
			tfm.exec.setRoomPassword(tostring(message:sub(4)))
			if message:sub(4) == "" then
				showMessage("Password cleared.",name)
			else
				showMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
	end
end
function showCommand(id,text)
	if dificuldade < 7 then
		ui.addTextArea(0,"<font face='Rockwell,Arial'><font color='#ffffff'><font size='22'><p align='center'><b>"..text.."",nil,25,26,750,30,0x252525,0x010101,0.95,true)
	else
		ui.addTextArea(0,"<font face='Rockwell,Arial'><font color='#ffa0a0'><font size='22'><p align='center'><b>"..text.."",nil,25,26,750,30,0x250000,0x100101,0.95,true)
	end
end
function whiteSquare(x)
	ui.addTextArea(1,"",nil,x,320,80,65,0xffffff,0xffffff,0.68,false)
end
function verticalRectangle(x)
	ui.addTextArea(1,"",nil,x,0,80,400,0xffffff,0xffffff,0.68,false)
end
function horizontalRectangle(y)
	ui.addTextArea(1,"",nil,0,y,1600,60,0xffffff,0xffffff,0.68,false)
end
function getCommand()
	rodada=rodada+1
	for name,player in next,tfm.get.room.playerList do
		data[name].c=0
		data[name].s=0
	end
	if active == 1 then
		showCommand(active,text.dancar)
		tfm.exec.setGameTime(5)
	end
	if active == 2 then
		showCommand(active,text.sentar)
		tfm.exec.setGameTime(5)
	end
	if active == 3 then
		showCommand(active,text.confetar)
		tfm.exec.setGameTime(6)
	end
	if active == 4 then
		showCommand(active,text.mouse)
		tfm.exec.setGameTime(6)
	end
	if active == 5 then
		showCommand(active,text.beijos)
		tfm.exec.setGameTime(13)
	end
	if active == 6 then
		showCommand(active,text.dormir)
		tfm.exec.setGameTime(5)
	end
	if active == 7 then
		showCommand(active,text.raiva)
		tfm.exec.setGameTime(5)
	end
	if active == 8 then
		showCommand(active,text.chorem)
		tfm.exec.setGameTime(5)
	end
	if active == 9 then
		showCommand(active,text.esquerda)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 10 then
		showCommand(active,text.direita)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 11 then
		showCommand(active,text.digitar)
		tfm.exec.setGameTime(8)
	end
	if active == 12 then
		showCommand(active,text.falar)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 13 then
		showCommand(active,text.pular)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 14 then
		showCommand(active,text.mexer)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 15 then
		showCommand(active,text.bandeira)
		tfm.exec.setGameTime(8)
	end
	if active == 16 then
		showCommand(active,text.ano)
		tfm.exec.setGameTime(5)
	end
	if active == 17 then
		showCommand(active,text.vesquerda)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 18 then
		showCommand(active,text.vdireita)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 19 then
		xpos=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
	end
	if active == 20 then
		xpos=math.random(100,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 21 then
		xpos=math.random(100,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 22 then
		ypos=math.random(50,300)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		horizontalRectangle(ypos)
	end
	if active == 23 then
		ypos=math.random(50,300)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		horizontalRectangle(ypos)
	end
	if active == 24 then
		showCommand(active,text.preesquerda30)
		tfm.exec.setGameTime(10)
	end
	if active == 25 then
		showCommand(active,text.predireita30)
		tfm.exec.setGameTime(10)
	end
	if active == 26 then
		showCommand(active,text.preesquerda60)
		tfm.exec.setGameTime(13)
	end
	if active == 27 then
		showCommand(active,text.predireita60)
		tfm.exec.setGameTime(13)
	end
	if active == 28 then
		showCommand(active,text.espaco)
		tfm.exec.setGameTime(8)
	end
	if active == 29 then
		showCommand(active,text.nome)
		tfm.exec.setGameTime(10)
	end
	if active == 30 then
		showCommand(active,text.ndance)
		tfm.exec.setGameTime(6)
		setAllAlive()
	end
	if active == 31 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 32 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 33 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 34 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.retangulov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		showCommand(active,text.abaixar)
		tfm.exec.setGameTime(6)
	end
	if active == 36 then
		showCommand(active,text.action)
		tfm.exec.setGameTime(8)
	end
	if active == 37 then
		showCommand(active,text.ds)
		tfm.exec.setGameTime(9)
	end
	if active == 38 then
		showCommand(active,text.key1)
		tfm.exec.setGameTime(8)
	end
	if active == 39 then
		showCommand(active,text.action1)
		tfm.exec.setGameTime(10)
	end
	if active == 40 then
		showCommand(active,text.laugh)
		tfm.exec.setGameTime(5)
	end
	if active == 41 then
		showCommand(active,text.laugh2)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 42 then
		showCommand(active,text.stone)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(85,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 43 then
		showCommand(active,text.noob)
		tfm.exec.setGameTime(10)
	end
	if active == 44 then
		showCommand(active,text.action2)
		tfm.exec.setGameTime(9)
	end
	if active == 45 then
		showCommand(active,text.jump)
		tfm.exec.setGameTime(5)
	end
	if active == 46 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(5)
		setAllAlive()
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 47 then
		number=math.random(1000000,9999999)
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(7)
	end
	if active == 48 then
		showCommand(active,text.key)
		tfm.exec.setGameTime(5)
	end
	if active == 49 then
		showCommand(active,text.jump2)
		tfm.exec.setGameTime(9)
	end
	if active == 50 then
		showCommand(active,text.action3)
		tfm.exec.setGameTime(8)
	end
	if active == 51 then
		showCommand(active,text.area)
		ui.addTextArea(250,"<a href='event:command51'>CLICK HERE",nil,math.random(100,700),math.random(50,350),100,25,0,0,1.0,true)
		tfm.exec.setGameTime(8)
	end
	if active == 52 then
		showCommand(active,text.dancing)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.playEmote(name,0)
		end
		tfm.exec.setGameTime(8)
	end
	if active == 53 then
		showCommand(active,text.freeze)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.freezePlayer(name,true)
		end
		tfm.exec.setGameTime(8)
	end
	if active == 54 then
		showCommand(active,text.transform)
		tfm.exec.setGameTime(10)
	end
	if active == 55 then
		showCommand(active,text.down1)
		tfm.exec.setGameTime(9)
	end
	if active == 56 then
		showCommand(active,text.seq6)
		tfm.exec.setGameTime(10)
	end
	if active == 57 then
		xpos=math.random(100,700)
		xpos2=math.random(100,700)
		showCommand(active,text.quadradoa)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 58 then
		showCommand(active,text.naction)
		setAllAlive()
		tfm.exec.setGameTime(10)
	end
	if active == 59 then
		showCommand(active,text.nchorem)
		setAllAlive()
		tfm.exec.setGameTime(7)
	end
	if active == 60 then
		showCommand(active,text.math)
		tfm.exec.setGameTime(6)
	end
	if active == 61 then
		showCommand(active,text.seq4)
		tfm.exec.setGameTime(13)
	end
	if active == 62 then
		showCommand(active,text.spider)
		setAllAlive()
		tfm.exec.setGameTime(10)
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), math.random(50,350), spiderweb)
		end
	end
	if active == 63 then
		showCommand(active,text.key2)
		tfm.exec.setGameTime(10)
	end
	if active == 64 then
		xpos=math.random(100,700)
		xpos2=math.random(100,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 65 then
		showCommand(active,text.preesquerda15)
		tfm.exec.setGameTime(7)
	end
	if active == 66 then
		showCommand(active,text.predireita15)
		tfm.exec.setGameTime(7)
	end
	if active == 67 then
		showCommand(active,text.clap)
		tfm.exec.setGameTime(9)
	end
	if active == 68 then
		showCommand(active,text.rain)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(40,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 69 then
		showCommand(active,text.skull)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=5,11 do
			tfm.exec.addBonus(2, math.random(100,700), math.random(80,300), i, 0)
		end
	end
	if active == 70 then
		showCommand(active,text.gravity)
		tfm.exec.setGameTime(10)
		setAllAlive()
		tfm.exec.setWorldGravity(0, math.random(-3,22))
	end
	if active == 71 then
		showCommand(active,text.black)
		tfm.exec.setGameTime(10)
		setAllAlive()
		tfm.exec.setWorldGravity(math.random(-50,50), 20)
	end
	if active == 72 then
		number=math.random(100000000,999999999)
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(11)
	end
	if active == 73 then
		showCommand(active,text.counts)
		tfm.exec.setGameTime(8)
	end
	if active == 74 then
		showCommand(active,text.counts_alive)
		tfm.exec.setGameTime(8)
	end
	if active == 75 then
		showCommand(active,text.facepalm)
		tfm.exec.setGameTime(9)
	end
	if active == 76 then
		showCommand(active,text.enterprise)
		tfm.exec.setGameTime(10)
	end
	if active == 77 then
		showCommand(active,text.math1)
		tfm.exec.setGameTime(6)
	end
	if active == 78 then
		showCommand(active,text.seq5)
		tfm.exec.setGameTime(10)
	end
	if active == 79 then
		showCommand(active,text.balls)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(6,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 80 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.nretangulov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 81 then
		showCommand(active,text.explosion)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=1,12 do
			x=math.random(50,750)
			y=math.random(50,350)
			tfm.exec.addShamanObject(24,x,y,0,0,0,false)
		end
	end
	if active == 82 then
		showCommand(active,text.queijo)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 83 then
		showCommand(active,text.caps)
		tfm.exec.setGameTime(10)
	end
	if active == 92 then
		showCommand(active,text.sister)
		tfm.exec.setGameTime(12)
	end
	if active == 93 then
		showCommand(active,text.vampire)
		tfm.exec.setGameTime(30)
		setAllAlive()
		tfm.exec.setVampirePlayer(alives[math.random(#alives)],true)
	end
	if active == 94 then
		showCommand(active,text.preesquerda100)
		tfm.exec.setGameTime(17)
	end
	if active == 95 then
		showCommand(active,text.predireita100)
		tfm.exec.setGameTime(17)
	end
	if active == 96 then
		showCommand(active,text.creator)
		tfm.exec.setGameTime(12)
	end
	if active == 97 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(19)
		for i=12,15 do
			tfm.exec.addBonus(0, math.random(150,650), math.random(60,250), i, 0)
		end
	end
	if active == 98 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
		setAllAlive()
	end
	if active == 99 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
	end
end
function eventPlayerBonusGrabbed(name, id)
	if active == 97 then
		addCommandCount(name)
		if data[name].s >= 4 then
			completeCommand(name)
		end
	end
end		
function eventTextAreaCallback(id,name,callback)
	if callback == "command51" then
		completeCommand(name)
		ui.removeTextArea(250,name)
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		if string.len(message) >= 2 then
			completeCommand(name)
		end
	end
	if active == 12 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2022" then
			completeCommand(name)
		elseif message == "2021" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if string.upper(message) == string.upper(name) then
			completeCommand(name)
		end
	end
	if active == 41 then
		if string.find(message,"k") or string.find(message,"K") or string.find(message,"ha") or string.find(message,"HA") or string.find(message,"lmao") or string.find(message,"LMAO") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 43 then
		if string.upper(message) == "EU SOU NOOB" or string.upper(message) == "I AM NOOB" or string.upper(message) == "I AM A NOOB" or string.upper(message) == "BEN NOOB" then
			completeCommand(name)
		end
		if string.find(string.upper(message),string.upper("PRO")) then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 47 or active == 72 then
		if message == tostring(number) then
			completeCommand(name)
		end
	end
	if active == 60 then
		if message == "2" then
			completeCommand(name)
		elseif message == "3" then
			tfm.exec.killPlayer(name)
		elseif message == "11" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 73 then
		if tostring(message) == tostring(rato) then
			completeCommand(name)
		end
	end
	if active == 74 then
		if tostring(message) == tostring(vivo) then
			completeCommand(name)
		end
	end
	if active == 76 then
		if string.upper(message) == "ATELIER801" or string.upper(message) == "ATELIER 801" then
			completeCommand(name)
		end
	end
	if active == 77 then
		if message == "4" then
			completeCommand(name)
		elseif message == "22" then
			tfm.exec.killPlayer(name)
		elseif message == "3" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 92 then
		if message == "Xayah_raster#7598" then
			completeCommand(name)
		end
	end
	if active == 96 then
		if message == "Rakan_raster#0000" then
			completeCommand(name)
		end
	end
	if active == 99 then
		if string.upper(message) == string.upper(a) then
			completeCommand(name)
		end
	end
end
function eventEmotePlayed(name,id)
	if active == 1 then
		if id == 0 or id == 10 then
			completeCommand(name)
		end
	end
	if active == 2 then
		if id == 8 then
			completeCommand(name)
		end
	end
	if active == 3 then
		if id == 9 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 5 then
		if id == 3 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 6 then
		if id == 6 then
			completeCommand(name)
		end
	end
	if active == 7 then
		if id == 4 then
			completeCommand(name)
		end
	end
	if active == 8 then
		if id == 2 then
			completeCommand(name)
		end
	end
	if active == 14 or active == 53 or active == 58 then
		tfm.exec.killPlayer(name)
	end
	if active == 15 then
		if id == 10 then
			completeCommand(name)
		end
	end
	if active == 30 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 36 then
		completeCommand(name)
	end
	if active == 37 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 39 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 40 then
		if id == 1 then
			completeCommand(name)
		end
	end
	if active == 41 then
		if id == 1 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 44 then
		if id == 2 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 1 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 50 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 54 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 56 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 59 then
		if id == 2 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 61 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 5 and data[name].s == 3 then
			completeCommand(name)
		end
	end
	if active == 67 then
		if id == 5 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 75 then
		if id == 7 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 78 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 5 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 1 and data[name].s == 2 then
			completeCommand(name)
		end
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		addCommandCount(name)
		if data[name].s >= 10 then
			completeCommand(name)
		end
	end
end
function eventKeyboard(name,id,down,x,y)
	if active == 9 then
		if id == 37 or id == 65 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 10 then
		if id == 39 or id == 68 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 13 then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 24 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 30 then
				completeCommand(name)
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 25 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 30 then
				completeCommand(name)
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 26 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 60 then
				completeCommand(name)
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 27 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 60 then
				completeCommand(name)
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 28 then
		if id == 32 then
			addCommandCount(name)
			if data[name].s >= 20 then
				completeCommand(name)
			end
		end
	end
	if active == 35 then
		if id == 40 or id == 83 then
			completeCommand(name)
		end
	end
	if active == 38 then
		if id == 46 then
			completeCommand(name)
		end
	end
	if active == 45 then
		if id == 38 or id == 87 then
			completeCommand(name)
		end
	end
	if active == 48 then
		completeCommand(name)
	end
	if active == 49 then
		if id == 38 or id == 87 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
				
			end
		end
	end
	if active == 55 then
		if id == 40 or id == 83 then
			addCommandCount(name)
			if data[name].s >= 3 then
				completeCommand(name)
			end
		end
	end
	if active == 63 then
		if id == 115 then
			completeCommand(name)
		end
	end
	if active == 65 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 66 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 83 then
		if id == 20 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 94 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 100 then
				completeCommand(name)
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 95 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			addCommandCount(name)
			if data[name].s >= 100 then
				completeCommand(name)
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventLoop(passado,faltando)
	local tempo=math.floor(faltando/1000)
	if active == -2 then
		ui.setMapName("<N>"..text.mices.."   <G>|   <VP><b>"..text.version.." RTM 17208.102</b><")
	elseif active == -1 then
		ui.setMapName("<VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."   <G>|   <VP><b>"..text.version.." RTM 17208.102</b><")
	elseif active >= 0 then
		ui.setMapName(""..text.mestre.."   <G>|   <N>"..text.map.." : <V>"..tfm.get.room.currentMap.."   <G>|   <N>"..text.mice.." : <V>"..vivo.." / "..rato.."   <G>|   <N>"..text.round.." : <V>"..rodada.."   <G>|   <VP><b>"..text.version.." RTM 17208.102</b><")
	end
	if rato < 4 then
		if tfm.get.room.currentMap == "@2684847" then
			active=-2
			tfm.exec.setGameTime(8000)
		else
			if passado > 4000 then
				tfm.exec.newGame("@2684847")
				tfm.exec.setGameTime(8000)
				showMessage("<R>"..text.mices.."",nil)
			end
		end
	end
	if rato >= 4 and passado >= 4000 then
		if tfm.get.room.currentMap == "@2684847" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
	if active < 0 and faltando < 1 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if active == 0 and faltando < 4000 then
		if rodada < rodadas then
			sortearComandos()
		else
			active=-1
			tfm.exec.setGameTime(10)
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(true)
				tfm.exec.playerVictory(true)
			end
		end
	end
	if active > 0 and faltando < 1 and rato >= 2 then
		if active == 17 then
			for name,player in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[name].isFacingRight == true then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 18 then
			for name,player in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[name].isFacingRight == false then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 19 or active == 31 or active == 32 or active == 57 or active == 64 then
			for name,player in next,tfm.get.room.playerList do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-10 or player.x > xpos+90 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 32 then
			for name,player in next,tfm.get.room.playerList do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-10 or player.x > xpos+90 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 20 or active == 33 or active == 34 then
			for name,player in next,tfm.get.room.playerList do
				if player.x < xpos or player.x > xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 21 or active == 46 or active == 80 then
			for name,player in next,tfm.get.room.playerList do
				if player.x > xpos and player.x < xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 22 then
			for name,player in next,tfm.get.room.playerList do
				if player.y < ypos-10 or player.y > ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 23 then
			for name,player in next,tfm.get.room.playerList do
				if player.y > ypos-10 and player.y < ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 53 then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.freezePlayer(name,false)
			end
		end
		if active == 82 then
			for name,player in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[name].cheeses == 1 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 93 then
			for name,player in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[name].isVampire then
					tfm.exec.killPlayer(name)
				end
			end
		end
		for i=0,2 do
			ui.removeTextArea(i,nil)
		end
		ui.removeTextArea(250,nil)
		tfm.exec.setWorldGravity(0, 10)
		for i=1,8 do
			tfm.exec.removePhysicObject(i)
		end
		for i=1,15 do
			tfm.exec.removeBonus(i)
		end
		active=0
		if rodada == 3 or rodada == 6 or rodada == 9 or rodada == 12 or rodada == 15 then
			dificuldade=dificuldade+1
		end
		if rodada >= 18 and vivo == 2 then
			dificuldade=7
		end
		if rodada % 2 == 0 and rodada >= 18 and dificuldade == 7 and vivo == 2 then
			showMessage("<R>"..text.sudden.."")
		end
		for name,player in next,tfm.get.room.playerList do
			data[name].key=0
			ui.removeTextArea(24,nil)
			if data[name].c == 0 then
				tfm.exec.killPlayer(name)
			end
			tfm.exec.setNameColor(name,0xc2c2da)
		end
		if fc_mode == false then
			if vivo > 4 then
				tfm.exec.setGameTime(12-dificuldade)
			else
				tfm.exec.setGameTime(14-dificuldade)
			end
		else
			tfm.exec.setGameTime(7)
		end
		getAlives()
	end
	for name,player in next,tfm.get.room.playerList do
		if data[name] then
			if data[name].c == 1 then
				if completed == false then
					completed=true
				end
			end
		end
	end
end
tfm.exec.newGame("@2684847")
