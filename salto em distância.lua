-- Novo script de Salto em Distância, com novo mapa e marcadores para a distância percorrida.
data={}
recorde=0
recorder="----"
tfm.exec.setRoomMaxPlayers(25)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.newGame('<C><P L="15000" G="0,10" D="x_bouboum/x_fond/x_f1.jpg,0,600;x_bouboum/x_fond/x_f1.jpg,800,600;x_bouboum/x_fond/x_f1.jpg,1600,600;x_bouboum/x_fond/x_f1.jpg,2400,600;x_bouboum/x_fond/x_f1.jpg,3200,600;x_bouboum/x_fond/x_f1.jpg,4000,600;x_bouboum/x_fond/x_f1.jpg,4800,600;x_bouboum/x_fond/x_f1.jpg,5600,600;x_bouboum/x_fond/x_f1.jpg,6400,600;x_bouboum/x_fond/x_f1.jpg,7200,600;x_bouboum/x_fond/x_f1.jpg,8000,600;x_bouboum/x_fond/x_f1.jpg,8800,600;x_bouboum/x_fond/x_f1.jpg,9600,600;x_bouboum/x_fond/x_f1.jpg,10400,600;x_bouboum/x_fond/x_f1.jpg,11200,600;x_bouboum/x_fond/x_f1.jpg,12000,600;x_bouboum/x_fond/x_f1.jpg,12800,600;x_bouboum/x_fond/x_f1.jpg,13600,600;x_bouboum/x_fond/x_f1.jpg,14400,600;x_bouboum/x_fond/x_f1.jpg,15200,600" H="1000" /><Z><S><S L="400" X="87" H="800" Y="825" T="18" P="0,0,0.3,0.2,30,0,0,0" /><S L="400" H="92" X="310" Y="440" T="2" P="0,0,0,2.2,30,0,0,0" /><S L="160" H="800" X="80" Y="700" T="18" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="111122" H="414" X="-5" Y="155" T="12" P="0,0,0,0,0,0,0,0" /><S P="0,0,0,0,90,0,0,0" L="10" o="111122" X="1500" Y="-500" T="12" H="3000" /><S L="10" o="111122" X="4500" H="3000" Y="-500" T="12" P="0,0,0,0,90,0,0,0" /><S L="10" o="111122" X="1660" H="3000" Y="1005" T="12" P="0,0,9999,0,90,0,0,0" /><S P="0,0,9999,0,90,0,0,0" L="10" o="111122" H="3000" Y="1005" T="12" X="4660" /><S L="10" o="111122" H="3000" X="7660" Y="1005" T="12" P="0,0,9999,0,90,0,0,0" /><S P="0,0,9999,0,90,0,0,0" L="10" o="111122" X="10660" Y="1005" T="12" H="3000" /><S L="10" o="111122" X="13660" H="3000" Y="1005" T="12" P="0,0,9999,0,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="288" o="111122" H="1732" Y="1077" T="12" X="-144" /><S L="388" o="111122" H="732" X="193" Y="1467" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="1660" H="400" v="1" Y="800" T="9" P="0,0,,,,0,0,0" /><S L="3000" H="400" X="4660" v="1" Y="800" T="9" P="0,0,,,,0,0,0" /><S L="3000" X="7660" H="400" v="1" Y="800" T="9" P="0,0,,,,0,0,0" /><S L="3000" H="400" X="10660" v="1" Y="800" T="9" P="0,0,,,,0,0,0" /><S L="3000" X="13660" H="400" v="1" Y="800" T="9" P="0,0,,,,0,0,0" /><S P="0,0,0,0,90,0,0,0" L="10" o="111122" H="3000" Y="-500" T="12" X="7500" /></S><D><DS Y="285" X="80" /><F Y="297" X="60" /><F Y="296" X="95" /><F Y="279" X="80" /></D><O /><L><VL n="Layer1" l="-1" /><JD c="FFFFFF,2,1,1" P1="0,974" P2="0,999" /><JD c="FFFFFF,2,1,1" P1="100,974" P2="100,999" /><JD c="FFFFFF,2,1,1" P1="200,974" P2="200,999" /><JD c="FFFFFF,2,1,1" P1="300,974" P2="300,999" /><JD c="FFFFFF,2,1,1" P1="400,974" P2="400,999" /><JD c="FFFFFF,4,1,1" P1="500,958" P2="500,998" /><JD c="FFFFFF,2,1,1" P1="600,974" P2="600,999" /><JD c="FFFFFF,2,1,1" P1="700,974" P2="700,999" /><JD c="FFFFFF,2,1,1" P1="800,974" P2="800,999" /><JD c="FFFFFF,2,1,1" P1="900,974" P2="900,999" /><JD c="FFFFFF,4,1,1" P1="1000,958" P2="1000,998" /><JD c="FFFFFF,2,1,1" P1="1100,974" P2="1100,999" /><JD c="FFFFFF,2,1,1" P1="1200,974" P2="1200,999" /><JD c="FFFFFF,2,1,1" P1="1300,974" P2="1300,999" /><JD c="FFFFFF,2,1,1" P1="1400,974" P2="1400,999" /><JD c="FFFFFF,4,1,1" P1="1500,958" P2="1500,998" /><JD c="FFFFFF,2,1,1" P1="500,1000" P2="17500,1000" /><JD c="FFFFFF,2,1,1" P1="1500,974" P2="1500,999" /><JD c="FFFFFF,2,1,1" P1="1600,974" P2="1600,999" /><JD c="FFFFFF,2,1,1" P1="1700,974" P2="1700,999" /><JD c="FFFFFF,2,1,1" P1="1800,974" P2="1800,999" /><JD c="FFFFFF,2,1,1" P1="1900,974" P2="1900,999" /><JD c="FFFFFF,4,1,1" P1="2000,958" P2="2000,998" /><JD c="FFFFFF,2,1,1" P1="2100,974" P2="2100,999" /><JD c="FFFFFF,2,1,1" P1="2200,974" P2="2200,999" /><JD c="FFFFFF,2,1,1" P1="2300,974" P2="2300,999" /><JD c="FFFFFF,2,1,1" P1="2400,974" P2="2400,999" /><JD c="FFFFFF,4,1,1" P1="2500,958" P2="2500,998" /><JD c="FFFFFF,2,1,1" P1="2600,974" P2="2600,999" /><JD c="FFFFFF,2,1,1" P1="2700,974" P2="2700,999" /><JD c="FFFFFF,2,1,1" P1="2800,974" P2="2800,999" /><JD c="FFFFFF,2,1,1" P1="2900,974" P2="2900,999" /><JD c="FFFFFF,4,1,1" P1="3000,958" P2="3000,998" /><JD c="FFFFFF,2,1,1" P1="2000,1000" P2="19000,1000" /><JD c="FFFFFF,2,1,1" P1="3000,974" P2="3000,999" /><JD c="FFFFFF,2,1,1" P1="3100,974" P2="3100,999" /><JD c="FFFFFF,2,1,1" P1="3200,974" P2="3200,999" /><JD c="FFFFFF,2,1,1" P1="3300,974" P2="3300,999" /><JD c="FFFFFF,2,1,1" P1="3400,974" P2="3400,999" /><JD c="FFFFFF,4,1,1" P1="3500,958" P2="3500,998" /><JD c="FFFFFF,2,1,1" P1="3600,974" P2="3600,999" /><JD c="FFFFFF,2,1,1" P1="3700,974" P2="3700,999" /><JD c="FFFFFF,2,1,1" P1="3800,974" P2="3800,999" /><JD c="FFFFFF,2,1,1" P1="3900,974" P2="3900,999" /><JD c="FFFFFF,4,1,1" P1="4000,958" P2="4000,998" /><JD c="FFFFFF,2,1,1" P1="4100,974" P2="4100,999" /><JD c="FFFFFF,2,1,1" P1="4200,974" P2="4200,999" /><JD c="FFFFFF,2,1,1" P1="4300,974" P2="4300,999" /><JD c="FFFFFF,2,1,1" P1="4400,974" P2="4400,999" /><JD c="FFFFFF,4,1,1" P1="4500,958" P2="4500,998" /><JD c="FFFFFF,2,1,1" P1="3500,1000" P2="20500,1000" /><JD c="FFFFFF,2,1,1" P1="4500,974" P2="4500,999" /><JD c="FFFFFF,2,1,1" P1="4600,974" P2="4600,999" /><JD c="FFFFFF,2,1,1" P1="4700,974" P2="4700,999" /><JD c="FFFFFF,2,1,1" P1="4800,974" P2="4800,999" /><JD c="FFFFFF,2,1,1" P1="4900,974" P2="4900,999" /><JD c="FFFFFF,4,1,1" P1="5000,958" P2="5000,998" /><JD c="FFFFFF,2,1,1" P1="5100,974" P2="5100,999" /><JD c="FFFFFF,2,1,1" P1="5200,974" P2="5200,999" /><JD c="FFFFFF,2,1,1" P1="5300,974" P2="5300,999" /><JD c="FFFFFF,2,1,1" P1="5400,974" P2="5400,999" /><JD c="FFFFFF,4,1,1" P1="5500,958" P2="5500,998" /><JD c="FFFFFF,2,1,1" P1="5600,974" P2="5600,999" /><JD c="FFFFFF,2,1,1" P1="5700,974" P2="5700,999" /><JD c="FFFFFF,2,1,1" P1="5800,974" P2="5800,999" /><JD c="FFFFFF,2,1,1" P1="5900,974" P2="5900,999" /><JD c="FFFFFF,4,1,1" P1="6000,958" P2="6000,998" /><JD c="FFFFFF,2,1,1" P1="5000,1000" P2="22000,1000" /><JD c="FFFFFF,2,1,1" P1="6000,974" P2="6000,999" /><JD c="FFFFFF,2,1,1" P1="6100,974" P2="6100,999" /><JD c="FFFFFF,2,1,1" P1="6200,974" P2="6200,999" /><JD c="FFFFFF,2,1,1" P1="6300,974" P2="6300,999" /><JD c="FFFFFF,2,1,1" P1="6400,974" P2="6400,999" /><JD c="FFFFFF,4,1,1" P1="6500,958" P2="6500,998" /><JD c="FFFFFF,2,1,1" P1="6600,974" P2="6600,999" /><JD c="FFFFFF,2,1,1" P1="6700,974" P2="6700,999" /><JD c="FFFFFF,2,1,1" P1="6800,974" P2="6800,999" /><JD c="FFFFFF,2,1,1" P1="6900,974" P2="6900,999" /><JD c="FFFFFF,4,1,1" P1="7000,958" P2="7000,998" /><JD c="FFFFFF,2,1,1" P1="7100,974" P2="7100,999" /><JD c="FFFFFF,2,1,1" P1="7200,974" P2="7200,999" /><JD c="FFFFFF,2,1,1" P1="7300,974" P2="7300,999" /><JD c="FFFFFF,2,1,1" P1="7400,974" P2="7400,999" /><JD c="FFFFFF,4,1,1" P1="7500,958" P2="7500,998" /><VL n="Layer2" l="-1" /><JD c="FFFFFF,2,1,1" P1="6500,1000" P2="23500,1000" /><JD c="FFFFFF,2,1,1" P1="7500,974" P2="7500,999" /><JD c="FFFFFF,2,1,1" P1="7600,974" P2="7600,999" /><JD c="FFFFFF,2,1,1" P1="7700,974" P2="7700,999" /><JD c="FFFFFF,2,1,1" P1="7800,974" P2="7800,999" /><JD c="FFFFFF,2,1,1" P1="7900,974" P2="7900,999" /><JD c="FFFFFF,4,1,1" P1="8000,958" P2="8000,998" /><JD c="FFFFFF,2,1,1" P1="8100,974" P2="8100,999" /><JD c="FFFFFF,2,1,1" P1="8200,974" P2="8200,999" /><JD c="FFFFFF,2,1,1" P1="8300,974" P2="8300,999" /><JD c="FFFFFF,2,1,1" P1="8400,974" P2="8400,999" /><JD c="FFFFFF,4,1,1" P1="8500,958" P2="8500,998" /><JD c="FFFFFF,2,1,1" P1="8600,974" P2="8600,999" /><JD c="FFFFFF,2,1,1" P1="8700,974" P2="8700,999" /><JD c="FFFFFF,2,1,1" P1="8800,974" P2="8800,999" /><JD c="FFFFFF,2,1,1" P1="8900,974" P2="8900,999" /><JD c="FFFFFF,4,1,1" P1="9000,958" P2="9000,998" /><JD c="FFFFFF,2,1,1" P1="8000,1000" P2="25000,1000" /><JD c="FFFFFF,2,1,1" P1="9000,974" P2="9000,999" /><JD c="FFFFFF,2,1,1" P1="9100,974" P2="9100,999" /><JD c="FFFFFF,2,1,1" P1="9200,974" P2="9200,999" /><JD c="FFFFFF,2,1,1" P1="9300,974" P2="9300,999" /><JD c="FFFFFF,2,1,1" P1="9400,974" P2="9400,999" /><JD c="FFFFFF,4,1,1" P1="9500,958" P2="9500,998" /><JD c="FFFFFF,2,1,1" P1="9600,974" P2="9600,999" /><JD c="FFFFFF,2,1,1" P1="9700,974" P2="9700,999" /><JD c="FFFFFF,2,1,1" P1="9800,974" P2="9800,999" /><JD c="FFFFFF,2,1,1" P1="9900,974" P2="9900,999" /><JD c="FFFFFF,4,1,1" P1="10000,958" P2="10000,998" /><JD c="FFFFFF,2,1,1" P1="10100,974" P2="10100,999" /><JD c="FFFFFF,2,1,1" P1="10200,974" P2="10200,999" /><JD c="FFFFFF,2,1,1" P1="10300,974" P2="10300,999" /><JD c="FFFFFF,2,1,1" P1="10400,974" P2="10400,999" /><JD c="FFFFFF,4,1,1" P1="10500,958" P2="10500,998" /><JD c="FFFFFF,2,1,1" P1="9500,1000" P2="26500,1000" /><JD c="FFFFFF,2,1,1" P1="10500,974" P2="10500,999" /><JD c="FFFFFF,2,1,1" P1="10600,974" P2="10600,999" /><JD c="FFFFFF,2,1,1" P1="10700,974" P2="10700,999" /><JD c="FFFFFF,2,1,1" P1="10800,974" P2="10800,999" /><JD c="FFFFFF,2,1,1" P1="10900,974" P2="10900,999" /><JD c="FFFFFF,4,1,1" P1="11000,958" P2="11000,998" /><JD c="FFFFFF,2,1,1" P1="11100,974" P2="11100,999" /><JD c="FFFFFF,2,1,1" P1="11200,974" P2="11200,999" /><JD c="FFFFFF,2,1,1" P1="11300,974" P2="11300,999" /><JD c="FFFFFF,2,1,1" P1="11400,974" P2="11400,999" /><JD c="FFFFFF,4,1,1" P1="11500,958" P2="11500,998" /><JD c="FFFFFF,2,1,1" P1="11600,974" P2="11600,999" /><JD c="FFFFFF,2,1,1" P1="11700,974" P2="11700,999" /><JD c="FFFFFF,2,1,1" P1="11800,974" P2="11800,999" /><JD c="FFFFFF,2,1,1" P1="11900,974" P2="11900,999" /><JD c="FFFFFF,4,1,1" P1="12000,958" P2="12000,998" /><JD c="FFFFFF,2,1,1" P1="11000,1000" P2="28000,1000" /><JD c="FFFFFF,2,1,1" P1="12000,974" P2="12000,999" /><JD c="FFFFFF,2,1,1" P1="12100,974" P2="12100,999" /><JD c="FFFFFF,2,1,1" P1="12200,974" P2="12200,999" /><JD c="FFFFFF,2,1,1" P1="12300,974" P2="12300,999" /><JD c="FFFFFF,2,1,1" P1="12400,974" P2="12400,999" /><JD c="FFFFFF,4,1,1" P1="12500,958" P2="12500,998" /><JD c="FFFFFF,2,1,1" P1="12600,974" P2="12600,999" /><JD c="FFFFFF,2,1,1" P1="12700,974" P2="12700,999" /><JD c="FFFFFF,2,1,1" P1="12800,974" P2="12800,999" /><JD c="FFFFFF,2,1,1" P1="12900,974" P2="12900,999" /><JD c="FFFFFF,4,1,1" P1="13000,958" P2="13000,998" /><JD c="FFFFFF,2,1,1" P1="13100,974" P2="13100,999" /><JD c="FFFFFF,2,1,1" P1="13200,974" P2="13200,999" /><JD c="FFFFFF,2,1,1" P1="13300,974" P2="13300,999" /><JD c="FFFFFF,2,1,1" P1="13400,974" P2="13400,999" /><JD c="FFFFFF,4,1,1" P1="13500,958" P2="13500,998" /><JD c="FFFFFF,2,1,1" P1="12500,1000" P2="29500,1000" /><JD c="FFFFFF,2,1,1" P1="13500,974" P2="13500,999" /><JD c="FFFFFF,2,1,1" P1="13600,974" P2="13600,999" /><JD c="FFFFFF,2,1,1" P1="13700,974" P2="13700,999" /><JD c="FFFFFF,2,1,1" P1="13800,974" P2="13800,999" /><JD c="FFFFFF,2,1,1" P1="13900,974" P2="13900,999" /><JD c="FFFFFF,4,1,1" P1="14000,958" P2="14000,998" /><JD c="FFFFFF,2,1,1" P1="14100,974" P2="14100,999" /><JD c="FFFFFF,2,1,1" P1="14200,974" P2="14200,999" /><JD c="FFFFFF,2,1,1" P1="14300,974" P2="14300,999" /><JD c="FFFFFF,2,1,1" P1="14400,974" P2="14400,999" /><JD c="FFFFFF,4,1,1" P1="14500,958" P2="14500,998" /><JD c="FFFFFF,2,1,1" P1="14600,974" P2="14600,999" /><JD c="FFFFFF,2,1,1" P1="14700,974" P2="14700,999" /><JD c="FFFFFF,2,1,1" P1="14800,974" P2="14800,999" /><JD c="FFFFFF,2,1,1" P1="14900,974" P2="14900,999" /><JD c="FFFFFF,4,1,1" P1="15000,958" P2="15000,998" /><JD c="111122,250,1,0" P1="-1000,475" P2="16000,475" /><JD c="111122,250,1,0" P1="-1000,225" P2="16000,225" /><JD c="111122,250,1,0" P1="-1000,-25" P2="16000,-25" /><JD c="111122,250,1,0" P1="-1000,-275" P2="16000,-275" /><JD c="111122,250,1,0" P1="-1000,1125" P2="16000,1125" /><JD c="111122,250,1,0" P1="-10000,1375" P2="16000,1375" /><JD c="111122,250,1,0" P1="-1000,1625" P2="16000,1625" /><JD c="111122,250,1,0" P1="-1000,1875" P2="16000,1875" /><VL n="Layer3" l="-1" /><JD c="1558b0,200,0.5,1" P1="-1000,700" P2="16000,700" /><JD c="1558b0,200,0.5,1" P1="-1000,900" P2="16000,900" /><JD c="0783db,8,1,1" P1="-1000,600" P2="16000,600" /><L /></L></Z></C>')
system.disableChatCommandDisplay("ddddda")
function eventChatCommand(n,m)
	if m == "ddddda" then
		tfm.exec.chatMessage("Reboot",nil)
		recorde=0
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].recorde=0
		end
		ui.removeTextArea(80,nil)
		ui.removeTextArea(81,nil)
	end
