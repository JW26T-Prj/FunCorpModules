-- Transformice #anvilwar module loader - Version 2.122
-- By Spectra_phantom#6089 / Nasus_assassin#1534
-- Included sub-modules: #mestre, #truefalse, #fall2, #cd.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.122",
	_MAINV = "24265.166",
	_DEVELOPER = "Spectra_phantom#6089" }

initAnvilwar = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
powerups={choosed="",r_azul=false,r_vermelho=false,multi_count=0,int_azul=2,int_vermelho=2,immortal=false,immortal2=false,double=false,triple=false,objeto=false,explosion=false,sequence=false,giant1=false,giant2=false}
objetos={1,2,3,4,6,7,10,23,32,34,35,39,45,46,54,60,61,62,65,67,68,69,89,90,95}
play_azul={}
players_table={}
caps={azul="",vermelho=""}
play_vermelho={}
banned_list={}
mods_list={"Marichamex#0000","Ddniemo#0000","Gmctf#0000","Dan#1407","Potinho1234#0000","Liviliviah#0000","Nasus_assassin#1534"}
managers_list={"Shun_kazami#7014","Fosfus7heads#0000"}
admins_list={"Spectra_phantom#6089","Reksai_void2600#6638"}
ninjas_list={"Forzaldenon#0000"}
scoreloop=0
sudden_death=false
local temp_name=""; local temp_name2=""; local temp_name3="";
actual_player=""; count_int=20; tempo=0; players=0; time_limit=10; team=1; kills=0;
data={}
ratos=0; loop=12; power=5; valendo=false; anvil_launched=false; set=false; object=10; set_name=""; reset=false; intervalo=false;
count=0
count_azul=0
count_vermelho=0
for _,f in next,{"help","powerups","set","tc","p","score","kill","tt","rv","cap","cmd","ban","unban","rodar","pw","TC","run","pt","ranking"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v2)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","","","","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas #1"}
lang = {}
lang.br = {
	win_vermelho = "<R><b>GG Time Vermelho!</b><br>A próxima partida será iniciada em 15 segundos.",
	win_azul = "<BL><b>GG Time Azul!</b><br>A próxima partida será iniciada em 15 segundos.",
	sudden_death = "<VP><b>Morte Súbita!</b><br>A equipe que conseguir eliminar qualquer um adversário será declarada a vencedora.",
	empate_text = "<J><b>Houve um empate!</b><br>A próxima partida será iniciada em 15 segundos.",
	instructions = "Use as teclas de 1 a 9 para alterar a potência da bigorna e barra de espaço para atirar. Para ajuda digite !help.",
	timeout = "<J>Tempo esgotado! O atirador será alterado.",
	enter_vermelho = "Entrar",
	enter_azul = "Entrar",
	exit = "Sair do time",
	inv3 = "Sua habilidade Modo Imortal expirou.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar <b>quando for a sua vez</b> e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br>Os turnos dos atiradores serão definidos aleatoriamente.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Reksai_void2600#6638<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) e Star#6725 (TR)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!",
	seconds30 = "<ROSE>Faltam 30 segundos!<br><br>Não é mais permitido reviver jogadores nos 30 segundos finais.",
	seconds10 = "<ROSE>Faltam 10 segundos!",
	teamchat = "<J>Você pode usar o comando !tc [mensagem] para falar apenas com o seu time.<br><br>Você pode ver seu perfil no jogo digitando !p e o ranking temporário digitando !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:profile'>Perfil</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitão</a><br><a href='event:cmd'>Comandos</a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Lista de Poderes",
	profile = "Use o comando !p para ver o seu perfil. Use !p [nome] para ver o perfil de outra pessoa.",
	starting = "<VP>A partida está prestes a começar. Preparem-se!",
	suicide = "O seguinte jogador cometeu suicídio: ",
	ban = " foi banido da sala #anvilwar por ",
	unban = " teve seu banimento removido da sala.",
	caps = " foi escolhido para ser o capitão da equipe.",
	cap = "Este tipo de jogador (escolhido aleatoriamente) receberá 50% a mais de pontuação que os outros e poderá transferir seus pontos para outro jogador de sua equipe usando o comando !tt [nome].<br>Ele também poderá utilizar o comando !rv [nome] para reviver UM membro morto de sua equipe e também podem usar o comando !pt [nome] para passar sua vez para outro jogador de sua equipe.",
	cap_text = "<br><VP>Você é o capitão da sua equipe.<br>Digite !cap para saber das funções dos capitães das equipes.",
	score30 = "<R>Você precisa de 30 pontos para usar isto.",
	advanced = " acaba de avançar para o nível ",
	tag_text = "<J>Não se esqueça de colocar a #tag no final do nome desejado! Caso contrário, o comando não irá funcionar!",
	revivetext = "<J>O seguinte jogador reviveu: ",
	yturn = "É a vez de: ",
	level_error = "<R>Você não possível nível suficiente para usar isto.",
	funct = "Função não permitida. (Você colocou a #tag no nome?)",
	cmds = "Comandos do Jogo",
	commands = "• !help = Exibe as instruções de como jogar.<br>• !p [jogador] = Exibe o perfil do jogador escolhido. Digite !p sem argumentos para ver o seu perfil.<br>• !tc [mensagem] = Fala apenas com os jogadores do seu time.<br><ROSE>* <N>!rv [jogador] = Revive um jogador morto de sua equipe.<br><ROSE>* <N>!pt [jogador] = Passa sua vez para alguém de sua equipe.<br><ROSE>* <N>!tt [jogador] = Transfere seus pontos para outro jogador<br><br>Os comandos marcados com <ROSE>* <N>são de uso exclusivo do capitão da equipe. Para saber mais sobre isso, digite !cap.",
	playingmap = "Rodando mapa",
	created = "criado por",
	red_int_text = "<R>A equipe vermelha pediu tempo.",
	blue_int_text = "<BL>A equipe azul pediu tempo.",
	double = "acionou o powerup Bigorna Dupla!",
	double2 = "<br>Neste powerup, você atira 2 bigornas de uma vez.",
	triple = "acionou o powerup Bigorna Tripla!",
	triple2 = "<br>Neste powerup, você atira 3 bigornas de uma vez.",
	objeto1 = "acionou o powerup Tiro Aleatório!",
	objeto2 = "<br>Neste powerup, ao pressionar a barra de espaço, você vai atirar um objeto aleatório de shaman. Caso você tenha usado a habilidade Bigorna Dupla, você irá atirar 2 objetos ao invés de um.",
	exp1 = "acionou o powerup Olha a Explosão!",
	exp2 = "<br>Neste powerup, você pode gerar uma explosão clicando em um local do time inimigo.<br>Você possui 5 segundos para explodir!",
	inv1 = "acionou o powerup Modo Imortal!",
	inv2 = "<br>Neste powerup, você ficará imortal durante 4 turnos do seu time. Esta habilidade só pode ser utilizada uma vez por partida.",
	rs1 = "acionou o powerup Reduzir Tamanho!",
	rs2 = "<br>Neste powerup, você reduzirá o tamanho do seu rato até o término da partida.",
	sq1 = "acionou o powerup Sequência de Bigornas!",
	sq2 = "<br>Neste powerup, você vai atirar várias bigornas em sequência.",
	gi1 = "acionou o powerup Transformação Gigante!",
	gi2 = "<br>Neste powerup, durante seu turno de atirar, você aumenta em 50% o tamanho de todos os jogadores do time inimigo. Esta habilidade também anula as habilidades de Reduzir Tamanho utilizadas pelo time inimigo.",
	ar1 = "acionou o powerup Chuva de Bigornas!",
	ar2 = "<br>Neste powerup, você fará cair várias bigornas do céu na área do time inimigo. O uso desta habilidade implicará na perda da sua vez de atirar.",
}
lang.en = {
	win_vermelho = "<R><b>The RED team wins!</b><br>The next match will start in 15 seconds.",
	win_azul = "<BL><b>The BLUE team wins!</b><br>The next match will start in 15 seconds.",
	sudden_death = "<VP><b>SUDDEN DEATH!</b><br>The team that kill anyone of other team will won the match.",
	empate_text = "<J><b>There was a draw!</b><br>The next match will start in 15 seconds.",
	instructions = "Use the 1 to 9 keys to change the intensity of anvil and SPACEBAR to throw a anvil.",
	timeout = "<J>Time is over! The shooter will be changed.",
	enter_vermelho = "Enter",
	enter_azul = "Enter",
	exit = "Leave this team",
	inv3 = "Your immortality has ended.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "When is your turn, press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br>The turns will be sorted randomly.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Reksai_void2600#6638<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!",
	seconds30 = "<ROSE>30 seconds remaining!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>10 seconds remaining!",
	teamchat = "<J>You can use the command !tc [message] to speak with your team.<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a><br><a href='event:profile'>Profile</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitain</a><br><a href='event:cmd'>Commands</a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Powerups List",
	profile = "Use the !p command to view your profile and use !p [username] to view the profile of another user.",
	starting = "<VP>The match will start on a few seconds. Get ready!",
	suicide = "The following player committed suicide: ",
	ban = " was banned of room by ",
	unban = " was unbanned of room.",
	caps = " was choosed to be the team capitain.",
	cap = "This type of player (that is choosed randomly) will receive 50% more points and will get the ability of transfer your points to other players alive on the match using the !tt [name] command. You can use the !rv [name] command to revive ONE team player dead.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>You need 30 points to use this.",
	advanced = " reached the level ",
	tag_text = "<J>Don't forget to insert the #tag on the target nickname, else this command don't will work!",
	revivetext = "<J>The following player has been revived: ",
	yturn = "Actual player: ",
	level_error = "<R>You don't have level to use this. To view your level use the !p command.",
	funct = "Function not allowed",
	cmds = "Game commands",
	commands = "• !help = Show the game help.<br>• !p [player] = Show the profile of selected player. Type !p without arguments to show your profile.<br>• !tc [message] = Chat with other members of your team.<br><ROSE>* <N>!rv [player] = Revive a dead player of your team.<br><ROSE>* <N>!tt [player] = Transfer your points to another team member.<br><ROSE>* <N>!pt [player] = Pass your shooting turn to another player.<br><br>The commands marked with <ROSE>* <N>are of exclusive use of the team capitains. To see more info about this, use the !cap command.",
	playingmap = "Playing map",
	created = "created by",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	double = "used the powerup Double Anvil!",
	double2 = "",
	triple = "used the powerup Triple Anvil!",
	triple2 = "",
	objeto1 = "used the powerup Random Shoot!",
	objeto2 = "<br>On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<br>On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "<br>On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
	gi1 = "used the powerup Giant Transformation!",
	gi2 = "<br>On this powerup, during your shooting turn, you will increase in 50% the size of all mices of enemy team. This powerup also cancels all the mices with the 'Decrease Size' powerup.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
lang.ar = {
	win_vermelho = "<R><b>فاز الفريق الأحمر!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
	win_azul = "<BL><b>فاز الفريق الأزرق!</b><br>ستبدأ المعركة التالية في غضون 15 ثانية!",
	sudden_death = "<VP><b>المعركة النهائية!</b><br>إذا قام أي أحد بقتل عضو في أي فريق أخر، سوف يفوز الفريق الذي قتل!",
	empate_text = "<J><b>تعادل!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
	instructions = "إستخدم مفاتيح لوحة التحكم من 1 الى 9 للتحكم في سرعة وقوة السندان.",
	timeout = "<J>إنتهى الوقت! سيتم تغيير الضارب",
	enter_vermelho = "بالدخول",
	enter_azul = "بالدخول",
	exit = "قم بالخروج من هذا الفريق",
	bomba1 = "إستخدم فرقعة الزمن، إحترس من الإنفجار!",
	bomba2 = "<br>في هذه القوة، سوف يحدث إنفجار في بقعة مختلفة في مكان العدو",
	objeto1 = "إستخدم الضربة العشوائية! قد يقوم بضرب أي شيئ الأن!",
	objeto2 = "<br>في هذه القوة، يمكنك ضرب أداة شامان بدلآ من السندان، إذا قمت بإختيار السندان المزدوج، سيتم ضرب اداتان شامان بدلآ من سندان",
	inv3 = "قوة عدم موتك قد إنتهت، أصبحت قابلآ للموت الأن!.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "قوة الضرب وسرعته",
	your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
	help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Reksai_void2600#6638<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "أوه لا!! ",
	teamKill2 = "قام بقتل عضو من فريقه!",
	ajuda = "المساعدة",
	credits = "Credits",
	mostrar = "أظهر",
	seconds = "<ROSE>60 ثانية متبقية!",
	seconds30 = "<ROSE>30 ثانية متبقية!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>10 ثوانٍ متبقية!",
	teamchat = "<J>إستخم الإيعاز !tc [msg] للتكلم مع أعضاء فريقك<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a> | <a href='event:profile'>Profile</a> | <a href='event:powerups'>Powerups</a> | <a href='event:cap'>Capitain</a> | <a href='event:cmd'>Commands</a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Powerups List",
	profile = "إستخدم !p لرؤية ملفك وأستخدم !p name لرؤية ملف لاعب أخر ",
	starting = "<VP>ستبدأ المباراة غي غضون بضعة ثواني، إستعد!",
	suicide = "قام بالإنتحار ",
	ban = " تم حظره من الغرفة من قبل ",
	unban = " تم فك حظره من الغرفة من قبل",
	caps = " تم إختياره ليصبح قائد الفريق. لرؤية المزيد عن هذا أكتب !cap أو استخدم قسم القائد في القائمة, ",
	cap = "الكابتن هو قائد الفريق، يتم إختياره عشوائيآ، سوف يحصل على نقاط بنسبة 50% أكثر من اللاعبين، اي جَني النقاط بسرعة!يمكنه تحويل النقاط للاعب أخر عن طريق الإيعاز ويمكنه إحياء لاعب مات من فريقه بإستخدام !rv [name] ولكن يتطلب 30 نقطة لذلك",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>تحتاج 30 نقطة للقيام بهذا",
	advanced = " reached the level ",
	tag_text = "<J>لا تنسى بوضع الهاشتاج على الإسم الذي تم إختياره, أو لن يعمل هذا الإيعاز",
	revivetext = "<J>هذا اللاعب قام بإستقبال : ",
	yturn = "اللاعب الحالي: ",
	level_error = "<R>لا تملك المستوى المطلوب لفعل هذا، لترى مستواك إكتب !p",
	funct = "الإيعاز غير مسموح",
	cmds = "إيعازات اللعبة : ",
	commands = "• !help لرؤية المساعدة<br>• !p [player] = لرؤية ملف لاعب، أكتب !p بدون أي شيئ لرؤية ملفك<br>• !tc [message] = المحادثة مع أعضاء فريقك<br><ROSE>* <N>!rv [player] = إحياء لاعب مات من فريقك، تطلب ان تكون القائد ومعك 30 نقطة<br><ROSE>* <N>!tt [player] = تقوم بنقل نقاطك للاعب أخر في الغرفة<br><br>الإيعازات المُعلمة بـ <ROSE>* <N> إيعازات فقط للقائد، لرؤية المزيد أكتب !cap",
	playingmap = "Playing map",
	created = "created by",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	double = "used the powerup Double Anvil!",
	double2 = "",
	triple = "used the powerup Triple Anvil!",
	triple2 = "",
	objeto1 = "استخدم powerup عشوائية تبادل لاطلاق النار!",
	objeto2 = "<ar>على هذا powerup ، سوف تقوم بتصوير كائن شامان عشوائي بدلا من السندان. إذا كنت قد استخدمت Powerup مزدوج السندان ، يمكنك تبادل اثنين من الأشياء بدلا من واحدة.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<ar>على هذا powerup ،عندك 5 ثوان لتسبب انفجارك.",
	inv1 = "تستخدم powerup وضع الخالد!",
	inv2 = "<br> على هذا powerup ، تكون خالدة خلال ال 4 المقبلة. يمكن استخدام هذه الطاقة فقط مرة واحدة لكل لعبة.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
	gi1 = "used the powerup Giant Transformation!",
	gi2 = "<br>On this powerup, during your shooting turn, you will increase in 50% the size of all mices of enemy team. This powerup also cancels all the mices with the 'Decrease Size' powerup.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
lang.es = {
	win_vermelho = "<R><b>¡Ha ganado el equipo ROJO!</b><br>La próxima ronda comenzará en 15 segundos.",
	win_azul = "<BL><b>¡Ha ganado el equipo AZUL!</b><br>La próxima ronda comenzará en 15 segundos.",
	sudden_death = "<VP><b>MUERTE SÚBITA!</b><br>El equipo que mate a alguien del otro equipo ganará esta ronda.",
	empate_text = "<J><b>Hubo un empate!</b><br>La próxima ronda comenzará en 15 segundos.",
	instructions = "Usa las teclas 1 al 9 para cambiar la intensidad del yunque y ESPACIO para lanzarlo.",
	timeout = "<J>El tiempo ha terminado. El tirador será cambiado.",
	enter_vermelho = "Unirse",
	enter_azul = "Unirse",
	exit = "Abandonar este equipo",
	inv3 = "Tu inmortalidad ha terminado.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) y Star#6725 (TR)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!",
	seconds30 = "<ROSE>¡Quedan 30 segundos!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>¡Quedan 10 segundos!",
	teamchat = "<J>Puedes usar el comando !tc [mensaje] para hablar con tu equipo.<br><br>Puedes ver tu perfil escribiendo !p y el ranking temporal escribiendo !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ayuda</a><br><a href='event:profile'>Perfil</a> | <a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitán</a><br><a href='event:cmd'>Comandos</a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Lista de Powerups",
	profile = "Usa el comando !p para ver tu perfil y usa !p [apodo] para ver el de otra persona.",
	starting = "<VP>La ronda comenzará en unos segundos. ¡Prepárate!",
	suicide = "El siguiente jugador cometió suicidio: ",
	ban = " fue baneado de la sala por ",
	unban = " fue desbaneado de la sala.",
	caps = " fue elegido para ser el capitán del equipo. Para ver más información acerca de esto, escribe el comando !cap o usa la sección de Capitán en el menú.",
	cap = "En esta compilación fue incluido la funcionalidad de jugador capitán. Este tipo de jugador (es elegido aleatoriamente) recibirá un 50% más de puntos y la posibilidad de transferir tus puntos a otros jugadores vivos en la ronda usando el comando !tt [apodo]. Puedes usar el comando !rv [apodo] para revivir UN jugador muerto del equipo.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Necesitas 30 puntos para usar esto.",
	advanced = " alcanzado el nivel ",
	tag_text = "<J>No te olvides de colocar el #tag en el apodo del objetivo, o este comando no funcionará.",
	revivetext = "<J>El siguiente jugador ha sido revivido: ",
	yturn = "Jugador actual: ",
	level_error = "<R>No tienes el nivel para usar esto. Para ver tu nivel usa el comando !p.",
	funct = "Función no permitido",
	cmds = "Comandos del juego",
	commands = "• !help = Mostrar la ayuda del juego.<br>• !p [apodo] = Mostrar el perfil de un determinado jugador. Escribe !p solamente para mostrar tu perfil.<br>• !tc [mensaje] = Hablar con otros miembros de tu equipo.<br><ROSE>* <N>!rv [apodo] = Revivir a un jugador muerto de tu equipo.<br><ROSE>* <N>!tt [apodo] = Transferir tus puntos a otro miembro de tu equipo.<br><br>Los comandos marcados con <ROSE>* <N>son de uso exclusivo para capitanes de equipos. Para saber más de esto, usa el comando !cap.",
	playingmap = "Jugando mapa",
	created = "creado por",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	double = "usó el powerup Doble Yunque!",
	double2 = "",
	triple = "usó el powerup Triple Yunque!",
	triple2 = "",
	objeto1 = "usó el de powerup Tiro Aleatorio!",
	objeto2 = "<br>Con este powerup lanzarás un objeto de chamán aleatorio en lugar de un yunque. Si has usado el powerup Doble Yunque puedes lanzar 2 objetos en vez de 1.",
	exp1 = "usó el powerup Explosión!",
	exp2 = "<br>Con este powerup puedes provocar una explosión clicando en área enemigo con tu ratón.<br>Tienes 5 segundos para provocar la explosión.",
	inv1 = "usó el powerup Modo Inmortal!",
	inv2 = "<br>Con este powerup serás inmortal durante los próximos 4 turnos. Solo puedes usarlo 1 vez por ronda.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
	gi1 = "used the powerup Giant Transformation!",
	gi2 = "<br>On this powerup, during your shooting turn, you will increase in 50% the size of all mices of enemy team. This powerup also cancels all the mices with the 'Decrease Size' powerup.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
lang.de = {
	win_vermelho = "<R><b>Das ROTE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	win_azul = "<BL><b>Das BLAUE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	sudden_death = "<VP><b>PLÖTZLICHER TOD!</b><br>Das Team, das jemanden aus einem anderen Team tötet, gewinnt das Spiel.",
	empate_text = "<J><b>Es gab ein Unentschieden!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	instructions = "Verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern und die Leertaste, um einen Amboss zu werfen.",
	timeout = "<J>Die Zeit ist vorbei! Der Schütze wird gewechselt.",
	enter_vermelho = "Betreten",
	enter_azul = "Betreten",
	exit = "Dieses Team verlassen",
	inv3 = "Deine Unsterblichkeit ist vorbei.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) Puiguirata#0000 (DE) und Star#6725 (TR)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!",
	seconds30 = "<ROSE>Noch 30 Sekunden!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>Noch 10 Sekunden!",
	teamchat = "<J>Du kannst den Befehl !tc [message] um mit Ihrem Team zu sprechen.<br><br>Du kannst deine Profiltypisierung sehen !p und die Typisierung des temporären Tankens !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a><br><a href='event:powerups'>Powerups</a><br><a href='event:profile'>Profile</a><br><a href='event:cap'>Capitain</a><br><a href='event:cmd'>Commands</a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Powerups List",
	profile = "Verwenden Sie die !p Befehl, um Ihr Profil anzusehen und zu verwenden !p [username] um das Profil eines anderen Benutzers anzuzeigen.",
	starting = "<VP>Das Spiel beginnt in wenigen Sekunden. Macht euch bereit!",
	suicide = "Der folgende Spieler beging Selbstmord: ",
	ban = " wurde aus dem Zimmer verbannt von ",
	unban = " wurde nicht aus dem Zimmer verbannt.",
	caps = " wurde als Teamchef ausgewählt. Um mehr Informationen darüber zu erhalten, geben Sie Folgendes ein !cap Befehl oder verwenden Sie den Abschnitt Capitain im Menü des Moduls.",
	cap = "Auf dieser Zusammenstellung wurde die Funktionalität eines Capitain-Players integriert. Diese Art von Spieler (die zufällig ausgewählt wird) erhält 50% mehr Punkte und die Möglichkeit, Ihre Punkte auf andere Spieler zu übertragen, die im Spiel leben. !tt [name] Befehl. Sie können die Funktion !rv [name] Befehl, EINE Teamspielerin wiederzubeleben, die tot is.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Du brauchst 30 Punkte, um das zu benutzen.",
	advanced = " hast das Level erreicht ",
	tag_text = "<J>Vergiss nicht, das #Tag auf dem Ziel-Nicknamen einzufügen, sonst funktioniert dieser Befehl nicht!",
	revivetext = "<J>Der folgende Spieler wurde wiederbelebt: ",
	yturn = "Aktueller Spieler: ",
	level_error = "<R>Du hast kein Level, um das hier zu benutzen. Um dein Level zu sehen, benutze den !p Befehl.",
	funct = "Funktion nicht erlaubt",
	cmds = "Spielbefehle",
	commands = "• !help = Zeigen Sie die Spielhilfe an.<br>• !p [player] = Zeigt das Profil des ausgewählten Spielers an. Typ !p ohne Argumente, um Ihr Profil anzuzeigen.<br>• !tc [message] = Chat Sie mit anderen Mitgliedern Ihres Teams.<br><ROSE>* <N>!rv [player] = Erwecke einen toten Spieler deines Teams zum Leben.<br><ROSE>* <N>!tt [player] = Übertragen Sie Ihre Punkte auf ein anderes Teammitglied.<br><br>Die * mit gekennzeichneten Befehle  <ROSE>* <N>sind ausschließlich für die Teammitglieder bestimmt. Um weitere Informationen dazu zu erhalten, verwenden Sie die Option !cap Befehl.",
	playingmap = "Wiedergabekarte",
	created = "erstellt von",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	double = "used the powerup Double Anvil!",
	double2 = "",
	triple = "used the powerup Triple Anvil!",
	triple2 = "",
	objeto1 = "used the powerup Random Shoot!",
	objeto2 = "<br>On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<br>On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "<br>On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
	gi1 = "used the powerup Giant Transformation!",
	gi2 = "<br>On this powerup, during your shooting turn, you will increase in 50% the size of all mices of enemy team. This powerup also cancels all the mices with the 'Decrease Size' powerup.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
lang.tr = {
	win_vermelho = "<R> <b> KIRMIZI takım kazanır! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	win_azul = "<BL> <b> MAVİ takım kazanıyor! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	sudden_death = "<VP> <b> SUDDEN ÖLÜM! </b> <br> Başka takımlardan herhangi birini öldüren takım maçı kazanacak.",
	empate_text = "<J> <b> Beraberlik oldu! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	instructions = "Örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını ve örs atmak için Ara Çubuğu'nu kullanın.",
	timeout = "<J> Zaman bitti! Atıcı değiştirilecek.",
	enter_vermelho = "Giriş",
	enter_azul = "Giriş",
	exit = "Bu takımdan ayrıl",
	inv3 = "Ölümsüzlüğünüz sona erdi.",
	bar = "<b>#anvilwar</b> RTM 24265.166",
	intensity = "Yoğunluk",
	your_turn = "<J> Çekim sırası sizde. Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın.",
	help = "Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın. Düşman takımını ortadan kaldıran takım oyunu wons yapıyor. <br> <br> Tüm oyun komutlarını göstermek için !cmd yazın. <br> <br> <b> Krediler: </b> <br> Geliştirme: Spectra_phantom#6089 ve Reksai_void2600#6638 <br> Çeviriler: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) ve Star#6725 (TR) ",
	teamkill1 = "Oh hayır! ",
	teamKill2 = "takımının bir oyuncusunu öldürdü",
	ajuda = "Yardım",
	credits = "Kredi",
	mostrar = "Göster",
	seconds = "<ROSE> 60 saniye kaldı!",
	seconds30 = "<ROSE> 30 saniye kaldı! <br> 60 son saniyede oyuncuları canlandırmasına izin verilmiyor.",
	seconds10 = "<ROSE> 10 saniye kaldı! ",
	teamchat = "<J> Ekibinizle konuşmak için !tc [message] komutunu kullanabilirsiniz. <br> <br> Profil yazınızı !p ve geçici tanking yazma! Rütbesini görebilirsiniz.",
	menu_bar = "<p align = 'center'> <a href='event:help'> Yardım </a><br><a href='event:profile'> Profil </a<br><a href='event:powerups'> Güçlendirmeler </a><br><a href='event:cap'> Kişi Kişi </a><br><a href='event:cmd'> Komutlar </a><br><a href='event:ranking'>Ranking</a>",
	powerupslist = "Powerups Listesi",
	profile = "Profilinizi görüntülemek için !p komutunu kullanın ve başka bir kullanıcının profilini görüntülemek için !p [kullanıcı adı] kullanın.",
	starting = "<VP> Maç birkaç saniye içinde başlayacak. Hazırlan!",
	suicide = "Aşağıdaki oyuncu intihar etti: ",
	ban = " tarafından oda yasaklandı ",
	unban = " oda yasaklandı.",
	caps = " ekip kişi olarak seçildi.",
	cap = "(Rastgele seçilen) bu oyuncu türü %50 daha fazla puan alır ve puanlarınızı !tt [name] komutunu kullanarak maçta canlı olan diğer oyunculara aktarabilir. BİR takım oyuncusunu ölü olarak canlandırmak için !rv [name] komutunu kullanabilirsiniz. ",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Bunu kullanmak için 30 puana ihtiyacınız var.",
	advanced = " seviyeye ulaştı ",
	tag_text = "<J># Etiketini hedef takma ada eklemeyi unutmayın, aksi takdirde bu komut çalışmaz! ",
	revivetext = "<J> Aşağıdaki oyuncu canlandı: ",
	yturn = "Gerçek oyuncu: ",
	level_error = "<R> Bunu kullanacak seviyen yok. Seviyenizi görüntülemek için !p komutunu kullanın. ",
	funct = "Fonksiyona izin verilmiyor ",
	cmds = "Oyun komutları ",
	commands = "• !help = Oyun yardımını göster. <br> • !p [player] = Seçili oyuncunun profilini göster. Profilinizi göstermek için argüman olmadan !p yazın. <br> •!tc [message] = Takımınızın diğer üyeleri ile sohbet edin. <br> <ROSE> * <N> !rv [player] = Takımınızın ölü bir oyuncusunu canlandırın <br> <ROSE> * <N> !tt [player] = Puanlarınızı başka bir takım üyesine aktarın. <br> <br> <ROSE> * <N> ile işaretlenmiş komutlar ekibin özel kullanımı içindir. capitains. Bununla ilgili daha fazla bilgi görmek için !caps komutunu kullanın. ",
	playingmap = "Harita çalınıyor",
	created = "tarafından yaratıldı",
	red_int_text = "<R> Kırmızı takım bir mola istedi.",
	blue_int_text = "<BL> Mavi takım bir mola istedi.",
	double = "powerup çift örs kullanılır!",
	double2 = "",
	triple = "powerup üçlü örs kullanılır!",
	triple2 = "",
	objeto1 = "powerup kullanılır Random Shoot!",
	objeto2 = "<br> Bu powerup üzerinde örs yerine rastgele bir şaman nesnesi çekeceksiniz. Çift Örs açılışını kullandıysanız, biri yerine 2 nesne çekebilirsiniz. ",
	exp1 = "powerup Patlama kullandım! ",
	exp2 = "<br> Bu açılışta, farenizle düşman alanını tıklatarak patlamaya neden olabilirsiniz. <br> Patlamanıza neden olacak 5 saniyeniz var. ",
	inv1 = "güçlendirme Ölümsüz Modu kullandı! ",
	inv2 = "<br>Bu powerup üzerinde, sonraki 4 tur boyunca ölümsüz olacaksınız. Bu powerup oyun başına sadece 1 kez kullanılabilir. ",
	rs1 = "powerup kullanılır Boyutu Azalt!",
	rs2 = "<br> Bu açılışta, farelerinizin boyutu maç bitene kadar küçülecek. ",
	sq1 = "açılış Örs Sırasını kullandı! ",
	sq2 = "<br> Bu açılışta sırayla birçok örs çekeceksiniz. ",
	gi1 = "Dev Dönüşüm dönüştürdü! ",
	gi2 = "<br> Bu açılışta, atış sırası sırasında, düşman ekibinin tüm farelerinin boyutunu% 50 oranında artıracaksınız. Bu güçlendirme ayrıca 'Fareyi Azalt' güçlendirme ile tüm fareleri iptal eder.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
if string.find(tfm.get.room.name,"*") then
	text = lang.en
else
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	elseif tfm.get.room.community == "ar" then
		text = lang.ar
	elseif tfm.get.room.community == "es" then
		text = lang.es
	elseif tfm.get.room.community == "de" then
		text = lang.de
	elseif tfm.get.room.community == "tr" then
		text = lang.tr
	else
		text = lang.en
	end
end
function changeMap()
	tfm.exec.newGame(mapas[math.random(#mapas)])
end
function showText1(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,108,360,25,0x521202,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,108,360,25,0,0,0.99,true)
end
function showText2(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,108,360,25,0x021252,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,108,360,25,0,0,0.99,true)
end
function menuShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,150,130,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,150,165,500,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,620,130,30,27,0,0,1.0,true)
end
function profileShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,250,130,300,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,250,165,300,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,520,130,30,27,0,0,1.0,true)
end
function showPowerMeter(name)
	ui.addTextArea(3500,"<font size='12'><font face='Verdana'><b><p align='center'>Anvil Power",name,250,350,290,19,0x010101,0x010101,0.75,true)
	if power >= 1 then ui.addTextArea(3501,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp1'>1</a>",name,250,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3501,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp1'>1</a>",name,250,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 2 then ui.addTextArea(3502,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp2'>2</a>",name,283,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3502,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp2'>2</a>",name,283,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 3 then ui.addTextArea(3503,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp3'>3</a>",name,316,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3503,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp3'>3</a>",name,316,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 4 then ui.addTextArea(3504,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp4'>4</a>",name,349,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3504,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp4'>4</a>",name,349,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 5 then ui.addTextArea(3505,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp5'>5</a>",name,382,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3505,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp5'>5</a>",name,382,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 6 then ui.addTextArea(3506,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp6'>6</a>",name,415,377,23,20,0x808000,0x404000,0.95,true)
	else ui.addTextArea(3506,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp6'>6</a>",name,415,377,23,20,0x050500,0x404000,0.95,true) end
	if power >= 7 then ui.addTextArea(3507,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp7'>7</a>",name,448,377,23,20,0x808000,0x404000,0.95,true)
	else ui.addTextArea(3507,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp7'>7</a>",name,448,377,23,20,0x050500,0x404000,0.95,true) end
	if power >= 8 then ui.addTextArea(3508,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp8'>8</a>",name,481,377,23,20,0x800000,0x400000,0.95,true)
	else ui.addTextArea(3508,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp8'>8</a>",name,481,377,23,20,0x050000,0x400000,0.95,true) end
	if power >= 9 then ui.addTextArea(3509,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp9'>9</a>",name,514,377,23,20,0x800000,0x400000,0.95,true)
	else ui.addTextArea(3509,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp9'>9</a>",name,514,377,23,20,0x050000,0x400000,0.95,true) end
end
function resetPowers()
	ui.removeTextArea(701,nil)
	kills=0
	anvil_launched=false
	powerups.r_vermelho=false
	powerups.r_azul=false
	powerups.multi_count=2
	powerups.immortal=false
	powerups.immortal2=false
	set=false
	advanceLevel()
end
changeMap()
function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end
function eventRanking(name)
	local sc = {}
	for id, name in pairs(players_table) do
		sc[#sc+1] = {n=name,s=data[name].score,f=data[name].wins,k=data[name].kills,r=math.ceil((data[name].wins/data[name].matchs)*100)}
	end
	table.sort(sc,function(a,b) return a.s>b.s end)
	str1 = ''
	str2 = ''
	str3 = ''
	str4 = ''
	str5 = ''
	for k,v in pairs(sc) do
		if k < 15 then
			if str ~= '' then
				str1=str1.."<br><N>"..k.."   <VP>"..v.n..""
				str2=str2.."<br><b><N>"..v.s.."</b>"
				str3=str3.."<br><N>"..v.f..""
				str4=str4.."<br><N>"..v.k..""
				str5=str5.."<br><N>"..v.r..""
			else
				str1="<J>"..k.."   <VP>"..v.n..""
				str2="<J><b>"..v.s.."</b>"
				str3="<J>"..v.f..""
				str4=str4.."<N>"..v.k..""
				str5=str5.."<N>"..v.r..""
			end
		end
	end
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>Room Ranking",name,150,130,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Consolas'>#    Name                         Score     Wins    Kills    WinRate%",name,150,165,500,200,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9005,"<font size='12'><font face='Consolas'>"..str1,name,148,165,500,200,0,0,1.0,true)
	ui.addTextArea(9004,"<font size='12'><font face='Consolas'>"..str2,name,390,165,500,200,0,0,1.0,true)
	ui.addTextArea(9003,"<font size='12'><font face='Consolas'>"..str3,name,458,165,500,200,0,0,1.0,true)
	ui.addTextArea(9002,"<font size='12'><font face='Consolas'>"..str4,name,515,165,500,200,0,0,1.0,true)
	ui.addTextArea(9001,"<font size='12'><font face='Consolas'>"..str5,name,577,165,500,200,0,0,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,620,130,30,27,0,0,1.0,true)
end
function eventChatCommand(name,message)
	local arg = split(message, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end

		if tfm.get.room.playerList[nome] then
			profileShow(name,nome,"<font size='12'><b>Level: "..data[nome].nivel.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Score: "..data[nome].score.."<br>Matchs played: "..data[nome].matchs.."<br><br>Kills: "..data[nome].kills.."<br>Wins: "..data[nome].wins.."<br>Max Killing Spree: "..data[nome].max.."<br>Multi Kills: "..data[nome].mks.."",180)
			ui.addTextArea(9008,"",name,265,223,((data[nome].exp/data[nome].maxp)*260)+3,6,0xffffff,0x000001,nil,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "ranking" then
		eventRanking(name)
	end
	if(message:sub(0,4) == "kill") then
		if data[name].level >= 3 then
			tfm.exec.killPlayer(message:sub(6))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "pw") then
		if data[name].level >= 4 then
			tfm.exec.setRoomPassword(message:sub(4))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
	end
	if(message:sub(0,5) == "rodar") then
		if data[name].level >= 3 then
			tfm.exec.newGame(mapas[tonumber(message:sub(7))])
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "run") then
		if data[name].level >= 4 then
			tfm.exec.newGame(message:sub(5))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "ban") then
		if data[name].level >= 3 then
			if data[message:sub(5)] then
				tfm.exec.killPlayer(message:sub(5))
				data[message:sub(5)].level=-1
				tfm.exec.chatMessage(""..message:sub(5)..""..text.ban..""..name..".")
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "unban") then
		if data[name].level >= 3 then
			if data[message:sub(7)] then
				data[message:sub(7)].level=0
				tfm.exec.chatMessage(""..message:sub(7)..""..text.unban.."")
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "tc") or (message:sub(0,2) == "TC") then
		local typer=name
		if data[typer].team == "azul" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "azul" then
					tfm.exec.chatMessage("<font color='#0080ff'>• <b>["..typer.."]</b> "..message:sub(4).."",name)
				end
			end
			tfm.exec.chatMessage("<font color='#0080ff'>• <b>["..typer.."]</b> "..message:sub(4).."","Spectra_phantom#6089")
		elseif data[typer].team == "vermelho" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "vermelho" then
					tfm.exec.chatMessage("<font color='#fF7000'>• <b>["..typer.."]</b> "..message:sub(4).."",name)
				end
			end
			tfm.exec.chatMessage("<font color='#fF7000'>• <b>["..typer.."]</b> "..message:sub(4).."","Spectra_phantom#6089")
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "set") then
		if data[name].level >= 4 then
			if data[message:sub(5)] then
				set_name=message:sub(5)
				set=true
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "tt") then
		if name == caps.azul or name == caps.vermelho and valendo == true and reset == false then
			temp_name2=message:sub(4)
			if data[temp_name2] then
				ui.addPopup(1201,2,"1 = 5pts<br>2 = 10pts<br>3 = 15pts<br>4 = 20pts<br>5 = 25pts",name,350,225,200,true)
				tfm.exec.chatMessage(text.tag_text,name)
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "pt") then
		if name == caps.azul or name == caps.vermelho and valendo == true and reset == false and tfm.get.room.playerList[name].isDead == false then
			temp_name2=message:sub(4)
			if data[temp_name2] then
				actual_player=temp_name2
				tfm.exec.chatMessage(""..name.." passed your turn to "..temp_name2..".")
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "rv") then
		if name == caps.azul or name == caps.vermelho and valendo == true and reset == false then
			temp_name3=message:sub(4)
			if data[temp_name3] and tempo >= 30 and sudden_death == false then
				if tfm.get.room.playerList[name].score >= 30 then
					tfm.exec.respawnPlayer(temp_name3)
					if data[temp_name3].team == "azul" and powerups.r_azul == false then
						powerups.r_azul=true
						tfm.exec.movePlayer(temp_name3,math.random(850,1200),200,false,0,0,false)
						data[temp_name3].killed=0
					elseif data[temp_name3].team == "vermelho" and powerups.r_vermelho == false then
						powerups.r_vermelho=true
						tfm.exec.movePlayer(temp_name3,math.random(400,750),200,false,0,0,false)
						data[temp_name3].killed=0
					end
					data[temp_name3].immortal=true
					data[temp_name3].imatchs=3
					tfm.exec.setNameColor(temp_name3,0xd7d7e6)
					tfm.exec.setPlayerScore(name,-30,true)
					tfm.exec.chatMessage(""..text.revivetext..""..temp_name3.."")
				else
					tfm.exec.chatMessage(text.score30,name)
				end
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "score") then
		if data[name].level >= 4 then
			temp_name=message:sub(7)
			ui.addPopup(906,2,"Score",name,350,175,200,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "help" then
		menuShow(name,text.ajuda,text.help,160)
	end
	if message == "cmd" then
		menuShow(name,text.cmds,text.commands,166)
	end
	if message == "cap" then
		menuShow(name,text.cmds,text.cap,100)
	end
	if message == "powerups" then
		menuShow(name,text.powerupslist,"F1 (Double Anvil) - Cost: 5pt - Required Level: 1 - Function: <a href='event:power1'>Show</a><br>F2 (Triple Anvil) - Cost: 10pt - Required Level: 2 - Function: <a href='event:power2'>Show</a><br>F3 (Random Shoot) - Cost: 6pt - Required Level: 2 - Function: <a href='event:power3'>Show</a><br>F4 (Explosion) - Cost: 20pt - Required Level: 3 - Function: <a href='event:power4'>Show</a><br>F5 (Immortal Mode) - Cost: 30pt - Required Level: 5 - Function: <a href='event:power5'>Show</a><br>F6 (Decrease Size) - Cost: 14pt - Required Level: 4 - Function: <a href='event:power6'>Show</a><br>F7 (Anvil Sequence) - Cost: 22pt - Required Level: 4 - Function: <a href='event:power7'>Show</a><br>F8 (Giant Transformation) - Cost: 20pt - Required Level: 4 - Function: <a href='event:power8'>Show</a><br>F9 (Anvil Rain) - Cost: 20pt - Required Level: 4 - Function: <a href='event:power9'>Show</a>",145)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 901 then
		data[temp_name].score=tonumber(message)
		return name
	elseif id == 902 then
		data[temp_name].kills=tonumber(message)
		return name
	elseif id == 903 then
		data[temp_name].wins=tonumber(message)
		return name
	elseif id == 904 then
		data[temp_name].matchs=tonumber(message)
		return name
	elseif id == 906 then
		tfm.exec.setPlayerScore(temp_name,tonumber(message),true)
		return name
	elseif id == 1201 then
		if data[temp_name2] then
			if message == "1" then
				if tfm.get.room.playerList[name].score < 5 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,5,true)
					tfm.exec.setPlayerScore(name,-5,true)
					return name
				end
			elseif message == "2" then
				if tfm.get.room.playerList[name].score < 10 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,10,true)
					tfm.exec.setPlayerScore(name,-10,true)
					return name
				end
			elseif message == "3" then
				if tfm.get.room.playerList[name].score < 15 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,15,true)
					tfm.exec.setPlayerScore(name,-15,true)
					return name
				end
			elseif message == "4" then
				if tfm.get.room.playerList[name].score < 20 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,20,true)
					tfm.exec.setPlayerScore(name,-20,true)
					return name
				end
			elseif message == "5" then
				if tfm.get.room.playerList[name].score < 25 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,25,true)
					tfm.exec.setPlayerScore(name,-25,true)
					return name
				end
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
end
function showTeams(name)
	if valendo == false then
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>You must be connected to a Transformice account to play #anvilwar.",name)
		elseif data[name].level <= -1 then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>This account was banned of #anvilwar room.",name)
		else
			ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 378, 240, 20, 0x800000, 0x600000,1.0,true)
			ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 378, 240, 20, 0x80, 0x60,1.0,true)
		end
	end
end
function eventLoop(passado,faltando)
	showBar()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].team == "azul" then
				if tfm.get.room.playerList[name].x < 805 then
					tfm.exec.killPlayer(name)
				end
			end 
			if data[name].team == "vermelho" then
				if tfm.get.room.playerList[name].x > 795 then
					tfm.exec.killPlayer(name)
				end
			end 
		end
	end
	if intervalo == true then
		tfm.exec.setGameTime(15)
		anvil_launched=true
		count_int=count_int-0.5
		if count_int <= 0 then
			intervalo=false
			anvil_launched=false
			count_int=20
		end
	end
	if passado > 700 and passado < 1200 then
		for i=1,100 do
		if mapas[i] == tfm.get.room.currentMap then
			tfm.exec.chatMessage(""..text.playingmap.." <J>"..tfm.get.room.currentMap.."<BL> "..text.created.." <J>"..tfm.get.room.xmlMapInfo.author)
		end
		end
	end
	local minutos=math.floor(tempo/60)
	local segundos=math.floor((minutos*60)-tempo) * -1
	if valendo == true and tempo < 60 and tempo > 59 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds,nil)
	end
	if valendo == true and tempo < 30 and tempo > 29 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds30,nil)
	end
	if valendo == true and tempo < 10 and tempo > 9 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds10,nil)
	end
	if valendo == true and reset == false and intervalo == false then
		tempo=tempo-0.5
		if tempo < 0 then
			tempo=0
		end
		scoreloop=scoreloop+1
		if scoreloop >= 25 then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].killed == 0 then
					tfm.exec.setPlayerScore(name,1,true)
					data[name].score=data[name].score+1
					data[name].exp=data[name].exp+1
					if name == caps.vermelho or name == caps.azul then
						tfm.exec.setPlayerScore(name,1,true)
						data[name].score=data[name].score+1
					end
				end
			end
			scoreloop=0
		end
	end
	if valendo == true and reset == false and tempo <= 0 and sudden_death == true then
		if count_vermelho > count_azul then
			tfm.exec.chatMessage(text.win_vermelho)
		elseif count_vermelho < count_azul then
			tfm.exec.chatMessage(text.win_azul)
		else
			tfm.exec.chatMessage(text.empate_text)
		end
		count_azul=0
		count_vermelho=0
		valendo=false
		reset=true
		tfm.exec.setGameTime(15)
	end
	if reset == true then
		if faltando < 1 then
			changeMap()
		end
	end
	if valendo == true and reset == false and anvil_launched == false then
		time_limit=time_limit-0.5
		if time_limit == 0 then
			anvil_launched=true
			time_limit=15
			tfm.exec.chatMessage(text.timeout)
		end
	end
	if valendo == false and reset == false and faltando < 1888 and count_azul > 0 and count_vermelho > 0 then
		for i=11,297 do
			ui.removeTextArea(i,nil)
		end
	end
	if valendo == false and reset == false and faltando <= 1 then
		if count_azul > 0 and count_vermelho > 0 then
			if count == 0 then
				for name,player in pairs(tfm.get.room.playerList) do
					tfm.exec.chatMessage(text.starting,name)
					if data[name] then
						if data[name].team == "azul" then
							data[name].matchs=data[name].matchs+1
							tfm.exec.respawnPlayer(name)
							tfm.exec.movePlayer(name,1000,180,false,0,0,false)
							table.insert(play_azul,name)
							tfm.exec.setPlayerScore(name,5,false)
						elseif data[name].team == "vermelho" then
							data[name].matchs=data[name].matchs+1
							tfm.exec.respawnPlayer(name)
							tfm.exec.movePlayer(name,600,180,false,0,0,false)
							table.insert(play_vermelho,name)
							tfm.exec.setPlayerScore(name,5,false)
						else
							tfm.exec.movePlayer(name,800,-2000,false,0,0,false)
							tfm.exec.setPlayerScore(name,-1,false)
							kills=0
						end
					end
				end
			end
			kills=0
			count=count+0.5
			if count >= 10 then
				caps.azul=play_azul[math.random(#play_azul)]
				caps.vermelho=play_vermelho[math.random(#play_vermelho)]
				for name,player in pairs(tfm.get.room.playerList) do
					if data[name].team == "azul" then
						tfm.exec.chatMessage(""..caps.azul..""..text.caps.."",name)
					elseif data[name].team == "vermelho" then
						tfm.exec.chatMessage(""..caps.vermelho..""..text.caps.."",name)
					end
					if name == caps.azul or name == caps.vermelho then
						tfm.exec.chatMessage(text.cap_text,name)
						tfm.exec.setNameColor(name,0x8000ff)
					end
				end
				valendo=true
				players=count_azul+count_vermelho
				tempo=120+(players*6)
				for i=11,297 do
					ui.removeTextArea(i,nil)
				end
				if team == 2 then
					team=1
					if set == false then
						actual_player=play_vermelho[math.random(#play_vermelho)]
					else
						actual_player=set_name
					end
				else
					team=2
					if set == false then
						actual_player=play_azul[math.random(#play_azul)]
					else
						actual_player=set_name
					end
				end
				loop=10
				anvil_launched=false
				tfm.exec.setGameTime(15)
				time_limit=15
				if valendo == true and reset == false then
					if data[actual_player] then
						tfm.exec.chatMessage(text.your_turn,actual_player)
					end
				end
			end
		else
			tfm.exec.setGameTime(15)
		end
	end
	if valendo == true and anvil_launched == true and intervalo == false then
		loop=loop-1
		if loop <= 6 then
			powerups.sequence=false
		end
		if powerups.sequence == true then
			if data[actual_player].team == "azul" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,(4+power*2)*-1,-8)
			elseif data[actual_player].team == "vermelho" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,4+power*2,-8)
			end
		end
		if loop == 0 then
			if kills >= 3 then
				data[actual_player].mks=data[actual_player].mks+1
			end
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				if kills == 2 then
					tfm.exec.chatMessage("<ROSE>Double Kill de "..actual_player.."!")
				elseif kills >= 3 then
					tfm.exec.chatMessage("<ROSE>Multi Kill: "..kills.." kills de "..actual_player.."!")
				end
			else
				if kills == 2 then
					tfm.exec.chatMessage("<ROSE>Double Kill of "..actual_player.."!")
				elseif kills >= 3 then
					tfm.exec.chatMessage("<ROSE>Multi Kill: "..kills.." kills of "..actual_player.."!")
				end
			end
			kills=0
			play_azul={}
			play_vermelho={}
			count_azul=0
			count_vermelho=0
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "azul" then
					if data[name].killed == 0 then
						table.insert(play_azul,name)
						count_azul=count_azul+1
					end
				end
				if data[name].team == "vermelho" then
					if data[name].killed == 0 then
						table.insert(play_vermelho,name)
						count_vermelho=count_vermelho+1
					end
				end
				if data[name].immortal == true then
					data[name].imatchs=data[name].imatchs+1
					if data[name].imatchs >= 4 then
						data[name].immortal=false
						tfm.exec.chatMessage(text.inv3,name)
						tfm.exec.setNameColor(name,0xd7d7e6)
					end
				end
			end
			if team == 2 then
				team=1
				if set == false then
					actual_player=play_vermelho[math.random(#play_vermelho)]
				else
					actual_player=set_name
				end
			else
				team=2
				if set == false then
					actual_player=play_azul[math.random(#play_azul)]
				else
					actual_player=set_name
				end
			end
			loop=12
			if powerups.giant1 == true then
				powerups.giant1=false
				for name,player in pairs(tfm.get.room.playerList) do
					if data[name] and data[name].team == "azul" then
						tfm.exec.changePlayerSize(name,1)
					end
				end
			end
			if powerups.giant2 == true then
				powerups.giant2=false
				for name,player in pairs(tfm.get.room.playerList) do
					if data[name] and data[name].team == "vermelho" then
						tfm.exec.changePlayerSize(name,1)
					end
				end
			end
			resetPowers()
			if valendo == true and reset == false then
				if count_azul == 0 and count_vermelho == 0 then
					tfm.exec.chatMessage(text.empate_text)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				elseif count_azul == 0 then
					winRed()
					tfm.exec.chatMessage(text.win_vermelho)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				elseif count_vermelho == 0 then
					winAzul()
					tfm.exec.chatMessage(text.win_azul)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				end
			end
			tfm.exec.setGameTime(15)
			time_limit=15
			if valendo == true and reset == false then
				tfm.exec.chatMessage(text.your_turn,actual_player)
			end
		end
	end
	if valendo == true and reset == false and tempo >= 0 and anvil_launched == false then
		showPowerMeter(actual_player)
		ui.addTextArea(4600,"<font size='60'><p align='center'>"..math.floor(time_limit).."",actual_player,5,310,95,85,0x101010,0x101010,0.85,true)
	else
		for i=3500,3509 do
			ui.removeTextArea(i,nil)
		end
		ui.removeTextArea(4600,nil)
	end
	if valendo == true and reset == false and tempo <= 0 and sudden_death == false and anvil_launched == false then
		if count_vermelho > count_azul then
			tfm.exec.chatMessage(text.win_vermelho)
			winRed()
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
		elseif count_vermelho < count_azul then
			tfm.exec.chatMessage(text.win_azul)
			winAzul()
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
		elseif count_vermelho == count_azul and count_vermelho >= 2 and count_azul >= 2 then
			tfm.exec.setGameTime(90)
			tempo=90
			tfm.exec.chatMessage(text.sudden_death)
			sudden_death=true
		elseif count_vermelho == count_azul and count_vermelho <= 1 and count_azul <= 1 then
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
			tfm.exec.chatMessage(text.empate_text)
		end
	end
	if valendo == true and reset == false and faltando > 10000 then
		if data[actual_player].team == "azul" then
			showText2(""..text.yturn.."<b>"..actual_player.."")
		elseif data[actual_player].team == "vermelho" then
			showText1(""..text.yturn.."<b>"..actual_player.."")
		end
	else
		for i=4001,4004 do
			ui.removeTextArea(i,nil)
		end
	end
	if valendo == true and reset == false then
		local minutos=math.floor(tempo/60)
		local segundos=math.floor(tempo-(minutos*60))
		ui.addTextArea(2228,"",nil,230,14,340,85,0x010101,0x010101,0.9,true)
		ui.addTextArea(2221,"<p align='center'><font color='#000000'><font size='36'><font face='Verdana'><font color='#320000'>"..count_vermelho.."  <font color='#323232'>-  <font color='#000032'>"..count_azul.."",nil,322,20,160,60,0,0,1.0,true)
		ui.addTextArea(2220,"<p align='center'><font color='#ff0000'><font size='36'><font face='Verdana'>"..count_vermelho.."  <N>-  <font color='#0000ff'>"..count_azul.."",nil,320,18,160,60,0,0,1.0,true)
		ui.addTextArea(2225,"<p align='center'><font color='#321200'><font size='14'>TO: <b>"..powerups.int_vermelho.."</b>",nil,239,41,70,24,0,0,1.0,true)
		ui.addTextArea(2224,"<p align='center'><font color='#f13811'><font size='14'>TO: <b>"..powerups.int_vermelho.."</b>",nil,240,43,70,24,0,0,1.0,true)
		ui.addTextArea(2227,"<p align='center'><font color='#001232'><font size='14'>TO: <b>"..powerups.int_azul.."</b>",nil,481,41,70,24,0,0,1.0,true)
		ui.addTextArea(2226,"<p align='center'><font color='#1138f1'><font size='14'>TO: <b>"..powerups.int_azul.."</b>",nil,480,43,70,24,0,0,1.0,true)
	if segundos >= 10 then
		ui.addTextArea(2223,"<p align='center'><font color='#121212'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":"..segundos.."</b>",nil,341,63,120,36,0,0,1.0,true)
		ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":"..segundos.."</b>",nil,340,62,120,36,0,0,1.0,true)
	else
		ui.addTextArea(2223,"<p align='center'><font color='#121212'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":0"..segundos.."</b>",nil,341,63,120,36,0,0,1.0,true)
		ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":0"..segundos.."</b>",nil,340,62,120,36,0,0,1.0,true)
	end	
	else
		ui.removeTextArea(14,nil)
		for i=2220,2228 do
			ui.removeTextArea(i,nil)
		end
	end
end
function eventMouse(name,x,y)
	if powerups.explosion == true and actual_player == name then
		tfm.exec.explosion(x,y,30,120,true)
		tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
		powerups.explosion=false
	end
	if data[name].clicked == false then
		data[name].clicked=true
	end
end
function eventPlayerDied(name)
	if count < 10 then
		if data[name].team == "azul" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
		end
	end
	if data[name].immortal == false then
		if valendo == true and reset == false then
			tfm.exec.setPlayerScore(name,-1,false)
			tfm.exec.setPlayerScore(actual_player,2,true)
			if actual_player == caps.vermelho or actual_player == caps.azul then
				tfm.exec.setPlayerScore(actual_player,2,true)
				data[actual_player].score=data[actual_player].score+3
				data[actual_player].exp=data[actual_player].exp+5
			end
			data[actual_player].kills=data[actual_player].kills+1
			data[actual_player].score=data[actual_player].score+5
			loop=loop+1
			data[name].killed=1
			kills=kills+1
			data[actual_player].exp=data[actual_player].exp+4+kills
			if kills > data[actual_player].max then
				data[actual_player].max=kills
				data[actual_player].exp=data[actual_player].exp+2*kills
			end
			if data[name].team == data[actual_player].team and anvil_launched == true then
				tfm.exec.chatMessage("<J>"..text.teamkill1..""..actual_player.." "..text.teamKill2..": <b>"..name.."</b>.")
				tfm.exec.setPlayerScore(actual_player,-2,true)
				kills=kills-1
				data[actual_player].kills=data[actual_player].kills-1
				data[actual_player].score=data[actual_player].score-15
				data[actual_player].exp=data[actual_player].exp-10
			end
		end
		if actual_player == name and valendo == true and reset == false then
			tfm.exec.chatMessage(""..text.suicide..""..actual_player.."")
			tfm.exec.setPlayerScore(actual_player,-1,false)
			data[actual_player].score=data[actual_player].score-12
			data[actual_player].exp=data[actual_player].exp-8
		end
	else
		tfm.exec.respawnPlayer(name)
		tfm.exec.setNameColor(name,0x00ff00)
		if data[name].team == "azul" then
			tfm.exec.movePlayer(name,1000,200,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.movePlayer(name,600,200,false,0,0,false)
		end
	end
	if sudden_death == true then
		if data[name].team == "azul" and data[name].immortal == false then
			winRed()
			tfm.exec.chatMessage(text.win_vermelho)
			count_azul=0
		elseif data[name].team == "vermelho" and data[name].immortal == false then
			winAzul()
			tfm.exec.chatMessage(text.win_azul)
			count_vermelho=0
		end
		valendo=false
		reset=true
		tfm.exec.setGameTime(15)
		sudden_death=false
	end
	if actual_player == name then
		anvil_launched=true
		actual_palayer=""
	end
	if reset == true then
		tfm.exec.respawnPlayer(name)
		if data[name].team == "azul" then
			tfm.exec.movePlayer(name,1000,200,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.movePlayer(name,600,200,false,0,0,false)
		end
		tfm.exec.playEmote(name,0)
	end
end
function eventPlayerLeft(name)
	if data[name] then
		ratos=ratos-1
		data[name].killed=-1
		data[name].team=""
	end
end
function showBar()
	for i=1,115 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<VP>"..mapas[i].." ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			else
				ui.setMapName("<VP><b>“"..map_names[i].."”</b> ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			end
		end
	end
end
function eventNewPlayer(name)
	ratos=ratos+1
	if not data[name] then
		table.insert(players_table,name)
		data[name]={wins=0,matchs=0,kills=0,max=0,score=0,mks=0,killed=-1,team="",immortal=false,imatchs=0,immortal2=false,level=0,nivel=1,exp=0,maxp=50,clicked=false}
		data[name].clicked=false
	end
	showTeams(name)
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
		for i=32,123 do
			tfm.exec.bindKeyboard(name,i,true,true)
			system.bindMouse(name,true)
		end
		if string.find(tfm.get.room.name,name) then
			managers_list={}
			table.insert(mods_list,name)
			data[name].level=3
			tfm.exec.chatMessage("You are the administrator of this room. You can use certain commands to moderate the room.",name)
		end		
	end
	if name:sub(1,1) == "*" then
		data[name].level=-1
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventKeyboard(name,key,down,x,y)
	if anvil_launched == false then
		if actual_player == name then
			if key == 32 then
				if valendo == true then
					set=false
					set_name=""
					ui.removeTextArea(4003,nil)
					if data[name].team == "azul" then
						if powerups.objeto == true then
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,(4+power*2)*-1,-8)
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,(4+power*2)*-1,-8)
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x+40,y-60,0,(4+power*2)*-1,-8)
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x+80,y-60,0,(4+power*2)*-1,-8)
								powerups.triple=false
							end
						end
					elseif data[name].team == "vermelho" then
						if powerups.objeto == true then
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,4+power*2,-8)
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,4+power*2,-8)
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x-40,y-60,0,4+power*2,-8)
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x-80,y-60,0,4+power*2,-8)
								powerups.triple=false
							end
						end
					end
					anvil_launched=true
				end
			end
			if key >= 49 and key <= 57 then
				power=key-48
			end
			if key == 35 and anvil_launched == false and valendo == true then
				if name == caps.azul or name == caps.vermelho then
					if name == caps.azul then
						if powerups.int_azul > 0 then
							tfm.exec.chatMessage(text.blue_int_text)
							intervalo=true
							powerups.int_azul=powerups.int_azul-1			
						else
							tfm.exec.chatMessage(text.funct,name)
						end
					end
					if name == caps.vermelho then
						if powerups.int_vermelho > 0 then
							tfm.exec.chatMessage(text.red_int_text)
							intervalo=true
							powerups.int_vermelho=powerups.int_vermelho-1					
						else
							tfm.exec.chatMessage(text.funct,name)
						end
					end
				else
					tfm.exec.chatMessage(text.funct,name)
				end
			end
			if key == 112 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 5 then
					if data[name].nivel >= 1 then
						powerups.double=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.double.."")
						tfm.exec.setPlayerScore(name,-5,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 113 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 10 then
					if data[name].nivel >= 2 then
						powerups.double=true
						powerups.triple=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.triple.."")
						tfm.exec.setPlayerScore(name,-10,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 114 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 6 then
					if data[name].nivel >= 2 then
						powerups.objeto=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.objeto1.."")
						tfm.exec.setPlayerScore(name,-6,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 115 then
				if valendo == true and actual_player == name and powerups.explosion == false and tfm.get.room.playerList[name].score >= 20 then
					if data[name].nivel >= 3 then
						powerups.explosion=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.exp1.."")
						tfm.exec.setPlayerScore(name,-20,true)
						anvil_launched=true
						loop=12
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 116 then
				if valendo == true and actual_player == name and data[name].immortal2 == false and tfm.get.room.playerList[name].score >= 30 then
					if data[name].nivel >= 5 then
						data[name].immortal=true
						data[name].immortal2=true
						tfm.exec.setNameColor(name,0x00ff00)
						tfm.exec.setPlayerScore(name,-30,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.inv1.."")
						tfm.exec.chatMessage(text.inv2,name)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 117 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 14 then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-14,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.rs1.."")
						tfm.exec.chatMessage(text.rs2,name)
						tfm.exec.changePlayerSize(actual_player,0.6)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 118 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 22 and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-22,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.sq1.."")
						tfm.exec.chatMessage(text.sq2,name)
						powerups.sequence=true
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 119 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 20 then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-20,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.gi1.."")
						tfm.exec.chatMessage(text.gi2,name)
						if data[name].team == "vermelho" then
							powerups.giant1=true
							for name,player in pairs(tfm.get.room.playerList) do
									if data[name].team == "azul" then
										tfm.exec.changePlayerSize(name,1.5)
									end
							end
						elseif data[name].team == "azul" then
							powerups.giant2=true
							for name,player in pairs(tfm.get.room.playerList) do
									if data[name].team == "vermelho" then
										tfm.exec.changePlayerSize(name,1.5)
									end
							end
						end
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 120 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 20 and anvil_launched == false then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-20,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.ar1.."")
						tfm.exec.chatMessage(text.ar2,name)
						if data[name].team == "vermelho" then
							for i=1,7 do
								tfm.exec.addShamanObject(10,800+(100*i),50,0,0)
							end
						elseif data[name].team == "azul" then
							for i=1,7 do
								tfm.exec.addShamanObject(10,100*i,50,0,0)
							end
						end
						anvil_launched=true
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
		end
	end
