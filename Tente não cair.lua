tfm.exec.disableAutoNewGame(true)
winner=""
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.setRoomMaxPlayers(24)
map='<C><P F="0" DS="m;200,220,400,220,600,220,800,220,1000,220,1200,220,1400,220" L="1600" /><Z><S><S L="40" X="20" H="400" N="" Y="200" T="7" P="0,0,0,0.2,0,0,0,0" /><S L="40" H="400" X="1580" N="" Y="200" T="7" P="0,0,0,0.2,0,0,0,0" /><S L="40" H="1600" X="800" Y="20" T="7" P="0,0,0,0.2,90,0,0,0" /><S L="40" X="800" H="1600" Y="115" T="7" P="0,0,0,0.2,90,0,0,0" /><S P="0,0,,,,0,0,0" L="1600" H="134" v="1" Y="333" T="9" X="800" /><S H="1000" L="1000" o="6a7495" X="-500" c="4" N="" Y="375" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="1000" o="6a7495" X="2100" c="4" N="" Y="375" T="12" H="1000" /><S P="0,0,0.3,0.2,0,0,0,0" L="2000" o="6a7495" X="772" c="4" N="" Y="900" T="12" H="1000" /></S><D><DC Y="79" X="800" /><P X="389" Y="367" T="45" P="0,0" /><P X="1185" Y="367" T="45" P="0,0" /><P C="bb5631" Y="402" T="86" X="148" P="0,0" /><P C="bb5631" Y="402" T="86" X="765" P="0,0" /><P X="520" Y="407" T="84" P="0,0" /><P P="0,0" Y="399" T="87" X="309" /><P P="0,0" Y="400" T="87" X="933" /><P P="0,0" Y="401" T="88" X="1054" /><P P="0,0" Y="401" T="83" X="1402" /><P P="0,0" Y="404" T="80" X="1287" /><P P="0,0" Y="153" T="36" X="799" /><P P="0,0" Y="147" T="36" X="1100" /><P P="0,0" Y="147" T="36" X="1404" /><P P="0,0" Y="154" T="36" X="491" /><P P="0,0" Y="157" T="36" X="201" /></D><O><O C="2" Y="300" X="70" P="0" /><O C="2" Y="300" P="0" X="130" /><O C="2" Y="300" X="190" P="0" /><O C="2" Y="300" P="0" X="250" /><O C="2" Y="300" X="310" P="0" /><O C="2" Y="300" P="0" X="370" /><O C="2" Y="300" X="430" P="0" /><O C="2" Y="300" P="0" X="490" /><O C="2" Y="300" X="550" P="0" /><O C="2" Y="300" P="0" X="610" /><O C="2" Y="300" X="670" P="0" /><O C="2" Y="300" P="0" X="730" /><O C="2" Y="300" X="790" P="0" /><O C="2" Y="300" P="0" X="850" /><O C="2" Y="300" X="910" P="0" /><O C="2" Y="300" P="0" X="970" /><O C="2" Y="300" X="1030" P="0" /><O C="2" Y="300" P="0" X="1090" /><O C="2" Y="300" X="1150" P="0" /><O C="2" Y="300" P="0" X="1210" /><O C="2" Y="300" X="1270" P="0" /><O C="2" Y="300" P="0" X="1330" /><O C="2" Y="300" X="1390" P="0" /><O C="2" Y="300" P="0" X="1450" /><O C="2" Y="300" X="1510" P="0" /></O><L><VL n="Layer1" l="-1" /><JD c="001fcf,134,0.75,1" P1="0,334" P2="1600,334" /><JD c="001fcf,10,0.35,1" P1="0,262" P2="1600,262" /><L /></L></Z></C>'
unlocked=false
tfm.exec.newGame(map)
function eventNewGame()
	unlocked=false
	tfm.exec.setUIMapName("<J>Tente não cair <b>v1.0.6</b> - Module criado por <VP>Rivenbagassa#0000<")
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.lowerSyncDelay(name)
		end
	end
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		tfm.exec.setGameTime(5)
	elseif i==1 then
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.setGameTime(5)
		winner=n
	end
end
function eventLoop(p,f)
	if f < 5000 then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isShaman then
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
			end
		end
	end
	if f < 1000 then
		tfm.exec.newGame(map)
		tfm.exec.setShaman(winner)
	end
	if p > 500 and p < 1000 then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].shamanMode == 0 then
				tfm.exec.killPlayer(name)
				tfm.exec.chatMessage("<ROSE>Você deve usar o modo <b>normal</b> de shaman para jogar.",name)
			end
		end
	end
	if p > 3000 and unlocked == false then
		unlocked=true
	end
	if p > 3500 and p < 4500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if player.y > 150 and unlocked == true then
				tfm.exec.giveCheese(name)
			end
		end
	end
end
