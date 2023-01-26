for _,f in next,{"PhysicalConsumables","AutoNewGame","AutoTimeLeft","AllShamanSkills","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
dragon=true -- troque para 'false' para desativar o dragão que aparece no topo do mapa
mode=""; shaman=""; loop=0; data={}; changed=false; xml2='';
objects1={1,3,6,7,35,39,60,89,95}
objects2={1,2,3,6,7,35,39,45,46,54,60,85,89,90,95}
objects3={1,2,3,4,6,7,10,23,35,39,40,45,46,54,60,61,68,69,85,89,90,95}
objects4={2,4,10,39,40,45,46,54,61,67,68,69,90}
map="@7916314"; map_dragon="@7916315";
system.disableChatCommandDisplay("cancel")
system.disableChatCommandDisplay("set")
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function eventChatCommand(n,m)
	if m == "help" then
		showMessage("<N>Neste module, o shaman tem 2 minutos para construir um foguete que precisa levar todos os ratos para o espaço. Caso o shaman morra, a partida é encerrada.<br><br><BL>Mapa criado por Threshlimit#0000 e Patrick_mahomes#1795. Código desenvolvido por Morganadxana#0000.<br>Conceito original de Nettoork#0000.<br>Versão 5.10.0",n)
	end
	if m == "cancel" then
		if n == "Threshlimit#0000" or n == "Morganadxana#0000" or n == "Patrick_mahomes#1795" or n == "Viego#0345" or n == "Forzaldenon#0000" then
			tfm.exec.setGameTime(5)
			showMessage("<R>Rodada cancelada! Iniciando uma nova rodada...")
		end
	end
	if (m:sub(0,3) == "set") then
		if n == "Threshlimit#0000" or n == "Morganadxana#0000" or n == "Patrick_mahomes#1795" or n == "Viego#0345" or n == "Forzaldenon#0000" then
			tfm.exec.setPlayerScore(m:sub(5),4000,true)
			tfm.exec.setGameTime(5)
			showMessage("<R>Rodada cancelada! Iniciando uma nova rodada...")
		end
	end
end
function rodar(name)
	ui.setBackgroundColor("#000000")
	tfm.exec.addImage("182d6e2c97d.png","!1",20,10,name,1,1)
	for a=1,12 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(-150,1750),math.random(-200,2500),name) end
	tfm.exec.addImage("182d6e2305b.png","?1",math.random(-350,1550),math.random(-350,2000),name)
	tfm.exec.addImage("182d6e2305b.png","?1",math.random(-350,1550),math.random(-350,2000),name,-1,1)
	tfm.exec.addImage("182d6e1e45c.png","?1",math.random(-350,1550),math.random(-350,2000),name)
	tfm.exec.addImage("182d6e1e45c.png","?1",math.random(-350,1550),math.random(-350,2000),name,-1,1)
	for i=0,2 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-400,1500),math.random(3222,4900),name)
	end
	for j=0,2 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(-400,1500),math.random(3222,4900),name)
	end
	for k=0,2 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(-400,1500),math.random(3222,4900),name)
	end
	for l=0,2 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(-400,1500),math.random(3222,4900),name)
	end
	for m=1,3 do
		tfm.exec.addImage("181b9de5c95.png","?1",-1120,-1600+(m*1080),name)
		tfm.exec.addImage("181b9de5c95.png","?1",800,-1600+(m*1080),name)
	end
	ui.setMapName("<font color='#1288e8'><b>RockerLaunch 5</b> <N>Project by <VP>Threshlimit#0000, <ROSE>Morganadxana#0000<N> and <R>Patrick_mahomes#1795<")
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,2540,name,4,2,0,1)
	tfm.exec.addImage("17fe373d035.jpg","?1",-400,4700,name,1,1)
