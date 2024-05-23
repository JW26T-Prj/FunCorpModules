-- Antes de rodar este código em uma sala, verifique se esta versão coincide com a versão mais recente presente abaixo:
-- https://github.com/JW26T-Prj/FunCorpModules/blob/master/Mestre%20Mandou%20-%20Simon%20Says.lua
-- Isto vai garantir que você receba sempre as últimas atualizações e correções de bugs.

-- Warning: Before running this code into a room, check if this version is the same than the latest version located here:
-- https://github.com/JW26T-Prj/FunCorpModules/blob/master/Mestre%20Mandou%20-%20Simon%20Says.lua
-- This is a guarantee that you will receive all the latest updates and bugfixes.

admin={""} -- insira o nome dos FunCorps aqui! / insert the FunCorp names here!

-- Se estiver rodando este código em uma sala FunCorp, digite !fc para habilitar algumas funções e comandos especiais.
-- If you are running this code into a FunCorp room, type !tc to enable some additional commands and functions.

-- Comandos para uso de membros FunCorp e do dono da sala:
-- !command [número de 1 a 133] - Executa um comando manualmente.
-- !run [@número] - Executa o mapa especificado.
-- !kill [nick#tag] - Mata o jogador especificado.
-- !limit [número] - Altera o limite de jogadores na sala.
-- !pw [password] - Adiciona uma senha na sala.

-- FunCorp and Room Owner Available commands:
-- !command [1-133] - Run a command manually.
-- !run [@code] - Run the specified map.
-- !kill [player#tag] - Kill the specified player.
-- !limit [number] - Limit the number of maximum players on the room.
-- !pw [password] - Lock the room with a password.

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! / DON'T CHANGE ANYTHING BELOW THIS LINE!

for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
mapas={"@6788174","@6788154","@6788715","@6788728","@6789271","@6790527","@6791838","@6789356","@6822331","@7290275","@7686598","@7750148","@7688066","@6788183","@6784965","@6789235","@6789853","@6790385","@6791944","@6801706","@6792470","@6806109","@6821950","@6866406","@6866437","@6885971","@5328362","@5957905","@7055459","@7214363","@6792516","@6825340","@6788693","@6789272","@6799996","@6803018","@6859175","@6907177","@7404327","@7382263","@6885799","@6790912","@6833993","@7721192","@7309605","@6788861","@6789249","@6790484","@7921432","@6794050","@6830799","@6866549","@6834529","@6876563","@6888512","@6893463","@7431981","@7146925","@6937148","@6356881","@6789280","@6790895","@6799997","@6789324","@6803128","@6900149","@3832586","@6791871","@6811934","@6876638","@6892608","@6982387","@7404106","@7405103","@7400694","@7400678","@7412412","@7412422","@7755685","@6843950","@6810292","@3110915","@6789263","@7354947","@7201360","@6897042","@5549586","@6809461","@7242361","@7697974","@1966987","@7224471","@6932585","@6920982","@7863458","@7897912","@7899697","@7910742","@7236120","@2802178","@7913565","@5549355","@7230453","@7188655","@6481798","@7938319","@6810588","@7904062","@7216097","@7951509","@7368748","@7737497"}
active=-2; vivo=0; rato=0; dificuldade=1; rodadas=0; rodada=0; number=""; count=0; xpos=0; pid=-1; ypos=0; data={}; grounds={}; images={}; lang={}; alives={}; tempo=10; counter=0; q=""; a=""; qtime=10; creator=""; sd_vivo=0; unlocked=true;
fc_cmds={1,2,4,5,6,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,28,30,31,32,33,34,35,36,40,41,43,45,46,47,48,49,50,51,53,56,57,58,59,61,62,65,66,67,69,71,75,76,77,78,80,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,99,100,101,102,104,105,106,108,109,110,111,112,113,114,115,116,117,118,119,120,122,123,124,126,127,128,130,132}
spiderweb={type = 15,width = 60,height = 60}
cobweb={type = 15,width = 2400,height = 1200,miceCollision = false,groundCollision = false}
acid={type = 19,width = 10,height = 25,miceCollision = true,groundCollision = false,dynamic = true,fixedRotation = true,mass = 5000}
acidg={type = 19,width = 30,height = 30}
lava={type = 3,width = 2400,height = 100,miceCollision = false,groundCollision = false, foreground = true}
upacid={type = 19,width = 1600,height = 10,miceCollision = true,groundCollision = false, foreground = true}
acids={type = 19,width = 2400,height = 80,miceCollision = true,groundCollision = false}
laser={type = 12,width = 2400,height = 10,miceCollision = false,groundCollision = false, foreground = true, color = 0xff0000}
laserv={type = 12,width = 10,height = 800,miceCollision = false,groundCollision = false, foreground = true, color = 0xff0000}
acids2={type = 19,width = 2400,height = 10,miceCollision = true,groundCollision = false, foreground = true}
acids3={type = 19,width = 10,height = 800,miceCollision = true,groundCollision = false, foreground = true}
fc_mode=false; xpos=0; xpos2=0;
system.disableChatCommandDisplay(nil,true)
lang.br = {
	welcome = "<N><b>Bem-vindos ao module Mestre Mandou!</b><br>Siga tudo o que o jogo mandar e teste seus limites até o fim!<br><br><VP><b>Module criado e gerenciado por Jessiewind26#2546</b><br><br><R>Versão 7.9.2<br>Edição especial de aniversário de 10 anos",
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
	jump3 = "Pulem 15 vezes!",
	action3 = "Dê um beijo depois chore!",
	area = "Descubra onde está o texto escondido e clique nele!",
	dancing = "É hora da festa!",
	freeze = "Todo mundo parado!",
	transform = "Dance e durma!",
	down1 = "Abaixem 3 vezes!",
	down2 = "Abaixem 10 vezes!",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	help = "Ajuda",
	hcontent = "O objetivo deste module é muito simples:<br><b>Siga tudo o que o jogo mandar e teste seus limites até o fim!</b><br><br>Tenha cuidado, pois alguns comandos podem te matar de surpresa, portanto, é preciso ficar muito esperto!<br><br><BL>Module criado e gerenciado por Jessiewind26#2546",
	mices = "Esta sala requer pelo menos 4 ratos.",
	difficulty = "Dificuldade",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	dofim = "Ninguém ganhou... Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por",
	abaixar = "Abaixem e se levantem!",
	action = "Façam qualquer ação!",
	naction = "Não façam nenhuma ação!",
	math = "Quanto é 1+1?",
	math1 = "Quanto é 2+2?",
	math2 = "Quanto é 3-4?",
	ds = "Dance e sente!",
	seq4 = "Dance, sente, durma e bata palmas!",
	seq5 = "Dance, bata palmas e ria!",
	seq6 = "Dance e chore!",
	seq7 = "Dance, dê um beijo e fique com raiva!",
	seq8 = "Dê um beijo, durma e chore!",
	seq9 = "Durma, pule e taque um confete!",
	seq10 = "Dê um beijo, solte um confete e dance!",
	seq11 = "Ria, dance, durma, chore e coloque a mão no rosto!",
	seq12 = "Fique com raiva, sente, solte um confete, dance e sente de novo!",
	seq13 = "Dance, sente, durma, ria, chore, dê um beijo e pule!",
	spider = "Cuidado com as teias de aranha!",
	spider1 = "Essa não! Uma aranha passou no mapa e o encheu de teias!",
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
	collect = "Cuidado com a chuva ácida!",
	balls = "Está chovendo bolas!",
	explosion = "Olha a explosão!",
	queijo = "Todos os ratos que estiverem com queijo vão morrer!",
	caps = "Pressione a tecla CAPS LOCK 10 vezes",
	acid = "Cuidado com o ácido!",
	water = "Saia da água, ou seja engolido por ela!",
	lava = "Saia da lava, ou seja engolido por ela!",
	nowater = "Fique dentro da água!",
	select = "<VP>O modo de comando seletivo está ativo nesta sala.",
	newcreator = "Qual é o novo nome do criador deste module?",
	funcorp = "O modo FunCorp deste jogo está habilitado.",
	admin = "Você é o administrador desta sala.<br><br>Se você for um membro FunCorp, digite !fc para habilitar o modo FunCorp.",
	balloon = "Voar, voar, subir, subir...",
	lava1 = "Cuidado! O chão está se transformando em lava!",
	lava2 = "O chão é lava!",
	lava3 = "Cuidado! O chão está se transformando em ácido!",
	light = "Acabou a luz!",
	ndurma = "Não durma!",
	move = "Se mexam!",
	clickhere = "<font size='8'>CLIQUE AQUI",
	apple = "Está chovendo maçãs!",
	cn = "Está chovendo canhões!",
	people = "Há quantos humanos aqui nesta sala?",
	fall = "ATENÇÃO! O dano de queda está habilitado!",
	collide = "ATENÇÃO! A colisão com os ratos está habilitada!",
	ufo = "Cuidado! Os ratos estão sendo abduzidos!",
	emoji = "Utilize um emoticon!",
	emoji1 = "Utilize os seguintes emoticons em sequência: 1 4 7 5 9 2 8 6",
	emoji2 = "Utilize os seguintes emoticons em sequência: 5 9 6 1 7 3 4 8",
	meep = "O MEEP está habilitado!",
	portal = "Tenham cuidado! Entrar no portal te levará para a morte!",
	vampires = "Todos os ratos foram transformados em vampiros!",
	kills = "Se matem!",
	catch = "Pegue o '+1' antes que ele desapareça!",
	raster = "ATENÇÃO! As áreas em vermelho serão tomadas pelo ácido!",
	space = "Os ratos agora estão no espaço!",
	chicken = "Está chovendo galinhas!",
	submission = "<br><J>As avaliações de mapas do Mestre Mandou estão abertas!<br><VP><b>atelier801.com/topic?f=796133&t=915772&p=1</b><br>",
	verify = "<J>Para que possamos verificar a estabilidade do module e coletar estatísticas, a partir deste momento, todas as informações desta sala estão sendo registradas no banco de dados interno do module.",
}
lang.en = {
	welcome = "<N><b>Welcome to Simon Says module!</b><br>Follow everything the game told and test your limits until the end!<br><br><VP><b>Script made and developed by Jessiewind26#2546</b><br>Translation by Draw#6691<br><br><R>Version 7.9.2<br>10 Year Anniversary Special Edition",
	dancar = "Dance!",
	sentar = "Sit down!",
	confetar = "Throw 5 confetti!",
	mouse = "Click 10 times on the screen!",
	beijos = "Give 10 kisses!",
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
	quadradoa = "Stay on the blue square!",
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
	laugh2 = "Who laughs now dies.",
	stone = "Watch out the rock!",
	noob = "Type: I AM A NOOB",
	action2 = "Cry and then laugh!",
	jump = "Jump!",
	number = "Type the following number: ",
	key = "Press any key!",
	jump2 = "Jump 5 times!",
	jump3 = "Jump 15 times!",
	action3 = "Give a kiss and then cry!",
	area = "Find out where is the hidden text and click on it!",
	dancing = "It's party time!",
	freeze = "Everyone STOP!",
	transform = "Dance and sleep!",
	down1 = "Get down 3 times!",
	down2 = "Get down 10 times!",
	mestre = "Simon Says",
	map = "Map",
	time = "Time",
	mice = "Mouses",
	round = "Round",
	help = "Help",
	hcontent = "The objective of this module is very simple:<br><b>Follow everything that the game says and test your limits to the maximum!</b><br><br>Take care, because some commands can surprise you and kill your mice, so, you have to be very smart!<br><br><BL>Module made and developed by Jessiewind26#2546",
	mices = "This room request at least 4 mice.",
	difficulty = "Difficulty",
	segundos = "seconds.",
	fim = "The match is over! Next starting in ",
	dofim = "No winners! Next starting in ",
	playingmap = "Running map",
	created = "created by",
	abaixar = "Get down and get up!",
	action = "Do any action!",
	naction = "Dont do any action!",
	math = "How much it is 1+1?",
	math1 = "How much it is 2+2?",
	math2 = "How much it is 3-4?",
	ds = "Dance and sit!",
	seq4 = "Dance, sit, sleep and clap!",
	seq5 = "Dance, clap and laugh!",
	seq6 = "Dance and cry!",
	seq7 = "Dance, give a kiss and get angry!",
	seq8 = "Give a kiss, sleep and cry!",
	seq9 = "Sleep, jump and throw confetti!",
	seq10 = "Give a kiss, throw confetti and dance!",
	seq11 = "Laugh, dance, sleep, cry and facepalm!",
	seq12 = "Get angry, sit, throw confetti, dance and sit again!",
	seq13 = "Dance, sit, sleep, laugh, cry, give a kiss and jump!",
	spider = "Watch out at the cobwebs!",
	spider1 = "Oh no! A spider passed over the map and filled it with cobwebs!",
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
	collect = "Caution with the acid rain!",
	balls = "It's raining balls!",
	explosion = "Look the explosion!",
	queijo = "All mices that catched the cheese will die!",
	caps = "Press the CAPS LOCK key 10 times!",
	tribe = "Type the name of your tribe! (if you have)",
	acid = "Caution with the acid grounds!",
	water = "Get out of the water!",
	lava = "Get out of the lava!",
	nowater = "Stay into the water!",
	select = "<VP>The selective command mode is now enabled.",
	newcreator = "Who's the new nickname of the module creator?",
	funcorp = "The FunCorp mode of this module is now enabled.",
	admin = "You are the administrator of this room.<br><br>If you are a FunCorp member, type !fc to enable the FunCorp mode.",
	balloon = "Balloon party!",
	lava1 = "Caution! The floor is turning into lava!",
	lava2 = "The floor is lava!",
	lava3 = "Caution! The floor is turning into acid!",
	light = "The map is now black!",
	ndurma = "Dont sleep!",
	clickhere = "<font size='8'>CLICK HERE",
	apple = "Apple rain!",
	cn = "Cannon rain!",
	people = "How much humans are in this room?",
	move = "Move your mice!",
	fall = "BEWARE! Fall damage is now enabled!",
	collide = "BEWARE! The collision with mices is now enabled!",
	ufo = "Take care! An UFO is passing and is abducting all mices!",
	emoji = "Use an emoticon!",
	emoji1 = "Use the following emoticons in sequence: 1 4 7 5 9 2 8 6",
	emoji2 = "Use the following emoticons in sequence: 5 9 6 1 7 3 4 8",
	meep = "The MEEP is now enabled!",
	portal = "Take care! Enter into the portal and get killed!",
	vampires = "All mices are turned into vampires!",
	catch = "Catch the '+1'!",
	kills = "Kill yourselves!",
	raster = "BEWARE! The red areas will be replaced with acid!",
	space = "All the mices are now in space!",
	chicken = "Chicken rain!",
	submission = "<br><J>The map submissions for this module are now open!<br><VP><b>atelier801.com/topic?f=796133&t=915772&p=1</b><br>",
	verify = "<J>From this moment on, all information from this room is being recorded in the module's internal database.",
}

if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end

ninjas={"Jessiewind26#2546","Irelia#7317","Lacoste#8972","Riven#1630","Globo_rural#6532","Qiyana#2797","Skyymellu#0000","Rakan#3159"}

function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return true
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
function setAllNightMode()
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.setPlayerNightMode(true, name)
	end
end
function eventNewPlayer(name)
	rato=rato+1
	for i=0,3 do
		tfm.exec.bindKeyboard(name,i,false,true)
	end
	for k=20,90 do
		tfm.exec.bindKeyboard(name,k,false,true)
	end
	tfm.exec.bindKeyboard(name,115,false,true)
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			["count"]=0;
			["imageid"]=-1;
			["imaget"]=10;
			["opened"]=true;
			};
	data[name] = newData;
	showMessage(text.welcome,name)
	if string.find(tfm.get.room.name,name) then
		table.insert(admin,name)
		showMessage(text.admin,name)
		showMessage("<br>Available commands: <br>!command [1-133] - Run a command manually.<br>!run [@code] - Run the specified map.<br> !kill [player#tag] - Kill the specified player.<br>!limit [number] - Limit the number of maximum players on the room.<br> !pw [password] - Lock the room with a password.",name)
	end
	ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.5,true)
	data[name].imageid = tfm.exec.addImage("18d5c7e867c.png","&-1",150,65,name); data[name].imaget=10;
