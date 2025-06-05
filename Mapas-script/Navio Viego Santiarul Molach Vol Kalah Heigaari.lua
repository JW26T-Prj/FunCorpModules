for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","DebugCommand","MinimalistMode","PhysicalConsumables","MortCommand"} do
	tfm.exec["disable"..f](true)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(12) end
debug.disableEventLog(true)
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, foreground = false}
wood={type = 14,width = 800,height = 20,miceCollision = true, friction = 0.5, groundCollision = true}
dolphins={{6793,2174},{6183,2264},{7344,2066}}; dolphins_r={{7170,2121},{6536,2592},{7568,2098}};
dolphins1={{6284,2356},{6167,3000},{6911,2204}}; dolphins1_r={{6722,2381},{6835,2075},{7641,2089}};
fish1={{-188,4304},{2015,4314},{2735,4074},{4079,4041},{3385,3441},{452,3344}}; fish1_r={{3399,4347},{4875,3457},{3349,4014},{1615,3754}};
fish2={{681,4401},{1867,4022},{3301,4254},{4581,4383}}; fish2_r={{1322,3851},{2872,3971},{5049,3707}};
fish3={{282,4197},{2309,4374},{4432,3384},{5312,3867}}; fish3_r={{3922,4444},{972,4041},{1692,4337}};
fish4={{1315,4451},{4719,4427},{2965,4187}}; fish4_r={{392,4344},{2002,3504}};
fish5={{1899,4224},{2645,4341},{3652,4131},{4875,4284}}; fish5_r={{5029,4087},{4399,3891},{2502,3634},{185,3827}};
xml=''; changed=false; y_factor=1898; boat_factor=-150; depth_factor=980; mapa="@7967014"; lang={};
lang.br = {
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome4 = "<VP><b>Bem-vindo(a) ao Navio Viego Santiarul Molach Vol Kalah Heigaari.</b>\n\n<p align='left'><N>Este é um mapa-script de navio pirata. Na verdade, é uma casa completa dentro de um navio pirata, e tem tudo o que uma casa 'normal' possui e mais um pouco... Divirtam-se!\n\n<J>Agradecimentos especiais para Lacoste#8972, Shun_kazami#7014, Fabricio#0519, Yuh#0748, Tanatosl#0000 e Miss_fortune#9548.\n\n<N>Revisão 2.3",
	title = "<VP>Navio Viego Santiarul Molach Vol Kalah Heigaari<"
}
lang.en = {
	loadingmap = "Loading map. Please wait...<",
	welcome4 = "<VP><b>Welcome to the Viego Santiarul Molach Vol Kalah Heigaari's Ship!</b>\n\n<p align='left'><N>This is a pirate ship script map. It's actually a complete house inside a pirate ship, and has everything a 'normal' house has and more... Enjoy!\n\n<J>Special thanks to Lacoste#8972, Shun_kazami#7014, Fabricio#0519, Yuh#0748, Tanatosl#0000 and Miss_fortune#9548.\n\n<N>Revision 2.3",
	title = "<VP>Viego Santiarul Molach Vol Kalah Heigaari's Ship<"
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
function showWater(name)
	tfm.exec.addImage("1877322de4e.png","!1",8046,708+boat_factor,name)
	tfm.exec.addImage("1877322de4e.png","!1",1329,408+boat_factor,name,-1,1)
	tfm.exec.addImage("1877322de4e.png","!1",59,885+boat_factor,name)
	tfm.exec.addImage("187732271a7.png","!1",589,531+boat_factor,name)
	tfm.exec.addImage("187732271a7.png","!1",2396,175+boat_factor,name)
	tfm.exec.addImage("1877321eda8.png","!1",5249,681+boat_factor,name)
	tfm.exec.addImage("1877321eda8.png","!1",6609,811+boat_factor,name,-1,1)
	tfm.exec.addImage("18773209c5b.png","!1",8656,691+boat_factor,name)

	tfm.exec.addImage("189746d10d2.png","!1",2040,4450,name)
	tfm.exec.addImage("189746d76aa.png","!1",4181,4381,name)
	tfm.exec.addImage("189746e4cb8.png","!1",2123,4299,name)
	tfm.exec.addImage("189746e4cb8.png","!1",4067,4291,name)
	tfm.exec.addImage("192e019a18c.png","?0",-481,4043,name)
	tfm.exec.addImage("192e019a18c.png","!0",7723,1697,name)

	tfm.exec.addImage("189746ed93c.png","?1",-16,3344,name,0.5,0.5)
	tfm.exec.addImage("1860ee201fd.png","?-1",9346,1233,name)
	tfm.exec.addImage("1897471d01c.png","?10",-303,3886,name)
	tfm.exec.addImage("1860ee29c2f.png","?1",3413,4144,name)
	tfm.exec.addImage("1860ee29c2f.png","?1",2581,4092,name)
	tfm.exec.addImage("1860ee29c2f.png","?1",1182,3994,name)
	tfm.exec.addImage("1883efa1974.png","?1",4020,3469,name,-1,1)
	tfm.exec.addImage("18756e388d1.png","?1",1944,3637,name)
	tfm.exec.addImage("1883efb5982.png","?1",5319,3275,name,-1,1)
	tfm.exec.addImage("185c2e9722e.png","?1",1446,4118,name,-1,1)
	tfm.exec.addImage("18756e28db6.png","?1",2493,3321,name)
	tfm.exec.addImage("18756e2e178.png","?1",5622,2841,name,-1,1)
	tfm.exec.addImage("18756e333d5.png","?1",615,4187,name)
	for a=1,rawlen(fish1) do
		tfm.exec.addImage("192e0192c52.png","?0",fish1[a][1],fish1[a][2]+boat_factor,name,-0.5,0.5)
	end
	for b=1,rawlen(fish1_r) do
		tfm.exec.addImage("192e0192c52.png","?0",fish1_r[b][1],fish1_r[b][2]+boat_factor,name,-0.5,0.5)
	end
	for a=1,rawlen(fish2) do
		tfm.exec.addImage("192e01943c1.png","?0",fish2[a][1],fish2[a][2]+boat_factor,name)
	end
	for b=1,rawlen(fish2_r) do
		tfm.exec.addImage("192e01943c1.png","?0",fish2_r[b][1],fish2_r[b][2]+boat_factor,name,-1,1)
	end
	for a=1,rawlen(fish3) do
		tfm.exec.addImage("192e0195b33.png","?0",fish3[a][1],fish3[a][2]+boat_factor,name)
	end
	for b=1,rawlen(fish3_r) do
		tfm.exec.addImage("192e0195b33.png","?0",fish3_r[b][1],fish3_r[b][2]+boat_factor,name,-1,1)
	end
	for a=1,rawlen(fish4) do
		tfm.exec.addImage("192e01972a4.png","?0",fish4[a][1],fish4[a][2]+boat_factor,name,0.25,0.25)
	end
	for b=1,rawlen(fish4_r) do
		tfm.exec.addImage("192e01972a4.png","?0",fish4_r[b][1],fish4_r[b][2]+boat_factor,name,-0.25,0.25)
	end
	for a=1,rawlen(fish5) do
		tfm.exec.addImage("192e0198a16.png","?0",fish5[a][1],fish5[a][2]+boat_factor,name)
	end
	for b=1,rawlen(fish5_r) do
		tfm.exec.addImage("192e0198a16.png","?0",fish5_r[b][1],fish5_r[b][2]+boat_factor,name,-1,1)
	end
	for d=1,rawlen(dolphins1) do
		tfm.exec.addImage("1860ee24f31.png","?0",dolphins1[d][1],dolphins1[d][2]+boat_factor,name,0.5,0.5)
	end
	for e=1,rawlen(dolphins1_r) do
		tfm.exec.addImage("1860ee24f31.png","?0",dolphins1_r[e][1],dolphins1_r[e][2]+boat_factor,name,-0.5,0.5)
	end
	for d=1,rawlen(dolphins) do
		tfm.exec.addImage("192e01914e1.png","?0",dolphins[d][1],dolphins[d][2]+boat_factor,name,0.5,0.5)
	end
	for e=1,rawlen(dolphins_r) do
		tfm.exec.addImage("192e01914e1.png","?0",dolphins_r[e][1],dolphins_r[e][2]+boat_factor,name,-0.5,0.5)
	end
	tfm.exec.addPhysicObject(-1,-125,2830+boat_factor,barrier)
	tfm.exec.addPhysicObject(-2,9800,2830+boat_factor,barrier)
	for j=1,12 do
		tfm.exec.addPhysicObject(j+333,-400+(j*800),3515+depth_factor,wood)
	end
	ui.addTextArea(8972, "<a href='event:pw'>                                 ",name,4142,1100+boat_factor,58,30,0,0,1.0,false)
	ui.addTextArea(1027, "<a href='event:exit'>                                      ",name,4220,1163+boat_factor,50,30,0,0,1.0,false)
	for a=0,24 do
		tfm.exec.addImage("181ba85ccc2.png","?2",math.random(-400,9000),math.random(-200,1600),name,1,1,0,(math.random(50,100)/100));
		tfm.exec.addImage("181ba86195e.png","?2",math.random(-400,9000),math.random(-200,1600),name,1,1,0,(math.random(50,100)/100));
		tfm.exec.addImage("181ba86655c.png","?2",math.random(-400,9000),math.random(-200,1600),name,1,1,0,(math.random(50,100)/100));
		tfm.exec.addImage("181ba86b15a.png","?2",math.random(-400,9000),math.random(-200,1600),name,1,1,0,(math.random(50,100)/100));
	end
	for a=0,7 do
		tfm.exec.addImage("181ba85ccc2.png","!2",math.random(-400,5000),math.random(-250,400),name,0.5,0.5);
		tfm.exec.addImage("181ba86195e.png","!2",math.random(-400,5000),math.random(-250,400),name,0.5,0.5);
		tfm.exec.addImage("181ba86655c.png","!2",math.random(-400,5000),math.random(-250,400),name,0.5,0.5);
		tfm.exec.addImage("181ba86b15a.png","!2",math.random(-400,5000),math.random(-250,400),name,0.5,0.5);
	end
	for a=0,8 do
		tfm.exec.addImage("181ba85ccc2.png","!2",math.random(5000,9500),math.random(120,850),name,0.5,0.5);
		tfm.exec.addImage("181ba86195e.png","!2",math.random(5000,9500),math.random(120,850),name,0.5,0.5);
		tfm.exec.addImage("181ba86655c.png","!2",math.random(5000,9500),math.random(120,850),name,0.5,0.5);
		tfm.exec.addImage("181ba86b15a.png","!2",math.random(5000,9500),math.random(120,850),name,0.5,0.5);
	end
	for i=0,11 do
		tfm.exec.addImage("192e019c182.png", "?1", -1200+(i*1017), y_factor+2560, name, 1, 1, 0, 1)
		tfm.exec.addImage("192e019c182.png", "?1", -1200+(i*1017), y_factor+3535, name, 1, -2, 0, 1)
	end
	tfm.exec.addImage("192e017f5a8.png", "!-1", -1200, y_factor+99, name,28,8,0,0.95)
	tfm.exec.addImage("192e017f5a8.png", "!-1", -1200, y_factor+5827, name,28,-8,0,0.95)
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
		tfm.exec.addImage("192e017b00d.png", "!-1", -1200+(i*2400), y_factor-11, name,1,1)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("192e01770df.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1)
		tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2400), y_factor-11, name, -1, 1)
	end
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("192e018d27c.png","?1",-1200+(h*2578),y_factor-350,name,1,1)
	end
	for _,h in next,{1,3,5} do 
		tfm.exec.addImage("192e018d27c.png","?1",1378+(h*2578),y_factor-350,name,-1,1)
	end
	for _,n in next,{0,2,4} do
		tfm.exec.addImage("18773217882.png","?1",-800+(n*1900),y_factor-684,name,1,1,0,0.4)
	end
	for _,n in next,{1,3,5} do
		tfm.exec.addImage("18773217882.png","?1",1100+(n*1900),y_factor-684,name,-1,1,0,0.4)
	end
	tfm.exec.addImage("19650c66a4a.png", "+9", -217, -34, name)
	tfm.exec.addImage("19650c65000.png", "+10", -217, -35, name)
	for o=1,8 do
		tfm.exec.addImage("183b4bf34ba.png","+"..o.."",-50,-33,name)
	end
	tfm.exec.addImage("192e018b3ba.png","?-1",4657,1351+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4694,2121+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4731,2892+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4772,3664+boat_factor,name)
	tfm.exec.addImage("192e0189c4a.png","!1",4750,4358+boat_factor,name,1,1,0.5,1)
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-800,-1000,name,18,3,0,0.7)
	ui.setBackgroundColor("#23C1C5")