end
function eventLoop(p,f)
	if changed == true then
		local m=math.floor(f/60000)
		local s=math.floor((((m*60000)-f) * -1) / 1000)
		remain=math.floor(f/1000)-282
		local mr=math.floor(remain/60)
		local sr=math.floor(((mr*60)-remain) * -1)
		if s >= 10 then
			ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
		else
			ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
		end
		if mr >= 0 and sr >= 0 then
			if sr >= 10 then
				ui.addTextArea(-3,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..mr..":"..sr.." <VP>/</b>",n,429,22,140,54,0,0,1.0,true)
				ui.addTextArea(-4,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i><R>"..mr..":"..sr.."</b>",n,426,19,140,54,0,0,1.0,true)
			else
				ui.addTextArea(-3,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..mr..":0"..sr.." <VP>/</b>",n,429,22,140,54,0,0,1.0,true)
				ui.addTextArea(-4,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i><R>"..mr..":0"..sr.."</b>",n,426,19,140,54,0,0,1.0,true)
			end
		end
		if mode == "fly" then
			loop=loop+1
		end
		if f < 1000 then
			tfm.exec.newGame(xml2,false)
			mode="building"
		end
		if p > 123000 then
			if mode == "fly" then
				for n,player in pairs(tfm.get.room.playerList) do
					if player.y < 200 and p > 123000 and mode=="fly" then
						if not tfm.get.room.playerList[n].isDead then
							tfm.exec.giveCheese(n)
							tfm.exec.playerVictory(n)
							tfm.exec.setGameTime(20)
						end
						mode="ending"
					end
					if dragon == true and player.y < 550 and not tfm.get.room.playerList[n].isDead and data[n].reached == false then
						data[n].reached=true
						data[n].message=data[n].message+1
						if data[n].message == 1 then
							showMessage("<VP>Nada causa tanta admiração quanto a beleza das estrelas...<br><BL>— Aurelion Sol",n)
							data[n].message=-10
						end
					end
				end
			end
		end
		if f >= 5000 then
			if p > 122000 and mode == "building" then
				mode="fly"
				showMessage("<R>Tempo esgotado! Está na hora de voar!<br><ROSE><b>Atenção! Objetos voadores estão caindo do céu!</b>")
				for n,player in pairs(tfm.get.room.playerList) do
					tfm.exec.attachBalloon(n,false)
					if tfm.get.room.playerList[n].isShaman then
						tfm.exec.setShaman(n,false)
					end
				end
			end
			if p > 123600 and p <= 150000 then
				tfm.exec.addShamanObject(objects1[math.random(#objects1)], math.random(-400,2000), 1, 0, 0, 0, false)
				loop=0
			end
			if p > 150000 and p <= 200000 then
				for i=1,2 do
					tfm.exec.addShamanObject(objects2[math.random(#objects2)], math.random(-400,2000), 1, 0, 0, 0, false)
					loop=0
				end
			end
			if p > 200000 and p <= 250000 then
				for i=1,2 do
					tfm.exec.addShamanObject(objects3[math.random(#objects3)], math.random(-400,2000), 1, 0, 0, 0, false)
					loop=0
				end
			end
			if p >= 250000 then
				for i=1,3 do
					tfm.exec.addShamanObject(objects4[math.random(#objects4)], math.random(-400,2000), 1, 0, 0, 0, false)
					loop=0
				end
			end
		end
	else
		if f <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
			for name,_ in next,tfm.get.room.playerList do
				eventNewPlayer(name)
			end
		end
	end
end
function eventNewGame()
	if changed == true then
		ui.setMapName("<font color='#1288e8'><b>RockerLaunch 5</b> <N>Project by <VP>Threshlimit#0000, <ROSE>Morganadxana#0000<N> and <R>Patrick_mahomes#1795<")
		tfm.exec.setGameTime(405)
		showMessage("<J>O shaman tem 2 minutos para construir um foguete que precisa levar todos os ratos para o espaço!")
		mode="building"
		for n,p in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[n].isShaman then
				shaman=n
				tfm.exec.setShamanMode(n,0)
			end
			data[n].reached=false
			rodar(n)
		end
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventNewPlayer(n)
	if changed == true then
		ui.setMapName("<font color='#1288e8'><b>RockerLaunch 5</b> <N>Project by <VP>Threshlimit#0000, <ROSE>Morganadxana#0000<N> and <R>Patrick_mahomes#1795<")
		showMessage("<VP>Bem-vindos ao RockerLaunch 5!<br><N>Neste module, o shaman tem 2 minutos para construir um foguete que precisa levar todos os ratos para o espaço! Digite !help para saber como jogar.<br><br><BL>Créditos para Threshlimit#0000, Morganadxana#0000 e Patrick_mahomes#1795. Conceito original de Nettoork#0000.<br><J>Versão 5.10.0",n)
		newData={
			["message"]=0,
			["reached"]=false
		}
		data[n]=newData;
		tfm.exec.setPlayerScore(n,0,false)
		tfm.exec.addImage("17ae4e48770.png","&1",670,22,n)
	end
end
function eventPlayerDied(n)
	if changed == true then
		if tfm.get.room.playerList[n].isShaman or shaman == n then
			tfm.exec.setGameTime(5)
			tfm.exec.setPlayerScore(n,-1,false)
			showMessage("<R>O shaman morreu! Iniciando uma nova rodada...")
		end
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
end
if dragon == true then tfm.exec.newGame(map_dragon); else tfm.exec.newGame(map); end
