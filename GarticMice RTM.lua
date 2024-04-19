palavras = {"doca","rapieira","doce","carregador","pen-drive","transformice","dragao","fogos de artificio","estrela","sol","lua","monitor","computador","teclado","mouse","musica","celular","cabo","pilha","bateria","engrenagem","dinossauro","dracula","facebook","aureola","guitarra","mensagem","whatsapp","youtube","video","windows","espaço","giz de cera","sangue","espada","escudo","guerreiro","calendario","copo","vaso","lapis","memoria","cola","ferro de passar","cama","beliche","boliche","laser","aviao","helicoptero","terra","telhado","antena","satelite","lamina","katana","castelo","fechadura","dobradiça","escada","elevador","servidor","janela","porta","coxinha","empada","brasil","dinheiro","televisao","queijo","morango","maça","uva","cartao","disco","cd","festa","nuvem","chuva","raio","tempestade","luz","nada","livro","caderno","moderno","flamengo","vasco","corinthians","palmeiras","apito","dragon ball","goku","nami","luffy","estado","torre eiffel","pikachu","brasilia","escravo","planeta","saturno","tartaruga","tempo","ceu","navegador","capacete","presente","barba","lol","meme","lupa","cadeado","bola","quadrado","coroa","linha","trem","alto-falante","guarda-chuva","microfone","aquarela","trilha","programa","guarda","polegar","mapa","gangorra","sino","envelope","oceano","planalto","planicie","portal","fundo","terremoto","tsunami","movimento","correr","pular","fogo","agua","humano","foguete","embrulho","codigo","carteira","mesa","canhao","bigorna","tabua","balao","totem","bola de cristal","martelo","marreta","ampulheta","mola","bolha","projetor","gelo","gelado","deusa","bombeiro","luciano huck","hulk","thor","palacio","spinner","goleiro","velocimetro","tacometro","league of legends","atacante","futebol americano","zelda","playstation","xbox","bakugan","arco","flecha","ovelha","raposa","cobra","serpente","tomate","inferno","bomba","relogio","botafogo","gabinete","rede","borracha","regua","caneta","bola de neve","maçaneta","sapato","meia","lingua","boca","sidney magal","travesseiro","cabeça","cadeira","sofa","ventilador","quadro","papel","cair","pequeno","grande","caixa","som","rakan","chave","moeda","machado","comunismo","carteiro","medico","machucado","dente","dentista","casal","namorados","matar","xicara","faca","garfo","colher","carro","moto","piscina","praia","mar","girafa","gato","cachorro","gancho","counter strike","bolsonaro","polvo","lula","pato","galinha","bebida","vela","gasolina","coelho","rato","aranha","gorro","oculos","folha","lhama","lousa","pa","pai","mae","solo","prego","parafuso","bicicleta","chocolate","leite","cafe","cha","pinoquio","ralo","cano","flor","leao","saia","blusa","jaqueta","inseto","dedo","olho","barco","futebol","cachimbo","charuto","naruto","bandana","banana","grama","arvore","banco","pimenta","nariz","meleca","cabelo","careca","link","escuridao","sombras","lagoa","escorpiao","estadio","sniper","bazuca","escopeta","laço","trança","mordida","mao","pe","degrau","cubo","sorvete","golfe","cajado","circulo","circo","palhaço","infinito","lixo","lixeira","roleta","cemiterio","roda","bambu","anjo","laranja","abobora","fogueira","jornal","natureza","nevasca","nevoeiro","paralelepipedo","para-raio","raiva","lagrimas","surfar","onda","prancha","arame","grade","prisao","bruxa","caldeirao","poçao","numeros","monstro","osso","fantasia","holofote","anzol","ancora","pescador","marinheiro","navio","argola","correnteza","cachoeira","gravata","abajur","burca","areia movediça","tornado","arco iris","pizza","apagador","bala","corrente","tony ramos","quindim","tapioca","metro","lingua de sogra","sorriso","lobo","forte","cotonete","curativo","pirulito","escorregador","regador","selfie","constelaçao","dança","baile","ovo","trave","tapete","confete","sapo","melancia","abacaxi","chupeta","caracol","esgoto","cachecol","lesma","touca","tesoura","gaveta","armario","pedra","banco","vassoura","geladeira","radio","predio","guarda-sol","montanha","ima","clipe","lago","chinelo","luva","podio","pac-man","mario","ketchup","alface","esmeralda","rubi","anel","submarino","igreja","vento","arroz","feijao","minecraft","abelha","papai noel","presidente","governador","prefeito","twitter","cristo redentor","record","sbt","funcorp","steam","gaiola","nintendo","sonic","gta","buraco","casa","cartucho","fita cassete","batata","google","comerciante","cavaleiro","robo","estojo","habbo","bolsa","refrigerante","suco","capitalismo","cerveja","escova","mascara","bob esponja","violao","flauta","padre","hospital","escola","shuriken","fralda","fone de ouvido","garrafa","linguiça","salsicha","portao","scooby-doo"}

