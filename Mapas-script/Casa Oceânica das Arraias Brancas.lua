admin={""} -- Insiram seus nicknames aqui!

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA!!
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for i=0,13 do system.disableChatCommandDisplay(tostring(i)); end
system.disableChatCommandDisplay("mode");
for _,i in next,{"d1","d2","d3"} do system.disableChatCommandDisplay(i); end
debug.disableEventLog(true)

xml=''; y_factor=1305; changed=false; night=0; a1={4505,265,2925,4066}; a2={1529,1493,1742,1862}; a3={3517,6260,1711,4423}; a4={1622,1551,1537,1864};
b1={888,2520,3095,4692,6810}; c1={560,1378,2048,2802,3307,4555,5369,6004,6750}; d1={1024,1536,2560,3072,4608,5120,6656,7168};
data={};

ninjas={"Morganadxana#0000","Lacoste#8972","Leblanc#5342","Irelia#7317"}

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

function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end

function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end

function showWater(name)
	tfm.exec.addImage("189746c6144.png","!1",2840,2588,name)
	tfm.exec.addImage("189746f8a21.png","!1",6836,2679,name)
	for d=1,rawlen(c1) do tfm.exec.addImage("189746d76aa.png","?1",c1[d],2847,name); end
	for d=1,rawlen(d1) do tfm.exec.addImage("189746e4cb8.png","!-1",d1[d],2770,name); end
	for d=1,rawlen(a2) do tfm.exec.addImage("18a053a43b9.png","?1",a1[d],a2[d],name,-1,1); end
	for d=1,rawlen(a4) do tfm.exec.addImage("18a053a43b9.png","?1",a3[d],a4[d],name); end
	for d=1,rawlen(b1) do tfm.exec.addImage("189746d10d2.png","!1",b1[d],2903,name); end
	tfm.exec.addImage("192e017f5a8.png", "!-1", -1200, y_factor+99, name,28,8,0,1)
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+100, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+100, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+100, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+100, name)
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3658, name,1,-1) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+3658, name,1,-1)
	end
	for _,i in next,{1,3,5} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+100, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+100, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+100, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+100, name,-1,1)
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+3658, name,-1,-1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+3658, name,-1,-1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+3658, name,-1,-1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+3658, name,-1,-1) 
	end
	for _,i in next,{0,2,4,6,8} do
		tfm.exec.addImage("192e01770df.png", "?1", -1200+(i*2400), y_factor-11, name)
		tfm.exec.addImage("192e017b00d.png", "!-1", -1200+(i*2400), y_factor-11, name)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("192e01770df.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1)
		tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2400), y_factor-11, name, -1, 1)
	end
	for i=0,6 do
		tfm.exec.addImage("189746fe3a4.png", "!0", -1200+(i*2000), 2995, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "!0", -1200+(i*2000), 3720, name, 1, -3, 0, 1)
	end
	for i=0,1 do tfm.exec.addImage("17be536e980.png","!1",-1200+(i*5200),2280,name,1,1,0,0.75); end
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

