-- Script do module GarticMice, versão RTM 1009.004, desenvolvido por Rakan_raster#0000.
-- Todos os acentos das palavras foram removidos.

palavras = {"doca","rapieira","doce","carregador","pen-drive","transformice","dragao","fogos de artificio","estrela","sol","lua","monitor","computador","teclado","mouse","rato","musica","celular","cabo","pilha","bateria","engrenagem","dinossauro","dracula","facebook","aureola","guitarra","mensagem","whatsapp","youtube","video","windows","espaço","quadro","giz de cera","sangue","espada","escudo","guerreiro","calendario","copo","vaso","caneta","lapis","memoria","cola","ferro de passar","cama","beliche","boliche","laser","aviao","helicoptero","terra","telhado","antena","satelite","lamina","katana","castelo","fechadura","dobradiça","escada","elevador","servidor","janela","porta","coxinha","empada","tapioca","brasil","dinheiro","televisao","queijo","morango","maça","uva","cartao","disco","cd","festa","nuvem","transformice","chuva","raio","tempestade","luz","nada","livro","caderno","moderno","palmeiras","flamengo","vasco","corinthians","palmeiras","apito","dragon ball","goku","nami","luffy","estado","torre eiffel","pikachu","brasilia","escravo","link","planeta","saturno","tartaruga","esgoto","tempo","ceu","navegador","capacete","presente","barba","lol","meme","lupa","globo","cadeado","bola","quadrado","coroa","linha","trem","alto-falante","guarda-chuva","microfone","aquarela","trilha","programa","corrente","guarda","polegar","mapa","gangorra","sino","envelope","oceano","planalto","planicie","portal","fundo","terremoto","tsunami","movimento","correr","pular","fogo","agua","humano","foguete","embrulho","codigo","carteira","mesa","canhao","bigorna","tabua","balao","totem","bola de cristal","martelo","marreta","ampulheta","mola","bolha","projetor","gelo","gelado","deusa","bombeiro","luciano huck","hulk","thor","palacio","spinner","goleiro","velocimetro","tacometro","league of legends","atacante","futebol americano","zelda","playstation","xbox","bakugan","arco","flecha","ovelha","raposa","cobra","serpente","tomate","inferno","bomba","relogio","botafogo","gabinete","rede","borracha","regua","caneta","bola de neve","maçaneta","sapato","meia","lingua","boca","sidney magal","travesseiro","cabeça","dedo","cadeira","sofa","ventilador","quadro","papel","cair","pequeno","grande","caixa","som","rakan","chave","moeda","machado","comunismo","carteiro","medico","machucado","dente","dentista","casal","namorados","matar","xicara","faca","garfo","colher","carro","moto","piscina","praia","mar","girafa","gato","cachorro","gancho","counter strike","bolsonaro","cachorro","polvo","lula","pato","galinha","bebida","vela","gasolina","coelho","rato","aranha","gorro","oculos","folha","lhama","lousa","pa","pai","mae","solo","prego","parafuso","bicicleta","chocolate","leite","cafe","cha","pinoquio","ralo","cano","flor","leao","saia","blusa","jaqueta","inseto","gancho","dedo","olho","barco","futebol","cachimbo","charuto","naruto","bandana","banana","grama","arvore","banco","pimenta","nariz","meleca","cabelo","careca","link","escuridao","sombras","lagoa","escorpiao","estadio","sniper","bazuca","escopeta","laço","trança","mordida","mao","pe","degrau","cubo","sorvete","golfe","cajado","circulo","circo","palhaço","infinito","lixo","lixeira","roleta","cemiterio","roda","bambu","anjo","laranja","abobora","fogueira","jornal","natureza","nevasca","nevoeiro","paralelepipedo","para-raio","raiva","lagrimas","surfar","onda","prancha","arame","grade","prisao","bruxa","caldeirao","poçao","numeros","monstro","osso","fantasia","holofote","apagador","anzol","ancora","pescador","marinheiro","navio","argola","correnteza","cachoeira","gravata","abajur","burca","areia movediça","tornado","arco iris","pizza","apagador","bala","poçao","corrente","tony ramos","quindim","tapioca","metro","lingua de sogra","sorriso","lobo","forte","cotonete","curativo","pirulito","escorregador","regador","selfie","constelaçao","dança","baile","ovo","trave","tapete","confete","sapo","melancia","abacaxi","chupeta","caracol","esgoto","cachecol","lesma","touca","tesoura","gaveta","armario","pedra","banco","vassoura","geladeira","radio","predio","guarda-sol","montanha","ima","clipe","lago","chinelo","luva","podio","pac-man","mario","ketchup","alface","esmeralda","rubi","anel","submarino","igreja","vento","arroz","feijao","minecraft","abelha","papai noel","presidente","governador","prefeito","twitter","cristo redentor","rede globo","record","sbt","funcorp","steam","gaiola","nintendo","sonic","gta","buraco","casa","cartucho","fita cassete","batata","google","comerciante","cavaleiro","robo","estojo","habbo","bolsa","refrigerante","suco","capitalismo","cerveja","escova","mascara","bob esponja","violao","flauta","padre","hospital","escola","shuriken","fralda","fone de ouvido","garrafa","linguiça","salsicha","portao","scooby-doo"}

