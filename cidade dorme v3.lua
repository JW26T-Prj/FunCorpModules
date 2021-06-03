-- NÃO SE ESQUEÇA DE COLOCAR O SEU NOME NA LINHA 3 ANTES DE INICIAR!!
-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.
admin="Rakan_raster#0000" -- colocar seu nome aqui, funcorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
data={}
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
testmode=false
modo="inicial"
mapas={"@2684847","@2637755","@2632876","@1445145","@3110915","@1401751","@3148619","@3793051","@4477478","@5832272","@1445145","@2048617","@1347551","@1389773"}
contador=0
rodada=0
tfm.exec.setRoomMaxPlayers(48)
system.disableChatCommandDisplay("reiniciar")
system.disableChatCommandDisplay("help")
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
function normalizeNickname(name)
	temp_name1=""
	temp_name2=""
	final_name=""
	if string.len(name) < 8 then
		return 0
	else
		temp_name1=string.upper(name:sub(1,1))
		temp_name2=name:sub(2,string.len(name))
		final_name=temp_name1..temp_name2
		if string.find(final_name," ") then
			temp_name1=string.sub(final_name,string.find(final_name," "),string.len(final_name))
			final_name=string.gsub(final_name,temp_name1,"")
		end
	end
	if tfm.get.room.playerList[final_name] then
		return final_name
	else
		return 0
	end
end
function eventChatCommand(name,comando)
	if comando == "reiniciar" and name == admin then
		tfm.exec.newGame(mapa)
	end
	if comando == "help" then
		showMessage("Bem-vindo ao module Cidade Dorme. Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas. O jogo irá explicar tudo enquanto a partida ocorre.",name)
	end
end
function eventNewGame()
	ui.setMapName("           <b>Cidade Dorme v3</b>  <BL>|  <N>Versão RTM 1816.010 gerenciada por Rakan_raster#0000.<")
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in pairs(tfm.get.room.playerList) do
		jogadores.vivos=jogadores.vivos+1
		data[name]={type=0,morre=false}
		table.insert(jogadores.lista,name)
		if string.find(tfm.get.room.name,name) then
			admin=name
			showMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar a partida.")
		end
	end
	rodada=0
end
function escolherAssasinos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=1
		quant.assasinos=quant.assasinos+1
		showMessage("Você foi escolhido(a) como assasino(a). Sua função será matar os outros jogadores. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
		showMessage("<R>Assasino: "..name.."","Viego#0345")
	end
end
function escolherMedicos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=2
		quant.medicos=quant.medicos+1
		showMessage("Você foi escolhido(a) como médico(a). Sua função será salvar os jogadores dos assasinos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
		showMessage("<BL>Médico: "..name.."","Viego#0345")
	end
end
function escolherDetetives(name)
	if data[name] and data[name].type == 0 then
		data[name].type=3
		quant.detetives=quant.detetives+1
		showMessage("Você foi escolhido(a) como detetive. Sua função será descobrir e matar os assasinos vivos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
		showMessage("<VP>Detetive: "..name.."","Viego#0345")
	end
end
function eventNewPlayer(name)
	data[name]={type=-1,morre=false}
	showMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1816.010<br><p align='left'>",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if data[name] and data[name].type == 0 then
		data[name].type=-1
	end
	if data[name] and data[name].type == 1 then
		quant.assasinos=quant.assasinos-1
	elseif data[name] and data[name].type == 2 then
		quant.medicos=quant.medicos-1
	elseif data[name] and data[name].type == 3 then
		quant.detetives=quant.detetives-1
	end
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,name)
	end
	end
	jogadores.vivos=jogadores.vivos-1
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,name)
	end
	end
	if data[name].type == 1 and not tfm.get.room.playerList[name].isDead then
		quant.assasinos=quant.assasinos-1
	elseif data[name].type == 2 and not tfm.get.room.playerList[name].isDead then
		quant.medicos=quant.medicos-1
	elseif data[name].type == 3 and not tfm.get.room.playerList[name].isDead then
		quant.detetives=quant.detetives-1
	end
	data[name].type=-1
end
function definirLimites()
	if jogadores.vivos < 10 then
		limites.assasinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 10 and jogadores.vivos < 16 then
		limites.assasinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 16 and jogadores.vivos < 22 then
		limites.assasinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 22 and jogadores.vivos < 28 then
		limites.assasinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 28 and jogadores.vivos < 38 then
		limites.assasinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 38 then
		limites.assasinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,name)
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,name)
				end
			end
		end
	end
	sortearDetetives()
