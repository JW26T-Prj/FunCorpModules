-- SCRIPT EXCLUSIVO DE SHUN_KAZAMI#7014 (antigo membro da SAMG)
-- Versão ORIGINAL do Corrida das Perguntas (vulgo #bolodefchoco00perguntas) importado diretamente do criador original (Haxhhhhhhhhh).
-- Mapa novo feito por Shun_kazami#7014 e script agora administrado por Shun_kazami#7014.
tfm.exec.disableAutoNewGame(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.setRoomMaxPlayers(30)
tfm.exec.disableAfkDeath(true)
mapa5="@7722950"
admin=""
function trocarMapa()
	tfm.exec.newGame(mapa5)
end
tfm.exec.setGameTime(60)
palavra=""
pergunta=""
data={}
players_table={}
system.disableChatCommandDisplay("def")
for name,player in pairs(tfm.get.room.playerList) do
	newData={
	["p"]=0;
	}
	data[name] = newData;
end
function eventChatCommand(name,message)
	if message == "q" then
		if tfm.get.room.playerList[name].isShaman then
			ui.addPopup(0,2,"Digite a sua pergunta:",name,350,175,200,true)
		end
	end
	if name == "Shun_kazami#7014" or name == "Spectra_phantom#6089" or name == "admin" then
	if(message:sub(0,3) == "def") then
		tfm.exec.setPlayerScore(message:sub(5),10,false)
		trocarMapa()
	end
	end
end
function eventChatMessage(name,message)
	if string.upper(message) == string.upper(palavra) and not tfm.get.room.playerList[name].isShaman then
			data[name].p=data[name].p+1
			palavra=""
			pergunta=""
			tfm.exec.setPlayerScore(name,1,true)
			if data[name].p == 1 then
				tfm.exec.movePlayer(name,700,360,false,1,1,false)
			elseif data[name].p == 2 then
				tfm.exec.movePlayer(name,900,360,false,1,1,false)
			elseif data[name].p == 3 then
				tfm.exec.movePlayer(name,1100,360,false,1,1,false)
			elseif data[name].p == 4 then
				tfm.exec.movePlayer(name,1300,360,false,1,1,false)
			elseif data[name].p == 5 then
				tfm.exec.movePlayer(name,1500,360,false,1,1,false)
			end
			ui.removeTextArea(2,NIL)
			tfm.exec.chatMessage("<VP>"..name.." respondeu corretamente! A resposta era "..string.upper(message).."")
			tfm.exec.setGameTime(60)
		end
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		pergunta=answer;
		ui.addPopup(1,2,"Digite a sua resposta:",name,350,275,200,true)
		ui.addTextArea(2,"<font size='13'><N><p align='center'>"..pergunta.."",NIL,5,30,790,35,0x141414,0x313131,1.0,true)
	end
	if id == 1 then
		tfm.exec.chatMessage("<ROSE>Podem responder agora!")
		tfm.exec.setGameTime(60)
		palavra=answer;
	end	
end
function eventNewPlayer(name)
	ui.setMapName("Questions Race v10.1 [versão de 32-bits]. By Shun_kazami#7014. Versão original.<")
	tfm.exec.respawnPlayer(name)
	tfm.exec.chatMessage("<N>Script de Corrida das Perguntas, importado diretamente da versão original feita por Haxhhhhhhhhh.<br><b>Versão 10.1</b><br><br>Atualmente administrado por Shun_kazami#7014, mapa feito também por Shun_kazami#7014.<br><br><ROSE>SCRIPT EXCLUSIVO DA SPECTRA ADVANCED MODULE GROUP",name)
	if not data[name] then
		table.insert(players_table,name)
		data[name]={p=0}
	else
		if data[name].p == 1 then
			tfm.exec.movePlayer(name,380,360,false,1,1,false)
		elseif data[name].p == 2 then
			tfm.exec.movePlayer(name,550,360,false,1,1,false)
		elseif data[name].p == 3 then
			tfm.exec.movePlayer(name,720,360,false,1,1,false)
		elseif data[name].p == 4 then
			tfm.exec.movePlayer(name,890,360,false,1,1,false)
		elseif data[name].p == 5 then
			tfm.exec.movePlayer(name,1060,360,false,1,1,false)
		elseif data[name].p == 6 then
			tfm.exec.movePlayer(name,1230,360,false,1,1,false)
		elseif data[name].p == 7 then
			tfm.exec.movePlayer(name,1400,360,false,1,1,false)
		end
		tfm.exec.setGameTime(60)
		tfm.exec.setPlayerScore(name,1,true)
	end
end
function eventLoop(p,f)
	if f <= 1 then
		trocarMapa()
	end
end
function eventNewGame()
	palavra=""
	ui.removeTextArea(2,NIL)
	ui.setMapName("Questions Race v10.1 [versão de 32-bits]. By Shun_kazami#7014. Versão original.<")
	for id,name in pairs(players_table) do
		data[name].p=0
	end
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerScore(name,1,false)
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-2,false)
			tfm.exec.chatMessage("Digite !q para fazer uma pergunta.",name)
		end
		ui.addPopup(0,0,"",name,-1000,-1000,200,true)
		ui.addPopup(1,0,"",name,-1000,-1000,200,true)
	end
	tfm.exec.setGameTime(60)
end
function eventPlayerWon(name)
	tfm.exec.setGameTime(5)
end
function eventSummoningEnd(name,type,x,y,angle,vx,vy,obj)
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.chatMessage("<ROSE>Não é permitido o uso de objetos de shaman.",nil)
			trocarMapa()
		end
	end
end
trocarMapa()
