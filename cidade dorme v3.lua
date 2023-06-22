-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.

admin="" -- colocar seu nome aqui, FunCorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
modo="inicial"; contador=0; rodada=0; data={}; templist={};
mapas={"@3110915","@3148619","@4411212","@4477478","@5832272","@3203198","@5113656","@6380942","@7730312","@7712670","@7896560"}
system.disableChatCommandDisplay("help")
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function showDebugText(text)
	for _,name in next,{"Zed#9431","Viego#0345","Aurelianlua#0000","Skyymellu#0000"} do
		showMessage(text,name)
	end
end
function getTypesPlayers()
	quant={assasinos=0,detetives=0,medicos=0}
	for name,player in next,tfm.get.room.playerList do
		if data[name] and data[name].type == 1 and not tfm.get.room.playerList[name].isDead then
			quant.assasinos=quant.assasinos+1
		end
		if data[name] and data[name].type == 2 and not tfm.get.room.playerList[name].isDead then
			quant.medicos=quant.medicos+1
		end
		if data[name] and data[name].type == 3 and not tfm.get.room.playerList[name].isDead then
			quant.detetives=quant.detetives+1
		end
	end
end
function checkNickname(name)
	for i=1,rawlen(jogadores.lista) do
		if jogadores.lista[i] == name then
			return true
		end
	end
end
function eventChatCommand(name,comando)
	if comando == "reiniciar" then
		if name == "Zed#9431" or name == "Aurelianlua#0000" or name == "Viego#0345" or name == "Skyymellu#0000" or name == admin then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
	if comando == "help" then
		showMessage("<VP><b>Bem-vindo ao module Cidade Dorme.</b><br><br><N>Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas.<br><br>O jogo consiste basicamente em 4 classes de jogadores:<br><R>• Assasinos: <N>São aqueles que irão tentar matar os outros ratos, não importando suas funções.<br><BL>• Médicos: <N>São aqueles que irão tentar salvar os jogadores dos assasinos.<br><VP>• Detetives: <N>São aqueles que irão tentar descobrir e matar os assasinos.<br><J>• Vítimas: <N>Ficam só rezando pra não serem mortos.<br><br>O jogo acaba sempre quando todos os assasinos, detetives ou vítimas são mortos.",name)
	end
end
function eventNewGame()
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.setPlayerScore(name,0,false)
		data[name].type=0
		if string.find(tfm.get.room.name,name) then
			admin=name
			showMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar ou reiniciar a partida.")
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
	rodada=0
	ui.setMapName("<N><b>Cidade Dorme v3</b> <N>- gerenciado por <R>Zed#9431<")
end
function escolherAssasinos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=1
		quant.assasinos=quant.assasinos+1
		showMessage("<J>Você foi escolhido(a) como assasino(a).<br><br>Sua função será matar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja matar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<R>Assasino: "..name.."")
	end
end
function escolherMedicos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=2
		quant.medicos=quant.medicos+1
		showMessage("<J>Você foi escolhido(a) como médico(a).<br><br>Sua função será salvar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<BL>Médico: "..name.."")
	end
end
function escolherDetetives(name)
	if data[name] and data[name].type == 0 then
		data[name].type=3
		quant.detetives=quant.detetives+1
		showMessage("<J>Você foi escolhido(a) como detetive.<br><br>Sua função será de tentar descobrir quem são os assasinos e matar eles. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<VP>Detetive: "..name.."")
	end
end
function eventNewPlayer(name)
	if not data[name] then
		showMessage("<N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e os mate!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script gerenciado por Zed#9431</b><br>Conceito original por Spectra_phantom#6089",name)
	end
	data[name]={type=-1,morre=false}
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if data[name] and data[name].type == 0 then
		data[name].type=-1
	end
	getTypesPlayers()
	for i=1,rawlen(jogadores.lista) do
		if jogadores.lista[i] == name then
			table.remove(jogadores.lista,i)
			jogadores.vivos=jogadores.vivos-1
		end
	end
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in next,tfm.get.room.playerList do
		if not tfm.get.room.playerList[name].isDead then
			table.insert(jogadores.lista,name)
		end
	end
	getTypesPlayers()
	data[name].type=-1
end
function definirLimites()
	if jogadores.vivos < 8 then
		limites.assasinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 8 and jogadores.vivos < 14 then
		limites.assasinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 14 and jogadores.vivos < 20 then
		limites.assasinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 20 and jogadores.vivos < 26 then
		limites.assasinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 26 and jogadores.vivos < 32 then
		limites.assasinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 32 then
		limites.assasinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.detetives do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearDetetives()
