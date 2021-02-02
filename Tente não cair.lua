tfm.exec.disableAutoNewGame(true)
winner=""
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.setRoomMaxPlayers(24)
map='<C><P DS="m;200,220,400,220,600,220,800,220,1000,220,1200,220,1400,220" F="4" L="1590" /><Z><S><S X="800" L="1600" H="130" c="4" Y="335" T="3" P="0,0,0,20,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="50" H="400" N="" Y="200" T="10" X="25" /><S P="0,0,0,0.2,0,0,0,0" L="50" X="1565" N="" Y="200" T="10" H="400" /><S L="40" X="800" H="1600" Y="20" T="10" P="0,0,0,0.2,90,0,0,0" /><S L="40" H="1600" X="800" Y="115" T="10" P="0,0,0,0.2,90,0,0,0" /><S L="1600" H="134" X="800" v="1" Y="335" T="9" P="0,0,,,,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="1000" o="6a7495" X="-500" c="4" N="" Y="375" T="12" H="1000" /><S H="1000" L="1000" o="6a7495" X="2100" c="4" N="" Y="375" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S H="1000" L="2000" o="6a7495" X="772" c="4" N="" Y="900" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S c="4" L="424" o="6a7495" H="722" X="1803" N="" Y="302" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DC Y="79" X="800" /><P P="0,0" Y="367" T="45" X="389" /><P P="0,0" Y="367" T="45" X="1185" /><P C="bb5631" Y="402" T="86" P="0,0" X="148" /><P C="bb5631" Y="402" T="86" P="0,0" X="765" /><P P="0,0" Y="407" T="84" X="520" /><P X="309" Y="399" T="87" P="0,0" /><P X="933" Y="400" T="87" P="0,0" /><P X="1054" Y="401" T="88" P="0,0" /><P X="1402" Y="401" T="83" P="0,0" /><P X="1287" Y="404" T="80" P="0,0" /><P X="799" Y="153" T="36" P="0,0" /><P X="1100" Y="147" T="36" P="0,0" /><P X="1404" Y="147" T="36" P="0,0" /><P X="491" Y="154" T="36" P="0,0" /><P X="201" Y="157" T="36" P="0,0" /></D><O><O C="2" Y="300" P="0" X="70" /><O C="2" Y="300" X="130" P="0" /><O C="2" Y="300" P="0" X="190" /><O C="2" Y="300" X="250" P="0" /><O C="2" Y="300" P="0" X="310" /><O C="2" Y="300" X="370" P="0" /><O C="2" Y="300" P="0" X="430" /><O C="2" Y="300" X="490" P="0" /><O C="2" Y="300" P="0" X="550" /><O C="2" Y="300" X="610" P="0" /><O C="2" Y="300" P="0" X="670" /><O C="2" Y="300" X="730" P="0" /><O C="2" Y="300" P="0" X="790" /><O C="2" Y="300" X="850" P="0" /><O C="2" Y="300" P="0" X="910" /><O C="2" Y="300" X="970" P="0" /><O C="2" Y="300" P="0" X="1030" /><O C="2" Y="300" X="1090" P="0" /><O C="2" Y="300" P="0" X="1150" /><O C="2" Y="300" X="1210" P="0" /><O C="2" Y="300" P="0" X="1270" /><O C="2" Y="300" X="1330" P="0" /><O C="2" Y="300" P="0" X="1390" /><O C="2" Y="300" X="1450" P="0" /><O C="2" Y="300" P="0" X="1510" /></O><L><VL n="Layer1" l="-1" /><JD c="cf1f00,134,0.75,1" P2="1600,334" P1="0,334" /><JD c="cf1f00,10,0.35,1" P2="1600,262" P1="0,262" /><L /></L></Z></C>'
unlocked=false
tfm.exec.newGame(map)
function eventNewGame()
	unlocked=false
	tfm.exec.setUIMapName("<J>Tente não cair <b>v1.0.7</b> - Module criado por <VP>Rivenbagassa#0000<")
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.lowerSyncDelay(name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
 tfm.exec.chatMessage("<ROSE>Os shamans precisam alternar para o modo <b>normal</b> de shaman para jogar.")
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
		if player.isShaman then
			tfm.exec.setGameTime(5)
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
		tfm.exec.chatMessage("<VP><b>"..n.."</b> foi o sobrevivente!")
	end
end
function eventLoop(p,f)
	if f < 2000 and f > 1350 then
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
	if p > 500 and p < 1500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].isShaman then
				if tfm.get.room.playerList[name].shamanMode > 0 then
					tfm.exec.killPlayer(name)
					tfm.exec.chatMessage("<ROSE>Você deve usar o modo <b>normal</b> de shaman para jogar.",name)
				end
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
