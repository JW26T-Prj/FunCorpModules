-- Script de Jogo da Forca, versão 2.1, atualizado por Skyrectarrow#0000.
-- FunCorp, se o jogo começar a sortear muita gente off ou fora da sala, digite !reset para reiniciar o script.
admin = "Skyrectarrow#0000" -- insira seu nome!
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoTimeLeft(true)
system.disableChatCommandDisplay("skip")
system.disableChatCommandDisplay("reset")
chars = {}
lang = {}
lang.br = {
  ask_word = "<font face='Verdana'><font size='12'>Escolha uma palavra",
  choose_word = "<font face='Verdana'><font size='12'>Escolha a sua palavra:<br>MÁXIMO 15 LETRAS!",
  more_players = "<font face='Verdana'><font size='12'>Deve ter no mínimo <font color='#FF0000'>2</font> jogadores para brincar de forca.",
  next_turn_1 = "<font face='Verdana'><font size='12'>Próximo turno em ",
  next_turn_2 = "<font face='Verdana'><font size='12'> segundos",
  turn_of_1 = "<font face='Verdana'><font size='12'>É a vez de ",
  turn_of_2 = "<font face='Verdana'><font size='12'> | ",
  turn_of_3 = "<font face='Verdana'><font size='12'>O script será reiniciado para poder obter novamente os jogadores presentes na sala.",
  patientez = "<font face='Verdana'><font size='12'> Aguarde o líder escolher a palavra...",
  word_found = "<font face='Verdana'><font size='12'>A palavra foi encontrada!",
  word_not_found = "<font face='Verdana'><font size='12'>Mataram o boneco! A palavra era ",
  time_out = "<font face='Verdana'><font size='12'>Acabou o tempo! ",
  pass_turn = "<font face='Verdana'><font size='12'>Pergunta anulada. ",
  quit = "<font face='Verdana'><font size='12'>O mestre do jogo saiu."
}
text = lang.br
players = {}
master = ""
letters = {}
invertLetters = {}
word = ""
hasDefinedWord = false
timer = 0
bestPlayer = ""
pendu_level = 0
beginReset = false
hasToReset = false
resetTimer = 0
resetModule = false
isTimeOut = false
hasWon = false
hasLost = false
hasSkipped = false
hasQuit = false
lettersEntered = {}
id = {}
id["ask_word_main"] = 1
id["ask_word_button"] = 2
id["ask_word_popup"] = 3
id["pendu"] = 4
id["reset_timer"] = 5
id["reset_timer_label"] = 6
id["turn"] = 7
id["turn_label"] = 8
id["one_player"] = 9
id["one_player_label"] = 10

function eventNewGame()
  ui.setMapName("Jogo da Forca 2.1")
  updatePlayersList()
  ui.removeTextArea(id["one_player"])
  ui.removeTextArea(id["one_player_label"])
  letters = {}
  invertLetters = {}
  word = ""
  hasDefinedWord = false
  timer = 0
  if getNbPlayers() > 1 then
    master = randomPlayer()
    tfm.exec.movePlayer(master, 400, 90, false, 0, 0, false)
    askWord()
    drawPendu()
  else
    removeAll()
    ui.addTextArea(id["one_player"], "", nil, 5, 118, 800, 48, 0, 0, 1f)
    ui.addTextArea(id["one_player_label"], "<p align='center'><BL><font color='#000000'>"..text.more_players.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f)
    drawWord()
    drawPendu()
  end
end

function eventPlayerDied(playerName)
  tfm.exec.respawnPlayer(playerName)
end

function eventNewPlayer(playerName)
  table.insert(players, playerName)
  ui.setMapName("Jogo da Forca 2.1")
  if getNbPlayers() == 2 then
    tfm.exec.newGame('@7849298')
  else
    tfm.exec.respawnPlayer(playerName)
    drawWord()
    drawPendu()
  end
end

function eventPlayerLeft(playerName)
  local toRemove = 0
  for i,p in pairs(players) do
    if p==playerName then
      toRemove = i
    end
  end
  table.remove(players, toRemove)
  if getNbPlayers() == 1 then
    tfm.exec.newGame("@7849298")
  else
    if playerName==master then
      hasQuit = true
      reset()
    end
  end
