-- Versão antiga e original do Cidade Dorme, ainda quando feito pelo Spectra_phantom#6089. Esta versão contém vários bugs e não pode funcionar como o esperado.
-- ESSA VERSÃO ORIGINAL DO CIDADE DORME TÁ TODA BUGADA, USEM A VERSÃO DO RAKAN QUE TÁ COM MENOS BUGS
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.disableDebugCommand(true)
data={}
killeds={}
alive={assasins=0,medicals=0,detetives=0,others=0}
players_list={}
limits={assasins=0,medicals=0,detetives=0}
numbers={assasins=0,medicals=0,detetives=0}
system.disableChatCommandDisplay("start")
system.disableChatCommandDisplay("reset")
mices_on_room=0
timer_start=false
map="@4677521"
admin="Reksai_void2600#6638" -- Insira o seu nome!
mode="waiting"
function sortAssasins(player_name,func)
	if data[player_name] then
		if data[player_name].type == "0" and numbers.assasins < limits.assasins then
			data[player_name].type=func
			numbers.assasins=numbers.assasins+1
		end
	end
end
function sortMedicals(player_name,func)
	if data[player_name] then
		if data[player_name].type == "0" and numbers.medicals < limits.medicals then
			data[player_name].type=func
			numbers.medicals=numbers.medicals+1
		end
	end
end
function sortDetetives(player_name,func)
	if data[player_name] then
		if data[player_name].type == "0" and numbers.detetives < limits.detetives then
			data[player_name].type=func
			numbers.detetives=numbers.detetives+1
		end
	end
end
function eventNewGame()
	alive={assasins=0,medicals=0,detetives=0,others=0}
	players_list={}
	limits={assasins=0,medicals=0,detetives=0}
	numbers={assasins=0,medicals=0,detetives=0}
	mices_on_room=0
	tfm.exec.setGameTime(860)
	for name,player in pairs(tfm.get.room.playerList) do
		table.insert(players_list,name)
		mices_on_room=mices_on_room+1
		data[name]={type="0",killed=false,medical=false,angel=false,detetive=false,choosed=false}
	end
	if mices_on_room < 5 and mode == "waiting" then
		mode="disabled"
		tfm.exec.chatMessage("<R>São necessários pelo menos 5 ratos na sala para este module ser executado.",nil)
		tfm.exec.setGameTime(10240)
	print("<VP>Caro funcorp, caso apareça uma mensagem de que há menos de 5 ratos na sala e isso não for verdade, reinicie o script que ele voltará a funcionar normalmente.",nil)
end
function results()
	local killeds=0
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].killed == true and data[name].choosed == false and not tfm.get.room.playerList[name].isDead then
			killeds=killeds+1
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>O jogador "..name.." foi morto pelo(s) assasino(s).",nil)
			data[name].killed=false
		end
	end
	if killeds == 0 then
		tfm.exec.chatMessage("<VP>Ninguém foi morto!")
	end
	checkLives()
end
function resultsd()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].choosed == true and not tfm.get.room.playerList[name].isDead then
			tfm.exec.killPlayer(name)
			if data[name].type == "assassin" then
				tfm.exec.chatMessage("<VP>O assassino "..name.." foi morto!",nil)
				data[name].killed=false
			else
				tfm.exec.chatMessage("<R>Os detetives mataram "..name..", que era um inocente!",nil)
				data[name].killed=false
			end
		end
	end
	checkLives()
end
function eventNewPlayer(name)
	table.insert(players_list,name)
	data[name]={type="0",killed=true,medical=false,angel=false,detetive=false,choosed=false}
end
function eventPlayerDied(name)
	if data[name].type == "0" then
		alive.others=alive.others-1
	elseif data[name].type == "assassin" then
		alive.assasins=alive.assasins-1
	elseif data[name].type == "medical" then
		alive.medicals=alive.medicals-1
	elseif data[name].type == "detetive" then
		alive.detetives=alive.detetives-1
	end