function displayShark(name,type,reverse)
	if data[name].s == 1 then
		tfm.exec.changePlayerSize(name,2)
		data[name].id=tfm.exec.addImage("189746ed93c.png", "%"..name.."", -78, -69, nil, 0.25, 0.25)
	elseif data[name].s == 2 then
		tfm.exec.changePlayerSize(name,1.9)
		if reverse == true then
			data[name].id=tfm.exec.addImage("1860ee201fd.png","%"..name.."", -185, -35, nil, 1, 1)
		else
			data[name].id=tfm.exec.addImage("1860ee201fd.png","%"..name.."", 185, -35, nil, -1, 1)
		end
	elseif data[name].s == 3 then
		tfm.exec.changePlayerSize(name,4)
		if reverse == false then
			data[name].id=tfm.exec.addImage("1883efa1974.png","%"..name.."", -230, -90, nil)
		else
			data[name].id=tfm.exec.addImage("1883efa1974.png","%"..name.."", 230, -90, nil, -1, 1)
		end
	elseif data[name].s == 4 then
		tfm.exec.changePlayerSize(name,2.5)
		if reverse == false then
			data[name].id=tfm.exec.addImage("1883efb5982.png","%"..name.."", -300, -75, nil)
		else
			data[name].id=tfm.exec.addImage("1883efb5982.png","%"..name.."", 300, -75, nil, -1, 1)
		end
	elseif data[name].s == 5 then
		tfm.exec.changePlayerSize(name,1.8)
		if reverse == false then
			data[name].id=tfm.exec.addImage("185c2e9722e.png", "%"..name.."", 44, -65, nil, -1, 1)
		else
			data[name].id=tfm.exec.addImage("185c2e9722e.png", "%"..name.."", -54, -65, nil)
		end
	elseif data[name].s == 6 then
		tfm.exec.changePlayerSize(name,3.6)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18756e28db6.png", "%"..name.."", -270, -93, nil)
		else
			data[name].id=tfm.exec.addImage("18756e28db6.png", "%"..name.."", 270, -93, nil,-1,1)
		end
	elseif data[name].s == 7 then
		tfm.exec.changePlayerSize(name,3)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18756e2e178.png", "%"..name.."", -250, -115, nil)
		else
			data[name].id=tfm.exec.addImage("18756e2e178.png", "%"..name.."", 206, -115, nil,-1,1)
		end
	elseif data[name].s == 8 then
		tfm.exec.changePlayerSize(name,2.1)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18756e333d5.png", "%"..name.."", -150, -44, nil,0.5,0.5)
		else
			data[name].id=tfm.exec.addImage("18756e333d5.png", "%"..name.."", 150, -44, nil,-0.5,0.5)
		end
	elseif data[name].s == 9 then
		tfm.exec.changePlayerSize(name,2.6)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18a0539e298.png", "%"..name.."", 90, -90, nil,-1,1)
		else
			data[name].id=tfm.exec.addImage("18a0539e298.png", "%"..name.."", -90, -90, nil)
		end
	elseif data[name].s == 10 then
		tfm.exec.changePlayerSize(name,0.8)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18a053a43b9.png", "%"..name.."", 90, -78, nil,-1,1)
		else
			data[name].id=tfm.exec.addImage("18a053a43b9.png", "%"..name.."", -90, -78, nil)
		end
	elseif data[name].s == 11 then
		tfm.exec.changePlayerSize(name,2.5)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18a053a9ab9.png", "%"..name.."", -137, -58, nil)
		else
			data[name].id=tfm.exec.addImage("18a053a9ab9.png", "%"..name.."", 137, -58, nil,-1,1)
		end
	elseif data[name].s == 12 then
		tfm.exec.changePlayerSize(name,1.2)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18a053af7df.png", "%"..name.."", 90, -86, nil,-1,1)
		else
			data[name].id=tfm.exec.addImage("18a053af7df.png", "%"..name.."", -90, -86, nil)
		end
	elseif data[name].s == 13 then
		tfm.exec.changePlayerSize(name,1.2)
		if reverse == false then
			data[name].id=tfm.exec.addImage("18a053b5130.png", "%"..name.."", 90, -53, nil,-1,1)
		else
			data[name].id=tfm.exec.addImage("18a053b5130.png", "%"..name.."", -90, -53, nil)
		end
	end
end

function eventTalkToNPC(name, npc)
	if npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●) 🐄 <font face='Verdana'>",name)
	end
end

function eventChatCommand(name,message)
	if changed == true then
		if message == "0" then
		tfm.exec.setPlayerGravityScale(name,0.9)
		tfm.exec.killPlayer(name);
	end
	for i=1,13 do
		if message == tostring(i) then
			data[name].s=i
			tfm.exec.removeImage(data[name].id)
			displayShark(name,data[name].s,false)
			tfm.exec.setPlayerCollision(name,3)
		end
	end
	if verifyNinjas(name) == true or verifyAdmin(name) == true then
	if message == "mode" then
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
	if message == "d1" then
		xml=''; changed=false; night=0; map_depth=1;
		resetMap();
	elseif message == "d2" then
		xml=''; changed=false; night=0; map_depth=2;
		resetMap();
	elseif message == "d3" then
		xml=''; changed=false; night=0; map_depth=3;
		resetMap();
	end
	end
	end
end

function eventPlayerDied(name)
	tfm.exec.setPlayerGravityScale(name,0.9)
	if changed == true then
		tfm.exec.changePlayerSize(name,1)
		tfm.exec.setPlayerCollision(name,1)
		tfm.exec.removeImage(data[name].id)
		data[name].id=-1
		data[name].s=0
		tfm.exec.respawnPlayer(name)
	end
end

function eventKeyboard(name,key,down,x,y)
	if key >= 0 and key <= 3 then
		if data[name] and data[name].s > 0 then
			if key == 2 then
				tfm.exec.removeImage(data[name].id)
				displayShark(name,data[name].s,false)
			elseif key == 0 then
				tfm.exec.removeImage(data[name].id)
				displayShark(name,data[name].s,true)
			end
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
		newData={
			["s"]=0; ["id"]=-1; ["backId1"]=-1; ["backId2"]=-1; ["backId3"]={};
		};
		data[name] = newData;
		for i=0,3 do
			system.bindKeyboard(name,i,true,true)
		end
		ui.setMapName("<N>Casa Oceânica das Arraias Brancas - <ROSE>Morgana's Mechanical Maps<")
		showMessage("<VP><b>Bem-vindo(a) a Casa Oceânica das Arraias Brancas.</b><br><br><p align='left'><N>Este é um mapa-script cujo intuito é simular uma casa-resort de luxo no meio do oceano. Aproveite e curta!<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para <b>Lynet#8558, Shun_kazami#7014, Maramara4#0000, Lacoste#8972, Irelia#7317, Some#2636, Jeancrazzy#0000 e Bielzinnfx#3859.</b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Mapas-script/Casa%20Oceânica%20das%20Arraias%20Brancas.lua<br><br><N>Revisão 1.4<br><br<BL>Digite ! juntamente com um número de 0 a 13 (ex.: !1) para virar um animal marinho.",name)
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
end

resetMap()
