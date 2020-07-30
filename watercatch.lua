tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.setRoomMaxPlayers(30)
shaman=""
alives=0
cannons=3
z=0
data={}
mode="hide"
map="@7710965"
tfm.exec.newGame(map)
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		tfm.exec.chatMessage("<R>O shaman matou todos os ratos e venceu o jogo!<br>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.chatMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			tfm.exec.setPlayerScore(shaman,-1,false)
			mode="end"
			tfm.exec.setGameTime(10)
			for n,p in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
				end
			end
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><b>Bem-vindos ao module #watercatch!</b><br>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Tradução para o português feita por Rakan_raster#0000.",name)
end
function eventSummoningEnd(name,id,x,y)
	cannons=cannons-1
	if cannons >= 1 then
		tfm.exec.chatMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
	elseif cannons == 0 then
		tfm.exec.chatMessage("<VP>O shaman não pode mais usar objetos!")
	else
		tfm.exec.killPlayer(shaman)
	end
end
function eventNewGame()
z=-1
cannons=3
ui.removeTextArea(22,nil)
alives=0
mode="hide"
for n,p in pairs(tfm.get.room.playerList) do
	if n:sub(1,1) == "*" then
		tfm.exec.killPlayer(n)
	end
	alives=alives+1
	newData={
	["x"]=0;
	["yp"]=0;
	["y"]=0;
	["o"]=100;
	};		
 	data[n] = newData;
	tfm.exec.bindKeyboard(n,32,true,true)
		if tfm.get.room.playerList[n].isShaman then
		ui.addTextArea(22,"",n,-1000,-1000,3000,3000,0x000001,0x000001,1.0,true)
		shaman=n
		alives=alives-1
	end
end
tfm.exec.setGameTime(60)
tfm.exec.chatMessage("<J><b>Bem-vindos ao module #watercatch!</b><br>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Tradução para o português feita por Rakan_raster#0000.")
end
function eventLoop(p,r)
ui.setMapName("#watercatch! Version RTM 1924.010 by Spectra_phantom#6089<")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='22'><font face='Bahnschrift'><p align='center'>0"..m.." : "..s.."",nil,340,24,120,28,0x000001,0x000001,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='22'><font face='Bahnschrift'><p align='center'>0"..m.." : 0"..s.."",nil,340,24,120,28,0x000001,0x000001,1.0,true)
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(30,"<font size='16'><font face='Bahnschrift SemiLight'><b>"..alives.."</b> mice(s) remaining",n,20,24,160,24,0x181818,0x090909,1.0,true)
else
ui.removeTextArea(30,nil)
end
for n,q in pairs(tfm.get.room.playerList) do
	if data[n] then
		data[n].x=tfm.get.room.playerList[n].x
		data[n].yp=tfm.get.room.playerList[n].y
		if mode == "game" then
			if q.x >= data[shaman].x - 80 and q.x <= data[shaman].x + 80 then
			if q.y >= data[shaman].yp - 80 and q.y <= data[shaman].yp + 80 then
			if not tfm.get.room.playerList[n].isShaman then
			tfm.exec.killPlayer(n)
			end
			end
			end
		end
		if not tfm.get.room.playerList[n].isDead then
			if tfm.get.room.playerList[n].y < 236 then
				if data[n].o < 100 then
					data[n].o=data[n].o+1
				end
					data[n].y=0
				else
					data[n].y=((tfm.get.room.playerList[n].y-175)/180)^2
						if data[n].y < 10 then
							data[n].o=data[n].o-0.9
						elseif data[n].y > 10 then
							data[n].o=data[n].o-1.8
						end
				if data[n].o <= 0 then
					tfm.exec.killPlayer(n)
					tfm.exec.chatMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
				end
			end
		ui.addTextArea(0,"<font size='15'><font face='Bahnschrift SemiLight'>O²Meter",n,12,372,68,20,0x181818,0x090909,1.0,true)
		if data[n].o > 30 then
			ui.addTextArea(10,"",n,88,388,data[n].o*2,6,0x0080ff,0x0060ff,1.0,true)
		else
			ui.addTextArea(10,"",n,88,388,data[n].o*2,6,0xff8000,0xff6000,1.0,true)
		end
	end
	end
end
if r <= 2000 and mode == "hide" then
	mode="game"
	tfm.exec.setGameTime(150+(alives*2))
	ui.removeTextArea(22,nil)
	tfm.exec.chatMessage("<J>O shaman foi liberado! Salvem-se quem puder!<br><br>As <N>zonas brancas<J> estão desativadas temporariamente.")
end
if r <= 1000 and mode == "game" then
tfm.exec.setGameTime(15)
mode="end"
local lives=0
for n,p in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
	lives=lives+1
	tfm.exec.giveCheese(n)
	tfm.exec.playerVictory(n)
	end
end
tfm.exec.chatMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
end
if r <= 1 and mode == "end" then
tfm.exec.newGame(map)
end
end