end

function eventLoop(currentTime, timeRemaining)
	if timeRemaining < 1 then
		isTimeOut = true
   		 reset()
	end
  timer = timer + 0.5
  if beginReset then
    ui.removeTextArea(id["ask_word_main"])
    ui.removeTextArea(id["ask_word_button"])
    resetTimer = resetTimer + 0.5
    ui.addTextArea(id["reset_timer"], "", nil, 5, 118, 800, 48, 0, 0, 1f)
    if isTimeOut then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.time_out.." <font color='#000000'>"..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
		if ResetModule then ui.addTextArea(id["reset_timer_label"],"<p align='center'><font color='#000000'>O script será reiniciado para a reobtenção dos jogadores presentes na sala.</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
    if hasWon then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.word_found.." <font color='#000000'>"..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
    if hasLost then ui.addTextArea(id["reset_timer_label"], "<p align='center'><font color='#000000'>"..text.word_not_found.."</font><BL>"..word:gsub("^%l", string.upper).."<font color='#000000'> ! "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
    if hasSkiped then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.pass_turn.."<font color='#000000'> "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
    if hasQuit then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.quit.."<font color='#000000'> "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 5, 118, 800, 48, 0, 0, 1f) end
  end
  checkBestPlayer()
  if timer==25 and not hasDefinedWord and getNbPlayers() > 1 then
    isTimeOut = true
    reset()
  end
  if resetTimer==7 then
    isTimeOut = false
    hasWon = false
    hasLost = false
    hasSkiped = false
    hasQuit = false
		if resetModule == true then
			tfm.exec.newGame('@7849298')
			resetModule = false
		end
    hasToReset = true
    reset()
  end
end

function eventChatCommand(playerName, message)
  local args = {}
  for arg in message:gmatch("[^%s]+") do
    table.insert(args, arg:lower())
  end
  if not hasLost and not hasSkiped and not hasQuit and args[1] ~= nil then
    if args[1]==word and playerName ~= master and not hasWon then
      local score = 0
      for _,letter in pairs(letters) do
        if letter=="_" then score = score + 872 end
      end
      tfm.exec.setPlayerScore(playerName, score, true)
      local i = 1
      while i <= word:len() do
        if letters[i]~="_" then
          invertLetters[i] = letters[i]
          letters[i] = "_"
        end
        i = i + 1
      end
      drawWord()
      hasWon = true
      reset()
    end
    if message == "skip" and playerName==admin and not hasWon and not hasLost and not isTimeOut then
      hasSkiped = true
      reset()
	  tfm.exec.chatMessage("<R>Esta palavra foi anulada: "..word.."",nil)
    end
	if message == "rodar" and playerName==admin then
		tfm.exec.newGame('@7849298')
	end
	if message == "reset" and playerName==admin then
		tfm.exec.chatMessage("<VP>O script será reiniciado para a obtenção dos jogadores.",nil)
		beginReset = true
		resetModule = true
	end
    if args[1]:len()==1 and hasDefinedWord and args[1]~= "_" and args[1]~="-" and args[1]~="'" and playerName ~= master then
      local isEntered = false
      for _,letter in pairs(lettersEntered) do
        if letter==args[1] then
          isEntered = true
        end
      end
      if not isEntered then
        local score = 0
        local idsToRemove = {}
        local isFalse = true
        table.insert(lettersEntered, args[1])
        for id,letter in pairs(letters) do
          if letter==args[1] then
            table.insert(idsToRemove, id)
            isFalse = false
          end
        end
        for _,idToRemove in pairs(idsToRemove) do
          invertLetters[idToRemove] = letters[idToRemove]
          letters[idToRemove] = "_"
        end
		str="Letras chutadas: "
		for _,i in next,lettersEntered do
			str=str..i..", "
		end
		ui.addTextArea(id["turn_label"], str, p, 225, 245, 800, 30, 0xC0C0C0, 0xC0C0C0, 0f)
        score = #idsToRemove
        if isFalse then
          if tfm.get.room.playerList[playerName].score > 0 then score = -1 end
          pendu_level = pendu_level + 1
        end
        tfm.exec.setPlayerScore(playerName, score, true)
        drawWord()
        drawPendu()
      end
    end
  end
end

function eventTextAreaCallback(textAreaId, playerName, callback)
  if callback=="callbackAskWord" then
    ui.addPopup(id["ask_word_popup"], 2, text.choose_word, master, 300, 175, 200)
  end
end

function eventPopupAnswer(popupId, playerName, answer)
  if popupId==id["ask_word_popup"] and not isTimeOut and master==playerName then
    local choosedWord = tostring(answer)
    if checkWord(choosedWord) then
      defineWord(choosedWord)
      hasDefinedWord = true
      askWord()
      tfm.exec.setGameTime(60)
	  tfm.exec.chatMessage("<N>A palavra é: "..word.."","D571#0000")
	  tfm.exec.chatMessage("<N>A palavra é: "..word.."","Forzaldenon#0000")
      ui.removeTextArea(id["turn"])
      ui.removeTextArea(id["turn_label"])
    end
  end
end

function askWord()
  removeAll()
  ui.removeTextArea(id["reset_timer"])
  ui.removeTextArea(id["reset_timer_label"])
  ui.removeTextArea(id["ask_word_main"])
  ui.removeTextArea(id["ask_word_button"])
  if not hasDefinedWord then
    ui.addTextArea(id["ask_word_main"], "", master, 5, 118, 800, 48, 0, 0, 1f)
    ui.addTextArea(id["ask_word_button"], "<p align='center'><a href='event:callbackAskWord'>"..text.ask_word.."</a></p>", master, 300, 120, 190, 20, 0x595959, 0x595959, 1f)
    tfm.exec.chatMessage("<ROSE>Clique em 'Escolha uma palavra' para escolher uma palavra.<br>Não serão permitidas palavras completamente desconhecidas, com números e etc.<br>Você possui 25 segundos para escolher uma palavra, caso contrário sua vez será cancelada e outro entrará em seu lugar.",master)
    for p,_ in pairs(tfm.get.room.playerList) do
      if p~=master then
        ui.addTextArea(id["turn"], "", p, 5, 118, 800, 48, 0, 0, 1f)
        ui.addTextArea(id["turn_label"], "<p align='center'><font color='#000000'>"..text.turn_of_1.."</font><BL>"..master.."<font color='#000000'>"..text.turn_of_2..text.patientez.."</font></p>", p, 25, 115, 800, 30, 0xC0C0C0, 0xC0C0C0, 0f)
      end
    end
  end
end

function defineWord(new_word)
  word = string.lower(string.gsub(new_word, " ", "-"))
  letters = {}
  local i = 36
  while i < 54 do
    ui.removeTextArea(i)
    i = i + 1
  end
  for letter in new_word:gmatch"." do
    if letter==" " or letter=="-" then
      table.insert(invertLetters, "-")
      table.insert(letters, "_")
    elseif letter=="'" then
      table.insert(invertLetters, "'")
      table.insert(letters, "_")
    else
      table.insert(letters, letter:lower())
      table.insert(invertLetters, "_")
    end
  end
  drawWord()
  drawPendu()
end

function drawWord()
  local textId = 36
  local i = 1
  local ancreX = 210
  if #word==0 then
    local i = 36
    while i < 54 do
      ui.removeTextArea(i)
      i = i + 1
    end
  else
    while i <= word:len() do
      ui.addTextArea(textId, "<font face='Verdana'><p align='center'><font size='28' color='#000000'>"..invertLetters[i]:upper().."</font></p>", nil, ancreX, 180, 30, 40, 0xf1f1f1, 0xf1f1f1, 1f)
      ancreX = ancreX + 40
      textId = textId + 1
      i = i + 1
    end
    local finished = true
    local j = 1
    while j <= word:len() do
      if invertLetters[j]=="_" then finished = false end
      j = j + 1
    end
    if finished then
      hasWon = true
      reset()
    end
  end
end

function drawPendu()
  local pendu = ""
  if pendu_level==1 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==2 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==3 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==4 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==5 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==6 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==7 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==8 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯  <font size='3'> <font size='16'> ╰ <br />"
    pendu = pendu.."    ║<br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════"
  elseif pendu_level==9 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║          <font size='4'> <font size='16'>    │<br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯  <font size='3'> <font size='16'> ╰ <br />"
    pendu = pendu.."    ║        <R>///////\\\\\\\\\\\\\\<N><br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════   <R>///\\\\\\"
  elseif pendu_level==10 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>    ⃝<br />"
    pendu = pendu.."    ║    <font size='14'> <font size='16'>    <R>┅┅┅<N>│<R>┅┅┅<N><br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯  <font size='3'> <font size='16'> ╰ <br />"
    pendu = pendu.."    ║        <R>///////\\\\\\\\\\\\\\<N><br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════   <R>///\\\\\\"
  elseif pendu_level==11 then
    pendu = pendu.."<font size='16'><font face='Consolas'>    ╔════════╗<br />"
    pendu = pendu.."    ║     <font size='3'> <font size='16'>         ║<br />"
    pendu = pendu.."    ║          <font size='9'> <font size='16'>  (x_x)<br />"
    pendu = pendu.."    ║    <font size='14'> <font size='16'>    <R>┅┅┅<N>│<R>┅┅┅<N><br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯<font size='13'> <font size='16'>│ ╰ <br />"
    pendu = pendu.."    ║         <font size='8'> <font size='16'>   ╭│╮<br />"
    pendu = pendu.."    ║        <font size='11'> <font size='16'>   ╯  <font size='3'> <font size='16'> ╰ <br />"
    pendu = pendu.."    ║        <R>///////\\\\\\\\\\\\\\<N><br />"
    pendu = pendu.."<font size='8'> <font size='16'>══╩═════   <R>///\\\\\\"
    hasLost = true
    reset()
  end
  ui.addTextArea(id["pendu"], pendu, nil, 1, 205, 303, 238, 0, 0, 1)
end

function reset()
  beginReset = true
  if hasToReset then
	tfm.exec.setGameTime(30)
    if getNbPlayers() < 2 then
      tfm.exec.newGame('@7849298')
    else
      letters = {}
      invertLetters = {}
      word = ""
      hasDefinedWord = false
      pendu_level = 0
      beginReset = false
      hasToReset = false
      resetTimer = 0
      lettersEntered = {}
      drawWord()
      drawPendu()
      local randX = math.random(750)
      tfm.exec.movePlayer(master, randX, 50, false, 0, 0, false)
      local oldMaster = master
      if getNbPlayers()~=1 then
        if bestPlayer==oldMaster then
          while master==oldMaster do
            master = randomPlayer()
          end
        else
          master = bestPlayer
        end
      else
        master = bestPlayer
      end
      tfm.exec.movePlayer(master, math.random(350,750), 366, false, 0, 0, false)
      tfm.exec.setPlayerScore(master, 0, false)
      timer = 0
      askWord()
    end
  end
end

function removeAll()
  ui.removeTextArea(id["ask_word_main"])
  ui.removeTextArea(id["ask_word_button"])
  ui.removeTextArea(id["ask_word_popup"])
  ui.removeTextArea(id["pendu"])
  ui.removeTextArea(id["reset_timer"])
  ui.removeTextArea(id["reset_timer_label"])
  ui.removeTextArea(id["turn"])
  ui.removeTextArea(id["turn_label"])
  ui.removeTextArea(id["one_player"])
  ui.removeTextArea(id["one_player_label"])
end

function checkWord(word_arg)
  if word_arg:len() >= 2 and word_arg:len() <= 15 then
    for _,c in pairs(chars) do
      if string.match(word_arg, c) then
        return false
      end
    end
    return true
  else
    return false
  end
end

function checkBestPlayer()
  topScore = 0
  bestPlayer = randomPlayer()
  for name,player in pairs(tfm.get.room.playerList) do
    if player.score >= topScore then
      topScore = player.score
      bestPlayer = name
    end
  end
end

function getNbPlayers()
  return #players
end

function updatePlayersList()
  players = {}
  for p,_ in pairs(tfm.get.room.playerList) do
    table.insert(players, p)
  end
end

function randomPlayer()
  return players[math.random(1,#players)]
end

for name,player in pairs(tfm.get.room.playerList) do
  tfm.exec.setPlayerScore(name, 0, false)
end

updatePlayersList()
bestPlayer = randomPlayer()
tfm.exec.newGame('@7849298')
