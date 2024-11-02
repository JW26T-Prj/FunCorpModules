-- Navio Viego Santiarul Molach Vol Kalah Heigaari
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","DebugCommand","MinimalistMode","PhysicalConsumables","MortCommand"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, foreground = false}
base={type = 14,width = 3779,height = 142,miceCollision = true, friction = 0.7, groundCollision = true}
wood={type = 14,width = 800,height = 20,miceCollision = true, friction = 0.5, groundCollision = true}
wood_short={type = 14,width = 272,height = 20,miceCollision = true, friction = 0.6, groundCollision = true}

grounds={{3701,915},{3701,925},{3289,1519},{3289,1317},{3289,1337},{1677,1520},{1677,1540},{1677,1560},{1708,1357},{1708,1377},{1703,1180},{4292,1210},{4631,1284},{3445,1723},{4245,1723}}
grounds_short={{3729,1540},{3763,1557},{3781,1573},{3216,503},{4453,939},{4893,939},{4981,1148}}
dolphins={{400,2635},{2590,2745}}
dolphins_r={{5150,2815},{4220,3345}}

xml=''; changed=false; y_factor=2000; boat_factor=5; depth_factor=1050; mapa="@7961204";

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end

function showWater(name)
	-- animais voadores
	tfm.exec.addImage("1860ee201fd.png","!1",7767,1897,name)
	tfm.exec.addImage("1877322de4e.png","!1",8146,750,name)
	tfm.exec.addImage("1877322de4e.png","!1",1429,410,name,-1,1)
	tfm.exec.addImage("1877322de4e.png","!1",159,887,name)
	tfm.exec.addImage("187732271a7.png","!1",689,533,name)
	tfm.exec.addImage("187732271a7.png","!1",2496,177,name)
	tfm.exec.addImage("1877321eda8.png","!1",5349,683,name)
	tfm.exec.addImage("1877321eda8.png","!1",6709,813,name,-1,1)
	tfm.exec.addImage("18773209c5b.png","!1",8756,693,name)

	-- animais marinhos
	tfm.exec.addImage("192e0192c52.png","?1",-217,4256,name)
	tfm.exec.addImage("192e0192c52.png","?1",2324,4229,name,-1,1)
	tfm.exec.addImage("192e01943c1.png","?1",2793,4354,name)
	tfm.exec.addImage("192e01943c1.png","?1",1449,3940,name)
	tfm.exec.addImage("192e01943c1.png","?1",4100,3924,name,-1,1)
	tfm.exec.addImage("192e01943c1.png","?1",4974,3623,name,-1,1)
	tfm.exec.addImage("192e0195b33.png","?1",95,4000,name)
	tfm.exec.addImage("192e0195b33.png","?1",1396,4106,name,-1,1)
	tfm.exec.addImage("192e0195b33.png","?1",2994,4410,name)
	tfm.exec.addImage("192e0195b33.png","?1",4350,4317,name,-1,1)
	tfm.exec.addImage("192e01972a4.png","?1",5143,4294,name)
	tfm.exec.addImage("192e01972a4.png","?1",3016,3730,name,-1,1)
	tfm.exec.addImage("192e0198a16.png","?1",1656,4490,name)
	tfm.exec.addImage("192e0198a16.png","?1",-173,4399,name,-1,1)
	tfm.exec.addImage("192e0198a16.png","?1",4613,4516,name)
	tfm.exec.addImage("192e0198a16.png","?1",5347,4014,name)
	tfm.exec.addImage("192e0198a16.png","?1",3773,3834,name,-1,1)
	tfm.exec.addImage("18a053a43b9.png","?1",4004,4396,name)
	tfm.exec.addImage("18a053a43b9.png","?1",3086,4287,name)
	tfm.exec.addImage("185c2e9722e.png","?1",1084,4434,name)
	tfm.exec.addImage("185c2e9722e.png","?1",4676,4349,name,-1,1)
	tfm.exec.addImage("1883efb5982.png","?1",280,3515,name)
	tfm.exec.addImage("18756e28db6.png","?1",3250,3355,name,-1,1)
	tfm.exec.addImage("18756e333d5.png","?1",1890,3444,name,-1,1)

	for d=1,rawlen(dolphins) do
		tfm.exec.addImage("192e01914e1.png","?1",dolphins[d][1],dolphins[d][2]+boat_factor,name)
	end
	for e=1,rawlen(dolphins_r) do
		tfm.exec.addImage("192e01914e1.png","?1",dolphins_r[e][1],dolphins_r[e][2]+boat_factor,name,-1,1)
	end

	-- itens de dentro do mar
	tfm.exec.addImage("192e019a18c.png","!1",0,4205,name)
	tfm.exec.addImage("189746d10d2.png","!1",1285,4490,name)
	tfm.exec.addImage("189746d76aa.png","!1",4060,4405,name)
	tfm.exec.addImage("189746e4cb8.png","!1",4510,4316,name)
	tfm.exec.addImage("189746e4cb8.png","!1",2117,4331,name)

	-- pisos
	tfm.exec.addPhysicObject(-75,2627,1928,base)
	for g=1,rawlen(grounds) do
		tfm.exec.addPhysicObject(g+111,grounds[g][1],grounds[g][2]+boat_factor,wood)
	end
	for h=1,rawlen(grounds_short) do
		tfm.exec.addPhysicObject(h+222,grounds_short[h][1],grounds_short[h][2]+boat_factor,wood_short)
	end
	tfm.exec.addPhysicObject(-1,-200,2830+boat_factor,barrier)
	tfm.exec.addPhysicObject(-2,10063,2830+boat_factor,barrier)
	for j=1,12 do
		tfm.exec.addPhysicObject(j+333,-400+(j*800),3565+depth_factor,wood)
	end

	-- mecanismo de entrada e saída da sala especial
	ui.addTextArea(8972, "<a href='event:pw'>                                 ",name,4242,1077+boat_factor,58,30,0,0,1.0,false)
	ui.addTextArea(1027, "<a href='event:exit'>                                      ",name,4320,1140+boat_factor,50,30,0,0,1.0,false)

	-- nuvens
	for a=0,5 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86195e.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86655c.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(-200,6000),math.random(-150,600),name);
	end
	for a=0,3 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(6000,10000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86195e.png","?1",math.random(6000,10000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86655c.png","?1",math.random(6000,10000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(6000,10000),math.random(600,1200),name);
	end

	-- areia do fundo do mar
	for i=0,10 do
		tfm.exec.addImage("192e019c182.png", "?-1", -1200+(i*1017), y_factor+2575, name, 1, 1, 0, 1)
		tfm.exec.addImage("192e019c182.png", "?-1", -1200+(i*1017), y_factor+3550, name, 1, -2, 0, 1)
	end

	-- água do mar (azul)
	tfm.exec.addImage("192e017f5a8.png", "!-1", -1200, y_factor+98, name,28,8,0,1)
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+99, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+99, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+99, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+99, name)
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+3657, name,1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+3657, name,1,-1) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3657, name,1,-1) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+3657, name,1,-1)
	end
	for _,i in next,{1,3,5} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+99, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+99, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+99, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+99, name,-1,1)
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+3657, name,-1,-1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3657, name,-1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+3657, name,-1,-1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+3657, name,-1,-1) 
	end
	for _,i in next,{0,2,4,6,8} do
		tfm.exec.addImage("192e01770df.png", "?1", -1200+(i*2399), y_factor-12, name)
		tfm.exec.addImage("192e017b00d.png", "!-1", -1200+(i*2399), y_factor-12, name, 1, 1,0,0.9)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("192e01770df.png", "?1", 1200+(i*2399), y_factor-12, name, -1, 1)
		tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2399), y_factor-12, name, -1, 1,0,0.9)
	end

	-- água do mar (verde)
	-- tfm.exec.addImage("192e017de38.png", "!-1", -1200, y_factor+98, name,28,8,0,1)
	-- for _,i in next,{0,2,4} do
	-- 	tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+99, name) 
	-- 	tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+99, name) 
	-- 	tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+99, name) 
	-- 	tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+99, name)
	-- 	tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+3657, name,1,-1) 
	-- 	tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+3657, name,1,-1) 
	-- 	tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3657, name,1,-1) 
	-- 	tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+3657, name,1,-1)
	-- end
	-- for _,i in next,{1,3,5} do
	-- 	tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+99, name,-1,1)
	-- 	tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+99, name,-1,1) 
	-- 	tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+99, name,-1,1) 
	-- 	tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+99, name,-1,1)
	-- 	tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+3657, name,-1,-1)
	-- 	tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3657, name,-1,-1) 
	-- 	tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+3657, name,-1,-1) 
	-- 	tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+3657, name,-1,-1) 
	-- end
	-- for _,i in next,{0,2,4,6,8} do
	-- 	tfm.exec.addImage("192e0179669.png", "?1", -1200+(i*2399), y_factor-12, name)
	-- 	tfm.exec.addImage("192e017ca61.png", "!-1", -1200+(i*2399), y_factor-12, name, 1, 1,0,0.9)
	-- end
	-- for _,i in next,{1,3,5,7,9} do
 	-- 	tfm.exec.addImage("192e0179669.png", "?1", 1200+(i*2399), y_factor-12, name, -1, 1)
	-- 	tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2399), y_factor-12, name, -1, 1,0,0.9)
	-- end
	
	-- montanhas de fundo
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("192e018d27c.png","?1",-1200+(h*2578),y_factor-355,name,1,1,0,0.9)
	end
	for _,h in next,{1,3,5} do 
		tfm.exec.addImage("192e018d27c.png","?1",1378+(h*2578),y_factor-355,name,-1,1,0,0.9)
	end
		
	-- boias
	for o=1,3 do
		tfm.exec.addImage("183b4bf34ba.png","+"..o.."",-50,-33,name)
	end

	-- corda e âncora
	tfm.exec.addImage("192e018b3ba.png","?-1",4757,1371,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4794,2141,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4831,2912,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4872,3684,name)
	tfm.exec.addImage("192e0189c4a.png","?-1",4810,4425,name,1,1,-0.5236,1)

	-- outros
	tfm.exec.addImage("1897471d01c.png","?1",7125,1784,name,0.5,0.5) 
	tfm.exec.addImage("192e018e5fd.png","?1",-1200,-1000,name,60,5) 