end
function eventNewGame()
	advanceLevel()
	ui.removeTextArea(501,nil)
	for i=11,297 do
		ui.removeTextArea(i,nil)
	end
	sudden_death=false
	for i=6001,6004 do
		ui.removeTextArea(i,nil)
	end
	time_limit=15; reset=false; count_azul=0; count_vermelho=0; tempo=0; power=5; count=0; img_loop=7
	powerups.int_azul=2; powerups.int_vermelho=2; powerups.double=false; powerups.triple=false; powerups.objeto=false; powerups.explosion=false; powerups.sequence=false;
	kills=0
	play_azul={}
	play_vermelho={}
	valendo=false
	loop=12
	resetPowers()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			tfm.exec.changePlayerSize(name,1)
			data[name].killed=-1; data[name].team=""; data[name].immortal=false; data[name].immortal2=false; data[name].imatchs=0; data[name].skip=0;
			tfm.exec.setNameColor(name,0xd7d7e6)
			giveCargos(name,data[name].level)
			for i=32,123 do
				tfm.exec.bindKeyboard(name,i,true,true)
			end
			showTeams(name)
			for id,name in pairs(mods_list) do
				if data[name] then
					giveCargos(name,3)
				end
			end
			for id,name in pairs(managers_list) do
				if data[name] then
					giveCargos(name,4)
				end
			end
			for id,name in pairs(ninjas_list) do
				if data[name] then
					giveCargos(name,5)
				end
			end
			for id,name in pairs(admins_list) do
				if data[name] then
					giveCargos(name,6)
				end
			end
			for id,name in pairs(banned_list) do
				if data[name] then
					giveCargos(name,-2)
				end
			end
		end
	end
	tfm.exec.setGameTime(30)
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b><br>Estamos aceitando mapas! Envie-os neste link:<br>https://atelier801.com/topic?f=880459&t=939384")
	else
		tfm.exec.chatMessage("<VP><b>You can see all the available #anvilwar rooms on /room #anvilwar00rooms.</b><br>The Map Submissions are now open! Send your maps here:<br>https://atelier801.com/topic?f=880459&t=939384")
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,text.menu_bar,name,2,58,100,84,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "cap" then
		eventChatCommand(name,"cap")
	end
	if callback == "cmd" then
		eventChatCommand(name,"cmd")
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "power1" then
		tfm.exec.chatMessage(text.double2,name)
	end
	if callback == "power2" then
		tfm.exec.chatMessage(text.triple2,name)
	end
	if callback == "power3" then
		tfm.exec.chatMessage(text.objeto2,name)
	end
	if callback == "power4" then
		tfm.exec.chatMessage(text.exp2,name)
	end
	if callback == "power5" then
		tfm.exec.chatMessage(text.inv2,name)
	end
	if callback == "power6" then
		tfm.exec.chatMessage(text.rs2,name)
	end
	if callback == "power7" then
		tfm.exec.chatMessage(text.sq2,name)
	end
	if callback == "ranking" then
		eventRanking(name)
	end
	if callback == "power8" then
		tfm.exec.chatMessage(text.gi2,name)
	end
	if callback == "power9" then
		tfm.exec.chatMessage(text.ar2,name)
	end
	if callback == "profile" then
		tfm.exec.chatMessage(text.profile,name)
	end
	if callback == "sp1" then power=1 end
	if callback == "sp2" then power=2 end
	if callback == "sp3" then power=3 end
	if callback == "sp4" then power=4 end
	if callback == "sp5" then power=5 end
	if callback == "sp6" then power=6 end
	if callback == "sp7" then power=7 end
	if callback == "sp8" then power=8 end
	if callback == "sp9" then power=9 end
	if callback == "fechar" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
		end
	end
	if callback == "close" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
			ui.removeTextArea(6969+id,name)
			ui.removeTextArea(7979+id,name)
		end
	end
	if callback == "closep" then
		for id=9000,9010 do
			ui.removeTextArea(id,name)
		end
	end
	if callback == "enter_vermelho" then
		if data[name].killed == -1 and data[name].team == "" then
			data[name].team="vermelho"
			data[name].killed=0
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
			count_vermelho=count_vermelho+1
			ui.removeTextArea(41,name)
			ui.removeTextArea(42,name)
			ui.addTextArea(51,"<p align='center'><a href='event:sair_vermelho'>"..text.exit.."",name,280,180,240,20,0x505050,0x323232,1.0,true)
		end
	end
	if callback == "enter_azul" then
		if data[name].killed == -1 and data[name].team == "" then
			data[name].team="azul"
			data[name].killed=0
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
			count_azul=count_azul+1
			ui.removeTextArea(41,name)
			ui.removeTextArea(42,name)
			ui.addTextArea(52,"<p align='center'><a href='event:sair_azul'>"..text.exit.."",name,280,180,240,20,0x505050,0x323232,1.0,true)
		end
	end
	if callback == "sair_azul" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_azul=count_azul-1
		ui.removeTextArea(52,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 165, 240, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 165, 240, 20, 0x80, 0x60,1.0,true)
	end
	if callback == "sair_vermelho" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_vermelho=count_vermelho-1
		ui.removeTextArea(51,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 378, 240, 20, 0x800000, 0x600000,1.0,true)
		 ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 378, 240, 20, 0x80, 0x60,1.0,true)
	end
