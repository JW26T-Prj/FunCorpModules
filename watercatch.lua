for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(32)
shaman=""; alives=0; cannons=4; z=0; data={}; mode="hide"; changed=false; loop=0; timer=0;
map="@7802869"
xml=''
powerups={x1=-1,x2=-1,x3=-1,x4=-1,y1=-1,y2=-1,y3=-1,y4=-1,t1=0,t2=0,t3=0,t4=0}
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
	tfm.exec.chatMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module e mapa criados por Morganadxana#0000. Tradução para o português feita por Rakan_raster#0000.",name)
end
function eventSummoningEnd(name,id,x,y)
	cannons=cannons-1
	if cannons >= 1 then
		tfm.exec.chatMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
	elseif cannons == 0 then
		tfm.exec.chatMessage("<VP>O shaman não pode mais usar objetos!")
	else
		tfm.exec.chatMessage("<R>O shaman excedeu o limite de objetos utilizáveis!")
		tfm.exec.killPlayer(shaman)
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				powerups.x1=-1
				powerups.y1=-1
				ui.removeTextArea(100,nil)
				if powerups.t1 == 1 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup PRISÃO!")
					dropPlayer(name)
				elseif powerups.t1 == 2 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup OXIGÊNIO!")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t1 == 3 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup VELOCIDADE!")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,60,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-60,0,false)
					end
				elseif powerups.t1 == 4 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup AFUNDAR!")
					tfm.exec.setWorldGravity(0,17.5)
					timer=2.5
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				powerups.x2=-1
				powerups.y2=-1
				ui.removeTextArea(101,nil)
				if powerups.t2 == 1 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup PRISÃO!")
					dropPlayer(name)
				elseif powerups.t2 == 2 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup OXIGÊNIO!")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t2 == 3 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup VELOCIDADE!")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,60,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-60,0,false)
					end
				elseif powerups.t2 == 4 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup AFUNDAR!")
					tfm.exec.setWorldGravity(0,17.5)
					timer=2.5
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				powerups.x3=-1
				powerups.y3=-1
				ui.removeTextArea(102,nil)
				if powerups.t3 == 1 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup PRISÃO!")
					dropPlayer(name)
				elseif powerups.t3 == 2 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup OXIGÊNIO!")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t3 == 3 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup VELOCIDADE!")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,60,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-60,0,false)
					end
				elseif powerups.t3 == 4 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup AFUNDAR!")
					tfm.exec.setWorldGravity(0,17.5)
					timer=2.5
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				powerups.x4=-1
				powerups.y4=-1
				ui.removeTextArea(103,nil)
				if powerups.t4 == 1 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup PRISÃO!")
					dropPlayer(name)
				elseif powerups.t4 == 2 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup OXIGÊNIO!")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t4 == 3 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup VELOCIDADE!")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,60,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-60,0,false)
					end
				elseif powerups.t4 == 4 then
					tfm.exec.chatMessage("<N>"..name.." <J>ativou o powerup AFUNDAR!")
					tfm.exec.setWorldGravity(0,17.5)
					timer=2.5
				end
			end
		end
	end		
end
function eventNewGame()
tfm.exec.chatMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module e mapa criados por Morganadxana#0000. Tradução para o português feita por Rakan_raster#0000.")
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
	["o"]=99;
	["i"]=0;
	["t"]=0;
	["c"]=0;
	};
	data[n] = newData;	
	tfm.exec.bindKeyboard(n,32,true,true)
		if tfm.get.room.playerList[n].isShaman then
		ui.addTextArea(22,"",n,-800,-800,2400,2400,0x000001,0x000001,1.0,true)
		shaman=n
		alives=alives-1
	end
