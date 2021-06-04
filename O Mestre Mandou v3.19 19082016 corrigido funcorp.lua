-- Versão de 2016 do module Mestre Mandou, datada de 19 de agosto de 2016, ainda com o criador original (Jessiewind26#2546).
-- O código foi todo revisado e mantido em sua forma original na medida do possível, mas removendo alguns comandos inadequados e arrumando alguns bugs.
-- Código adicionado por Rakan_raster#0000.
admin="Jessiewind26#2546"
admin1="Reksai_void2600#6638"
admin2="Shun_kazami#7014"
admin3="Skyrectarrow#0000"
admin4="Morganadxana#0000"
admin5="Tryndavayron#0000"
admin6="Arenaut20000#0000"
admin7="Patrick_mahomes#1795"
admin8="Aurelianlua#0000"
admin9="Fosfus7heads#0000"
shaman="Jessiewind26#2546"
comandos0={"5","8","11","13","14","15","16","17","18","20","22","23","24","25","26","27","29","31","32","34","35","38","39","42"}
comandos1={"1","2","5","6","7","11","13","14","15","16","17","18","20","21","22","23","24","25","26","27","29","30","31","32","33","34","35","36","38","39","41","42"}
comandos2={"1","2","3","4","5","6","7","8","9","10","11","13","14","15","16","17","18","19","20","21","23","24","25","26","27","30","31","32","33","34","35","36","37","38","39","41","42"}
num=3
ui.addPopup(0,0,"<font size='14'>É recomendável você descarregar o script em execução para não ocorrerem bugs no jogo.<br><br><b>Caso você já tenha descarregado e deseja continuar, feche esta janela. Caso contrário digite: /module stop e carregue o script novamente.",shaman,270,125,300,true)
data={}
rato=0
n=""
x1 = 150
x2 = 400
x3 = 650
x4 = 228
x5 = 532
tempo2=10;
limite=25;
rodada=0;
dance=false;
tecla=false;
jogo=false;
vira=false;
sent=false;
contagem=false;
contagem2=false;
conf=false;
esqu=false;
logo=true;
dire=false;
wolf=false;
pule=false;
pule2=false;
palm=false;
nome=false;
nome2=false;
nome3=false;
clic=false;
naop=false;
chor=false;
raiv=false;
equa1=false;
coma=false;
topo=false;
beij=false;
segu=false;
dorm=false;
kill=false;
rir1=false;
topo2=false;
rir2=false;
noob=false;
jog0=false;
face=false;
bigo=false;
digi=false;
espa=false;
luga1=false;
luga2=false;
luga3=false;
luga4=false;
luga5=false;
luga6=false;
luga7=false;
digi2=false;
tempo=10;
mapacont=0;
cmd=false;
valendo=true;
players={}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(35)
system.disableChatCommandDisplay("limite")
system.disableChatCommandDisplay("1")
system.disableChatCommandDisplay("2")
system.disableChatCommandDisplay("3")
system.disableChatCommandDisplay("4")
system.disableChatCommandDisplay("5")
system.disableChatCommandDisplay("6")
system.disableChatCommandDisplay("7")
system.disableChatCommandDisplay("8")
system.disableChatCommandDisplay("9")
system.disableChatCommandDisplay("10")
system.disableChatCommandDisplay("11")
system.disableChatCommandDisplay("12")
system.disableChatCommandDisplay("13")
system.disableChatCommandDisplay("14")
system.disableChatCommandDisplay("15")
system.disableChatCommandDisplay("16")
system.disableChatCommandDisplay("17")
system.disableChatCommandDisplay("18")
system.disableChatCommandDisplay("19")
system.disableChatCommandDisplay("20")
system.disableChatCommandDisplay("21")
system.disableChatCommandDisplay("22")
system.disableChatCommandDisplay("23")
system.disableChatCommandDisplay("24")
system.disableChatCommandDisplay("25")
system.disableChatCommandDisplay("26")
system.disableChatCommandDisplay("27")
system.disableChatCommandDisplay("28")
system.disableChatCommandDisplay("29")
system.disableChatCommandDisplay("30")
system.disableChatCommandDisplay("31")
system.disableChatCommandDisplay("32")
system.disableChatCommandDisplay("33")
system.disableChatCommandDisplay("34")
system.disableChatCommandDisplay("35")
system.disableChatCommandDisplay("36")
system.disableChatCommandDisplay("37")
system.disableChatCommandDisplay("38")
system.disableChatCommandDisplay("39")
system.disableChatCommandDisplay("40")
system.disableChatCommandDisplay("41")
system.disableChatCommandDisplay("42")
system.disableChatCommandDisplay("mapa")
system.disableChatCommandDisplay("r1")
system.disableChatCommandDisplay("r2")
system.disableChatCommandDisplay("r3")
system.disableChatCommandDisplay("r4")
system.disableChatCommandDisplay("r5")
system.disableChatCommandDisplay("r6")
system.disableChatCommandDisplay("r7")
system.disableChatCommandDisplay("r8")
system.disableChatCommandDisplay("r9")
system.disableChatCommandDisplay("r10")
system.disableChatCommandDisplay("r11")
system.disableChatCommandDisplay("r12")
system.disableChatCommandDisplay("c1")
system.disableChatCommandDisplay("c2")
system.disableChatCommandDisplay("c3")
system.disableChatCommandDisplay("c4")
vivo=0;
tfm.exec.disableAfkDeath(true)
mapas={6788085,6788174,6788154,6788183,6788178,6784965,6788693,6788695,6788715,6788728,6788848,6789206,6788861,6789259,6789235,6789249,6789263,6789271,6789260,6789280,6789853,6789334,6790300,6790484,6790385,6790527,6790433,6790911,6790895,6790903,6791944,6790896,6791838,6791854,6791871,6789451,6792320,6792397,6792509,6792518,6792523,6793213,6793222,6794050,6789272,6790467,6798615,6799768,6793860,6799996,6799998,6801706,6799997,6804482,6789356,6789324,6789358,6789937,6808957,6792470,6810292,6802377,6806109,6803018,6803128,6821950,6809464,6809498,6811934,6822119,6822331}
tfm.exec.newGame(mapas[math.random(#mapas)])
tfm.exec.setGameTime(36000)
function resetar()
	dance=false;
	sent=false;
	esqu=false;
	dire=false;
	clic=false;
	conf=false;
	coma=false;
	palm=false;
	segu=false;
	dorm=false;
	beij=false;
	kill=false;
	raiv=false;
	pule2=false;
	nome=false;
	nome2=false;
	nome3=false;
	chor=false;
	pule=false;
	noob=false;
	sham=false;
	rir1=false;
	rir2=false;
	face=false;
	bigo=false;
	topo2=false;
	digi2=false;
	digi=false;
	vira=false;
	espa=false;
	luga1=false;
	luga2=false;
	luga3=false;
	luga4=false;
	luga5=false;
	luga6=false;
	luga7=false;
	equa1=false;
	jog0=false;
	equa2=false;
	equa3=false;
	tecla=false;
	spin=false;
	topo=false;
	naop=false;
	naos=false;
	wolf=false;
	cmd=false;
	tfm.exec.setGameTime(13)
	ui.removeTextArea(0,nil)
	num=3 end
function eventNewPlayer(name)
	tfm.exec.bindKeyboard(name,38,true,true)
	tfm.exec.bindKeyboard(name,37,true,true)
	tfm.exec.bindKeyboard(name,65,true,true)
	tfm.exec.bindKeyboard(name,39,true,true)
	tfm.exec.bindKeyboard(name,68,true,true)
	tfm.exec.bindKeyboard(name,87,true,true)
	tfm.exec.bindKeyboard(name,32,true,true)
	tfm.exec.bindKeyboard(name,40,true,true)
	tfm.exec.bindKeyboard(name,83,true,true)
	tfm.exec.bindKeyboard(name,18,true,true)
	tfm.exec.bindKeyboard(name,115,true,true)
	rato=rato+1
	system.bindMouse(name,true)
	newData={
			["v"]=0;
			["c"]=0;
			["m"]=0;
			["t"]=0;
			};
 	data[name] = newData;
	tfm.exec.chatMessage("<N>Sejam bem-vindos ao module <b>O Mestre Mandou!</b><br><VP>Neste script vocês terão que fazer tudo o que o module pedir, independente do que seja.<br>Versão de 19/08/2016<br><br><VI>Quer saber como jogar? Digite !help<br><R>Script criado por Jessiewind26#2546, Nasus_assassin#1534, Shun_kazami#7014 e Fosfus7heads#0000",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false) end
function eventPlayerDied(name)
	vivo=vivo-1
	tfm.exec.setPlayerScore(name,-1,false)
	local i=0
	local n
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
		resetar()
		tfm.exec.setPlayerScore(shaman,20,false) end end
function eventNewGame()
	valendo=true;
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
		tfm.exec.setPlayerScore(name,0,false) end end
function eventPlayerLeft(name)
	rato=rato-1 end
function eventMouse(name,x,y)
	if clic == true then
		data[name].m=data[name].m+1
		if data[name].m >= 10 then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventChatCommand(name,m)
	if m == "help" then
		ui.addPopup(1,0,"<font align='center'><font size='30'>O Mestre Mandou<br><br><font align='left'><font size='13'>Neste script você deverá fazer o que o shaman te mandar, seja sentar, dar um beijo ou até mesmo mandar você dizer que é noob. Quem não fazer o que o shaman diz vai morrer automaticamente e o último que sobrar ganha o jogo.<br><br>Créditos:<br>Montagem: Jessiewind26#2546<br>Sugestões de comandos: Spectra_phantom#6089 e Fosfus7heads#0000<br>Testes: Reksai_void2600#6638, Shun_kazami#7014 e Arenaut20000#0000",name,112,88,537,true) end
	if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 or name == admin6 or name == admin7 or name == admin8 or name == admin9 then
		if m == "mapa" then
			tfm.exec.chatMessage("<VI>Quer ver seu mapa aparecendo? Mande-o para<br><b>http://atelier801.com/topic?f=686054&t=879607</b>",nil) end
		if cmd == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
			data[name].v=0
			data[name].c=0
			data[name].m=0	end
		rodada=rodada+1
		if m == "1" then
			cmd=true;
			tfm.exec.setGameTime(8)
			dance=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dance!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
		elseif m == "2" then
			tfm.exec.setGameTime(5)
			sent=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Sente!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "3" then
			tfm.exec.setGameTime(7)
			conf=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Taque 5 confetes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "4" then
			tfm.exec.setGameTime(10)
			clic=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Clique na tela 10 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "5" then
			tfm.exec.setGameTime(10)
			coma=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite o comando !omestremandou",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "6" then
			tfm.exec.setGameTime(10)
			beij=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dê 5 beijos!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "7" then
			tfm.exec.setGameTime(10)
			palm=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Bata palmas 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "8" then
			tfm.exec.setGameTime(8)
			dorm=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês estão com sono. Durmam para descansar.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "9" then
			tfm.exec.setGameTime(8)
			raiv=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Jessiewind26#2546 é do mal! FIQUEM COM RAIVA DELE!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "10" then
			tfm.exec.setGameTime(8)
			chor=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês não ganharam queijo :( Chorem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif(m:sub(0,6) == "limite") then
			tfm.exec.setRoomMaxPlayers(m:sub(8))
		elseif m == "11" then
			tfm.exec.setGameTime(8)
			pule=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pulem 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "12" then
			tfm.exec.setGameTime(10)
			nome3=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual o nome da guerreira que luta com o personagem do perfil do Fosfus7heads#0000?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "13" then
			tfm.exec.setGameTime(10)
			nome2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Responda sem ! na frente: Quem criou esse script?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "14" then
			tfm.exec.setGameTime(7)
			kill=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Abaixem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "15" then
			tfm.exec.setGameTime(10)
			segu=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione 35 vezes a tecla para DIREITA!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "16" then
			tfm.exec.setGameTime(10)
			nome=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Responda com ! na frente: Quem criou esse script?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "17" then
			tfm.exec.setGameTime(8)
			noob=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite: EU SOU NOOB",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "18" then
			tfm.exec.setGameTime(8)
			sham=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não falem nada!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
		elseif m == "19" then
			tfm.exec.setGameTime(9)
			rir1=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Agora RIAM!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "20" then
			tfm.exec.setGameTime(5)
			rir2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>QUEM RIR AGORA VAI MORRER",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "21" then
			tfm.exec.setGameTime(8)
			face=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Coloque a mão no rosto (facepalm) 3 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "22" then
			tfm.exec.setGameTime(12)
			bigo=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Balance a bandeira de qualquer país!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "23" then
			tfm.exec.setGameTime(7)
			digi=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite qualquer coisa e mande para mim.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "24" then
			tfm.exec.setGameTime(9)
			espa=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione BARRA DE ESPAÇO 15 vezes (cuidado pra n quebrar o teclado)",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "25" then
			tfm.exec.setGameTime(7)
			luga1=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "26" then
			tfm.exec.setGameTime(7)
			luga2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x2,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false)
			end
			cmd=true;
		elseif m == "27" then
			tfm.exec.setGameTime(7)
			luga3=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x3,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "28" then
			tfm.exec.setGameTime(7)
			equa1=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual o valor de <b>x</b> para a equação <b>2x + 1 = 9</b>?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "29" then
			tfm.exec.setGameTime(10)
			spin=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem criou o Transformice?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "30" then
			tfm.exec.setGameTime(10)
			topo=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique na parte de cima do mapa! (acima da linha branca)",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,0,150,800,5,0xfffffe,0xfffffe,1,true)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "31" then
			tfm.exec.setGameTime(10)
			wolf=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite: O Jessie é lindão",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "32" then
			tfm.exec.setGameTime(5)
			naop=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>NÃO PULEM",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
		elseif m == "33" then
			tfm.exec.setGameTime(5)
			naos=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não se mexam!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
		elseif m == "34" then
			tfm.exec.setGameTime(7)
			luga4=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x4,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "35" then
			tfm.exec.setGameTime(7)
			luga5=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x5,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "36" then
			tfm.exec.setGameTime(7)
			jogo=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem aqui joga LOL?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "37" then
			tfm.exec.setGameTime(7)
			vira=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique virado para a direita!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "38" then
			tfm.exec.setGameTime(7)
			luga6=true;
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "39" then
			tfm.exec.setGameTime(7)
			luga7=true;
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado vermelho!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "40" then
			tfm.exec.setGameTime(7)
			equa2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual o resultado da equação <b>x² - 3x + 2 = 0</b>?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "41" then
			tfm.exec.setGameTime(7)
			equa3=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual o resultado de <b>7 - 192?</b>?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "42" then
			tfm.exec.setGameTime(7)
			tecla=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione F4!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "c1" then
			tfm.exec.setGameTime(10)
			topo2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique na parte de cima do mapa! (acima da linha branca)",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,0,150,800,5,0xfffffe,0xfffffe,1,true)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(name,1,false) end
			cmd=true;
		elseif m == "c2" then
			tfm.exec.setGameTime(8)
			pule2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pulem 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "c3" then
			tfm.exec.setGameTime(7)
			jog0=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem aqui joga LOL?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "c4" then
			tfm.exec.setGameTime(7)
			digi2=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite qualquer coisa e mande para mim.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true; end end end
	if m == "omestremandou" then
		if coma == true then
			tfm.exec.setPlayerScore(name,1,false) end end
	if m == "Jessiewind26#2546" or m == "Jessiewind26#2546" or m == "Jessiewind26#2546" then
		if nome == true then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventChatMessage(name,message)
	if noob == true then
		if message == "EU SOU NOOB" or message == "eu sou noob" or message == "Eu sou noob" or message == "Eu Sou noob" or message == "Eu Sou Noob" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == "Jessiewind26#2546" or message == "jessiewind26#2546" or message == "JESSIEWIND26#2546" then
		if nome2 == true then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == "Lena Isis" then
		if nome3 == true then
			tfm.exec.setPlayerScore(name,1,false) end
	elseif message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
		if nome3 == true then
			tfm.exec.killPlayer(name) end end
	if digi == true then
		tfm.exec.setPlayerScore(name,1,false) end
	if equa1 == true then
		if message == "4" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if equa2 == true then
		if message == "1 e 2" or message == "2 e 1" or message == "1/2" or message == "2/1" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if equa3 == true then
		if message == "-185" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == "O Jessie é lindão" or message == "o jessie é lindão" or message == "O jessie é lindão" or message == "O Jessie é Lindão" or message == "O JESSIE É LINDÃO" then
		if wolf == true then
			tfm.exec.setPlayerScore(name,1,false) end end
	if sham == true then
		tfm.exec.killPlayer(name) end
	if spin == true then
		if message == "Tigrounette" or message == "tigrounette" or message == "TIGROUNETTE" then
			tfm.exec.setPlayerScore(name,1,false)
		elseif message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
			tfm.exec.killPlayer(name) end end
	if jogo == true then
		if message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventLoop(p,f)
	tempo2=tempo2-0.5
	if f <= 5000 and topo2 == true then
		cmd=false;
		eventChatCommand(admin,"33")
		ui.removeTextArea(100,nil)
		topo2=false; end
	if f <= 6500 and pule2 == true then
		cmd=false;
		eventChatCommand(admin,"32")
		pule2=false; end
	if f <= 5500 and jog0 == true then
		cmd=false;
		eventChatCommand(admin,"29")
		jog0=false;	end
	if f <= 5000 and digi2 == true then
		cmd=false;
		eventChatCommand(admin,"18")
		digi2=false;	end
	if tempo2 == num then
		if rodada < limite and valendo == true then
			if vivo >= 10 then
				eventChatCommand(admin, comandos0[math.random(#comandos0)])
			elseif vivo < 10 and vivo >= 0 then
				eventChatCommand(admin, comandos1[math.random(#comandos1)])
			elseif vivo < 5 then
				eventChatCommand(admin, comandos2[math.random(#comandos2)])	end
		else
			valendo=false;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
				tfm.exec.setPlayerScore(name,1,false) end
			tfm.exec.setGameTime(10)
			contagem2=true; end	end
	if contagem == true and vivo > 0 then
		tfm.exec.setUIMapName("<b>"..shaman.."</b> <N>venceu a partida! Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end
	elseif contagem == true and vivo == 0 then
		tfm.exec.setUIMapName("<b>Ninguém ganhou...</b> Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end end
	if contagem2 == true then
		tfm.exec.setUIMapName("<R>Tempo limite atingido. Os jogadores restantes venceram! <N>Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")	end
	if contagem == false and tempo2 < 10 and cmd == true then
		tfm.exec.setUIMapName("Mestre Mandou v3.19  <BL>|  <N>Ratos: <VP>"..vivo.." <V>/ <J>"..rato.." <V>/ <R>"..tfm.get.room.maxPlayers.."  <BL>|  <N>Tempo: <J>"..math.floor(f/1000).." seg  <BL>|  <N>Rodada: <R>"..rodada.."/"..limite.."  <BL>|  <VP>By Jessiewind26#2546<")
	elseif contagem == false and cmd == false then
		tfm.exec.setUIMapName("Mestre Mandou v3.19  <BL>|  <N>Ratos: <VP>"..vivo.." <V>/ <J>"..rato.." <V>/ <R>"..tfm.get.room.maxPlayers.."  <BL>|  <N>Rodada atual: <VP>"..rodada.."/"..limite.."  <BL>|  <N>Aguardem um novo comando!<") end
	if f <= 1500 and valendo == false then
		tfm.exec.newGame(mapas[math.random(#mapas)]) end
	if vira == true then
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].isFacingRight then
				tfm.exec.setPlayerScore(name,1,false)
			else
				tfm.exec.setPlayerScore(name,0,false) end end end
	if f <= 1 then
		for pn, player in pairs(tfm.get.room.playerList) do
			if luga1 == true or luga6 == true then
				if player.x < 150 or player.x > 230 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if luga2 == true then
				if player.x < 400 or player.x > 480 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if luga3 == true then
				if player.x < 650 or player.x > 730 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if luga4 == true then
				if player.x < 228 or player.x > 308 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if luga5 == true or luga7 == true then
				if player.x < 532 or player.x > 612 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if topo == true then
				if player.y > 150 then
					tfm.exec.killPlayer(pn)	end	end	end	end
	if f <= 1 then
		ui.removeTextArea(0,nil)
		ui.removeTextArea(100,nil)
		ui.removeTextArea(200,nil)
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].score == 0 then
				tfm.exec.killPlayer(name) end end
		resetar()
		if vivo > 1 then
			tempo2=10
		else
			tempo2=9999	end	end
	for name,player in pairs(tfm.get.room.playerList) do
		if cmd == true and conf == true then
			ui.addTextArea(1000,"<font size='16'>Você tacou "..data[name].c.." confetes.",name,0,160,400,32)
		elseif cmd == true and clic == true then
			ui.addTextArea(1000,"<font size='16'>Você clicou na tela "..data[name].m.." vezes.",name,0,160,400,32)
		elseif cmd == true and beij == true then
			ui.addTextArea(1000,"<font size='16'>Você deu "..data[name].c.." beijos.",name,0,160,400,32)
		elseif cmd == true and palm == true then
			ui.addTextArea(1000,"<font size='16'>Você bateu palmas "..data[name].c.." vezes.",name,0,160,400,32)
		elseif cmd == true and pule == true then
			ui.addTextArea(1000,"<font size='16'>Você pulou "..data[name].c.." vezes.",name,0,160,400,32)
		elseif cmd == true and segu == true then
			ui.addTextArea(1000,"<font size='16'>Você pressionou direita "..data[name].c.." vezes.",name,0,160,400,32)
		elseif cmd == true and face == true then
			ui.addTextArea(1000,"<font size='16'>Você colocou mão no rosto "..data[name].c.." vezes.",name,0,160,400,32)
		elseif cmd == true and espa == true then
			ui.addTextArea(1000,"<font size='16'>Você pressionou espaço "..data[name].c.." vezes.",name,0,160,400,32)
		else
			ui.removeTextArea(1000,nil)	end end end
function eventKeyboard(name,id,down,x,y)
	if pule == true then
		if id == 38 or id == 87 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if tecla == true then
		if id == 115 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if naop == true then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name) end end
	if naos == true then
		if id == 38 or id == 87 or id == 37 or id == 65 or id == 39 or id == 68 or id == 40 or id == 83 then
			tfm.exec.killPlayer(name) end end
	if espa == true then
		if id == 32 then
			data[name].c=data[name].c+1
			if data[name].c == 15 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if esqu == true then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,1,false) end
		if id == 37 or id == 65 then
			tfm.exec.killPlayer(name) end end
	if dire == true then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,1,false) end
		if id == 39 or id == 68 then
			tfm.exec.killPlayer(name) end end
	if kill == true then
		if id == 40 or id == 83 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if segu == true then
		if id == 39 or id == 68 then
			data[name].c=data[name].c+1
			if data[name].c == 35 then
				tfm.exec.setPlayerScore(name,1,false) end end end end
function eventEmotePlayed(name,id)
	if dance == true then
		if id == 0 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if rir1 == true then
		if id == 1 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if rir2 == true then
		if id == 1 then
			tfm.exec.killPlayer(name) end end
	if sent == true then
		if id == 8 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if dorm == true then
		if id == 6 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if raiv == true then
		if id == 4 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if chor == true then
		if id == 2 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if face == true then
		if id == 7 then
			data[name].c=data[name].c+1
			if data[name].c == 3 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if conf == true then
		if id == 9 then
			data[name].c=data[name].c+1
			if data[name].c == 4 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if beij == true then
		if id == 3 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if palm == true then
		if id == 5 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if bigo == true then
		if id == 10 then
			tfm.exec.setPlayerScore(name,1,false) end end end