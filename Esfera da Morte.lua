for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","AutoScore"} do
	tfm.exec["disable"..f](true)
end
mapa="@7913260"; vivo=0; rato=0; match_count=0; last_death=""; data={}; highest_score=0;

function reset()
	tfm.exec.newGame(mapa)
	min1=0; seg1=0; seg2=0; loop=0;
end

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,temp_text,name,250,310,300)
	end
end

function eventNewPlayer(name)
	newData={
	["current_time"]=0;
	["highest_time"]=0;
	}
	data[name] = newData;
	showMessage("<R><b>Bem-vindo ao module Esfera da Morte!</b><br><br><N>Este é um jogo bem simples, onde o objetivo é correr contra a esfera e ficar vivo pelo maior tempo possível!<br><br><VP>Ideia original de Dhanny_mheyran#6701, desenvolvido por Morganadxana#0000.")
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

function eventNewGame()
	vivo=0; rato=0;
	match_count=match_count+1
	if tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,"",nil,-1280,-1024,20)
	end
	for name,player in next,tfm.get.room.playerList do
		vivo=vivo+1; rato=rato+1;
		data[name].current_time=0;
	end
	tfm.exec.setGameTime(595)
end

function eventLoop(p,f)
	ui.addTextArea(0,"<p align='center'><font face='Verdana'><font size='54'><font color='#000000'>"..min1..":"..seg1..""..seg2.."", nil, 306, 203, 190, 66, 0xffffff, 0xffffff, 1.0, true)
	ui.setMapName("<R>Esfera da Morte - <N>Module feito por Morganadxana#0000   <G>|   <N>Ratos : <V>"..vivo.." <N>/ <J>"..rato.."<")
	if vivo >= 1 then
		loop=loop+0.5
		if loop == 1 then
			seg2=seg2+1
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isDead then
					data[name].current_time=data[name].current_time+1
					if data[name].current_time > data[name].highest_time then
						data[name].highest_time=data[name].current_time
					end
				end
			end
		if seg2 >= 10 then
			seg2=0;	seg1=seg1+1
			if seg1 >= 6 then
				min1=min1+1; seg1=0; seg2=0;
			end
		end
		loop=0;
		end
	end
	if f <= 1 then
		reset()
	end
end

function eventPlayerDied(name)
	last_death=name
	vivo=vivo-1
	if vivo == 0 then
		if min1 == 0 then
			showMessage("<J><b>"..last_death.."</b> foi o(a) melhor jogador(a), ficando vivo por "..seg1..""..seg2.." segundos!")
		else
			showMessage("<J><b>"..last_death.."</b> foi o(a) melhor jogador(a), ficando vivo por "..min1.." minuto(s) e "..seg1..""..seg2.." segundos!")
		end
		tfm.exec.setGameTime(15)
	end
	tfm.exec.setPlayerScore(name,data[name].highest_time,false)
end

function eventPlayerLeft()
	rato=rato-1
end

reset()
