for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
system.disableChatCommandDisplay("mode")
debug.disableEventLog(true)
xml=''; changed=false; night=0; loop=0; data={}; lang={};
dolphins={{254,1421},{1027,1555}}; dolphins_r={{1690,1381},{2714,1415}};
dolphins1={{620,1468},{2380,1375}}; dolphins1_r={{1447,1495},{2986,1455}};
fish1={{1641,2096},{2644,2207},{3231,1726},{5436,1797}}; fish1_r={{2274,2046},{4321,1921},{4611,1692},{6414,2012},{7141,2204}};
fish2={{5874,2151},{3799,2134},{3489,1839},{1469,1966}}; fish2_r={{5279,2216},{4601,2157},{304,1842},{1335,1680}};
fish3={{427,1961},{859,2173},{2814,1912},{5588,2025}}; fish3_r={{1956,1904},{4355,2091},{6615,1800}};
fish4={{6326,2187},{2424,2207}}; fish4_r={{5350,2093},{3931,2111},{551,2131},{-68,2079}};
fish5={{1124,2096},{2947,2133},{6223,1956},{6846,2123}}; fish5_r={{460,2099},{3395,2191},{4739,1999}};
ray={{3937,2002},{6887,1661},{1897,2086},{106,2046}}; ray_r={{3261,1919},{4896,2112},{5899,1944},{904,1797}};
lang.br = {
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome3 = "<VP><b>Bem-vindo(a) a Casa Oceânica das Arraias Brancas.</b>\n\n<p align='left'><N>Este é um mapa-script cujo intuito é simular uma casa-resort de luxo no meio do oceano. Aproveite e curta!\n\n<J>Agradecimentos especiais para <b>Lynet#8558, Shun_kazami#7014, Maramara4#0000, Lacoste#8972, Irelia#7317, Some#2636, Jeancrazzy#0000 e Bielzinnfx#3859.</b>\n\n<N>Revisão 3.0",
	title = "<N>Casa Oceânica das Arraias Brancas<"
}
lang.en = {
	loadingmap = "Loading map. Please wait...<",
	welcome3 = "<VP><b>Welcome to White's Stingray Ocean House!</b>\n\n<p align='left'><N>This is a script map whose purpose is to simulate a luxury resort house in the middle of the ocean. Enjoy and enjoy!\n\n<J>Special thanks to <b>Lynet#8558, Shun_kazami#7014, Maramara4#0000, Lacoste#8972, Irelia#7317, Some#2636, Jeancrazzy#0000 and Bielzinnfx#3859.</b>\n\n<N>Revision 3.0",
	title = "<N>White's Stingray Ocean House<"
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end
function showNPCs(name)
	tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 5205,y = 727,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
end
function showWater(name)
	tfm.exec.addImage("189746c6144.png","?1",2840,1888,name)
	tfm.exec.addImage("189746f8a21.png","?1",6836,1979,name)
	tfm.exec.addImage("189746d10d2.png","!1",6638,2208,name)
	tfm.exec.addImage("189746e4cb8.png","!1",1482,2052,name)
	tfm.exec.addImage("189746e4cb8.png","!1",5262,2054,name)
	for a=1,rawlen(fish1) do
		tfm.exec.addImage("192e0192c52.png","?-1",fish1[a][1],fish1[a][2],name,-0.5,0.5)
	end
	for b=1,rawlen(fish1_r) do
		tfm.exec.addImage("192e0192c52.png","?-1",fish1_r[b][1],fish1_r[b][2],name,-0.5,0.5)
	end
	for a=1,rawlen(fish2) do
		tfm.exec.addImage("192e01943c1.png","?-1",fish2[a][1],fish2[a][2],name)
	end
	for b=1,rawlen(fish2_r) do
		tfm.exec.addImage("192e01943c1.png","?-1",fish2_r[b][1],fish2_r[b][2],name,-1,1)
	end
	for a=1,rawlen(fish3) do
		tfm.exec.addImage("192e0195b33.png","?-1",fish3[a][1],fish3[a][2],name)
	end
	for b=1,rawlen(fish3_r) do
		tfm.exec.addImage("192e0195b33.png","?-1",fish3_r[b][1],fish3_r[b][2],name,-1,1)
	end
	for a=1,rawlen(fish4) do
		tfm.exec.addImage("192e01972a4.png","?-1",fish4[a][1],fish4[a][2],name,0.25,0.25)
	end
	for b=1,rawlen(fish4_r) do
		tfm.exec.addImage("192e01972a4.png","?-1",fish4_r[b][1],fish4_r[b][2],name,-0.25,0.25)
	end
	for a=1,rawlen(fish5) do
		tfm.exec.addImage("192e0198a16.png","?-1",fish5[a][1],fish5[a][2],name)
	end
	for b=1,rawlen(fish5_r) do
		tfm.exec.addImage("192e0198a16.png","?-1",fish5_r[b][1],fish5_r[b][2],name,-1,1)
	end
	for d=1,rawlen(dolphins1) do
		tfm.exec.addImage("1860ee24f31.png","?-1",dolphins1[d][1],dolphins1[d][2],name,0.5,0.5)
	end
	for e=1,rawlen(dolphins1_r) do
		tfm.exec.addImage("1860ee24f31.png","?-1",dolphins1_r[e][1],dolphins1_r[e][2],name,-0.5,0.5)
	end
	for d=1,rawlen(dolphins) do
		tfm.exec.addImage("192e01914e1.png","?-1",dolphins[d][1],dolphins[d][2],name,0.5,0.5)
	end
	for e=1,rawlen(dolphins_r) do
		tfm.exec.addImage("192e01914e1.png","?-1",dolphins_r[e][1],dolphins_r[e][2],name,-0.5,0.5)
	end
	for d=1,rawlen(ray) do
		tfm.exec.addImage("18a053a43b9.png","?-1",ray[d][1],ray[d][2],name)
	end
	for e=1,rawlen(ray_r) do
		tfm.exec.addImage("18a053a43b9.png","?-1",ray_r[e][1],ray_r[e][2],name,-1,1)
	end
	tfm.exec.addImage("192e017f5a8.png", "!-1", -1200, 1394, name,28,8,0,1.1)
	for i=0,1 do tfm.exec.addImage("17be536e980.png","?1",-1200+(i*5200),1685,name,1,1); end
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), 1384, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), 1384, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, 1384, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), 1384, name)
	end
	for _,i in next,{1,3,5} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), 1384, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, 1384, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), 1384, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), 1384, name,-1,1)
	end
	for _,i in next,{0,2,4,6,8} do
		tfm.exec.addImage("192e01770df.png", "?1", -1200+(i*2400), 1284, name)
		tfm.exec.addImage("192e017b00d.png", "!-1", -1200+(i*2400), 1284, name,1,1)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("192e01770df.png", "?1", 1200+(i*2400), 1284, name, -1, 1)
		tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2400), 1284, name, -1, 1)
	end
	for i=0,6 do
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), 2295, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), 3020, name, 1, -3, 0, 1)
	end
	for i=1,6 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,6 do
		tfm.exec.addImage("181ba86195e.png","?1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86195e.png","?1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,6 do
		tfm.exec.addImage("181ba86655c.png","?1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86655c.png","?1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,6 do
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(5300,7500),math.random(-50,630),name)
	end
	tfm.exec.addImage("192e019a18c.png","?1",1848,1860,name)
	for _,h in next,{0,2,4} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",-1200+(h*1900),888,name,1,1,0,0.6)); end
	for _,h in next,{1,3} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",700+(h*1900),888,name,-1,1,0,0.6)) end
	data[name].backId2 = tfm.exec.addImage("1883b1394a4.png","!1",1040,-330,name)
	data[name].backId1 = tfm.exec.addImage("17fe3741e5f.jpg", "?1", -1200, -950, name,32,2.3)
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame("@7956637")
		ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName(text.loadingmap)
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
function eventTalkToNPC(name, npc)
	if npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! (●'u'●) ",name)
	end
end
function changeMapMode()
	if changed == true then
		if night == 0 then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.removeImage(data[name].backId2,true)
				tfm.exec.removeImage(data[name].backId1,true)
				if data[name] then for i=1,rawlen(data[name].backId3) do
					tfm.exec.removeImage(data[name].backId3[i],true)
				end end
				for i=0,5 do for j=0,1 do table.insert(data[name].backId3,tfm.exec.addImage("181b9de5c95.png","?1",-1200+(i*1920),-1050+(j*1080),name,1,1,0,0.15)) end end
				for _,h in next,{0,2,4} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",-1200+(h*1900),888,name,1,1,0,0.15)); end
				for _,h in next,{1,3} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",700+(h*1900),888,name,-1,1,0,0.15)) end
				data[name].backId2 = tfm.exec.addImage("1883b1394a4.png","!1",1040,-330,name,1,1,0,0.4)
				data[name].backId1 = tfm.exec.addImage("17e937f4f5a.png","?1",-800,16500,name,72,-3.6,0,0.75)
			end
			night=1
		elseif night == 1 then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.removeImage(data[name].backId2,true)
				tfm.exec.removeImage(data[name].backId1,true)
				if data[name] then for i=1,rawlen(data[name].backId3) do
						tfm.exec.removeImage(data[name].backId3[i],true)
				end end
				for i=0,5 do for j=0,1 do table.insert(data[name].backId3,tfm.exec.addImage("181b9de5c95.png","?1",-1200+(i*1920),-1050+(j*1080),name,1,1,0,1.5)) end end
				for _,h in next,{0,2,4} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",-1200+(h*1900),888,name,1,1,0,0.05)); end
				for _,h in next,{1,3} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",700+(h*1900),888,name,-1,1,0,0.05)) end
				data[name].backId2 = tfm.exec.addImage("1883b125925.png", "?1", 1800, 500,name,1,1,0,2)
				data[name].backId1 = tfm.exec.addImage("17fe3741e5f.jpg","?1",0,50,name,13,12,0,1)
			end
			night=2		
		elseif night == 2 then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.removeImage(data[name].backId2,true)
				tfm.exec.removeImage(data[name].backId1,true)
				if data[name] then for i=1,rawlen(data[name].backId3) do
					tfm.exec.removeImage(data[name].backId3[i],true)
				end end
				for _,h in next,{0,2,4} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",-1200+(h*1900),888,name,1,1,0,0.3)); end
				for _,h in next,{1,3} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",700+(h*1900),888,name,-1,1,0,0.3)) end
				data[name].backId2 = tfm.exec.addImage("1883b1394a4.png","!1",1040,-330,name)
				data[name].backId1 = tfm.exec.addImage("17fe3741e5f.jpg", "?1", -1200, -950, name,32,2.3)
			end
			night=0
		end
	end
end
function eventPlayerDied(name)
	tfm.exec.setPlayerGravityScale(name,0.9)
	if changed == true then
		tfm.exec.changePlayerSize(name,1)
		tfm.exec.setPlayerCollision(name,1)
		tfm.exec.respawnPlayer(name)
	end
end
function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
end
function eventNewPlayer(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
		tfm.exec.changePlayerSize(name,1)
		newData={
			["backId1"]=-1; ["backId2"]=-1; ["backId3"]={};
		};
		data[name] = newData;
		for i=0,3 do
			system.bindKeyboard(name,i,true,true)
		end
		ui.setMapName(text.title)
		showMessage(text.welcome3,name)
		ui.setBackgroundColor("#000000")
		showWater(name)
		showNPCs(name)
		if string.find(tfm.get.room.name,name) then
			table.insert(admin,name)
		end
	end
end
function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
	if changed == true then
		loop=loop+0.5
		if loop == 600 then
			changeMapMode()
			loop=0
		end
	end
end
resetMap()
