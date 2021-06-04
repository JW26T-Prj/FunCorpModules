palavra=""
palavras = {"doca","rapieira","doce","carregador","pen-drive","transformice","dragão","fogos de artificio","estrela","sol","lua","monitor","computador","teclado","mouse","rato","música","celular","cabo","pilha","bateria","engrenagem","dinossauro","drácula","facebook","auréola","guitarra","mensagem","whatsapp","youtube","vídeo","windows","espaço","quadro","giz de cera","sangue","espada","escudo","guerreiro","calendário","copo","vaso","caneta","lápis","memória","cola","ferro de passar","cama","beliche","boliche","laser","avião","helicóptero","terra","telhado","antena","satélite","lâmina","katana","castelo","fechadura","dobradiça","escada","elevador","servidor","janela","porta","coxinha","empada","tapioca","brasil","dinheiro","televisão","queijo","morango","maçã","uva","cartão","disco","cd","festa","nuvem","transformice","chuva","raio","tempestade","luz","nada","livro","caderno","moderno","palmeiras","flamengo","vasco","corinthians","palmeiras","apito","dragon ball","goku","nami","luffy","estado","torre eiffel","pikachu","brasília","escravo","link","planeta","saturno","tartaruga","esgoto","céu","navegador","capacete","presente","barba","lol","meme","lupa","globo","cadeado","bola","quadrado","coroa","linha","trem","alto-falante","guarda-chuva","microfone","aquarela","trilha","programa","corrente","guarda","polegar","mapa","gangorra","sino","envelope","oceano","mar","planalto","planície","portal","fundo","terremoto","tsunami","movimento","correr","pular","fogo","água","humano","foguete","embrulho","código","carteira","mesa","canhão","bigorna","tábua","balão","totem","bola de cristal","martelo","marreta","ampulheta","mola","bolha","projetor","gelo","gelado","deusa","bombeiro","luciano huck","hulk","thor","palácio","spinner","goleiro","velocímetro","tacômetro","league of legends","atacante","futebol americano","zelda","playstation","xbox","bakugan","arco","flecha","ovelha","raposa","cobra","serpente","tomate","inferno","bomba","relógio","botafogo","gabinete","rede","borracha","régua","caneta","bola de neve","maçaneta","sapato","meia","linguá","boca","sidney magal","travesseiro","cabeça","dedo","cadeira","sofá","ventilador","quadro","papel","cair","pequeno","grande","caixa","som","chave","moeda","machado","comunismo","carteiro","médico","machucado","dente","dentista","casal","namorados","matar","xícara","faca","garfo","colher","carro","moto","piscina","praia","mar","girafa","gato","cachorro","gancho","counter strike","bolsonaro","cachorro","polvo","lula","pato","galinha","bebida","vela","gasolina","coelho","rato","aranha","gorro","óculos","folha","lhama","lousa","pá","pai","mãe","solo","prego","parafuso","bicicleta","chocolate","leite","café","chá","pinóquio","ralo","cano","flor","leão","saia","blusa","jaqueta","inseto","gancho","dedo","olho","barco","futebol","cachimbo","charuto","naruto","bandana","banana","grama","árvore","banco","pimenta","nariz","meleca","cabelo","careca","link","escuridão","sombras","lagoa","escorpião","estádio","sniper","bazuca","escopeta","laço","trança","mordida","mão","pé","degrau","cubo","sorvete","golfe","cajado","circulo","circo","palhaço","infinito","lixo","lixeira","roleta","cemitério","roda","bambu","anjo","laranja","abóbora","fogueira","jornal","natureza","nevasca","nevoeiro","paralelepípedo","para-raio","raiva","lágrimas","surfar","onda","prancha","arame","grade","prisão","bruxa","caldeirão","poção","números","monstro","osso","fantasia","holofote","apagador","anzol","âncora","pescador","marinheiro","navio","argola","correnteza","cachoeira","gravata","abajur","burca","areia movediça","tornado","arco íris","pizza","apagador","bala","poção","corrente","tony ramos","quindim","tapioca","metrô","língua de sogra","sorriso","lobo","forte","cotonete","curativo","pirulito","escorregador","regador","selfie","constelação","dança","baile","ovo","trave","tapete","confete","sapo","melancia","abacaxi","chupeta","caracol","esgoto","cachecol","lesma","touca","tesoura","gaveta","armário","pedra","banco","vassoura","geladeira","rádio","prédio","guarda-sol","montanha","imã","clipe","lago","chinelo","luva","pódio","pac-man","mario","ketchup","alface","esmeralda","rubi","anel","submarino","igreja","vento","arroz","feijão","minecraft","abelha","papai noel","presidente","governador","prefeito","twitter","cristo redentor","rede globo","record","sbt","funcorp","steam","gaiola","nintendo","sonic","gta","buraco","casa","cartucho","fita cassete","batata","google","comerciante","cavaleiro","robô","estojo","habbo","bolsa","refrigerante","suco","capitalismo","cerveja","escova","máscara","bob esponja","violão","flauta","padre","hospital","escola","shuriken","fralda","fone de ouvido","garrafa","linguiça","salsicha","portão","scooby-doo"}
time=true;
rato=0
faltando=0;
cor="0xffffff"
gross=1
novo=4;
shaman=""
tempo=1;
perso=true
system.disableChatCommandDisplay("msg",true)
system.disableChatCommandDisplay("skip",true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
mapas={"@6958851","@6958855","@6958861","@7250912","@7251373","@7252133","@7252582","@7254141","@7252655","@7253090","@7218631","@7254162","@7254243","@7254281","@7254464","@7252561","@7253580"}
function eventMouse(name,x,y)
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			if y < 300 and x > 90 then
				id=id+1
				if gross == 0 then
					ui.addTextArea(id, "", nil, x, y, 1, 1, cor, cor)
				elseif gross == 1 then
					ui.addTextArea(id, "", nil, x, y, 3, 3, cor, cor)
				elseif gross == 2 then
					ui.addTextArea(id, "", nil, x, y, 6, 6, cor, cor)
				elseif gross == 3 then
					ui.addTextArea(id, "", nil, x, y, 9, 9, cor, cor)
				elseif gross == 4 then
					ui.addTextArea(id, "", nil, x, y, 12, 12, cor, cor) end end end end end
function eventChatMessage(n,m)
	if not tfm.get.room.playerList[n].isShaman then
	if string.lower(m) == palavra then
			tfm.exec.setPlayerScore(n,1,false)
			tfm.exec.setGameTime(7)
			tfm.exec.chatMessage("<VP>"..n.." acertou a resposta! A palavra era <b>"..string.upper(palavra).."</b>",nil)
			palavra="" end end end
function eventChatCommand(n,m)
	if m == "skip" then
		palavra=""
		tfm.exec.setGameTime(5)
		tfm.exec.chatMessage("<R>A rodada foi cancelada. Próxima rodada em 5 segundos.",nil) end end
function eventKeyboard(name,id,down,x,y)
	if tfm.get.room.playerList[name].isShaman then
		ui.removeTextArea(6014,nil)	end end
function eventNewGame()
	id=0;
	novo=3
	for i=6000,6014 do
		ui.removeTextArea(i,nil) end
	tempo=20;
	perso=true
	rato=0;
	new=false;
	time=true;
	tfm.exec.setGameTime(120)
	for n,l in pairs(tfm.get.room.playerList) do
		system.bindMouse(n,false)
		rato=rato+1
		if tfm.get.room.playerList[n].isShaman then
			system.bindMouse(n,true)
			tfm.exec.setPlayerScore(n,-10,false)
			shaman=n
			sortearpalavra()
			tfm.exec.chatMessage(""..palavra.."","Viego#0345")
			ui.addTextArea(6014, "<font size='20'><p align='center'><font face='Bahnschrift SemiLight,Trebuchet MS,Arial'><b>Não esqueça de se mover, ou você perderá sua vez de shaman!</b>",shaman,10,365,780,30,0x241412,0x121008)
			ui.addTextArea(6001, "<p align='center'><font size='12'><a href='event:O6i'><font color='#f2f2f2'><font face='Segoe UI Symbol'>⇄ Trocar</a></p>", n, 10, 230, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6005, "<p align='center'><font size='12'><a href='event:O23i'><font color='#f2f2f2'><font face='Segoe UI Symbol'>↺ Desfazer</a></p>", n, 10, 150, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6006, "<p align='center'><font size='12'><a href='event:Oi'><font color='#f21212'><font face='Segoe UI Symbol'>✗ Apagar</a></p>", n, 10, 110, 70, 20, 0x100101, 0x100101)
			ui.addTextArea(6007, "<p align='center'><font size='12'><a href='event:O5i'><font color='#f2f2f2'><font face='Segoe UI Symbol'>↳ Ver</a></p>", n, 10, 190, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6013, "<p align='center'><font size='12'><a href='event:O99i'><font color='#f21212'><font face='Segoe UI Symbol'>⍇ Pular</a></p>", n, 10, 270, 70, 20, 0x100101, 0x100101) end end			
	ui.setMapName("<ROSE><b>GarticMice</b> <BL>- <N>Versão RTM 0406.001 por <VP>Rakan_raster#0000")
	ui.setShamanName("") end
function eventSummoningEnd(name)
	tfm.exec.chatMessage("Você não precisa invocar objetos para desenhar, basta clicar na tela.",name) end
function eventTextAreaCallback(ids, name, callback)
	if callback == "Oi" then
		ui.addPopup(1280,1,"<font size='13'>Apagar o desenho?",shaman,350,175,200,true) end
	if callback == "cor11" then
		ui.showColorPicker(0,name,cor,"Escolher cor") end
	if callback == "O5i" then
		ui.addPopup(2,0,"<font size='13'>A sua palavra é: <b>"..palavra.."</b>",name,350,175,200,true) end
	if callback == "O6i" then
		if tfm.get.room.playerList[name].isShaman then
		if novo >= 1 then
			novo=novo-1
			sortearpalavra()
			tfm.exec.setGameTime((faltando/1000)+10) end end
		tfm.exec.chatMessage(""..palavra.."","Forzaldenon#0000") end
	if callback == "O7i" then
		eventChatCommand(name,"next") end
	if callback == "O11i" then
		gross=gross+1
		if gross >= 4 then
			gross=4 end end
	if callback == "O23i" then
		if id > 0 then
			ui.removeTextArea(id,nil)
			id=id-1; end end
	if callback == "O99i" then
		eventChatCommand(name,"skip") end
	if callback == "O12i" then
		gross=gross-1
		if gross <= 0 then
			gross=0	end	end end
function eventPopupAnswer(id,r,a)
	if id == 3 then
		palavra=a;
	elseif id == 4 and new == false then
		palavra=a;
		new=true;
	elseif id == 1280 then
		if a == "yes" then
			id=0;
			for i=1, 5000 do
				ui.removeTextArea(i,nil) end end end end
function eventLoop(p,f)
	if p > 1000 and p < 2000 then
		for i=1, 5000 do
			ui.removeTextArea(i,nil) end end
	local grossure=gross
	if f <= 6000 and string.len(palavra) >= 2 then
			tfm.exec.chatMessage("<VP>Acabou o tempo! A palavra era <b>"..string.upper(palavra).."</b>",nil)
			palavra=""	end
	faltando=f;
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			local shaman=name
			ui.addTextArea(6000, "<a href='event:cor11'><font size='80'>                                                                  </a></p>", name, 14, 30, 60, 60, cor, 0x0)
			ui.addTextArea(6003, "<font size='13'><p align='center'><font color='#000000'><a href='event:O12i'>-</a></p>", shaman, 10, 320, 12, 20, 0xb7b7b7, 0xb7b7b7)
			ui.addTextArea(6008, "", shaman, 30, 320, 1, 20, 0x00ff00, 0x0)
			ui.addTextArea(6004, "<font size='13'><p align='center'><font color='#000000'><a href='event:O11i'>+</a></p>", shaman, 76, 320, 12, 20, 0xb7b7b7, 0xb7b7b7)
			if gross >= 1 then ui.addTextArea(6009, "", shaman, 39, 320, 1, 20, 0x80ff00, 0x0); else ui.addTextArea(6009, "", shaman, 39, 320, 1, 20, 0x101010, 0x0); end
			if gross >= 2 then ui.addTextArea(6010, "", shaman, 48, 320, 1, 20, 0xffff00, 0x0); else ui.addTextArea(6010, "", shaman, 48, 320, 1, 20, 0x101010, 0x0); end
			if gross >= 3 then ui.addTextArea(6011, "", shaman, 57, 320, 1, 20, 0xff8000, 0x0); else ui.addTextArea(6011, "", shaman, 57, 320, 1, 20, 0x101010, 0x0); end
			if gross >= 4 then ui.addTextArea(6012, "", shaman, 66, 320, 1, 20, 0xff0000, 0x0); else ui.addTextArea(6012, "", shaman, 66, 320, 1, 20, 0x101010, 0x0); end end end
	if f <= 1 then
		tfm.exec.newGame(mapas[math.random(#mapas)]) end end
function eventColorPicked(id,name,color)
	cor=color;
	if tostring(color) == "0" then
		cor=1 end
	if tostring(color) == "-1" then
		cor=1 end end
function eventNewPlayer(n)
	system.bindMouse(n,false)
	rato=rato+1
	for i=37,40 do
		tfm.exec.bindKeyboard(n,i,true) end
	for i=65,87 do
		tfm.exec.bindKeyboard(n,i,true)	end
	tfm.exec.respawnPlayer(n)
	tfm.exec.chatMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module GarticMice!</b><br>O objetivo deste module é descobrir o que o shaman está desenhando para se tornar o shaman!<br><VP>Não é necessário usar setas para desenhar.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Chavestomil#0000<br><br><ROSE>Versão RTM 0406.001<br><p align='left'>",n) end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false) end
function eventPlayerDied(n)
	if tfm.get.room.playerList[n].isShaman then
		tfm.exec.setGameTime(5)
		tfm.exec.setPlayerScore(n,-2,true)
		tfm.exec.chatMessage("<R>O shaman está ausente ou não se moveu. Rodada cancelada.",nil) end end
function eventPlayerLeft()
	rato=rato-1 end
function sortearpalavra()
	palavra=palavras[math.random(#palavras)]
	for n,p in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[n].isShaman then
			if novo >= 1 then
				ui.addPopup(55,0,"<font size='14'>A sua palavra é <b>"..palavra.."</b><br><br>Você ainda tem <b>"..novo.."</b> palavras novas para escolher.",n,350,175,200,true)
			else
				ui.addPopup(55,0,"<font size='14'>A sua palavra é <b>"..palavra.."</b><br><br><b>Você não pode mais mudar a palavra.",n,350,175,200,true)	end end	end end
tfm.exec.newGame(mapas[math.random(#mapas)])
