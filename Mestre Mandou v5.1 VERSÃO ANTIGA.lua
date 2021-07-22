-- ATENÇÃO: Esta versão do Mestre Mandou é legada de 2016!!!
-- Caso você queira fazer o FunCorp da versão mais recente, por favor volte para a raiz da pasta e escolha o script 'mestre mandou.lua'!

-- Versão de 2016 do module Mestre Mandou, datada de 10 de dezembro de 2016, ainda com o criador original (Jessiewind26#2546).
-- O código foi todo revisado e mantido em sua forma original na medida do possível, mas arrumando alguns bugs.
-- Código adicionado por Shun_kazami#7014.
admin="Jessiewind26#2546"
admin1="Shun_kazami#7014"
admin2="Skyymellu#0000"
admin3="Viego#0345"
admin4="Spectra_phantom#6089"
admin5="Fosfus7heads#0000"
shaman="Jessiewind26#2546"
comandos2={"1","2","3","4","5","6","7","8","9","10","11","14","15","17","18","19","21","22","23","24","25","26","27","30","32","33","34","35","36","37","41","42","43"}
num=5
data={}
rato=0
n=""
pergunta=""
resposta=""
x1 = 50
x2 = 400
x3 = 650
x4 = 228
x5 = 532
ger=0;
tempo2=10;
limite=18;
rodada=0;
contagem=false;
contagem2=false;
comando=""
tempo=10;
ponto=1;
gerv=0;
mapacont=0;
cmd=false;
valendo=true;
players={}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.setRoomMaxPlayers(30)
system.disableChatCommandDisplay("limite")
system.disableChatCommandDisplay("rodar")
system.disableChatCommandDisplay("desligar")
system.disableChatCommandDisplay("desligar1")
system.disableChatCommandDisplay("desligar2")
system.disableChatCommandDisplay("desligar3")
system.disableChatCommandDisplay("desligar4")
system.disableChatCommandDisplay("score")
system.disableChatCommandDisplay("pts")
system.disableChatCommandDisplay("run")
vivo=0;
tfm.exec.disableAfkDeath(true)
mapas={6788085,6788183,6789853,6791944,6792470,6808957,6810292,6821950,6830799,6866406,6866549,6757588,6788693,6788728,6859175,6834529,6866437,6812488,6876638,6876563,6885971,6888512,6893463,6900149,6907177}
tfm.exec.newGame(mapas[math.random(#mapas)])
function resetar()
	comando=""
	cmd=false;
	tfm.exec.setGameTime(6)
	ui.removeTextArea(0,nil) end
function eventNewPlayer(name)
	tfm.exec.bindKeyboard(name,38,false,true)
	tfm.exec.bindKeyboard(name,37,false,true)
	tfm.exec.bindKeyboard(name,65,false,true)
	tfm.exec.bindKeyboard(name,39,false,true)
	tfm.exec.bindKeyboard(name,68,false,true)
	tfm.exec.bindKeyboard(name,87,false,true)
	tfm.exec.bindKeyboard(name,32,false,true)
	tfm.exec.bindKeyboard(name,40,true,true)
	tfm.exec.bindKeyboard(name,83,true,true)
	tfm.exec.bindKeyboard(name,115,false,true)
	rato=rato+1
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			};		
 	data[name] = newData;
	tfm.exec.chatMessage("<CH><b>Bem-vindos ao script O Mestre Mandou v5.1</b><br><VP>Neste script vocês terão que fazer tudo o que o module pedir, independente do que seja.<br>Versão de 10/12/2016<br><BL>O salvamento das pontuações está DESATIVADO.<br><br><VI>Quer saber como jogar? Digite !help<br><R>Script criado por Jessiewind26#2546, Nasus_assassin#1534 e Shun_kazami#7014",name)
	if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 then
		ger=ger+1 end end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false) end
function eventPlayerDied(name)
	vivo=vivo-1
	local i=0
	local n
	if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 then
		gerv=gerv-1	end
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname end	end
	if i==0 then
		-- não faça nada
	elseif i==1 then
		tempo2=1000
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setGameTime(13)
		contagem=true;
		shaman=n;
		local score = rodada
		tfm.exec.setPlayerScore(shaman,score,true)
		resetar() end end
function eventNewGame()
	finais={}
	valendo=true;
	gerv=0;
	rodada=0
	rato=0
	tfm.exec.setGameTime(22)
	tempo2=21
	contagem=false;
	contagem2=false;
	vivo=0
	for name,player in pairs(tfm.get.room.playerList) do
		vivo=vivo+1
		rato=rato+1
		data[name].s=0
		if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 then
			gerv=gerv+1
			ui.addTextArea(220,"<font size='11'><a href='event:central'> > Admin </a>",name,10,375,70,20,0x324084,0x212959,0.8,true) end end end
function eventPlayerLeft(n)
	rato=rato-1
	if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 then
		ger=ger-1 end end
function eventMouse(name,x,y)
	if comando=="clic" then
		data[name].c=data[name].c+1
		if data[name].c >= 10 then
			data[name].s=1 end end end
function eventChatCommand(n,m)
	if m == "help" then
		ui.addPopup(1,0,"<font align='center'><font size='30'>O Mestre Mandou<br><br><font align='left'><font size='13'>Neste script você deverá fazer o que o shaman te mandar, seja sentar, dar um beijo ou até mesmo mandar você dizer que é noob. Quem não fazer o que o shaman diz vai morrer automaticamente e o último que sobrar ganha o jogo.<br><br>Créditos:<br>Montagem: Jessiewind26#2546<br>Sugestões de comandos: Spectra_phantom#6089 e Fosfus7heads#0000<br>",n,112,88,537,true) end
	if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 then
		if m == "mapa" then
			tfm.exec.chatMessage("<VI>Quer ver seu mapa aparecendo? Mande-o para<br><b>http://atelier801.com/topic?f=686054&t=884139</b>",nil) end
		if m == "desligar1" then
			tfm.exec.chatMessage("<ROSE><b>• [Script] O script será desligado em 2 minutos.</b>",nil) end
		if m == "desligar2" then
			tfm.exec.chatMessage("<ROSE><b>• [Script] O script será desligado em 60 segundos.</b>",nil) end
		if m == "desligar3" then
			tfm.exec.chatMessage("<ROSE><b>• [Script] O script será desligado em 30 segundos.</b>",nil) end
		if m == "desligar4" then
			tfm.exec.chatMessage("<ROSE>Logo, o brilho das luzes será substituído pelos primeiros raios de sol.<br>Fique agora na tranquilidade de seu lar.<br>Nós estamos aqui, atentos aos acontecimentos da aldeia global.<br>Preparando as emoções, que são a alegria do povo, a alma da cidade.<br>Até amanhã, na certeza de um novo tempo, tempo de comunicação. Fazendo o homem livre no universo sem fronteiras.<br><br>Até amanhã! Ass: Jessiewind26#2546",nil) end
		if m == "desligar" then
			system.exit() end
		if(m:sub(0,6) == "limite") then
			tfm.exec.setRoomMaxPlayers(m:sub(8)) end
		if(m:sub(0,5) == "score") then
			tfm.exec.setPlayerScore(m:sub(7),ponto,false) end
		if(m:sub(0,3) == "pts") then
			ponto=tonumber(m:sub(5)) end
		if m == "rodar" then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end
		if cmd == false then
		for n,player in pairs(tfm.get.room.playerList) do
			data[n].c=0
			data[n].s=0	end
		rodada=rodada+1
		if m == "1" then
			cmd=true;
			tfm.exec.setGameTime(8)
			comando="dance"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dance!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
		elseif m == "2" then
			tfm.exec.setGameTime(5)
			comando="sent"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Sente!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "3" then
			tfm.exec.setGameTime(7)
			comando="conf"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Taque 5 confetes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "4" then
			tfm.exec.setGameTime(10)
			comando="clic"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Clique na tela 10 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "5" then
			tfm.exec.setGameTime(10)
			comando="coma"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite o comando !omestremandou",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "6" then
			tfm.exec.setGameTime(10)
			comando="beij"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dê 5 beijos!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "7" then
			tfm.exec.setGameTime(10)
			comando="palm"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Bata palmas 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "8" then
			tfm.exec.setGameTime(8)
			comando="dorm"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês estão com sono. Durmam para descansar.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "9" then
			tfm.exec.setGameTime(8)
			comando="raiv"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Jessiewind26#2546 é do mal! FIQUEM COM RAIVA DELE!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "10" then
			tfm.exec.setGameTime(8)
			comando="chor"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês não ganharam queijo :( Chorem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "11" then
			tfm.exec.setGameTime(8)
			comando="pule"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pulem 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "12" then
			tfm.exec.setGameTime(13)
			comando="nome3"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>"..pergunta.."",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "14" then
			tfm.exec.setGameTime(7)
			comando="kill"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Abaixem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "15" then
			tfm.exec.setGameTime(7)
			comando="segu"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione 35 vezes a tecla para DIREITA!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "17" then
			tfm.exec.setGameTime(8)
			comando="noob"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite: EU SOU NOOB",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "18" then
			tfm.exec.setGameTime(8)
			comando="sham"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não falem nada!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
		elseif m == "19" then
			tfm.exec.setGameTime(9)
			comando="rir1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Agora RIAM!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "21" then
			tfm.exec.setGameTime(8)
			comando="face"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Coloque a mão no rosto (facepalm) 3 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "22" then
			tfm.exec.setGameTime(12)
			comando="bigo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Balance a bandeira de qualquer país!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "23" then
			tfm.exec.setGameTime(7)
			comando="digi"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite qualquer coisa e mande para mim.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "24" then
			tfm.exec.setGameTime(9)
			comando="espa"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione BARRA DE ESPAÇO 15 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "25" then
			tfm.exec.setGameTime(7)
			comando="luga1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "26" then
			tfm.exec.setGameTime(7)
			comando="luga2"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x2,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1
			end
			cmd=true;
		elseif m == "27" then
			tfm.exec.setGameTime(7)
			comando="luga3"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x3,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "30" then
			tfm.exec.setGameTime(10)
			comando="topo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique na parte de cima do mapa!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,0,150,800,5,0xfffffe,0xfffffe,1,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "32" then
			tfm.exec.setGameTime(5)
			comando="naop"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>NÃO PULEM",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
		elseif m == "33" then
			tfm.exec.setGameTime(5)
			comando="naos"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não se mexam!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
		elseif m == "34" then
			tfm.exec.setGameTime(7)
			comando="jogo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem aqui joga LOL?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "35" then
			tfm.exec.setGameTime(7)
			comando="vira"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione 35 vezes a tecla para ESQUERDA!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "36" then
			tfm.exec.setGameTime(7)
			comando="luga6"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "37" then
			tfm.exec.setGameTime(7)
			comando="luga7"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado vermelho!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "39" then
			tfm.exec.setGameTime(7)
			comando="vamp"
			cmd=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Em que ano estamos?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
		elseif m == "41" then
			tfm.exec.setGameTime(7)
			comando="luga9"
			ui.addTextArea(100,"",nil,400,0,80,400,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'><b>Não </b>fique dentro do retângulo branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "42" then
			tfm.exec.setGameTime(7)
			comando="luga10"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xffff00,0xffff00,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado vermelho!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "43" then
			tfm.exec.setGameTime(7)
			comando="luga11"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xffff00,0xffff00,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado amarelo!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				data[n].s=1 end
			cmd=true;
		elseif m == "99" then
			tfm.exec.setGameTime(7)
			comando=""
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Copiar é bom, né?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true; end end end
	if m == "omestremandou" then
		if comando == "coma" then
			data[n].s=1 end end	end
function eventChatMessage(name,message)
	if comando == "noob" then
		if message == "EU SOU NOOB" or message == "eu sou noob" or message == "Eu sou noob" or message == "Eu Sou noob" or message == "Eu Sou Noob" then
			data[name].s=1 end end
	if message == resposta then
		if comando == "nome3" then
			data[name].s=1 end
	elseif message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
		if comando == "nome3" then
			tfm.exec.killPlayer(name) end end
	if comando == "vamp" then
		if message == "2016" then
			data[name].s=1 end end
	if comando == "digi" then
		data[name].s=1 end
	if comando == "sham" or comando == "rand" then
		tfm.exec.killPlayer(name) end
	if comando == "jogo" then
		if message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
			data[name].s=1 end end end
function eventLoop(p,f)
	tempo2=tempo2-0.5
	if tempo2 == num then
		if rodada < limite and valendo == true then
			eventChatCommand(admin, comandos2[math.random(#comandos2)])
			for n,player in pairs(tfm.get.room.playerList) do
				if rodada == 15 then
					tfm.exec.chatMessage("<R>Esta partida está próxima de terminar.",n)					
				end
			end
		else
			valendo=false;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
				if not player.isDied then
					tfm.exec.setPlayerScore(name,pontos[math.random(#pontos)],true)
				end
				data[name].s=1 end
			tfm.exec.setGameTime(10)
			contagem2=true; end	end
	tfm.exec.setUIMapName(""..tfm.get.room.currentMap.."  <G>| <N>Tempo restante: <VI>"..f.." ms  <G>|  <N>Ratos: <VI>"..gerv.." <N>/ <ROSE>"..ger.." </N>/ <VP>"..vivo.." <N>/ <J>"..rato.."  <G>|  <N>Rodada: <J>"..rodada.." <G> |  <VP>versão v5.1                           ")
	if contagem == true and vivo > 0 then
		tfm.exec.setUIMapName("<b>"..shaman.."</b> <N>venceu a partida! Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end
	elseif contagem == true and vivo == 0 then
		tfm.exec.setUIMapName("<N><b>Ninguém ganhou...</b> Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end end
	if contagem2 == true then
		tfm.exec.setUIMapName("<R>Tempo limite atingido. Os jogadores restantes venceram! <N>Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")	end
	if f <= 1500 and valendo == false then
		tfm.exec.newGame(mapas[math.random(#mapas)]) end
	if f <= 1 then
		for pn, player in pairs(tfm.get.room.playerList) do
			if comando == "luga1" or comando == "luga6" or comando == "luga11" then
				if player.x < 35 or player.x > 145 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga2" then
				if player.x < 385 or player.x > 495 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga3" then
				if player.x < 635 or player.x > 745 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga5" or comando == "luga7" or comando == "luga10" or comando == "luga50" then
				if player.x < 517 or player.x > 627 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "topo" then
				if player.y > 150 then
					tfm.exec.killPlayer(pn) end end
			if comando == "luga9" then
				if player.x > 400 and player.x < 480 then
					tfm.exec.killPlayer(pn)	end	end	end end
	if f <= 1 then
		ui.removeTextArea(0,nil)
		ui.removeTextArea(100,nil)
		ui.removeTextArea(200,nil)
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].s == 0 then
				tfm.exec.killPlayer(name) end end
		resetar()
		if vivo > 1 then
			tempo2=10
		else
			tempo2=9999	end	end
	for name,player in pairs(tfm.get.room.playerList) do
		if cmd == true and comando == "conf" then
			ui.addTextArea(1000,"<font size='16'>Você tacou "..data[name].c.." confetes.",name,0,160,300,32)
		elseif cmd == true and comando == "clic" then
			ui.addTextArea(1000,"<font size='16'>Você clicou na tela "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "beij" then
			ui.addTextArea(1000,"<font size='16'>Você deu "..data[name].c.." beijos.",name,0,160,300,32)
		elseif cmd == true and comando == "palm" then
			ui.addTextArea(1000,"<font size='16'>Você bateu palmas "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "pule" then
			ui.addTextArea(1000,"<font size='16'>Você pulou "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "segu" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou direita "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "vira" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou esquerda "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "face" then
			ui.addTextArea(1000,"<font size='16'>Você colocou mão no rosto "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "espa" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou espaço "..data[name].c.." vezes.",name,0,160,300,32)
		else
			ui.removeTextArea(1000,nil)	end end end
function eventKeyboard(name,id,down,x,y)
	if comando == "pule" then
		if id == 38 or id == 87 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				data[name].s=1 end end end
	if comando == "tecla" then
		if id == 115 then
			data[name].s=1 end end
	if comando == "naop" then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name) end end
	if comando == "naos" then
		if id == 38 or id == 87 or id == 37 or id == 65 or id == 39 or id == 68 or id == 40 or id == 83 then
			tfm.exec.killPlayer(name) end end
	if comando == "espa" then
		if id == 32 then
			data[name].c=data[name].c+1
			if data[name].c == 15 then
				data[name].s=1 end end end
	if comando == "kill" then
		if id == 40 or id == 83 then
			data[name].s=1 end end
	if comando == "segu" then
		if id == 39 or id == 68 then
			data[name].c=data[name].c+1
			if data[name].c == 35 then
				data[name].s=1 end end end
	if comando == "vira" then
		if id == 37 or id == 65 then
			data[name].c=data[name].c+1
			if data[name].c == 35 then
				data[name].s=1 end end end end
function eventEmotePlayed(name,id)
	if comando == "dance" then
		if id == 0 then
			data[name].s=1 end end
	if comando == "rir1" then
		if id == 1 then
			data[name].s=1 end end
	if comando == "sent" then
		if id == 8 then
			data[name].s=1 end end
	if comando == "dorm" then
		if id == 6 then
			data[name].s=1 end end
	if comando == "raiv" then
		if id == 4 then
			data[name].s=1 end end
	if comando == "chor" then
		if id == 2 then
			data[name].s=1 end end
	if comando == "face" then
		if id == 7 then
			data[name].c=data[name].c+1
			if data[name].c == 3 then
				data[name].s=1 end end end
	if comando == "conf" then
		if id == 9 then
			data[name].c=data[name].c+1
			if data[name].c == 4 then
				data[name].s=1 end end end
	if comando == "beij" then
		if id == 3 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				data[name].s=1 end end end
	if comando == "palm" then
		if id == 5 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				data[name].s=1 end end end
	if comando == "bigo" then
		if id == 10 then
			data[name].s=1 end end end
function eventTextAreaCallback(id, name, callback)
	if callback == "central" then
		ui.addPopup(124,2,"<font size='24'><b>Central Admin</b><br><br><font size='11'>Escolha a sua opção:<br>1 = Executar um comando<br>2 = Rodar outro mapa<br>3 = Enviar mensagem de avaliação de mapas<br>4 = Alterar a pergunta 12<br>5 = Matar um jogador<br><br>Deixe em branco para cancelar",name,300,100,200,true) end end
function eventPopupAnswer(id,name,answer)
	if id == 124 then
	if answer == "1" then
		ui.addPopup(125,2,"Escolha o seu comando:",name,350,175,200,true) end
	if answer == "2" then
		eventChatCommand("Jessiewind26#2546","rodar") end
	if answer == "3" then
		eventChatCommand("Jessiewind26#2546","mapa") end
	if answer == "4" then
		ui.addPopup(126,2,"Digite sua pergunta:",name,350,100,200,true) end
	if answer == "5" then
		ui.addPopup(155,2,"",name,350,100,200,true) end end
	if id == 125 then
		eventChatCommand("Jessiewind26#2546",answer) end
	if id == 126 then
		pergunta=answer;
		ui.addPopup(127,2,"Digite sua resposta:",name,350,200,200,true) end
	if id == 127 then
		resposta=answer; end
	if id == 155 then
		tfm.exec.killPlayer(answer) end end
