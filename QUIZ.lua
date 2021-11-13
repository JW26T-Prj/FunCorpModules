-- Mudanças na Versão 2.10.0:
-- Adição de novo tema de perguntas: música!
-- Ajustes nos temporizadores
-- Mudanças em algumas perguntas

-- Script de Quiz de perguntas feito por Reksai_void2600#6638, versão 2.10.0
-- Por favor, edite a linha 20 a variável 'admin' pelo seu nome para ter acesso aos comandos.
-- Você pode selecionar o tema editando a linha 21.
-- Temas:
-- 0 = transformice
-- 1 = conhecimentos gerais
-- 2 = música
-- 3 = animes (em breve)

-- Para adicionar novas perguntas, utilize a seguinte sintaxe na hora de inserir: "PERGUNTA","RESPOSTA 1","RESPOSTA 2",1 ou 2
-- Para sugestões de perguntas ou correção de bugs contate Reksai_void2600#6638.
-- Caso queira pular alguma pergunta por estar muito repetida ou algo do tipo, use o comando !random.
-- Caso você queira usar este código em um cafofo de tribo, altere a variável TRIBEHOUSE da linha 22 para 'true'.

admin="Reksai_void2600#6638" -- COLOQUE SEU NOME!
tema=0 -- Edite conforme mostrado acima!
tribehouse=false -- Altere para 'true' caso esteja rodando este código em um cafofo de tribo.

