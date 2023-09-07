-- Script do module Jogo da Forca, versão RTM 1206.004, desenvolvido por Xayah_raster#7598.

for _,f in next,{"AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AllShamanSkills"} do
	tfm.exec["disable"..f](true)
end

tempo_def=90

letras={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
letters={}; letters_d={}; selec={}; palavra=""; modo="aguardar"; acctd=0; acctf=0; erros=0; accerted="";

function resetWord()
	letters={}; letters_d={}; accerted=""; acctd=0; acctf=0; erros=0; selec={}; palavra="";
	ui.removeTextArea(6150,nil)
	for i=1000,1052 do
		ui.removeTextArea(i,nil)
	end
end

function resetAll()
	ui.removeTextArea(3400,nil)
	resetWord()
	tfm.exec.newGame("@7894699")
end

function eventChatMessage(n,m)
	if tfm.get.room.playerList[n].isShaman and string.len(palavra) >= 2 then 
		tfm.exec.setGameTime(5)
		modo="reset"
		showMessage("<R>O shaman digitou no chat. Rodada cancelada. Próxima rodada em 5 segundos.",nil)
		palavra=""
	end
end

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

resetAll()

function stripChars(str)
	local tableAccents = {}
	for _,a in next,{"à","á","â","ã","ä","À","Á","Â","Ã","Ä"} do
		tableAccents[a] = "a"
	end
	for _,e in next,{"è","é","ê","ë","É","È","Ê","Ë"} do
		tableAccents[e] = "e"
	end
	for _,i in next,{"ì","í","î","ï","Í","Ì","Î","Ï"} do
		tableAccents[i] = "i"
	end
	for _,o in next,{"ò","ó","ô","ö","Ó","Ò","Ô","Ö"} do
		tableAccents[o] = "o"
	end
	for _,u in next,{"ù","ú","û","ü","Ù","Ú","Ü","Û"} do
		tableAccents[u] = "u"
	end
	for _,y in next,{"ý","ÿ","Ý"} do
		tableAccents[y] = "y"
	end
	for _,n in next,{"1","2","3","4","5","6","7","8","9","0"} do
		tableAccents[n] = ""
	end
	for _,c in next,{"!","@","#","$","%","&","¨","*","(",")","_","+","´","[","~","]",",",".",";","/","?",":",">","<","}","^","{","`","¹","²","³","£","¢","¬"} do
		tableAccents[c] = ""
	end
	tableAccents["ç"] = "c"
	tableAccents["ñ"] = "n"
	tableAccents["Ç"] = "c"
	tableAccents["Ñ"] = "n"
	local normalizedString = ''
	for strChar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if tableAccents[strChar] ~= nil then
			normalizedString = normalizedString..tableAccents[strChar]
			else
				normalizedString = normalizedString..strChar
			end
		end
	return normalizedString
end

function displayLetters()
	tt=""
	for i=1,rawlen(letters_d) do
		tt=tt.." "..letters_d[i]
	end
	ui.addTextArea(6150,"<font size='32'><p align='center'><J><b>"..tt.."</b>",nil,250,135,550,55,0x0,0x0,0.95,true)
end

function updateLetters()
	for i=1,rawlen(letras) do
		ui.addTextArea(1000+i,"<p align='center'><font size='13'><font color='#252525'>"..letras[i].."",nil,230+((i-1)*22),110,16,20,0,0,1,true)
	end
	for i=1,rawlen(selec) do
		ui.addTextArea(1000+selec[i],"<p align='center'><font size='13'><VP>"..letras[selec[i]].."",nil,230+((selec[i]-1)*22),110,16,20,0,0,1.0,true)
	end
	displayLetters()
end

function eventChatCommand(name,message)
	if not tfm.get.room.playerList[name].isShaman and modo == "jogo" then
		if string.len(message) == 1 then
			acctf=0
			for i=1,rawlen(letras) do
				if string.upper(message) == letras[i] then
					table.insert(selec,i)
				end
			end
			for i=1,rawlen(letters) do
				if string.upper(message) == letters[i] then
					letters_d[i]=letters[i]
					tfm.exec.setPlayerScore(name,1,true)
					acctd=acctd+1
					acctf=acctf+1
				end
			end
			if acctf == 0 then
				tfm.exec.setPlayerScore(name,-1,true)
				erros=erros+1
				forcaShow()
			end
			if acctd == rawlen(letters) then
				showMessage("<VP>A palavra foi encontrada!")
				tfm.exec.setGameTime(7)
				modo="reset"
			end
			updateLetters()
		else
			if string.lower(stripChars(message)) == string.lower(stripChars(palavra)) then
				for i=1,rawlen(letters) do
					letters_d[i]=letters[i]
					tfm.exec.setPlayerScore(name,888*string.len(palavra),true)
					palavra=""
				end
				tfm.exec.setGameTime(7)
				modo="reset"
				showMessage("<VP>"..name.." acertou a resposta!")
			end
		end
		updateLetters()
	end
end

function eventNewGame()
	resetWord()
	modo="aguardar"
	ui.setMapName("<N>Jogo da Forca <J><b>RTM 1206.004</b> <N>- Script criado por <ROSE>Xayah_raster#7598<")
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
			showMessage("<N>Pressione o botão abaixo para escolher uma palavra.<br><br><J><b>NÃO ESQUEÇA DE SE MOVER, OU MORRERÁ DE AFK!</b>",name)
			ui.addTextArea(150,"<a href='event:def'><p align='center'>Escolher uma palavra",name,300,280,490,19,0x424242,0x989898,1.0,true)
		end
	end
	tfm.exec.setGameTime(32)
end

function eventNewPlayer(name)
	ui.setMapName("<N>Jogo da Forca <J><b>RTM 1206.004</b> <N>- Script criado por <ROSE>Xayah_raster#7598<")
	tfm.exec.setPlayerScore(name,0,false)
	showMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Jogo da Forca!</b><br>O objetivo deste module é: Tentar descobrir a palavra definida pelo shaman errando o mínimo possível!<br><VP>Digite ! e uma letra do alfabeto para chutar.<br><br><J><b>Script desenvolvido por Xayah_raster#7598</b><br><br><ROSE>Versão RTM 1206.004<br><br><p align='left'>",name)
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

function eventTextAreaCallback(id,name,callback)
	if callback == "def" then
		ui.addPopup(1,2,"Digite a palavra: ",name,350,175,200,true)
	end
end

function eventPlayerDied(name)
	if tfm.get.room.playerList[name].isShaman then
		tfm.exec.setGameTime(7)
		ui.removeTextArea(150,nil)
		tfm.exec.setPlayerScore(name,-1,false)
		showMessage("<R>O shaman saiu da sala ou está ausente. Iniciando nova rodada...")
		resetWord()
		modo="reset"
	end
end

function forcaShow()
	local pendu = ""
	if erros==1 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==2 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==3 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==4 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==5 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."    ║<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==6 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ <br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯  <br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==7 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ ╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯   <font size='16'>╰<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
	elseif erros==8 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ ╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯   <font size='16'>╰<br />"
		pendu = pendu.."<font size='8'> <font size='16'>══╩═════ <R>/////\\\\\\\\\\"
	elseif erros==9 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ ╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   <R>///\\\\\\\<br />"
		pendu = pendu.."<font size='8'> <font size='16'><N>══╩═════ <R>/////\\\\\\\\\\"
	elseif erros==10 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      ⃝<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'><R><b>――――――</b><N>|<R><b>――――――</b><N><br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ ╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   <R>///\\\\\\\<br />"
		pendu = pendu.."<font size='8'> <font size='16'><N>══╩═════ <R>/////\\\\\\\\\\"
	elseif erros==11 then
		pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
		pendu = pendu.."    ║        <font size='3'> <font size='16'>      ║<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>    (X_X)<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'><R><b>――――――</b><N>|<R><b>――――――</b><N><br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭|╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   ╯ |<font size='16'> ╰<br />"
		pendu = pendu.."    ║        <font size='3'>   <font size='16'>      |<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>    ╭ ╮<br />"
		pendu = pendu.."    ║        <font size='3'>    <font size='16'>   <R>///\\\\\\\<br />"
		pendu = pendu.."<font size='8'> <font size='16'><N>══╩═════ <R>/////\\\\\\\\\\"
		palavra=""
		tfm.exec.setGameTime(10)
		showMessage("<R>Vocês erraram demais e mataram o boneco!<br>Iniciando nova rodada...")
		modo="reset"
	end
	ui.addTextArea(3400, pendu, nil, 10, 105, 258, 198, 0, 0, 1)
end

function eventPopupAnswer(id,name,answer)
	if id == 1 and tfm.get.room.playerList[name].isShaman and tfm.get.room.playerList[name].isDead == false then
		if string.len(answer) >= 3 and string.len(answer) <= 15 then
			palavra=answer
			local palavra_norm=stripChars(palavra)
			for i=1,string.len(palavra_norm) do
				table.insert(letters,string.upper(string.sub(palavra_norm,i,i)))
			end
			palavra=palavra_norm
			for i=1,rawlen(letters) do
				if letters[i] == " " then
					table.insert(letters_d," ")
				else
					table.insert(letters_d,"_")
				end
			end
			displayLetters()
			modo="jogo"
			showMessage("<VP>Palavra escolhida: <b>"..palavra.."</b><br>",name)
			showMessage("<J>Palavra definida! Para chutar uma letra, digite ! e uma letra. Para chutar a palvra, digite ! e a palavra desejada.")
			tfm.exec.setGameTime(tempo_def)
			ui.removeTextArea(150,nil)
		end
		updateLetters()
	end
end

function eventLoop(passed,remain)
	if remain < 1 then
		if modo == "reset" then
			resetWord()
			resetAll()
		end
		if modo == "aguardar" then
			tfm.exec.setGameTime(7)
			showMessage("<R>Tempo esgotado! Iniciando nova rodada...")
			modo="reset"
		end
	end
end
