admin="" -- If you are a FunCorp member, please change this with your nickname.
for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
mapas={
simple={6788085,6788174,6788154,6788715,6788728,6789259,6789271,6790527,6791838,6789451,6792397,6793213,6793222,6799768,6789356,6789937,6822331,7290270,7290275,6892022,6754319,7686598,7750148,7616526,7429544},
scenarios={6788183,6784965,6789235,6789853,6790385,6791944,6801706,6792470,6806109,6821950,6866406,6866437,6885971,5328362,5957905,7055459,7525277,6981135,2684847,6835934,7252582},
misc={6788178,6788693,6788695,6789272,6799996,6799998,6808957,6803018,6809464,6859175,6907177,7404327,7382263,6885799,6885841,6886906,6790912,6833993,7721192,7309605,6514206},
arts={6788861,6789249,6790484,6790903,6792509,6792518,6792523,6794050,6789358,6830799,6866549,6834529,6812488,6876563,6888512,6893463,7431981,6879100,7146925,6937148,7252655,6356881},
mech={6789280,6789334,6790895,6793860,6799997,6789324,6803128,6900149,6943992,6888884,7279612,7252133},
geek={6791871,6802377,6811934,7631682,6876638,6892608,6982387,7404106,7405103,7400694,7400678,7412412,7412422,7491944,7755685},
testing={6788848,6789206,6789260,6790433,6790911,6790896,6792320,6790467,6798615,6810292,6809498,6822119,3110915,6983850,7711216,6958861,7250912,7253090,7254162,6863706},
troll={6789263,6790300,4411212,6781398,7394517,7354947,3398791,1347551,7201360,1429677,6897042,3766247,7296284}
}
active=0; vivo=0; rato=0; dificuldade=1; rodadas=0; rodada=0; number=0; xpos=0; ypos=0; data={}; lang={}; tempo=10; counter=0; map_cat=-2;
fc_cmds={1,2,4,5,6,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,28,30,31,32,33,34,35,36,40,41,42,43,45,46,47,48,49,50,51,53,57,58,59}
fc_mode=false
unlocked=true
xpos=0; xpos2=0;
for _,f in next,{"command","mapa","pw","limit","run","fc"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N>Bem-vindo ao novo Mestre Mandou! Nesta sala seu objetivo é fazer tudo o que o script mandar.<br><ROSE>Script criado por <b>Nasus_assassin#1534</b>. Traduzido por Fosfus7heads#0000. Versão RTM 4128.024",
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
	preesquerda30 = "Pressione 30 vezes a tecla para ESQUERDA!",
	predireita30 = "Pressione 30 vezes a tecla para DIREITA!",
	preesquerda60 = "Pressione 60 vezes a tecla para ESQUERDA!",
	predireita60 = "Pressione 60 vezes a tecla para DIREITA!",
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
	dancing = "Bora dançar galera!",
	freeze = "Todo mundo parado!",
	transform = "Dance e durma!",
	down1 = "Abaixem 3 vezes!",
	kill = "Se matem!",
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
	ds = "Dance e sente!"
}
lang.en = {
	welcome = "<N>Welcome to script Master Says! On this module you have to do everything that the master says.<br><ROSE>Module created by <b>Nasus_assassin#1534</b>. Version RTM 4128.024",
	dancar = "Dance!",
	sentar = "Sit!",
	confetar = "Throw 5 confetti!",
	mouse = "Click on screen 10 times!",
	beijos = "Give 10 kisses!",
	dormir = "They are sleepy. Sleep to rest.",
	raiva = "Tigrounette is evil! Get angry with him!",
	chorem = "No cheese for you. Cry!",
	nchorem = "Don't cry!",
	esquerda = "Don't go to the LEFT!",
	direita = "Don't go to the RIGHT!",
	numero = "Type this number: ",
	digitar = "Type anything and send to me.",
	falar = "Don't speak nothing!",
	pular = "Don't jump!",
	mexer = "Don't move!",
	bandeira = "Balance the flag of anything country!",
	ano = "What year are we?",
	vesquerda = "Stay facing LEFT!",
	vdireita = "Stay facing RIGHT!",
	quadradoa = "Stay on the blue square!",
	quadradov = "Stay on the red square!",
	quadrado = "Stay on the white square!",
	nquadrado = "Don't stay on the white square!",
	retangulo = "Stay on the white rectangle!",
	retangulov = "Stay on the red rectangle!",
	nretangulo = "Don't stay on the white rectangle!",
	preesquerda30 = "Press 30 times the LEFT key!",
	predireita30 = "Press 30 times the RIGHT key!",
	preesquerda60 = "Press 60 times the LEFT key!",
	predireita60 = "Press 60 times the RIGHT key!",
	espaco = "Press 20 times the SPACEBAR!",
	nome = "Type your nickname (with #number)!",
	ndance = "Don't dance!",
	key1 = "Press the DELETE key!",
	action1 = "Dance, sit and sleep!",
	laugh = "Laugh!",
	laugh2 = "Don't laugh!",
	stone = "Caution with the stones!",
	noob = "Type: I AM NOOB",
	action2 = "Cry and laugh!",
	jump = "Jump!",
	number = "Type the following number: ",
	key = "Press any key!",
	jump2 = "Jump 5 times!",
	action3 = "Give a kiss and cry!",
	area = "Discover where is the hidden text and click!",
	dancing = "Time of party!",
	freeze = "Stop!",
	transform = "Dance and sleep!",
	down1 = "Turn down 3 times!",
	kill = "Kill yourselves!",
	mestre = "Master Says",
	map = "Map",
	time = "Time",
	mice = "Mice",
	round = "Round",
	mices = "This room requires at least 4 players.",
	difficulty = "Difficulty",
	segundos = "seconds.",
	fim = "End of match! The next match will start on ",
	playingmap = "Playing map",
	created = "created by",
	abaixar = "Turn down and get up!",
	action = "Do any action!",
	naction = "Don't do any action!",
	math = "How much is 1+1?",
	ds = "Dance and sit!"
}
lang.fr = {
	welcome = "<N>Bienvenue sur le module 'Maître a dit' ! Dans ce module tu dois faire tout ce que dit le maître.<br><ROSE>Module créé par <b>Nasus_assassin#1534</b>. Traduit par Chatonlina#0000, Eyeground#0000 et Tortuegreen#0000. Version RTM 4128.024",
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
	preesquerda30 = "Appuie 30 fois sur la flèche GAUCHE !",
	predireita30 = "Appuie 30 fois sur la flèche DROITE !",
	preesquerda60 = "Appuie 60 fois sur la flèche GAUCHE !",
	predireita60 = "Appuie 60 fois sur la flèche DROITE !",
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
	kill = "Tuez-vous !",
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
	ds = "Danse et assis !"
}
lang.tr = {
	welcome = "<N> Master Says'ýn senaryosuna hoþ geldiniz! Bu modülde ustanýn söylediði her þeyi yapmalýsýnýz. <br> <ROSE><b>Nasus_assassin#1534</b> tarafýndan oluþturulan model. Tercüme eden Star#6725. Versiyon RTM 4128.024",
	dancar = "Dans!",
	sentar = "Sit!",
	confetar = "5 konfeti atýn!",
	mouse = "Ekranda 10 kez týklayýn!",
	beijos = "10 öpücük ver!",
	dormir = "Onlar uyuyor. Dinlenmek için uyu.",
	raiva = "Tigrounette evil! Girl for him!",
	chorem = "Senin için peynir yok. Aðla!",
	nchorem = "Aðlama!",
	esquerda = "SOLA gitme!",
	direita = "SAÐA gitme!",
	numero = "Bu numarayý yazýn: ",
	digitar = "Bir þey yazýn ve bana gönderin.",
	falar = "Hiçbir þey konuþma!",
	pular = "Atlama!",
	mexer = "Kýpýrdama!",
	bandeira = "Herhangi bir ülkenin bayraðýný dengeleyin!",
	ano = "Hangi yýldayýz?",
	vesquerda = "SOLA bakmaya devam edin!",
	vdireita = "SAÐA bakmaya devam edin!",
	quadradoa = "Mavi meydanda kalýn!",
	quadradov = "Kýzýl meydanda kalýn!",
	quadrado = "Beyaz meydanda kalýn!",
	nquadrado = "Beyaz meydanda kalmayın!",
	retangulo = "Stay on the white rectangle!",
	retangulov = "Kýrmýzý dikdörtgenin üzerinde kalýn!",
	nretangulo = "Beyaz dikdörtgenin üzerinde kalmayýn!",
	preesquerda30 = "SOL tuþa 30 kez basýn!",
	predireita30 = "SAÐ tuþa 30 kez basýn!",
	preesquerda60 = "SOL tuþa 60 kez basýn!",
	predireita60 = "SAÐ tuþa 60 kez basýn!",
	espaco = "Ara Çubuðu'na 20 kez basýn!",
	nome = "Takma adýnýzý yazýn (# sayý ile)!",
	ndance = "Dans etme!",
	vampire = "Rastgele bir oyuncu artýk bir vampir! Yakýn durma!",
	key1 = "DELETE tuþuna basýn!",
	action1 = "Dans et, otur ve uyu!",
	laugh = "Gülmek!",
	laugh2 = "Gülme!",
	stone = "Taþlarla dikkat!",
	noob = "Tür: BEN NOOB",
	action2 = "Aðla ve gül!",
	jump = "Atlama!",
	number = "Aþaðýdaki numarayý yazýn: ",
	key = "Herhangi bir tuþa basýn!",
	jump2 = "5 kez zýpla!",
	action3 = "Bir öpücük ver ve aðla!",
	area = "Gizli metnin nerede olduðunu keþfedin ve týklayýn!",
	dancing = "Parti zamaný!",
	freeze = "Dur!",
	transform = "Dans ve uyku!",
	down1 = "3 kez kapatýn!",
	kill = "Kendinizi öldürün!",
	mestre = "Usta Diyor",
	map = "Harita",
	time = "Zaman",
	mice = "fareler",
	round = "yuvarlak",
	mices = "Bu odada en az 4 oyuncu gerekmektedir.",
	difficulty = "zorluk",
	segundos = "saniye.",
	fim = "Maçýn sonu! Bir sonraki maç baþlayacak ",
	playingmap = "Harita çalýnýyor",
	created = "tarafýndan yaratýldý",
	abaixar = "Geri çekil ve kalk!",
	action = "Herhangi bir iþlem yapýn!",
	naction = "Hiçbir þey yapmayýn!",
	math = "1 + 1 ne kadar?",
	ds = "Dans ve sit!"

}
if tfm.get.room.community == "br" then
	text = lang.br
