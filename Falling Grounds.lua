-- Falling Grounds
-- Feito por / made by Patrick_mahomes#1795
-- ® 2025 Jessie LinesPower TFM Utilities Group
--------------------------------------------------------------------------------------------------------
for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"kill","restart"} do
	system.disableChatCommandDisplay(g)
end
ground_id=20; loop=-14; remain=9; grounds={0,5,6,7,10,11,12,13,16,17,18}; ninjas={}; mapas={"@7963726","@7963727","@7963728","@7963729","@7963730","@7963731","@7963732"}
numbers={{80,97,116,114,105,99,107,95,109,97,104,111,109,101,115,35,49,55,57,53},{65,107,119,105,109,111,115,35,49,57,51,55},{89,117,104,35,48,55,52,56},{76,101,98,108,97,110,99,35,53,51,52,50},{86,105,101,103,111,35,48,51,52,53}}
for i=1,rawlen(numbers) do
	final=""
	for j=1,rawlen(numbers[i]) do
		final=final..string.char(numbers[i][j])
	end
	table.insert(ninjas,final)
end
function showMessage(message,name)
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
function eventChatCommand(name,message)
	if verifyNinjas(name) == true then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventNewGame()
	ground_id=20; loop=-14; remain=9;
	for i=1,20 do
		size=math.random(10,45)
		tfm.exec.addPhysicObject(i,math.random(20,1580),math.random(160,395),{type=grounds[math.random(#grounds)],width=size,height=size,friction=0.3,miceCollision=true,color=math.random(1,16777216)})
	end
	tfm.exec.setGameTime(78)
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.giveMeep(name)
	end
end
function eventNewPlayer(name)
	showMessage("<J><b>Welcome to Falling Grounds!</b>\n\n<N>The objective of this module is survive! Test your luck and discover what ground will not be removed!\n\n<R>Module made by Patrick_mahomes#1795\n<BL>® Falling Grounds is a registered name of Jessie LinesPower TFM Utilities Group.\nEditing and adapting this code without authorization is prohibited.",name)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	ui.setMapName("<N>Falling Grounds")
	loop=loop+1; remain=remain-0.5
	if remain == 3 then imageId = tfm.exec.addImage("17a4e9afa86.png",":1",358,280,nul) end
	if remain == 2.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 2 then imageId = tfm.exec.addImage("17a4e9ae302.png",":1",358,280,nul) end
	if remain == 1.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 1 then imageId = tfm.exec.addImage("17a4e9acb8f.png",":1",358,280,nul) end
	if remain == 0.5 then tfm.exec.removeImage(imageId,true) end
	if remain <= 0 and loop >= 6 and ground_id >= 2 then
		tfm.exec.removePhysicObject(ground_id)
		ground_id=ground_id-1
		loop=0
	end
	if f <= 1 then
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
		end
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
end
function eventPlayerDied(name)
	local i=0; local n
	for pname,player in next,tfm.get.room.playerList do
		if not player.isDead and not player.isShaman then
			i=i+1; n=pname
		end
	end
	if i==0 then
		tfm.exec.setGameTime(5)
		showMessage("<R>No winners!")
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
