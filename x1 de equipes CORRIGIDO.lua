-- Script de X1 entre 4 equipes feito pelo Nasus_assassin#1534. Altere a linha 4 do código, na variável 'admin' pelo seu nickname com #tag
-- Para iniciar o jogo, digite !start. Retornar à tela inicial, digite !reset. Para alterar o limite de vitórias, digite !limit [número]. Alterar o número de times, digite !teams [2-4].
-- Adicionado por Patrick_mahomes#1795.
admin="Morganadxana#0000" -- colocar seu nome aqui!
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
system.disableChatCommandDisplay("start")
system.disableChatCommandDisplay("teams")
estado="inicial"
data={}
mapa="@7772396"
function showText(name)
	for i=41,44 do
		ui.removeTextArea(i,nil)
	end
	ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>Enter on RED team</a></p>", name, 300, 155, 200, 20, 0x800000, 0x600000,1.0,true)
	ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>Enter on BLUE team</a></p>", name, 300, 185, 200, 20, 0x80, 0x60,1.0,true)
	if times >= 3 then
		ui.addTextArea(43, "<p align='center'><a href='event:enter_amarelo'>Enter on YELLOW team</a></p>", name, 300, 215, 200, 20, 0x808000, 0x606000,1.0,true)
	end
	if times >= 4 then
		ui.addTextArea(44, "<p align='center'><a href='event:enter_verde'>Enter on GREEN team</a></p>", name, 300, 245, 200, 20, 0x008000, 0x006000,1.0,true)
	end
end
function eventNewPlayer(name)
	data[name]={time=0}
	if estado == "inicial" then
		if not admin == "" then
			showText(name)
		end
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function ResetMap()
	tfm.exec.newGame(mapa)
	showText()
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
	if message == "start" then
		if name == "Nasus_assassin#1534" or name == admin then
			estado="rodando"
			IniciarJogo()
		end
	end
	if (message:sub(0,5) == "limit") then
		if name == "Nasus_assassin#1534" or name == admin then
			limite=tonumber(message:sub(7))
			tfm.exec.chatMessage("Win limit changed to: "..limite.."")
		end
	end
	if (message:sub(0,5) == "teams") then
		if name == "Nasus_assassin#1534" or name == admin then
			times=tonumber(message:sub(7))
			tfm.exec.newGame(mapa)
		end
	end
end
function eventNewGame()
	pos=0
	for name,player in pairs(tfm.get.room.playerList) do
		if string.find(tfm.get.room.name,name) then
			admin=name
			tfm.exec.chatMessage("<ROSE>Type !start to start the game or !limit [number] to change the victory limit.",name)
		end
	end
	if estado == "inicial" then
		if admin == "" then
			tfm.exec.chatMessage("<VP>The module can't be started. <br>Please check if you inserted correctly your nickname on room name.<br><br>Example: <b>/room #anvilwar00x1#Spectra_phantom#6089</b><br><br>If this is a FunCorp room, verify the nickname typed on the script (including #tag)<br><br>Script disabled.")
		else
			showText()
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
		tfm.exec.movePlayer(name,200,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_azul" then
		tfm.exec.respawnPlayer(name)
		data[name].time=2
		tfm.exec.movePlayer(name,600,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_amarelo" then
		tfm.exec.respawnPlayer(name)
		data[name].time=3
		tfm.exec.movePlayer(name,1000,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "enter_verde" then
		tfm.exec.respawnPlayer(name)
		data[name].time=4
		tfm.exec.movePlayer(name,1400,350,false,0,0,false)
		for i=41,44 do
			ui.removeTextArea(i,name)
		end
		ui.addTextArea(45, "<p align='center'><a href='event:sair'>Leave this team</a></p>", name, 300, 185, 200, 20, 0x808080, 0x606060,1.0,true)
	end
	if callback == "sair" then
		tfm.exec.killPlayer(name)
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(100,1500),75,false,0,0,false)
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
			if score_verde >= limite then
				FinalizarJogo()
			end
		end
	end
end
function eventPlayerDied(n)
local i=0
local n
for pname,player in pairs(tfm.get.room.playerList) do
	if not player.isDead and not player.isShaman then
		i=i+1
		n=pname
	end
end
if i==0 then
	tfm.exec.setGameTime(5)
elseif i==1 then
	tfm.exec.setGameTime(20)
end
end
function eventLoop(passado,faltando)
	if estado == "rodando" then
		if times == 4 then
			ui.setMapName("             Team X1 Script by Nasus  <BL>|  <N>Scores : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b> <N>- <J><b>"..score_amarelo.."</b> <N>- <VP><b>"..score_verde.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Time : <J><b>"..math.ceil(faltando/1000).."s</b><")
		elseif times == 3 then
			ui.setMapName("             Team X1 Script by Nasus  <BL>|  <N>Scores : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b> <N>- <J><b>"..score_amarelo.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Time : <J><b>"..math.ceil(faltando/1000).."s</b><")
		elseif times == 2 then
			ui.setMapName("             Team X1 Script by Nasus  <BL>|  <N>Scores : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Time : <J><b>"..math.ceil(faltando/1000).."s</b><")
		end
		if faltando <= 1 then
			if score_vermelho < limite and score_verde < limite and score_azul < limite and score_amarelo < limite then
				tfm.exec.newGame("#17")
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
	if estado == "inicial" then
		ui.setMapName("                Team X1 Script - Version <N>RTM 0511.003<J> - Made by <ROSE><b>Nasus_assassin#1534</b><")
	end
end
function FinalizarJogo()
	estado="final"
	tfm.exec.newGame("@7277839")
	tfm.exec.chatMessage("<br><N>End of game!")
	if score_vermelho >= limite then
		tfm.exec.chatMessage("<R>The RED team has won the match with "..score_vermelho.." points!")
		ui.setMapName("<R>The RED team has won the match with "..score_vermelho.." points!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 1 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_azul >= limite then
		tfm.exec.chatMessage("<BL>The BLUE team has won the match with "..score_azul.." points!")
		ui.setMapName("<BL>The BLUE team has won the match with "..score_azul.." points!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 2 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_amarelo >= limite then
		tfm.exec.chatMessage("<J>The YELLOW team has won the match with "..score_amarelo.." points!")
		ui.setMapName("<J>The YELLOW team has won the match with "..score_amarelo.." points!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 3 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_verde >= limite then
		tfm.exec.chatMessage("<VP>The GREEN team has won the match with "..score_verde.." points!")
		ui.setMapName("<VP>The GREEN team has won the match with "..score_verde.." points!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 4 then
				tfm.exec.killPlayer(name)
			end
		end
	end
	ResetScores()
	tfm.exec.setGameTime(30)
end
tfm.exec.newGame(mapa)
ResetScores()