time=true; testmode=false; rato=0 faltando=0; cor="0xa0a0a0"; gross=1; novo=4; shaman=""; tempo=1; perso=true; palavra="";
system.disableChatCommandDisplay("skip",true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
mapas={"@6958851","@6958855","@6958861","@7250912","@7251373","@7252133","@7252582","@7254141","@7252655","@7253090","@7218631","@7254162","@7254243","@7254281","@7254464","@7252561","@7253580"}

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
			showMessage("<VP>"..n.." acertou a resposta! A palavra era <b>"..string.upper(palavra).."</b>",nil)
			palavra="" end end
	if tfm.get.room.playerList[n].isShaman then 
		if string.find(m,palavra) then
			palavra=""
			tfm.exec.setGameTime(5)
			showMessage("<R>O shaman falou a resposta. Próxima rodada em 5 segundos.",nil) end end end
function eventChatCommand(n,m)
	if m == "skip" then
		palavra=""
		tfm.exec.setGameTime(5)
		showMessage("<R>O shaman pulou sua vez. Próxima rodada em 5 segundos.",nil) end end
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
			showMessage(""..palavra.."","Forzaldenon#0000")
			ui.addTextArea(6014, "<font size='22'><p align='center'><font face='Bahnschrift SemiLight,Trebuchet MS,Arial'><J><b>Não esqueça de se mover, ou você perderá sua vez de shaman!</b>",shaman,90,25,700,30,0x241412,0x121008)
			ui.addTextArea(6001, "<p align='center'><font size='12'><a href='event:trocar'><font color='#f2f2f2'><font face='Segoe UI Symbol'>⇄ Trocar</a></p>", n, 10, 230, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6005, "<p align='center'><font size='12'><a href='event:desfazer'><font color='#f2f2f2'><font face='Segoe UI Symbol'>↺ Desfazer</a></p>", n, 10, 150, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6006, "<p align='center'><font size='12'><a href='event:apagar'><font color='#f21212'><font face='Segoe UI Symbol'>✗ Apagar</a></p>", n, 10, 110, 70, 20, 0x100101, 0x100101)
			ui.addTextArea(6007, "<p align='center'><font size='12'><a href='event:ver'><font color='#f2f2f2'><font face='Segoe UI Symbol'>↳ Ver</a></p>", n, 10, 190, 70, 20, 0x101010, 0x101010)
			ui.addTextArea(6013, "<p align='center'><font size='12'><a href='event:pular'><font color='#f21212'><font face='Segoe UI Symbol'>⍇ Pular</a></p>", n, 10, 270, 70, 20, 0x100101, 0x100101) end end			
	ui.setMapName("<ROSE><b>GarticMice</b> <BL>- <N>Versão RTM 1009.004 por <VP>Rakan_raster#0000<")
	ui.setShamanName("") end
function eventSummoningEnd(name)
	showMessage("<VP>Você não precisa invocar objetos para desenhar, basta clicar na tela.",name) end
function eventTextAreaCallback(ids, name, callback)
	if callback == "apagar" then
		ui.addPopup(1280,1,"<font size='13'>Apagar o desenho?",shaman,350,175,200,true) end
	if callback == "cor11" then
		ui.showColorPicker(0,name,cor,"Escolher cor") end
	if callback == "ver" then
		ui.addPopup(2,0,"<font size='13'>A sua palavra é: <b>"..palavra.."</b>",name,350,175,200,true) end
	if callback == "trocar" then
		if tfm.get.room.playerList[name].isShaman then
		if novo >= 1 then
			novo=novo-1
			sortearpalavra()
			tfm.exec.setGameTime((faltando/1000)+10) end end
		showMessage(""..palavra.."","Forzaldenon#0000")
		showMessage(""..palavra.."","Viego#0345") end
	if callback == "O7i" then
		eventChatCommand(name,"next") end
	if callback == "O11i" then
		gross=gross+1
		if gross >= 4 then
			gross=4 end end
	if callback == "desfazer" then
		if id > 0 then
			ui.removeTextArea(id,nil)
			id=id-1; end end
	if callback == "pular" then
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
			showMessage("<VP>Acabou o tempo! A palavra era <b>"..string.upper(palavra).."</b>",nil)
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
	showMessage("<br><br><p align='center'><N><b>Bem-vindos ao module GarticMice!</b><br>O objetivo deste module é descobrir o que o shaman está desenhando para se tornar o shaman!<br><VP>Não é necessário usar setas para desenhar.<br><R>Todas as palavras não possuem acentos!<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Chavestomil#0000<br><br><ROSE>Versão RTM 1009.004<br><p align='left'>",n) end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false) end
function eventPlayerDied(n)
	if tfm.get.room.playerList[n].isShaman then
		tfm.exec.setGameTime(5)
		tfm.exec.setPlayerScore(n,-11,false)
		showMessage("<R>O shaman está ausente ou não se moveu. Rodada cancelada.",nil) end end
function eventPlayerLeft()
	rato=rato-1 end
function sortearpalavra()
	palavra=palavras[math.random(#palavras)]
	for n,p in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[n].isShaman then
			if novo >= 1 then
				ui.addPopup(55,0,"<font size='14'>A sua palavra é <b>"..palavra.."</b><br><br>Você ainda tem <b>"..novo.."</b> palavras novas para escolher.",n,350,175,200,true)
			else
				ui.addPopup(55,0,"<font size='14'>A sua palavra é <b>"..palavra.."</b><br><br><b>Você não pode mais mudar a palavra.",n,350,175,200,true) end end end end
tfm.exec.newGame(mapas[math.random(#mapas)])
