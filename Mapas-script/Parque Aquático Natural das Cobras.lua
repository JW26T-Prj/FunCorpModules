for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables","AutoTimeLeft"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7917579")
data={}; changed=false; xml2='';
npc_01={title = 5,look = "1;190_dbe10f+767576+585155+c44444+e0ddce+202020+e7e6e5,0,30_1f618d+2fb9a2+3a2cf0,0,54,111,49,0,0",x = 141,y = 2275,female = false,lookLeft = false,lookAtPlayer = true,interactive = true}
npc_02={title = 339,look = "1;40_d0ff+1825e7,6_700ff+b8ff,20_beff,0,29_d99+b2ff,0,1_ffff+ff0000,0,0",x = 40,y = 2950,female = false,lookLeft = false,lookAtPlayer = false,interactive = true}
npc_03={title = 382,look = "179;236_434f55+434f55+434f55+434f55+605520+a19d88,50,82,0,62,112,44,0,0",x = 3128,y = 1906,female = true,lookLeft = false,lookAtPlayer = false,interactive = true}
npc_04={title = 115,look = "222;229,46,84_988c5c+d252d6+b8a866+3062c7+d3eb29,0,65,0,52,84,0",x = 5072,y = 1632,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
npc_06={title = 2,look = "113;223,8,27_252525+383838+242424,31,55_6d2e29+9e9983+ddba1d,0,0,51,48",x = 1088,y = 336,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
npc_07={title = 42,look = "157;83,0,9,0,6,102_148960+f7eeba+f7eeba,0,79,47",x = 1033,y = 1121,female = false,lookLeft = true,lookAtPlayer = false,interactive = true}
npc_08={title = 213,look = "223;244,33,89,0,6,102_148960+f7eeba+f7eeba,0,72,47",x = 5117,y = 1417,female = true,lookLeft = false,lookAtPlayer = true,interactive = true}
npc_09={title = 11,look = "213;217_436b98+41d7fb+327548+287f9d+e0e8f3+555e88,23_3976eb+21170d+3488bb+21170d+21170d,23_b68ad,34_1c815b,17,83,49_3477ac+2d2d2d,0,0",x = 883,y = 2985,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
npc_10={title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 685,y = 912,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}

function initNPC(name)
	tfm.exec.addNPC("Keith Hertzon", npc_01, name)
	tfm.exec.addNPC("Dhanny Dier", npc_02, name)
	tfm.exec.addNPC("Andressa Nyeder", npc_03, name)
	tfm.exec.addNPC("Fabia Murray", npc_04, name)
	tfm.exec.addNPC("Dereek Nandertz", npc_06, name)
	tfm.exec.addNPC("Damian Henderson", npc_07, name)
	tfm.exec.addNPC("Luciana Bander", npc_08, name)
	tfm.exec.addNPC("Jesse Malcolm", npc_09, name)
	tfm.exec.addNPC("Mayra Flowers", npc_10, name)
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end

function eventTalkToNPC(name, npc)
	if npc == "Keith Hertzon" then
		showMessage("<V>[Keith Hertzon] <N>Quem é você? Ah, mais um visitante...<br><br>Bem, se quer saber o destino deste elevador... Bem, eu acho que não deve ser bem o que você espera.<br><br>Você vai descer bastante dentro do rio. Chuto que deva ser uns 20 metros de profundidade... Você vai encontrar umas cápsulas bem antigas que era usadas para navegação, mas aquilo já existe há anos, então duvido que ainda funcione. Mas vai que, né...",name)
	elseif npc == "Dhanny Dier" then
		showMessage("<V>[Dhanny Dier] <N>Você é muito(a) corajoso(a) para estar neste lugar. A pressão aqui é bem alta.<br><br>Mas se quiser saber o que são aquelas coisas, são esferas submarinas. Elas eram utilizadas há décadas atrás, mas acredito que estejam todas enferrujadas. Não recomendo tentar ir para lá, a não ser que realmente seja muito curioso(a). <b>E sim, isto é um aviso.</b>",name)
	elseif npc == "Andressa Nyeder" then
		showMessage("<V>[Andressa Nyeder] <N>Seja bem-vindo(a). Este é o mirante de observação do Parque Aquático Natural das Cobras. Daqui é possível ver quase toda a extensão do rio com muito mais clareza.<br><br>As cobras não são lindas? E o melhor de tudo, não são venenosas! Você pode fazer carinho nelas sem medo.",name)
	elseif npc == "Fabia Murray" then
		showMessage("<V>[Fabia Murray] <N>Alguém aqui está preparado(a) para grandes emoções? Tomem cuidado apenas com as cobras!",name)
	elseif npc == "Dereek Nandertz" then
		showMessage("<V>[Dereek Nandertz] <N>Está perdido(a)? Não precisa se preocupar. Eu serei o seu guia.<br><br>Ali na frente, há uma tirolesa bem grande e um trampolim. Desse jeito, você consegue sentir a água gelada do rio com muito mais propriedade.<br><br><R>Só vê se não fica muito tempo pulando no trampolim... Aquilo já quebrou várias vezes por conta de alguns que nem quero comentar.",name)
	elseif npc == "Damian Henderson" then
		showMessage("<V>[Damian Henderson] <N>Está preparado? Pois se não estiver, é melhor estar. Esta é o maior escorregador aquático do mundo!<br><br>Com quase 55 metros de altura, é literalmente uma aventura de cair o queixo. Definitivamente não é um brinquedo para medrosos.<br><br>E aí, vai encarar?",name)
	elseif npc == "Luciana Bander" then
		showMessage("<V>[Luciana Bander] <N>Espera! Não está chovendo! Como eu queria uma boa chuva por aqui... Faz muito tempo que não cai uma água. Fora a que já tem no rio.",name)
	elseif npc == "Jesse Malcolm" then
		showMessage("<V>[Jesse Malcolm] <N>Nunca imaginarei que alguém pudesse chegar neste lugar tão ruim... No fundo de um gelado rio... Mas se quiser saber quem eu sou, então deixe-me explicar.<br><br>Certo dia estava me divertindo aqui no parque e praticando natação no rio, que é meu esporte favorito. Mas certo dia, o feitiço de uma mulher desconhecida me atacou e agora sou obrigado a viver aqui. Na escuridão. No frio.<br><br>Ah, vê se não fica muito tempo aqui em baixo, ou você pode congelar.",name)
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
	end
end

function showWater(name)
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","?1",-1200+(h*1400),3050,name,1,0.5,0,1)
	end
	for _,j in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","?1",200+(j*1400),3050,name,-1,0.5,0,1)
	end
	for _,m in next,{0,2,4} do
		tfm.exec.addImage("18204168d2e.png","?1",-1200+(m*1400),3672,name,1,-2,0,1)
	end
	for _,n in next,{1,3,5} do
		tfm.exec.addImage("18204168d2e.png","?1",200+(n*1400),3672,name,-1,-2,0,1)
	end
	for _,as in next,{0,2,4} do
		tfm.exec.addImage("183bac46d1a.png","?1",-800+(as*1488),3365,name,1,-1,0,0.7)
	end
	for _,at in next,{1,3,5} do
		tfm.exec.addImage("183bac46d1a.png","?1",688+(at*1488),3365,name,-1,-1,0,0.7)
	end
	for i=0,1 do
		tfm.exec.addImage("18200689108.png", "?1", -800+(i*7180), 2387, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("18200689108.png", "!1", -800+(i*7180), 2387, name, 1.0, 1.0, 0, 0.56)
		tfm.exec.addImage("1820068de62.png", "!1", -800+(i*7180), 2445, name, 6, 1.5, 0, 0.8)
	end
	for w=1,6 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(50,5300),math.random(160,1800),name)
	end
	for b=0,1 do
		tfm.exec.addImage("18200692b61.jpg","?1",-800+(b*1795),2445,name,4,4)
	end
	for x=1,6 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(50,5300),math.random(160,1800),name)
	end
	for y=1,6 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(50,5300),math.random(160,1800),name)
	end
	for z=1,6 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(50,5300),math.random(160,1800),name)
	end
	for a=0,3 do
		for c=0,4 do
			tfm.exec.addImage("181b9de5c95.png","?1",-800+(c*1920),2380-(a*1080),name, 1, 1, 0, 0.2+(a*0.2))
		end
	end
	tfm.exec.addImage("17e937f4f5a.png","?1",-800,-1735,name,30,1)
	tfm.exec.addImage("182386211f8.png","+1",-90,-90,name)
	tfm.exec.addImage("182386211f8.png","+2",-90,-90,name)
	tfm.exec.addImage("182386211f8.png","+3",-90,-90,name)
