-- Samira's River
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","DebugCommand","MinimalistMode","PhysicalConsumables","MortCommand"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, foreground = false}
ground={type = 14,width = 3000,height = 10,miceCollision = true, friction = 1, groundCollision = true, foreground = false}
wood={type = 14,width = 800,height = 20,miceCollision = true, friction = 0.5, groundCollision = true}
dolphins={{1549,1821},{3404,1546},{5338,771},{5507,1958},{2915,1138},{1362,1228}}; dolphins_r={{2839,1928},{3945,1551},{5834,741},{6242,1488},{3792,832},{2057,878}}
dolphins2={{3952,821},{3154,1430}}; dolphins2_r={{4859,1854},{1296,1504}} 
f1={{1594,1971},{3099,1651},{4284,1401}}; f2={{1869,1971},{3119,1956},{5027,1901},{3152,1138}}; f3={{3449,1411},{1199,1191}}; f4={{2144,1893},{2977,999}}; f5={{1112,1323},{2572,2028},{6579,1306},{3564,902}}; 
f1_r={{4292,1941},{6197,1566},{1769,1131}}; f2_r={{5787,1848},{3869,963}}; f3_r={{5269,2023},{6377,1053}}; f4_r={{3444,986},{5617,792}}; f5_r={{1429,1783},{3289,1771},{2429,778}};

