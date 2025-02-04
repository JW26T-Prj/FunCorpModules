for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7917999")
changed=false; xml2=''; y_factor=1400; lang={};
lang.br = {
	npc01 = "<V>[Julia Lynner] <N>Bem-vindo(a) ao Quiosque do Raposo Azul. Confira os preços de nossos produtos...\n\nEspera, eu perdi meu papel com os preços!",
	npc02 = "<V>[Brand Northern] <N>Olha, olha, olha a água mineral, água mineral, água mineral...",
	npc03 = "<V>[John Grand] <J>Ah! Que delícia, cara!",
	npc04 = "<V>[Danniel Victor] <N>Esta é a área conhecida como <R>Ilha do Dragão Vermelho.<N>\n\nDebaixo dela existe um recife de plantas muito grande, no qual vários peixes conseguem viver muito bem. É um lugar muito lindo, vale a pena conhecer. Ah, e tome cuidado com a água. Não fique muito tempo dentro do mar. Você pode afundar e não voltar mais.",
	npc05 = "<V>[Kenner Henderson] <N>Foi você o <R>fi********* <N>que amarrou aquele pneu nas ligações elétricas?\n\n<VP>Não? Ainda bem. <N>Pois algum ser sem cérebro inventou de colocar um pneu nos fios para tentar fazer uma tirolesa. Como estou furioso por conta isso...\n\nAh, e se está curioso para saber o que é aquela escada, ela dá para o gerador nuclear principal, que fica bem no fundo do mar. Não me arriscaria a descer até lá...",
	npc06 = "<V>[Keith Cramer] <R>NÃO ESTÁ VENDO QUE ESTA É UMA ÁREA RESTRITA? SAIA DAQUI AGORA! QUER SER INFECTADO(A)? NÃO? ENTÃO SAIA AGORA, C******!",
	npc07 = "<V>[Mandery Under] <N>Ei, o que está fazendo na minha piscina suspensa?! Isso tudo é meu!",
	npc08 = "<V>[Aaron Grand] <N>Esta é a Torre do Nascer do Sol. O lugar mais alto da praia. Daqui dá para ver absolutamente tudo. Incluindo o pôr do sol que é lindo.\n\nSe eu fosse você, nunca mais sairia daqui. Tenho um baita medo de mar...",
	npc09 = "<V>[Daniel Winngs] <N>Seja bem-vindo(a). Você definitivamente está em um lugar privilegiado.\n\nEsta é uma praia totalmente paradisíaca. Com sua água cristinalina, duas tirolesas e uma piscina suspensa, você não vai querer sair daqui tão cedo.",
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome1 = "<VP><b>Bem-vindo(a) a Praia da Reserva Verde.</b>\n\n<p align='left'><N>Este é um mapa-script de praia bem grande e com diversos recursos para se divertir. Aproveite e curta!\n\n<J>Agradecimentos especiais para <b>Draw#6691, Soft#1388, Viincenzo#9526, Lacoste#8972, Lipersz#9863, Spectra_phantom#6089, Shun_kazami#7014, Samira#4387, Threshlimit#0000, Star#8558 e Lanadelrey#4862.</b>\n\nRevisão 2.10",
	title = "Praia da Reserva Verde<",
}
lang.en = {
	npc01 = "<V>[Julia Lynner] <N>Welcome to the Blue Fox Kiosk. Check out the prices of our products...\n\nWait, I lost my paper with the prices!",
	npc02 = "<V>[Brand Northern] <N>Look at the mineral water!",
	npc03 = "<V>[John Grand] <J>Ah! How delicious, man!",
	npc04 = "<V>[Danniel Victor] <N>This is the area known as <R>Red Dragon Island.<N>\n\nUnderneath it, there is a very large reef of plants, where many fish lives very well. It is a very beautiful place, worth visiting.\n\nOh, and be careful with the water. Don't stay in the sea for too long. You might sink and never come back up.",
	npc05 = "<V>[Kenner Henderson] <N>Were you the <R>f********* <N>who tied that tire to the electrical connections?\n\n<VP>No? That is good. <N>Because some brainless being decided to put a tire on the wires to try to make a zip line. How furious I am about this...\n\nOh, and if you're curious about what that ladder is, it leads to the main nuclear generator, which is right at the bottom of the sea. I wouldn't risk going down there...",
	npc06 = "<V>[Keith Cramer] <R>CAN'T YOU SEE THIS IS A RESTRICTED AREA? GET OUT OF HERE NOW! DO YOU WANT TO GET INFECTED? NO? THEN GET OUT NOW, YOU F******!",
	npc07 = "<V>[Mandery Under] <N>Hey, what are you doing in my above ground pool?! This is all mine!",
	npc08 = "<V>[Aaron Grand] <N>This is the Sunrise Tower. The highest point of the beach. From here you can see absolutely everything. Including the sunset, which is beautiful.\n\nIf I were you, I would never leave here. I'm terrified of the sea...",
	npc09 = "<V>[Daniel Winngs] <N>Welcome. You're definitely in a privileged place.\n\nThis is a totally paradisiacal beach. With its crystal clear water, two zip lines and a suspended pool, you won't want to leave any time soon.",
	loadingmap = "Loading map. Please wait...<",
	welcome1 = "<VP><b>Welcome to the Green Reserve Beath!</b>\n\n<p align='left'><N>This is a very large beach script map with lots of features to keep you entertained. Enjoy and have fun!\n\n<J>Special thanks to <b>Draw#6691, Soft#1388, Viincenzo#9526, Lacoste#8972, Lipersz#9863, Spectra_phantom#6089, Shun_kazami#7014, Samira#4387, Threshlimit#0000, Star#8558 and Lanadelrey#4862.</b>\n\nRevision 2.10",
	title = "Green Reserve Beath<",
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
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,200,50,400,true)
	end