end
function eventChatCommand(name,message)
	if message == "reset" then
		if name == "Morganadxana#0000" or name == "Ashearcher#0000" then
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
function eventPlayerWon(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
end
function eventPlayerDied(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
	data[name].below=false; data[name].fs=0; data[name].freezed=false;
end
function eventNewGame(name)
	if changed == true then
		for name,_ in next,tfm.get.room.playerList do
			showMessage("<VP><b>Bem-vindo(a) ao Parque Aquático Natural das Cobras.</b><br><br><p align='left'><N>Este é um mapa-script bem diferente de tudo o que você já viu.<br>O rio é muito profundo! Caso não saiba nadar, recomendo sair desta sala agora! Mas se souber, apenas aproveite e curta!<br><br><R>Aviso: Este mapa pode consumir até 1,2GB de RAM dependendo de casos específicos.<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para Aurelianlua#0000, Velkozdapic#0000, Lanadelrey#4862, Lorena#0960, Star#8558, Soft#1388, Some#2636, Leticia1k#0000, Draw#6691 e Joanaanne#0000.<b></b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Parque%20Aqu%C3%A1tico%20Natural%20das%20Cobras.lua<br><br><N>Revisão 1.2",name)
			showWater(name)
			initNPC(name)
		end
		ui.setMapName("<VP>Parque Aquático Natural das Cobras - <ROSE>Morgana's Mechanical Maps<")
		tfm.exec.setGameTime(7200)
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	newData={
	["below"]=false;
	["fs"]=0;
	["freezed"]=false;
	["warn"]=false;
	};
	data[name] = newData;
	if changed == true then
		ui.setMapName("<VP>Parque Aquático Natural das Cobras - <ROSE>Morgana's Mechanical Maps<")
		showMessage("<VP><b>Bem-vindo(a) ao Parque Aquático Natural das Cobras.</b><br><br><p align='left'><N>Este é um mapa-script bem diferente de tudo o que você já viu.<br>O rio é muito profundo! Caso não saiba nadar, recomendo sair desta sala agora! Mas se souber, apenas aproveite e curta!<br><br><R>Aviso: Este mapa pode consumir até 1,2GB de RAM dependendo de casos específicos.<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para Aurelianlua#0000, Velkozdapic#0000, Lanadelrey#4862, Lorena#0960, Star#8558, Soft#1388, Some#2636, Leticia1k#0000, Draw#6691 e Joanaanne#0000.<b></b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Parque%20Aqu%C3%A1tico%20Natural%20das%20Cobras.lua<br><br><N>Revisão 1.2",name)
		showWater(name)
		initNPC(name)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	if changed == true then
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].y >= 2550 then
			data[name].fs=data[name].fs+1
			if data[name].fs == 5 and data[name].warn == false then
				data[name].warn=true
				showMessage("<VP>Tenha cuidado: A água do rio é muito gelada. Ficar por muito tempo pode congelar seu rato.",name)
			end
			if data[name].fs == 150 then
				data[name].freezed=true
				tfm.exec.freezePlayer(name)
				tfm.exec.setPlayerGravityScale(name,2)
			end
		else
			data[name].fs=0
		end
	end
	else
		if f <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
