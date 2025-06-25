for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","DebugCommand","MortCommand","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay(nil, true)
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(8) end
y_factor=1800; data={}; mapa="@7963647"; xml=''; changed=false; lang={}; stage=1; stage_time=0;
ground={type = 14,width = 4000,height = 100,miceCollision = true, friction = 1, groundCollision = true, color = 0}
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, color = 0}
f1={{157,3086},{5409,3201},{7248,2980},{9620,3100}}; f2={{1519,3249},{7478,3144},{9383,3100}}; f3={{-212,3057},{2035,3218},{7035,3083},{10372,3104}}; f4={{10425,2843},{10906,3179},{11531,3243},{11961,2852},{12425,3189},{12913,3061}}; f5={{4965,2847},{6181,3245},{5818,3218},{10828,3261}}; 
f1_r={{2610,3104},{6108,3031},{6713,3141},{10254,3090}}; f2_r={{4260,3136},{7910,3135},{10000,3044}}; f3_r={{601,3086},{5646,3193},{7703,3102}}; f4_r={{11292,3161},{11813,3236},{12210,2753},{12495,3252}}; f5_r={{754,3225},{5239,2958},{8585,3000},{6837,2839}};
lang.br = {
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome = "<VP><b>Bem-vindo(a) à Mansão Selvagem 'Luisin' Alvorada da Floresta.</b>\n\n<p align='left'><N>Este é um mapa-script de mansão selvagem no meio da floresta, banhada por um rio opaco, profundo e perigoso e que possui uma grande natureza ao seu redor. Os quartos são de altíssima qualidade, e não faltam opções de diversão. Divirtam-se com cuidado!\n\n<J>Agradecimentos especiais para <b>Luisin#1717, Shun_kazami#7014, Fabia_sheen#2561, Malzahar#8178, Nekan#0000 e G484#5825.</b>\n\n<N>Revisão 1.2",
	title = "<VP>Mansão Selvagem 'Luisin' Alvorada da Floresta<",
	board1 = "<VP><b>Seja bem-vindo(a) a Mansão Selvagem 'Luisin' Alvorada da Floresta.</b>\n\n<J>Uma mansão gigantesca, feita inteiramente de madeira, localizada no meio desta floresta tropical, banhada por rios gelados e profundos e que possui muitas opções de diversão.\n<N>Temos diversos tipos de refeições, quartos com ar-condicionado, piscina externa, sala de estar com televisão, muita área externa, e, de quebra, uma torre de observação no meio do rio com escorregador turbinado. Não é demais?\n\nDivirta-se, curta a natureza e tome muito cuidado com os bichos!",
	warning1 = "Devido a alguns acidentes que ocorreram nesta área, o acesso ao rio foi fechado deste lado da casa, devendo ser feito somente pelo outro lado.",
	warning2 = "<V>A equipe de segurança da Mansão Selvagem 'Luisin' Alvorada da Floresta não se responsabiliza por afogamentos, picadas de cobra, batidas de cabeça ou outros acidentes causados pelo uso da tirolesa. Portanto, desfrute com cuidado.",
	warning3 = "<V>Por favor, evite nadar no rio sem o uso das canoas ou das boias.\nJá tivemos relatos de algumas pessoas que morreram por conta de ataques de tubarões e de peixes candiru que vivem no rio, e outras que morreram simplesmente for terem ficado por muito tempo na água.\n\nSe você tiver coragem e ir até o fundo, terá o desprazer de provar o que acabei de dizer...",
	warning4 = "Tenha cuidado: a água do rio é muito gelada.\nDescer muito fundo ou ficar muito tempo na água pode congelar seu rato.",
}
lang.en = {
	loadingmap = "Loading map. Please wait...<",
	welcome = "<VP><b>Welcome to the Luisin's Dawn of the Forest Wild Mansion!</b>\n\n<p align='left'><N>This is a script map of a wild mansion in the middle of the forest, bathed by an opaque, deep and dangerous river and surrounded by great nature. The rooms are of the highest quality, and there is no shortage of entertainment options. Have fun with caution!\n\n<J>Special thanks to <b>Luisin#1717, Shun_kazami#7014, Fabia_sheen#2561, Malzahar#8178, Nekan#0000 and G484#5825.</b>\n\n<N>Revision 1.2",
	title = "<VP>Luisin's Dawn of the Forest Wild Mansion<",
	board1 = "<VP><b>Welcome to the Luisin's Dawn of the Forest Wild Mansion.</b>\n\n<J>A gigantic mansion, made entirely of wood, located in the middle of this tropical forest, bathed by very cold and deep rivers, and which has many entertainment options.\n<N>We have several types of meals, air-conditioned rooms, an outdoor pool, a living room with a television, lots of outdoor space, and, to top it off, an observation tower in the middle of the river with a turbocharged slide. Isn't that great?\n\nHave fun, enjoy the nature and be very careful with the dangers!",
	warning1 = "Due to some accidents that occurred in this area, the access to the river was closed on this side of the house and must only be done from the other side.",
	warning2 = "The security team of the Luisin's Dawn of the Forest Wild Mansion is not responsible for drownings, snake attacks, head injuries or other accidents caused by using the zip line. Enjoy with caution.",
	warning3 = "<V>Please avoid swimming in the river without using canoes or floats.\nWe have had reports of some people dying from attacks by sharks and candiru fish that live in the river, and others dying simply from staying in the water for too long.\n\nIf you have the courage to go to the bottom, you will have the displeasure of experiencing what I just said...",
	warning4 = "Be careful: the river water is very cold.\nGoing too deep or staying in the water too long can freeze your mouse.",
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
		ui.addPopup(0,0,temp_text,name,200,75,400,true)
	end
end
function showNPCs(name)
	tfm.exec.addNPC("Luisin#1717",{title = 62, look = "46;57,5,11_312e23+312e23,0,6_312e23+ffffff,0,0,0,0,0,0,0",x = 5845,y = 1480,female = false,lookLeft = true,lookAtPlayer = true,interactive = true},name)
	tfm.exec.addNPC("Nekan#0000",{title = 71, look = "97;127_3e3643+ffffff,45_3e3643+3e3643+3e3643+3e3643+3e3643+3e3643,94_3e3643+3e3643+3e3643+e9cebb+e9cebb+3e3643+3e3643+3e3643+7c6f66+3e3643,0,0,50_3e3643,0,84,0,0,0,1_0+0",x = 8586,y = 1042,female = false,lookLeft = true,lookAtPlayer = true,interactive = false},name)
	tfm.exec.addNPC("Malzahar#8178",{title = 3, look = "176;292,46_340d8e,0,0,108_1f1ba9+6731d2+6731d2+6731d2+6731d2+6731d2+8a2eb4+420bad+4c2ac5+1f0f93,118,84_8a2eb4+8a2eb4+8a2eb4+8a2eb4+420bad+340d8e,85,43_340d8e+340d8e+340d8e+6731d2+340d8e+340d8e,0,0,0",x = 1512,y = 1328,female = false,lookLeft = false,lookAtPlayer = true,interactive = false},name)
end
function eventTalkToNPC(name, npc)
	if npc == "Luisin#1717" then
		c=math.random(0,100)
		if c == 50 then
			tfm.exec.killPlayer(name)
			tfm.exec.addShamanObject(90,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y,0,0,1,false)
		end
	end
end
function changeBackground(name)
	if data[name] then
		for i=1,rawlen(data[name].images) do
			tfm.exec.removeImage(data[name].images[i],false)
		end
		data[name].images={}
		ui.removeTextArea(0,name)
		if stage == 1 then
			ui.setBackgroundColor("#244D1A")
			table.insert(data[name].images,tfm.exec.addImage("192e018e5fd.png","?10",-1200,-1000,name,80,5,0,0.2875))
		elseif stage == 2 then
			ui.setBackgroundColor("#20230B")
			table.insert(data[name].images,tfm.exec.addImage("192e018e5fd.png","?10",-1200,-1000,name,80,5,0,0.15))
		elseif stage == 3 then
			ui.setBackgroundColor("#1A0B06")
			for j=0,13 do
				for i=0,2 do
					table.insert(data[name].images,tfm.exec.addImage("18164d398ff.png","?10",-800+(j*1920),-700+(i*1080),name,1,1,0,0.1))
				end
			end
			table.insert(data[name].images,tfm.exec.addImage("192e018e5fd.png","?10",-1200,-1000,name,80,5,0,0.1))
			ui.addTextArea(0,"",nil,-1000,-500,3000,1500,0x010101,0x010101,0.1,true)
		elseif stage == 4 then
			ui.setBackgroundColor("#000000")
			for j=0,13 do
				for i=0,2 do
					table.insert(data[name].images,tfm.exec.addImage("18164d398ff.png","?10",-800+(j*1920),-700+(i*1080),name))
				end
			end
			ui.addTextArea(0,"",name,-1000,-500,3000,1500,0x010101,0x010101,0.25,true)
		end
	end
end
function showWater(name)
	tfm.exec.playMusic("/cite18/amb/302.mp3", "jg_backg", 20, true, true, name)
	ui.addTextArea(21, "<a href='event:board1'>                                                                  ",name,3538,1594,54,70,0,0,1.2,false)
	ui.addTextArea(22, "<a href='event:warning1'>                                                                       ",name,9048,1442,50,38,0,0,1.2,false)
	ui.addTextArea(23, "<a href='event:warning2'>                                                                       ",name,11434,1098,50,38,0,0,1.2,false)
	ui.addTextArea(24, "<a href='event:warning3'>                                                                       ",name,2486,1686,46,30,0,0,1.2,false)

	tfm.exec.addImage("19650c65000.png", "+1", -217, -32, name)
	tfm.exec.addImage("19650c68474.png", "+2", -217, -32, name)
	tfm.exec.addImage("19650c69be5.png", "+3", -217, -32, name)
	for d=1,rawlen(f1) do tfm.exec.	addImage("192e0192c52.png","?-1",f1[d][1],f1[d][2]-400,name,0.5,0.5) end
	for e=1,rawlen(f1_r) do tfm.exec.addImage("192e0192c52.png","?-1",f1_r[e][1],f1_r[e][2]-400,name,-0.5,0.5) end
	for d=1,rawlen(f2) do tfm.exec.addImage("192e01943c1.png","?-1",f2[d][1],f2[d][2]-400,name)	end
	for e=1,rawlen(f2_r) do tfm.exec.addImage("192e01943c1.png","?-1",f2_r[e][1],f2_r[e][2]-400,name,-1) end
	for d=1,rawlen(f3) do tfm.exec.addImage("192e0195b33.png","?-1",f3[d][1],f3[d][2]-400,name,0.5,0.5)	end
	for e=1,rawlen(f3_r) do tfm.exec.addImage("192e0195b33.png","?-1",f3_r[e][1],f3_r[e][2]-400,name,-0.5,0.5) end
	for d=1,rawlen(f4) do tfm.exec.addImage("192e01972a4.png","?-1",f4[d][1],f4[d][2]-400,name,0.5,0.5)	end
	for e=1,rawlen(f4_r) do tfm.exec.addImage("192e01972a4.png","?-1",f4_r[e][1],f4_r[e][2]-400,name,-0.5,0.5) end
	for d=1,rawlen(f5) do tfm.exec.addImage("192e0198a16.png","?-1",f5[d][1],f5[d][2]-400,name)	end
	for e=1,rawlen(f5_r) do tfm.exec.addImage("192e0198a16.png","?-1",f5_r[e][1],f5_r[e][2]-400,name,-1) end
	tfm.exec.addImage("18756e28db6.png", "?0", 6878, 2472, name,-1,1)
	tfm.exec.addImage("18756e2e178.png", "?0", 4391, 2515, name)
	tfm.exec.addImage("18756e333d5.png", "?0", 3782, 2614, name,-1,1)
	tfm.exec.addImage("189746e4cb8.png", "!1", 3131, 2708, name)
	tfm.exec.addImage("189746d76aa.png", "?1", 7100, 2786, name)
	tfm.exec.addImage("185c2e9722e.png", "?1", 2480, 2780, name)
	tfm.exec.addImage("19650c5349f.png", "?0", 1500, 2430, name)
	tfm.exec.addImage("192e019a18c.png", "!1", 7521, 2580, name)
	tfm.exec.addImage("192e019a18c.png", "!1", 3813, 2566, name)
	tfm.exec.addImage("1877322de4e.png", "?1", 2790, 910, name)
	tfm.exec.addImage("1877322de4e.png", "?1", 3916, 171, name,-1,1)
	tfm.exec.addImage("187732271a7.png", "?1", 1880, 1140, name)
	tfm.exec.addImage("187732271a7.png", "?1", 520, 1040, name,-1,1)
	tfm.exec.addImage("187732271a7.png", "?1", 8968, 328, name)
	tfm.exec.addImage("187732271a7.png", "?1", 12450, 950, name,-1,1)
	tfm.exec.addImage("1877321eda8.png", "?1", 2034, 796, name)
	tfm.exec.addImage("1877321eda8.png", "?1", 884, 261, name,-1,1)
	tfm.exec.addImage("1877321eda8.png", "?1", 6353, 134, name)
	tfm.exec.addImage("1877321eda8.png", "?1", 10292, 1038, name,-1,1)
	tfm.exec.addImage("18773209c5b.png", "?1", 9720, 663, name)
	tfm.exec.addImage("18773209c5b.png", "?1", 9654, 1158, name,-1,1)
	tfm.exec.addImage("18773209c5b.png", "?1", 2700, 1030, name)
	tfm.exec.addImage("18773209c5b.png", "?1", 734, 1214, name)
	tfm.exec.addImage("18773209c5b.png", "?1", 2552, 129, name,-1,1)
	tfm.exec.addPhysicObject(-1,-50,2000,barrier)
	tfm.exec.addPhysicObject(-2,13000,2000,barrier)
	tfm.exec.addPhysicObject(-3,-1000,3050,ground)
	tfm.exec.addPhysicObject(-4,3000,3050,ground)
	tfm.exec.addPhysicObject(-5,7000,3050,ground)
	tfm.exec.addPhysicObject(-6,11000,3050,ground)
	tfm.exec.addImage("185c2e9252b.png", "?-1", 7334, 1094, name,1,1)
	tfm.exec.addImage("185c2e9252b.png", "!-20", 7334, 1094, name,1,1,0,0.6)
	for a=0,29 do
		tfm.exec.addImage("181ba85ccc2.png","?2",math.random(-400,14000),math.random(-200,1300),name,1,1,0,(math.random(70,100)/100));
		tfm.exec.addImage("181ba86195e.png","?2",math.random(-400,14000),math.random(-200,1300),name,1,1,0,(math.random(70,100)/100));
		tfm.exec.addImage("181ba86655c.png","?2",math.random(-400,14000),math.random(-200,1300),name,1,1,0,(math.random(70,100)/100));
		tfm.exec.addImage("181ba86b15a.png","?2",math.random(-400,14000),math.random(-200,1300),name,1,1,0,(math.random(70,100)/100));
	end
	for a=0,7 do
		tfm.exec.addImage("181ba85ccc2.png","!2",math.random(-400,2500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86195e.png","!2",math.random(-400,2500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86655c.png","!2",math.random(-400,2500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86b15a.png","!2",math.random(-400,2500),math.random(-150,600),name,0.5,0.5);
	end
	for a=0,8 do
		tfm.exec.addImage("181ba85ccc2.png","!2",math.random(7500,13500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86195e.png","!2",math.random(7500,13500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86655c.png","!2",math.random(7500,13500),math.random(-150,600),name,0.5,0.5);
		tfm.exec.addImage("181ba86b15a.png","!2",math.random(7500,13500),math.random(-150,600),name,0.5,0.5);
	end
	for i=0,9 do
		tfm.exec.addImage("189746fe3a4.png", "?0", -1200+(i*2000), 2930, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "?0", -1200+(i*2000), 3670, name, 1, -3, 0, 1)
	end
	tfm.exec.addImage("19650c70348.png", "!-20", -1200, y_factor+23, name,120,10,0,1.03)
	tfm.exec.addImage("19650c70348.png", "!-20", -1200, y_factor+4023, name,120,-10,0,1.03)
	tfm.exec.addImage("1897471d01c.png", "?2", 875, 2450, name,-1,1,0.2,1)
	for o=11,14 do
		tfm.exec.addImage("183b4bf34ba.png","+"..o.."",-50,-29,name)
	end
	for _,i in next,{0,2,4,6,8} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), y_factor+30, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), y_factor+30, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+30, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), y_factor+30, name)
	end
	for _,i in next,{1,3,5,7,9} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), y_factor+30, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, y_factor+30, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), y_factor+30, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), y_factor+30, name,-1,1)
	end
	for _,i in next,{0,2,4,6,8} do
		tfm.exec.addImage("19650c6cc69.png", "?1", -1200+(i*2400), y_factor-11, name,1,1,0,1)
		tfm.exec.addImage("19650c6ee85.png", "!-10", -1200+(i*2400), y_factor-31, name,1,1,0,1)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("19650c6cc69.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1,0,1)
		tfm.exec.addImage("19650c6ee85.png", "!-10", 1200+(i*2400), y_factor-31, name, -1, 1,0,1)
	end
	for i=0,24 do tfm.exec.addImage("192e019006a.png","?0",-1200+(i*750),y_factor-170,name,1,1,0,1) end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "board1" then
		showMessage(text.board1,name)
	elseif callback == "warning1" then
		showMessage(text.warning1,name)
	elseif callback == "warning2" then
		showMessage(text.warning2,name)
	elseif callback == "warning3" then
		showMessage(text.warning3,name)
	end
end
function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
	if changed == false then
		ui.setMapName(text.loadingmap)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame(mapa)
		ui.addTextArea(0,"",nil,-1000,-500,3000,1500,0x6a7495,0x6a7495,1.2,true)
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
function eventNewPlayer(name)
	if changed == true then
		ui.setMapName(text.title)
		showWater(name)
		showMessage(text.welcome,name)
		showNPCs(name)
		tfm.exec.respawnPlayer(name)
		tfm.exec.setGameTime(72000)
		newData={
			["w"]=false; ["u"]=0; ["f"]=0; ["d"]=0; ["t1"]=0; ["t2"]=0; ["fr"]=false; ["images"]={};
		};
		data[name] = newData;
		changeBackground(name)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
	if changed == true then
		stage_time=stage_time+0.5
		if stage_time % 360 == 0 then
			stage=stage+1
			if stage >= 5 then stage=1; end
			for name,player in next,tfm.get.room.playerList do
				if data[name] then changeBackground(name); end
			end
		end
		for name,player in next,tfm.get.room.playerList do
			if data[name] then
				if tfm.get.room.playerList[name].y >= y_factor-8 and tfm.get.room.playerList[name].isDead == false then
					data[name].t2=data[name].t2+1
					if data[name].f == 0 then
						tfm.exec.playSound("/cite18/sploutch1.mp3", 100, nil, y_factor, name)
						data[name].f=1
					end
					if data[name].t1 < 0.4 and data[name].t2 <= 1600 and data[name].fr == false then
						data[name].t1=data[name].t1+0.0005
						tfm.exec.setPlayerGravityScale(name,1+data[name].t1)
					end
					if data[name].t2 == 1800 then
						data[name].t1=9999
						tfm.exec.setPlayerGravityScale(name,1.8)
					end
					if data[name].t2 == 2040 then
						tfm.exec.killPlayer(name)
						tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 115, nil, nil, name)
						tfm.exec.addShamanObject(54,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y,0,0,1,false)
					end
					if tfm.get.room.playerList[name].y >= y_factor+25 then
						data[name].d=data[name].d+math.floor(math.pow((tfm.get.room.playerList[name].y-y_factor)/40,1.9)/5)
						if data[name].d >= 100 and data[name].w == false then
							data[name].w=true
							showMessage(text.warning4,name)
						end
						if data[name].d >= 12000 then
							if data[name].fr == false then
								tfm.exec.freezePlayer(name)
								data[name].fr=true
								tfm.exec.setPlayerGravityScale(name,1.9)
							end
						end
						if data[name].d >= 15000 then
							tfm.exec.killPlayer(name)
							tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 115, nil, nil, name)
							tfm.exec.addShamanObject(54,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y,0,0,1,false)
						end
					end
				else
					if data[name].f == 1 then
						tfm.exec.playSound("/cite18/sploutch2.mp3", 100, nil, y_factor, name)
						data[name].f=0
					end
					if data[name].t1 > 0 then
						data[name].t1=0
						data[name].t2=0
						tfm.exec.setPlayerGravityScale(name,1)
					end
				end
				if tfm.get.room.playerList[name].y >= y_factor+25 and tfm.get.room.playerList[name].isDead == false then
					if data[name].u == 0 then
						tfm.exec.stopMusic("jg_backg", nil)
						tfm.exec.playMusic("/cite18/amb/401.mp3", "underw", 75, true, true, name)
						data[name].u=1
					end
				else
					if data[name].u == 1 then
						tfm.exec.stopMusic("underw", name)
						tfm.exec.playMusic("/cite18/amb/302.mp3", "jg_backg", 20, true, true, name)
						data[name].u=0
						data[name].d=0
					end
				end
			end
		end
	end
end
resetMap();
