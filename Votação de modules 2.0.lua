-- FunCorp, este script é usado para que os ratos possam votar em até 6 scripts diferentes.
-- Substitua na linha 5 do código a variável 'admin' pelo seu nickname com a #tag. Ao rodar o código, digite !start e escolha os scripts e aguarde a votação.
-- Caso você também queira, substitua na linha 6 do código a variável 'tempo', para definir a quantidade de tempo até o resultado final.
-- Se por algum motivo você precise reiniciar a votação, digite !reset para reiniciar tudo. Neste caso, volte a definir os scripts novamente.
admin=""
tempo=90
scripts={name1="",name2="",name3="",name4="",name5="",name6="",count1=0,count2=0,count3=0,count4=0,count5=0,count6=0}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f]()
end
for i=1,6 do
	system.disableChatCommandDisplay(tostring(i))
end
script=0
iniciado=false
system.disableChatCommandDisplay("start")
system.disableChatCommandDisplay("reset")
data={}
function eventNewPlayer(name)
	newData={
		["script"]=0
	}
	data[name]=newData;
	tfm.exec.respawnPlayer(name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	tfm.exec.respawnPlayer(name)
end
function eventNewGame()
	iniciado=false
	ui.setMapName("script de votação de modules feito por Jannawindmax#0000 da tribo Gods of survivors<")
	scripts={name1="",name2="",name3="",name4="",name5="",name6="",count1=0,count2=0,count3=0,count4=0,count5=0,count6=0}
	tfm.exec.chatMessage("Digite !start para escolher os scripts e !reset para reiniciar o código.",admin)
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].script=0
	end
	tfm.exec.setGameTime(9600)
end
function eventChatCommand(name,command)
	if name == admin and command == "start" then
		ui.addPopup(1,2,"Digite o script 1:",admin,350,175,200,true)
	end
	if name == admin and command == "reset" then
		tfm.exec.newGame("@7277839")
	end
	if command == "1" then
		if iniciado == true then
			if data[name].script == 0 then
				data[name].script=1
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name1..".",name)
				scripts.count1=scripts.count1+1
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
	if command == "2" then
		if iniciado == true then
			if data[name].script == 0 then
				data[name].script=2
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name2..".",name)
				scripts.count2=scripts.count2+2
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
	if command == "3" then
		if iniciado == true and script >= 3 then
			if data[name].script == 0 then
				data[name].script=2
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name3..".",name)
				scripts.count3=scripts.count3+3
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
	if command == "4" then
		if iniciado == true and script >= 4 then
			if data[name].script == 0 then
				data[name].script=4
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name4..".",name)
				scripts.count4=scripts.count4+4
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
	if command == "5" then
		if iniciado == true and script >= 5 then
			if data[name].script == 0 then
				data[name].script=5
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name5..".",name)
				scripts.count5=scripts.count5+5
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
	if command == "6" then
		if iniciado == true and script >= 6 then
			if data[name].script == 0 then
				data[name].script=6
				tfm.exec.chatMessage("<R>Você votou no script "..scripts.name6..".",name)
				scripts.count6=scripts.count6+6
			else
				tfm.exec.chatMessage("você já votou agr n pode mais",name)
			end
		else
			tfm.exec.chatMessage("não permitido",name)
		end
	end
end
function eventLoop(passou, faltando)
	if faltando <= 100 and iniciado == true then
		iniciado=false
		tfm.exec.chatMessage("<VP>Estes são os resultados da votação!<br><br>")
		if script >= 2 then
			tfm.exec.chatMessage("<N>"..scripts.name1.." - <b>"..scripts.count1.." votos</b>.")
			tfm.exec.chatMessage("<N>"..scripts.name2.." - <b>"..scripts.count2.." votos</b>.")
		end
		if script >= 3 then
			tfm.exec.chatMessage("<N>"..scripts.name3.." - <b>"..scripts.count3.." votos</b>.")
		end
		if script >= 4 then
			tfm.exec.chatMessage("<N>"..scripts.name4.." - <b>"..scripts.count4.." votos</b>.")
		end
		if script >= 5 then
			tfm.exec.chatMessage("<N>"..scripts.name5.." - <b>"..scripts.count5.." votos</b>.")
		end
		if script >= 6 then
			tfm.exec.chatMessage("<N>"..scripts.name6.." - <b>"..scripts.count6.." votos</b>.")
		end
	end
end
function iniciarVotacao()
	iniciado=true
	tfm.exec.setGameTime(tempo)
	if script == 2 then
		tfm.exec.chatMessage("<ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1.."</b><br>ou digite !2 para votar no script <b>"..scripts.name2.."</b>.<br><br>A votação só pode ocorrer 1 vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 3 then
		tfm.exec.chatMessage("<ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b><br>ou !3 para votar no script <b>"..scripts.name3.."</b>.<br><br>A votação só pode ocorrer 1 vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 4 then
		tfm.exec.chatMessage("<ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>ou !4 para votar no script <b>"..scripts.name4.."</b>.<br><br>A votação só pode ocorrer 1 vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 5 then
		tfm.exec.chatMessage("<ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>ou !5 para votar no script <b>"..scripts.name5.."</b>.<br><br>A votação só pode ocorrer 1 vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 6 then
		tfm.exec.chatMessage("<ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>!5 para votar no script <b>"..scripts.name5.."</b><br>ou !6 para votar no script <b>"..scripts.name6.."</b>.<br><br>A votação só pode ocorrer 1 vez por rato, e sua escolha pode não ser alterada.")
	end
end
function eventPopupAnswer(id,name,answer)
	if id == 1 then
		if answer == "" then
			tfm.exec.chatMessage("<R>Número insuficiente de scripts para iniciar a votação.",admin)
		else
			scripts.name1=answer
			script=1
			tfm.exec.chatMessage("Script 1 escolhido: "..scripts.name1.."")
			ui.addPopup(2,2,"Digite o script 2:",admin,350,175,200,true)
		end
	end
	if id == 2 then
		if answer == "" then
			tfm.exec.chatMessage("<R>Número insuficiente de scripts para iniciar a votação.",admin)
		else
			scripts.name2=answer
			script=2
			tfm.exec.chatMessage("Script 2 escolhido: "..scripts.name2.."")
			ui.addPopup(3,2,"Digite o script 3 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 3 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name3=answer
			script=3
			tfm.exec.chatMessage("Script 3 escolhido: "..scripts.name3.."")
			ui.addPopup(4,2,"Digite o script 4 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 4 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name4=answer
			script=4
			tfm.exec.chatMessage("Script 4 escolhido: "..scripts.name4.."")
			ui.addPopup(5,2,"Digite o script 5 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 5 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name5=answer
			script=5
			tfm.exec.chatMessage("Script 5 escolhido: "..scripts.name5.."")
			ui.addPopup(6,2,"Digite o script 6 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 6 then
		if not answer == "" then
			scripts.name6=answer
			script=6
			tfm.exec.chatMessage("Script 6 escolhido: "..scripts.name6.."")
		end
		iniciarVotacao()
	end
end
tfm.exec.newGame("@7277839")