end
function showNPCs(name)
	tfm.exec.addNPC("Julia Lynner",{title = 382, look = "1;228,50,72,0,50_d946a7,90,44,0,0",x = 10032,y = 989,female = true,lookLeft = false,lookAtPlayer = false,interactive = true},name)
	tfm.exec.addNPC("Brand Northern",{title = 357, look = "1;225,0,46,34,26,104_3c3a87+6e7291+a5a7c1+caccdd+7582b3+f3f5f7,49,0,0",x = 10259,y = 875,female = false,lookLeft = false,lookAtPlayer = false,interactive = true},name)
	tfm.exec.addNPC("John Grand",{title = 298, look = "1;231,8,7,34,5,105,0,0,33",x = 9236,y = 1106,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Danniel Victor",{title = 296, look = "1;194,29,27,41,54,103,33,81,57",x = 3172,y = 1302,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Kenner Henderson",{title = 266, look = "27;236,45,22,0,44,0,50,67,35",x = 751,y = 1263,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Keith Cramer",{title = 216, look = "7;190_220b04+767576+585155+c44444+e0ddce+202020+e7e6e5,6_1d1c1c+464646,5_70707+d4c316,9,54,94,36,0,20",x = 648,y = 1337,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Mandery Under",{title = 387, look = "138;31,8,69,41,49,0,49,0,0",x = 4778,y = 742,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 6353,y = 355,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Aaron Grand",{title = 9, look = "4;225,43,38,0,54,104,0,0,20",x = 9450,y = 146,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Daniel Winngs",{title = 2, look = "1;203,50,20,41,42,103,50,0,0",x = 6174,y = 354,female = false,lookLeft = true,lookAtPlayer = true,interactive = true},name)
end
function showWater(name)
	tfm.exec.addImage("192e017de38.png", "!-1", -1200, y_factor+29, name,40,10,0,1)
	tfm.exec.addImage("192e017de38.png", "?1", -1200, y_factor+29, name,40,10,0,0.4)
	for _,i in next,{0,2,4,6} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+100, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+100, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+100, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+100, name)
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+3658, name,1,-1)
	end
	for _,i in next,{1,3,5,7} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+100, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+100, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+100, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+100, name,-1,1)
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+3658, name,-1,-1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3658, name,-1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+3658, name,-1,-1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+3658, name,-1,-1) 
	end
	for _,i in next,{0,2,4,6,8,10} do
		tfm.exec.addImage("192e0179669.png", "?1", -1200+(i*2400), y_factor-11, name)
		tfm.exec.addImage("192e017ca61.png", "!-1", -1200+(i*2400), y_factor-11, name,1,1)
	end
	for _,i in next,{1,3,5,7,9,11} do
 		tfm.exec.addImage("192e0179669.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1)
		tfm.exec.addImage("192e017ca61.png", "!-1", 1200+(i*2400), y_factor-11, name, -1, 1)
	end
	tfm.exec.addImage("17be536e980.png","?1",-800,3680,name)
	for h=0,4 do
		tfm.exec.addImage("1803e8e2250.jpg","?1",-1200+(h*2169),1050,name,1,0.75,0,1)
	end
	for k=0,5 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(500,7500),math.random(150,550),name)
	end
	for l=0,5 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(500,7500),math.random(150,550),name)
	end
	for m=0,5 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(500,7500),math.random(150,550),name)
	end
	for n=0,4 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(7500,10000),math.random(50,300),name)
	end
	tfm.exec.addImage("185c2e9252b.png","!1",4761,770,name,1,1,0,0.8)
	for o=1,3 do
		tfm.exec.addImage("183b4bf34ba.png","+"..o.."",-50,-48,name)
	end
	ui.setBackgroundColor("#7DB1E0")
end
function eventTalkToNPC(name, npc)
	if npc == "Julia Lynner" then
		showMessage(text.npc01,name)
	elseif npc == "Brand Northern" then
		showMessage(text.npc02,name)
	elseif npc == "John Grand" then
		showMessage(text.npc03,name)
	elseif npc == "Danniel Victor" then
		showMessage(text.npc04,name)
	elseif npc == "Kenner Henderson" then
		showMessage(text.npc05,name)
	elseif npc == "Keith Cramer" then
		showMessage(text.npc06,name)
	elseif npc == "Mandery Under" then
		showMessage(text.npc07,name)
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! (●'v'●) ",name)
	elseif npc == "Aaron Grand" then
		showMessage(text.npc08,name)
	elseif npc == "Daniel Winngs" then
		showMessage(text.npc09,name)
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
		tfm.exec.changePlayerSize(name,1)
		tfm.exec.setPlayerCollision(name,1)
	end
end
function eventNewGame(name)
	if changed == true then
		for name,_ in next,tfm.get.room.playerList do
			showWater(name)
			showNPCs(name)
		end
		ui.setMapName(text.title)
		tfm.exec.setGameTime(3600)
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName(text.loadingmap)
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	showWater(name)
	showNPCs(name)
	if changed == true then
		ui.setMapName(text.title)
	end
	showMessage(text.welcome1,name)
	for i=0,3 do
		system.bindKeyboard(name,i,true,true)
	end
end
function eventLoop(p,f)
	if changed == false then
		if f <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
for name,_ in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