end
function sortearAssasinos()
	for i=1,limites.assasinos do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherAssasinos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,name)
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos vivos: <R><b>"..quant.assasinos.."</b>  <BL>|  <J>Detetives vivos: <VP><b>"..quant.detetives.."</b>  <BL>|  <J>Rodada atual: <N><b>"..rodada.."</b>  <BL>|  <N>Versão RTM 1816.010<")
	end
	if contador == 1 then
		if admin == "" then
			showMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00cd3#Spectra_phantom#6089</b><br><br>Em caso de um FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
		else
			if jogadores.vivos >= 5 then
				showMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1816.010<br><p align='left'>")
			else
				showMessage("<R>Número insuficiente de jogadores na sala. O script requer pelo menos 5 jogadores.")
				contador=15
			end
		end
	end
	if contador == 35 then
		if jogadores.vivos >= 5 then
			showMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><R>POR FAVOR, NINGUÉM DIGA QUEM É QUEM PORQUE ESTRAGA O JOGO!!")
			definirLimites()
		else
			showMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=990
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in pairs(tfm.get.room.playerList) do
			if data[normalizeNickname(name)].type == 0 then
				showMessage("<J>Você foi escolhido como vítima.",name)
			end
		end
	end
	if contador == 48 then
		showMessage("<J>A rodada será iniciada em 5 segundos! SE PREPAREM!")
		jogadores.vitimas=0
	end
	if contador == 53 then
		showMessage("<VP>O JOGO COMEÇOU!")
		rodada=rodada+1
	end
	if contador == 58 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].type == 1 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
			end
		end
	end
	if contador == 83 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].type == 1 then
				ui.addPopup(101,0,"",name,-1710,325,20,true)
			end
			if data[name] and data[name].type == 2 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 108 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].type == 2 then
				ui.addPopup(102,0,"",name,-1710,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Hora da verdade... VAMOS VER QUEM MORREU")
	end
	if contador == 114 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<R>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
				elseif data[name].type == 2 then
					showMessage("<R>Os assasinos mataram o médico <b>"..name.."!</b>")
				elseif data[name].type == 3 then
					showMessage("<R>Os assasinos mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
		if jogadores.vitimas == 0 then
			showMessage("<VP>Ufa! Ninguém foi morto!")
		end
	end
	if contador == 120 then
		if quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 15 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 15 segundos.")
			contador=985
		else
			showMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 125 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].type == 3 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 150 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].type == 3 then
				ui.addPopup(103,0,"",name,-1910,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 155 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[name].type == 2 then
					showMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[name].type == 3 then
					showMessage("<R>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 160 then
		if quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 15 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 15 segundos.")
			contador=985
		else
			showMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=44
		end
	end
	if contador >= 1000 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 58 and contador <= 83 then
		if normalizeNickname(message) == 0 then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 81 then
				ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
			end
		else
			if data[normalizeNickname(message)] and data[normalizeNickname(message)].morre == false and tfm.get.room.playerList[normalizeNickname(message)].isDead == false then
				data[normalizeNickname(message)].morre=true
				jogadores.vitimas=jogadores.vitimas+1
				showMessage("Você decidiu matar o jogador "..normalizeNickname(message)..".",name)
			end			
		end
	end
	if id == 102 and contador >= 83 and contador <= 108 then
		if normalizeNickname(message) == 0 then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 106 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		else
			if data[normalizeNickname(message)] and tfm.get.room.playerList[normalizeNickname(message)].isDead == false then
				data[normalizeNickname(message)].morre=false
				jogadores.vitimas=jogadores.vitimas-1
				showMessage("Você decidiu salvar o jogador "..normalizeNickname(message)..".",name)
			end
		end
	end
	if id == 103 and contador >= 125 and contador <= 150 then
		if normalizeNickname(message) == 0 then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 148 then
				ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		else
			if data[normalizeNickname(message)] and data[normalizeNickname(message)].morre == false and tfm.get.room.playerList[normalizeNickname(message)].isDead == false then
				data[normalizeNickname(message)].morre=true
				showMessage("Você acha que "..normalizeNickname(message).." é o assasino.",name)
			end
		end
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