end
function winRed()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].team == "vermelho" then
			data[name].exp=data[name].exp+20
			data[name].wins=data[name].wins+1
			data[name].score=data[name].score+15
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,math.random(225,775),170,false,0,0,false)
			tfm.exec.playEmote(name,0)
			for i=6001,6004 do
				ui.removeTextArea(i,nil)
			end
		end
	end
	advanceLevel()
end
function winAzul()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].team == "azul" then
			data[name].exp=data[name].exp+20
			data[name].wins=data[name].wins+1
			data[name].score=data[name].score+15
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,math.random(825,1375),170,false,0,0,false)
			tfm.exec.playEmote(name,0)
			for i=6001,6004 do
				ui.removeTextArea(i,nil)
			end
		end
	end
	advanceLevel()
end
function advanceLevel()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].exp >= data[name].maxp then
				data[name].exp=data[name].exp-data[name].maxp
				data[name].maxp=data[name].maxp+50
				data[name].nivel=data[name].nivel+1
				tfm.exec.chatMessage("<VP><b>"..name..""..text.advanced.."</b>"..data[name].nivel.."!")
			end
		end
	end
end
function giveCargos(name,type)
	if type == 2 and data[name] then
		data[name].level=2
		tfm.exec.setNameColor(name,0x0076FF)
	elseif type == 3 and data[name] then
		data[name].level=3
		tfm.exec.setNameColor(name,0xFFFB00)
	elseif type == 4 and data[name] then
		data[name].level=4
		tfm.exec.setNameColor(name,0xFF7100)
	elseif type == 5 and data[name] then
		data[name].level=5
	elseif type == 6 and data[name] then
		data[name].level=6
		tfm.exec.setNameColor(name,0xFF0000)
	elseif type == -2 and data[name] then
		data[name].level=-2
	end
