for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7903160")
data={}; changed=false; xml2='';

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function showNPCs()
	tfm.exec.addNPC("Julia Lynner",{title = 382, look = "1;228,50,72,0,50_d946a7,90,44,0,0",x = 10032,y = 989,female = true,lookLeft = false,lookAtPlayer = false,interactive = true})
	tfm.exec.addNPC("Brand Northern",{title = 357, look = "1;225,0,46,34,26,104_3c3a87+6e7291+a5a7c1+caccdd+7582b3+f3f5f7,49,0,0",x = 10259,y = 875,female = false,lookLeft = false,lookAtPlayer = false,interactive = true})
	tfm.exec.addNPC("John Grand",{title = 298, look = "1;231,8,7,34,5,105,0,0,33",x = 9236,y = 1106,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Danniel Victor",{title = 296, look = "1;194,29,27,41,54,103,33,81,57",x = 3172,y = 1202,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Kenner Henderson",{title = 266, look = "27;236,45,22,0,44,0,50,67,35",x = 751,y = 1263,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Keith Cramer",{title = 216, look = "7;190_220b04+767576+585155+c44444+e0ddce+202020+e7e6e5,6_1d1c1c+464646,5_70707+d4c316,9,54,94,36,0,20",x = 567,y = 2925,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
end
function showWater(name)
	for i=0,1 do
		tfm.exec.addImage("181f9cf5fc5.png", "?1", -800+(i*7180), 1387, name, 1.0, 1.0, 0, 1.0)
		tfm.exec.addImage("181f9cf5fc5.png", "!1", -800+(i*7180), 1387, name, 1.0, 1.0, 0, 0.7)
		tfm.exec.addImage("181f9cfac65.png", "!1", -800+(i*7180), 1445, name, 10, 6, 0, 1.0)
	end
	for b=0,4 do
		for c=0,4 do
			tfm.exec.addImage("181f9cff961.jpg","?1",-800+(b*1795),1445+(c*860),name)
		end
	end
	for h=0,4 do
		tfm.exec.addImage("1803e8e2250.jpg","?1",-1200+(h*2169),1050,name,1,0.75,0,1)
	end
	for k=0,6 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(500,7500),math.random(150,700),name)
	end
	for l=0,6 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(500,7500),math.random(150,700),name)
	end
	for m=0,6 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(500,7500),math.random(150,700),name)
	end
	for n=0,4 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(7500,10000),math.random(50,300),name)
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
		end
		showNPCs()
		ui.setMapName("<VP>Praia da Reserva Verde")
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
	newData={
	["z"]=1;
	};
	data[name] = newData;
	if changed == true then
		ui.setMapName("Praia da Reserva Verde")
	end
	showMessage("<VP><b>Bem-vindo(a) a Praia da Reserva Verde.</b><br><br><p align='left'><N>Este é um mapa-script de praia bem grande e com diversos recursos para se divertir. Aproveite e curta!<br><br><R>Aviso: Este mapa pode consumir até 1,8GB de RAM dependendo de casos específicos.<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para <b>Draw#6691, Soft#1388, Viincenzo#9526, Lacoste#8972, Lipersz#9863, Spectra_phantom#6089, Threshlimit#0000, Star#8558 e Lanadelrey#4862.</b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Praia%20da%20Reserva%20Verde.lua",name)
end
function eventLoop(p,f)
	if changed == true then
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].y >= 1399 then
				if data[name].z <= 1.53 then
					data[name].z=data[name].z+0.005
				end
			else
				data[name].z=1
			end
			tfm.exec.setPlayerGravityScale(name,data[name].z)
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