end
function completeCommand(name)
	if tfm.get.room.playerList[name].isDead == false or active == 125 then
		if data[name].c == 0 then
			if data[name].c == 0 then
				showMessage(text.completed,name)
			end
			sd_vivo=sd_vivo+1
			data[name].c=1
			tfm.exec.setNameColor(name,0x00ff00)
		end
	end
end
function eventPlayerDied(name)
	if active == 125 then
		completeCommand(name)
		tfm.exec.respawnPlayer(name)
	else
		vivo=0
		local i=0
		local name
		for pname,player in next,tfm.get.room.playerList do
			if not player.isDead then
				i=i+1
				name=pname
				vivo=vivo+1
			end
		end
		if active >= 0 then
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
	end
end
function eventNewGame()
	rodada=0; active=0; vivo=0; rato=0; dificuldade=1;
	for i=0,2 do
		ui.removeTextArea(i,nil)
	end
	ui.removeTextArea(24,nil)
	ui.removeTextArea(250,nil)
	tfm.exec.setWorldGravity(0, 10)
	tfm.exec.setGameTime(20)
	if fc_mode == true then
		showMessage("<VP><br>"..text.funcorp.."")
	end
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.setPlayerNightMode(false, name)
		vivo=vivo+1
		rato=rato+1
		if data[name] then
			data[name].c=0
			data[name].key=0
			data[name].count=0
		end
		if verifyNinjas(name) == true then
			showMessage(text.select)
		end
	end
	rodadas=math.floor(20+math.floor(rato/4))
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	if fc_mode == true then
		active=tonumber(fc_cmds[math.random(#fc_cmds)])
	else
		active=math.random(1,133)
	end
	sd_vivo=0
	getCommand()
end
function balloonParty()
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isDead == false then
			tfm.exec.attachBalloon(name, true, math.random(1,4), false, 1)
		end
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-11,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function addCommandCount(name)
	data[name].s=data[name].s+1
	if data[name].c == 0 then
		if tfm.get.room.playerList[name].isDead == false then
			ui.addTextArea(24,"<font size='32'><p align='center'><N>"..data[name].s.."",name,360,25,80,45,0x000001,0x404040,0.8,true)
		end
	end
end
function removeCommandCount(name)
	if data[name].s > 2 then data[name].s=data[name].s-3; else data[name].s=0; end
	if data[name].c == 0 then
		if tfm.get.room.playerList[name].isDead == false then
			ui.addTextArea(24,"<font size='32'><p align='center'><N>"..data[name].s.."",name,360,25,80,45,0x000001,0x404040,0.8,true)
		end
	end
end
function eventPlayerBonusGrabbed(name, id)
	if active == 121 then
		completeCommand(name)
	end
end
function eventChatCommand(name,message)
	if unlocked == true then
		if message == "help" then
			showMenu(name,0x185412,200,125,400,163,text.help,text.hcontent)
		end
		if verifyNinjas(name) == true then
			if(message:sub(0,5) == "stmsg") then
				showCommand(1024,message:sub(7))
				unlocked=false
				tfm.exec.setGameTime(36000)
			end
			if(message:sub(0,4) == "jjjj") then
				showMessage("<VP>• [Jessie] "..message:sub(6))
			end
		end
		if verifyNinjas(name) == true or verifyAdmin(name) == true then
			if active <= 0 then
				if(message:sub(0,3) == "run") then
					if string.len(message:sub(5)) == 8 then
						tfm.exec.newGame(message:sub(5))
						active=0
					end
				end
				if(message:sub(0,7) == "command") then
					tt={}; for i=1,135 do table.insert(tt,tostring(i)) end
					if findString(message:sub(9),tt) then
						active=tonumber(message:sub(9))
						getCommand()
					end
				end
			end
			if(message:sub(0,5) == "limit") then
				tt={}; for i=2,50 do table.insert(tt,tostring(i)) end
				if findString(message:sub(7),tt) then
					tfm.exec.setRoomMaxPlayers(tonumber(message:sub(7)))
				end
			end
			if message == "fc" then
				if fc_mode == false then
					fc_mode=true
					showMessage("<R>The FunCorp mode of this module is now enabled.",name)
				else
					fc_mode=false
					showMessage("<R>The FunCorp mode of this module is now disabled.",name)
				end
			end
			if message == "verify" then showMessage(text.verify); end
			if message == "sd" then	system.exit(); end
			if message == "cavalinho" then showMessage("<J>Essa mulher enlouqueceu<br>Ela quer montar em cima de mim<br>Ela pirou de vez<br>Tá pensando que eu sou seu cavalinho<br>E eu vou só dizendo assim<br>Vai, vai<br><br>E vai no cavalinho<br>Vai, vai, vai, vai<br>E vai no cavalinho<br>Vai, vai, vai, vai<br>Vai no cavalinho<br>Vai, vai, vai, vai"); end
			if message == "vasco" then showMessage("<font color='#ffffff'>Vamos todos cantar de coração<br>A Cruz de Malta é o meu pendão<br>Tu tens o nome do heroico português<br>Vasco da Gama, a tua fama assim se fez<br><br>Tua imensa torcida é bem feliz<br>Norte-Sul, Norte-Sul deste Brasil<br>Tua estrela, na terra a brilhar<br>Ilumina o mar<br><br>No atletismo, és um braço<br>No remo, és imortal<br>No futebol, és um traço<br>De união Brasil-Portugal<br><br>No atletismo, és um braço<br>No remo, és imortal<br>No futebol, és um traço<br>De união Brasil-Portugal"); end
			if message == "aurelionsol" then showMessage("<font color='#0526C3'<b>Naturalmente...</b>"); end
			if(message:sub(0,1) == "q") then q=message:sub(3); end
			if(message:sub(0,1) == "a") then a=message:sub(3); end
			if(message:sub(0,1) == "t") then qtime=tonumber(message:sub(3)); end
			if(message:sub(0,4) == "kill") then tfm.exec.killPlayer(message:sub(6)); end
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
end
function showCommand(id,text)
	ui.addTextArea(0,"<font face='Cascadia Code,Consolas,Lucida Console'><font color='#ffffff'><font size='17'><p align='center'>"..text.."",nil,3,367,794,28,0x121213,0x686A69,1,true)
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
		tfm.exec.setGameTime(5)
	end
	if active == 4 then
		showCommand(active,text.mouse)
		tfm.exec.setGameTime(6)
	end
	if active == 5 then
		showCommand(active,text.beijos)
		tfm.exec.setGameTime(11)
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
		tfm.exec.setGameTime(7)
	end
	if active == 12 then
		showCommand(active,text.falar)
		tfm.exec.setGameTime(9)
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
		xpos=math.random(80,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 21 then
		xpos=math.random(80,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 22 then
		ypos=math.random(30,320)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		horizontalRectangle(ypos)
	end
	if active == 23 then
		ypos=math.random(30,320)
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
		tfm.exec.setGameTime(5)
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
		number=tostring(math.random(1000000,9999999))
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
		ui.addTextArea(250,"<a href='event:command51'>"..text.clickhere.."",nil,math.random(100,700),math.random(50,350),100,25,0,0,1.0,true)
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
		tfm.exec.setGameTime(5)
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
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.setWorldGravity(0, math.random(3,23))
	end
	if active == 71 then
		showCommand(active,text.black)
		tfm.exec.setGameTime(10)
		setAllAlive()
		tfm.exec.setWorldGravity(math.random(-50,50), 20)
	end
	if active == 72 then
		number=tostring(math.random(100000000,999999999))
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
		tfm.exec.setGameTime(5)
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
		tfm.exec.setGameTime(5)
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
	if active == 84 then
		showCommand(active,text.acid)
		setAllAlive()
		tfm.exec.setGameTime(10)
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), math.random(50,350), acidg)
		end
	end
	if active == 85 then
		number1=math.random(100000000,999999999)
		number2=math.random(1000000,9999999)
		number=tostring(number1..number2)
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(13)
	end
	if active == 86 then
		showCommand(active,text.nowater)
		tfm.exec.setGameTime(6)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 9,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 87 then
		showCommand(active,text.water)
		tfm.exec.setGameTime(6)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 9,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 88 then
		showCommand(active,text.seq7)
		tfm.exec.setGameTime(10)
	end
	if active == 89 then
		xpos=math.random(100,700)
		showCommand(active,text.nquadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
	end
	if active == 90 then
		showCommand(active,text.balloon)
		tfm.exec.setGameTime(12)
		setAllAlive()
		balloonParty()
	end
	if active == 91 then
		showCommand(active,text.light)
		tfm.exec.setGameTime(10)
		setAllAlive()
		setAllNightMode()
	end
	if active == 92 then
		showCommand(active,text.preesquerda100)
		tfm.exec.setGameTime(18)
	end
	if active == 93 then
		showCommand(active,text.predireita100)
		tfm.exec.setGameTime(18)
	end
	if active == 94 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(7)
		setAllAlive()
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acid)
		end
	end
	if active == 95 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acid)
		end
	end
	if active == 96 then
		showCommand(active,text.lava1)
		tfm.exec.setGameTime(11)
		setAllAlive()
	end
	if active == 97 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(7)
		setAllAlive()
		setAllNightMode()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acid)
		end
	end
	if active == 98 then
		showCommand(active,text.creator)
		tfm.exec.setGameTime(10)
	end
	if active == 99 then
		showCommand(active,text.seq8)
		tfm.exec.setGameTime(10)
	end
	if active == 100 then
		showCommand(active,text.apple)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,15 do
			tfm.exec.addShamanObject(39,i*50,64,0,0,0,false)
		end
	end
	if active == 101 then
		showCommand(active,text.ndurma)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 102 then
		showCommand(active,text.move)
		tfm.exec.setGameTime(5)
	end
	if active == 103 then
		showCommand(active,text.people)
		tfm.exec.setGameTime(7)
	end
	if active == 104 then
		showCommand(active,text.down2)
		tfm.exec.setGameTime(8)
	end
	if active == 105 then
		xpos=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(7)
		setAllAlive()
		setAllNightMode()
		whiteSquare(xpos)
	end
	if active == 106 then
		showCommand(active,text.cn)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,15 do
			tfm.exec.addShamanObject(17,i*50,64,0,0,0,false)
		end
	end
	if active == 107 then
		showCommand(active,text.lava)
		tfm.exec.setGameTime(7)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 3,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 108 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=1,12 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acid)
		end
	end
	if active == 109 then
		showCommand(active,text.seq9)
		tfm.exec.setGameTime(10)
	end
	if active == 110 then
		showCommand(active,text.fall)
		tfm.exec.setAieMode(true, 1)
		tfm.exec.setGameTime(10)
		setAllAlive()
	end
	if active == 111 then
		showCommand(active,text.collide)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setPlayerCollision(name, 2)
		end
		tfm.exec.setGameTime(12)
		setAllAlive()
	end
	if active == 112 then
		showCommand(active,text.emoji)
		tfm.exec.setGameTime(6)
	end
	if active == 113 then
		showCommand(active,text.seq10)
		tfm.exec.setGameTime(10)
	end
	if active == 114 then
		showCommand(active,text.vampires)
		tfm.exec.setGameTime(12)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setVampirePlayer(name, true)
		end
		setAllAlive()
	end
	if active == 115 then
		showCommand(active,text.meep)
		tfm.exec.setGameTime(14)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.giveMeep(name, true)
		end
		setAllAlive()
	end
	if active == 116 then
		showCommand(active,text.lava3)
		tfm.exec.setGameTime(15)
		count=0
		setAllAlive()
	end
	if active == 117 then
		showCommand(active,text.seq11)
		tfm.exec.setGameTime(14)
	end
	if active == 118 then
		showCommand(active,text.seq12)
		tfm.exec.setGameTime(14)
	end
	if active == 119 then
		showCommand(active,text.ufo)
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.setWorldGravity(0, math.random(-12,-6))
	end
	if active == 120 then
		showCommand(active,text.portal)
		tfm.exec.setGameTime(16)
		setAllAlive()
		table.insert(grounds,tfm.exec.addShamanObject(2700, 400, -4054))
	end
	if active == 121 then
		showCommand(active,text.catch)
		tfm.exec.setGameTime(11)
		id=0
		x=math.random(200,600)
		y=math.random(160,320)
		for name,player in next,tfm.get.room.playerList do
			id=id+1
			tfm.exec.addBonus(0, x, y, id, 0, true, name)
		end
	end
	if active == 122 then
		showCommand(active,text.seq13)
		tfm.exec.setGameTime(16)
	end
	if active == 123 then
		showCommand(active,text.math2)
		tfm.exec.setGameTime(6)
	end
	if active == 124 then
		showCommand(active,text.emoji1)
		tfm.exec.setGameTime(9)
	end
	if active == 125 then
		showCommand(active,text.kills)
		tfm.exec.setGameTime(10)
	end
	if active == 126 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(13)
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, 1200, -10+(92*i), laser)
		end
	end
	if active == 127 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(13)
		setAllAlive()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, -100+(200*i), 400, laserv)
		end
	end
	if active == 128 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(14)
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, 1200, -10+(92*i), laser)
		end
		for i=5,12 do
			tfm.exec.addPhysicObject(i, -100+(200*(i-4)), 400, laserv)
		end
	end
	if active == 129 then
		showCommand(active,text.space)
		tfm.exec.setGameTime(20)
		setAllAlive()
		ui.setBackgroundColor("#000000")
		tfm.exec.setWorldGravity(0,0)
	end
	if active == 130 then
		showCommand(active,text.jump3)
		tfm.exec.setGameTime(13)
	end
	if active == 131 then
		showCommand(active,text.spider1)
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.addPhysicObject(1, 1200, 600, cobweb)
	end
	if active == 132 then
		showCommand(active,text.emoji2)
		tfm.exec.setGameTime(9)
	end
	if active == 133 then
		showCommand(active,text.chicken)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,48 do
			tfm.exec.addShamanObject(33,(i*40)-20,64,0,0,0,false)
		end
	end
	if active == 134 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
		setAllAlive()
	end
	if active == 135 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "command51" and active == 51 then
		completeCommand(name)
		ui.removeTextArea(250,name)
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		if string.len(message) >= 2 then
			completeCommand(name)
		end
		if string.lower(message) == "a" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 12 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2024" then
			completeCommand(name)
		elseif message == "2023" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if string.upper(message) == string.upper(name) then
			completeCommand(name)
		end
	end
	if active == 41 then
		if string.find(string.upper(message),"K") or string.find(string.upper(message),"HA") or string.find(string.upper(message),"LMAO") or string.find(string.upper(message),"HI") or string.find(string.upper(message),"HE") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 43 then
		if string.upper(message) == "EU SOU NOOB" or string.upper(message) == "I AM NOOB" or string.upper(message) == "I AM A NOOB" then
			completeCommand(name)
		end
		if string.find(string.upper(message),string.upper("PRO")) then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 47 or active == 72 or active == 85 then
		if message == number then
			completeCommand(name)
		end
	end
	if active == 59 then
		if string.find(string.upper(message),"BUA") or string.find(string.upper(message),"BUÁ") or string.find(message,":(") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 60 then
		if message == "2" then
			completeCommand(name)
		elseif message == "3" then
			tfm.exec.killPlayer(name)
		elseif message == "11" then
			tfm.exec.killPlayer(name)
		elseif message == "22" then
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
		if string.lower(message) == "atelier801" or string.lower(message) == "atelier 801" then
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
		elseif message == "5" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 98 then
		if string.lower(message) == "jessiewind26#2546" then
			completeCommand(name)
		end
	end
	if active == 101 then
		if string.find(string.lower(message),"zz") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 103 then
		if message == "0" then
			completeCommand(name)
		end
	end
	if active == 123 then
		if message == "-1" then
			completeCommand(name)
		elseif message == "7" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 135 then
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
	if active == 88 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 3 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 4 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 99 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 2 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 101 then
		if id == 6 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 109 then
		if id == 6 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 9 and data[name].s == 2 then
			completeCommand(name)
		end			
	end
	if active == 113 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 9 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 0 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 117 then
		if id == 1 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 0 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 2 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 7 and data[name].s == 4 then
			completeCommand(name)
		end
	end
	if active == 118 then
		if id == 4 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 9 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 0 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 8 and data[name].s == 4 then
			completeCommand(name)
		end
	end
	if active == 122 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 1 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 2 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 3 and data[name].s == 5 then
			data[name].s=6
		end
	end