time=true; rato=0; faltando=0; cor="0xa0a0a0"; gross=1; novo=4; shaman=""; tempo=1; perso=true; palavra=""; palavra_woc=""; dicas=0; enabled_d=false;
letters={}; letters_d={}; letra=0; f_l=0;
system.disableChatCommandDisplay("skip",true)
system.disableChatCommandDisplay("help",true)
for _,f in next,{"AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AllShamanSkills"} do
	tfm.exec["disable"..f](true)
end
mapas={"@6958851","@6958855","@6958861","@7250912","@7251373","@7252133","@7252582","@7254141","@7252655","@7253090","@7218631","@7254162","@7254243","@7254281","@7254464","@7252561","@7253580","@7254271","@7254529","@7254593","@7254604","@7255488"}

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."") end end end
function showText(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name) end end
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
			tfm.exec.setPlayerScore(n,10,false)
			tfm.exec.setGameTime(7)
			showMessage("<VP>"..n.." acertou a resposta! A palavra era <b>"..string.upper(palavra).."</b>",nil)
			palavra="" end end
	if tfm.get.room.playerList[n].isShaman and string.len(palavra) >= 2 then 
		tfm.exec.setGameTime(5)
		showMessage("<R>O shaman digitou no chat. Rodada cancelada. Próxima rodada em 5 segundos.",nil)
		palavra="" end end
function eventChatCommand(n,m)
	if m == "skip" and string.len(palavra) >= 2 then
		palavra=""
		tfm.exec.setGameTime(5)
		showMessage("<R>O shaman pulou sua vez. Próxima rodada em 5 segundos.",nil) end
	if m == "help" then
		showMessage("<VP><b>Bem-vindo ao module GarticMice.</b><br><br><N>Neste module os ratos precisam descobrir o que o shaman está desenhando.<br>As palavras são escolhidas aleatoriamente pelo código e contém temas variados, desde animais a itens desconhecidos.<br><VP><b>Por favor, não coloque acentos nas respostas!</b><br><br><N>O jogo acaba quando alguém descobre a resposta ou quando o tempo esgota.",name) end end
function eventKeyboard(name,id,down,x,y)
	if tfm.get.room.playerList[name].isShaman then
		ui.removeTextArea(6014,nil) end end
