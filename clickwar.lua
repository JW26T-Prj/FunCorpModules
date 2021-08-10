for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","AutoScore","PhysicalConsumables","DebugCommand","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"p","rank","help"} do
system.disableChatCommandDisplay(g,true)
end
sudden=false; powerups=true; winner=""; data={}; players_table={}; increase=0; intensity=40; nightmode=false; night=0; mices=0; remain=10; last_win=""; times=1; imageId=-1;
enabled=false
tfm.exec.setRoomMaxPlayers(25)
function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end
function eventRanking(name)
	local sc = {}
	for id, name in pairs(players_table) do
		sc[#sc+1] = {n=name,s=data[name].score,f=data[name].wins}
	end
	table.sort(sc,function(a,b) return a.s>b.s end)
	str1 = ''
	str2 = ''
	str3 = ''
	for k,v in pairs(sc) do
		if k < 9 then
			if str ~= '' then
				str1=str1.."<br><N>"..k.."    <VP>"..v.n..""
				str2=str2.."<br><b><N>"..v.s.."</b>"
				str3=str3.."<br><N>"..v.f..""
			else
				str1="<J>"..k.."    <VP>"..v.n..""
				str2="<J><b>"..v.s.."</b>"
				str3="<J>"..v.f..""
			end
		end
	end
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>Temporary Ranking",name,150,130,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Consolas'>#N   Name                                     Score      Wins",name,150,165,500,150,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,620,130,30,27,0,0,1.0,true)
	ui.addTextArea(9005,"<B><font size='12'><font face='Consolas'>"..str1,name,150,165,480,220,0,0,nil,true)
	ui.addTextArea(9004,"<p align='right'><font size='12'><font face='Consolas'>"..str2,name,454,165,60,220,0,0,nil,true)
	ui.addTextArea(9003,"<p align='right'><font size='12'><font face='Consolas'>"..str3,name,522,165,60,220,0,0,nil,true)