piso={type = 6,width = 350,height = 40,foregound = 1,friction = 1.0,restitution = 0.0,angle = 0,color = 0,miceCollision = true,groundCollision = true,dynamic = false}
barreira={type = 12,width = 20,height = 100,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xffffff,miceCollision = true,groundCollision = true,dynamic = false}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
ratos=0
vivos=0
set_q=0
system.disableChatCommandDisplay("random")
system.disableChatCommandDisplay("setq")
system.disableChatCommandDisplay("limite")
perguntas={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Em que ano o Transformice foi criado?","2009","2010",2,
"Qual dessas categorias de mapa representa um mapa excluído?","P43","P44",2,
"Qual destas tags é atribuída aos administradores do Transformice?","#0000","#0001",2,
"Quantos morangos são necessários para trocar de nickname no Transformice","1500","2500",1,
"Quantos queijos no perfil são necessários para rodar scripts LUA no cafofo?","100","1000",1,
"Se você digitar /cafe, o que acontece?","Abre o café","Faz aparecer cafés voadores",2,
"Quantos morangos custa o item mais caro da loja?","550","600",1,
"Funcorps fazem parte da Staff BR.","Verdadeiro","Falso",2,
"Qual a categoria atribuída a mapas de Survivor?","P10","P12",1,
"Qual a função do comando /langue?","Muda a linguagem do jogo","Muda você de sala",1,
"Qual destes jogos não foi feito pela Atelier 801?","Bombom","Fortoresse",1,
"Qual o limite máximo de amigos do Transformice?","500","1000",1,
"Há quantos emoticons no Transformice?","10","14",1,
"Há quantas ações de rato no Transformice?","10","14",2,
"Qual o nome do antigo modo do module #deathmatch?","Baffbotffa","Baffbot",1,
"A partir de qual nível todas as habilidades de shaman são desbloqueadas?","20","30",1,
"O que acontece se você digitar /version?","Mostra informações do jogo","Abre a versão do jogo",2,
"Qual título é desbloqueado quando você consegue 40.000 firsts?","RELÂMPAGO","Mestre do Vento",1,
"Existem quantas habilidades de Shaman no Transformice?","75","65",1,
"O jogo Transformice foi desenvolvido em qual país?","EUA","França",2,
"Qual destas tags é atribuída aos Modsents do Transformice?","#0010","#0015",2,
"Qual o nome da Deusa Shaman do Transformice?","Elise","Elisah",2,
"Qual destes modules foi desenvolvido por Sharpiepoops, pioneiro nos modules do Transformice?","#keyhunt","#campal",1,
"Originalmente no Transformice era possível criar mapas com quantos tipos de pisos?","5","8",1,
"Quem é o criador atual do module True or False?","Spectra_phantom#6089","Haxhhhhhhhhh#0000",1,
"Qual o nome da empresa que é responsável pelo Transformice?","Atelier 801","Riot Games",1,
"Qual destes pregos não pode ser utilizado no modo difícil?","Vermelho","Amarelo",1,
"Há quantas categorias de itens na loja?","16","17",2,
"Em que ano o Transformice atingiu seu número máximo de jogadores ativos?","2012","2013",1,
"Quantos queijos custa a exportação de um mapa como cafofo da tribo?","5","40",1,
"Quantos jogos a Atelier 801 tem atualmente?","5","6",2,
"Qual é a fricção e a restituição, respectivamente, de um piso de chocolate?","20 e 0","0 e 20",1,
"Qual destes usuários é responsável pelo module #anvilwar?","Jessiewind26#2546","Spectra_phantom#6089",2,
"Qual destes usuários é responsável pelo module #batata?","Laagaadoo#0000","Ikke#0095",1,
"Qual destes comandos é utilizado para a inserção de um código especial da Japan Expo?","/lua","/code",2,
"A habilidade 'Meep!' faz parte de qual árvore de Habilidades?","Selvagem","Físico",1,
"Qual a categoria atribuída a mapas de Cafofo da Tribo?","P22","P20",1,
"FunCorps são capazes de rodar scripts LUA em salas que não são de modules.","Verdadeiro","Falso",1,
"O cargo de Modsent é atribuído a jogadores que são...","Moderadores e Funcorps","Moderadores e Sentinelas",2,
"Quem é o gerenciador atual do module #pictionary?","Shamousey#0015","Ork#0015",1,
"Quantas árvores de habilidades de shaman existem no Transformice?","3","5",2,
"Qual o nome do cargo pré-definido do criador de uma tribo?","Shaman da Tribo","Líder Espiritual",2,
"Qual o nome do título que a Melibellule usa?","La Belette","Fromadmin",2,
"Qual a sigla dada ao 'banimento' permanente de uma conta do servidor?","BoS","Permaban",1,
"Em qual module você precisa se esconder atrás das decorações do mapa?","#prophunt","#hidenseek",2,
"Qual o nome da equipe que é responsável pela categorização de mapas do Transformice?","Module Team","MapCrew",2,
"Quantas vezes você precisa completar um mapa bootcamp para ele ser contabilizado no perfil, quando você acaba de entrar na sala?","1","2",2,
"Usuários do servidor BR eram proibidos de falar no antigo servidor EN1.","Verdadeiro","Falso",2,
"Usuários do servidor BR eram proibidos de falar no antigo servidor EN2.","Verdadeiro","Falso",1,
"O Transformice já fez, em 2019, um evento baseado em anime.","Verdadeiro","Falso",2,
"No Transformice, os ratos que tocarem em um piso ácido...","Ficam presos nele","Morrem instantaneamente",2,
"Qual o nome do criador do module que estamos jogando agora?","Reksai_void2600#6638","Patrick_mahomes#1795",1,
"A habilidade 'Reparadora' faz parte de qual árvore de Habilidades?","Mecânico","Físico",2,
"A mensagem de reinício do servidor do Transformice aparece em qual cor?","Rosa","Roxo",1,
"Quantos queijos custa o pelo mais caro da loja?","10000","8000",1,
"Quantos ratos salvos são necessários para desbloquear o modo difícil?","1000","2000",1,
"O Transformice possui uma série animada de desenhos no YouTube.","Verdadeiro","Falso",1,
"A técnica chamada 'time deviation' ou 'clock drift' pode deixar seu rato mais rápido ou lento sem uso de hack.","Verdadeiro","Falso",1,
"A habilidade 'Anjo' faz parte de qual árvore de Habilidades?","Mecânico","Mestre do Vento",2,
"Vanilla, Survivor e Defilante são modules do Transformice.","Verdadeiro","Falso",2,
"Quantos ratos salvos são necessários para desbloquear o modo divino?","5000","10000",1,
"Os membros da Staff podem entrar nos cafofos das tribos, mesmo não sendo membro delas.","Verdadeiro","Falso",1,
"Japan Expo é o nome de um evento do Transformice que acontece em qual país?","Japão","França",2,
"Qual dessas tags é atribuída aos Funcorps do Transformice?","#0015","Não tem tag definida",2,
"Qual dessas tags é atribuída aos MapCrews do Transformice?","#0020","Não tem tag definida",1,
"Qual destes comandos é utilizado para a inserção de um script LUA?","/lua","/code",1,
"Qual destes eventos não é mais utilizado no Transformice?","Carnaval","Natal",1,
"A habilidade 'Superstar' faz parte de qual árvore de Habilidades?","Selvagem","Guia Espiritual",2,
"Qual destes usuários nunca se tornou Funcorp?","Shamousey#0015","Bolodefchoco#0015",1,
"Se você ficar muito tempo dentro da água no Transformice, você morre automaticamente.","Verdadeiro","Falso",2,
"É possível ganhar queijos na loja apenas jogando modules.","Verdadeiro","Falso",1,
"Qual categoria de mapas é atribuída aos mapas de Defilante?","P18","P19",1,
"Qual o nome da equipe que é responsável pelos modules do Transformice?","Module Team","MapCrew",1,
"Qual categoria de mapas é atribuída aos mapas Racing?","P7","P17",2,
"Qual destes modules foi feito por um brasileiro?","#football","#parkour",2,
"Qual o nome do título que o Tigrounette usa?","La Belette","Les Populaires",1,
"A habilidade 'Espírito Ancestral' faz parte de qual árvore de Habilidades?","Guia Espiritual","Mestre do Vento",1,
"Quantos queijos custa a compra de um 2ª visual de roupas no Transformice?","100","1000",2,
"Quem é o criador do module #circuit?","Bolodefchoco#0015","Ninguem#0095",2,
"Quantos queijos custa a customização de uma roupa no Transformice?","2000","4000",1,
"Em qual ano estreou o sistema de missões no Transformice?","2019","2020",1,
"Em qual ano estreou o evento de Pesca do Transformice?","2011","2012",2,
"Quem foi o primeiro gerenciador do module Mestre Mandou?","Haxhhhhhhhhh#0000","Jessiewind26#2546",2,
"Quantos queijos custa a customização de um item de shaman no Transformice?","2000","4000",2,
"Qual o nome da plataforma de execução que o Transformice utiliza?","Adobe Air","Adobe Flash Player",2,
"Qual é o limite de taxa de quadros que o Transformice pode operar?","60 fps","Depende do cliente",1,
"É possível ganhar queijos no perfil apenas jogando modules.","Verdadeiro","Falso",2,
"É possível coletar estatísticas no perfil jogando quais modos oficiais?","Survivor, Racing e Vanilla","Survivor, Racing e Defilante",2,
"É possível comprar morangos pelo celular no Brasil.","Verdadeiro","Falso",2,
"Usuários do servidor BR podem falar apenas no servidor brasileiro.","Verdadeiro","Falso",2,
"A habilidade 'Olho de Águia' faz parte de qual árvore de Habilidades?","Mecânico","Mestre do Vento",1,
"Em qual ano estreou o module #batata?","2013","2014",2,
"Em qual ano estreou o modo Defilante?","2014","2015",1,
"Qual modo do Transformice foi desativado devido a limitação dos vídeos no Transformice?","Music","Nekodancer",1,
"Em qual ano estreou o fórum em HTML5 do Atelier 801?","2015","2016",1,
"Usuários comuns não podem criar mapas nos quais os shamans possam usar portais.","Verdadeiro","Falso",2,
"Qual é a fricção e a restituição, respectivamente, de um piso de lava?","20 e 0","0 e 20",2,
"Apenas membros da Staff do Transformice podem criar mapas no modo Noite.","Verdadeiro","Falso",2,
"Qual a tribo do Tigrounette?","Lute como uma garota","Les Populaires",2,
"É necessário vincular uma conta de e-mail quando você cria novas contas no Transformice.","Verdadeiro","Falso",1,
"Qual título é desbloqueado quando você consegue 20.000 firsts?","RELÂMPAGO","Mestre do Vento",2,
"Qual título é desbloqueado quando você cria uma conta no Transformice?","Alpha & Ômega","Ratinho",2,
"É possível ganhar uma medalha exclusiva quando você entra no Transformice pela Steam.","Verdadeiro","Falso",1,
"Há quantos tipos de piso no Transformice?","16","18",2,
"Quantos pregos para o Shaman existem no Transformice?","3","5",2,
"Qual desses objetos de shaman é maior em altura?","Tábua gigante","Caixa grande",2,
"Quantos tamanhos de tábua existem no Transformice?","4","3",1,
"Em qual ano estreou o evento de Halloween do Transformice?","2011","2010",2,
"Para se usar o comando /lua no cafofo da tribo, você precisa ter a permissão de...","Usar o /np no cafofo","Mudar o cafofo da tribo",1,
"É possível deixar os pisos invisíveis no Transformice","Verdadeiro","Falso",1,
"Qual a idade mínima para virar MapCrew no Transformice?","18","Não tem idade mínima",2,
"Qual título é desbloqueado quando você consegue 1 bootcamp?","Principiante","Recruta",2,
"Qual foi a maior quantidade de pessoas logadas no Transformice, aproximadamente?","100000","85000",2,
"Qual o nick dos criadores do Transformice?","Melibellule e Tigrounette","Mellibellule e Trigrounette",1,
"Quem é o gerenciador atual do module Mestre Mandou?","Rakan_raster#0000","Xayah_raster#0000",1,
"Quem é o criador do module O Chão é Lava?","Sett#6442","Osicat#0000",2,
"Qual o limite de consumíveis que podem ser armazenados no inventário?","80","200",1,
"Qual o nome do antigo fun-site no qual você poderia acessar um Ranking dos ratos?","Cheese For Mice","Viprin Drawing Editor",1,
"Qual o limite de jogadores em uma tribo no Transformice?","2000","5000",2,
"Qual o comando que serve para ver as combinações de roupa do jogo?","/dressing","/shop",1,
"O dono de uma tribo pode exibir mensagens no chat utilizando o comando /lua no cafofo da tribo.","Verdadeiro","Falso",2,
"Em qual ano estreou o evento de Natal do Transformice?","2011","2010",2,
"Qual é o primeiro nome do Tigrounette?","Jean","Dean",1,
"Qual destes eventos estreou primeiro no Transformice?","Halloween","Natal",1,
"Qual destes títulos é atribuído a quantidade de ratos salvos no modo difícil?","Virtuoso","Redentor",1,
"A partir de qual ano foi possível criar mapas com largura maior que a normal?","2012","2011",2,
"Em qual cidade fica situada a sede da Atelier 801?","Lille","Paris",1,
"Qual desses foi o primeiro desenvolvedor do module #perguntas?","Brenower#0000","Dhanny_mheyran#6701",2,
"Quantos firsts são necessários para desbloquear o título 'O Mito'?","1100","1000",1,
"Qual a largura máxima que um mapa pode ter sem ter o modo defilante ativado?","1600","9830",1,
"Qual destes objetos não pode ser utilizado no modo difícil?","Sp","Seta",1,
"A seta é sempre o primeiro item do shaman.","Falso","Verdadeiro",1,
"O module Mestre Mandou já foi administrado por quantas pessoas?","4","5",1,
"Qual a idade mínima para virar moderador no Transformice?","18","16",1,
"Qual foi a última versão do Flash Player que o Transformice deu suporte?","32.0","33.0",1,
"Qual a idade mínima para virar FunCorp no Transformice?","16","Não tem idade mínima",2,
"Quantos tamanhos de tela de cinema existem no Transformice?","2","3",1,
"É possível mudar a cor da água do Transformice utilizando somente o Editor de Mapas.","Verdadeiro","Falso",2,
"É possível carregar imagens nos mapas utilizando apenas no Editor de Mapas.","Verdadeiro","Falso",1,
"Em teoria, qual a largura máxima que um mapa no Transformice pode ter?","4800","9830",2,
"Em teoria, qual a altura máxima que um mapa no Transformice pode ter?","800","9830",2,
"Quem é o criador atual do module #unotfm?","Ninguem#0095","Spectra_phantom#6089",1,
"Em qual ano foi introduzido o esquema de #tags nos nomes do Transformice?","2018","2019",1,
"Quantos bootcamps são necessários para desbloquear o título Recruta?","1","3",1,
"Quantos firsts são necessários para desbloquear o título 'Rato Pirata'?","100","200",1,
"Usuários podem adicionar imagens no cafofo da tribo utilizando o comando /lua.","Verdadeiro","Falso",1,
"Quando um rato morre no Transformice, começa a sair...","Bolhas","Sangue",1,
"Qual é o nome do primeiro module do Transformice?","sharpie debuglua","batata",1,
"O dia de lançamento do Transformice é também um feriado nacional no Brasil. Qual é esse feriado?","Dia das Mães","Dia do Trabalho",2,
"Qual destes comandos servem para ver informações do mapa atual?","/map","/info",2,
"Para usar o café, você precisa estar com quantos dias jogados de conta?","30","10",1,
"Em qual dia do ano o Transformice foi criado?","1","2",1,
"Qual o limite de queijos que podem ser armazenados no inventário?","80","200",2,
"Quantos anos tem o Tigrounette?","33","35",2,
"Qual o nome da única mulher que criou um module semi-oficial no Transformice?","Morganadxana#0000","Lanadelrey#4862",1,
"Qual o limite antigo de membros em uma tribo do Transformice?","5000","2000",2,
"Qual o nome de um module de testes extinto em que todos viravam Pikachu e tinham que descer a ladeira?","#surble","#surbler",1,
"No começo da vida do Defilante, quem ganhava as partidas recebia 2 firsts e quantos queijos?","0","2",1,
"Qual destas categorias de mapas é atribuída a mapas de Survivor Vampiro?","P11","P13",1,
"O module #freezertag antes era um submódulo de qual module?","#parkour","#circuit",1,
"Qual o nome do código que é usado para carregar mapas do Transformice?","Lua","XML",2,
"Qual destes usuários nunca se tornou Funcorp?","Patrick_mahomes#1795","Pamots#0095",1,
"Qual destes modules não foi feito por um brasileiro?","#anvilwar","#freezertag",1,
"Qual destas ratas morreu na vida real, dando origem a uma decoração do Transformice?","Elise","Papaille",1,
"Em qual mês do ano geralmente termina o evento de Natal?","Dezembro","Janeiro",2,
"Em qual ano foram introduzidos os modules no Transformice?","2014","2013",2,
"Qual destes comandos servem para ver os seus mapas criados?","/maps","/lsmap",2,
"Quem é o criador e gerenciador atual do module #shamousey?","Shamousey#0015","Ninguem#0095",1,
"Quantos queijos custa para exportar um mapa como cafofo da tribo?","5","40",1,
"Quantos objetos de shaman podem ser utilizados no modo padrão?","13","14",2,
"Em qual ano houve o desban de todas as contas banidas permanentes no Transformice?","2012","2013",2,
"Em qual país está situado o host de baixo ping disponível no Brasil?","Canadá","México",1,
"Qual categoria de mapas é atribuída aos mapas permanentes de modules?","P41","P43",1,
"Em qual ano surgiu o sistema de missões diárias no Transformice?","2018","2019",2,
"Qual a idade mínima para virar membro da Module Team no Transformice?","16","Não tem idade mínima",2,
"Qual destes comandos servem para ver informações ténicas do cliente e do sistema?","/info","/^^",2,
"Qual o último título desbloqueável de queijos do Transformice?","MEU QUEIJO!","Alpha & Omega",1,
"Para falar no café, você precisa de quantos queijos no perfil?","100","1000",2,
"Qual destes modules não existe mais?","#madchess","#minigolf",1,
"Qual comando é utilizado para ver a árvore de funções e eventos LUA do Transformice?","/luahelp","/luatree",1,
"Qual era o nome da sala que, após uma sequência de comandos, dava morangos de graça?","286637850","286657250",1,
"Em qual ano foi lançado o primeiro servidor brasileiro do Transformice?","2010","2011",2,
"Em qual ano foi lançada a Plataforma Comunitária do Transformice?","2013","2014",1,
"O que acontece quando você digita /zimmer 5?","Te dá 5 queijos de graça","Leva você para a sala 5",2,
"Em qual mês do ano o Transformice foi criado?","Maio","Junho",1,
"Qual comando serve para ver a versão do Transformice?","/version","/transformice",1,
"Qual a tag atribuída a ex-membros da equipe do Transformice?","#0020","#0095",2,
"Tigrounette é homem ou mulher?","Homem","Mulher",1,
"É possível presentear outros ratos com itens da loja utilizando somente queijos.","Verdadeiro","Falso",2,
"Qual a função da habilidade de shaman 'Superstar'?","Os ratos ao redor dançam","Os ratos ao redor beijam",1,
"Qual o último título de ratos salvos pelo Shaman?","Virtuoso","Alpha & Ômega",2,
"Qual o nome do jogo de Zumbis lançado pela Atelier 801?","League of Legends","Dead Maze",2,
"Quantas medalhas comemorativas de aniversário existem no Transformice?","2","10",1,
"Em qual árvore de habilidades está presente a habilidade 'Desintegração controlada'?","Físico","Mecânico",1,
"Em qual ano foi lançado o Poisson, antigo jogo que depois tornou o Transformice?","2010","2008",2,
"Por quantas horas você é banido por Hack no Transformice, por padrão?","360","168",1,
"Qual o nome do antigo jogo do Transformice para celular?","Dead Maze","Run For Cheese",2,
"Os donos da Atelier 801 e da Ubisoft já se encontraram pessoalmente.","Não","Sim",1,
"Em qual árvore de habilidades está presente a habilidade 'Volta da natureza'?","Físico","Selvagem",2,
"Qual o nome atual da ex-modsent Racola?","Alriy#0095","Keith#0095",1,
"Quantos ratos salvos são necessários para desbloquear o modo normal?","0","1000",1,
"Quando você cria uma conta no Transformice, seu inventário vem vazio.","Verdadeiro","Falso",2,
"Qual o comando que desbloqueia um item de cabeça de bolo?","/atelier801","/transformice",1,
"O capacete de 20 queijos é a única roupa que pode ser customizado sem gastar queijos/morangos.","Verdadeiro","Falso",1,
"A partir de 2021, só será possível jogar Transformice através da Steam.","Verdadeiro","Falso",2,
"Qual o último título de ratos salvos em modo difícil pelo Shaman?","Virtuoso","Alpha & Ômega",1,
"É possível mudar a gravidade do mapa no Transformice utilizando código LUA.","Verdadeiro","Falso",1,
"Apenas membros da Module Team podem carregar modules nas salas do Transformice.","Verdadeiro","Falso",2,
"Quantos servidores host da Atelier801 existem no Brasil?","0","1",1,
"Qual é a margem máxima offscreen de largura e altura no qual os ratos podem permanecer vivos?","400px por lado","800px por lado",1,
}
perguntas1={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Qual a fórmula da água?","H20","H2O",2,
"Em que ano foi derrubado o Muro de Berlim?","1989","1991",1,
"Qual o nome da figura de linguagem que representa sons de animais e objetos, por exemplo?","Onomatopeia","Personificação",1,
"Qual o nome do vírus transmissor da Dengue, Chikungunya e Zica?","Aedes Aegypti","Tripanossoma Cruzi",1,
"Segundo a Mitologia Grega, qual o nome dado ao lugar localizado no Submundo?","Inferno","Tártaro",2,
"Quantos rios conseguem cortar o Deserto do Saara sem secar?","1","Nenhum",1,
"Quantas camadas possui a atmosfera da Terra?","4","5",2,
"A quantos graus °C a água ferve aproximadamente, no topo do Monte Everest?","100","71",2,
"O clima Subtropical é o predominante na região Nordeste do Brasil.","Verdadeiro","Falso",2,
"Qual foi o Presidente eleito nas eleições brasileiras de 1998?","Fernando Henrique Cardoso","Lula",1,
"Fernando Collor de Mello foi o primeiro e único presidente a sofrer Impeachment no Brasil.","Verdadeiro","Falso",2,
"Qual era o Presidente dos Estados Unidos no ano do ataque às Torres Gêmeas?","J.F. Kennedy","George W. Bush",2,
"Na matemática, qual o nome da sequência onde o resultado é a soma dos dois números anteriores?","Fibonacci","Pascal",1,
"A cidade do Rio de Janeiro foi capital do Brasil até que ano?","1889","1960",2,
"A área de um círculo pode ser calculada utilizando qual fórmula?","2.πr","π.r²",2,
"Quantos anos possui Silvio Santos?","89","91",2,
"Qual destes mares possui maior concentração de sal por litro de água?","Mar Morto","Mar Mediterrâneo",1,
"A Rodovia Presidente Dutra, que liga os estados do RJ e SP, foi construída em qual governo Brasileiro?","Getúlio Vargas","Eurico Gaspar Dutra",2,
"Qual é a unidade utilizada para medir a altura de sons?","decibéis","watts",1,
"O ponto de maior altitude do Brasil fica localizado a quantos metros, aproximadamente?","2500","3000",2,
"Qual é a fórmula para converter graus °C em graus °K?","K = C + 273","K = -40 + ((18 * C) - 40)",1,
"Qual é o nome da fórmula utilizada para calcular equações do segundo grau?","Fórmula de Bhaskara","Teorema de Pitágoras",1,
"Quantos planetas existem no Sistema Solar?","8","9",1,
"Qual cidade do Rio de Janeiro é conhecida como 'Cidade Imperial'?","Petrópolis","Angra dos Reis",1,
"Quantas usinas nucleares o Brasil possui funcionando?","2","5",1,
"Qual foi o nome da pandemia que matou milhões de pessoas ao redor mundo no começo do século XX?","Covid-19","Gripe Espanhola",2,
"Qual o oceano da Terra que possui a maior profundidade média?","Oceano Pacífico","Oceano Atlântico",1,
"As nuvens são feitas de quê?","Vapor de água","Algodão",1,
"Qual o estado da água quando ela passa diretamente do estado sólido para o gasoso, ou vice-versa?","Condensação","Sublimação",2,
"A chegada da Família Real Portuguesa ao Brasil ocorreu em qual ano?","1808","1822",1,
"Qual destes é o maior deserto da Terra?","Deserto do Saara","Antártida",2,
"Quantos anos durou o Regime Militar no Brasil?","21","25",1,
"Qual dessas emissoras de televisão foi a primeira da América Latina?","Rede Tupi","Rede Manchete",1,
"Uma polegada equivale a quantos centímetros, aproximadamente?","2.5 cm","3.3 cm",1,
"Em qual ano ocorreu o último Censo do IBGE?","2010","2020",1,
"O Arco do Triunfo, localizado na França, é uma homenagem a...","Napoleão Bonaparte","George Washington",1,
"Na matemática, qual o nome do triângulo em que a soma dos números centrais é igual à soma das coeficientes binomiais?","Triângulo de Newton","Triângulo de Pascal",2,
"Quais os povos que dominaram a região da Islândia no século IX?","Bárbaros","Vikings",2,
"Qual o nome da região de relevo localizada na região Nordeste do Brasil, sendo responsável pelo clima da região?","Planalto da Borborema","Pico das Agulhas Negras",1,
"Em qual continente fica localizado o monte Everest?","Europa","Ásia",2,
"De onde é a invenção do chuveiro elétrico?","França","Brasil",2,
"Qual destes pontos turísticos brasileiros fica localizado no estado da Bahia?","Casa de Santos Dumont","Elevador Lacerda",2,
"Quantos elementos químicos a tabela periódica possui?","113","118",2,
"Qual a montanha mais alta do Brasil?","Pico da Neblina","Pico da Bandeira",1,
"Qual destes reinos de seres vivos é considerado o Reino das Bactérias?","Monera","Protista",1,
"Quantos presidentes tivemos no Brasil desde a Redemocraticação, em 1985?","7","8",2,
"O que significa a sigla CPF?","Cadastro de Pessoa Física","Crédito de Pessoa Física",1,
"Quantos livros possui a Bíblia Sagrada?","62","66",2,
"Qual foi o primeiro homem a descobrir o Brasil?","Pedro Álvares Cabral","Duarte Pacheco Pereira",2,
"Qual destes equipamentos foi o grande carro-chefe da Primeira Revolução Industrial?","Máquina a vapor","Engrenagem",1,
"Em qual ano ocorreu a missão da Apollo 8?","1968","1969",1,
"Segundo a Mitologia Grega, qual destes seres teve suas asas destruídas ao chegar perto do Sol?","Afrodite","Ícaro",2,
"Qual destas unidades de medida é utilizada para medir a resistência de um objeto?","Ohm","Coulomb",1,
"Em qual oceano da Terra está localizada a Fossa das Marianas?","Oceano Pacífico","Oceano Índico",1,
"Qual foi o último período da Terra em que os dinossauros viveram?","Jurássico","Cretáceo",2,
"Em qual cidade ocorreu a primeira edição dos Jogos Olímpicos?","Atenas","Paris",1,
"O Rio Nilo é o maior e mais caudaloso rio da Terra.","Verdadeiro","Falso",2,
"O Rio Amazonas é formado pelo encontro de quais rios?","Negro e Tapajós","Negro e Solimões",2,
"A Floresta Amazônica é o lugar natural com maior geração de oxigênio do mundo.","Verdadeiro","Falso",2,
"De quem é a famosa frase 'Penso, logo existo'?","Aristóteles","René Descartes",2,
"Qual é o nome dado para as bactérias que precisam de oxigênio para se reproduzirem?","Aeróbicas","Anaeróbias",1,
"Qual o nome da operação inversa da raiz quadrada?","Potenciação","Subtração",1,
"Quantas estrelas existem no Sistema Solar?","1","O número é tão grande que nem cabe",1,
"Quando uma estrela com 10 ou menos massas solares chega no final do seu tempo de vida, ela vira um(a)...","Buraco Negro","Anã Branca",2,
"Quantos anos durou a Guerra dos Cem Anos?","100","116",2,
"Existem milhares de jacarés e capivaras no fundo do Rio Amazonas.","Verdadeiro","Falso",2,
"Qual a raiz quadrada de -16?","-4","Não existe",2,
"Qual é o nome da maior estrela já conhecida no Universo?","Canis Majoris","UY Scuti",2,
"Em qual ano foi lançado o primeiro Windows?","1985","1995",1,
"Qual destes elementos químicos é utilizado para produzir equipamentos eletrônicos?","Silício","Rambônio",1,
"Qual destes elementos químicos fica líquido na temperatura ambiente?","Água","Mercúrio",2,
"Qual destas categorias é necessária na carteira de habilitação para dirigir motos?","Categoria A","Categoria B",1,
"O ano-luz é uma unidade de medida de...","Tempo","Distância",2,
"Qual foi o cineasta que chegou no fundo da Fossa das Marianas, lugar mais profundo do oceano?","James Cameron","Jacques Piccard",1,
"Qual é o nome dado para as bactérias que não precisam de oxigênio para se reproduzirem?","Aeróbicas","Anaeróbias",2,
"Qual destes tipos de clima é encontrado no Brasil?","Semiárido","Mediterrâneo",1,
"Quantas capitais a África do Sul possui?","2","3",2,
"Quem é o Deus da mitologia Nórdica?","Zeus","Odin",2,
"Em 1889, qual destas cidades foi a capital do Brasil?","Rio de Janeiro","Petrópolis",2,
"Por quantos anos durou a Era Vargas, primeiro período no qual Getúlio Vargas foi presidente do Brasil?","8","15",2,
"Qual é o nome oficial da Ponte Rio-Niterói?","Ponte Presidente Costa e Silva","Ponte Presidente Mário Andreazza",1,
"Por qual nome também é conhecido o Rio São Francisco?","Velho Chico","Três Corações",1,
"Em qual cidade estão situadas as únicas usinas nucleares em funcionamento no Brasil?","Angra dos Reis","Cabo Frio",1,
"Qual foi o último ano em que tivemos vulcões em erupção no Brasil?","65 milhões de anos A.C","3 milhões de anos A.C",1,
"Qual o nome da cidade que fica localizada entre os rios Tigre e Eufrates?","Jerusalém","Mesopotâmia",2,
"A partir de qual ano passou a ser utilizado o Novo Padrão Ortográfico no Brasil?","2009","2010",1,
"Qual destes municípios faz parte da chamada Região dos Lagos do estado do Rio de Janeiro?","Angra dos Reis","Armação dos Búzios",2,
"Quantos quilômetros a luz percorre no vácuo durante 1 mês?","777062051136000","777600000000000",1,
"Copacabana é um bairro ou uma cidade?","Bairro","Cidade",1,
"Qual o nome do cartunista que fez a Turma da Mônica?","Maurício de Sousa","Maurício de Souza",1,
"Qual o nome do cartunista que fez o Menino Maluquinho?","Ziraldo","Monteiro Lobato",1,
"Qual destes candidatos a Presidência da República em 2014 morreu em um acidente de avião?","Marina Silva","Eduardo Campos",2,
"Quantas Constituições o Brasil teve desde seu descobrimento?","5","7",2,
"Qual destes gases existe em maior quantidade na atmosfera da Terra?","Nitrogênio","Oxigênio",1,
"Quantos reinos de seres vivos existem na Terra?","5","7",1,
"Um microfone pode ser utilizado para geração de energia elétrica.","Verdadeiro","Falso",1,
"Na matemática, qual o nome da operação inversa da Derivação?","Integração","Generalização",1,
"Qual o nome dado a doença nos homens cujo possuem problemas onde o pênis não completa totalmente a glande?","Balanite","Fimose",2,
"Quanto tempo leva para a Terra dar uma volta completa em torno do Sol, aproximadamente?","365 dias","365 dias e 6 horas",2,
"Qual o nome dado para o espectro de luz que fica acima da luz visível?","Infravermelho","Ultravioleta",2,
"Qual o nome do empresário que foi responsável pela inauguração da Televisão no Brasil?","Silvio Santos","Assis Chateaubriand",2,
"Em qual ano foi promulgada a Constituição em vigor no Brasil?","1988","1978",1,
"O quilograma é uma unidade de medida usada para medir...","Peso","Massa",2,
"Qual destes lugares é maior em questão de área?","Distrito Federal","Vaticano",1,
"Qual é a fórmula do Cloreto de Sódio, também conhecido como sal de cozinha?","NaCl","NaCO₂",1,
"Qual destas espécies de tubarão pode viver também na água doce?","Tubarão-touro","Tubarão-baleia",1,
"Qual o nome dado a linguagem utilizada no Egito Antigo, com 'imagens' ao invés de letras?","Ideografias","Hieróglifos",2,
"Qual o nome do livro sagrado que é utilizado no Islamismo?","Alcorão","Tripitaka",1,
"Dos tipos de ondas a seguir, qual possui mais chance de causar câncer ao corpo humano?","Raios X","Raios Gama",2,
"Qual o nome dado aos seres que vivos que possuem apenas 1 célula?","Unicelulares","Pluricelulares",1,
"Qual o nome do supercontinente que existia na Terra antes deles serem divididos?","Pangeia","Pantalassa",1,
"O Rio Nilo é o único rio que consegue atravessar o deserto do Saara sem secar.","Verdadeiro","Falso",1,
"Em média, quantos metros de profundidade você precisa descer para chegar a uma pressão atmosférica de 2 atm?","10 metros","20 metros",1,
"No geral, Terremotos e maremotos acontecem quando duas ou mais placas tectônicas...","Se separam uma da outra","Colidem uma com outra",2,
"Qual o nome da tecnologia que era utilizada na maioria dos equipamentos eletrônicos, do início do século XX até o anos 70","Válvula","Transformador",1,
"Em qual ano terminou a Segunda Guerra Mundial?","1942","1945",2,
"Em qual ano ocorreu a Quebra da Bolsa de Nova York?","1929","1930",1,
}
perguntas2={
"Vai na sorte :)","ok","ok",1,
"Vai na sorte :)","ok","ok",2,
"Em que ano morreu Chester Bennington, ex-vocalista do Linkin Park?","2017","2019",1,
"Em qual ano ocorreu a primeira edição do Rock in Rio?","1985","1987",1,
"Qual o nome da embalagem que é utilizada para guardar CDs?","Jensen Case","Jewel Case",2,
"Qual é a duração média de um disco de vinil (LP)?","20 minutos por lado","30 minutos por lado",1,
"Qual é o material utilizado nos antigos discos de 78rpm, utilizados antes do surgimento do LP?","Silicone","Goma Laca",2,
"Qual é o nome da música utilizada na abertura do programa Big Brother Brasil?","Vida Real","A Cruz e a Espada",1,
"Qual é o nome da música utilizada na abertura da novela O Rei do Gado?","O Rei do Gado","Orquestra da Terra",1,
"De quem é a música 'Meu Mundo e Nada Mais'?","Antônio Fagundes","Guilherme Arantes",2,
"Qual é a música, que quando ouvida ao contrário, há referências satânicas?","Hotel Califórnia","Empty Spaces",1,
"Em qual ano foi introduzidos os CDs no Brasil?","1982","1984",2,
"A música 'Festa do Apê', do cantor Latino, é uma versão brasileira adaptada de qual música?","O-Zone","Dragostea Din Tei",2,
"Qual é o limite máximo de músicas que podem ser colocadas em um LP?","10","Não existe limite teórico",2,
"Qual destas músicas não foi cantada pela cantora Evanescence?","Bring Me To Life","Over and Under",2,
"Qual foi o álbum lançado pelo Nirvana que possui a famosa capa com um bebê debaixo d'água?","Nevermind","Bleach",1,
"A banda de rock cristão Katsbarnea é de qual país?","Ucrânia","Brasil",2,
"A banda de rock alternativo Egypt Central é de qual país?","Egito","Estados Unidos",2,
"Qual destas músicas do Tim Maia é muito semelhante a abertura da 6ª temporada de Jojo's Bizarre Adventures?","O Descobridor dos Sete Mares","Do Leme ao Pontal",1,
"Complete a música: Do Leme ao Pontal... [...] Sem contar com Calabouço, Flamengo, Botafogo, Urca, ...","Praia Vermelha","Praia de Ipanema",1,
"Qual destes gravou a música 'Pra não dizer que não falei das Flores', que retrata o período de censura do AI-5 do Regime Militar?","Geraldo Vandré","Vanusa",1,
"Qual destas músicas foi gravada no primeiro EP da banda Linkin Park, lançada em 1999?","In the End","Carousel",2,
"Complete a música: Rimas de ventos e velas, vida que vem e que vai, a solidão que fica e entra...","Me arremessando contra o cais","Me arremessando contra o vento",1,
"Qual destas cantoras morreu em 2021 em um acidente de avião em Minas Gerais?","Marília Mendonça","Pablo Vittar",1,
"A cantora Shirley Carvalhaes lançou seu primeiro álbum em qual ano?","1977","1987",1,
"O primeiro protótipo de disco de vinil foi apresentado no Brasil.","Verdadeiro","Falso",2,
"Em qual estado do Brasil nasceu a cantora Aline Barros?","São Paulo","Rio de Janeiro",2,
"De qual ano é a música 'Show das Poderosas', da cantora Anitta?","2012","2014",1,
"O álbum Toxicity, do System of a Down, foi lançado uma semana antes de qual grande evento acontecer?","Ataque às Torres Gêmeas","Morte de Osama Bin Laden",1,
"Qual destas músicas foi utilizada no filme 'Transformers: Revenge of the Fallen'?","You Make me Sick","New Divide",2,
"Qual destes políticos já gravou um álbum musical?","Marcelo Crivella","Bruno Covas",1,
"[...] Uma história de amor, de aventura e de magia...  Qual o nome desta música de Sandy e Júnior?","Uma História de Amor","Era uma Vez",2,
"O single da música Razões e Emoções, do NX Zero, foi lançada em qual ano?","2006","2007",2,
"Rádio Pirata foi o nome do primeiro álbum lançado pela banda RPM.","Verdadeiro","Falso",2,
"Qual é o nome da música utilizada na abertura da novela Páginas da Vida?","Se Quiser","Páginas da Vida",1,
"Qual destes foi o primeiro vocalista da banda NX Zero?","Yuri Nishida","Di Ferrero",1,
"Complete a música: Ah, meu coração é um campo minado... Muito cuidado...","Ele pode explodir","Com a traição",1,
"A banda Charlie Brown Jr. foi formada na cidade de Santos.","Verdadeiro","Falso",1,
"Qual era o nome do equipamento que era utilizado para ouvir músicas por fita cassete e podia ser transportado facilmente?","Discman","Walkman",2,
"Quais foram as empresas que foram responsáveis pelo desenvolvimento dos CDs?","Sony e Pioneer","Sony e Philips",2,
"Qual destes funkeiros gravou a música 'Olha a Explosão'?","MC Livinho","MC Kevinho",2,
"O cantor Renato Russo, que era do Legião Urbana, morreu de consequências do(a)...","AIDS","Câncer",1,
"A cantora gospel Cassiane gravou seu primeiro álbum com quantos anos de idade?","8 anos","12 anos",1,
"O cantor e compositor Marcos Witt nasceu em qual país?","México","Estados Unidos",2,
"A música Copacabana, de Barry Manilow, fala majoritariamente sobre...","a Praia de Copacabana","um Bar americano chamado Copacabana",2,
"Qual destas bandas de black metal possui o mesmo nome de uma criatura mitológica da Bíblia Sagrada?","Anthrax","Behemoth",2,
"De quem é a música 'Ai se eu te Pego?","Luan Santana","Michel Teló",2,
"Qual destas músicas foi utilizada como abertura da série Malhação, na temporada de 2004?","Te Levar","Vou Deixar",1,
"Qual é o tamanho de um disco de vinil do tipo Single, que armazenava no máximo 2 faixas por lado?","7 polegadas","10 polegadas",1,
"Qual destas músicas do Guilherme Arantes fala sobre a importância da água no Planeta Terra?","Planeta Água","Águas",1,
"Qual o nome do extinto programa de televisão que era focado em tocar Funk?","Estação Funk","Furacão 2000",2,
}
mapa="@7786632"
modo="inicial" -- não mude
pergunta=0
rodada=0
limite=25
actual_question={quest="",a1="",a2="",answer=nil}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tribehouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tribehouse == true then
		ui.addTextArea(0,"<p align='center'><font size='16'>"..message.."",name,10,22,780,48,0x000001,0x000001,1.0,true)
	end