end
function eventLoop(p,f)
	local soma=alive.medicals+alive.detetives
	ui.setMapName("<J>Assasinos vivos: <R><b>"..alive.assasins.."</b><br>  <BL>|  <J>Detetives/Médicos vivos: <N><b>"..soma.."</b>  <BL>|  Cidade Dorme - Feito por Spectra_phantom#6089<")
	if mode == "random" then
		randomPlayers()
		mode="waiting"
	end
	if timer_start == true then
		tfm.exec.setGameTime(15)
		timer_start=false
	end
	if f <= 1 and mode == "waiting" then
		tfm.exec.chatMessage("<J>A CIDADE DORME!")
		ui.addTextArea(0,"",nil,-1,-1,802,402,0x000001,0x000001,0.5,true)
		tfm.exec.setGameTime(800)
	end
	if f <= 855000 and f >= 854500 then
		tfm.exec.chatMessage("Bem-vindos ao module Cidade Dorme. Aqui vocês terão que descobrir quem são os assasinos e os detetives terão que matá-los. POR FAVOR, NINGUÉM DIGA QUEM É QUEM! VAI ESTRAGAR A BRINCADEIRA!!<br><br>Module criado por Spectra_phantom#6089 e traduzido para o português por Rakan_raster#0000.")
	end
	if f <= 845000 and f >= 844500 then
		tfm.exec.chatMessage("<J>Por favor, aguarde. Estamos sorteando os jogadores. hehehe")
		mode="random"
	end
	if f <= 835000 and f >= 834500 then
		for id,name in pairs(players_list) do
			if data[name] then
				if data[name].type == "0" then
					alive.others=alive.others+1
					tfm.exec.chatMessage("<J>Você foi escolhido como vítima. POR FAVOR, NÃO CONTE PARA NINGUÉM!",name)
				elseif data[name].type == "assassin" then
					alive.assasins=alive.assasins+1
					tfm.exec.chatMessage("<J>Você foi escolhido como assasino. Você irá matar as vítimas. POR FAVOR, NÃO CONTE PARA NINGUÉM!",name)
					print("<R>Assasino: "..name.."")
				elseif data[name].type == "medical" then
					alive.medicals=alive.medicals+1
					tfm.exec.chatMessage("<J>Você foi escolhido como médico. Você pode evitar que os jogadores sejam mortos pelos assasinos. POR FAVOR, NÃO CONTE PARA NINGUÉM!",name)
					print("<N>Médico: "..name.."")
				elseif data[name].type == "detetive" then
					alive.detetives=alive.detetives+1
					tfm.exec.chatMessage("<J>Você foi escolhido como detetive. Você será encarregado de tentar descobrir quem são os assasinos. POR FAVOR, NÃO CONTE PARA NINGUÉM!",name)
					print("<VP>Detetive: "..name.."")
				end
			end
		end
	end
	if f <= 825000 and f >= 824500 then
		tfm.exec.chatMessage("<br><R>A partida começará em 15 segundos. Se preparem!",nil)
		timer_start=true
	end
	if f <= 795000 and f >= 794500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].type == "assassin" and not tfm.get.room.playerList[name].isDead then
				ui.addPopup(300,2,"Quem deseja matar? Você tem 30 segundos para fazer a sua escolha.",name,350,175,200,true)
			end
		end
	end
	if f <= 775000 and f >= 774500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].type == "assassin" then
				ui.addPopup(300,2,"",name,-500,2221,200,true)
			end
			if data[name].type == "medical" and not tfm.get.room.playerList[name].isDead then
				ui.addPopup(301,2,"Quem deseja salvar dos assasinos? Você tem 30 segundos para fazer a sua escolha.",name,350,175,200,true)
			end
		end
	end
	if f <= 755000 and f >= 754500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].type == "medical" then
				ui.addPopup(301,2,"",name,-500,2221,200,true)
			end
		end
		tfm.exec.chatMessage("<J>Fim das escolhas! Vamos aos resultados...",nil)
		ui.removeTextArea(0,nil)
	end
	if f <= 747000 and f >= 746500 then
		results()
	end
	if f <= 735000 and f >= 734500 then
		tfm.exec.chatMessage("<J>Os detetives agora tentarão descobrir quem são os assasinos.",nil)
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].type == "detetive" and not tfm.get.room.playerList[name].isDead then
				ui.addPopup(302,2,"Quem você acha que é assasino? Você tem 30 segundos para fazer a sua escolha.",name,350,175,200,true)
			end
		end
	end
	if f <= 715000 and f >= 714500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].type == "detetive" then
				ui.addPopup(302,2,"",name,-500,2221,200,true)
			end
		end
		tfm.exec.chatMessage("<J>Fim das escolhas! Vamos aos resultados...",nil)
	end
	if f <= 707000 and f >= 706500 then
		resultsd()
	end
	if f <= 697000 and f >= 696500 then
		tfm.exec.chatMessage("<br><R>A próxima rodada começará em 15 segundos. Se preparem!",nil)
		timer_start=true
	end	
	if f <= 310000 and f >= 309500 then
		tfm.exec.newGame(map)
	end
end
function checkLives()
	if alive.assasins <= 0 then
		tfm.exec.chatMessage("<VP>Todos os assasinos morreram! Parabéns!<br><br>A próxima partida começa em 10 segundos.",nil)
		tfm.exec.setGameTime(320)
		mode="waiting"
	end
	if alive.detetives <= 0 then
		tfm.exec.chatMessage("<VP>Todos os detetives morreram! Os assasinos venceram a partida!<br><br>A próxima partida começa em 10 segundos.",nil)
		tfm.exec.setGameTime(320)
		mode="waiting"
	end
	if alive.others <= 0 then
		tfm.exec.chatMessage("<VP>Todas as vítimas morreram! Os assasinos venceram a partida!<br><br>A próxima partida começa em 10 segundos.",nil)
		tfm.exec.setGameTime(320)
		mode="waiting"
	end
end
function randomPlayers()
	limits.assasins=4
	limits.medicals=2
	limits.detetives=3
	mode="waiting"
end
function eventPopupAnswer(id,name,message)
	if id == 300 then
		if data[message] then
			data[message].killed=true
			tfm.exec.chatMessage("Você decidiu matar "..message..".",name)
			print("Assasino "..name.." matou o jogador "..message.."")
		else
			ui.addPopup(300,2,"Nome inválido. Certifique que o nome foi digitado corretamente, incluindo maiúsculas, minúsculas e tag.",name,350,175,200,true)
		end
	end
	if id == 301 then
		if data[message] then
			data[message].killed=false
			tfm.exec.chatMessage("Você decidiu salvar "..message..".",name)
			print("Médico "..name.." salvou o jogador "..message.."")
		else
			ui.addPopup(301,2,"Nome inválido. Certifique que o nome foi digitado corretamente, incluindo maiúsculas, minúsculas e tag.",name,350,175,200,true)
		end
	end
	if id == 302 then
		if data[message] then
			data[message].choosed=true
			tfm.exec.chatMessage("Você acha que "..message.." é o assasino.",name)
			print("Detetive "..name.." suspeitou "..message.." de ser um assasino.")
		else
			ui.addPopup(302,2,"Nome inválido. Certifique que o nome foi digitado corretamente, incluindo maiúsculas, minúsculas e tag.",name,350,175,200,true)
		end
	end
end
tfm.exec.newGame(map)