elseif tfm.get.room.community == "fr" then
	text = lang.fr
elseif tfm.get.room.community == "tr" then
	text = lang.tr
else
	text = lang.en
end
function eventNewPlayer(name)
	rato=rato+1
	for k=32, 90 do
		tfm.exec.bindKeyboard(name,k,false,true)
	end
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			};
	data[name] = newData;
	tfm.exec.chatMessage(""..text.welcome.."",name)
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Use !pw [password] to change the password of the room and !mapa [@code] to run a custom map.<br><br>If you are a FunCorp member, type !fc to enable the FunCorp mode.",admin)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if active >= 0 and active <= 55 then
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
			active=-1
		elseif i==1 then
			active=-1
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setGameTime(10)
		end
	end
	if active == 56 then
		data[name].c=1
		tfm.exec.respawnPlayer(name)
	end
	if active >= 57 then
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
			active=-1
		elseif i==1 then
			active=-1
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setGameTime(10)
		end
	end
end
function selectMap()
	map_cat=map_cat+1
	if map_cat > 5 and fc_mode == false then
		map_cat=0;
	end
	if map_cat > 7 then
		map_cat=0;
	end
	if map_cat == 0 then
		tfm.exec.newGame(mapas.simple[math.random(#mapas.simple)])
	elseif map_cat == 1 then
		tfm.exec.newGame(mapas.scenarios[math.random(#mapas.scenarios)])
	elseif map_cat == 2 then
		tfm.exec.newGame(mapas.misc[math.random(#mapas.misc)])
	elseif map_cat == 3 then
		tfm.exec.newGame(mapas.arts[math.random(#mapas.arts)])
	elseif map_cat == 4 then
		tfm.exec.newGame(mapas.mech[math.random(#mapas.mech)])
	elseif map_cat == 5 then
		tfm.exec.newGame(mapas.geek[math.random(#mapas.geek)])
	elseif map_cat == 6 then
		tfm.exec.newGame(mapas.testing[math.random(#mapas.testing)])
	elseif map_cat == 7 then
		tfm.exec.newGame(mapas.troll[math.random(#mapas.troll)])
	end
end
function eventNewGame()
	ui.removeTextArea(0,nil)
	ui.removeTextArea(1,nil)
	ui.removeTextArea(2,nil)
	ui.removeTextArea(250,nil)
	rodada=0
	active=0
	vivo=0
	rato=0
	dificuldade=1
	if unlocked == true then
		tfm.exec.setGameTime(15)
	else
		tfm.exec.setGameTime(36000)
	end
	for name,player in pairs(tfm.get.room.playerList) do
		vivo=vivo+1
		rato=rato+1
		if data[name] then
			data[name].c=0
			data[name].key=0
		end
	end
	rodadas=math.floor(20+(rato/3.5))
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b><br><br>Deseja reportar bugs, enviar mapas ou falar algo com nossa equipe? Participe do nosso grupo no Discord:<br><b>https://discord.gg/Bhk8q2D</b>")
	end
	tfm.exec.setNameColor(admin,0xff0000)
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	if fc_mode == false then
		active=math.random(1,60)
	else
		active=tonumber(fc_cmds[math.random(#fc_cmds)])
	end
	getCommand()
end
function eventChatCommand(name,message)
	if name == "Nasus_assassin#1534" or name == "Forzaldenon#0000" or name == "Aphelios#1910" or name == admin then
		if(message:sub(0,7) == "command") then
				active=tonumber(message:sub(9))
				getCommand()
		end
		if(message:sub(0,4) == "mapa") then
			tfm.exec.newGame(message:sub(6))
			active=0
		end
		if(message:sub(0,3) == "run") then
			tfm.exec.newGame(message:sub(5))
			active=0
		end
		if(message:sub(0,5) == "limit") then
			tfm.exec.setRoomMaxPlayers(tonumber(message:sub(7)))
		end
		if(message:sub(0,2) == "pw") then
			tfm.exec.setRoomPassword(tostring(message:sub(4)))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
		if message == "fc" then
			if fc_mode == false then
				fc_mode=true
				tfm.exec.chatMessage("<R>The FunCorp mode of this module is now enabled.")
			else
				fc_mode=false
				tfm.exec.chatMessage("<R>The FunCorp mode of this module is now disabled.")
			end
		end
	end
end
function getCommand()
	rodada=rodada+1
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].c=0
		data[name].s=0
	end
	if active == 1 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.dancar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 2 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.sentar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 3 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.confetar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
	end
	if active == 4 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.mouse.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 5 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.beijos.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(15)
	end
	if active == 6 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.dormir.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 7 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.raiva.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 8 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.chorem.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 9 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.esquerda.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 10 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.direita.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 11 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.digitar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 12 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.falar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 13 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.pular.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 14 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.mexer.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 15 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.bandeira.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 16 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.ano.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 17 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.vesquerda.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 18 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.vdireita.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 19 then
		xpos=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.quadrado.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
	end
	if active == 20 then
		xpos=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.retangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 21 then
		xpos=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.nretangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 22 then
		ypos=math.random(40,300)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.retangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 23 then
		ypos=math.random(40,300)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.nretangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 24 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.preesquerda30.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 25 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.predireita30.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 26 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.preesquerda60.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 27 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.predireita60.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 28 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.espaco.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 29 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.nome.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 30 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.ndance.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 31 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.quadrado.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 32 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.quadradov.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 33 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.retangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 34 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.retangulov.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.abaixar.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 36 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.action.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 37 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.ds.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 38 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.key1.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 39 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.action1.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 40 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.laugh.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 41 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.laugh2.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 42 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.stone.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		for i=1,24 do
			tfm.exec.addShamanObject(85,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 43 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.noob.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 44 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.action2.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 45 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.jump.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 46 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.nretangulo.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 47 then
		number=math.random(10000000,99999999)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.number..""..number.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(11)
	end
	if active == 48 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.key.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 49 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.jump2.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 50 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.action3.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 51 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.area.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		ui.addTextArea(250,"<a href='event:command51'>CLICK HERE",nil,math.random(100,700),math.random(50,350),100,25,0,0,1.0,true)
		tfm.exec.setGameTime(10)
	end
	if active == 52 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.dancing.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
			tfm.exec.playEmote(name,0)
		end
		tfm.exec.setGameTime(7)
	end
	if active == 53 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.freeze.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
			tfm.exec.freezePlayer(name,true)
		end
		tfm.exec.setGameTime(7)
	end
	if active == 54 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.transform.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 55 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.down1.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 56 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.kill.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 57 then
		xpos=math.random(60,700)
		xpos2=math.random(60,700)
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.quadradoa.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 58 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.naction.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		tfm.exec.setGameTime(7)
	end
	if active == 59 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.nchorem.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		tfm.exec.setGameTime(7)
	end
	if active == 60 then
		ui.addTextArea(0,"<font face='Bahnschrift SemiLight,Arial'><font color='#202020'>#"..active.." <font size='22'><p align='center'><b>"..text.math.."",nil,25,364,750,40,0xffffff,0x808080,0.96,true)
		tfm.exec.setGameTime(8)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "command51" then
		data[name].c=1
		ui.removeTextArea(250,name)
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		data[name].c=1
	end
	if active == 12 or active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2020" then
			data[name].c=1
		else
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if string.upper(message) == string.upper(name) then
			data[name].c=1
		end
	end
	if active == 41 then
		if string.find(message,"k") or string.find(message,"K") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 43 then
		if string.upper(message) == "EU SOU NOOB" or string.upper(message) == "I AM NOOB" then
			data[name].c=1
		end
	end
	if active == 47 then
		if message == tostring(number) then
			data[name].c=1
		end
	end
	if active == 60 then
		if message == "2" then
			data[name].c=1
		end
	end
end
function eventEmotePlayed(name,id)
	if active == 1 then
		if id == 0 or id == 10 then
			data[name].c=1
		end
	end
	if active == 2 then
		if id == 8 then
			data[name].c=1
		end
	end
	if active == 3 then
		if id == 9 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
	if active == 5 then
		if id == 3 then
			data[name].s=data[name].s+1
			if data[name].s >= 10 then
				data[name].c=1
			end
		end
	end
	if active == 6 then
		if id == 6 then
			data[name].c=1
		end
	end
	if active == 7 then
		if id == 4 then
			data[name].c=1
		end
	end
	if active == 8 then
		if id == 2 then
			data[name].c=1
		end
	end
	if active == 14 or active == 58 then
		tfm.exec.killPlayer(name)
	end
	if active == 15 then
		if id == 10 then
			data[name].c=1
		end
	end
	if active == 30 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 36 then
		data[name].c=1
	end
	if active == 37 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].c=1
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
			data[name].c=1
		end
	end
	if active == 40 then
		if id == 1 then
			data[name].c=1
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
			data[name].c=1
		end
	end
	if active == 50 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 54 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 59 then
		if id == 2 then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		data[name].s=data[name].s+1
		if data[name].s >= 10 then
			data[name].c=1
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
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
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
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
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
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
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
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
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
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
	end
	if active == 35 then
		if id == 40 or id == 83 then
			data[name].c=1
		end
	end
	if active == 38 then
		if id == 46 then
			data[name].c=1
		end
	end
	if active == 45 then
		if id == 38 or id == 87 then
			data[name].c=1
		end
	end
	if active == 48 then
		data[name].c=1
	end
	if active == 49 then
		if id == 38 or id == 87 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
	if active == 55 then
		if id == 40 or id == 83 then
			data[name].s=data[name].s+1
			if data[name].s >= 1 then
				data[name].c=1
			end
		end
	end
end
function eventLoop(passado,faltando)
	local tempo=math.floor(faltando/1000)
	if active == -2 then
		ui.setMapName("<N>"..text.mices.."  <BL>|  <N>Version RTM 4128.024 by Nasus<")
	elseif active == -1 then
		ui.setMapName("<VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."  <BL>|  <N>Version RTM 4128.024 by Nasus<")
	end
	if active >= 0 then
		ui.setMapName("<N>"..text.mestre.."  <BL>|  <N>"..text.time.." : <J>"..math.ceil(faltando/1000).."s  <BL>|  <N>"..text.mice.." : <J>"..vivo.." / "..rato.."  <BL>|  <N>"..text.round.." : <J>"..rodada.."  <BL>|  <N>Version RTM 4128.024 by Nasus<")
		if passado > 1200 and passado < 1700 and unlocked == true then
			tfm.exec.chatMessage(""..text.playingmap.." <J>"..tfm.get.room.currentMap.."<BL> "..text.created.." <J>"..tfm.get.room.xmlMapInfo.author)
		end
	end
	if rato < 4 then
		if tfm.get.room.currentMap == "@7692039" and unlocked == true then
			active=-2
			tfm.exec.setGameTime(8000)
		else
			if passado > 4000 and unlocked == true then
				tfm.exec.newGame("@7692039")
				tfm.exec.setGameTime(8000)
				tfm.exec.chatMessage("<R>"..text.mices.."",nil)
			end
		end
	end
	if rato >= 4 and passado >= 4000 then
		if tfm.get.room.currentMap == "@7692039" and unlocked == true then
			map_cat=-1
			selectMap()
			active=0
		end
	end
	if active < 0 and faltando < 1 and unlocked == true then
		selectMap()
	end
	if active == 0 and faltando < 1000 then
		if rodada < rodadas then
			sortearComandos()
		else
			active=-1
			tfm.exec.setGameTime(10)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(true)
				tfm.exec.playerVictory(true)
			end
		end
	end
	if active > 0 and faltando < 1 and rato >= 2 then
		if active == 17 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == true then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 18 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == false then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 19 or active == 31 or active == 32 or active == 57 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 32 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 20 or active == 33 or active == 34 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x < xpos or player.x > xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 21 or active == 46 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > xpos and player.x < xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 22 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < ypos-10 or player.y > ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 23 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y > ypos-10 and player.y < ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 53 then
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.freezePlayer(name,false)
			end
		end
		ui.removeTextArea(0,nil)
		ui.removeTextArea(1,nil)
		ui.removeTextArea(2,nil)
		ui.removeTextArea(250,nil)
		active=0
		if rodada == 4 or rodada == 6 or rodada == 8 or rodada == 10 or rodada == 12 then
			dificuldade=dificuldade+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].key=0
			if data[name].c == 0 then
				tfm.exec.killPlayer(name)
			end
		end
		if fc_mode == false then
			if vivo > 4 then
				tfm.exec.setGameTime(6-dificuldade)
				else
				tfm.exec.setGameTime(9-dificuldade)
			end
		else
			tfm.exec.setGameTime(6)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].c == 1 then
				tfm.exec.setNameColor(name,0x00ff00)
			else
				tfm.exec.setNameColor(name,0xc2c2da)
			end
		end
	end
end
tfm.exec.newGame("@7692039")