end
function eventNewGame()
	vivos=0
	tfm.exec.setGameTime(15)
	for name,player in next,tfm.get.room.playerList do
		vivos=vivos+1
	end
end
function reset()
	rodada=0
	ui.removeTextArea(1)
	ui.removeTextArea(2)
	ui.removeTextArea(0)
	tfm.exec.newGame(mapa)
	showMessage("<R>Aviso: Algumas perguntas repetidas podem ser puladas automaticamente para maior fluidez do module. Isto não é um bug ou um problema do Transformice.")
end
function eventChatCommand(name,message)
	if message == "random" then
		if name == admin or name == "Forzaldenon#0000" or name == "Reksai_void2600#6638" or name == "Aurelianlua#0000" or name == "Viego#0345" then
			randomQuests()
		end
	end
	if (message:sub(0,6) == "limite") then
		limite=tonumber(message:sub(8))
		showMessage("Limite alterado para: "..message:sub(8).."")
	end
	if (message:sub(0,4) == "setq") then
		set_q=tonumber(message:sub(6))
	end
end
function eventNewPlayer(name)
	ratos=ratos+1
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerLeft(name)
	ratos=ratos-1
end
function eventLoop(p,f)
	ui.setMapName("<N>Quiz de Perguntas <VP><b>v2.10.0</b> <N>por <ROSE>Reksai_void2600#6638   <BL>|   <N>Ratos vivos : <V>"..vivos.."/<J>"..ratos.."   <BL>|   <N>Round : <V>"..rodada.."/<R>"..limite.."<")
	if f < 2000 and modo == "inicial" then
		modo="perguntar"
		randomQuests()
	end
	if f < 1250 and modo == "perguntar" then
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].x >= 390 and tfm.get.room.playerList[name].x <= 410 then
				tfm.exec.killPlayer(name)
			end
		end
		tfm.exec.setGameTime(6)
		if actual_question.answer == false then
			tfm.exec.removePhysicObject(1)
			ui.addTextArea(2,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,0.1,true)
			ui.addTextArea(1,"<p align='center'><VP><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,1.0,true)
			modo="intervalo"
		elseif actual_question.answer == true then
			tfm.exec.removePhysicObject(0)
			ui.addTextArea(1,"<p align='center'><font color='#181818'><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,0.1,true)
			ui.addTextArea(2,"<p align='center'><VP><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,1.0,true)
			modo="intervalo"
		end
	end
	if modo == "intervalo" then
		if f > 2000 and f <= 3000 then
			if actual_question.answer == false then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].x >= 410 then
						tfm.exec.killPlayer(name)
					end
				end
			elseif actual_question.answer == true then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].x <= 390 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
	end
	if f < 1 and modo == "intervalo" then
		if rodada < limite then
			randomQuests()
		else
			tfm.exec.setGameTime(5)
			showMessage("<R>Sem vencedores!")
			modo="fim"
		end
	end
	if modo == "perguntar" and f >= 1 then
		ui.addTextArea(3,"<p align='center'><font size='45'>"..math.ceil((f/1000)-1).."",nil,360,235,80,60,0x000001,0x494949,1.0,true)
	else
		ui.removeTextArea(3,nil)
	end
	if f <= 1500 and vivos == 1 and modo == "fim" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				showMessage("<VP><b>"..name.."</b> venceu a partida!")
				modo="fim2"
			end
		end
	end
	if f < 250 then
		if modo == "fim" or modo == "fim2" then
			modo="inicial"
			reset()
		end
	end
	if f > 13000 and f < 14000 then
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
	end
	if f > 10500 and f < 11500 then
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
	end
end
function randomQuests()
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.movePlayer(name,400,145,false)
	end
	tfm.exec.setGameTime(17)
	if rodada >= 15 then
		tfm.exec.setGameTime(12)
	end
	tfm.exec.addPhysicObject(2, 385, 150, barreira)
	tfm.exec.addPhysicObject(3, 415, 150, barreira)
	tfm.exec.addPhysicObject(0, 220, 380, piso)
	tfm.exec.addPhysicObject(1, 580, 380, piso)
	modo="perguntar"
	rodada=rodada+1
	if tema == 0 then
		if set_q == 0 then
			pergunta=math.random(#perguntas/4)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas[-3+(4*pergunta)]
		if perguntas[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas[-2+(4*pergunta)]
		actual_question.a2=perguntas[-1+(4*pergunta)]
	end
	if tema == 1 then
		if set_q == 0 then
			pergunta=math.random(#perguntas1/4)
		else
			pergunta=set_q
		end
		actual_question.quest=perguntas1[-3+(4*pergunta)]
		if perguntas1[pergunta*4] == 2 then
			actual_question.answer=true
		elseif perguntas1[pergunta*4] == 1 then
			actual_question.answer=false
		end
		actual_question.a1=perguntas1[-2+(4*pergunta)]
		actual_question.a2=perguntas1[-1+(4*pergunta)]
	end
	set_q=0
	ui.addTextArea(1,"<p align='center'><font size='18'>"..actual_question.a1.."",nil,100,145,260,81,0,0,1.0,true)
	ui.addTextArea(2,"<p align='center'><font size='18'>"..actual_question.a2.."",nil,440,145,260,81,0,0,1.0,true)
	ui.addTextArea(0,"<p align='center'><font size='16'>"..actual_question.quest.."",nil,10,22,780,48,0x000001,0x000001,1.0,true)
end
function eventPlayerDied(name)
	local i=0
	local n
	vivos=vivos-1
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		modo="fim"
		showMessage("<R>Sem vencedores!")
	elseif i==1 then
		modo="fim"
	end
end
reset()
