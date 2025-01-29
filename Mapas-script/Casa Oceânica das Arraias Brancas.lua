for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
system.disableChatCommandDisplay("mode")
debug.disableEventLog(true)
xml=''; changed=false; night=0; loop=0; a1={4505,265,2925,4066}; a2={1529,1493,1742,1862}; a3={3517,6260,1711,4423}; a4={1622,1551,1537,1864};
b1={888,2520,3095,4692,6810}; c1={560,1378,2048,2802,3307,4555,5369,6004,6750}; d1={1024,1536,2560,3072,4608,5120,6656,7168}; data={}; lang={};
lang.br = {
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome3 = "<VP><b>Bem-vindo(a) a Casa Oceânica das Arraias Brancas.</b>\n\n<p align='left'><N>Este é um mapa-script cujo intuito é simular uma casa-resort de luxo no meio do oceano. Aproveite e curta!\n\n<J>Agradecimentos especiais para <b>Lynet#8558, Shun_kazami#7014, Maramara4#0000, Lacoste#8972, Irelia#7317, Some#2636, Jeancrazzy#0000 e Bielzinnfx#3859.</b>\n\n<N>Revisão 2.1",
	title = "<N>Casa Oceânica das Arraias Brancas<"
}
lang.en = {
	loadingmap = "Loading map. Please wait...<",
	welcome3 = "<VP><b>Welcome to White's Stingray Ocean House!</b>\n\n<p align='left'><N>This is a script map whose purpose is to simulate a luxury resort house in the middle of the ocean. Enjoy and enjoy!\n\n<J>Special thanks to <b>Lynet#8558, Shun_kazami#7014, Maramara4#0000, Lacoste#8972, Irelia#7317, Some#2636, Jeancrazzy#0000 and Bielzinnfx#3859.</b>\n\n<N>Revision 2.1",
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
	for d=1,rawlen(c1) do tfm.exec.addImage("189746d76aa.png","?1",c1[d],2147,name); end
	for d=1,rawlen(d1) do tfm.exec.addImage("189746e4cb8.png","?1",d1[d],2070,name); end
	for d=1,rawlen(a2) do tfm.exec.addImage("18a053a43b9.png","?1",a1[d],a2[d],name,-1,1); end
	for d=1,rawlen(a4) do tfm.exec.addImage("18a053a43b9.png","?1",a3[d],a4[d],name); end
	for d=1,rawlen(b1) do tfm.exec.addImage("189746d10d2.png","?1",b1[d],2203,name); end
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("189749dd379.png", "?1", -1200+(i*2000), 1295, name, 1, 0.8, 0, 1)
		tfm.exec.addImage("189749dd379.png", "!-1", -1200+(i*2000), 1295, name, 1, 0.8, 0, 0.65)
	end
	for _,i in next,{1,3,5} do
 		tfm.exec.addImage("189749dd379.png", "?1", 800+(i*2000), 1295, name, -1, 0.8, 0, 1)
		tfm.exec.addImage("189749dd379.png", "!-1", 800+(i*2000), 1295, name, -1, 0.8, 0, 0.65)
	end
	tfm.exec.addImage("189749ce857.png", "?1", -1200, 1400, name, 8, 6, 0, 1)
	tfm.exec.addImage("189749ce857.png", "!-1023", -1200, 1934, name, 8, 6, 0, 0.6)
	tfm.exec.addImage("1897a80b341.png", "!-1023", -1200, 1834, name, 44, 1.2,0,0.75)
	for i=0,6 do
		tfm.exec.addImage("189746fe3a4.png", "!0", -1200+(i*2000), 2295, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "!0", -1200+(i*2000), 3020, name, 1, -3, 0, 1)
	end
	for i=0,1 do tfm.exec.addImage("17be536e980.png","!1",-1200+(i*5200),2380,name,1,1,0,0.75); end
	for i=1,2 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,2 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86195e.png","!1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,2 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86655c.png","!1",math.random(5300,7500),math.random(-50,630),name)
	end
	for i=1,2 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(-50,2300),math.random(-50,630),name)
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(5300,7500),math.random(-50,630),name)
	end
	for _,h in next,{0,2,4} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",-1200+(h*1900),888,name,1,1,0,0.3)); end
	for _,h in next,{1,3} do table.insert(data[name].backId3,tfm.exec.addImage("18773217882.png","?1",700+(h*1900),888,name,-1,1,0,0.3)) end
	data[name].backId2 = tfm.exec.addImage("1883b1394a4.png","!1",1040,-330,name)
	data[name].backId1 = tfm.exec.addImage("17fe3741e5f.jpg", "?1", -1200, -950, name,32,2.1)
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
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)",name)
	end
end
function eventChatCommand(name,message)
	if changed == true then
		if message == "mode" and name == "Samira#4387" then
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
					data[name].backId1 = tfm.exec.addImage("17fe3741e5f.jpg", "?1", -1200, -950, name,32,2.1)
				end
				night=0
			end
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
		if loop == 900 then
			eventChatCommand("Samira#4387","mode")
			loop=0
		end
	end
end
resetMap()