end
function menuShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,150,130,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,150,165,500,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,620,130,30,27,0,0,1.0,true)
end
function menuShow2(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,250,130,300,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,250,165,300,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,520,130,30,27,0,0,1.0,true)
end
function eventChatCommand(name,message)
	local arg = split(message, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end

		if tfm.get.room.playerList[nome] then
			menuShow2(nome,nome,"<font size='12'><b>Score: "..data[nome].score.."</b><br><br>Wins: "..data[nome].wins.."<br>Matches: "..data[nome].matches.."",75)
		else
			tfm.exec.chatMessage("Function not allowed",name)
		end
	end
	if message == "rank" then
		eventRanking(name)
		tfm.exec.chatMessage("The data on the ranking is temporary and will be erased when the room is finished or rebooted.",name)
	end
	if message == "pw" then
		if name == "Hecarimjhenx#0000" then
			if powerups == true then
				powerups=false
			else
				powerups=true
			end
		end
	end
	if message == "help" then
		menuShow(name,"Help","The objetive of this module is kill the other players using the mouse to generate spirits.<br><br>At moment, 6 powerups are available:<br>F1 = Fast Spirits (700 points)<br>F2 = Double Power (350 points)<br>F3 = Box Meteor (550 points)<br>F4 = Night Mode (400 points)<br>F5 = Ultra Explosion (800 points)<br>F6 = Stone Meteor (750 points)<br><br>Module made by Hecarimjhenx#0000. Version RTM 5142.023",180)
	end
	if message == "powerups" then
		menuShow(name,"Powerups List","<b>F1 - Fast Spirits - 700 points</b><br>Allows you to use spirits without the default timeout.<br><b>F2 - Double Power - 350 points</b><br>Double the power of your anvils, independently of actual intensity.<br><b>F3 - Box Meteor - 550 points</b><br>Spawns a meteor of large box on the map.<br><b>F4 - Night Mode - 400 points</b><br>Blacks out the map for 2 seconds.<br><b>F5 - Ultra Explosion - 800 points</b><br>Spawns a huge amount of spirits around the map.<br><b>F6 - Stone Meteor - 750 points</b><br>Spawns a lot of stones falling from the top of map.",180)
	end
end
function eventNewPlayer(name)
	system.bindMouse(name)
	if not data[name] then
		table.insert(players_table,name)
		data[name]={time=0,matches=0,wins=0,score=0,p1=false,p2=false,pcount=0,imageid=0,imaget=3}
	end
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
	for _,i in next,{72,82,85,112,113,114,115,116,117,123} do
		tfm.exec.bindKeyboard(name,i,true,true)
	end
	system.bindMouse(name,true)
	data[name].imageid = tfm.exec.addImage("17a4e9a9cad.png",":1",238,80,name)
	data[name].imaget=4
	tfm.exec.chatMessage("<VP><b>Welcome to module #clickwar!</b><br><N>Use the mouse to generate explosions and kill other mices!<br><br>Module developed by Hecarimjhenx#0000. Images maked by Spectra_phantom#6089.<br><br><R>Warning: Is prohibited the copy or illegal utilization of this code (including older versions) for making parallel versions. If you discover players making these things, please report to Hecarimjhenx#0000.",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventMouse(name,x,y)
	if not tfm.get.room.playerList[name].isDead and enabled == true then
		if data[name].p1 == false then
			if data[name].time >= 2 then
				if data[name].p2 == true then
					tfm.exec.explosion(x,y,intensity,intensity*2,false)
				else
					tfm.exec.explosion(x,y,intensity/2,intensity*1.5,false)
				end
				data[name].time=0;
				tfm.exec.displayParticle(10,x,y,0,0,0,0,nil)
			end
		else
			if data[name].p2 == true then
				tfm.exec.explosion(x,y,intensity,intensity*2,false)
			else
				tfm.exec.explosion(x,y,intensity/2,intensity*1.5,false)
			end
			data[name].time=2;
			tfm.exec.displayParticle(10,x,y,0,0,0,0,nil)
		end
	end
end
function eventNewGame()
	tfm.exec.removeImage(imageId)
	ui.removeTextArea(1,nil)
	sudden=false
	tfm.exec.setGameTime(140)
	winner=""
	increase=0;
	remain=10
	enabled=false
	intensity=40
	prox=false;
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].matches=data[name].matches+1
		data[name].p1=false
		data[name].p2=false
		data[name].pcount=0
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Clickwar.",name)
		end
	end
	tfm.exec.chatMessage("<ROSE><i>Spectra's map loader v2.191</i><br><N>Loading current map information...<br>----------------------------------------<br><b>Current Map :</b> <V>"..tfm.get.room.currentMap.."<br><N><b>Author :</b><V> "..tfm.get.room.xmlMapInfo.author.."<br><N>----------------------------------------")
end
function eventLoop(pass,falt)
	if nightmode == true then
		night=night+1
		if night >= 4 then
			ui.removeTextArea(2571,nil)
			night=0
			nightmode=false
		end
	end
	if sudden == true then
		intensity=intensity+2
		if falt < 40000 then
			intensity=intensity+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				data[name].score=math.floor(data[name].score+(intensity/40))
			end
		end
	end
	if falt < 70000 and falt > 69375 then
		tfm.exec.chatMessage("<ROSE>The ultra hard mode will be enabled in 10 seconds!",nil)
	end
	if falt < 60000 and sudden == false and falt > 50000 then
		tfm.exec.chatMessage("<R><b>Ultra hard mode enabled!</b>",nil)
		imageId = tfm.exec.addImage("17a4e9a853d.png",":1",240,80,nul)
		remain=-0.5
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.8,false)
		sudden=true;
	end
	if falt < 40000 and sudden == true and falt > 19000 then
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.91,false)
	end
	if falt < 20000 and sudden == true and falt > 9000 then
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.96,false)
	end
	if falt < 100 then
		tfm.exec.newGame("#10")
	end
	if prox == false then
		ui.setMapName("<N>Click War RTM <b>5142.023</b>  <G>|  <N>Intensity: <b>"..intensity.."</b>  <G>|  <VP>Module made by <b>Hecarimjhenx#0000</b><")
	else
		ui.setMapName("<b>"..winner.."</b> <N>wons the match! Next match on "..math.floor(falt/1000).." seconds.<")
	end
	remain=remain-0.5
	if remain == 3 then
		imageId = tfm.exec.addImage("17a4e9afa86.png",":1",338,80,nul)
	end
	if remain == 2 then
		tfm.exec.removeImage(imageId)
		imageId = tfm.exec.addImage("17a4e9ae302.png",":1",338,80,nul)
	end
	if remain == 1 then
		tfm.exec.removeImage(imageId)
		imageId = tfm.exec.addImage("17a4e9acb8f.png",":1",338,80,nul)
	end
	if remain == 0 then
		tfm.exec.removeImage(imageId)
		imageId = tfm.exec.addImage("17a4e9ab41f.png",":1",283,80,nul)
		remain=-2.5
		enabled=true;
	end
	if remain == -4 then
		tfm.exec.removeImage(imageId)
	end
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].time=data[name].time+1
		if data[name].pcount >= 0 then
			data[name].pcount=data[name].pcount-1
		else
			data[name].p1=false
			data[name].p2=false
		end
		if data[name].imaget >= 0 then
			data[name].imaget=data[name].imaget-0.5
		end
		if data[name].imaget == 0 then
			tfm.exec.removeImage(data[name].imageid)
			data[name].imageid=-1
		end
	end
	if enabled == true then
		if intensity < 217 then
			increase=increase+0.5
			if increase >= 2 then
				if sudden == false then
					intensity=intensity+1
					increase=0;
					for name,player in pairs(tfm.get.room.playerList) do
						if not tfm.get.room.playerList[name].isDead then
							if pass > 30000 then
								data[name].score=math.floor(data[name].score+(intensity/24))
							end
							if pass > 60000 then
								data[name].score=math.floor(data[name].score+(intensity/24))
							end
						end
					end
				end
			end
		else
			intensity=217
		end
	end
