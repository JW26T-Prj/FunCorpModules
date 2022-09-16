admin="" -- Insert your name here, FunCorp!

data={}; recorde=0; recorder="----"; changed=false; xml2='';
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f]()
end
tfm.exec.newGame('@7915086')
ui.setBackgroundColor("#D1D1D1")
system.disableChatCommandDisplay("reset")
function updateBar()
	ui.setMapName("<D>Long Jump script v1.23 by <ROSE>Patrick_mahomes#1795   <V>|   <N>Highest score : <VP><b>"..recorde.."</b> <N>- <VP><b>"..recorder.."</b><")
end
function eventNewGame()
	if changed == false then
		xml2=tfm.get.room.xmlMapInfo.xml
		ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
		ui.setMapName("<J>Loading map, please wait...<")
		tfm.exec.setGameTime(5)
	else
		ui.removeTextArea(0,nil)
	end
end
function eventChatCommand(n,m)
	if n == "Patrick_mahomes#1795" or n == "Forzaldenon#0000" or n == "Akwimos#1937" or n == admin then
		if m == "reset" then
			tfm.exec.chatMessage("All scores are now reset.",nil)
			recorde=0
			for name,player in pairs(tfm.get.room.playerList) do
				data[name].recorde=0
				tfm.exec.setPlayerScore(name,0,false)
			end
			updateBar()
			ui.removeTextArea(80,nil)
			ui.removeTextArea(81,nil)
		end
	end
end
function eventPlayerDied(n)
	tfm.exec.respawnPlayer(n)
	tfm.exec.giveCheese(n)
end
function eventNewPlayer(n)
	if n:sub(1,1) == "*" then
		tfm.exec.chatMessage("<R>Souris players aren't allowed",n)
	else
		newData={
		["x"]=0;
		["position"]=0;
		["x2"]=0;
		["recorde"]=0;
			}
		data[n]=newData;
	
		tfm.exec.respawnPlayer(n)
		tfm.exec.giveCheese(n)
		ui.addTextArea(1,"<font size='18'><b><font face='Courier New'>0 ||||||| 2000 ||||||| 4000 |||||||| 6000 ||||||| 8000 ||||>",nil,20,20,670,20,0x000001,0x000001,0.8,true)
		for i=1,30 do
			local a=500*i
			ui.addTextArea(100+i,"<p align='center'><b><font size='14'><font color='#000001'>"..a.."",n,a-30,930,60,20,0,0,1.0,false)
		end
		ui.setBackgroundColor("#D1D1D1")
		tfm.exec.setPlayerScore(n,0,false)
		tfm.exec.chatMessage("<VP>Testing long jump module from Patrick_mahomes#1795<br><br>Original idea from Dhanny_mheyran#6701",n)
		updateBar()
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventLoop(e,r)
	if changed == true then
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(2,"<p align='center'><font size='20'><b><font color='#800000'><font face='Courier New'>"..data[name].x.."",name,700,18,80,22,0xff0000,0x800000,0.9,true)
		ui.addTextArea(6,"<p align='center'><font size='20'><b><font color='#008000'><font face='Courier New'>"..data[name].recorde.."",name,700,68,80,22,0x00ff00,0x00ff00,0.9,true)
		ui.addTextArea(7,"<p align='center'><font size='20'><b><font color='#800080'><font face='Courier New'>"..recorde.."",name,700,98,80,22,0xff00ff,0x800080,0.9,true)
		data[name].x=tfm.get.room.playerList[name].x
		if tfm.get.room.playerList[name].vx <= 3 and tfm.get.room.playerList[name].x >= 500 and tfm.get.room.playerList[name].y >= 970 then
			tfm.exec.chatMessage("<J>Your distance: <b>"..data[name].x.."</b> pixels.",name)
			if data[name].x > data[name].recorde then
				data[name].recorde=data[name].x
				tfm.exec.chatMessage("<VP>New pessoal high score: <b>"..data[name].x.." pixels</b>.",name)
				ui.addTextArea(4,"",name,30+data[name].recorde/15,48,1,5,0x00ff00,0x008000,0.9,true)
				ui.addTextArea(80,"",name,data[name].x-3,50,6,990,0x00ff00,0x008000,0.8,false)
				tfm.exec.setPlayerScore(name,data[name].x,false)
			end
			if data[name].x > recorde then
				recorde=data[name].x
				recorder=name
				tfm.exec.chatMessage("<ROSE>New high score on game: <b>"..data[name].x.." pixels</b>, made by "..name.."!")
				ui.addTextArea(5,"",nil,30+recorde/15,48,1,5,0xff00ff,0x800080,0.9,true)
				updateBar()
				ui.addTextArea(81,"",nil,data[name].x-3,50,6,990,0xff00ff,0x800080,0.8,false)
				tfm.exec.setPlayerScore(name,data[name].x,false)
			end
			tfm.exec.movePlayer(name,80,250,false,0,0,false)
		end
		ui.addTextArea(3,"",name,30,48,tfm.get.room.playerList[name].x/15,5,0xff0000,0x800000,0.9,true)
	end
	else
		if r <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
			for name,player in next,tfm.get.room.playerList do
				eventNewPlayer(name)
			end
		end
	end
end
