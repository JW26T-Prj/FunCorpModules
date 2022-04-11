for _,f in next,{"AutoNewGame","AutoTimeLeft","AutoShaman","AutoScore","DebugCommand","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
system.disableChatCommandDisplay("help")
data={}; lang={}; loop=0; map_count=0; event_selected=0; running=false; pass_int=0; falt_int=0; run_int=0; event_int=0; endgame=false; changed=false;
map="@7901662"; xml2=''
ground={type = 12,width = 10,height = 210,foregound = 1,friction = 0.0,restitution = 1.0,angle = 0,color = 0xffffff,miceCollision = true,groundCollision = true,dynamic = false}
powerups={wind=false,meteor=false,gravity=false,cheese=false}
events_pt={"Fúria da Tormenta","Chuva de Meteoros","Anomalia Gravitacional","Queijo para Todos"}
events_en={"Wind Fury","Meteor Rain","Gravity Anomaly","Cheese for All"}
power_d={p2={6,8,10,12,14,16},p3={12,14,16,18,20,22}}
lang.br = {
	mapname = "<N><b>#mountain</b>  <V>-  <N>versão <ROSE>v1.0.1   <G>|   <N>Desenvolvido por <J>Morganadxana#0000<",
	enter = "<N>Bem-vindo ao module <J><b>#mountain!</b><br><N>Você tem 3 minutos para escalar a grande montanha que há pelo caminho!<br><br><VP>Tenha cuidado, pois os deuses da montanha estão furiosos e irão causar grandes contratempos para quem tentar subir!<br><br><ROSE>Versão v1.0.1 - desenvolvido por Morganadxana#0000<br><VP>Agradecimentos especiais a Spectra_phantom#6089, Draw#6691 e Forzaldenon#0000<br><br><R>MODULE NÃO RECOMENDADO PARA JOGADORES COM PC DA XUXA",
	newgame = "<N>Caso não saiba o que fazer neste module, digite <b>!help</b>.",
	getready = "<J>Se prepare! A estrada para a montanha será liberada em breve!",
	start = "<VP><b>E que comece a batalha!</b>",
	event1 = "O evento",
	event2 = "será iniciado em instantes, e terá duração de ",
	event3 = "segundos!",
	event4 = " começou! Salve-se quem puder!",
	t10secs = "<font color='#ff8000'>Restam apenas 10 segundos! Apenas o rato que estiver mais alto sobreviverá!",
	winner = "é o grande vencedor!",
	scaled = "Ele(a) subiu ",
	recognized = "metros e agora é reconhecido pelos deuses da montanha!",
	event5 = " foi encerrado!",
	reached2 = "<G>Você atingiu os 2000 metros de altura.<br>Ventos bem gelados começam a te rodear e você começa a sentir falta de ar.",
	reached3 = "<G>Você atingiu os 5000 metros de altura.<br>Já está impossível de suportar o extremo frio, e você começa a ter sérias dificuldades para respirar.",
	reached4 = "<G>Você atingiu os 10000 metros de altura.<br>As correntes geladas começam a te fazer congelar, e seu rato passa a ter um sério problema de asfixia devido a falta de ar.",
	reached5 = "<G>Você atingiu os 20000 metros de altura.<br>Você começa a ver as estrelas muito mais claramente, mesmo no dia claro. No entanto, isto é um péssimo sinal. O ar rarefeito e as baixíssimas temperaturas fazem seu rato morrer aos poucos.",
	reached6 = "<VP>Você chegou no pico da montanha! Os deuses reconheceram sua bravura e coragem e te acolheram para o céu!",
	reached7 = " <VP>chegou até o topo da montanha!<br><N>Ele(a) agora se integra nas estrelas e passa a brilhar como nunca!",
	nowinners = "<R>Não há vencedores!",
	help = "<p align='center'><VP><b>Bem-vindo ao module #mountain.</b><br><br><p align='left'><N>Este modo é bem simples. O objetivo é subir o máximo possível a grande montanha que há pela frente.<br><br>No entanto, os deuses da montanha estão furiosos, e podem atacar com os seguintes contratempos:<br><G>• Fúria da Tormenta: <N>Correntes de vento começam a pairar em volta da montanha.<br><G>• Chuva de Meteoros: <N>Meteoros começam a cair do céu, fazendo com que você caia.<br><G>• Anomalia Gravitacional: <N>Um campo gravítico intenso aparece na montanha, alterando de forma aleatória a gravidade do mapa.<br><G>• Queijo para Todos: <N>Todos os jogadores recebem queijo.<br><br>A partida acaba depois de 3 minutos, quanto todos os ratos morrem ou quando alguém chega no pico da montanha.<br><br><ROSE>Quaisquer bugs ou problemas reporte para Morganadxana#0000."
}
lang.en = {
	mapname = "<N><b>#mountain</b>  <V>-  <N>version <ROSE>v1.0.1   <G>|   <N>Developed by <J>Morganadxana#0000<",
	enter = "<N>Welcome to the <J><b>#mountain</b> module!<br><N>You have 3 minutes to scale the big mountain that is on your way!<br><br><VP>Be careful, because the mountain gods are furious and will cause huge troubles for those who try to scale!<br><br><ROSE>Version v1.0.1 - developed by Morganadxana#0000<br><VP>Translation by Rakan_raster#0000",
	newgame = "<N>If you don't know about this module, please type <b>!help</b>.",
	getready = "<J>Get ready! The road to the mountain will be opened!",
	start = "<VP><b>Go!</b>",
	event1 = "The event",
	event2 = "will start in a few seconds, and will last for ",
	event3 = "seconds!",
	event4 = " started!",
	t10secs = "<font color='#ff8000'>10 seconds remaining! The player that scaled more will survive!",
	winner = "is the winner!",
	scaled = "(S)he scaled ",
	recognized = "meters and now is recognized by the mountain gods!",
	event5 = " is gone!",
	reached2 = "<G>You reached 2000 meters of height.<br>The cold wings starts to surround you, and the air starts to be rarefied...",
	reached3 = "<G>You reached 5000 meters of height.<br>It's almost impossible to tolarate the extreme cold temperatures, and you starts to have serious difficulties to breathe correctly.",
	reached4 = "<G>You reached 10000 meters of height.<br>The strong cold wings starts to freeze you, and your mice starts to have serious suffocation problems because of lack of air...",
	reached5 = "<G>You reached 20000 meters of height.<br>You starts to see the stars with much more clarity, even on the clear day. However, the rarified air and the extremely low temperatures is making your mice to die.",
	reached6 = "<VP>You reached the peak of the mountain! The gods recognized your bravery and courage. Now, you is part of the heaven!",
	reached7 = " <VP>reached the top of the mountain!<br><N>(S)he now is part of the stars and will bright many more!",
	nowinners = "<R>No winners!",
	help = "<p align='center'><VP><b>Welcome to the #mountain module.</b><br><br><p align='left'><N>This game is very simple. The objective is scale the big mountain that is in front of you.<br><br>However, the mountain gods are furious, and can attack you with the following events:<br><G>• Wind Fury: <N>Strong winds hover around the mountain.<br><G>• Meteor Rain: <N>Some meteors will fall from the heaven, making you go down.<br><G>• Gravity Anomaly: <N>A strong gravitational field appears on the mountain, randomly changing the gravity of the map.<br><G>• Cheese For All: <N>All the players will have cheese.<br><br>The match will end after 3 minutes, when there is no more alive mices or when someone reaches the top of the mountain.<br><br><ROSE>Bugs and problems? Report to Morganadxana#0000."
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		print(temp_text)
	end
end
function defineVencedor()
	max_score=10800
	winner=""
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].y <= max_score then
			winner=name
			max_score=tfm.get.room.playerList[name].y
		end
	end
	return winner
end
function showImages(name)
	for i=0,1 do
		tfm.exec.addImage("17fe373d035.jpg","?1",-400+(i*3400),9492,name,1,1)
	end
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,0,name,10,10,0,1)
end
function resetEvents()
	wind=false; meteor=false; gravity=false; cheese=false;
	run_int=0;
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.removeCheese(name)
	end
	tfm.exec.setWorldGravity(0,10)
