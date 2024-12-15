-- Esta é a versão reduzida do RockerLaunch 6, sem a arte do dragão espacial.

admin={}; -- insira o nome dos FunCorps nesta tabela para habilitar algumas funções e comandos especiais
afkdeath=true; -- mude para 'false' para desativar a morte dos ratos ausentes
barrier=false; -- mude para 'true' para incluir barreiras invisíveis nos cantos do mapa, evitando que as construções se destruam ao sair do mapa

-- Comandos:
-- !cancel - Pula a vez do shaman atual.
-- !set [nick#tag] - Define o usuário selecionado como shaman.

-- NÃO MUDE NADA DEPOIS DESTA LINHA!!
for _,f in next,{"PhysicalConsumables","AutoNewGame","AutoTimeLeft","AllShamanSkills","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
changed=false; mode=""; id=50; map="@7930736"; xml2=''; passed=0; final=""; lang={};
a1={500,1400}; a2={7500,6800}; b1={800,240}; b2={6360,5800}; c1={200,900}; c2={3800,3300}; d1={1500}; d2={4100};
bar={type = 14,width = 10,height = 4000,foreground = false,friction = 0,restitution = 0,angle = 0, color = 0, miceCollision = true, groundCollision = true, dynamic = false}
asteroid_1={type = 12,width = 40,height = 20,foreground = false,friction = 3,restitution = 0.1,angle = 0, color = 0, miceCollision = true, groundCollision = true, dynamic = true, fixedRotation = false, mass = 2000}
asteroid_2={type = 12,width = 80,height = 40,foreground = false,friction = 4,restitution = 0.15,angle = 0, color = 0, miceCollision = true, groundCollision = true, dynamic = true, fixedRotation = false, mass = 5000}
asteroid_3={type = 12,width = 160,height = 80,foreground = false,friction = 5,restitution = 0.2,angle = 0, color = 0, miceCollision = true, groundCollision = true, dynamic = true, fixedRotation = false, mass = 15000}
asteroid_4={type = 12,width = 320,height = 160,foreground = false,friction = 6,restitution = 0.25,angle = 0, color = 0, miceCollision = true, groundCollision = true, dynamic = true, fixedRotation = false, mass = 30000}
lang.br = {
	ajuda="<VP>Bem-vindos ao RockerLaunch 6!\n<N>Neste module, o shaman tem 2 minutos para construir um foguete que precisa levar todos os ratos para o espaço! Digite !help para saber como jogar.\n\n<BL>Créditos para Lynet#8558, Puffezinhaq#0000, Digo20games#0000, Dhanny_mheyran#6701 e Threshlimit#0000. Conceito original de Nettoork#0000.\n<J>Versão 6.11",
	mapname="<b>RockerLaunch 6</b><N> - o céu é o limite! <VP>(versão reduzida)<",
	start="<J>O shaman tem 2 minutos para construir um foguete que precisa levar todos os ratos para o espaço!",
	loadingmap="<J>Carregando mapa. Por favor, aguarde...<",
	canceled="<R>Rodada cancelada! Iniciando uma nova rodada...",
	nextshaman="<VP>Shaman definido para a próxima rodada: ",
	timeout="<R>Tempo esgotado! Está na hora de voar!",
	fallings="<ROSE><b>Atenção! Objetos voadores estão caindo do céu!</b>",
	meteor1="<R><b>Atenção!</b> Meteoros estão caindo do céu!",
	meteor2="<R><b>Os meteoros estão gigantes! Tenham muito cuidado!</b>",
	shamdied="<VP>O shaman morreu! Iniciando uma nova rodada...",
}
lang.en = {
	ajuda="<VP>Welcome to RocketLaunch 6!\n<N>In this module, the shaman has 2 minutes to build a rocket that needs to take all the mice into space!\nType !help to see more information.\n\n<BL>Credits to Lynet#8558, Puffezinhaq#0000, Digo20games#0000, Dhanny_mheyran#6701 and Threshlimit#0000. Original concept by Nettoork#0000.\n<J>Version 6.11",
	mapname="<b>RockerLaunch 6</b><N> - The Sky is the Limit! <VP>(reduced version)<",
	start="<J>The shaman has 2 minutes to build a rocket that needs to take all mices into space!",
	loadingmap="<J>Loading map. Please wait...<",
	canceled="<R>Round canceled! Starting a new round...",
	nextshaman="<VP>Next shaman defined: ",
	timeout="<R>Time's up! It's time to fly!",
	fallings="<ROSE><b>Caution! Objects are falling from the sky!</b>",
	meteor1="<R><b>Caution!</b> Meteors are falling from the sky!",
	meteor2="<R><b>The meteors are now huge! Be very careful!</b>",
	shamdied="<VP>The shaman died! Starting a new round...",
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
objects1={1,3,6,23,33,39,60,65}
objects2={1,3,6,23,33,39,60,65,2,68,69}
objects3={1,3,6,23,33,39,60,65,2,68,69,4,7,10,17,35,85,90}
objects4={1,3,6,23,33,39,60,65,2,68,69,4,7,10,17,35,85,90,40,61,67}
numbers1={{70,97,98,114,105,99,105,111,35,48,53,49,57},
{77,97,108,122,97,104,97,114,35,56,49,55,56},
{72,119,101,105,35,49,48,50,55},
{83,97,109,105,114,97,35,52,51,56,55},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{65,117,114,101,108,105,111,110,95,115,111,108,35,57,54,54,49},
{71,108,111,98,111,95,114,117,114,97,108,35,54,53,51,50},
{86,105,101,103,111,35,48,51,52,53}}
managers={}

for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(managers,final)
end

function verifyNinjas(name)
	for i=1,rawlen(managers) do
		if managers[i] == name then
			return true
		end
	end
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function showMessage(message,name)
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function eventNewGame()
	if changed == true then
		id=50;
		ui.setMapName(text.mapname)
		tfm.exec.setGameTime(400)
		showMessage(text.start)
		mode="building"
		for n,p in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[n].isShaman then
				shaman=n
				tfm.exec.setShamanMode(n,0)
			end
			rodar(n)
		end
		if barrier == true then
			for i=0,1 do
				tfm.exec.addPhysicObject(2048+i, 0, 2750+(4000*i), bar)
				tfm.exec.addPhysicObject(2060+i, 1600, 2750+(4000*i), bar)
			end
		end
	else
		if afkdeath == true then
			tfm.exec.disableAfkDeath(true)
		end
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName(text.loadingmap)
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventChatCommand(n,m)
	if m == "help" then
		showMessage(ajuda,n)
	end
	if verifyNinjas(n) == true or verifyAdmin(n) == true then
		if m == "cancel" then
			tfm.exec.setGameTime(5)
			showMessage(text.canceled)
		end
		if (m:sub(0,3) == "set") then
			tfm.exec.setPlayerScore(m:sub(5),4444,true)
			showMessage(text.nextshaman..m:sub(5))
		end
		if (m:sub(0,3) == "get") then
			tfm.exec.setPlayerScore(m:sub(5),32,true)
		end
	end
end
function rodar(name)
	tfm.exec.addImage("18756e4d3d0.png","?1",100,8267,name)
	ui.setBackgroundColor("#000000")
	for c=1,14 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(-700,2200),math.random(-150,3400),name) end
	tfm.exec.addImage("182d6e2305b.png","?1",math.random(-750,1850),math.random(-450,2650),name)
	tfm.exec.addImage("182d6e2305b.png","?1",math.random(-750,1850),math.random(-450,2650),name,-1,1)
	tfm.exec.addImage("182d6e1e45c.png","?1",math.random(-750,1850),math.random(-450,2650),name)
	tfm.exec.addImage("182d6e1e45c.png","?1",math.random(-750,1850),math.random(-450,2650),name,-1,1)
	tfm.exec.addImage("1883b125925.png","!1",690,2400,name)
	tfm.exec.addImage("1883b11fa05.png","!1",1285,1800,name)
	tfm.exec.addImage("1883b133513.png","!1",350,1300,name)
	tfm.exec.addImage("1883b12d793.png","!1",700,800,name)
	tfm.exec.addImage("18f7d33850e.png","!1",550,200,name)
	tfm.exec.addImage("18f7d331f77.png","?1",1789,1125,name,-1)
	for j=0,2 do
		for i=0,3 do
			tfm.exec.addImage("181b9de5c95.png","?1",-800+(j*1920),-780+(i*1080),name)
		end
	end
	tfm.exec.addImage("189749dd379.png", "?1", -1200, 8610, name, 1, 1, 0, 1)
	tfm.exec.addImage("189749dd379.png", "!1", -1200, 8610, name, 1, 1, 0, 0.9)
	tfm.exec.addImage("189749dd379.png", "?1", 2800, 8610, name, -1, 1, 0, 1)
	tfm.exec.addImage("189749dd379.png", "!1", 2800, 8610, name, -1, 1, 0, 0.9)
	for i=0,5 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-400,1500),math.random(5300,7200),name)
	end
	for j=0,4 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(-400,1500),math.random(4500,5800),name)
	end
	for k=0,3 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(-400,1500),math.random(5500,6800),name)
	end
	for l=0,4 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(-400,1500),math.random(6000,7600),name)
	end
	for d=1,rawlen(a1) do
		tfm.exec.addImage("18756e0eb3b.png","?1",a1[d],a2[d],name)
	end
	for e=1,rawlen(b1) do
		tfm.exec.addImage("18756e13dcd.png","?1",b1[e],b2[e],name)
	end
	for f=1,rawlen(c1) do
		tfm.exec.addImage("18756e1e789.png","?1",c1[f],c2[f],name,-1,1)
	end
	for g=1,rawlen(d1) do
		tfm.exec.addImage("18756e23bc8.png","?1",d1[g],d2[g],name,-1,1)
	end
	tfm.exec.addImage("18f7d334e57.png","?1",180,3430,name)
	tfm.exec.addImage("18f7d334e57.png","?1",1181,2862,name,-1)
	tfm.exec.addImage("18f7d330a8a.png","?1",-34,988,name)
	tfm.exec.addImage("18773209c5b.png","?1",840,7250,name)
	tfm.exec.addImage("18773209c5b.png","?1",275,6350,name,-1)
	tfm.exec.addImage("1877321eda8.png","?1",365,7050,name,-1)
	tfm.exec.addImage("1877321eda8.png","?1",1265,6200,name)
	tfm.exec.addImage("187732271a7.png","?1",600,5800,name)
	tfm.exec.addImage("187732271a7.png","?1",1030,5080,name,-1)
	tfm.exec.addImage("1877322de4e.png","?1",1265,7600,name)
	tfm.exec.addImage("1877322de4e.png","?1",880,6280,name)
	tfm.exec.addImage("1877322de4e.png","?1",420,4950,name,-1)
	tfm.exec.addImage("18773217882.png","?1",-900,7950,name,1,1,0,0.8)
	tfm.exec.addImage("18773217882.png","?1",2900,7950,name,-1,1,0,0.8)
	tfm.exec.addImage("18756e48371.png","?1",-800,2800,name,8,9.6)
