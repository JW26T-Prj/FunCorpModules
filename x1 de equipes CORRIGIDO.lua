-- Script de x1 entre 4 equipes feito por Nasus_assassin#1534 em Maio de 2020. Altere a linha 4 do código, na variável 'admin' pelo seu nickname com #tag
-- Para iniciar o jogo, digite !iniciar. Retornar à tela inicial, digite !reset. Para alterar o limite de vitórias, digite !limite [número].
-- Adicionado por Patrick_mahomes#1795.
admin="" -- colocar seu nome aqui!
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
times=4
pos=0
play_azul={}
play_vermelho={}
play_verde={}
play_amarelo={}
limite=10
system.disableChatCommandDisplay("reset")
system.disableChatCommandDisplay("iniciar")
estado="inicial"
data={}
mapa='<C><P Ca="" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="ffffffff" H="10" X="400" Y="200" T="12" /><S P="0,0,0.3,0.2,90,0,0,0" L="3000" o="ffffffff" H="10" X="400" Y="200" T="12" /><S P="0,0,0.3,0.2,90,0,0,0" L="3000" o="ffffffff" H="10" X="800" Y="200" T="12" /><S P="0,0,0.3,0.2,90,0,0,0" L="3000" o="ffffffff" H="10" X="0" Y="200" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="ffffffff" H="10" X="440" Y="400" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="ffffffff" H="10" X="480" Y="0" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="73" H="10" X="454" Y="-174" T="0" /></S><D><P X="-400" P="0,0" C="ff0500" Y="-200" T="34" /><P X="-400" P="0,0" C="daff00" Y="200" T="34" /><P X="-360" P="0,0" C="ff0500" Y="-200" T="34" /><P X="1200" P="0,1" C="16ff" Y="-200" T="34" /><P X="1200" P="0,1" C="4bc04" Y="200" T="34" /><DS Y="-196" X="443" /></D><O /></Z></C>'
function eventNewPlayer(name)
	data[name]={time=0}
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function ResetMap()
	tfm.exec.newGame(mapa)
end
function ResetScores()
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].time=0
	end
	score_vermelho=0
	score_azul=0
	score_amarelo=0
	score_verde=0
	play_azul={}
	play_vermelho={}
	play_verde={}
	play_amarelo={}
end
function eventChatCommand(name,message)
	if message == "reset" then
		if name == "Nasus_assassin#1534" or name == admin then
			estado="inicial"
			ResetScores()
			ResetMap()
		end
	end
	if message == "skip" then
		if name == "Nasus_assassin#1534" or name == admin then
			IniciarJogo()
		end
	end
	if message == "iniciar" then
		if name == "Nasus_assassin#1534" or name == admin then
			estado="rodando"
			IniciarJogo()
		end
	end
	if (message:sub(0,6) == "limite") then
		if name == "Nasus_assassin#1534" or name == admin then
			limite=tonumber(message:sub(8))
			tfm.exec.chatMessage("Win limit changed to: "..limite.."")
		end
	end
	if (message:sub(0,5) == "times") then
		if name == "Nasus_assassin#1534" or name == admin then
			times=tonumber(message:sub(7))
		end
	end
end
function showText(name)
	ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>Enter on RED team</a></p>", name, 300, 155, 200, 20, 0x800000, 0x600000,1.0,true)
	ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>Enter on BLUE team</a></p>", name, 300, 185, 200, 20, 0x80, 0x60,1.0,true)
	if times >= 3 then
		ui.addTextArea(43, "<p align='center'><a href='event:enter_amarelo'>Enter on YELLOW team</a></p>", name, 300, 215, 200, 20, 0x808000, 0x606000,1.0,true)
	end
	if times >= 4 then
		ui.addTextArea(44, "<p align='center'><a href='event:enter_verde'>Enter on GREEN team</a></p>", name, 300, 245, 200, 20, 0x008000, 0x006000,1.0,true)
	end
