for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(32)
shaman=""
alives=0
cannons=4
z=0
data={}
mode="hide"
changed=false
map="@7802869"
xml=''
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
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.chatMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Tradução para o português feita por Rakan_raster#0000. Mapa feito por Morganadxana#0000.",name)
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
xml=tfm.get.room.xmlMapInfo.xml
ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
if changed == true then
ui.removeTextArea(0,nil)
z=-1
cannons=4
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
	["c"]=0;
	["d"]=0;
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
tfm.exec.chatMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Tradução para o português feita por Rakan_raster#0000. Mapa feito por Morganadxana#0000.")
end
end
function eventLoop(p,r)
if changed == true then
ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><J> Version RTM 3132.018 by Spectra_phantom#6089<")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>0"..m..":"..s.."</b>",n,693,27,110,44,0,0,1.0,true)
ui.addTextArea(-2,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>0"..m..":"..s.."</b>",n,690,24,110,44,0,0,1.0,true)
ui.addTextArea(-3,"<font size='14'><font face='Verdana'>remaining time",n,690,60,128,44,0,0,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>0"..m..":0"..s.."</b>",n,693,27,110,44,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>0"..m..":0"..s.."</b>",n,690,24,110,44,0,0,1.0,true)
	ui.addTextArea(-3,"<font size='14'><font face='Verdana'>remaining time",n,690,60,128,44,0,0,1.0,true)
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(31,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>"..alives.."</b>",n,15,27,40,44,0,0,1.0,true)
	ui.addTextArea(30,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>"..alives.."</b>",n,12,24,40,44,0,0,1.0,true)
	ui.addTextArea(32,"<font size='14'><font face='Verdana'>mice(s) remaining",n,9,60,128,44,0,0,1.0,true)
else
	for i=30,32 do
		ui.removeTextArea(i,nil)
	end
end
for n,q in pairs(tfm.get.room.playerList) do
	if data[n] then
		data[n].x=tfm.get.room.playerList[n].x
		data[n].yp=tfm.get.room.playerList[n].y
		if mode == "game" then
			if q.x >= data[shaman].x - 70 and q.x <= data[shaman].x + 70 then
			if q.y >= data[shaman].yp - 70 and q.y <= data[shaman].yp + 70 then
			if not tfm.get.room.playerList[n].isShaman then
			tfm.exec.killPlayer(n)
			end
			end
			end
		end
		if not tfm.get.room.playerList[n].isDead then
			if tfm.get.room.playerList[n].y < 250 then
				if data[n].o < 100 then
					data[n].o=data[n].o+2
				end
				data[n].y=0
			else
				if tfm.get.room.playerList[n].y <= 920 then
					data[n].o=data[n].o-0.4
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 920 and tfm.get.room.playerList[n].y < 1380 then
					data[n].o=data[n].o-0.8
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 1380 then
					data[n].o=data[n].o-1.6
					data[n].c=data[n].c+1
					if data[n].c == 1 then
						tfm.exec.chatMessage("<ROSE>Você está no fundo do lago. A pressão consome o seu rato e faz com que seu oxigênio seja gasto mais rapidamente.",n)
					end
					if data[n].c > 12 then
						data[n].c=0
					end
				end
			end
			if data[n].o <= 0 then
				tfm.exec.killPlayer(n)
				tfm.exec.chatMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
				tfm.exec.addShamanObject(54, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
			end
			if tfm.get.room.playerList[n].x >= 1300 and tfm.get.room.playerList[n].x <= 1500 then
				if tfm.get.room.playerList[n].y >= 690 and tfm.get.room.playerList[n].y <= 840 then
					data[n].o=data[n].o+0.3
				end
			end
			if tfm.get.room.playerList[n].x >= 3380 and tfm.get.room.playerList[n].x <= 3580 then
				if tfm.get.room.playerList[n].y >= 1205 and tfm.get.room.playerList[n].y <= 1355 then
					data[n].o=data[n].o+0.7
				end
			end
			if tfm.get.room.playerList[n].x >= 1530 and tfm.get.room.playerList[n].x <= 1730 then
				if tfm.get.room.playerList[n].y >= 1730 and tfm.get.room.playerList[n].y <= 1880 then
					data[n].o=data[n].o+1.4
				end
			end
		end
		ui.addTextArea(0,"<font size='10'><font face='DejaVu Sans Mono,Consolas'><R>O² Meter | 20 | | <N>| | 40 | | | | 60 | | | | 80 | | | | 100",n,220,20,360,14,0x181818,0x090909,0.7,true)
		if data[n].o > 30 then
			ui.addTextArea(10,"",n,220,40,data[n].o*3.6,3,0x0080ff,0x0060ff,1.0,true)
			data[n].d=0
		elseif data[n].o > 0 then
			ui.addTextArea(10,"",n,220,40,data[n].o*3.6,3,0xff8000,0xff6000,1.0,true)
			data[n].d=data[n].d+1
			if data[n].d == 1 then
				tfm.exec.chatMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
			end
			if data[n].d > 5 then
				data[n].d=0
			end
		elseif data[n].o <= 0 then
			ui.addTextArea(10,"",n,220,40,3,3,0xff8000,0xff6000,1.0,true)
		end
	end
end
if r <= 2000 and mode == "hide" then
	mode="game"
	tfm.exec.setGameTime(150+(alives*5))
	ui.removeTextArea(22,nil)
	tfm.exec.chatMessage("<J>O shaman foi liberado! Salvem-se quem puder!<br><br>As <N>zonas brancas<J> estão <VP>ATIVADAS<J>. Ratos que permanecerem nelas terão seu consumo de oxigênio reduzido quando dentro delas.")
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
	tfm.exec.newGame(xml)
	end
else
	if p >= 4500 and changed == false then
		tfm.exec.disableAutoShaman(false)
		tfm.exec.newGame(xml)
		changed=true
	end
end
end
