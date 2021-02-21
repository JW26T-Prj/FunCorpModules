-- Module Arrows originalmente criado por Linkventusx5 (atual Shun_kazami#7014) e atualizado por Patrick_mahomes#1795 e Yone#5530.
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(35)
id=0;
round=10;
tempo=800;
faltando=0;
data={}
valendo=false
chars={"←","↑","→","↓"}
caracteres={c1="",c2="",c3="",c4="",c5="",c6="",c7="",c8="",c9="",c10="",c11="",c12=""}
setas={c1={0,0},c2={0,0},c3={0,0},c4={0,0},c5={0,0},c6={0,0},c7={0,0},c8={0,0},c9={0,0},c10={0,0},c11={0,0},c12={0,0}}
mapa='<C><P DS="m;200,340,600,340" F="0" /><Z><S><S L="40" X="780" H="80" Y="350" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="20" H="80" Y="354" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="800" H="20" Y="390" T="6" X="400" /><S L="800" X="400" H="20" Y="320" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="80" H="80" Y="250" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="720" H="80" Y="250" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="680" X="400" H="20" Y="201" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="377" X="401" /></D><O /></Z></C>'
function eventNewGame()
	tfm.exec.chatMessage("<ROSE><b>Bem-vindo ao module #arrows!</b><br><J>O objetivo da sala é simples. Você deve fazer a sequência de setas conforme pede o jogo antes que a barra vermelha termine.<br><br>Module criado originalmente por <N><b>Shun_kazami#7014</b> e <J>atualizado por <N><b>Patrick_mahomes#1795 e Yone#5530</b><J>.<br><R>Versão 2.0.3",name)
	for i=0, 15 do
			ui.removeTextArea(i,nil)
		end
	round=0
	for name,player in pairs(tfm.get.room.playerList) do
		newData={
			["step"]=0;
			["c"]=0;
			}
		data[name]=newData;
		for i=30, 87 do
			tfm.exec.bindKeyboard(name,i,false,false)
		end
	end
	valendo=false;
	tfm.exec.setGameTime(15)
end
function eventKeyboard(name,id)
	if valendo == true then
		if faltando > 6000 then
			if tfm.get.room.playerList[name].y < 320 then
			if data[name].step == 1 then
				if id == setas.c1[1] or id == setas.c1[2] then
					data[name].step=2
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 2 then
				if id == setas.c2[1] or id == setas.c2[2] then
					data[name].step=3
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 3 then
				if id == setas.c3[1] or id == setas.c3[2] then
					data[name].step=4
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 4 then
				if id == setas.c4[1] or id == setas.c4[2] then
					if round <= 10 then
						tfm.exec.movePlayer(name,400,350,false,0,0,false)
						data[name].step=0
						data[name].c=1
					else
						data[name].step=5
					end
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 5 then
				if id == setas.c5[1] or id == setas.c5[2] then
					data[name].step=6
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 6 then
				if id == setas.c6[1] or id == setas.c6[2] then
					data[name].step=7
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 7 then
				if id == setas.c7[1] or id == setas.c7[2] then
					data[name].step=8
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 8 then
				if id == setas.c8[1] or id == setas.c8[2] then
					if round > 10 and round <= 20 then
						tfm.exec.movePlayer(name,400,350,false,0,0,false)
						data[name].step=0
						data[name].c=1
					else
						data[name].step=9
					end
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 9 then
				if id == setas.c9[1] or id == setas.c9[2] then
					data[name].step=10
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 10 then
				if id == setas.c10[1] or id == setas.c10[2] then
					data[name].step=11
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 11 then
				if id == setas.c11[1] or id == setas.c11[2] then
					data[name].step=12
				else
					tfm.exec.killPlayer(name)
				end
			elseif data[name].step == 12 then
				if id == setas.c12[1] or id == setas.c12[2] then
					tfm.exec.movePlayer(name,400,350,false,0,0,false)
					data[name].step=0
					data[name].c=1
				else
					tfm.exec.killPlayer(name)
				end
			end
		end
	else
		tfm.exec.newGame(mapa)
	end
end
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname end	end
	if i==0 then
		tfm.exec.chatMessage("<R>Não tivemos vencedores!")
		tfm.exec.newGame(mapa)
		valendo=false
		tempo=999
	elseif i==1 then
		tfm.exec.chatMessage("<J>"..n.." foi o vencedor!")
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setPlayerScore(n,10,true)
		tfm.exec.newGame(mapa)
		valendo=false
		tempo=999
 end end
function eventNewPlayer(name)
	for name,player in pairs(tfm.get.room.playerList) do
		newData={
			["step"]=1;
			}
		data[name]=newData;
	for i={37,65}, 87 do
		tfm.exec.bindKeyboard(name,i,false,false)
	end
	end
end
function eventLoop(p,f)
	ui.setMapName("Arrows! <N><b>v2.0.3</b>  <G>|   <N>Round : <V>"..round.."  <G>|  <N>Desenvolvido por <VP><b>Patrick_mahomes#1795 e Yone#5530</b><")
	faltando=f;
	if f < 1 then
		if valendo == false then
			for name,player in pairs(tfm.get.room.playerList) do
				data[name].step=0
				for i=30, 87 do
					tfm.exec.bindKeyboard(name,i,false,true)
				end
			end
			valendo=true
		end
	end
	if valendo == true then
		if round <= 5 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars1()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-80
		end
		if round > 5 and round <= 10 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars1()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-100
		end
		if round > 10 and round <= 15 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars2()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-80
		end
		if round > 15 and round <= 20 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars2()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-100
		end
		if round > 20 and round <= 25 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars3()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-100
		end
		if round > 25 then
			if f < 1 then
				round=round+1
				tempo=800
				setChars3()
				tfm.exec.setGameTime(36000)
				for name,player in pairs(tfm.get.room.playerList) do
					data[name].step=1
					data[name].c=0
					tfm.exec.movePlayer(name,400,260,false,0,0,false)
				end
			end
			tempo=tempo-160
		end
		if tempo > 0 then
			ui.addTextArea(0,"",nil,0,150,tempo,20,0xff0000,0xff0000,0.9,true)
		else
			for name,player in pairs(tfm.get.room.playerList) do
				if faltando > 4000 then
				if tfm.get.room.playerList[name].y < 320 and data[name].c == 0 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.setPlayerScore(name,1,true)
				end
				end
			end
			ui.removeTextArea(0,nil)
		end
	end
	if tempo == 0 then
		tempo=999
		for i=0, 14 do
			ui.removeTextArea(i,nil)
		end
		tfm.exec.setGameTime(5)
		valendo=false
	end
end
function setKeys()
	if caracteres.c1 == "←" then
		setas.c1={37,65}
	elseif caracteres.c1 == "↑" then
		setas.c1={38,87}
	elseif caracteres.c1 == "→" then
		setas.c1={39,68}
	elseif caracteres.c1 == "↓" then
		setas.c1={40,83}
	end
	if caracteres.c2 == "←" then
		setas.c2={37,65}
	elseif caracteres.c2 == "↑" then
		setas.c2={38,87}
	elseif caracteres.c2 == "→" then
		setas.c2={39,68}
	elseif caracteres.c2 == "↓" then
		setas.c2={40,83}
	end
	if caracteres.c3 == "←" then
		setas.c3={37,65}
	elseif caracteres.c3 == "↑" then
		setas.c3={38,87}
	elseif caracteres.c3 == "→" then
		setas.c3={39,68}
	elseif caracteres.c3 == "↓" then
		setas.c3={40,83}
	end
	if caracteres.c4 == "←" then
		setas.c4={37,65}
	elseif caracteres.c4 == "↑" then
		setas.c4={38,87}
	elseif caracteres.c4 == "→" then
		setas.c4={39,68}
	elseif caracteres.c4 == "↓" then
		setas.c4={40,83}
	end
	if caracteres.c5 == "←" then
		setas.c5={37,65}
	elseif caracteres.c5 == "↑" then
		setas.c5={38,87}
	elseif caracteres.c5 == "→" then
		setas.c5={39,68}
	elseif caracteres.c5 == "↓" then
		setas.c5={40,83}
	end
	if caracteres.c6 == "←" then
		setas.c6={37,65}
	elseif caracteres.c6 == "↑" then
		setas.c6={38,87}
	elseif caracteres.c6 == "→" then
		setas.c6={39,68}
	elseif caracteres.c6 == "↓" then
		setas.c6={40,83}
	end
	if caracteres.c7 == "←" then
		setas.c7={37,65}
	elseif caracteres.c7 == "↑" then
		setas.c7={38,87}
	elseif caracteres.c7 == "→" then
		setas.c7={39,68}
	elseif caracteres.c7 == "↓" then
		setas.c7={40,83}
	end
	if caracteres.c8 == "←" then
		setas.c8={37,65}
	elseif caracteres.c8 == "↑" then
		setas.c8={38,87}
	elseif caracteres.c8 == "→" then
		setas.c8={39,68}
	elseif caracteres.c8 == "↓" then
		setas.c8={40,83}
	end
	if caracteres.c9 == "←" then
		setas.c9={37,65}
	elseif caracteres.c9 == "↑" then
		setas.c9={38,87}
	elseif caracteres.c9 == "→" then
		setas.c9={39,68}
	elseif caracteres.c9 == "↓" then
		setas.c9={40,83}
	end
	if caracteres.c10 == "←" then
		setas.c10={37,65}
	elseif caracteres.c10 == "↑" then
		setas.c10={38,87}
	elseif caracteres.c10 == "→" then
		setas.c10={39,68}
	elseif caracteres.c10 == "↓" then
		setas.c10={40,83}
	end
	if caracteres.c11 == "←" then
		setas.c11={37,65}
	elseif caracteres.c11 == "↑" then
		setas.c11={38,87}
	elseif caracteres.c11 == "→" then
		setas.c11={39,68}
	elseif caracteres.c11 == "↓" then
		setas.c11={40,83}
	end
	if caracteres.c12 == "←" then
		setas.c12={37,65}
	elseif caracteres.c12 == "↑" then
		setas.c12={38,87}
	elseif caracteres.c12 == "→" then
		setas.c12={39,68}
	elseif caracteres.c12 == "↓" then
		setas.c12={40,83}
	end
end
function setChars1()
	caracteres.c1=chars[math.random(#chars)]
	caracteres.c2=chars[math.random(#chars)]
	caracteres.c3=chars[math.random(#chars)]
	caracteres.c4=chars[math.random(#chars)]
	ui.addTextArea(1,"<font size='60'>"..caracteres.c1.."",nil,150,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(2,"<font size='60'>"..caracteres.c2.."",nil,300,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(3,"<font size='60'>"..caracteres.c3.."",nil,450,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(4,"<font size='60'>"..caracteres.c4.."",nil,600,50,70,80,0x000001,0x000001,1.0,true)
	setKeys()
end
function setChars2()
	caracteres.c1=chars[math.random(#chars)]
	caracteres.c2=chars[math.random(#chars)]
	caracteres.c3=chars[math.random(#chars)]
	caracteres.c4=chars[math.random(#chars)]
	caracteres.c5=chars[math.random(#chars)]
	caracteres.c6=chars[math.random(#chars)]
	caracteres.c7=chars[math.random(#chars)]
	caracteres.c8=chars[math.random(#chars)]
	ui.addTextArea(1,"<font size='60'>"..caracteres.c1.."",nil,140,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(2,"<font size='60'>"..caracteres.c2.."",nil,210,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(3,"<font size='60'>"..caracteres.c3.."",nil,270,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(4,"<font size='60'>"..caracteres.c4.."",nil,340,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(5,"<font size='60'>"..caracteres.c5.."",nil,410,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(6,"<font size='60'>"..caracteres.c6.."",nil,480,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(7,"<font size='60'>"..caracteres.c7.."",nil,550,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(8,"<font size='60'>"..caracteres.c8.."",nil,620,50,70,80,0x000001,0x000001,1.0,true)
	setKeys()
end
function setChars3()
	caracteres.c1=chars[math.random(#chars)]
	caracteres.c2=chars[math.random(#chars)]
	caracteres.c3=chars[math.random(#chars)]
	caracteres.c4=chars[math.random(#chars)]
	caracteres.c5=chars[math.random(#chars)]
	caracteres.c6=chars[math.random(#chars)]
	caracteres.c7=chars[math.random(#chars)]
	caracteres.c8=chars[math.random(#chars)]
	caracteres.c9=chars[math.random(#chars)]
	caracteres.c10=chars[math.random(#chars)]
	caracteres.c11=chars[math.random(#chars)]
	caracteres.c12=chars[math.random(#chars)]
	ui.addTextArea(1,"<font size='60'>"..caracteres.c1.."",nil,20,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(2,"<font size='60'>"..caracteres.c2.."",nil,90,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(3,"<font size='60'>"..caracteres.c3.."",nil,160,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(4,"<font size='60'>"..caracteres.c4.."",nil,230,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(5,"<font size='60'>"..caracteres.c5.."",nil,300,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(6,"<font size='60'>"..caracteres.c6.."",nil,370,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(7,"<font size='60'>"..caracteres.c7.."",nil,440,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(8,"<font size='60'>"..caracteres.c8.."",nil,510,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(9,"<font size='60'>"..caracteres.c9.."",nil,580,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(10,"<font size='60'>"..caracteres.c10.."",nil,650,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(11,"<font size='60'>"..caracteres.c11.."",nil,720,50,70,80,0x000001,0x000001,1.0,true)
	ui.addTextArea(12,"<font size='60'>"..caracteres.c12.."",nil,790,50,70,80,0x000001,0x000001,1.0,true)
	setKeys()
end
tfm.exec.newGame(mapa)
