for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7917999")
changed=false; xml2='';

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
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
	tfm.exec.addNPC("Katarina Worlynder",{title = 220, look = "240;101_e0d9d0+1e9fa8+e0d9d0,36,38,0,62,0,0,0,0",x = 4600,y = 750,female = true,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 6353,y = 355,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Aaron Grand",{title = 9, look = "4;225,43,38,0,54,104,0,0,20",x = 9450,y = 146,female = false,lookLeft = false,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Daniel Winngs",{title = 2, look = "1;203,50,20,41,42,103,50,0,0",x = 6174,y = 354,female = false,lookLeft = true,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Camille Sanders",{title = 257, look = "1;44,40,87,3,62,91,37,52,0",x = 8586,y = 760,female = true,lookLeft = false,lookAtPlayer = true,interactive = true},name)
end
function showWater(name)
	for i=0,1 do
		tfm.exec.addImage("189749dd379.png", "?1", -600+(i*4000), 1390, nil, 1, 1, 0, 1)
		tfm.exec.addImage("189749dd379.png", "?1", 3400+(i*4000), 1390, nil, -1, 1, 0, 1)
	end
	tfm.exec.addImage("189749ce857.png", "?1", -600, 2183, nil, 5, 5, 0, 1)
	tfm.exec.addImage("1883b1394a4.png","!1",2500,100,name,0.5,0.5)
	tfm.exec.addImage("17be536e980.png","?1",-800,3680,name)
	for _,b in next,{0,2,4} do
		tfm.exec.addImage("183d7db795c.png","?1",-800+(b*1920),1405,name,1,1,0,0.25)
	end
	for _,c in next,{1,3,5} do
		tfm.exec.addImage("183d7db795c.png","?1",1120+(c*1920),1405,name,-1,1,0,0.25)
	end
	tfm.exec.addImage("18974709fd1.png", "!1", -600, 1350, nil, 6.5, 10, 0, 1)
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
function eventChatCommand(name,message)
	if message == "reset" then
		if name == "Morganadxana#0000" or name == "Ashearcher#0000" then
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
function eventTalkToNPC(name, npc)
	if npc == "Julia Lynner" then
		showMessage("<V>[Julia Lynner] <N>Bem-vindo(a) ao Quiosque do Raposo Azul. Confira os preços de nossos produtos...<br><br>Espera, eu perdi meu papel com os preços!",name)
	elseif npc == "Brand Northern" then
		showMessage("<V>[Brand Northern] <N>Olha, olha, olha a água mineral, água mineral, água mineral...",name)
	elseif npc == "John Grand" then
		showMessage("<V>[John Grand] <J>Ah! Que delícia, cara!",name)
	elseif npc == "Danniel Victor" then
		showMessage("<V>[Danniel Victor] <N>Esta é a área conhecida como <R>Ilha do Dragão Vermelho.<N><br><br>Debaixo dela existe um recife de plantas muito grande, no qual vários peixes conseguem viver muito bem. É um lugar muito lindo, vale a pena conhecer. Ah, e tome cuidado com a água. Não fique muito tempo dentro do mar. Você pode afundar e não voltar mais.",name)
	elseif npc == "Kenner Henderson" then
		showMessage("<V>[Kenner Henderson] <N>Foi você o <R>fi********* <N>que amarrou aquele pneu nas ligações elétricas?<br><br><VP>Não? Ainda bem. <N>Pois algum ser sem cérebro inventou de colocar um pneu nos fios para tentar fazer uma tirolesa. Como estou furioso por isso...<br><br>Ah, e se está curioso para saber o que é aquela escada, ela dá para o gerador nuclear principal, que fica bem no fundo do mar. Não me aventuraria a descer até lá...",name)
	elseif npc == "Keith Cramer" then
		showMessage("<V>[Keith Cramer] <R>NÃO ESTÁ VENDO QUE ESTA É UMA ÁREA RESTRITA? SAIA DAQUI AGORA! QUER SER INFECTADO(A)? NÃO? ENTÃO SAIA AGORA, C******!",name)
	elseif npc == "Mandery Under" then
		showMessage("<V>[Mandery Under] <N>Ei, o que está fazendo na minha piscina suspensa?! Isso tudo é meu!",name)
	elseif npc == "Katarina Worlynder" then
		showMessage("<V>[Katarina Worlynder] <N>Sou a engenheira que ajudei a construir toda a parte elétrica desta praia, que é 100% ecológica.<br><br>Utilizamos energia renovável para alimentar o bar e as tirolesas, e ao mesmo tempo proteger o meio ambiente. Não é lindo?",name)
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
	elseif npc == "Aaron Grand" then
		showMessage("<V>[Aaron Grand] <N>Esta é a Torre do Nascer do Sol. O lugar mais alto da praia. Daqui dá para ver absolutamente tudo. Incluindo o pôr do sol que é lindo.<br><br>Se eu fosse você, nunca mais sairia daqui. Tenho um baita medo de mar...",name)
	elseif npc == "Daniel Winngs" then
		showMessage("<V>[Daniel Winngs] <N>Seja bem-vindo(a). Você definitivamente está em um lugar privilegiado.<br><br>Esta é uma praia totalmente paradisíaca. Com sua água cristinalina, duas tirolesas e uma piscina suspensa, você não vai querer sair daqui tão cedo.",name)
	elseif npc == "Camille Sanders" then
		showMessage("<V>[Camille Sanders] <N>Me paga um passeio de barco? Tenho um desejo incrível de conhecer este lugar!",name)
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
end
function eventNewGame(name)
	if changed == true then
		for name,_ in next,tfm.get.room.playerList do
			showWater(name)
			showNPCs(name)
		end
		ui.setMapName("Praia da Reserva Verde - <ROSE>Morgana's Mechanical Maps<")
		tfm.exec.setGameTime(3600)
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
	showWater(name)
	showNPCs(name)
	if changed == true then
		ui.setMapName("Praia da Reserva Verde - <ROSE>Morgana's Mechanical Maps<")
	end
	showMessage("<VP><b>Bem-vindo(a) a Praia da Reserva Verde.</b><br><br><p align='left'><N>Este é um mapa-script de praia bem grande e com diversos recursos para se divertir. Aproveite e curta!<br><br><R>Aviso: Este mapa pode consumir até 1,8GB de RAM dependendo de casos específicos.<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para <b>Draw#6691, Soft#1388, Viincenzo#9526, Lacoste#8972, Lipersz#9863, Spectra_phantom#6089, Threshlimit#0000, Star#8558 e Lanadelrey#4862.</b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Praia%20da%20Reserva%20Verde.lua<br><br><N>Revisão 1.6",name)
end
function eventLoop(p,f)
	if changed == true then
		for name,player in next,tfm.get.room.playerList do
			if p >= 6000 then
				if tfm.get.room.playerList[name].y <= 400 and tfm.get.room.playerList[name].x <= 800 and not tfm.get.room.playerList[name].isDead then
					showMessage("<R>Aviso: Não há mais memória disponível para o Transformice. Para poder entrar neste mapa, saia do jogo e entre novamente.",name)
				end
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
for name,_ in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
