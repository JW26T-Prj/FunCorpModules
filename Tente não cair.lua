tfm.exec.disableAutoNewGame(true); tfm.exec.disableAllShamanSkills(true); tfm.exec.disableAutoTimeLeft(true)
tfm.exec.newGame("@7907244"); modo="jogar";
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function eventNewGame()
	modo="jogar"
	for name,player in next,tfm.get.room.playerList do
		if not tfm.get.room.playerList[name].isShaman then
			tfm.exec.giveCheese(name)
		else
			if tfm.get.room.isTribeHouse == false then
				tfm.exec.setPlayerSync(name)
			end
		end
	end
	tfm.exec.setUIMapName("<N>Tente não cair v1.1.2 - Module criado por <VP><b>Rivenbagassa#0000</b><")
	for i=1,19 do
		tfm.exec.addShamanObject(2, (60*i)+40, 270, 0, 0, 0, false)
		tfm.exec.addShamanObject(2, (60*i)+40, 330, 0, 0, 0, false)
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
		showMessage("<R>Ninguém ganhou!")
		modo="final"
	elseif i==1 then
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setGameTime(5)
		showMessage("<N><b>"..n.."</b> é o ganhador!")
		modo="final"
	end
	if tfm.get.room.playerList[name].isShaman and modo == "jogar" then
		tfm.exec.setGameTime(5)
		showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
	end
end
function eventLoop(p,f)
	if f < 1000 then
		tfm.exec.newGame("@7907244")
	end
	if f <= 4000 and f >= 3400 then
		if modo == "jogar" then
			modo="final"
			tfm.exec.disableAutoScore(true)
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isDead then
					tfm.exec.giveCheese(name)
					tfm.exec.playerVictory(name)
					tfm.exec.setPlayerScore(name,10,true)
				end
			end
			showMessage("<VP>Tempo esgotado! Todos os ratos vivos venceram!")
			tfm.exec.disableAutoScore(false)
		end
	end				
end