end
function eventPlayerDied(n)
	tfm.exec.respawnPlayer(n)
	tfm.exec.giveCheese(n)
end
function eventNewPlayer(n)
	newData={
		["x"]=0;
		["position"]=0;
		["x2"]=0;
		["recorde"]=0;
			}
	data[n]=newData;
	tfm.exec.respawnPlayer(n)
	tfm.exec.giveCheese(n)
	for i=1,30 do
		local a=500*i
		ui.addTextArea(100+i,"<p align='center'><b><font size='14'><font color='#ffffff'>"..a.."",n,a-30,930,60,20,0,0,1.0,false)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventLoop()
	ui.setMapName("<D>Long Jump script v1.16 by <ROSE><b>Patrick_mahomes#1795</b>   <V>|   <N>Actual record : <VP><b>"..recorde.."</b> pts <N>- <VP><b>"..recorder.."</b><")
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(1,"<font size='18'><b><font face='Courier New'>0 |||||||||| 3000 |||||||||| 6000 |||||||||| 9000 |||||||||>",nil,20,20,670,20,0x000001,0x000001,0.8,true)
		ui.addTextArea(2,"<p align='center'><font size='20'><b><font color='#800000'><font face='Courier New'>"..data[name].x.."",name,700,18,80,22,0xff0000,0x800000,0.9,true)
		ui.addTextArea(6,"<p align='center'><font size='20'><b><font color='#008000'><font face='Courier New'>"..data[name].recorde.."",name,700,68,80,22,0x00ff00,0x00ff00,0.9,true)
		ui.addTextArea(7,"<p align='center'><font size='20'><b><font color='#800080'><font face='Courier New'>"..recorde.."",name,700,98,80,22,0xff00ff,0x800080,0.9,true)
		if tfm.get.room.playerList[name].x < 0 then
			data[name].x=tfm.get.room.playerList[name].x+19660
		elseif tfm.get.room.playerList[name].x > 0 and data[name].x2 > 9830 then
			data[name].x=tfm.get.room.playerList[name].x+19660
		else
			data[name].x=tfm.get.room.playerList[name].x
		end
		if data[name].x > 15000 then
			data[name].x=15000
		end
		if tfm.get.room.playerList[name].vx <= 3 and tfm.get.room.playerList[name].x >= 500 and tfm.get.room.playerList[name].y >= 600 then
			tfm.exec.chatMessage("<J>Your distance: <b>"..data[name].x.."</b> pixels.",name)
			if data[name].x > data[name].recorde then
				data[name].recorde=data[name].x
				tfm.exec.chatMessage("<VP>New pessoal high score: <b>"..data[name].x.." pixels</b>.",name)
				ui.addTextArea(80,"",name,data[name].x-3,50,6,990,0x00ff00,0x008000,0.8,false)
				tfm.exec.setPlayerScore(name,data[name].x,false)
			end
			if data[name].x > recorde then
				recorde=data[name].x
				recorder=name
				tfm.exec.chatMessage("<ROSE>New high score on game: <b>"..data[name].x.." pixels</b>, made by "..name.."!")
				ui.addTextArea(81,"",nil,data[name].x-3,50,6,990,0xff00ff,0x800080,0.8,false)
				tfm.exec.setPlayerScore(name,data[name].x,false)
			end
			tfm.exec.movePlayer(name,80,250,false,0,0,false)
		end
		ui.addTextArea(3,"",name,30,48,tfm.get.room.playerList[name].x/18.1,5,0xff0000,0x800000,0.9,true)
		ui.addTextArea(4,"",name,30+data[name].recorde/18.1,48,1,5,0x00ff00,0x008000,0.9,true)
		ui.addTextArea(5,"",nil,30+recorde/18.1,48,1,5,0xff00ff,0x800080,0.9,true)
	end
end
