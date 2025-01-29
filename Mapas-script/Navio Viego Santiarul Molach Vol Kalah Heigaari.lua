for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","DebugCommand","MinimalistMode","PhysicalConsumables","MortCommand"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, foreground = false}
wood={type = 14,width = 800,height = 20,miceCollision = true, friction = 0.5, groundCollision = true}
dolphins={{400,2595},{2590,2705}}
dolphins_r={{5150,2775},{4220,3305}}
xml=''; changed=false; y_factor=1950; boat_factor=-8; depth_factor=1000; mapa="@7961204"; lang={};
lang.br = {
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	welcome4 = "<VP><b>Bem-vindo(a) ao Navio Viego Santiarul Molach Vol Kalah Heigaari.</b>\n\n<p align='left'><N>Este é um mapa-script de navio pirata. Na verdade, é uma casa completa dentro de um navio pirata, e tem tudo o que uma casa 'normal' possui e mais um pouco... Divirtam-se!\n\n<J>Agradecimentos especiais para Lacoste#8972, Shun_kazami#7014, Yuh#0748, Tanatosl#0000 e Miss_fortune#9548.\n\n<N>Revisão 1.7",
	title = "<VP>Navio Viego Santiarul Molach Vol Kalah Heigaari<"
}
lang.en = {
	loadingmap = "Loading map. Please wait...<",
	welcome4 = "<VP><b>Welcome to the Viego Santiarul Molach Vol Kalah Heigaari's Ship!</b>\n\n<p align='left'><N>This is a pirate ship script map. It's actually a complete house inside a pirate ship, and has everything a 'normal' house has and more... Enjoy!\n\n<J>Special thanks to Lacoste#8972, Shun_kazami#7014, Yuh#0748, Tanatosl#0000 and Miss_fortune#9548.\n\n<N>Revision 1.7",
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
function showNPCs(name)
	tfm.exec.addNPC("Mayra Flowers",{title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 1336,y = 1123,female = true,lookLeft = true,lookAtPlayer = true,interactive = true},name)
end
function eventTalkToNPC(name, npc)
	if npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)",name)
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
	tfm.exec.addImage("1860ee201fd.png","!1",7767,1847,name)
	tfm.exec.addImage("192e0192c52.png","?1",-217,4206,name)
	tfm.exec.addImage("192e0192c52.png","?1",2324,4179,name,-1,1)
	tfm.exec.addImage("192e01943c1.png","?1",2793,4304,name)
	tfm.exec.addImage("192e01943c1.png","?1",1449,3890,name)
	tfm.exec.addImage("192e01943c1.png","?1",4100,3874,name,-1,1)
	tfm.exec.addImage("192e0195b33.png","?1",95,3950,name)
	tfm.exec.addImage("192e0195b33.png","?1",1396,4056,name,-1,1)
	tfm.exec.addImage("192e0195b33.png","?1",2994,4360,name)
	tfm.exec.addImage("192e0195b33.png","?1",4350,4267,name,-1,1)
	tfm.exec.addImage("192e01972a4.png","?1",5143,4244,name)
	tfm.exec.addImage("192e01972a4.png","?1",3016,3680,name,-1,1)
	tfm.exec.addImage("192e0198a16.png","?1",1656,4440,name)
	tfm.exec.addImage("192e0198a16.png","?1",-173,4349,name,-1,1)
	tfm.exec.addImage("192e0198a16.png","?1",4613,4466,name)
	tfm.exec.addImage("192e0198a16.png","?1",5347,3964,name)
	tfm.exec.addImage("192e0198a16.png","?1",3773,3784,name,-1,1)
	tfm.exec.addImage("18a053a43b9.png","?1",4004,4346,name)
	tfm.exec.addImage("18a053a43b9.png","?1",3086,4237,name)
	tfm.exec.addImage("185c2e9722e.png","?1",1084,4384,name)
	tfm.exec.addImage("1883efb5982.png","?1",280,3465,name)
	tfm.exec.addImage("18756e28db6.png","?1",3250,3305,name,-1,1)
	tfm.exec.addImage("18756e333d5.png","?1",1890,3394,name,-1,1)
	for d=1,rawlen(dolphins) do
		tfm.exec.addImage("192e01914e1.png","?1",dolphins[d][1],dolphins[d][2]+boat_factor,name)
	end
	for e=1,rawlen(dolphins_r) do
		tfm.exec.addImage("192e01914e1.png","?1",dolphins_r[e][1],dolphins_r[e][2]+boat_factor,name,-1,1)
	end
	tfm.exec.addImage("192e019a18c.png","!1",0,3155+depth_factor,name)
	tfm.exec.addImage("189746d10d2.png","!1",1285,3440+depth_factor,name)
	tfm.exec.addImage("189746d76aa.png","!1",4060,3355+depth_factor,name)
	tfm.exec.addImage("189746e4cb8.png","!1",4510,3266+depth_factor,name)
	tfm.exec.addImage("189746e4cb8.png","!1",2117,3281+depth_factor,name)
	tfm.exec.addPhysicObject(-1,-100,2830+boat_factor,barrier)
	tfm.exec.addPhysicObject(-2,9700,2830+boat_factor,barrier)
	for j=1,12 do
		tfm.exec.addPhysicObject(j+333,-400+(j*800),3565+depth_factor,wood)
	end
	ui.addTextArea(8972, "<a href='event:pw'>                                 ",name,4142,1077+boat_factor,58,30,0,0,1.0,false)
	ui.addTextArea(1027, "<a href='event:exit'>                                      ",name,4220,1140+boat_factor,50,30,0,0,1.0,false)
	for a=0,6 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86195e.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86655c.png","?1",math.random(-200,6000),math.random(-150,600),name);
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(-200,6000),math.random(-150,600),name);
	end
	for a=0,4 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(6000,11000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86195e.png","?1",math.random(6000,11000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86655c.png","?1",math.random(6000,11000),math.random(600,1200),name);
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(6000,11000),math.random(600,1200),name);
	end
	for i=0,11 do
		tfm.exec.addImage("192e019c182.png", "?-1", -1200+(i*1017), y_factor+2575, name, 1, 1, 0, 1)
		tfm.exec.addImage("192e019c182.png", "?-1", -1200+(i*1017), y_factor+3550, name, 1, -2, 0, 1)
	end
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
		tfm.exec.addImage("192e017b00d.png", "!-1", -1200+(i*2400), y_factor-11, name,1,1,0,0.9)
	end
	for _,i in next,{1,3,5,7,9} do
 		tfm.exec.addImage("192e01770df.png", "?1", 1200+(i*2400), y_factor-11, name, -1, 1)
		tfm.exec.addImage("192e017b00d.png", "!-1", 1200+(i*2400), y_factor-11, name, -1, 1,0,0.9)
	end
	for _,h in next,{0,2,4} do
		tfm.exec.addImage("192e018d27c.png","?1",-1200+(h*2578),y_factor-350,name,1,1,0,0.25)
	end
	for _,h in next,{1,3,5} do 
		tfm.exec.addImage("192e018d27c.png","?1",1378+(h*2578),y_factor-350,name,-1,1,0,0.25)
	end
	for o=1,4 do
		tfm.exec.addImage("183b4bf34ba.png","+"..o.."",-50,-33,name)
	end
	tfm.exec.addImage("192e018b3ba.png","?-1",4657,1351+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4694,2121+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4731,2892+boat_factor,name)
	tfm.exec.addImage("192e018b3ba.png","?-1",4772,3664+boat_factor,name)
	tfm.exec.addImage("192e0189c4a.png","!1",4750,4358+boat_factor,name,1,1,0.5,1)
	tfm.exec.addImage("192e018e5fd.png","?1",-1200,-1000,name,60,5) 
end
pw={86,73,69,71,79,32,76,73,78,68,195,131,79}; password="";
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame(mapa)
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
		ui.setMapName(text.title)
		tfm.exec.setGameTime(72000)
		showMessage(text.welcome4,name)
		showWater(name)
		showNPCs(name)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "pw" then
		ui.addPopup(11,2,"",name,350,175,200,true)
	end
	if callback == "exit" then
		tfm.exec.movePlayer(name,4084,1120,false,0,0,false)
	end
end
function eventPopupAnswer(id,name,answer)
	if answer == password then
		tfm.exec.movePlayer(name,4200,1120,false,0,0,false)
	end
end
function eventLoop(p,r)
	if p >= 5500 and changed == false then
		resetMap()
	end
end
resetMap()