xml=''; changed=false; y_factor=600; depth_factor=1550; mapa="@7962594";

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
	-- animais
	for d=1,rawlen(dolphins) do	tfm.exec.addImage("192e01914e1.png","?-1",dolphins[d][1],dolphins[d][2],name,0.5,0.5) end
	for e=1,rawlen(dolphins_r) do tfm.exec.addImage("192e01914e1.png","?-1",dolphins_r[e][1],dolphins_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(dolphins2) do tfm.exec.addImage("1860ee24f31.png","?-1",dolphins2[d][1],dolphins2[d][2],name,0.5,0.5) end
	for e=1,rawlen(dolphins2_r) do tfm.exec.addImage("1860ee24f31.png","?-1",dolphins2_r[e][1],dolphins2_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f1) do tfm.exec.	addImage("192e0192c52.png","?-1",f1[d][1],f1[d][2],name,0.5,0.5)	end
	for e=1,rawlen(f1_r) do	tfm.exec.addImage("192e0192c52.png","?-1",f1_r[e][1],f1_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f2) do tfm.exec.addImage("192e01943c1.png","?-1",f2[d][1],f2[d][2],name)	end
	for e=1,rawlen(f2_r) do	tfm.exec.addImage("192e01943c1.png","?-1",f2_r[e][1],f2_r[e][2],name,-1) end
	for d=1,rawlen(f3) do tfm.exec.addImage("192e0195b33.png","?-1",f3[d][1],f3[d][2],name)	end
	for e=1,rawlen(f3_r) do	tfm.exec.addImage("192e0195b33.png","?-1",f3_r[e][1],f3_r[e][2],name,-1) end
	for d=1,rawlen(f4) do tfm.exec.addImage("192e01972a4.png","?-1",f4[d][1],f4[d][2],name,0.5,0.5)	end
	for e=1,rawlen(f4_r) do	tfm.exec.addImage("192e01972a4.png","?-1",f4_r[e][1],f4_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f5) do tfm.exec.addImage("192e0198a16.png","?-1",f5[d][1],f5[d][2],name)	end
	for e=1,rawlen(f5_r) do	tfm.exec.addImage("192e0198a16.png","?-1",f5_r[e][1],f5_r[e][2],name,-1) end
	tfm.exec.addImage("187732271a7.png","?1",56,140,name) 
	tfm.exec.addImage("187732271a7.png","?1",4231,117,name,-1) 
	tfm.exec.addImage("1877321eda8.png","?1",5317,225,name)
	tfm.exec.addImage("1877321eda8.png","?1",2426,4,name,-1)
	tfm.exec.addImage("18773209c5b.png","?1",1510,166,name)
	tfm.exec.addImage("18773209c5b.png","?1",3823,-84,name,-1)
	tfm.exec.addImage("1877322de4e.png","?1",2718,122,name)
	tfm.exec.addImage("1877322de4e.png","?1",453,131,name,-1)
	tfm.exec.addImage("1877322de4e.png","?1",5900,140,name)
	tfm.exec.addImage("18a0539e298.png","?-1",123,473,name,-1)
	tfm.exec.addImage("1860ee201fd.png","?-1",6250,2048,name)
	tfm.exec.addImage("18a053b5130.png","?-1",2630,471,name)
	tfm.exec.addImage("185c2e9722e.png","?-1",6396,1403,name)
	tfm.exec.addImage("185c2e9722e.png","?-1",4029,1606,name,-1,1)
	tfm.exec.addImage("185c2e9722e.png","?-1",1562,1933,name,-1,1)
	tfm.exec.addImage("1883efb5982.png","+1",-300,125,name)
	
	-- pisos
	tfm.exec.addPhysicObject(-1,-100,1000,barrier)
	tfm.exec.addPhysicObject(-2,7050,1000,barrier)
	tfm.exec.addPhysicObject(-3,1000,y_factor+depth_factor-25,ground)
	tfm.exec.addPhysicObject(-4,4000,y_factor+depth_factor-25,ground)
	tfm.exec.addPhysicObject(-5,7000,y_factor+depth_factor-25,ground)
	
	-- itens de dentro do rio
	tfm.exec.addImage("189746f8a21.png","?2",1219,1676,name)
	tfm.exec.addImage("189746c6144.png","?2",4019,1839,name)
	tfm.exec.addImage("192e019a18c.png","?1",3514,674,name)

	-- areia do fundo do rio
	for i=0,4 do
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), y_factor+depth_factor-70, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), y_factor+depth_factor+470, name, 1, -2, 0, 1)
	end

	-- água do rio
	tfm.exec.addImage("192e017de38.png", "!-1", -1200, y_factor+23, name,30,5,0,1)
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+30, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+30, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+30, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+30, name)
	end
	for _,i in next,{1,3,5} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+30, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+30, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+30, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+30, name,-1,1)
	end
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0179669.png", "?1", -1200+(i*2400), y_factor-11, name,1,1,0,1)
		tfm.exec.addImage("192e017ca61.png", "!-1", -1200+(i*2400), y_factor-11, name,1,1,0,1)
	end
	for _,i in next,{1,3,5} do
 		tfm.exec.addImage("192e0179669.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1,0,1)
		tfm.exec.addImage("192e017ca61.png", "!-1", 1200+(i*2400), y_factor-11, name, -1, 1,0,1)
	end

	-- mata ciliar
	for i=0,12 do tfm.exec.addImage("192e019006a.png","?1",-1200+(i*750),y_factor-88,name,1,0.5,0,1) end

	-- nuvens
	for i=0,4 do tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for j=0,4 do tfm.exec.addImage("181ba86195e.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for k=0,4 do tfm.exec.addImage("181ba86655c.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for l=0,4 do tfm.exec.addImage("181ba86b15a.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end

	-- montanhas de fundo
	for _,i in next,{0,2,4,6,8} do tfm.exec.addImage("18773217882.png","?1",-1200+(i*950),y_factor-315,name,0.5,0.5,0,0.35)	end
	for _,i in next,{1,3,5,7,9} do tfm.exec.addImage("18773217882.png","?1",-250+(i*950),y_factor-315,name,-0.5,0.5,0,0.35)	end

	-- céu
	tfm.exec.addImage("192e018e5fd.png","?1",-1200,-1000,name,50,3,0,0.25) 
	ui.setBackgroundColor("#1B622B")
end

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
	end
end

function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
end

function eventNewPlayer(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
		tfm.exec.setGameTime(72000)
		showMessage("<N>Este é um é o MEU rio. O mais lindo, o mais profundo, e porque não, o mais perigoso?\n\n<ROSE><b>Mapa feito por Samira#4387, Viego#0345 e Nurzak#7525.</b>\n<J>Agradecimentos especiais para Vitor5000000#0000 e Opaaaaaaaaaaaaa#2533.\n\n<N>Revisão 1.0\n\n<N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:\n<VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/refs/heads/master/Mapas-script/Samira%27s%20River.lua",name)
		showWater(name)
		ui.setMapName("<R>Samira's River<")
	end
end

function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
end

resetMap()