end
function sortearAssasinos()
	for i=1,limites.assasinos do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherAssasinos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos: <R><b>"..quant.assasinos.."</b>  <V>|  <J>Detetives: <VP><b>"..quant.detetives.."</b>  <V>|  <J>Médicos: <N><b>"..quant.medicos.."</b>  <V>|  <N>Rodada: <J><b>"..rodada.."</b>  <BL>|  <N><b>Cidade Dorme v3</b><")
	end
	if contador == 3 then
		if admin == "" then
			showMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>No caso de uma sala FunCorp, certifique-se que inseriu o nome corretamente no código.")
			contador=-524288
		else
			showMessage("<N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e os mate!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script gerenciado por Zed#9431</b><br>Conceito original por Spectra_phantom#6089")
		end
	end
	if contador == 10 then
		showMessage("<VP>Digite !help caso não saiba como funciona este jogo.")
	end
	if contador == 35 then
		jogadores.lista={}
		templist={}
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				jogadores.vivos=jogadores.vivos+1
				data[name]={type=0,morre=false}
				table.insert(jogadores.lista,name)
				table.insert(templist,name)
			end
		end
		definirLimites()
		if jogadores.vivos >= 5 then
			showMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><br><ROSE><b>POR FAVOR, NINGUÉM REVELE SUAS FUNÇÕES PORQUE ESTRAGA O JOGO!!</b>")
		else
			showMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=990
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in next,tfm.get.room.playerList do
			if data[name].type == 0 then
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
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 1 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(101,2,"Quem deseja matar?",name,110,220,580,true)
				showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
			end
		end
	end
	if contador == 83 then
		if quant.medicos > 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 1 then
					ui.addPopup(101,0,"",name,-8910,325,20,true)
				end
				if data[name] and data[name].type == 2 and tfm.get.room.playerList[name].isDead == false then
					ui.addPopup(102,2,"Quem deseja salvar dos assasinos?",name,110,220,580,true)
					showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
				end
			end
		else
			contador=107
		end
	end
	if contador == 108 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 2 then
				ui.addPopup(102,0,"",name,-8910,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Hora da verdade! Vamos ver quem morreu...")
	end
	if contador == 115 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<J>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
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
		if quant.assasinos == 0 and quant.detetives == 0 then
			showMessage("<N><b>Todos os assasinos e detetives foram mortos! Temos um empate!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		else
			showMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 125 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 3 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(103,2,"Quem você acha que é o assasino?",name,110,220,580,true)
				showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
			end
		end
	end
	if contador == 150 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 3 then
				ui.addPopup(103,0,"",name,-8910,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 155 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[name].type == 2 then
					showMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[name].type == 3 then
					showMessage("<J>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 160 then
		if quant.assasinos == 0 and quant.detetives == 0 then
			showMessage("<N><b>Todos os assasinos e detetives foram mortos! Temos um empate!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		else
			showMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=42
		end
	end
	if contador >= 1015 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 58 and contador <= 83 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 81 then
				ui.addPopup(101,2,"Quem deseja matar?",name,110,220,580,true)
			end
		else
			if data[message] and data[message].morre == false and tfm.get.room.playerList[message].isDead == false then
				data[message].morre=true
				jogadores.vitimas=jogadores.vitimas+1
				showMessage("Você decidiu matar o jogador "..message..".",name)
				showDebugText(""..name.." decidiu matar o jogador "..message..".")
			end			
		end
	end
	if id == 102 and contador >= 83 and contador <= 108 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 106 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos?",name,110,220,580,true)
			end
		else
			if data[message] and tfm.get.room.playerList[message].isDead == false then
				if data[message].morre == true then
					jogadores.vitimas=jogadores.vitimas-1
				end
				data[message].morre=false
				showMessage("Você decidiu salvar o jogador "..message..".",name)
				showDebugText(""..name.." decidiu salvar o jogador "..message..".")
			end
		end
	end
	if id == 103 and contador >= 125 and contador <= 150 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 148 then
				ui.addPopup(103,2,"Quem você acha que é o assasino?",name,110,220,580,true)
			end
		else
			if data[message] and data[message].morre == false and tfm.get.room.playerList[message].isDead == false then
				data[message].morre=true
				showMessage("Você acha que "..message.." é o assasino.",name)
				showDebugText(""..name.." acha que o assasino é "..message..".")
			end
		end
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