end
end

initMestre = function()
admin="" -- If you are a FunCorp member, please change this with your nickname and type !tc to enable the FunCorp special resources and commands.
-- FunCorp, you can use the !command [number from 1-67] to execute a command separately. Use only when FunCorp mode (!fc) is enabled.
for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
mapas={
simple={6788085,6788174,6788154,6788715,6788728,6789259,6789271,6790527,6791838,6789451,6792397,6793213,6793222,6799768,6789356,6789937,6822331,7290270,7290275,6892022,6754319,7686598,7750148,7616526,7429544,7688066,7692398,4514051,3821176},
scenarios={6788183,6784965,6789235,6789853,6790385,6791944,6801706,6792470,6806109,6821950,6866406,6866437,6885971,5328362,5957905,7055459,7525277,6981135,2684847,6835934,7252582,7214363,6799046},
misc={6788178,6788693,6788695,6789272,6799996,6799998,6808957,6803018,6809464,6859175,6907177,7404327,7382263,6885799,6885841,6886906,6790912,6833993,7721192,7309605,6514206,6481798,6730002,6532621,3171810},
arts={6788861,6789249,6790484,6790903,6792509,6792518,6792523,6794050,6789358,6830799,6866549,6834529,6812488,6876563,6888512,6893463,7431981,6879100,7146925,6937148,7252655,6356881},
mech={6789280,6789334,6790895,6793860,6799997,6789324,6803128,6900149,6943992,6888884,7279612,7252133,3832586},
geek={6791871,6802377,6811934,7631682,6876638,6892608,6982387,7404106,7405103,7400694,7400678,7412412,7412422,7491944,7755685},
testing={6788848,6789206,6789260,6790433,6790911,6790896,6792320,6790467,6798615,6810292,6809498,6822119,3110915,6983850,7711216,6958861,7250912,7253090,7254162,6863706,7469336,7659327,7563422,6481798,7350028,7053239,7285518,5298381,6992466},
troll={6789263,6790300,4411212,6781398,7394517,7354947,3398791,1347551,7201360,1429677,6897042,3766247,7296284,1852537,7712670,7748874,7712670,1564662,5549586}
}
active=0; vivo=0; rato=0; dificuldade=1; rodadas=0; rodada=0; number=0; xpos=0; ypos=0; data={}; lang={}; tempo=10; counter=0; map_cat=-2; q=""; a=""; qtime=10;
fc_cmds={1,2,4,5,6,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,28,30,31,32,33,34,35,36,40,41,42,43,45,46,47,48,49,50,51,53,57,58,59,61,62,65,66,67}
spiderweb={type = 15,width = 80,height = 80}
fc_mode=false
unlocked=true
xpos=0; xpos2=0;
for _,f in next,{"command","mapa","pw","limit","run","fc","q","a","t","kill"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N>Bem-vindo ao Mestre Mandou! Nesta sala seu objetivo é fazer tudo o que o script mandar.<br><ROSE>Script criado por <b>Nasus_assassin#1534</b>. Traduzido por Fosfus7heads#0000. Versão RTM 6642.038",
	dancar = "Dance!",
	sentar = "Sente!",
	confetar = "Atire 5 confetes!",
	mouse = "Clique na tela 10 vezes!",
	beijos = "Dê 10 beijos!",
	dormir = "Vocês estão com sono. Durmam para descansar.",
	raiva = "Tigrounette é do mal! Fiquem com raiva dele!",
	chorem = "Vocês não ganharam queijo :( Chorem!",
	nchorem = "Não chorem!",
	esquerda = "Não vá para a esquerda!",
	direita = "Não vá para a direita!",
	numero = "Digite o seguinte número: ",
	digitar = "Digite qualquer coisa e mande para mim.",
	falar = "Não falem nada!",
	pular = "Não pulem!",
	mexer = "Não se mexam!",
	bandeira = "Balance a bandeira de qualquer país!",
	ano = "Em que ano estamos?",
	vesquerda = "Fique virado para a esquerda!",
	vdireita = "Fique virado para a direita!",
	quadradoa = "Fique no quadrado azul!",
	quadradov = "Fique no quadrado vermelho!",
	quadrado = "Fique no quadrado branco!",
	nquadrado = "Não fique no quadrado branco!",
	retangulo = "Fique dentro do retângulo branco!",
	retangulov = "Fique dentro do retângulo vermelho!",
	nretangulo = "Não fique dentro do retângulo branco!",
	preesquerda15 = "Pressione 15 vezes a tecla para ESQUERDA!",
	predireita15 = "Pressione 15 vezes a tecla para DIREITA!",
	preesquerda30 = "Pressione 30 vezes a tecla para ESQUERDA!",
	predireita30 = "Pressione 30 vezes a tecla para DIREITA!",
	preesquerda60 = "Pressione 60 vezes a tecla para ESQUERDA!",
	predireita60 = "Pressione 60 vezes a tecla para DIREITA!",
	espaco = "Pressione a barra de espaço 20 vezes!",
	nome = "Digite o seu nome no jogo (com #número).",
	ndance = "Não dance!",
	key1 = "Pressione a tecla Delete!",
	action1 = "Dance, sente e durma!",
	laugh = "Agora RIAM!",
	laugh2 = "Quem rir agora vai morrer.",
	stone = "Olha a pedra!",
	noob = "Digite: EU SOU NOOB",
	action2 = "Chore depois ria!",
	jump = "Pulem!",
	number = "Digite o seguinte número: ",
	key = "Pressione qualquer tecla!",
	jump2 = "Pulem 5 vezes!",
	action3 = "Dê um beijo depois chore!",
	area = "Descubra onde está o texto escondido e clique nele!",
	dancing = "É hora da festa!",
	freeze = "Todo mundo parado!",
	transform = "Dance e durma!",
	down1 = "Abaixem 3 vezes!",
	kill = "Se matem!",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	mices = "Esta sala requer pelo menos 4 ratos.",
	difficulty = "Dificuldade",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por",
	abaixar = "Abaixem e se levantem!",
	action = "Façam qualquer ação!",
	naction = "Não façam nenhuma ação!",
	math = "Quanto é 1+1?",
	ds = "Dance e sente!",
	seq4 = "Dance, sente, durma e bata palmas!",
	spider = "Cuidado com as teias de aranha!",
	key2 = "Pressione F4!",
	clap = "Bata palmas 5 vezes!"
}
lang.en = {
	welcome = "<N>Welcome to script Master Says! On this module you have to do everything that the master says.<br><ROSE>Module created by <b>Nasus_assassin#1534</b>. Version RTM 6642.038",
	dancar = "Dance!",
	sentar = "Sit!",
	confetar = "Throw 5 confetti!",
	mouse = "Click on screen 10 times!",
	beijos = "Give 10 kisses!",
	dormir = "They are sleepy. Sleep to rest.",
	raiva = "Tigrounette is evil! Get angry with him!",
	chorem = "No cheese for you. Cry!",
	nchorem = "Don't cry!",
	esquerda = "Don't go to the LEFT!",
	direita = "Don't go to the RIGHT!",
	numero = "Type this number: ",
	digitar = "Type anything and send to me.",
	falar = "Don't speak nothing!",
	pular = "Don't jump!",
	mexer = "Don't move!",
	bandeira = "Balance the flag of anything country!",
	ano = "What year are we?",
	vesquerda = "Stay facing LEFT!",
	vdireita = "Stay facing RIGHT!",
	quadradoa = "Stay on the blue square!",
	quadradov = "Stay on the red square!",
	quadrado = "Stay on the white square!",
	nquadrado = "Don't stay on the white square!",
	retangulo = "Stay on the white rectangle!",
	retangulov = "Stay on the red rectangle!",
	nretangulo = "Don't stay on the white rectangle!",
	preesquerda15 = "Press 15 times the LEFT key!",
	predireita15 = "Press 15 times the RIGHT key!",
	preesquerda30 = "Press 30 times the LEFT key!",
	predireita30 = "Press 30 times the RIGHT key!",
	preesquerda60 = "Press 60 times the LEFT key!",
	predireita60 = "Press 60 times the RIGHT key!",
	espaco = "Press 20 times the SPACEBAR!",
	nome = "Type your nickname (with #number)!",
	ndance = "Don't dance!",
	key1 = "Press the DELETE key!",
	action1 = "Dance, sit and sleep!",
	laugh = "Laugh!",
	laugh2 = "Don't laugh!",
	stone = "Caution with the stones!",
	noob = "Type: I AM NOOB",
	action2 = "Cry and laugh!",
	jump = "Jump!",
	number = "Type the following number: ",
	key = "Press any key!",
	jump2 = "Jump 5 times!",
	action3 = "Give a kiss and cry!",
	area = "Discover where is the hidden text and click!",
	dancing = "Time of party!",
	freeze = "Stop!",
	transform = "Dance and sleep!",
	down1 = "Turn down 3 times!",
	kill = "Kill yourselves!",
	mestre = "Master Says",
	map = "Map",
	time = "Time",
	mice = "Mice",
	round = "Round",
	mices = "This room requires at least 4 players.",
	difficulty = "Difficulty",
	segundos = "seconds.",
	fim = "End of match! The next match will start on ",
	playingmap = "Playing map",
	created = "created by",
	abaixar = "Turn down and get up!",
	action = "Do any action!",
	naction = "Don't do any action!",
	math = "How much is 1+1?",
	ds = "Dance and sit!",
	seq4 = "Dance, sit, sleep and clap!",
	spider = "Caution with the spider webs!",
	key2 = "Press F4!",
	clap = "Clap 5 times!"
}
lang.fr = {
	welcome = "<N>Bienvenue sur le module 'Maître a dit' ! Dans ce module tu dois faire tout ce que dit le maître.<br><ROSE>Module créé par <b>Nasus_assassin#1534</b>. Traduit par Chatonlina#0000, Eyeground#0000 et Tortuegreen#0000. Version RTM 6642.038",
	dancar = "Danse !",
	sentar = "Assis !",
	confetar = "Lance 5 fois des confettis !",
	mouse = "Clique sur l'écran 10 fois !",
	beijos = "Fais 10 bisous !",
	dormir = "Tu es fatigué. Dors pour te reposer.",
	raiva = "Tigrounette est méchant ! Mets-toi en colère contre lui !",
	chorem = "Pas de fromage pour toi. Pleure !",
	nchorem = "Ne pleure pas !",
	esquerda = "Ne va pas vers la GAUCHE !",
	direita = "Ne va pas vers la DROITE !",
	numero = "Écris ce nombre : ",
	digitar = "Écris n'importe quoi et envoie-le.",
	falar = "Ne parle pas !",
	pular = "Ne saute pas !",
	mexer = "Ne bouge pas!",
	bandeira = "Agite le drapeau de n'importe quel pays !",
	ano = "En quelle année sommes-nous ?",
	vesquerda = "Positionne-toi vers la GAUCHE !",
	vdireita = "Positionne-toi vers la DROITE !",
	quadradoa = "Reste dans le carré bleu !",
	quadradov = "Reste dans le carré rouge !",
	quadrado = "Reste dans le carré blanc !",
	nquadrado = "Ne reste dans le carré blanc !",
	retangulo = "Reste dans le rectangle blanc !",
	retangulov = "Reste dans le rectangle rouge !",
	nretangulo = "Ne reste pas sur le rectangle blanc !",
	preesquerda15 = "Appuie 15 fois sur la flèche GAUCHE !",
	predireita15 = "Appuie 15 fois sur la flèche DROITE !",
	preesquerda30 = "Appuie 30 fois sur la flèche GAUCHE !",
	predireita30 = "Appuie 30 fois sur la flèche DROITE !",
	preesquerda60 = "Appuie 60 fois sur la flèche GAUCHE !",
	predireita60 = "Appuie 60 fois sur la flèche DROITE !",
	espaco = "Appuie 20 fois sur la BARRE D'ESPACE !",
	nome = "Écrit ton pseudo (avec le #tag) !",
	ndance = "Ne dance pas !",
	key1 = "Appuie sur la touche SUPPR !",
	action1 = "Dance, assis-toi et dors !",
	laugh = "Rigole !",
	laugh2 = "Ne rigole pas !",
	stone = "Attention aux pierres !",
	noob = "Écris : I AM NOOB",
	action2 = "Pleure et rigole !",
	jump = "Saute !",
	number = "Appuie sur le nombre suivant: ",
	key = "Appuie sur n'importe quelle touche !",
	jump2 = "Saute 5 fois !",
	action3 = "Fais un bisou et pleure !",
	area = "Cherche où se trouve le texte caché et clique dessus !",
	dancing = "C'est l'heure de faire la fête !",
	freeze = "Stop !",
	transform = "Danse et dors !",
	down1 = "Retourne-toi 3 fois !",
	kill = "Tuez-vous !",
	mestre = "Jacques à dit",
	map = "Carte",
	time = "Temps",
	mice = "Souris",
	round = "Tour",
	mices = "Ce salon a besoin d'au moins 4 joueurs.",
	difficulty = "Difficulté",
	segundos = "secondes.",
	fim = "Fin du match ! Le prochain match va commencer dans ",
	playingmap = "Map chargé ",
	created = "créée par",
	abaixar = "Retourne-toi et lève-toi !",
	naction = "Ne fais rien !",
	action = "Faites n'importe quelle action !",
	math = "Combien vaut 1 + 1?",
	ds = "Danse et assis !",
	seq4 = "Dance, assis-toi, dors et applaudir!",
	spider = "Attention aux toiles d'araignées!",
	key2 = "Appuie sur la touche F4!",
	clap = "Tape dans tes mains 5 fois!"
}
lang.tr = {
	welcome = "<N> Master Says'ýn senaryosuna hoþ geldiniz! Bu modülde ustanýn söylediði her þeyi yapmalýsýnýz. <br> <ROSE><b>Nasus_assassin#1534</b> tarafýndan oluþturulan model. Tercüme eden Star#6725. Versiyon RTM 6642.038",
	dancar = "Dans!",
	sentar = "Sit!",
	confetar = "5 konfeti atýn!",
	mouse = "Ekranda 10 kez týklayýn!",
	beijos = "10 öpücük ver!",
	dormir = "Onlar uyuyor. Dinlenmek için uyu.",
	raiva = "Tigrounette evil! Girl for him!",
	chorem = "Senin için peynir yok. Aðla!",
	nchorem = "Aðlama!",
	esquerda = "SOLA gitme!",
	direita = "SAÐA gitme!",
	numero = "Bu numarayý yazýn: ",
	digitar = "Bir þey yazýn ve bana gönderin.",
	falar = "Hiçbir þey konuþma!",
	pular = "Atlama!",
	mexer = "Kýpýrdama!",
	bandeira = "Herhangi bir ülkenin bayraðýný dengeleyin!",
	ano = "Hangi yýldayýz?",
	vesquerda = "SOLA bakmaya devam edin!",
	vdireita = "SAÐA bakmaya devam edin!",
	quadradoa = "Mavi meydanda kalýn!",
	quadradov = "Kýzýl meydanda kalýn!",
	quadrado = "Beyaz meydanda kalýn!",
	nquadrado = "Beyaz meydanda kalmayın!",
	retangulo = "Stay on the white rectangle!",
	retangulov = "Kýrmýzý dikdörtgenin üzerinde kalýn!",
	nretangulo = "Beyaz dikdörtgenin üzerinde kalmayýn!",
	preesquerda15 = "SOL tuþa 15 kez basýn!",
	predireita15 = "SAÐ tuþa 15 kez basýn!",
	preesquerda30 = "SOL tuþa 30 kez basýn!",
	predireita30 = "SAÐ tuþa 30 kez basýn!",
	preesquerda60 = "SOL tuþa 60 kez basýn!",
	predireita60 = "SAÐ tuþa 60 kez basýn!",
	espaco = "Ara Çubuðu'na 20 kez basýn!",
	nome = "Takma adýnýzý yazýn (# sayý ile)!",
	ndance = "Dans etme!",
	vampire = "Rastgele bir oyuncu artýk bir vampir! Yakýn durma!",
	key1 = "DELETE tuþuna basýn!",
	action1 = "Dans et, otur ve uyu!",
	laugh = "Gülmek!",
	laugh2 = "Gülme!",
	stone = "Taþlarla dikkat!",
	noob = "Tür: BEN NOOB",
	action2 = "Aðla ve gül!",
	jump = "Atlama!",
	number = "Aþaðýdaki numarayý yazýn: ",
	key = "Herhangi bir tuþa basýn!",
	jump2 = "5 kez zýpla!",
	action3 = "Bir öpücük ver ve aðla!",
	area = "Gizli metnin nerede olduðunu keþfedin ve týklayýn!",
	dancing = "Parti zamaný!",
	freeze = "Dur!",
	transform = "Dans ve uyku!",
	down1 = "3 kez kapatýn!",
	kill = "Kendinizi öldürün!",
	mestre = "Usta Diyor",
	map = "Harita",
	time = "Zaman",
	mice = "fareler",
	round = "yuvarlak",
	mices = "Bu odada en az 4 oyuncu gerekmektedir.",
	difficulty = "zorluk",
	segundos = "saniye.",
	fim = "Maçýn sonu! Bir sonraki maç baþlayacak ",
	playingmap = "Harita çalýnýyor",
	created = "tarafýndan yaratýldý",
	abaixar = "Geri çekil ve kalk!",
	action = "Herhangi bir iþlem yapýn!",
	naction = "Hiçbir þey yapmayýn!",
	math = "1 + 1 ne kadar?",
	ds = "Dans ve sit!",
	seq4 = "Dans et, otur, uyu ve alkışla!",
	spider = "Örümcek ağlarına dikkat!",
	key2 = "F4 tuþuna basýn!",
	clap = "5 kez ellerini çırp !"
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
elseif tfm.get.room.community == "fr" then
	text = lang.fr
elseif tfm.get.room.community == "tr" then
	text = lang.tr
else
	text = lang.en
end
function eventNewPlayer(name)
	rato=rato+1
	for k=17, 116 do
		tfm.exec.bindKeyboard(name,k,false,true)
	end
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			};
	data[name] = newData;
	tfm.exec.chatMessage(""..text.welcome.."",name)
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Use !pw [password] to change the password of the room and !run [@code] to run a custom map.<br><br>If you are a FunCorp member, type !fc to enable the FunCorp mode.",admin)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if active >= 0 and active <= 55 then
		vivo=vivo-1
		local i=0
		local name
		for pname,player in pairs(tfm.get.room.playerList) do
			if not player.isDead then
				i=i+1
				name=pname
			end
		end
		if i==0 then
			active=-1
		elseif i==1 then
			active=-1
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setGameTime(10)
		end
	end
	if active == 56 then
		data[name].c=1
		tfm.exec.respawnPlayer(name)
	end
	if active >= 57 then
		vivo=vivo-1
		local i=0
		local name
		for pname,player in pairs(tfm.get.room.playerList) do
			if not player.isDead then
				i=i+1
				name=pname
			end
		end
		if i==0 then
			active=-1
		elseif i==1 then
			active=-1
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setGameTime(10)
		end
	end
