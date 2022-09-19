admin="" -- Insira seu nome aqui, FunCorp! / Insert your name here, FunCorp!

data={}; recorde=0; recorder="----"; changed=false; xml2='';
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f]()
end
tfm.exec.newGame('@7916202')
ui.setBackgroundColor("#000000")
system.disableChatCommandDisplay("reset")
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end
function updateBar()
	ui.setMapName("<D>Salto em Distância <V><b>II</b>   <G>|   <N>Recorde : <J><b>"..recorder.."</b> ("..recorde..")<")
end
function eventNewGame()
	if changed == false then
		xml2=tfm.get.room.xmlMapInfo.xml
		ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		tfm.exec.setGameTime(5)
	else
		ui.removeTextArea(0,nil)
	end
end
function eventChatCommand(n,m)
	if n == "Patrick_mahomes#1795" or n == "Forzaldenon#0000" or n == "Akwimos#1937" or n == admin then
		if m == "reset" then
			showMessage("Todas as pontuações e o recorde foram reiniciados.",nil)
			recorde=0
			recorder="----";
			for _,i in next,{3,4,5,80,81} do
				ui.removeTextArea(i,name)
			end
			for name,player in pairs(tfm.get.room.playerList) do
				data[name].recorde=0
				tfm.exec.setPlayerScore(name,0,false)
			end
			updateBar()
			ui.removeTextArea(80,nil)
			ui.removeTextArea(81,nil)
		end
	end
end
function eventPlayerDied(n)
	resetPlayer(n)
end
function resetPlayer(name)
	if changed == true then
		data[name].loop=0
		tfm.exec.setPlayerGravityScale(name,1)
		tfm.exec.freezePlayer(name,false)
		if data[name] then
			data[name].freezed=false
		end
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.movePlayer(name,80,5250,false,0,0,false)
	end