function eventNewGame()
	for i=6000,6018 do
		ui.removeTextArea(i,nil) end
	ui.removeTextArea(6050,nil)
	ui.removeTextArea(6100,nil)
	ui.removeTextArea(6150,nil)
	tempo=20; perso=true; rato=0; enabled_d=false; new=false; time=true; id=0; novo=3;
	tfm.exec.setGameTime(150)
	for n,l in pairs(tfm.get.room.playerList) do
		ui.removeTextArea(6150,n)
		system.bindMouse(n,false)
		rato=rato+1
		if tfm.get.room.playerList[n].isShaman then
			system.bindMouse(n,true)
			tfm.exec.setPlayerScore(n,-10,false)
			shaman=n
			sortearpalavra()
			for _,i in next,{"Viego#0345","Skyymellu#0000","Globo_rural#6532","Patrick_mahomes#1795"} do
				showText(""..palavra.."",i) end
			ui.addTextArea(6014, "<font size='25'><p align='center'><font face='Bahnschrift SemiLight,Trebuchet MS,Arial'><J><b>Não esqueça de se mover, ou você perderá sua vez de shaman!</b>",shaman,10,25,780,38,0x241412,0x121008)
			showMessage("<R>Não esqueça de se mover, ou você perderá sua vez de shaman!",shaman)
			ui.addTextArea(6001, "<p align='center'><font size='12'><a href='event:trocar'><font color='#f2f2f2'><font face='Segoe UI Symbol'>⇄ Trocar</a></p>", n, 160, 375, 65, 20, 0x101010, 0x101010)
			ui.addTextArea(6005, "<p align='center'><font size='12'><a href='event:desfazer'><font color='#f2f2f2'><font face='Segoe UI Symbol'>↺ Desf.</a></p>", n, 250, 375, 65, 20, 0x101010, 0x101010)
			ui.addTextArea(6006, "<p align='center'><font size='12'><a href='event:apagar'><font color='#f21212'><font face='Segoe UI Symbol'>✗ Apagar</a></p>", n, 340, 375, 65, 20, 0x100101, 0x100101)
			ui.addTextArea(6017, "<p align='center'><font size='12'><a href='event:dica'><font color='#f2f2f2'><font face='Segoe UI Symbol'>⚐ Dica</a></p>", n, 520, 375, 65, 20, 0x101010, 0x101010)
			ui.addTextArea(6013, "<p align='center'><font size='12'><a href='event:pular'><font color='#f21212'><font face='Segoe UI Symbol'>⍇ Pular</a></p>", n, 430, 375, 65, 20, 0x100101, 0x100101) end end
	ui.setMapName("<ROSE><b>GarticMice</b> <BL>- <N>Versão RTM 3523.018 por <BL>Patrick_mahomes#1795<")
	ui.setShamanName("") end
function eventSummoningEnd(name)
	showMessage("<VP>Você não precisa invocar objetos para desenhar, basta clicar na tela.",name) end
