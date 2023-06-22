admin="" -- Insert your nickname here!

-- Admin commands: !limits, !return, !cancel, !at [5-30], !shamdef [nickname#tag].

for _,f in next,{"per","skip","limits","return","cancel","at","shamdef"} do
	system.disableChatCommandDisplay(f)
end
for _,G in next,{"DebugCommand","AutoScore","AutoNewGame","AfkDeath","PhysicalConsumables","AllShamanSkills"} do
	tfm.exec["disable"..G](true)
end
blue_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0000ff,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xff0000,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 400,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.setRoomMaxPlayers(35)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
current_mode=""; answer_time=20; remain_time=0;
game_map="@7605289"
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
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in next,tfm.get.room.playerList do
		ui.addPopup(10,0,"",name,-1000,-1000,128,false)
		ui.addPopup(11,0,"",name,-1100,-1000,128,false)
		ui.addPopup(20,0,"",name,-1100,-1000,128,false)
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
			showMessage("<VP>Please type <b>!per</b> to make a question. Type <b>!skip</b> to skip your turn.",name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			showMessage("<R>Souris cannot play this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setMapName("<N>True or False - version <VP><b>RTM 2812.009</b> <N>by <ROSE><b>Hecarimjhenx#0000</b><")
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if not tfm.get.room.playerList[name].isShaman then
		limits.mices_alive=limits.mices_alive-1
	end
end
function reset()
	tfm.exec.newGame(game_map)
	tfm.exec.setGameTime(60)
	current_mode="waiting"
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
		end
	end
	ui.setMapName("<N>True or False - version <VP><b>RTM 2812.009</b> <N>by <ROSE><b>Hecarimjhenx#0000</b><")
end
function isTrue()
	showMessage("<VP>The answer is TRUE!")
	tfm.exec.addPhysicObject(1, 585, -400, red_ground)
end
function isFalse()
	showMessage("<R>The answer is FALSE!")
	tfm.exec.addPhysicObject(0, 215, -400, blue_ground)
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 15 then
			limits.questions=tonumber(answer)
			ui.addPopup(1,2,"Type the time limit of the round in minutes (min: 1, max: 12)",name,350,175,200,true)
		end
	end
	if id == 1 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 12 then
			limits.time=tonumber(answer)
			showMessage("Questions limit changed to "..limits.questions.." and time limit changed to "..limits.time.."")
		end
	end
	if id == 10 then
		if string.len(answer) >= 10 and string.len(answer) <= 170 then
			questions.question=answer
			ui.addPopup(11,1,"Click YES if your answer is TRUE<br>Click NO if your answer is FALSE",name,350,175,200,true)
		else
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
			showMessage("<R>Your question is too large or too short. Please make a new question.",name)
		end
	end
	if id == 11 then
		if remain_time > 1 then
			questions.answer=answer
			questions.round=questions.round+1
			current_mode="truefalse"
			tfm.exec.setGameTime(answer_time)
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					tfm.exec.movePlayer(name,400,330)
				else
					tfm.exec.movePlayer(name,400,1330)
				end
			end
			showMessage("<N>"..questions.question.."")
			ui.addTextArea(0,"<font size='18'><p align='center'><font face='Segoe UI,Arial'>"..questions.question.."",nil,15,25,770,50,0x010101,0x010101,0.95,true)
			for _,i in next,{"Hecarimjhenx#0000","Viego#0345","Alisson#3938","Velkozdapic#0000"} do
				showMessage(questions.answer,i)
			end
		end
	end
	if id == 20 then
		if answer == "yes" then
			showMessage("<R>"..name.." skipped your turn.")
			reset()
		end
	end
end
function eventChatCommand(name,message)
	if name == "Hecarimjhenx#0000" or name == "Viego#0345" or name == "Alisson#3938" or name == admin then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			if tonumber(message:sub(4)) >= 5 and tonumber(message:sub(4)) <= 30 then
				answer_time=tonumber(message:sub(4))
				showMessage("Answer time: "..answer_time.."s.")
			end
		end
		if(message:sub(0,7) == "shamdef") then
			if current_mode == "waiting" then
				tfm.exec.setPlayerScore(message:sub(9),10001,false)
				reset()
			end
		end
		if message == "return" then
			if current_mode == "truefalse" then
				for name,player in next,tfm.get.room.playerList do
					if not tfm.get.room.playerList[name].isShaman then
						tfm.exec.movePlayer(name,400,-100)
					end
				end
				current_mode="waiting"
				tfm.exec.setGameTime(60)
				showMessage("<R>This question has been cancelled.")
				ui.removeTextArea(0,nil)
			end
		end
		if message == "cancel" then
			if current_mode == "truefalse" or current_mode == "waiting" then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.killPlayer(name)
				end
				showMessage("<R>This shaman has been skipped.")
				reset()
			end
		end
	end
	if tfm.get.room.playerList[name].isShaman and current_mode == "waiting" then
		if message == "per" and limits.mices_alive >= 2 then
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
		end
		if message == "skip" then
			ui.addPopup(20,1,"Skip your turn?",name,350,175,200,true)
		end
	end
end
function eventLoop(time,remaining)
	remain_time=remaining/1000
	if remain_time < 1 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time is up! Other shaman will be choosed.")
	end
	if remain_time < 1 and current_mode == "truefalse" then
		ui.removeTextArea(0,nil)
		tfm.exec.addPhysicObject(2, 400, 200, center_ground)
		tfm.exec.setGameTime(5)
		current_mode="wait"
	end
	if remaining < 300 and current_mode == "wait" then
		if questions.answer == "yes" then
			isTrue()
		else
			isFalse()
		end
		tfm.exec.setGameTime(7)
		current_mode="answer"
	end
	if remaining <= 1 and current_mode == "answer" then
		if questions.answer == "yes" then
			for name,player in next,tfm.get.room.playerList do
				if player.x > 400 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.movePlayer(name,400,-50)
				end
			end
		else
			for name,player in next,tfm.get.room.playerList do
				if player.x < 400 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.movePlayer(name,400,-50)
				end
			end
		end
		tfm.exec.removePhysicObject(2)
		current_mode="waiting"
		tfm.exec.setGameTime(60)
	end
	if remain_time < 55 and limits.mices_alive <= 0 and current_mode == "waiting" then
		reset()
		showMessage("<R>No winners!")
	end
	if remain_time < 55 and limits.mices_alive == 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead and not tfm.get.room.playerList[name].isShaman then
				tfm.exec.setPlayerScore(name,10000,false)
				reset()
			end
		end
	end
	if remain_time < 55 and remain_time >= 54 and limits.mices_alive >= 2 and questions.round >= 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y)
			end
		end
		if questions.round >= limits.questions and current_mode == "waiting" then
			reset()
			showMessage("<R>Questions limit reached!")
		end
	end
	if time > limits.time*60000 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time limit reached!")
	end
end
reset()
