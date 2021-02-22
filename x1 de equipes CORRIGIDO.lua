-- Script de X1 entre 4 equipes antes pertencence a Nasus_assassin#1534, agora gerenciado por Rakan_raster#0000.
-- Altere a linha 4 do código, na variável 'admin' pelo seu nickname com #tag
-- Para iniciar o jogo, digite !start. Retornar à tela inicial, digite !reset. Para alterar o limite de vitórias, digite !limit [número]. Alterar o número de times, digite !teams [2-4].
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
system.disableChatCommandDisplay("start")
system.disableChatCommandDisplay("teams")
estado="inicial"
data={}
mapa="@7772396"
function showText(name)
	for i=41,44 do
		ui.removeTextArea(i,nil)
	end
	ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>Entrar no time VERMELHO</a></p>", name, 300, 155, 200, 20, 0x800000, 0x600000,1.0,true)
	ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>Entrar no time AZUL</a></p>", name, 300, 185, 200, 20, 0x80, 0x60,1.0,true)
	if times >= 3 then
		ui.addTextArea(43, "<p align='center'><a href='event:enter_amarelo'>Entrar no time AMARELO</a></p>", name, 300, 215, 200, 20, 0x808000, 0x606000,1.0,true)
	end
	if times >= 4 then
		ui.addTextArea(44, "<p align='center'><a href='event:enter_verde'>Entrar no time VERDE</a></p>", name, 300, 245, 200, 20, 0x008000, 0x006000,1.0,true)
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
			tfm.exec.chatMessage("Limite de vitórias alterado para: "..limite.."")
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
			tfm.exec.chatMessage("<ROSE>Digite !start para iniciar a partida ou !limit [number] para alterar o limite de vitórias.",name)
		end
	end
	if estado == "inicial" then
		if admin == "" then
			tfm.exec.chatMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00x1#Rakan_raster#0000</b><br><br>Em caso de um FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
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
			tfm.exec.chatMessage("<R>"..name.." marcou ponto para o time VERMELHO! O time agora possui "..score_vermelho.." ponto(s).")
			if score_vermelho >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 2 then
			score_azul=score_azul+1
			tfm.exec.chatMessage("<BL>"..name.." marcou ponto para o time AZUL! O time agora possui "..score_azul.." ponto(s).")
			if score_azul >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 3 then
			score_amarelo=score_amarelo+1
			tfm.exec.chatMessage("<J>"..name.." marcou ponto para o time AMARELO! O time agora possui "..score_amarelo.." ponto(s).")
			if score_amarelo >= limite then
				FinalizarJogo()
			end
		elseif data[name].time == 4 then
			score_verde=score_verde+1
			tfm.exec.chatMessage("<VP>"..name.." marcou ponto para o time VERDE! O time agora possui "..score_verde.." ponto(s).")
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
			ui.setMapName("             Script de X1 de Equipes  <BL>|  <N>Pontos : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b> <N>- <J><b>"..score_amarelo.."</b> <N>- <VP><b>"..score_verde.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Tempo : <J><b>"..math.ceil(faltando/1000).."s</b><")
		elseif times == 3 then
			ui.setMapName("             Script de X1 de Equipes  <BL>|  <N>Pontos : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b> <N>- <J><b>"..score_amarelo.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Tempo : <J><b>"..math.ceil(faltando/1000).."s</b><")
		elseif times == 2 then
			ui.setMapName("             Script de X1 de Equipes  <BL>|  <N>Pontos : <R><b>"..score_vermelho.."</b> <N>- <BL><b>"..score_azul.."</b><N> / <ROSE><b>"..limite.."</b>  <BL>|  <N>Tempo : <J><b>"..math.ceil(faltando/1000).."s</b><")
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
		ui.setMapName("         Script de X1 de Equipes - Versão <N>RTM 0612.004<J> - Desenvolvido por <ROSE><b>Rakan_raster#0000</b><")
	end
end
function FinalizarJogo()
	estado="final"
	tfm.exec.newGame("@7277839")
	tfm.exec.chatMessage("<br><N>Fim de jogo!")
	if score_vermelho >= limite then
		tfm.exec.chatMessage("<R>O time VERMELHO é o grande vencedor com "..score_vermelho.." pontos!")
		ui.setMapName("<R>O time VERMELHO é o grande vencedor com "..score_vermelho.." pontos!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 1 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_azul >= limite then
		tfm.exec.chatMessage("<BL>O time AZUL é o grande vencedor com "..score_azul.." pontos!")
		ui.setMapName("<BL>O time AZUL é o grande vencedor com "..score_azul.." pontos!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 2 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_amarelo >= limite then
		tfm.exec.chatMessage("<J>O time AMARELO é o grande vencedor com "..score_amarelo.." pontos!")
		ui.setMapName("<J>O time AMARELO é o grande vencedor com "..score_amarelo.." pontos!<")
		for name,player in pairs(tfm.get.room.playerList) do
			if not data[name].time == 3 then
				tfm.exec.killPlayer(name)
			end
		end
	elseif score_verde >= limite then
		tfm.exec.chatMessage("<VP>O time VERDE é o grande vencedor com "..score_verde.." pontos!")
		ui.setMapName("<VP>O time VERDE é o grande vencedor com "..score_verde.." pontos!<")
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
