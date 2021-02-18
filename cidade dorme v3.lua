-- NÃO SE ESQUEÇA DE COLOCAR O SEU NOME NA LINHA 3 ANTES DE INICIAR!!
-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.
admin="" -- colocar seu nome aqui, funcorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
data={}
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
modo="inicial"
mapa="@2684847"
contador=0
tfm.exec.setRoomMaxPlayers(48)
system.disableChatCommandDisplay("reiniciar")
system.disableChatCommandDisplay("help")
function eventChatCommand(name,comando)
	if comando == "reiniciar" and name == admin then
		tfm.exec.newGame(mapa)
	end
	if comando == "help" then
		tfm.exec.chatMessage("Bem-vindo ao module Cidade Dorme. Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas. O jogo irá explicar tudo enquanto a partida ocorre.",name)
	end
end
function eventNewGame()
	ui.setMapName("           <b>Cidade Dorme v3</b>  <BL>|  <N>Versão RTM 1311.005 gerenciada por Rakan_raster#0000.<")
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in pairs(tfm.get.room.playerList) do
		jogadores.vivos=jogadores.vivos+1
		data[string.lower(name)]={type=0,morre=false}
		table.insert(jogadores.lista,string.lower(name))
		if string.find(tfm.get.room.name,name) then
			admin=name
			tfm.exec.chatMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar a partida.")
		end
	end
end
function escolherAssasinos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=1
		quant.assasinos=quant.assasinos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como assasino(a). Sua função será matar os outros jogadores. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherMedicos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=2
		quant.medicos=quant.medicos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como médico(a). Sua função será salvar os jogadores dos assasinos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherDetetives(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=3
		quant.detetives=quant.detetives+1
		tfm.exec.chatMessage("Você foi escolhido(a) como detetive. Sua função será descobrir e matar os assasinos vivos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function eventNewPlayer(name)
	data[string.lower(name)]={type=-1,morre=false}
	tfm.exec.chatMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1311.005<br>",name)
end
function eventPlayerDied(name)
	if data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=-1
	end
	if data[string.lower(name)].type == 1 then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 then
		quant.detetives=quant.detetives-1
	end
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	jogadores.vivos=jogadores.vivos-1
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	if data[string.lower(name)].type == 1 and not tfm.get.room.playerList[name].isDead then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 and not tfm.get.room.playerList[name].isDead then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 and not tfm.get.room.playerList[name].isDead then
		quant.detetives=quant.detetives-1
	end
	data[string.lower(name)].type=-1
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
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
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
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
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
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos vivos: <R><b>"..quant.assasinos.."</b>  <BL>|  <J>Detetives vivos: <VP><b>"..quant.detetives.."</b>  <BL>|  <N>Versão RTM 1311.005<")
	end
	if contador == 1 then
		if admin == "" then
			tfm.exec.chatMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00cd3#Spectra_phantom#6089</b><br><br>Em caso de un FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
		else
			if jogadores.vivos >= 5 then
				tfm.exec.chatMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1311.005")
			else
				tfm.exec.chatMessage("<R>Número insuficiente de jogadores na sala. O script requer pelo menos 5 jogadores.")
				contador=-30
			end
		end
	end
	if contador == 35 then
		if jogadores.vivos >= 5 then
			tfm.exec.chatMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><R>POR FAVOR, NINGUÉM DIGA QUEM É QUEM PORQUE ESTRAGA O JOGO!!")
			definirLimites()
		else
			tfm.exec.chatMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=990
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)].type == 0 then
				tfm.exec.chatMessage("<J>Você foi escolhido como vítima.",name)
			end
		end
	end
	if contador == 48 then
		tfm.exec.chatMessage("<J>A rodada será iniciada em 10 segundos! SE PREPAREM!")
		jogadores.vitimas=0
	end
	if contador == 58 then
		tfm.exec.chatMessage("<VP>O JOGO COMEÇOU!")
	end
	if contador == 62 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
			end
		end
	end
	if contador == 92 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,0,"",name,-1710,325,20,true)
			end
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 122 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,0,"",name,-1710,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Hora da verdade... VAMOS VER QUEM MORREU")
	end
	if contador == 127 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
		if jogadores.vitimas == 0 then
			tfm.exec.chatMessage("<VP>Ufa! Ninguém foi morto!")
		end
	end
	if contador == 135 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 140 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 170 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,0,"",name,-1910,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 175 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 180 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=42
		end
	end
	if contador >= 1000 then
		tfm.exec.newGame(mapa)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 60 and contador <= 93 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			jogadores.vitimas=jogadores.vitimas-1
			tfm.exec.chatMessage("Você decidiu matar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
		end
	end
	if id == 102 and contador >= 90 and contador <= 123 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			if data[string.lower(message)].morre == true then
				data[string.lower(message)].morre=false
				jogadores.vitimas=jogadores.vitimas+1
			end
			tfm.exec.chatMessage("Você decidiu salvar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou salvar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
	if id == 103 and contador >= 138 and contador <= 171 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			tfm.exec.chatMessage("Você acha que "..message.." é o assasino.",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
end
tfm.exec.newGame(mapa)