function eventTextAreaCallback(ids, name, callback)
	if callback == "apagar" then
		ui.addPopup(1280,1,"<font size='13'>Apagar o desenho?",shaman,350,175,200,true) end
	if callback == "cor11" then
		ui.showColorPicker(0,name,cor,"Escolher cor") end
	if callback == "dica" then
		dicasMake() end
	if callback == "trocar" then
		if tfm.get.room.playerList[name].isShaman then
		if novo >= 1 then
			novo=novo-1
			sortearpalavra()
			tfm.exec.setGameTime((faltando/1000)+10) end end
			showMessage(""..palavra.."","Viego#0345")
			showMessage(""..palavra.."","Patrick_mahomes#1795") end
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
		ui.addPopup(1710,1,"<font size='13'>Pular a vez?",shaman,350,175,200,true) end
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
				ui.removeTextArea(i,nil) end end
	elseif id == 1710 then
		if a == "yes" then
			eventChatCommand(name,"skip") end end end
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
			local gross1=gross+1
			ui.addTextArea(6000, "<a href='event:cor11'><font size='80'>                                                                  </a></p>", name, 45, 375, 90, 20, cor, 0x0)
			ui.addTextArea(6015, "<font size='13'><font color='#000000'>Cor",shaman,75,355,32,24,0,0,1.0,true)
			ui.addTextArea(6016, "<font size='13'><font color='#000000'>Intensidade: <b>"..gross1.."",shaman,631,355,102,24,0,0,1.0,true)
			ui.addTextArea(6003, "<font size='13'><p align='center'><a href='event:O12i'>-</a></p>", shaman, 610, 375, 12, 20, 0x101010, 0x0)
			ui.addTextArea(6008, "", shaman, 630, 375, 15, 20, 0xffffff, 0x0)
			ui.addTextArea(6004, "<font size='13'><p align='center'><a href='event:O11i'>+</a></p>", shaman, 745, 375, 12, 20, 0x101010, 0x0)
			if gross >= 1 then ui.addTextArea(6009, "", shaman, 653, 375, 15, 20, 0xffffff, 0x0); else ui.addTextArea(6009, "", shaman, 653, 375, 15, 20, 0x101010, 0x0); end
			if gross >= 2 then ui.addTextArea(6010, "", shaman, 676, 375, 15, 20, 0xffffff, 0x0); else ui.addTextArea(6010, "", shaman, 676, 375, 15, 20, 0x101010, 0x0); end
			if gross >= 3 then ui.addTextArea(6011, "", shaman, 699, 375, 15, 20, 0xffffff, 0x0); else ui.addTextArea(6011, "", shaman, 699, 375, 15, 20, 0x101010, 0x0); end
			if gross >= 4 then ui.addTextArea(6012, "", shaman, 722, 375, 15, 20, 0xffffff, 0x0); else ui.addTextArea(6012, "", shaman, 722, 375, 15, 20, 0x101010, 0x0); end end end
	if f <= 1 then
		tfm.exec.newGame(mapas[math.random(#mapas)]) end end
function dicasSize()
	letters={}
	letters_d={}
	dicas=1+math.floor(math.sqrt(string.len(palavra)))
	for i=1,string.len(palavra) do
		palavra_woc=string.gsub(palavra,"ç","c")
		table.insert(letters,string.sub(palavra_woc,i,i))
		table.remove(letters,string.len(palavra_woc)+1) end end
function dicasMake()
	if enabled_d == false and dicas > 0 then
		dicas=dicas-1
		if rawlen(letters_d) == 0 then
		novo=0
		showMessage("Você não pode mais mudar a palavra.",shaman)
		for i=1,rawlen(letters) do
			if letters[i] == " " then
				table.insert(letters_d," ")
			else
				table.insert(letters_d,"_") end end
	else
		letra=math.random(1,rawlen(letters))
		while letra == f_l do
			letra=math.random(1,rawlen(letters))
		end
		letters_d[letra]=letters[letra]
		letra=f_l end
	tt=""
	for i=1,rawlen(letters_d) do
		tt=tt.." "..letters_d[i] end
	ui.addTextArea(6150,"<font size='15'><p align='center'>Dica: <J><b>"..tt.."</b>",n,100,25,600,25,0x000001,0x242424,0.95,true) end end
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
	showMessage("<N><b>Bem-vindos ao module GarticMice!</b><br>O objetivo deste module é descobrir o que o shaman está desenhando para se tornar o shaman!<br><VP>Não é necessário usar setas para desenhar e todas as palavras não possuem acentos!<br><br><J><b>Script gerenciado por Patrick_mahomes#1795</b><br>Conceito original de Chavestomil#0000<br><br><ROSE>Versão RTM 3523.018<br><p align='left'>",n) end
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
				ui.addTextArea(6100,"<font size='15'><p align='center'>A sua palavra é: <b>"..palavra.."</b>",n,100,325,600,25,0x000001,0x242424,0.95,true)
				showMessage("Você ainda tem <b>"..novo.."</b> palavras novas para escolher.",n)
				dicasSize()
			else
				ui.addTextArea(6100,"<font size='15'><p align='center'>A sua palavra é: <b>"..palavra.."</b>",n,100,325,600,25,0x000001,0x242424,0.95,true)
				showMessage("Você não pode mais mudar a palavra.",n)
				dicasSize() end end end end
tfm.exec.newGame(mapas[math.random(#mapas)])