end
function eventNewPlayer(n)
	if n:sub(1,1) == "*" then
		showMessage("<R>Jogadores convidados (souris) não são permitidos neste jogo.",n)
	else
		newData={
		["x"]=0;
		["position"]=0;
		["x2"]=0;
		["sc"]=0;
		["recorde"]=0;
		["freezed"]=false;
		["loop"]=0;
		}
		data[n]=newData;
	
		tfm.exec.respawnPlayer(n)
		tfm.exec.giveCheese(n)
		data[n].loop=0
		ui.addTextArea(1,"<font size='18'><b><font face='Courier New'>0 ||||||| 5000 |||||| 10000 ||||||| 15000 |||||| 20000 ||||>",nil,20,20,670,20,0x000001,0x000001,0.8,true)
		for i=1,50 do
			local a=500*i
			ui.addTextArea(100+i,"<p align='center'><b><font size='14'><font color='#000001'>"..a.."",n,a+780,5430,60,20,0,0,1.0,false)
		end
		ui.setBackgroundColor("#000000")
		tfm.exec.setPlayerScore(n,0,false)
		showMessage("<VP>Jogo de salto em distância feito por Patrick_mahomes#1795, Akwimos#1937, Dhanny_mheyran#6701 e Threshlimit#0000. <b>Versão 2.0</b><br><br><BL>Imagens enviadas por Spectra_phantom#6089 e Morganadxana#0000<br><br><N>Digite /mort para retornar ao ponto inicial sempre que necessário.",n)
		for a=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,700),n) end
		for b=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,700),n,-1,1) end
		for c=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,700),n) end
		for d=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,700),n,-1,1) end
		for e=1,40 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(100,20000),math.random(-350,1250),n) end
		for w=0,18 do
			tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for x=0,18 do
			tfm.exec.addImage("181ba86195e.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for y=0,18 do
			tfm.exec.addImage("181ba86655c.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for z=0,18 do
			tfm.exec.addImage("181ba86b15a.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for j=0,23 do
			for i=0,1 do
				tfm.exec.addImage("181b9de5c95.png","?1",-800+(j*1080),-500+(i*1080),n)
			end
		end
		tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,710,n,38,4.9,0,1)
		updateBar()
	end
	resetPlayer(n)
end
function eventLoop(e,r)
	if changed == true and e >= 3000 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].loop <= 11 then
				data[name].loop=data[name].loop+1
			end
			ui.addTextArea(6,"<p align='center'><font size='20'><b><font color='#008000'><font face='Courier New'>"..data[name].recorde.."",name,700,68,80,22,0x00ff00,0x00ff00,0.9,true)
			ui.addTextArea(7,"<p align='center'><font size='20'><b><font color='#800080'><font face='Courier New'>"..recorde.."",name,700,98,80,22,0xff00ff,0x800080,0.9,true)
			data[name].x=tfm.get.room.playerList[name].x-800
			if data[name].x > 0 then
				ui.addTextArea(2,"<p align='center'><font size='20'><b><font color='#800000'><font face='Courier New'>"..data[name].x.."",name,700,18,80,22,0xff0000,0x800000,0.9,true)
				ui.addTextArea(3,"",name,30,48,data[name].x/37,5,0xff0000,0x800000,0.9,true)
				if tfm.get.room.playerList[name].vx <= 3 and tfm.get.room.playerList[name].x >= 500 and tfm.get.room.playerList[name].y >= 5450 then
					showMessage("<BL>Distância percorrida: <b>"..data[name].x.."</b> pixels.",name)
					data[name].freezed=false
					tfm.exec.freezePlayer(name,false)
					if data[name].x > data[name].recorde then
						data[name].recorde=data[name].x
						showMessage("<VP>Você atingiu sua maior pontuação: <b>"..data[name].x.." pixels</b>.",name)
						ui.addTextArea(4,"",name,30+data[name].recorde/37,48,1,5,0x00ff00,0x008000,0.9,true)
						ui.addTextArea(80,"",name,data[name].x+803,50,6,5990,0x00ff00,0x008000,0.8,false)
						tfm.exec.setPlayerScore(name,data[name].x,false)
					end
					if data[name].x > recorde then
						recorde=data[name].x
						recorder=name
						showMessage("<J>Novo recorde da sala: <b>"..data[name].x.." pixels</b>, feito por "..name.."!")
						ui.addTextArea(5,"",nil,30+recorde/37,48,1,5,0xff00ff,0x800080,0.9,true)
						updateBar()
						ui.addTextArea(81,"",nil,data[name].x+803,50,6,5990,0xff00ff,0x800080,0.8,false)
						tfm.exec.setPlayerScore(name,data[name].x,false)
					end
					resetPlayer(name)
				end
			else
				if tfm.get.room.playerList[name].y >= 5520 and tfm.get.room.currentMap == "@0" and data[name].freezed == false then
					data[name].sc=data[name].sc+1
					data[name].freezed=true
					if data[name].sc == 10 then
						data[name].sc=-15
						showMessage("<VP>O fundo do mar é o céu de outro mundo...<br><BL>— Pyke",name)
					end
				end
			end
			if data[name].loop >= 12 then
				if tfm.get.room.playerList[name].y <= 1500 and tfm.get.room.currentMap == "@0" then
					if data[name].freezed == false then
						if data[name].x > 0 then
							if tfm.get.room.playerList[name].vx >= 5.1 then
								tfm.exec.setPlayerGravityScale(name,0)
								tfm.exec.movePlayer(name,0,0,false,0,false)
								tfm.exec.freezePlayer(name)
							end
						else
							tfm.exec.setPlayerGravityScale(name,-0.2)
							data[name].sc=data[name].sc+1
							data[name].freezed=true
							if data[name].sc >= 5 then
								data[name].sc=-15
								showMessage("<VP>Nada há de caminhar sobre as estrelas...<br><BL>— Aurelion Sol",name)
							end
						end
					end
				end
			end
		end
	else
		if r <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
			for name,player in next,tfm.get.room.playerList do
				eventNewPlayer(name)
			end
		end
	end
end