end
pw={103,97,98,114,105,99,105,111}; password="";
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame(mapa)
		ui.addTextArea(0,"",nil,-1000,-500,3000,1500,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName(text.loadingmap)
		changed=false
	else
		changed=true
		tfm.exec.newGame(xml)
		ui.removeTextArea(0)
		for name,_ in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
		for i=1,rawlen(pw) do
			password=password..string.char(pw[i])
		end
	end
end
function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
	if changed == false then
		ui.setMapName(text.loadingmap)
	end
end
function eventPlayerDied(name)
	tfm.exec.respawnPlayer(name)
end
function eventNewPlayer(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
		for i=0,3 do
			system.bindKeyboard(name,i,true,true)
		end
		tfm.exec.respawnPlayer(name)
		ui.setMapName(text.title)
		tfm.exec.setGameTime(72000)
		showMessage(text.welcome4,name)
		showWater(name)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "pw" then
		ui.addPopup(11,2,"",name,350,175,200,true)
	end
	if callback == "exit" then
		tfm.exec.movePlayer(name,4084,985,false,0,0,false)
	end
end
function eventPopupAnswer(id,name,answer)
	if answer == password then
		tfm.exec.movePlayer(name,4200,985,false,0,0,false)
	end
end
function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
end
resetMap()