end
function eventPlayerDied(name)
	if name == last_win and times >= 2 then
		tfm.exec.chatMessage("<J>The victory sequence of <R>"..last_win.."<J> has been ended!")
		times=1
	end
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		tfm.exec.newGame("#10")
	elseif i==1 then
		winner=n;
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		data[n].wins=data[n].wins+1
		data[n].score=data[n].score+200
		tfm.exec.setGameTime(10)
		tfm.exec.setPlayerScore(n,1,true)
		prox=true;
		if winner == last_win then
			data[n].score=data[n].score+100
			times=times+1
			if times == 2 or times == 3 then
				tfm.exec.chatMessage("<J>"..last_win.." wons <b>"..times.."</b> times in a row!")
			end
			if times >= 4 then
				tfm.exec.chatMessage("<R><b>Legendary!</b><J> "..last_win.." wons <b>"..times.."</b> times in a row!")
			end
		end
		last_win=n
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a><br><a href='event:profile'>Profile</a><br><a href='event:ranking'>Ranking</a><br><a href='event:powerups'>Powerups</a>",name,5,55,90,60,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "ranking" then
		eventChatCommand(name,"rank")
	end
	if callback == "profile" then
		tfm.exec.chatMessage("Use the !p command to view your profile and !p [user] to view the profile of specified user.",name)
	end
	if callback == "fechar" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
		end
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "close" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
			ui.removeTextArea(6969+id,name)
			ui.removeTextArea(7979+id,name)
		end
	end
	if callback == "closep" then
		for id=9000,9010 do
			ui.removeTextArea(id,name)
		end
	end
end
function eventKeyboard(name,key,down,x,y)
	if key == 72 then
		eventChatCommand(name,"help")
	end
	if key == 82 then
		eventChatCommand(name,"rank")
	end
	if key == 85 then
		eventChatCommand(name,"powerups")
	end
	if enabled == true and powerups == true then
		if not tfm.get.room.playerList[name].isDead and data[name].p1 == false and data[name].p2 == false then
			if key == 112 and data[name].score >= 700 then
				data[name].p1=true
				data[name].score=data[name].score-700
				data[name].pcount=16
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Fast Spirits!</b>")
			end
			if key == 113 and data[name].score >= 350 then
				data[name].p2=true
				data[name].score=data[name].score-350
				data[name].pcount=20
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Double Power!</b>")
			end
			if key == 114 and data[name].score >= 550 then
				data[name].score=data[name].score-550
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Box Meteor!</b>")
				for i=-6,19 do
					tfm.exec.addShamanObject(2,i*60,-1,0,0,0,false)
				end
			end
			if key == 115 and data[name].score >= 400 then
				data[name].score=data[name].score-400
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Night Mode!</b>")
				ui.addTextArea(2571,"",nil,-800,-600,3000,3000,0x010101,0x010101,0.99,true)
				nightmode=true
			end
			if key == 116 and data[name].score >= 800 then
				data[name].score=data[name].score-800
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Mega Explosion!</b>")
				for i=-4,12 do
					for j=-2,6 do
						tfm.exec.explosion(i*100,j*100,intensity,intensity*1.5,false)
						tfm.exec.displayParticle(10,i*100,j*100,0,0,0,0,nil)
					end
				end
			end
			if key == 117 and data[name].score >= 750 then
				data[name].score=data[name].score-750
				tfm.exec.chatMessage("<J>"..name.." used the powerup <ROSE><b>Stone Meteor!</b>")
				for i=-12,38 do
					tfm.exec.addShamanObject(85,i*30,-1,0,0,0,false)
				end
			end
		end
	end
end
tfm.exec.newGame("#10")