end
function eventLoop(p,f)
	if changed == true then
		local isf=math.floor(f/500)
		local m=math.floor(f/60000)
		local s=math.floor((((m*60000)-f) * -1) / 1000)
		remain=math.floor(f/1000)-280
		passed=math.floor(p/1000)
		local mr=math.floor(remain/60)
		local sr=math.floor(((mr*60)-remain) * -1)
		if s >= 10 then
			ui.addTextArea(-1,"<font size='24'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,739,372,110,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='24'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,736,369,110,54,0,0,1.0,true)
		else
			ui.addTextArea(-1,"<font size='24'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,739,372,110,54,0,0,1.0,true)
			ui.addTextArea(-2,"<font size='24'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,736,369,110,54,0,0,1.0,true)
		end
		if mr >= 0 and sr >= 0 then
			if sr >= 10 then
				ui.addTextArea(-3,"<font size='24'><font color='#222222'><font face='Trebuchet MS'><b><i>"..mr..":"..sr.." <VP>/</b>",n,659,372,140,54,0,0,1.0,true)
				ui.addTextArea(-4,"<font size='24'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i><R>"..mr..":"..sr.."</b>",n,656,369,140,54,0,0,1.0,true)
			else
				ui.addTextArea(-3,"<font size='24'><font color='#222222'><font face='Trebuchet MS'><b><i>"..mr..":0"..sr.." <VP>/</b>",n,659,372,140,54,0,0,1.0,true)
				ui.addTextArea(-4,"<font size='24'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i><R>"..mr..":0"..sr.."</b>",n,656,369,140,54,0,0,1.0,true)
			end
		end
		if f <= 500 then
			tfm.exec.newGame(xml2,false)
			mode="building"
		end
		if p > 123000 then
			id=id+1;
			if mode == "fly" then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].y < 111 and p > 123000 and isf >= 3 and mode=="fly" then
						if not tfm.get.room.playerList[name].isDead then
							tfm.exec.giveCheese(name)
							tfm.exec.playerVictory(name)
							tfm.exec.setGameTime(20)
						end
						mode="ending"
					end
				end
			end
		end
		if f >= 5000 then
			if p > 123000 and mode == "building" then
				mode="fly"
				showMessage(text.timeout)
				for n,player in pairs(tfm.get.room.playerList) do
					tfm.exec.attachBalloon(n,false)
					if tfm.get.room.playerList[n].isShaman then
						tfm.exec.setShaman(n,false)
					end
				end
			end
		end
		if isf == 540 then
			showMessage(text.fallings)
		end
		if isf < 540 and isf >= 450 then
			tfm.exec.addShamanObject(objects1[math.random(#objects1)], math.random(-400,2000), 1, 0, 0, 0, false)
		elseif isf < 450 and isf >= 360 then
			for i=1,2 do
				tfm.exec.addShamanObject(objects2[math.random(#objects2)], math.random(-400,2000), 1, 0, 0, 0, false)
			end
		elseif isf < 360 and isf >= 240 then
			for i=1,3 do
				tfm.exec.addShamanObject(objects3[math.random(#objects3)], math.random(-400,2000), 1, 0, 0, 0, false)
			end
		elseif isf < 240 and isf >= 10 then
			for i=1,4 do
				tfm.exec.addShamanObject(objects4[math.random(#objects4)], math.random(-400,2000), 1, 0, 0, 0, false)
			end
		end
		if isf == 240 then
			showMessage(text.meteor1)
		end
		if isf == 100 then
			showMessage(text.meteor2)
		end
		if p >= 150000 then
			if isf < 240 and isf >= 160 then
				if isf % 3 == 0 then
					tfm.exec.addPhysicObject(id, math.random(-300,1900), 1, asteroid_1)
					tfm.exec.addImage("182dc62db5c.png","+"..id.."",-23,-17,n,0.125,0.125)
				end
			elseif isf < 160 and isf >= 100 then
				if isf % 4 == 0 then
		 			tfm.exec.addPhysicObject(id, math.random(-300,1900), 1, asteroid_2)
		 			tfm.exec.addImage("182dc62db5c.png","+"..id.."",-46,-32,n,0.25,0.25)
				end
			elseif isf < 100 and isf >= 50 then
				if isf % 5 == 0 then
					tfm.exec.addPhysicObject(id, math.random(-300,1900), 1, asteroid_3)
					tfm.exec.addImage("182dc62db5c.png","+"..id.."",-92,-60,n,0.5,0.5)
				end
			elseif isf < 50 and isf >= 10 then
				if isf % 6 == 0 then
					tfm.exec.addPhysicObject(id, math.random(-300,1900), 1, asteroid_4)
					tfm.exec.addImage("182dc62db5c.png","+"..id.."",-184,-90,n,nil)
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
function eventNewPlayer(n)
	if changed == true then
		ui.setMapName(text.mapname)
		showMessage(ajuda,n)
		tfm.exec.setPlayerScore(n,0,false)
		tfm.exec.addImage("17ae4e48770.png","&1",590,370,n,0.5,0.5)
		rodar(n)
	end
end
function eventPlayerDied(name)
	if changed == true then
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setGameTime(5)
			tfm.exec.setPlayerScore(name,-2,false)
			showMessage(text.shamdied)
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
		if passed >= 135 then
			tfm.exec.setPlayerScore(name,1,true)
		end
	end
end
tfm.exec.newGame(map);