end
tfm.exec.setGameTime(60)
end
end
function genPowerup(pos,type,x,y)
	if pos == 1 then
		ui.addTextArea(100,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x1=x
		powerups.y1=y
		powerups.t1=type
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x2=x
		powerups.y2=y
		powerups.t2=type
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x3=x
		powerups.y3=y
		powerups.t3=type
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x4=x
		powerups.y4=y
		powerups.t4=type
	end
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function eventLoop(p,r)
if changed == true then
ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><J> Versão v1.4.0 - criado por Morganadxana#0000<")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>0"..m..":"..s.."</b>",n,693,27,110,44,0,0,1.0,true)
ui.addTextArea(-2,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>0"..m..":"..s.."</b>",n,690,24,110,44,0,0,1.0,true)
ui.addTextArea(-3,"<font size='14'><font face='Verdana'>tempo restante",n,690,60,128,44,0,0,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>0"..m..":0"..s.."</b>",n,693,27,110,44,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>0"..m..":0"..s.."</b>",n,690,24,110,44,0,0,1.0,true)
	ui.addTextArea(-3,"<font size='14'><font face='Verdana'>tempo restante",n,690,60,128,44,0,0,1.0,true)
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(31,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><font color='#222222'><b>"..alives.."</b>",n,15,27,40,44,0,0,1.0,true)
	ui.addTextArea(30,"<font size='28'><font face='DejaVu Sans Mono,Consolas'><b>"..alives.."</b>",n,12,24,40,44,0,0,1.0,true)
	ui.addTextArea(32,"<font size='14'><font face='Verdana'>rato(s) vivo(s)",n,9,60,128,44,0,0,1.0,true)
	loop=loop+0.5
	if loop == 30 then
		for i=1,4 do
			genPowerup(i,math.random(1,4),math.random(400,2800),math.random(250,1300))
		end
		loop=0
	end
else
	for i=-6,103 do
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
			if timer > 0 then
				timer=timer-0.5
			elseif timer == 0 then
				tfm.exec.setWorldGravity(0,10.5)
			end
			if not tfm.get.room.playerList[n].isDead then
			if data[n].t > 0 then
				data[n].t=data[n].t-0.5
				if data[n].t <= 0 then
					tfm.exec.removeObject(data[n].i)
				end
			end
			if mode == "game" or mode == "hide" then
			if tfm.get.room.playerList[n].y < 250 then
				if data[n].o < 99 then
					data[n].o=data[n].o+1
				end
				data[n].y=0
			else
				if tfm.get.room.playerList[n].y <= 920 then
					data[n].o=data[n].o-0.4
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 920 and tfm.get.room.playerList[n].y < 1380 then
					data[n].o=data[n].o-0.7
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 1380 then
					data[n].o=data[n].o-1
					data[n].c=data[n].c+1
					if data[n].c == 1 then
						tfm.exec.chatMessage("<ROSE>Você está no fundo do lago. A pressão consome o seu rato e faz com que seu oxigênio seja gasto mais rapidamente.",n)
					end
					if data[n].c > 24 then
						data[n].c=0
					end
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
					data[n].o=data[n].o+0.2
				end
			end
			if tfm.get.room.playerList[n].x >= 3380 and tfm.get.room.playerList[n].x <= 3580 then
				if tfm.get.room.playerList[n].y >= 1205 and tfm.get.room.playerList[n].y <= 1355 then
					data[n].o=data[n].o+0.5
				end
			end
		end
		end
		if data[n].o > 30 then
			ui.addTextArea(10,"",n,5,366-(data[n].o*1.5),16,190,0x8000ff,0x6000ff,1.0,true)
			ui.addTextArea(0,"<font size='11'><font face='DejaVu Sans Mono,Consolas'>O² Nível",n,5,195,64,14,0,0,0.7,true)
			ui.addTextArea(-4,"<font size='11'><font face='DejaVu Sans Mono,Consolas'>90<br>-<br>72<br>-<br>54<br>-<br>36<br>-<R><b><br>18<br>-<br>0",n,30,218,39,180,0,0,0.7,true)
			ui.addTextArea(-5,"<font size='25'><p align='center'><font face='DejaVu Sans Mono,Consolas'><font color='#00ff00'>"..math.floor(data[n].o).."",n,30,370,39,39,0x090909,0x000000,0.7,true)
			data[n].d=0
		elseif data[n].o > 0 and mode == "game" then
			ui.addTextArea(10,"",n,5,366-(data[n].o*1.5),16,190,0xff8000,0xff6000,1.0,true)
			ui.addTextArea(0,"<font size='11'><font face='DejaVu Sans Mono,Consolas'>O² Nível",n,5,195,64,14,0,0,0.7,true)
			ui.addTextArea(-4,"<font size='11'><font face='DejaVu Sans Mono,Consolas'>90<br>-<br>72<br>-<br>54<br>-<br>36<br>-<R><b><br>18<br>-<br>0",n,30,218,39,180,0,0,0.7,true)
			ui.addTextArea(-5,"<font size='25'><p align='center'><font face='DejaVu Sans Mono,Consolas'><font color='#00ff00'>"..math.floor(data[n].o).."",n,30,370,39,39,0x090909,0x000000,0.7,true)
			data[n].d=data[n].d+1
			if data[n].d == 1 and data[n].o > 0 then
				tfm.exec.chatMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
			end
			if data[n].d > 5 then
				data[n].d=0
			end
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
