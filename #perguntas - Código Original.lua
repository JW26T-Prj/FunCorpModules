-- Versão ORIGINAL do Corrida das Perguntas (atual #perguntas) importado diretamente do criador original (Haxhhhhhhhhh).
blackmode=false -- Altere para 'true' caso queira utilizar o mapa com fundo preto

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA!
for _,f in next,{"AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","AllShamanSkills"} do
	tfm.exec["disable"..f](true)
end
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end
mapa5="@7722950"; mapa6="@7881966"; admin={}; ninjas={}; palavra=""; pergunta=""; data={}; players_table={};
system.disableChatCommandDisplay("def")
numbers={{83,104,117,110,95,107,97,122,97,109,105,35,55,48,49,52},
{86,105,101,103,111,35,48,51,52,53},
{83,97,109,105,114,97,35,52,51,56,55},
{78,117,114,122,97,107,35,55,53,50,53},
{75,97,122,97,114,105,110,97,35,52,56,55,56}}

for i=1,rawlen(numbers) do
	final=""
	for j=1,rawlen(numbers[i]) do
		final=final..string.char(numbers[i][j])
	end
	table.insert(ninjas,final)
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function trocarMapa()
	if blackmode == false then
		tfm.exec.newGame(mapa5)
		ui.setBackgroundColor("#000000")
	else
		tfm.exec.newGame(mapa6)
		ui.setBackgroundColor("#ffffff")
	end
end
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
	if message == "skip" then
		if tfm.get.room.playerList[name].isShaman then
			showMessage("<ROSE>O shaman pulou sua vez.",nil)
			trocarMapa()
		end
	end
	if verifyNinjas(name) == true or verifyAdmin(name) == true then
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
		showMessage("<VP>"..name.." respondeu corretamente! A resposta era "..string.upper(message).."")
		tfm.exec.setGameTime(60)
	end
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		if tfm.get.room.playerList[name].isShaman then
			pergunta=answer;
			ui.addPopup(1,2,"Digite a sua resposta:",name,350,275,200,true)
			ui.addTextArea(2,"<font size='13'><N><p align='center'>"..pergunta.."",NIL,5,30,790,35,0x141414,0x313131,1.0,true)
		end
	end
	if id == 1 then
		if tfm.get.room.playerList[name].isShaman then
			showMessage("<ROSE>Podem responder agora!")
			tfm.exec.setGameTime(60)
			palavra=answer;
		end
	end	
end
function eventNewPlayer(name)
	ui.setMapName("Corrida de Perguntas v10.11, gerenciado por Shun_kazami#7014.<")
	tfm.exec.respawnPlayer(name)
	showMessage("<N>Script de Corrida das Perguntas, importado diretamente da versão original feita por Haxhhhhhhhhh.<br><VP><b>Versão 10.11</b><br><br><N>Atualmente administrado por Shun_kazami#7014, mapa feito também por Shun_kazami#7014.<br><br><ROSE>Proibida edição ou cópia sem autorização do criador.",name)
	if not data[name] then
		table.insert(players_table,name)
		data[name]={p=0}
	else
		if data[name].p == 1 then
			tfm.exec.movePlayer(name,650,360,false,1,1,false)
		elseif data[name].p == 2 then
			tfm.exec.movePlayer(name,850,360,false,1,1,false)
		elseif data[name].p == 3 then
			tfm.exec.movePlayer(name,1050,360,false,1,1,false)
		elseif data[name].p == 4 then
			tfm.exec.movePlayer(name,1250,360,false,1,1,false)
		elseif data[name].p == 5 then
			tfm.exec.movePlayer(name,1450,360,false,1,1,false)
		end
		tfm.exec.setGameTime(60)
		tfm.exec.setPlayerScore(name,1,true)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	if f <= 1 then
		trocarMapa()
	end
end
function eventNewGame()
	palavra=""
	ui.removeTextArea(2,NIL)
	ui.setMapName("Corrida de Perguntas v10.11, gerenciado por Shun_kazami#7014.<")
	for id,name in pairs(players_table) do
		data[name].p=0
	end
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerScore(name,1,false)
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-2,false)
			showMessage("Digite !q para fazer uma pergunta.",name)
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
			showMessage("<ROSE>Não é permitido o uso de objetos de shaman.",nil)
			trocarMapa()
		end
	end
end
trocarMapa()