end
function eventNewGame()
	pos=0
	if estado == "inicial" then
		for name,player in pairs(tfm.get.room.playerList) do
			showText(name)
		end
		tfm.exec.setGameTime(36000)
	elseif estado == "rodando" then
		tfm.exec.setGameTime(60)
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].time == 0 then
				tfm.exec.movePlayer(name,400,-2000,false,0,0,false)
			elseif data[name].time == 1 then
				tfm.exec.setNameColor(name,0xff0000)
			elseif data[name].time == 2 then
				tfm.exec.setNameColor(name,0x0000ff)
			elseif data[name].time == 3 then
				tfm.exec.setNameColor(name,0xffff00)
			elseif data[name].time == 4 then
				tfm.exec.setNameColor(name,0x00ff00)
			end
		end
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "enter_vermelho" then
		tfm.exec.respawnPlayer(name)
		data[name].time=1
		tfm.exec.movePlayer(name,200,150,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_azul" then
		tfm.exec.respawnPlayer(name)
		data[name].time=2
		tfm.exec.movePlayer(name,600,150,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_amarelo" then
		tfm.exec.respawnPlayer(name)
		data[name].time=3
		tfm.exec.movePlayer(name,200,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_verde" then
		tfm.exec.respawnPlayer(name)
		data[name].time=4
		tfm.exec.movePlayer(name,600,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "sair" then
		tfm.exec.killPlayer(name)
		data[name].time=0
		ui.removeTextArea(45,true)
		showText(name)
	end
end
function IniciarJogo()
	tfm.exec.newGame("#17")
	for i=41,45 do
		ui.removeTextArea(i,nil)
	end
end
function eventPlayerWon(name)
	pos=pos+1
	if pos == 1 then
		tfm.exec.setGameTime(8)
		if data[name].time == 1 then
			score_vermelho=score_vermelho+1
			tfm.exec.chatMessage("<R>"..name.." scored 1 point to the RED team! This team now have "..score_vermelho.." point(s).")
			if score_vermelho >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 2 then
			score_azul=score_azul+1
			tfm.exec.chatMessage("<BL>"..name.." scored 1 point to the BLUE team! This team now have "..score_azul.." point(s).")
			if score_azul >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 3 then
			score_amarelo=score_amarelo+1
			tfm.exec.chatMessage("<J>"..name.." scored 1 point to the YELLOW team! This team now have "..score_amarelo.." point(s).")
			if score_amarelo >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 4 then
			score_verde=score_verde+1
			tfm.exec.chatMessage("<VP>"..name.." scored 1 point to the GREEN team! This team now have "..score_verde.." point(s).")
			if score_amarelo >= limite then
				FinalizarJogo()
			end
		end
	end
end
function eventLoop(passado,faltando)
	if estado == "rodando" then
		ui.setMapName("<R>"..score_vermelho.." Red <N>- <BL>"..score_azul.." Blue <N>- <J>"..score_amarelo.." Yellow <N>- <VP>"..score_verde.." Green")
		if faltando <= 1 then
			if count_vermelho > 0 and count_azul <= 0 and count_amarelo <= 0 and count_verde <= 0 then
				ResetScores()
				estado="final"
				tfm.exec.newGame("@7277839")
				tfm.exec.chatMessage("<br><N>End of game!")
				tfm.exec.chatMessage("<R>The RED team has won the match with "..score_vermelho.." points!")
				tfm.exec.setGameTime(30)
			elseif count_vermelho <= 0 and count_azul > 0 and count_amarelo <= 0 and count_verde <= 0 then
				ResetScores()
				estado="final"
				tfm.exec.newGame("@7277839")
				tfm.exec.chatMessage("<br><N>End of game!")
				tfm.exec.chatMessage("<BL>The BLUE team has won the match with "..score_azul.." points!")
				tfm.exec.setGameTime(30)
			elseif count_vermelho <= 0 and count_azul <= 0 and count_amarelo > 0 and count_verde <= 0 then
				ResetScores()
				estado="final"
				tfm.exec.newGame("@7277839")
				tfm.exec.chatMessage("<br><N>End of game!")
				tfm.exec.chatMessage("<J>The YELLOW team has won the match with "..score_amarelo.." points!")
				tfm.exec.setGameTime(30)
			elseif count_vermelho <= 0 and count_azul <= 0 and count_amarelo <= 0 and count_verde > 0 then
				ResetScores()
				estado="final"
				tfm.exec.newGame("@7277839")
				tfm.exec.chatMessage("<br><N>End of game!")
				tfm.exec.chatMessage("<VP>The GREEN team has won the match with "..score_verde.." points!")
				tfm.exec.setGameTime(30)
			else
				tfm.exec.newGame("#7")
			end
		end
	end
	if estado == "final" then
		if faltando <= 1 then
			estado="inicial"
			ResetMap()
			ResetScores()
		end
	end
end
function FinalizarJogo()
	estado="final"
	tfm.exec.newGame("@7277839")
	tfm.exec.chatMessage("<br><N>Fim de jogo!")
	if score_vermelho >= limite then
		tfm.exec.chatMessage("<R>The RED team has won the match with "..score_vermelho.." points!")
	elseif score_azul >= limite then
		tfm.exec.chatMessage("<BL>The BLUE team has won the match with "..score_azul.." points!")
	elseif score_amarelo >= limite then
		tfm.exec.chatMessage("<J>The YELLOW team has won the match with "..score_amarelo.." points!")
	elseif score_verde >= limite then
		tfm.exec.chatMessage("<VP>The GREEN team has won the match with "..score_verde.." points!")
	end
	ResetScores()
	tfm.exec.setGameTime(30)
end
ResetMap()
ResetScores()