end
function eventPlayerWon(name)
	if vivo >= 2 then
		vivo=vivo-1
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		data[name].count=data[name].count+1
		addCommandCount(name)
		if data[name].s >= 10 then
			completeCommand(name)
		end
	end
end
function eventKeyboard(name,id,down,x,y)
	if active >= 1 and data[name] then
		if id == 0 or id == 1 or id == 2 or id == 3 then
			data[name].count=data[name].count+1
		end
	end
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
			removeCommandCount(name)
		end
		if data[name].key == 65 and id == 37 then
			removeCommandCount(name)
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
			removeCommandCount(name)
		end
		if data[name].key == 68 and id == 39 then
			removeCommandCount(name)
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
			removeCommandCount(name)
		end
		if data[name].key == 65 and id == 37 then
			removeCommandCount(name)
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
			removeCommandCount(name)
		end
		if data[name].key == 68 and id == 39 then
			removeCommandCount(name)
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
			removeCommandCount(name)
		end
		if data[name].key == 65 and id == 37 then
			removeCommandCount(name)
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
			removeCommandCount(name)
		end
		if data[name].key == 68 and id == 39 then
			removeCommandCount(name)
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
	if active == 92 then
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
			removeCommandCount(name)
		end
		if data[name].key == 65 and id == 37 then
			removeCommandCount(name)
		end
	end
	if active == 93 then
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
			removeCommandCount(name)
		end
		if data[name].key == 68 and id == 39 then
			removeCommandCount(name)
		end
	end
	if active == 102 then
		if id >= 0 and id <= 3 then
			completeCommand(name)
		end
	end
	if active == 104 then
		if id == 40 or id == 83 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 109 then
		if id == 38 or id == 87 then
			if data[name].s == 1 then
				data[name].s=2
			end
		end
	end
	if active == 112 then
		if id >= 48 and id <= 57 then
			completeCommand(name)
		end
	end
	if active == 114 then
		if id == 32 then
			if tfm.get.room.playerList[name].isVampire == true then
				tfm.exec.movePlayer(name,0,0,true,0,-48,false)
			end
		end
	end
	if active == 122 then
		if id == 38 or id == 87 then
			if data[name].s == 6 then
				completeCommand(name)
			end
		end
	end
	if active == 124 then
		if id == 49 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 52 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 55 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 53 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 57 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 50 and data[name].s == 5 then
			data[name].s=6
		end
		if id == 56 and data[name].s == 6 then
			data[name].s=7
		end
		if id == 54 and data[name].s == 7 then
			completeCommand(name)
		end
	end
	if active == 132 then
		if id == 53 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 57 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 54 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 49 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 55 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 51 and data[name].s == 5 then
			data[name].s=6
		end
		if id == 52 and data[name].s == 6 then
			data[name].s=7
		end
		if id == 56 and data[name].s == 7 then
			completeCommand(name)
		end
	end
	if active == 130 then
		if id == 38 or id == 87 then
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
	end