end
function eventChatCommand(name,command)
	if command == "help" then
		showMessage(text.help,name)
	end
end
function eventNewPlayer(name)
	showMessage(text.enter,name)
	ui.setMapName(text.mapname)
	newData={
		["x"]=0; ["a"]=0; ["enabled"]=false; }
	data[name]=newData;
	showImages(name)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventPlayerDied(name)
	data[name].enabled=false
	if changed == true then
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		showMessage(text.nowinners)
		tfm.exec.setGameTime(15)
		endgame=true; running=false;
		tfm.exec.newGame(xml2,false)
	end
	end
end
function eventNewGame()
	ui.setBackgroundColor("#000000")
	if changed == true then
		resetEvents()
		running=false; map_count=map_count+1; run_int=0; pass_int=0; event_int=0; endgame=false;
		tfm.exec.setGameTime(226)
		for i=0,1 do
			tfm.exec.addPhysicObject(i, 180+(i*5680), 10475, ground)
		end
		for name,player in next,tfm.get.room.playerList do
			data[name].a=0;
			data[name].enabled=true;
			showImages(name)
			ui.setMapName(text.mapname)
		end
		showMessage(text.newgame)
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventLoop(passado,faltando)
	pass_int=pass_int+1
	falt_int=math.floor(faltando/500)
	if changed == true then
	if pass_int == 14 then
		showMessage(text.getready)
	elseif pass_int == 28 then
		showMessage("<BL><b>3...</b>")
	elseif pass_int == 30 then
		showMessage("<BL><b>2...</b>")
	elseif pass_int == 32 then
		showMessage("<BL><b>1...</b>")
	elseif pass_int == 34 then
		showMessage(text.start)
		for i=0,1 do
			tfm.exec.removePhysicObject(i)
		end	
		running=true
	end
	if running == true then
		run_int=run_int+0.5
		if run_int == 28 and falt_int >= 48 then
			event_selected=math.random(1,4)
			if event_selected == 2 then
				event_int=power_d.p2[math.random(#power_d.p2)]
			elseif event_selected == 3 then
				event_int=power_d.p3[math.random(#power_d.p3)]
			else
				event_int=math.random(12,24)
			end
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			end
		end
		if run_int == 33 and falt_int >= 48 then
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event4.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event4.."")
			end
			if event_selected == 1 then
				wind=true
			elseif event_selected == 2 then
				meteor=true
			elseif event_selected == 3 then
				gravity=true
			elseif event_selected == 4 then
				cheese=true
			end
		end
		if falt_int == 20 and endgame == false then
			showMessage(text.t10secs)
		end
		if falt_int == 0 and endgame == false then
			vencedor = defineVencedor()
			for name,player in next,tfm.get.room.playerList do
				if not name == vencedor then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.giveCheese(name)
					tfm.exec.playerVictory(name)
					tfm.exec.setPlayerScore(name,data[name].a,true)
					showMessage("<VP><V><b>"..vencedor.."</b> <VP>"..text.winner.."<br><N>"..text.scaled.."<V>"..math.floor(math.pow((tfm.get.room.playerList[vencedor].y/-1+10565)/100,2.2)).." <N>"..text.recognized.."")
					tfm.exec.setGameTime(15)
					falt_int=15
					endgame=true
				end
			end
		end
		if falt_int <= 1 and endgame == true then
			tfm.exec.newGame(xml2,false)
		end
		if wind == true or meteor == true or gravity == true or cheese == true then
			event_int=event_int-0.5
			if event_int == 0 then
				resetEvents()
				if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
					showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event5.."")
				else
					showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event5.."")
				end
				event_selected=0;
			end
		end
	end
	for name,player in next,tfm.get.room.playerList do
		if data[name].enabled == true then
		if running == true then
			data[name].x=math.floor(math.pow((tfm.get.room.playerList[name].y/-1+10565)/100,2.2))
			if data[name].x >= 1000 and data[name].a == 0 then
				data[name].a=1
			end
			if data[name].x >= 2000 and data[name].a == 1 then
				showMessage(text.reached2,name)
				data[name].a=2
			end
			if data[name].x >= 5000 and data[name].a == 2 then
				showMessage(text.reached3,name)
				data[name].a=3
			end
			if data[name].x >= 10000 and data[name].a == 3 then
				showMessage(text.reached4,name)
				data[name].a=4
			end
			if data[name].x >= 20000 and data[name].a == 4 then
				showMessage(text.reached5,name)
				data[name].a=5
			end
			if data[name].x >= 24321 and data[name].a == 5 then
				showMessage(text.reached6,name)
				data[name].a=10
				for n,player in next,tfm.get.room.playerList do
					if not name == n then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
						tfm.exec.setPlayerScore(name,data[name].a,true)
						showMessage("<b>"..name.."</b>"..text.reached7.."")
						tfm.exec.setGameTime(15)
						falt_int=15
						endgame=true
						data[name].enabled=false
					end
				end
			end
		end
		end
		if wind == true then
			for i=1,18 do
				x=math.random(2800,3200)
				y=math.random(2000,10000)
				tfm.exec.explosion(x, y, -8, 100, true)
				tfm.exec.displayParticle(math.random(26,27), x, y, 1, 1, 1, 1)
			end
		end
		if meteor == true then
			loop=loop+1
			if loop == 4 then
				for i=1,2 do
					x=math.random(2700,3300)
					tfm.exec.addShamanObject(85, x, 0, 0, 0, 0, false)
				end
				loop=0
			end
		end
		if gravity == true then
			loop=loop+1
			if loop == 4 then
				tfm.exec.setWorldGravity(0,math.random(10,15))
				loop=0
			end
		end
		if cheese == true then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(name)
			end
		end
	end
	else
		if faltando <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
tfm.exec.newGame(map)