end

pw={75,101,105,116,104,32,72,101,114,116,122,111,110}; password="";

function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame(mapa)
		ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName("Carregando mapa. Por favor, aguarde...<")
		changed=false
	else
		changed=true
		tfm.exec.newGame(xml)
		ui.removeTextArea(0)
		for name,_ in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
		for i=1,13 do
			password=password..string.char(pw[i])
		end
	end
end

function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
end

function eventNewPlayer(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
		tfm.exec.changePlayerSize(name,1)
		ui.setMapName("<VP>Navio Viego Santiarul Molach Vol Kalah Heigaari<")
		tfm.exec.setGameTime(72000)
		showMessage("<N>Este é um mapa-script de navio pirata. Na verdade, é uma casa completa dentro de um navio pirata, e tem tudo o que uma casa 'normal' possui e mais um pouco... Divirtam-se!<br><br><ROSE><b>Mapa feito por Hwei#1027, Viego#0345 e Samira#4387.</b><br><J>Agradecimentos especiais para Lacoste#8972, Shun_kazami#7014, Tanatosl#0000 e Miss_fortune#9548.<br><br><N>Revisão 1.1",name)
		showWater(name)
	end
end

function eventTextAreaCallback(id,name,callback)
	if callback == "pw" then
		ui.addPopup(11,2,"",name,350,175,200,true)
	end
	if callback == "exit" then
		tfm.exec.movePlayer(name,4184,1106,false,0,0,false)
	end
end

function eventPopupAnswer(id,name,answer)
	if answer == password then
		tfm.exec.movePlayer(name,4536,1106,false,0,0,false)
	end
end

function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
end

resetMap()