end
function eventLoop(passado,faltando)
	if unlocked == true then
		local tempo=math.floor(faltando/1000)
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].imageid >= -1 then
				data[name].imaget=data[name].imaget-1
				if data[name].imaget == 0 then
					tfm.exec.removeImage(data[name].imageid,true)
				elseif data[name].imaget <= -1 then
					ui.removeTextArea(1004,name)
					data[name].opened=false
					data[name].imageid=-2
				end
			end
		end
		if active == -2 then
			ui.setMapName("<N>"..text.mices.."   <G>|   <J><b>"..text.version.." 7.9.2</b><")
		elseif active == -1 and vivo >= 1 then
			ui.setMapName("<VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."   <G>|   <J><b>"..text.version.." 7.9.2</b><")
		elseif active == -1 and vivo <= 0 then
			ui.setMapName("<N>"..text.dofim.."<b>"..tempo.."</b> "..text.segundos.."   <G>|   <J><b>"..text.version.." 7.9.2</b><")
		elseif active >= 0 then
			ui.setMapName(""..text.mestre.."   <G>|   <N>"..text.map.." : <V>"..tfm.get.room.currentMap.."   <G>|   <N>"..text.mice.." : <V>"..vivo.." / "..rato.."   <G>|   <N>"..text.round.." : <V>"..rodada.."   <G>|   <J><b>"..text.version.." 7.9.2</b><")
		end
		if rato < 4 then
			if tfm.get.room.currentMap == "@7935706" then
				active=-2
				tfm.exec.setGameTime(8000)
			else
				if passado > 5000 then
					tfm.exec.newGame("@7935706")
					tfm.exec.setGameTime(8000)
					showMessage("<R>"..text.mices.."",nil)
				end
			end
		end
		if rato >= 4 and passado >= 15000 then
			if tfm.get.room.currentMap == "@7935706" then
				tfm.exec.newGame(mapas[math.random(#mapas)],nil)
			end
		end
		if active < 0 and faltando <= 1000 and faltando >= 400 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
		if active == 96 and tempo == 6 then
			active=666
			showCommand(active,text.lava2)
			tfm.exec.setGameTime(8)
			tfm.exec.addPhysicObject(667, 1200, 360, acids)
			tfm.exec.addPhysicObject(666, 1200, 350, lava)
		end
		if active == 126 and tempo == 9 then
			for i=1,4 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,4 do
				tfm.exec.addPhysicObject(i, 1200, -10+(92*i), acids2)
			end
		end
		if active == 127 and tempo == 9 then
			for i=1,8 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,8 do
				tfm.exec.addPhysicObject(i, -100+(200*i), 400, acids3)
			end
		end
		if active == 128 and tempo == 9 then
			for i=1,12 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,4 do
				tfm.exec.addPhysicObject(i, 1200, -10+(92*i), acids2)
			end
			for i=5,12 do
				tfm.exec.addPhysicObject(i, -100+(200*(i-4)), 400, acids3)
			end
		end
		if active == 116 and tempo <= 15 and tempo >= 9 then
			count=count+1
			table.insert(grounds,tfm.exec.addPhysicObject(count, 0, 405-count*10, upacid))
		end
		if active == 120 and tempo % 2 == 0 and tempo >= 2 then
			tfm.exec.removeObject(pid)
			pid=tfm.exec.addShamanObject(2600,math.random(80,700),math.random(50,310))
		end
		if active == 0 and faltando < 4000 then
			if rodada < rodadas then
				sortearComandos()
			else
				active=-1
				tfm.exec.setGameTime(10)
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
			if active == 19 or active == 31 or active == 32 or active == 57 or active == 64 or active == 105 then
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
			if active == 86 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].y <= 147 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 87 or active == 107 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].y >= 158 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 89 then
				for name,player in next,tfm.get.room.playerList do
					if player.y > 300 then
						if player.x > xpos-10 and player.x < xpos+90 then
							tfm.exec.killPlayer(name)
						end
					end
				end
			end
			if active == 90 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isDead == false then
						tfm.exec.attachBalloon(name, false)
					end
				end
			end
			if active == 110 then
				tfm.exec.setAieMode(false)
			end
			if active == 111 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.setPlayerCollision(name, 1)
				end
			end
			if active == 114 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.setVampirePlayer(name, false)
				end
			end
			if active == 115 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.giveMeep(name, false)
				end
			end
			if active == 116 then
				for _,i in next,grounds do
					tfm.exec.removePhysicObject(i)
				end
				grounds={}
			end
			if active == 120 then
				tfm.exec.removeObject(pid)
				pid=tfm.exec.addShamanObject(2600,400,-4054)
			end
			if active == 121 then
				for i=0,100 do
					tfm.exec.removeBonus(id)
				end
			end
			if active == 129 then
				ui.setBackgroundColor("#6a7495")
				tfm.exec.setWorldGravity(0,10)
			end
			for i=0,2 do
				ui.removeTextArea(i,nil)
			end
			ui.removeTextArea(250,nil)
			tfm.exec.removeObject(pid)
			tfm.exec.setWorldGravity(0, 10)
			for i=1,12 do
				tfm.exec.removePhysicObject(i)
			end
			tfm.exec.removePhysicObject(666)
			tfm.exec.removePhysicObject(667)
			tfm.exec.removePhysicObject(2500)
			for i=1,15 do
				tfm.exec.removeBonus(i)
			end
			active=0
			if rodada == 6 or rodada == 8 or rodada == 10 or rodada == 12 or rodada == 14 or rodada == 16 then
				dificuldade=dificuldade+1
			end
			for name,player in next,tfm.get.room.playerList do
				data[name].key=0
				ui.removeTextArea(24,nil)
				if data[name].c == 0 then
					tfm.exec.killPlayer(name)
				end
				tfm.exec.setNameColor(name,0xc2c2da)
				tfm.exec.setPlayerNightMode(false, name)
			end
			if fc_mode == false then
				if vivo > 5 then
					tfm.exec.setGameTime(13-dificuldade)
				else
					tfm.exec.setGameTime(11-dificuldade)
				end
			else
				tfm.exec.setGameTime(7)
			end
			getAlives()
		end
	end
end
tfm.exec.newGame("@7935706")
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