end
function selectMap()
	map_cat=map_cat+1
	if map_cat > 7 then
		map_cat=0;
	end
	if map_cat == 0 then
		tfm.exec.newGame(mapas.simple[math.random(#mapas.simple)])
	elseif map_cat == 1 then
		tfm.exec.newGame(mapas.scenarios[math.random(#mapas.scenarios)])
	elseif map_cat == 2 then
		tfm.exec.newGame(mapas.misc[math.random(#mapas.misc)])
	elseif map_cat == 3 then
		tfm.exec.newGame(mapas.arts[math.random(#mapas.arts)])
	elseif map_cat == 4 then
		tfm.exec.newGame(mapas.mech[math.random(#mapas.mech)])
	elseif map_cat == 5 then
		tfm.exec.newGame(mapas.geek[math.random(#mapas.geek)])
	elseif map_cat == 6 then
		tfm.exec.newGame(mapas.testing[math.random(#mapas.testing)])
	elseif map_cat == 7 then
		tfm.exec.newGame(mapas.troll[math.random(#mapas.troll)])
	end
end
function eventNewGame()
	ui.removeTextArea(0,nil)
	ui.removeTextArea(1,nil)
	ui.removeTextArea(2,nil)
	ui.removeTextArea(250,nil)
	rodada=0
	active=0
	vivo=0
	rato=0
	dificuldade=1
	if unlocked == true then
		tfm.exec.setGameTime(15)
	else
		tfm.exec.setGameTime(36000)
	end
	for name,player in pairs(tfm.get.room.playerList) do
		vivo=vivo+1
		rato=rato+1
		if data[name] then
			data[name].c=0
			data[name].key=0
		end
	end
	rodadas=math.floor(20+(rato/3.5))
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
	tfm.exec.setNameColor(admin,0xff0000)
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	if fc_mode == false then
		active=math.random(1,67)
	else
		active=tonumber(fc_cmds[math.random(#fc_cmds)])
	end
	getCommand()
end
function eventChatCommand(name,message)
	if name == "Nasus_assassin#1534" or name == "Forzaldenon#0000" or name == "Hecarimjhenx#0000" or name == admin then
		if(message:sub(0,7) == "command") then
				active=tonumber(message:sub(9))
				getCommand()
		end
		if(message:sub(0,4) == "mapa") then
			tfm.exec.newGame(message:sub(6))
			active=0
		end
		if(message:sub(0,1) == "q") then
			q=message:sub(3)
		end
		if(message:sub(0,1) == "a") then
			a=message:sub(3)
		end
		if(message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if(message:sub(0,1) == "t") then
			qtime=tonumber(message:sub(3))
		end
		if(message:sub(0,3) == "run") then
			tfm.exec.newGame(message:sub(5))
			active=0
		end
		if(message:sub(0,5) == "limit") then
			tfm.exec.setRoomMaxPlayers(tonumber(message:sub(7)))
		end
		if(message:sub(0,2) == "pw") then
			tfm.exec.setRoomPassword(tostring(message:sub(4)))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
		if message == "fc" then
			if fc_mode == false then
				fc_mode=true
				tfm.exec.chatMessage("<R>The FunCorp mode of this module is now enabled.")
			else
				fc_mode=false
				tfm.exec.chatMessage("<R>The FunCorp mode of this module is now disabled.")
			end
		end
	end
end
function showCommand(id,text)
	ui.addTextArea(0,"<font face='Yu Gothic,Arial'><font color='#202020'>#"..id.." <font size='16'><p align='center'><b>"..text.."",nil,25,372,750,24,0xd1d1d1,0x161616,0.96,true)
end
function whiteSquare(x)
	ui.addTextArea(1,"",nil,x,320,80,65,0xffffff,0xffffff,0.68,false)
end
function verticalRectangle(x)
	ui.addTextArea(1,"",nil,x,0,80,400,0xffffff,0xffffff,0.68,false)
end
function horizontalRectangle(y)
	ui.addTextArea(1,"",nil,0,y,1600,60,0xffffff,0xffffff,0.68,false)
end
function getCommand()
	rodada=rodada+1
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].c=0
		data[name].s=0
	end
	if active == 1 then
		showCommand(active,text.dancar)
		tfm.exec.setGameTime(5)
	end
	if active == 2 then
		showCommand(active,text.sentar)
		tfm.exec.setGameTime(5)
	end
	if active == 3 then
		showCommand(active,text.confetar)
		tfm.exec.setGameTime(6)
	end
	if active == 4 then
		showCommand(active,text.mouse)
		tfm.exec.setGameTime(5)
	end
	if active == 5 then
		showCommand(active,text.beijos)
		tfm.exec.setGameTime(15)
	end
	if active == 6 then
		showCommand(active,text.dormir)
		tfm.exec.setGameTime(5)
	end
	if active == 7 then
		showCommand(active,text.raiva)
		tfm.exec.setGameTime(5)
	end
	if active == 8 then
		showCommand(active,text.chorem)
		tfm.exec.setGameTime(5)
	end
	if active == 9 then
		showCommand(active,text.esquerda)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 10 then
		showCommand(active,text.direita)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 11 then
		showCommand(active,text.digitar)
		tfm.exec.setGameTime(7)
	end
	if active == 12 then
		showCommand(active,text.falar)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 13 then
		showCommand(active,text.pular)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 14 then
		showCommand(active,text.mexer)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 15 then
		showCommand(active,text.bandeira)
		tfm.exec.setGameTime(8)
	end
	if active == 16 then
		showCommand(active,text.ano)
		tfm.exec.setGameTime(5)
	end
	if active == 17 then
		showCommand(active,text.vesquerda)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 18 then
		showCommand(active,text.vdireita)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 19 then
		xpos=math.random(60,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		whiteSquare(xpos)
	end
	if active == 20 then
		xpos=math.random(60,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		verticalRectangle(xpos)
	end
	if active == 21 then
		xpos=math.random(60,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		verticalRectangle(xpos)
	end
	if active == 22 then
		ypos=math.random(40,300)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		horizontalRectangle(ypos)
	end
	if active == 23 then
		ypos=math.random(40,300)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		horizontalRectangle(ypos)
	end
	if active == 24 then
		showCommand(active,text.preesquerda30)
		tfm.exec.setGameTime(8)
	end
	if active == 25 then
		showCommand(active,text.predireita30)
		tfm.exec.setGameTime(8)
	end
	if active == 26 then
		showCommand(active,text.preesquerda60)
		tfm.exec.setGameTime(12)
	end
	if active == 27 then
		showCommand(active,text.predireita60)
		tfm.exec.setGameTime(12)
	end
	if active == 28 then
		showCommand(active,text.espaco)
		tfm.exec.setGameTime(8)
	end
	if active == 29 then
		showCommand(active,text.nome)
		tfm.exec.setGameTime(10)
	end
	if active == 30 then
		showCommand(active,text.ndance)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 31 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		whiteSquare(xpos)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 32 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 33 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 34 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		showCommand(active,text.retangulov)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		showCommand(active,text.abaixar)
		tfm.exec.setGameTime(7)
	end
	if active == 36 then
		showCommand(active,text.action)
		tfm.exec.setGameTime(8)
	end
	if active == 37 then
		showCommand(active,text.ds)
		tfm.exec.setGameTime(10)
	end
	if active == 38 then
		showCommand(active,text.key1)
		tfm.exec.setGameTime(8)
	end
	if active == 39 then
		showCommand(active,text.action1)
		tfm.exec.setGameTime(10)
	end
	if active == 40 then
		showCommand(active,text.laugh)
		tfm.exec.setGameTime(5)
	end
	if active == 41 then
		showCommand(active,text.laugh2)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 42 then
		showCommand(active,text.stone)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		for i=1,24 do
			tfm.exec.addShamanObject(85,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 43 then
		showCommand(active,text.noob)
		tfm.exec.setGameTime(10)
	end
	if active == 44 then
		showCommand(active,text.action2)
		tfm.exec.setGameTime(9)
	end
	if active == 45 then
		showCommand(active,text.jump)
		tfm.exec.setGameTime(5)
	end
	if active == 46 then
		xpos=math.random(60,700)
		local xpos2=math.random(60,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 47 then
		number=math.random(10000000,99999999)
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(11)
	end
	if active == 48 then
		showCommand(active,text.key)
		tfm.exec.setGameTime(5)
	end
	if active == 49 then
		showCommand(active,text.jump2)
		tfm.exec.setGameTime(9)
	end
	if active == 50 then
		showCommand(active,text.action3)
		tfm.exec.setGameTime(8)
	end
	if active == 51 then
		showCommand(active,text.area)
		ui.addTextArea(250,"<a href='event:command51'>CLICK HERE",nil,math.random(100,700),math.random(50,350),100,25,0,0,1.0,true)
		tfm.exec.setGameTime(10)
	end
	if active == 52 then
		showCommand(active,text.dancing)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
			tfm.exec.playEmote(name,0)
		end
		tfm.exec.setGameTime(15)
	end
	if active == 53 then
		showCommand(active,text.freeze)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
			tfm.exec.freezePlayer(name,true)
		end
		tfm.exec.setGameTime(5)
	end
	if active == 54 then
		showCommand(active,text.transform)
		tfm.exec.setGameTime(10)
	end
	if active == 55 then
		showCommand(active,text.down1)
		tfm.exec.setGameTime(9)
	end
	if active == 56 then
		showCommand(active,text.kill)
		tfm.exec.setGameTime(10)
	end
	if active == 57 then
		xpos=math.random(60,700)
		xpos2=math.random(60,700)
		showCommand(active,text.quadradoa)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 58 then
		showCommand(active,text.naction)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		tfm.exec.setGameTime(10)
	end
	if active == 59 then
		showCommand(active,text.nchorem)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		tfm.exec.setGameTime(7)
	end
	if active == 60 then
		showCommand(active,text.math)
		tfm.exec.setGameTime(8)
	end
	if active == 61 then
		showCommand(active,text.seq4)
		tfm.exec.setGameTime(13)
	end
	if active == 62 then
		showCommand(active,text.spider)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		tfm.exec.setGameTime(10)
		for i=1,6 do
			tfm.exec.addPhysicObject(i, math.random(100,700), math.random(50,350), spiderweb)
		end
	end
	if active == 63 then
		showCommand(active,text.key2)
		tfm.exec.setGameTime(10)
	end
	if active == 64 then
		xpos=math.random(60,700)
		xpos2=math.random(60,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 65 then
		showCommand(active,text.preesquerda15)
		tfm.exec.setGameTime(6)
	end
	if active == 66 then
		showCommand(active,text.predireita15)
		tfm.exec.setGameTime(6)
	end
	if active == 67 then
		showCommand(active,text.clap)
		tfm.exec.setGameTime(9)
	end
	if active == 99 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "command51" then
		data[name].c=1
		ui.removeTextArea(250,name)
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		if string.len(message) >= 2 then
			data[name].c=1
		end
	end
	if active == 12 or active == 14 or active == 59 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2020" then
			data[name].c=1
		else
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if string.upper(message) == string.upper(name) then
			data[name].c=1
		end
	end
	if active == 41 then
		if string.find(message,"k") or string.find(message,"K") or string.find(message,"ha") or string.find(message,"HA") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 43 then
		if string.upper(message) == "EU SOU NOOB" or string.upper(message) == "I AM NOOB" or string.upper(message) == "BEN NOOB" then
			data[name].c=1
		end
		if string.find(message,"PRO") or string.find(message,"pro") or string.find(message,"Pro") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 47 then
		if message == tostring(number) then
			data[name].c=1
		end
	end
	if active == 60 then
		if message == "2" then
			data[name].c=1
		end
	end
	if active == 99 then
		if string.upper(message) == string.upper(a) then
			data[name].c=1
		end
	end
end
function eventEmotePlayed(name,id)
	if active == 1 then
		if id == 0 or id == 10 then
			data[name].c=1
		end
	end
	if active == 2 then
		if id == 8 then
			data[name].c=1
		end
	end
	if active == 3 then
		if id == 9 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
	if active == 5 then
		if id == 3 then
			data[name].s=data[name].s+1
			if data[name].s >= 10 then
				data[name].c=1
			end
		end
	end
	if active == 6 then
		if id == 6 then
			data[name].c=1
		end
	end
	if active == 7 then
		if id == 4 then
			data[name].c=1
		end
	end
	if active == 8 then
		if id == 2 then
			data[name].c=1
		end
	end
	if active == 14 or active == 53 or active == 58 then
		tfm.exec.killPlayer(name)
	end
	if active == 15 then
		if id == 10 then
			data[name].c=1
		end
	end
	if active == 30 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 36 then
		data[name].c=1
	end
	if active == 37 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 39 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].c=1
		end
	end
	if active == 40 then
		if id == 1 then
			data[name].c=1
		end
	end
	if active == 41 then
		if id == 1 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 44 then
		if id == 2 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 1 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 50 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 54 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			data[name].c=1
		end
	end
	if active == 59 then
		if id == 2 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 61 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 5 and data[name].s == 3 then
			data[name].c=1
		end
	end
	if active == 67 then
		if id == 5 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		data[name].s=data[name].s+1
		if data[name].s >= 10 then
			data[name].c=1
		end
	end
end
function eventKeyboard(name,id,down,x,y)
	if active == 9 then
		if id == 37 or id == 65 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 10 then
		if id == 39 or id == 68 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 13 then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 24 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 25 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 26 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 27 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 28 then
		if id == 32 then
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
	end
	if active == 35 then
		if id == 40 or id == 83 then
			data[name].c=1
		end
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 38 then
		if id == 46 then
			data[name].c=1
		end
	end
	if active == 45 then
		if id == 38 or id == 87 then
			data[name].c=1
		end
	end
	if active == 48 then
		data[name].c=1
	end
	if active == 49 then
		if id == 38 or id == 87 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
	if active == 55 then
		if id == 40 or id == 83 then
			data[name].s=data[name].s+1
			if data[name].s >= 1 then
				data[name].c=1
			end
		end
	end
	if active == 59 then
		if id == 48 or id == 50 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 63 then
		if id == 115 then
			data[name].c=1
		end
	end
	if active == 65 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 66 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventLoop(passado,faltando)
	local tempo=math.floor(faltando/1000)
	if active == -2 then
		ui.setMapName("                        <N>"..text.mices.."  <BL>|  <N><b>Version RTM 6642.038</b><")
	elseif active == -1 then
		ui.setMapName("          <VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."  <BL>|  <N><b>Version RTM 6642.038</b><")
	end
	if active >= 0 then
		ui.setMapName("             "..tfm.get.room.currentMap.."  <BL>|  <N>"..text.mestre.."  <BL>|  <N>"..text.mice.." : <J>"..vivo.." / "..rato.."  <BL>|  <N>"..text.round.." : <J>"..rodada.."  <BL>|  <ROSE><b>Version RTM 6642.038</b><")
		if passado > 1200 and passado < 1700 and unlocked == true then
			tfm.exec.chatMessage(""..text.playingmap.." <J>"..tfm.get.room.currentMap.."<BL> "..text.created.." <J>"..tfm.get.room.xmlMapInfo.author)
		end
	end
	if rato < 4 then
		if tfm.get.room.currentMap == "@7692039" and unlocked == true then
			active=-2
			tfm.exec.setGameTime(8000)
		else
			if passado > 4000 and unlocked == true then
				tfm.exec.newGame("@7692039")
				tfm.exec.setGameTime(8000)
				tfm.exec.chatMessage("<R>"..text.mices.."",nil)
			end
		end
	end
	if rato >= 4 and passado >= 4000 then
		if tfm.get.room.currentMap == "@7692039" and unlocked == true then
			map_cat=-1
			selectMap()
			active=0
		end
	end
	if active < 0 and faltando < 1 and unlocked == true then
		selectMap()
	end
	if active == 0 and faltando < 1000 then
		if rodada < rodadas then
			sortearComandos()
		else
			active=-1
			tfm.exec.setGameTime(10)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(true)
				tfm.exec.playerVictory(true)
			end
		end
	end
	if active > 0 and faltando < 1 and rato >= 2 then
		if active == 17 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == true then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 18 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == false then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 19 or active == 31 or active == 32 or active == 57 or active == 64 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 32 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 20 or active == 33 or active == 34 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x < xpos or player.x > xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 21 or active == 46 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > xpos and player.x < xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 22 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < ypos-10 or player.y > ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 23 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y > ypos-10 and player.y < ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 52 then
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setNameColor(name,math.random(1,16777215))
			end
		end
		if active == 53 then
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.freezePlayer(name,false)
			end
		end
		ui.removeTextArea(0,nil)
		ui.removeTextArea(1,nil)
		ui.removeTextArea(2,nil)
		ui.removeTextArea(250,nil)
		for i=1,5 do
			tfm.exec.removePhysicObject(i)
		end
		active=0
		if rodada == 4 or rodada == 6 or rodada == 8 or rodada == 10 or rodada == 12 then
			dificuldade=dificuldade+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].key=0
			if data[name].c == 0 then
				tfm.exec.killPlayer(name)
			end
		end
		if fc_mode == false then
			if vivo > 4 then
				tfm.exec.setGameTime(6-dificuldade)
				else
				tfm.exec.setGameTime(9-dificuldade)
			end
		else
			tfm.exec.setGameTime(6)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].c == 1 then
				if not active == 52 then
					tfm.exec.setNameColor(name,0x00ff00)
				else
					tfm.exec.setNameColor(name,0xc2c2da)
				end
			end
		end
	end
end
tfm.exec.newGame("@7692039")
end

initTrueFalse = function()
blue_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0000ff,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xff0000,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 400,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(35)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
admin=""
for _,f in next,{"per","skip","limits","return","cancel","at","change","admin78"} do
	system.disableChatCommandDisplay(f)
end
current_mode=""
answer_time=20
remain_time=0
game_map="@7605289"
for name,player in pairs(tfm.get.room.playerList) do
	tfm.exec.setPlayerScore(name,0,false)
end
function eventNewGame()
	tfm.exec.setNameColor(admin,0xFF0000)
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in pairs(tfm.get.room.playerList) do
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
	ui.addPopup(10,0,"",nil,-1000,-1000,128,false)
	ui.addPopup(11,0,"",nil,-1100,-1000,128,false)
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setMapName("True or False II revision 3 Remaked by Spectra_phantom#6089<")
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Your commands:<br>!cancel = Skip the current shaman<br>!return = Cancel the current question<br>!limits = Change the limit of questions",name)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
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
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
		end
	end
	ui.setMapName("True or False II revision 3 Remaked by Spectra_phantom#6089<")
end
function isTrue()
	tfm.exec.chatMessage("<VP>The answer is TRUE!")
	tfm.exec.addPhysicObject(1, 585, -400, red_ground)
end
function isFalse()
	tfm.exec.chatMessage("<R>The answer is FALSE!")
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
			tfm.exec.chatMessage("Questions limit changed to "..limits.questions.." and time limit changed to "..limits.time.."")
		end
	end
	if id == 10 then
		if string.len(answer) >= 10 and string.len(answer) <= 170 then
			questions.question=answer
			ui.addPopup(11,1,"Click YES if your answer is TRUE<br>Click NO if your answer is FALSE",name,350,175,200,true)
		else
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
			tfm.exec.chatMessage("<R>Your question is too large or too short. Please type other question.",name)
		end
	end
	if id == 11 then
		if remain_time > 1 then
			questions.answer=answer
			questions.round=questions.round+1
			current_mode="truefalse"
			tfm.exec.setGameTime(answer_time)
			for name,player in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[name].isShaman then
					tfm.exec.movePlayer(name,400,330)
				else
					tfm.exec.movePlayer(name,400,1330)
				end
			end
			tfm.exec.chatMessage("<N>"..questions.question.."")
			ui.addTextArea(0,"<font size='16'><p align='center'><font face='Bahnschrift SemiLight,Segoe UI,Arial'>"..questions.question.."",nil,15,25,770,50,0x010101,0x010101,0.95,true)
			tfm.exec.chatMessage(questions.answer,"Spectra_phantom#6089")
			tfm.exec.chatMessage(questions.answer,"Forzaldenon#0000")
		end
	end
	if id == 20 then
		if answer == "yes" then
			reset()
			tfm.exec.chatMessage("<R>"..name.." skipped your turn.")
		end
	end
end
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Miss_fortune#9548" or name == "Aphelios#1910" or name == admin then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			if tonumber(message:sub(4)) >= 5 and tonumber(message:sub(4)) <= 30 then
				answer_time=tonumber(message:sub(4))
				tfm.exec.chatMessage("Answer time: "..answer_time.."s.")
			end
		end
		if(message:sub(0,7) == "admin78") then
			if current_mode == "waiting" then
				tfm.exec.setPlayerScore(message:sub(9),10001,false)
				reset()
			end
		end
		if message == "return" then
			if current_mode == "truefalse" then
				for name,player in pairs(tfm.get.room.playerList) do
					if not tfm.get.room.playerList[name].isShaman then
						tfm.exec.movePlayer(name,400,-100)
					end
				end
				current_mode="waiting"
				tfm.exec.setGameTime(60)
				tfm.exec.chatMessage("<R>This question has been cancelled.")
				ui.removeTextArea(0,nil)
			end
		end
		if message == "cancel" then
			if current_mode == "truefalse" or current_mode == "waiting" then
				for name,player in pairs(tfm.get.room.playerList) do
					tfm.exec.killPlayer(name)
				end
				reset()
				tfm.exec.chatMessage("<R>This shaman has been skipped.")
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
	if remaining < 1 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>Time is up! Other shaman will be choosed.")
	end
	if remaining < 1000 and current_mode == "truefalse" then
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
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > 400 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.movePlayer(name,400,-50)
				end
			end
		else
			for name,player in pairs(tfm.get.room.playerList) do
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
	if remaining < 55000 and limits.mices_alive <= 0 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>No winners!")
	end
	if remaining < 55000 and limits.mices_alive == 1 and current_mode == "waiting" then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead and not tfm.get.room.playerList[name].isShaman then
				tfm.exec.setPlayerScore(name,10000,false)
				reset()
			end
		end
	end
	if remaining < 55000 and remaining >= 54400 and limits.mices_alive >= 2 and questions.round >= 1 and current_mode == "waiting" then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y)
			end
		end
		if questions.round >= limits.questions and current_mode == "waiting" then
			reset()
			tfm.exec.chatMessage("<R>Questions limit reached!")
		end
	end
	if time > limits.time*60000 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>Time limit reached!")
	end
end
reset()
end

initFall2 = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.setRoomMaxPlayers(22)
xml2=''
creator=""
position=0
objective=60
enabled=false
map=""
mapas={"@7411648","@7568910","@7410842","@7568917","@7568919","@7568922","@7568923","@7568928","@7568964","@7568967","@7568965","@7354962","@7569413","@7721624","@6621726","@6316396"}
system.disableChatCommandDisplay("obj")
lobby="@7404106"
changed=false
function eventChatCommand(name,message)
	if(message:sub(1,3) == "obj") then
		if name == "Jhinsword350#0000" or name == "Azirdeathray#0000" or name == "Spectra_phantom#6089" then
			objective=tonumber(message:sub(5))
			tfm.exec.chatMessage("<J>Objective changed to: "..objective,name)
		end
	end
end
function eventNewGame()
	if enabled == true then
		position=0
		if changed == false and enabled == true then
			xml2=tfm.get.room.xmlMapInfo.xml
			creator=tfm.get.room.xmlMapInfo.author
			map=tfm.get.room.currentMap
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	else
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.4",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.4! Script made by <b>Azirdeathray#0000</b>.<")
		tfm.exec.setGameTime(60)
	end
end
function eventLoop(p,f)
	if p >= 5000 and p <= 6000 and changed == false and enabled == true then
		tfm.exec.newGame(xml2)
		changed=true
		ui.setMapName("<J>#fall 2.4   <BL>|   <J>"..creator.." <BL>- "..map.."   <BL>|   <J>Objective : <J>"..objective.." points<")
	end
	if f <= 1 and enabled == true then
		changed=false
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if enabled == false and f >= 1000 then
		ui.addTextArea(11,"<font face='Eras Demi ITC'><font size='18'><font color='#ffff00'>Get ready! The match will start on "..math.floor(f/1000).." seconds.",nil,220,370,600,32,0,0,1.0,true)
	end
	if f <= 10000 and f >= 9000 and enabled == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
			changed=false
		end
	end
	if f <= 1 and enabled == false then
		for i=10,11 do
			ui.removeTextArea(i,nil)
		end
		enabled=true
		tfm.exec.newGame(mapas[math.random(#mapas)])
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].score >= objective and enabled == true then
			enabled=false
			tfm.exec.newGame(lobby)
			tfm.exec.chatMessage("<VP><b>Congratulations!</b> "..name.." wins the game with "..tfm.get.room.playerList[name].score.." points!")
		end
	end
end
function eventPlayerWon(name)
	position=position+1
	if position == 1 then
		tfm.exec.setGameTime(20)
	end
	if position <= 8 then
		tfm.exec.setPlayerScore(name,10-position,true)
		tfm.exec.chatMessage("+ "..tostring(10-position).." points",name)
	else
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.chatMessage("+ 1 points",name)
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
	end
end
function eventNewPlayer(name)
	if enabled == false then
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.4",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.4! Script made by <b>Azirdeathray#0000</b>.<")
	end
	tfm.exec.chatMessage("<J>Welcome to the #fall2 module!<br><br>The objective of this room is fall to the end of the map!<br>The player that score more points will win the game!<br><br><R>WARNING: This script require at least 3GB of RAM to work without problems.<J><br><br>Script made by Azirdeathray#0000",name)
end
tfm.exec.newGame(lobby)
end

initCd = function()
-- NÃO SE ESQUEÇA DE COLOCAR O SEU NOME NA LINHA 3 ANTES DE INICIAR!!
-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.
admin="" -- colocar seu nome aqui, funcorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
data={}
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
modo="inicial"
mapa="@7710965"
contador=0
tfm.exec.setRoomMaxPlayers(48)
system.disableChatCommandDisplay("reiniciar")
system.disableChatCommandDisplay("help")
function eventChatCommand(name,comando)
	if comando == "reiniciar" and name == admin then
		tfm.exec.newGame(mapa)
	end
	if comando == "help" then
		tfm.exec.chatMessage("Bem-vindo ao module Cidade Dorme. Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas. O jogo irá explicar tudo enquanto a partida ocorre.",name)
	end
end
function eventNewGame()
	ui.setMapName("Cidade Dorme v3! Versão RTM 0907.001 gerenciada por Rakan_raster#0000.<")
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in pairs(tfm.get.room.playerList) do
		jogadores.vivos=jogadores.vivos+1
		data[string.lower(name)]={type=0,morre=false}
		table.insert(jogadores.lista,string.lower(name))
		if string.find(tfm.get.room.name,name) then
			admin=name
			tfm.exec.chatMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar a partida.")
		end
	end
end
function escolherAssasinos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=1
		quant.assasinos=quant.assasinos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como assasino(a). Sua função será matar os outros jogadores. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherMedicos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=2
		quant.medicos=quant.medicos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como médico(a). Sua função será salvar os jogadores dos assasinos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherDetetives(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=3
		quant.detetives=quant.detetives+1
		tfm.exec.chatMessage("Você foi escolhido(a) como detetive. Sua função será descobrir e matar os assasinos vivos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function eventNewPlayer(name)
	data[string.lower(name)]={type=-1,morre=false}
	tfm.exec.chatMessage("Espere a próxima partida para jogar.",name)
end
function eventPlayerDied(name)
	if data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=-1
	end
	if data[string.lower(name)].type == 1 then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 then
		quant.detetives=quant.detetives-1
	end
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	jogadores.vivos=jogadores.vivos-1
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	if data[string.lower(name)].type == 1 and not tfm.get.room.playerList[name].isDead then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 and not tfm.get.room.playerList[name].isDead then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 and not tfm.get.room.playerList[name].isDead then
		quant.detetives=quant.detetives-1
	end
	data[string.lower(name)].type=-1
end
function definirLimites()
	if jogadores.vivos < 10 then
		limites.assasinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 10 and jogadores.vivos < 16 then
		limites.assasinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 16 and jogadores.vivos < 22 then
		limites.assasinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 22 and jogadores.vivos < 28 then
		limites.assasinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 28 and jogadores.vivos < 38 then
		limites.assasinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 38 then
		limites.assasinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
	sortearDetetives()
end
function sortearAssasinos()
	for i=1,limites.assasinos do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherAssasinos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos vivos: <R><b>"..quant.assasinos.."</b>  <BL>|  <J>Detetives vivos: <VP><b>"..quant.detetives.."</b>  <BL>|  <N>Versão RTM 0907.001<")
	end
	if contador == 1 then
		if admin == "" then
			tfm.exec.chatMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00cd3#Rakan_raster#0000</b><br><br>Em caso de un FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
		else
			if jogadores.vivos >= 5 then
				tfm.exec.chatMessage("<J>Bem-vindos ao module Cidade Dorme v3. Neste module vocês deverão descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas.<br><br>Module gerenciado por Rakan_raster#0000.<br><br>A partida será iniciada em 30 segundos.")
			else
				tfm.exec.chatMessage("<R>Número insuficiente de jogadores na sala. O script requer pelo menos 5 jogadores.")
				contador=-30
			end
		end
	end
	if contador == 35 then
		if jogadores.vivos >= 5 then
			tfm.exec.chatMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><R>POR FAVOR, NINGUÉM DIGA QUEM É QUEM PORQUE ESTRAGA O JOGO!!")
			definirLimites()
		else
			tfm.exec.chatMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=980
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)].type == 0 then
				tfm.exec.chatMessage("<J>Você foi escolhido como vítima.",name)
			end
		end
	end
	if contador == 48 then
		tfm.exec.chatMessage("<J>A rodada será iniciada em 10 segundos! SE PREPAREM!")
		jogadores.vitimas=0
	end
	if contador == 58 then
		tfm.exec.chatMessage("<VP>O JOGO COMEÇOU!")
	end
	if contador == 62 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
			end
		end
	end
	if contador == 92 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,0,"",name,-1710,325,20,true)
			end
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 122 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,0,"",name,-1710,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Hora da verdade... VAMOS VER QUEM MORREU")
	end
	if contador == 127 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
		if jogadores.vitimas == 0 then
			tfm.exec.chatMessage("<VP>Ufa! Ninguém foi morto!")
		end
	end
	if contador == 135 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 140 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 170 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,0,"",name,-1910,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 175 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 180 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=42
		end
	end
	if contador >= 1000 then
		tfm.exec.newGame(mapa)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 60 and contador <= 93 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			jogadores.vitimas=jogadores.vitimas-1
			tfm.exec.chatMessage("Você decidiu matar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
		end
	end
	if id == 102 and contador >= 90 and contador <= 123 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			if data[string.lower(message)].morre == true then
				data[string.lower(message)].morre=false
				jogadores.vitimas=jogadores.vitimas+1
			end
			tfm.exec.chatMessage("Você decidiu salvar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou salvar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
	if id == 103 and contador >= 138 and contador <= 171 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			tfm.exec.chatMessage("Você acha que "..message.." é o assasino.",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
end
tfm.exec.newGame(mapa)
end

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7692039")
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00mestre<br>/room #anvilwar00truefalse<br>/room #anvilwar00fall2<br>/room #anvilwar00cd<br><br>Do you want to see your module here? Please contact Spectra_phantom#6089 or Rakan_raster#0000.")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00mestre<br>/room #anvilwar00truefalse<br>/room #anvilwar00fall2<br>/room #anvilwar00cd<br><br>Do you want to see your module here? Please contact Spectra_phantom#6089 or Rakan_raster#0000.")
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.122<br>By Spectra_phantom#6089 and Nasus_assassin#1534")
if string.find(tfm.get.room.name,"*") then
	tfm.exec.chatMessage("<ROSE><b>Tribehouse detected. Only #anvilwar will be available in English.</b>")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
		tfm.exec.chatMessage("<R>Not allowed")
	elseif string.find(tfm.get.room.name,"mestre") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'mestre' on room name.<br>Initialising submodule #mestre...")
		initMestre()
	elseif string.find(tfm.get.room.name,"truefalse") or string.find(tfm.get.room.name,"true_false") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'truefalse' on room name.<br>Initialising submodule #truefalse...")
		initTrueFalse()
	elseif string.find(tfm.get.room.name,"fall2") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'fall2' on room name.<br>Initialising submodule #fall2...")
		initFall2()
	elseif string.find(tfm.get.room.name,"cd") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'cd' on room name.<br>Initialising submodule #cd...")
		initCd()
	elseif string.find(tfm.get.room.name,"rooms") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'rooms' on room name.<br>Showing available #anvilwar rooms.")
		Rooms()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
