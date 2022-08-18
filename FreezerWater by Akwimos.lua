--[[ Require By: Nettoork#0000 ]]--
do local a={}local b={}local c={}local d={}local e={"eventChatCommand ","eventChatMessage","eventEmotePlayed","eventFileLoaded","eventFileSaved","eventKeyboard","eventMouse","eventLoop","eventNewGame","eventNewPlayer","eventPlayerDataLoaded","eventPlayerDied","eventPlayerGetCheese","eventPlayerLeft","eventPlayerVampire","eventPlayerWon","eventPlayerRespawn","eventPlayerMeep","eventPopupAnswer","eventSummoningStart","eventSummoningCancel","eventSummoningEnd","eventTextAreaCallback","eventColorPicked"}local f;f={['perfomance']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(g,h,i)local j=0;for v=1,g do local k=os.time()for l=1,h do i(h)end;j=j+os.time()-k end;return'Estimated Time: '..j/g..' ms.'end},['button']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local m={...}local n=-543212345+m[1]*3;local o=m[9]and'0x2A424B'or'0x314e57'ui.addTextArea(n,'',m[4],m[5]-1,m[6]-1,m[7],m[8],0x7a8d93,0x7a8d93,1,true)ui.addTextArea(n-1,'',m[4],m[5]+1,m[6]+1,m[7],m[8],0x0e1619,0x0e1619,1,true)ui.addTextArea(n-2,'<p align="center"><a href="event:'..m[3]..'">'..m[2]..'</a></p>',m[4],m[5],m[6],m[7],m[8],o,o,1,true)end,['remove']=function(n,p)for l=0,2 do ui.removeTextArea(-543212345+n*3-l,p)end end},['ui-design']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['create']=function(...)local m={...}if m[6]<0 or m[7]and m[7]<0 then return elseif not m[7]then m[7]=m[6]/2 end;local n=543212345+m[1]*8;ui.addTextArea(n,'',m[3],m[4],m[5],m[6]+100,m[7]+70,0x78462b,0x78462b,1,true)ui.addTextArea(n+1,'',m[3],m[4],m[5]+(m[7]+140)/4,m[6]+100,m[7]/2,0x9d7043,0x9d7043,1,true)ui.addTextArea(n+2,'',m[3],m[4]+(m[6]+180)/4,m[5],(m[6]+10)/2,m[7]+70,0x9d7043,0x9d7043,1,true)ui.addTextArea(n+3,'',m[3],m[4],m[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+4,'',m[3],m[4]+m[6]+80,m[5],20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+5,'',m[3],m[4],m[5]+m[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+6,'',m[3],m[4]+m[6]+80,m[5]+m[7]+50,20,20,0xbeb17d,0xbeb17d,1,true)ui.addTextArea(n+7,m[2],m[3],m[4]+3,m[5]+3,m[6]+94,m[7]+64,0x1c3a3e,0x232a35,1,true)end,['remove']=function(n,p)for l=0,7 do ui.removeTextArea(543212345+n*8+l,p)end end},['text-area-custom']={AUTHOR='Nettoork#0000',_VERSION='2.0',dependencies={},['add']=function(...)local q={...}if type(q[1])=='table'then for l,v in next,q do if type(v)=='table'then if not v[3]then v[3]='nil'end;addTextArea(table.unpack(v))end end else if not q[3]then q[3]='nil'end;b[q[3]..'_'..q[1]]={...}ui.addTextArea(...)end end,['update']=function(n,r,p)if not p then p='nil'end;if not b[p..'_'..n]then return elseif type(r)=='string'then ui.updateTextArea(n,r,p)b[p..'_'..n][2]=r;return end;local s={text=2,x=4,y=5,w=6,h=7,background=8,border=9,alpha=10,fixed=11}for l,v in next,r do if s[l]then b[p..'_'..n][s[l]]=v end end;local t=b[p..'_'..n]ui.addTextArea(t[1],t[2],t[3],t[4],t[5],t[6],t[7],t[8],t[9],t[10],t[11])end,['remove']=function(n,p)if not p then p='nil'end;if b[p..'_'..n]then b[p..'_'..n]=nil end;ui.removeTextArea(n,p)end},['string-to-boolean']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['parse']=function(u)local w={}for l,v in next,u do w[v]=true end;return w end},['database']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['create']=function(x,y)if not c[x]then c[x]=y end end,['delete']=function(x)c[x]=nil end,['get']=function(x,...)local z,A={},{...}if not A[1]then return c[x]else for l,v in next,A do if c[x][v]then z[#z+1]=c[x][v]end end;return table.unpack(z)end end,['set']=function(x,...)local B=v;for l,v in next,{...}do if not B then B=v else c[x][B]=v;B=false end end end},['encryption']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['encrypt']=function(u,C,D)if not u or not C or not D or type(u)~='table'or C==''or D==''then return end;local E,F,G,H='','','',''for l in C:gmatch('.')do E=E..l:byte()end;for l in D:gmatch('.')do H=H..l:byte()end;math.randomseed(E)otherSeed=math.random(1000000)local I=pcall(function()for l,v in next,u do if type(v)=='string'or type(v)=='number'then if type(v)=='string'then v="'"..v.."'"end;G=G..' '..v..' '..l:upper()else return end end;G=G..' '..H;for l in G:gmatch('.')do local J=l:byte()+68+math.random(5)otherSeed=otherSeed+l:byte()math.randomseed(otherSeed)if J>=65 and J<=122 and not(J>=91 and J<=96)then J=string.char(J)end;F=F..J end end)math.randomseed(os.time())if not I then return else return F end end,['decrypt']=function(K,C,D)if not K or not C or not D or type(K)~='string'or C==''or D==''then return end;local E,F,L,H='','','',''for l in C:gmatch('.')do E=E..l:byte()end;for l in D:gmatch('.')do H=H..l:byte()end;math.randomseed(E)otherSeed=math.random(1000000)local I=pcall(function()for l in K:gmatch('.')do if l:byte()>=65 and l:byte()<=122 then local J=l:byte()-68-math.random(5)otherSeed=otherSeed+J;math.randomseed(otherSeed)F=F..string.char(J)else L=L..l;if L:len()>=3 then local J=tonumber(L)-68-math.random(5)otherSeed=otherSeed+J;math.randomseed(otherSeed)F=F..string.char(J)L=''end end end end)math.randomseed(os.time())if not I then return else local w,M,N,O,P={},0,0;for l,v in string.gmatch(F,'[^%s]+')do N=N+1 end;for l,v in string.gmatch(F,'[^%s]+')do M=M+1;if M==N and l~=H then return elseif O then if O:sub(-1)=="'"then w[l:lower()]=O:gsub("'",'')O=nil else O=O..' '..l end elseif P then w[l:lower()]=P;P=nil elseif l:sub(1,1)=="'"then O=l else P=l end end;return w end end},['sleep']={AUTHOR='Nettoork#0000',_VERSION='1.1',dependencies={},['loop']=function()local Q={}for l,v in next,a do if not v[2]or v[2]<os.time()then if coroutine.status(v[1])=='dead'then Q[#Q+1]=l else local R,S=coroutine.resume(v[1])v[2]=S end end end;if Q[1]then for l,v in next,Q do a[v]=nil end end end,['run']=function(T,U)if not U then U=500 end;a[#a+1]={coroutine.create(function()local V=function(W)coroutine.yield(os.time()+math.floor(W/U)*U)end;T(V)end),timeValue=nil}end},['wait-time']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['check']=function(X,Y,Z,_)if X and Y then if not d[X]then d[X]={}end;if not d[X][Y]then _=0;d[X][Y]=os.time()+(Z or 1000)end;if d[X][Y]<=os.time()or _ and _==0 then d[X][Y]=os.time()+(Z or 1000)return true else return false end end end},['json']={AUTHOR='https://github.com/rxi',_VERSION='0.1.1',dependencies={},['encode']=function(a0)local a1;local a2={["\\"]="\\\\",["\""]="\\\"",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}local a3={["\\/"]="/"}for a4,v in pairs(a2)do a3[v]=a4 end;local function a5(a6)return a2[a6]or string.format("\\u%04x",a6:byte())end;local function a7(a0)return"null"end;local function a8(a0,a9)local aa={}a9=a9 or{}if a9[a0]then error("circular reference")end;a9[a0]=true;if a0[1]~=nil or next(a0)==nil then local W=0;for a4 in pairs(a0)do if type(a4)~="number"then error("invalid table: mixed or invalid key types")end;W=W+1 end;if W~=#a0 then error("invalid table: sparse array")end;for l,v in ipairs(a0)do table.insert(aa,a1(v,a9))end;a9[a0]=nil;return"["..table.concat(aa,",").."]"else for a4,v in pairs(a0)do if type(a4)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(aa,a1(a4,a9)..":"..a1(v,a9))end;a9[a0]=nil;return"{"..table.concat(aa,",").."}"end end;local function ab(a0)return'"'..a0:gsub('[%z\1-\31\\"]',a5)..'"'end;local function ac(a0)if a0~=a0 or a0<=-math.huge or a0>=math.huge then error("unexpected number value '"..tostring(a0).."'")end;return a0 end;local ad={["nil"]=a7,["table"]=a8,["string"]=ab,["number"]=ac,["boolean"]=tostring}a1=function(a0,a9)local ae=type(a0)local T=ad[ae]if T then return T(a0,a9)end;error("unexpected type '"..ae.."'")end;return a1(a0)end,['decode']=function(af)local ag;local a3={["\\/"]="/"}local function ah(...)local aa={}for l=1,select("#",...)do aa[select(l,...)]=true end;return aa end;local ai=ah(" ","\t","\r","\n")local aj=ah(" ","\t","\r","\n","]","}",",")local ak=ah("\\","/",'"',"b","f","n","r","t","u")local al=ah("true","false","null")local am={["true"]=true,["false"]=false,["null"]=nil}local function an(af,ao,ap,aq)for l=ao,#af do if ap[af:sub(l,l)]~=aq then return l end end;return#af+1 end;local function ar(af,ao,as)local at=1;local au=1;for l=1,ao-1 do au=au+1;if af:

sub(l,l)=="\n"then at=at+1;au=1 end end;error(string.format("%s at line %d col %d",as,at,au))end;local function av(W)local T=math.floor;if W<=0x7f then return string.char(W)elseif W<=0x7ff then return string.char(T(W/64)+192,W%64+128)elseif W<=0xffff then return string.char(T(W/4096)+224,T(W%4096/64)+128,W%64+128)elseif W<=0x10ffff then return string.char(T(W/262144)+240,T(W%262144/4096)+128,T(W%4096/64)+128,W%64+128)end;error(string.format("invalid unicode codepoint '%x'",W))end;local function aw(R)local ax=tonumber(R:sub(3,6),16)local ay=tonumber(R:sub(9,12),16)if ay then return av((ax-0xd800)*0x400+ay-0xdc00+0x10000)else return av(ax)end end;local function az(af,l)local aA=false;local aB=false;local aC=false;local aD;for aE=l+1,#af do local aF=af:byte(aE)if aF<32 then ar(af,aE,"control character in string")end;if aD==92 then if aF==117 then local aG=af:sub(aE+1,aE+5)if not aG:find("%x%x%x%x")then ar(af,aE,"invalid unicode escape in string")end;if aG:find("^[dD][89aAbB]")then aB=true else aA=true end else local a6=string.char(aF)if not ak[a6]then ar(af,aE,"invalid escape char '"..a6 .."' in string")end;aC=true end;aD=nil elseif aF==34 then local R=af:sub(l+1,aE-1)if aB then R=R:gsub("\\u[dD][89aAbB]..\\u....",aw)end;if aA then R=R:gsub("\\u....",aw)end;if aC then R=R:gsub("\\.",a3)end;return R,aE+1 else aD=aF end end;ar(af,l,"expected closing quote for string")end;local function aH(af,l)local aF=an(af,l,aj)local R=af:sub(l,aF-1)local W=tonumber(R)if not W then ar(af,l,"invalid number '"..R.."'")end;return W,aF end;local function aI(af,l)local aF=an(af,l,aj)local aJ=af:sub(l,aF-1)if not al[aJ]then ar(af,l,"invalid literal '"..aJ.."'")end;return am[aJ],aF end;local function aK(af,l)local aa={}local W=1;l=l+1;while 1 do local aF;l=an(af,l,ai,true)if af:sub(l,l)=="]"then l=l+1;break end;aF,l=ag(af,l)aa[W]=aF;W=W+1;l=an(af,l,ai,true)local aL=af:sub(l,l)l=l+1;if aL=="]"then break end;if aL~=","then ar(af,l,"expected ']' or ','")end end;return aa,l end;local function aM(af,l)local aa={}l=l+1;while 1 do local H,a0;l=an(af,l,ai,true)if af:sub(l,l)=="}"then l=l+1;break end;if af:sub(l,l)~='"'then ar(af,l,"expected string for key")end;H,l=ag(af,l)l=an(af,l,ai,true)if af:sub(l,l)~=":"then ar(af,l,"expected ':' after key")end;l=an(af,l+1,ai,true)a0,l=ag(af,l)aa[H]=a0;l=an(af,l,ai,true)local aL=af:sub(l,l)l=l+1;if aL=="}"then break end;if aL~=","then ar(af,l,"expected '}' or ','")end end;return aa,l end;local aN={['"']=az,["0"]=aH,["1"]=aH,["2"]=aH,["3"]=aH,["4"]=aH,["5"]=aH,["6"]=aH,["7"]=aH,["8"]=aH,["9"]=aH,["-"]=aH,["t"]=aI,["f"]=aI,["n"]=aI,["["]=aK,["{"]=aM}ag=function(af,ao)local aL=af:sub(ao,ao)local T=aN[aL]if T then return T(af,ao)end;ar(af,ao,"unexpected character '"..aL.."'")end;if type(af)~="string"then error("expected argument of type string, got "..type(af))end;local aa,ao=ag(af,an(af,1,ai,true))ao=an(af,ao,ai,true)if ao<=#af then ar(af,ao,"trailing garbage")end;return aa end},['runtime-analyze']={AUTHOR='Nettoork#0000',_VERSION='1.0',dependencies={},['run']=function(...)local aO=0;local aP=0;local aQ=0;local aR={}local aS={...}local aT={}local aU={"#83FFA4","#30FF67","#00FF44","#E9FF82","#EEFF24","#F5F604","#FF524F","#FF302D","#E60400","#C70502"}for l=1,10 do aT[l]=string.rep("\226\150\136",l)end;if tfm.get.room.name:find("^\42\03")~=nil then aQ=40 else aQ=60 end;local aV=function()local aW=""for l,v in next,aR do local aX=math.floor(v.timeLoaded/(aQ/10))*(5-math.floor(aO/2))aX=aX>10 and 10 or aX;local aY=(aX==0 and""or"<font color='"..aU[aX].."'>")..(aX==0 and""or aT[aX])aW=aW..string.format("<PT>[%s]</PT>\n%dms %s",l,v.timeLoaded,aY)..'</font>\n'end;local aX=math.floor(aP/(aQ/10))*(5-math.floor(aO/2))aX=aX>10 and 10 or aX;local aY=(aX==0 and""or"<font color='"..aU[aX].."'>")..(aX==0 and""or aT[aX])aW=aW..string.format("<D>Global Runtime:</D>\n%dms %s",aP,aY)..'</font> '..aQ..'ms\n'if aS[1]then for l,v in next,aS do ui.addTextArea(3102301909,aW,v,5,26,0,0,1,1,0.5,true)end else ui.addTextArea(3102301909,aW,nil,5,26,0,0,1,1,0.5,true)end end;local aZ={['eventLoop']=function()aO=aO+1;if aO>8 then aP=0;aO=0;for l,v in next,aR do aR[l]={call=0,timeLoaded=0}end end;aV()end}for l,v in next,e do if _G[v]and type(_G[v])=="function"then local a_=_G[v]if not aR[v]then aR[v]={call=0,timeLoaded=0}end;_G[v]=function(...)aR[v].call=aR[v].call+1;if aZ[v]then aZ[v](table.unpack({...}))end;local b0=os.time()a_(table.unpack({...}))local b1=os.time()-b0;aP=aP-aR[v].timeLoaded;aR[v].timeLoaded=aR[v].timeLoaded+b1+b1*0.15;aP=aP+aR[v].timeLoaded end else if aZ[v]then _G[v]=aZ[v]end end end end},['parse-xml']={AUTHOR='http://lua-users.org/wiki/LuaXml',_VERSION='1.0',dependencies={},['parse']=function(b2)local a9={}local b3={}table.insert(a9,b3)local b4,a6,b5,b6,b7;local l,aE=1,1;while true do b4,aE,a6,b5,b6,b7=string.find(b2,"<(%/?)([%w:]+)(.-)(%/?)>",l)if not b4 then break end;local b8=string.sub(b2,l,b4-1)if not string.find(b8,"^%s*$")then table.insert(b3,b8)end;local m={}string.gsub(b6,"([%-%w]+)=([\"'])(.-)%2",function(b9,ba,bb)m[b9]=bb end)if b7=="/"then table.insert(b3,{label=b5,xarg=m,empty=1})elseif a6==""then b3={label=b5,xarg=m}table.insert(a9,b3)else local bc=table.remove(a9)b3=a9[#a9]if#a9<1 then error("nothing to close with "..b5)end;if bc.label~=b5 then error("trying to close "..bc.label.." with "..b5)end;table.insert(b3,bc)end;l=aE+1 end;local b8=string.sub(b2,l)if not string.find(b8,"^%s*$")then table.insert(a9[#a9],b8)end;if#a9>1 then error("unclosed "..a9[#a9].label)end;return a9[1]end},['foreach-index']={AUTHOR='https://stackoverflow.com/users/68204/rberteig',_VERSION='1.0',dependencies={},['run']=function(ae,T,bd)local be={}for a4,ba in next,ae do be[#be+1]=a4 end;table.sort(be,bd)for ba,a4 in ipairs(be)do T(a4,ae[a4])end end}}local bf=1547917483395+2628*10^6;require=function(bg)if bg=='hide-warning'then bf=false else if bf and os.time()>bf then bf=false;print("<R>Warning! You may be using an outdated version of require, check in <i>pastebin.com/u/KananGamer</i> if this has a better version, otherwise you can disable this warning with require('hide-warning').</R>")end;if f[bg]then if f[bg]['INIT_SCRIPT']and type(f[bg]['INIT_SCRIPT'])=='function'then f[bg]['INIT_SCRIPT']()f[bg]['INIT_SCRIPT']=nil end;return f[bg]else print('Library "'..bg..'" not found! <i>Require Version: 1.3.0 | Author: Nettoork#0000</i>')return false end end end end

--[[ Current Version: 1.3.0 ]]--
--[[ Aviso: Esta é uma versão não-oficial do module #freezertag, adaptada com o sistema de afogamento do modo #watercatch. ]]--
--[[ Adaptação feita por Akwimos#1937. Mapa feito por Spectra_phantom#6089 e Morganadxana#0000. ]]--

require("hide-warning")

local stable = require("string-to-boolean").parse
local wait = require("wait-time").check
local sleep = require("sleep")

local admins = {"Nettoork#0000", "Star#8558", "Maarrieh#0000", "Akwimos#1937", "Spectra_phantom#6089"}
admins = stable(admins)

system.disableChatCommandDisplay();

local translations = {
["br"] = {
welcome = "<VP>Seja bem-vindo(a) ao #freezertag!</VP>";
freezed = "<BV>Uuuii, que frio... Parece que você foi congelado!</BV>";
unfreezed = "<BV>Oba! %s descongelou você!</BV>";
freezedLife = "Caso seja descongelado, você só terá mais <R>%d vida(s)</R>!";
unfreezedsomeone = "<BV>Você descongelou %s!</BV>";
noLife = "Você perdeu todas as suas vidas e portanto não pode mais ser descongelado.";
freezerswon = "<D>Os congeladores vivos venceram!</D>";
unfreezerswon = "<D>Os jogadores vivos venceram!</D>";
are_freezer = "Você é um <R>congelador</R>! Pressione <R>ESPAÇO</R> nos jogadores para congela-los.";
are_unfreezer = "Fuja do(s) ratinho(s) com a cor do nome <BV>azul</BV>! Pressione <BV>ESPAÇO</BV> nos jogadores para descongela-los. Você só pode ser descongelado <B>%d vezes</B>!<br>Descongele ratinhos para conseguir mais vidas!";
playerWithoutLife = "<VP>Me parece que esse jogador já virou picolé...</VP>";
gotHp = "<VP>Você teve a sorte de ganhar <R>+1 vida</R> por ter descongelado %s!</VP>";
nowPopsicle = "<VP>%s virou picolé!</VP>";
chance = "<font color='#E9E654'>Chance de ser congelador(a): <B><R>%s</font>";
player_banned = "<R>O(a) jogador(a) <VP>%s</VP> foi proibido(a) de jogar na sala.</R>";
player_unbanned = "<R>Agora <VP>%s</VP> pode jogar novamente.</R>";
player_drowned = "<VP>%s</VP> morreu afogado dentro do rio!</R>";
}
}

translations.en = translations.br

local config = {
freezer_radius = 50;
unfreezer_radius = 50;
start_hp = 3;
hp_chance = 30;
players_per_freezers = 8;
freezer_delay = 2000;
unfreezer_delay = 15000;
game_time = 240;
max_players = 50;
object_start_id = 100000;
select_freezers_time = 10000;
end_game_time = 30000;
min_moving_players = 5;
room_language = translations[tfm.get.room.community] and tfm.get.room.community or 'en';
}


local maps = {'<C><P  D="x_deadmeat/x_pictos/d_1219-fs8.png,2659,729;x_deadmeat/x_pictos/d_2844.png,2424,717;x_deadmeat/x_pictos/d_1694-fs8.png,2374,711;x_deadmeat/x_pictos/d_1694-fs8.png,2704,738;x_deadmeat/x_pictos/d_2847.png,2613,743;x_deadmeat/x_pictos/d_1764-fs8.png,2566,717;x_deadmeat/x_pictos/d_2844.png,2504,730;x_transformice/x_inventaire/2527.jpg,3032,423;x_transformice/x_inventaire/2527.jpg,3199,379;x_transformice/x_inventaire/2528.jpg,3358,412;x_deadmeat/x_pictos/d_1208-fs8.png,3629,490;x_deadmeat/x_pictos/d_1208-fs8.png,3574,453;x_deadmeat/x_pictos/d_1208-fs8.png,3463,466;x_deadmeat/x_pictos/d_1694-fs8.png,3650,412;x_deadmeat/x_pictos/d_1694-fs8.png,3412,443;x_deadmeat/x_pictos/d_1694-fs8.png,3380,443;x_deadmeat/x_pictos/d_1694-fs8.png,3862,464;x_deadmeat/x_pictos/d_1694-fs8.png,3260,442;x_deadmeat/x_pictos/d_1694-fs8.png,3547,430;x_deadmeat/x_pictos/d_1694-fs8.png,3820,434;x_deadmeat/x_pictos/d_2847.png,3169,463;x_deadmeat/x_pictos/d_2847.png,3526,450;x_deadmeat/x_pictos/d_1098-fs8.png,3280,470;x_deadmeat/x_pictos/d_1098-fs8.png,3597,444;x_deadmeat/x_pictos/d_1098-fs8.png,3486,453;x_deadmeat/x_pictos/d_2844.png,3357,445;x_deadmeat/x_pictos/d_2844.png,3619,437;x_deadmeat/x_pictos/d_3136.png,3759,444;x_deadmeat/x_pictos/d_1219-fs8.png,3706,439;x_deadmeat/x_pictos/d_1219-fs8.png,3314,427;x_deadmeat/x_pictos/d_1219-fs8.png,3201,441;x_deadmeat/x_pictos/d_1219-fs8.png,3672,407;x_deadmeat/x_pictos/d_1219-fs8.png,3235,441;x_transformice/x_inventaire/2527.jpg,2363,453;x_transformice/x_inventaire/2526.jpg,2384,406;x_transformice/x_inventaire/2528.jpg,2533,428;x_deadmeat/x_pictos/d_1208-fs8.png,2837,468;x_deadmeat/x_pictos/d_1208-fs8.png,2726,481;x_deadmeat/x_pictos/d_1694-fs8.png,2810,445;x_deadmeat/x_pictos/d_2847.png,2789,465;x_deadmeat/x_pictos/d_1098-fs8.png,2749,468;x_deadmeat/x_pictos/d_1694-fs8.png,2677,444;x_deadmeat/x_pictos/d_2847.png,2586,465;x_deadmeat/x_pictos/d_1764-fs8.png,2471,432;x_deadmeat/x_pictos/d_2844.png,2418,468;x_deadmeat/x_pictos/d_2844.png,2329,483;x_deadmeat/x_pictos/d_1219-fs8.png,2618,443;x_deadmeat/x_pictos/d_1219-fs8.png,2652,443;x_deadmeat/x_pictos/d_1208-fs8.png,1909,515;x_deadmeat/x_pictos/d_1694-fs8.png,2278,472;x_deadmeat/x_pictos/d_2844.png,1875,543;x_deadmeat/x_pictos/d_2844.png,1982,526;x_deadmeat/x_pictos/d_1733-fs8.png,2179,502;x_deadmeat/x_pictos/d_1733-fs8.png,2088,522;x_deadmeat/x_pictos/d_1219-fs8.png,1960,513;x_deadmeat/x_pictos/d_1797-fs8.png,2694,409;x_transformice/x_inventaire/2526.jpg,3017,605;x_transformice/x_inventaire/2527.jpg,2996,652;x_transformice/x_inventaire/2527.jpg,2829,696;x_transformice/x_inventaire/2528.jpg,3236,697;x_transformice/x_inventaire/2528.jpg,3345,638;x_transformice/x_inventaire/2528.jpg,3573,649;x_transformice/x_inventaire/2528.jpg,3466,673;x_transformice/x_inventaire/2527.jpg,1583,642;x_transformice/x_inventaire/2527.jpg,1477,600;x_transformice/x_inventaire/2527.jpg,1406,606;x_transformice/x_inventaire/2527.jpg,1073,788;x_transformice/x_inventaire/2527.jpg,1114,699;x_transformice/x_inventaire/2526.jpg,1851,572;x_transformice/x_inventaire/2526.jpg,1153,750;x_transformice/x_inventaire/2526.jpg,1248,664;x_transformice/x_inventaire/2526.jpg,1307,606;x_transformice/x_inventaire/2526.jpg,1265,543;x_deadmeat/x_campement/Nuages.png,3173,-338;x_deadmeat/x_campement/Nuages.png,2825,-113;x_deadmeat/x_campement/Nuages.png,652,-145;x_deadmeat/x_campement/Nuages.png,1067,-10;x_deadmeat/x_pictos/d_1797-fs8.png,3617,410;x_deadmeat/x_pictos/d_1797-fs8.png,3469,409;x_deadmeat/x_pictos/d_1797-fs8.png,2874,405;x_deadmeat/x_pictos/d_1797-fs8.png,2524,409;x_deadmeat/x_pictos/d_1797-fs8.png,1754,409;x_deadmeat/x_pictos/d_1797-fs8.png,2380,408;x_deadmeat/x_pictos/d_1797-fs8.png,1610,408;x_deadmeat/x_pictos/d_1797-fs8.png,2243,411;x_deadmeat/x_pictos/d_1797-fs8.png,1473,411;x_deadmeat/x_pictos/d_1797-fs8.png,2089,414;x_deadmeat/x_pictos/d_1797-fs8.png,1319,414;x_deadmeat/x_pictos/d_1797-fs8.png,1930,409;x_deadmeat/x_pictos/d_1797-fs8.png,1160,409;../godspaw/img/drapeau1.png,1506,642;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4424,-84;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3940,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3014,-8;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3526,16;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3184,-160;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2578,-70;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2280,-164;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2042,-26;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1578,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,256,-182;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,690,-188;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1038,-26;../godspaw/img/drapeau0.png,4100,78;../godspaw/img/drapeau0.png,3680,148;../godspaw/img/drapeau0.png,1860,156;../godspaw/img/drapeau0.png,2858,154;../godspaw/img/drapeau0.png,2384,102;x_bouboum/x_skin/x_skin_11/x_illu_300.png,4250,100;x_deadmeat/x_pictos/d_1208-fs8.png,4568,790;x_deadmeat/x_pictos/d_1208-fs8.png,4109,797;x_deadmeat/x_pictos/d_1208-fs8.png,3507,775;x_deadmeat/x_pictos/d_1208-fs8.png,4623,753;x_deadmeat/x_pictos/d_1208-fs8.png,4054,760;x_deadmeat/x_pictos/d_1208-fs8.png,3452,738;x_deadmeat/x_pictos/d_1208-fs8.png,4734,766;x_deadmeat/x_pictos/d_1208-fs8.png,3943,773;x_deadmeat/x_pictos/d_1208-fs8.png,3341,751;x_deadmeat/x_pictos/d_1208-fs8.png,368,621;x_deadmeat/x_pictos/d_1694-fs8.png,431,595;x_deadmeat/x_pictos/d_1208-fs8.png,1880,700;x_deadmeat/x_pictos/d_1208-fs8.png,1715,730;x_deadmeat/x_pictos/d_1208-fs8.png,1534,764;x_deadmeat/x_pictos/d_1212-fs8.png,3547,355;x_deadmeat/x_pictos/d_1212-fs8.png,1726,349;x_deadmeat/x_pictos/d_1212-fs8.png,3441,352;x_deadmeat/x_pictos/d_1212-fs8.png,1620,346;x_deadmeat/x_pictos/d_1212-fs8.png,3170,352;x_deadmeat/x_pictos/d_1212-fs8.png,1349,346;x_deadmeat/x_pictos/d_1212-fs8.png,3343,354;x_deadmeat/x_pictos/d_1212-fs8.png,1522,348;x_deadmeat/x_pictos/d_1212-fs8.png,3072,354;x_deadmeat/x_pictos/d_1212-fs8.png,1251,348;x_deadmeat/x_pictos/d_1212-fs8.png,3260,352;x_deadmeat/x_pictos/d_1212-fs8.png,1439,346;x_deadmeat/x_pictos/d_1212-fs8.png,2989,352;x_deadmeat/x_pictos/d_1212-fs8.png,1168,346;x_deadmeat/x_pictos/d_1694-fs8.png,1331,643;x_deadmeat/x_pictos/d_1694-fs8.png,2066,647;x_deadmeat/x_pictos/d_1694-fs8.png,2250,684;x_deadmeat/x_pictos/d_1694-fs8.png,3528,697;x_deadmeat/x_pictos/d_1694-fs8.png,3892,750;x_deadmeat/x_pictos/d_1694-fs8.png,3290,728;x_deadmeat/x_pictos/d_1694-fs8.png,3860,750;x_deadmeat/x_pictos/d_1694-fs8.png,3258,728;x_deadmeat/x_pictos/d_1694-fs8.png,2740,760;x_deadmeat/x_pictos/d_1694-fs8.png,3740,749;x_deadmeat/x_pictos/d_1694-fs8.png,3138,727;x_deadmeat/x_pictos/d_1694-fs8.png,4642,730;x_deadmeat/x_pictos/d_1694-fs8.png,4027,737;x_deadmeat/x_pictos/d_1694-fs8.png,3425,715;x_deadmeat/x_pictos/d_1694-fs8.png,4369,734;x_deadmeat/x_pictos/d_1694-fs8.png,4300,741;x_deadmeat/x_pictos/d_1694-fs8.png,3698,719;x_deadmeat/x_pictos/d_1206-fs8.png,3655,322;x_deadmeat/x_pictos/d_1206-fs8.png,1804,321;x_deadmeat/x_pictos/d_1206-fs8.png,3403,320;x_deadmeat/x_pictos/d_1206-fs8.png,1552,319;x_deadmeat/x_pictos/d_1206-fs8.png,3149,319;x_deadmeat/x_pictos/d_1206-fs8.png,1298,318;x_deadmeat/x_pictos/d_1206-fs8.png,4620,322;x_deadmeat/x_pictos/d_1206-fs8.png,3530,322;x_deadmeat/x_pictos/d_1206-fs8.png,1679,321;x_deadmeat/x_pictos/d_1206-fs8.png,3278,320;x_deadmeat/x_pictos/d_1206-fs8.png,1427,319;x_deadmeat/x_pictos/d_1206-fs8.png,3024,319;x_deadmeat/x_pictos/d_1206-fs8.png,613,318;x_deadmeat/x_pictos/d_1206-fs8.png,1173,318;x_deadmeat/x_pictos/d_1206-fs8.png,4702,321;x_deadmeat/x_pictos/d_1206-fs8.png,3612,321;x_deadmeat/x_pictos/d_1206-fs8.png,1761,320;x_deadmeat/x_pictos/d_1206-fs8.png,3360,319;x_deadmeat/x_pictos/d_1206-fs8.png,1509,318;x_deadmeat/x_pictos/d_1206-fs8.png,3106,318;x_deadmeat/x_pictos/d_1206-fs8.png,1255,317;x_deadmeat/x_pictos/d_1206-fs8.png,4577,321;x_deadmeat/x_pictos/d_1206-fs8.png,3487,321;x_deadmeat/x_pictos/d_1206-fs8.png,1636,320;x_deadmeat/x_pictos/d_1206-fs8.png,3235,319;x_deadmeat/x_pictos/d_1206-fs8.png,1384,318;x_deadmeat/x_pictos/d_1206-fs8.png,2981,318;x_deadmeat/x_pictos/d_1206-fs8.png,570,317;x_deadmeat/x_pictos/d_1206-fs8.png,1130,317;x_deadmeat/x_pictos/d_1206-fs8.png,4659,321;x_deadmeat/x_pictos/d_1206-fs8.png,3569,321;x_deadmeat/x_pictos/d_1206-fs8.png,1718,320;x_deadmeat/x_pictos/d_1206-fs8.png,3317,319;x_deadmeat/x_pictos/d_1206-fs8.png,1466,318;x_deadmeat/x_pictos/d_1206-fs8.png,3063,318;x_deadmeat/x_pictos/d_1206-fs8.png,1212,317;x_deadmeat/x_pictos/d_1206-fs8.png,3444,321;x_deadmeat/x_pictos/d_1206-fs8.png,1593,320;x_deadmeat/x_pictos/d_1206-fs8.png,3192,319;x_deadmeat/x_pictos/d_1206-fs8.png,1341,318;x_deadmeat/x_pictos/d_1206-fs8.png,2938,318;x_deadmeat/x_pictos/d_1206-fs8.png,527,317;x_deadmeat/x_pictos/d_1206-fs8.png,1087,317;x_deadmeat/x_pictos/d_10-fs8.png,3688,255;x_deadmeat/x_pictos/d_10-fs8.png,4382,248;x_deadmeat/x_pictos/d_10-fs8.png,3848,193;x_deadmeat/x_pictos/d_10-fs8.png,3970,194;x_deadmeat/x_pictos/d_10-fs8.png,4095,198;x_deadmeat/x_pictos/d_10-fs8.png,4224,206;x_deadmeat/x_pictos/d_16-fs8.png,4355,59;x_deadmeat/x_pictos/d_16-fs8.png,4046,-1;x_deadmeat/x_pictos/d_16-fs8.png,3799,42;x_deadmeat/x_pictos/d_16-fs8.png,2777,73;x_deadmeat/x_pictos/d_16-fs8.png,2528,30;x_deadmeat/x_pictos/d_16-fs8.png,2265,24;x_deadmeat/x_pictos/d_16-fs8.png,1911,60;x_deadmeat/x_pictos/d_16-fs8.png,1773,84;x_deadmeat/x_pictos/d_2847.png,3047,748;x_deadmeat/x_pictos/d_2847.png,4664,750;x_deadmeat/x_pictos/d_2847.png,4006,757;x_deadmeat/x_pictos/d_2847.png,3404,735;x_deadmeat/x_pictos/d_1098-fs8.png,3158,755;x_deadmeat/x_pictos/d_1098-fs8.png,4554,744;x_deadmeat/x_pictos/d_1098-fs8.png,4077,751;x_deadmeat/x_pictos/d_1098-fs8.png,3475,729;x_deadmeat/x_pictos/d_1098-fs8.png,4665,753;x_deadmeat/x_pictos/d_1098-fs8.png,3966,760;x_deadmeat/x_pictos/d_1098-fs8.png,3364,738;x_deadmeat/x_pictos/d_1098-fs8.png,810,666;x_deadmeat/x_pictos/d_1098-fs8.png,1555,744;x_bouboum/x_skin/x_skin_18/x_illu_300.png,1550,522;x_deadmeat/x_pictos/d_2847.png,927,99;x_deadmeat/x_pictos/d_2847.png,643,98;x_deadmeat/x_pictos/d_3283.png,285,-89;x_deadmeat/x_pictos/d_3283.png,43,-90;x_deadmeat/x_pictos/d_1733-fs8.png,906,144;x_deadmeat/x_pictos/d_1733-fs8.png,623,142;x_deadmeat/x_pictos/d_1583-fs8.png,676,-44;x_deadmeat/x_pictos/d_1078-fs8.png,-185,-96;x_deadmeat/x_pictos/d_1078-fs8.png,-163,18;x_deadmeat/x_pictos/d_1078-fs8.png,-205,23;x_deadmeat/x_pictos/d_10-fs8.png,145,-77;x_deadmeat/x_pictos/d_20-fs8.png,-103,99;x_deadmeat/x_pictos/d_20-fs8.png,-19,100;x_deadmeat/x_pictos/d_20-fs8.png,111,90;x_deadmeat/x_pictos/d_20-fs8.png,443,95;x_deadmeat/x_pictos/d_20-fs8.png,360,91;x_deadmeat/x_pictos/d_20-fs8.png,216,96;x_transformice/x_evt/x_evt_25/abwnpzec/pont-bois.png,558,196;x_deadmeat/x_pictos/d_1764-fs8.png,1245,628;x_deadmeat/x_pictos/d_1764-fs8.png,1412,652;x_deadmeat/x_pictos/d_1764-fs8.png,1838,639;x_deadmeat/x_pictos/d_1764-fs8.png,2111,613;x_deadmeat/x_pictos/d_1764-fs8.png,2932,715;x_deadmeat/x_pictos/d_2844.png,3837,752;x_deadmeat/x_pictos/d_2844.png,3235,730;x_deadmeat/x_pictos/d_2844.png,4504,737;x_deadmeat/x_pictos/d_2844.png,4099,744;x_deadmeat/x_pictos/d_2844.png,3497,722;x_deadmeat/x_pictos/d_2844.png,2879,751;x_deadmeat/x_pictos/d_2844.png,2790,766;x_deadmeat/x_pictos/d_2844.png,453,622;x_deadmeat/x_pictos/d_2844.png,535,627;x_deadmeat/x_pictos/d_2844.png,841,672;x_deadmeat/x_pictos/d_2844.png,938,687;x_deadmeat/x_pictos/d_2844.png,1025,699;x_deadmeat/x_pictos/d_2844.png,1104,707;x_deadmeat/x_pictos/d_2844.png,1411,760;x_deadmeat/x_pictos/d_2844.png,1532,756;x_deadmeat/x_pictos/d_2844.png,1846,728;x_deadmeat/x_pictos/d_2844.png,1953,711;x_deadmeat/x_pictos/d_3136.png,1757,665;x_deadmeat/x_pictos/d_3136.png,2207,629;x_deadmeat/x_pictos/d_3136.png,4453,765;x_deadmeat/x_pictos/d_3136.png,4224,772;x_deadmeat/x_pictos/d_3136.png,3637,729;x_deadmeat/x_pictos/d_2336.png,2164,668;x_deadmeat/x_pictos/d_2336.png,2077,672;x_deadmeat/x_pictos/d_2336.png,1800,702;x_deadmeat/x_pictos/d_2336.png,1715,705;x_deadmeat/x_pictos/d_2336.png,1625,711;x_deadmeat/x_pictos/d_2336.png,1376,714;x_deadmeat/x_pictos/d_2336.png,1291,704;x_deadmeat/x_pictos/d_2336.png,1212,684;x_deadmeat/x_pictos/d_2336.png,734,613;x_deadmeat/x_pictos/d_2336.png,648,601;x_deadmeat/x_pictos/d_1733-fs8.png,623,644;x_deadmeat/x_pictos/d_1733-fs8.png,710,656;x_deadmeat/x_pictos/d_1733-fs8.png,2143,708;x_deadmeat/x_pictos/d_1733-fs8.png,2057,713;x_deadmeat/x_pictos/d_1733-fs8.png,1776,741;x_deadmeat/x_pictos/d_1733-fs8.png,1692,746;x_deadmeat/x_pictos/d_1733-fs8.png,1603,753;x_deadmeat/x_pictos/d_1733-fs8.png,1353,755;x_deadmeat/x_pictos/d_1733-fs8.png,1272,742;x_deadmeat/x_pictos/d_1733-fs8.png,1190,727;x_deadmeat/x_pictos/d_1219-fs8.png,3584,724;x_deadmeat/x_pictos/d_1219-fs8.png,3192,712;x_deadmeat/x_pictos/d_1219-fs8.png,3079,726;x_deadmeat/x_pictos/d_1219-fs8.png,2756,756;x_deadmeat/x_pictos/d_1219-fs8.png,3550,692;x_deadmeat/x_pictos/d_1219-fs8.png,3113,726;x_deadmeat/x_pictos/d_1219-fs8.png,2263,666;x_deadmeat/x_pictos/d_1219-fs8.png,1931,698;x_deadmeat/x_pictos/d_1219-fs8.png,1495,735;x_deadmeat/x_pictos/d_1219-fs8.png,923,655;x_deadmeat/x_pictos/d_1219-fs8.png,394,581;x_deadmeat/x_pictos/d_1219-fs8.png,1154,332;x_deadmeat/x_pictos/d_1219-fs8.png,1488,727;x_deadmeat/x_pictos/d_1797-fs8.png,3322,408;x_deadmeat/x_pictos/d_1797-fs8.png,3181,412;x_deadmeat/x_pictos/d_1797-fs8.png,3031,410;x_deadmeat/x_pictos/d_1098-fs8.png,706,610;x_bouboum/x_fond/x_f2.jpg,2400,-450;x_bouboum/x_fond/x_f2.jpg,2400,-50;x_bouboum/x_fond/x_f2.jpg,1600,-450;x_bouboum/x_fond/x_f2.jpg,1600,-50;x_bouboum/x_fond/x_f2.jpg,800,-450;x_bouboum/x_fond/x_f2.jpg,800,-50;x_bouboum/x_fond/x_f2.jpg,0,-450;x_bouboum/x_fond/x_f2.jpg,3200,-450;x_bouboum/x_fond/x_f2.jpg,3200,-50;x_bouboum/x_fond/x_f2.jpg,4000,-450;x_bouboum/x_fond/x_f2.jpg,0,-50;x_bouboum/x_fond/x_f2.jpg,4000,-50" MEDATA="32,1;;;;-0;0:::1-" L="4800" G="0,8.65" DS="m;362,181,2421,275,4134,252" H="800" /><Z><S><S Y="350" T="5" P="0,0,0.3,0.2,0,0,0,0" L="400" H="120" X="2400" /><S Y="384" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="400" H="120" X="2015" /><S Y="384" T="5" P="0,0,0.3,0.2,10,0,0,0" L="400" H="120" X="2785" /><S Y="-650" T="12" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="700" H="10" /><S Y="-650" T="12" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="4100" H="10" /><S Y="550" T="5" P="0,0,0.3,0.2,0,0,0,0" L="780" H="675" X="190" /><S Y="463" T="5" P="0,0,0.3,0.2,0,0,0,0" L="397" H="312" X="863" /><S Y="479" T="5" P="0,0,0.3,0.2,40,0,0,0" L="280" H="225" X="1093" /><S Y="1025" T="5" P="0,0,0.3,0.2,40,0,0,0" L="780" H="1015" X="-156" /><S Y="548" T="5" P="0,0,0.3,0.2,2,0,0,0" L="484" H="76" X="2707" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" H="1500" X="1310" /><S Y="916" T="5" P="0,0,0.3,0.2,-5,0,0,0" L="880" H="275" X="1904" /><S Y="871" T="5" P="0,0,0.3,0.2,8,0,0,0" L="1226" H="275" X="947" /><S Y="206" T="7" P="0,0,0.1,0.2,0,0,0,0" L="780" H="18" X="190" /><S Y="297" T="7" P="0,0,0.1,0.2,0,0,0,0" L="394" H="18" X="863" /><S Y="493" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="480" H="378" X="3929" /><S Y="505" T="5" P="0,0,0.3,0.2,10,0,0,0" L="480" H="401" X="4335" /><S Y="909" T="5" P="0,0,0.3,0.2,3,0,0,0" L="848" H="225" X="4012" /><S Y="905" T="5" P="0,0,0.3,0.2,-2,0,0,0" L="848" H="225" X="3185" /><S Y="35" T="5" P="0,0,0,0.2,-95,0,0,0" L="2105" H="715" X="5073" /><S Y="213" T="12" P="0,0,0.3,0.2,0,0,0,0" L="447" o="ffffffff" X="804" H="21" /><S Y="225" T="12" P="0,0,0.3,0.2,25,0,0,0" L="70" o="ffffffff" X="1053" H="21" /><S Y="-27" T="12" P="0,0,0,0.01,90,0,0,0" L="1447" o="ffffffff" X="0" H="21" /><S Y="-25" T="12" P="0,0,0,0,90,0,0,0" L="1447" o="ffffffff" X="-25" H="21" /><S Y="910" T="5" P="0,0,0.3,0.2,-3,0,0,0" L="848" H="225" X="4474" /><S Y="912" T="5" P="0,0,0.3,0.2,8,0,0,0" L="534" H="275" X="2571" /><S Y="558" T="5" P="0,0,0.3,0.2,2,0,0,0" L="627" H="141" X="3415" /><S Y="573" T="5" P="0,0,0.3,0.2,2,0,0,0" L="603" H="76" X="2644" /><S Y="596" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" H="76" X="2118" /><S Y="469" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" H="76" X="2071" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" H="1500" X="4290" /><S Y="505" T="5" P="0,0,0.3,0.2,20,0,0,0" L="280" H="225" X="1034" /><S Y="580" T="9" m="" P="0,0,0,0,0,0,0,0" L="3000" X="2080" H="460" /><S Y="580" T="9" m="" P="0,0,0,0,0,0,0,0" L="2000" X="4580" H="460" /></S><D><P Y="810" T="88" X="3992" P="0,0" /><P Y="803" T="88" X="4724" P="0,1" /><P Y="792" T="85" P="0,0" X="3494" C="4b8e72" /><P Y="787" T="85" P="0,0" X="3815" C="4b8e72" /><P Y="810" T="85" P="0,0" X="3557" C="4b8e72" /><P Y="832" T="85" P="0,0" X="4159" C="4b8e72" /><P Y="825" T="85" P="0,1" X="4557" C="4b8e72" /><P Y="785" T="79" X="3678" P="0,0" /><P Y="807" T="79" X="4280" P="0,0" /><P Y="800" T="79" X="4436" P="0,1" /><P Y="200" T="4" X="31" P="0,0" /><DC Y="184" X="-12" /><P Y="326" T="2" X="1996" P="0,0" /><P Y="296" T="2" X="2200" P="0,0" /><P Y="296" T="2" X="2622" P="0,0" /><P Y="314" T="12" X="2090" P="0,0" /><P Y="296" T="12" X="2328" P="0,0" /><P Y="330" T="12" X="2772" P="0,0" /><P Y="296" T="13" X="2258" P="0,0" /><P Y="340" T="13" X="2842" P="0,0" /><P Y="342" T="0" X="1942" P="0,0" /><P Y="298" T="0" X="3970" P="0,0" /><P Y="292" T="0" X="4240" P="0,0" /><P Y="294" T="3" X="3978" P="0,0" /><P Y="274" T="3" X="4096" P="0,0" /><P Y="348" T="3" X="3680" P="0,0" /><P Y="352" T="0" X="4572" P="0,0" /><P Y="324" T="2" X="3816" P="0,0" /><P Y="302" T="2" X="3946" P="0,0" /><P Y="282" T="2" X="4234" P="0,0" /><P Y="302" T="1" X="4030" P="0,0" /><P Y="302" T="1" X="4258" P="0,0" /><P Y="308" T="1" X="2180" P="0,0" /><P Y="320" T="1" X="2726" P="0,0" /><T Y="744" X="2332" /><T Y="808" X="4351" /><T Y="734" X="942" /></D><O /><L /></Z></C>', '<C><P  D="x_bouboum/x_skin/x_skin_25/x_illu_300.png,1555,560;x_deadmeat/x_pictos/d_1219-fs8.png,2659,729;x_deadmeat/x_pictos/d_2844.png,2424,717;x_deadmeat/x_pictos/d_1694-fs8.png,2374,711;x_deadmeat/x_pictos/d_1694-fs8.png,2704,738;x_deadmeat/x_pictos/d_2847.png,2613,743;x_deadmeat/x_pictos/d_1764-fs8.png,2566,717;x_deadmeat/x_pictos/d_2844.png,2504,730;x_transformice/x_inventaire/2527.jpg,3032,423;x_transformice/x_inventaire/2527.jpg,3199,379;x_transformice/x_inventaire/2528.jpg,3358,412;x_deadmeat/x_pictos/d_1208-fs8.png,3629,490;x_deadmeat/x_pictos/d_1208-fs8.png,3574,453;x_deadmeat/x_pictos/d_1208-fs8.png,3463,466;x_deadmeat/x_pictos/d_1694-fs8.png,3650,412;x_deadmeat/x_pictos/d_1694-fs8.png,3412,443;x_deadmeat/x_pictos/d_1694-fs8.png,3380,443;x_deadmeat/x_pictos/d_1694-fs8.png,3862,464;x_deadmeat/x_pictos/d_1694-fs8.png,3260,442;x_deadmeat/x_pictos/d_1694-fs8.png,3547,430;x_deadmeat/x_pictos/d_1694-fs8.png,3820,434;x_deadmeat/x_pictos/d_2847.png,3169,463;x_deadmeat/x_pictos/d_2847.png,3526,450;x_deadmeat/x_pictos/d_1098-fs8.png,3280,470;x_deadmeat/x_pictos/d_1098-fs8.png,3597,444;x_deadmeat/x_pictos/d_1098-fs8.png,3486,453;x_deadmeat/x_pictos/d_2844.png,3357,445;x_deadmeat/x_pictos/d_2844.png,3619,437;x_deadmeat/x_pictos/d_3136.png,3759,444;x_deadmeat/x_pictos/d_1219-fs8.png,3706,439;x_deadmeat/x_pictos/d_1219-fs8.png,3314,427;x_deadmeat/x_pictos/d_1219-fs8.png,3201,441;x_deadmeat/x_pictos/d_1219-fs8.png,3672,407;x_deadmeat/x_pictos/d_1219-fs8.png,3235,441;x_transformice/x_inventaire/2527.jpg,2363,453;x_transformice/x_inventaire/2526.jpg,2384,406;x_transformice/x_inventaire/2528.jpg,2533,428;x_deadmeat/x_pictos/d_1208-fs8.png,2837,468;x_deadmeat/x_pictos/d_1208-fs8.png,2726,481;x_deadmeat/x_pictos/d_1694-fs8.png,2810,445;x_deadmeat/x_pictos/d_2847.png,2789,465;x_deadmeat/x_pictos/d_1098-fs8.png,2749,468;x_deadmeat/x_pictos/d_1694-fs8.png,2677,444;x_deadmeat/x_pictos/d_2847.png,2586,465;x_deadmeat/x_pictos/d_1764-fs8.png,2471,432;x_deadmeat/x_pictos/d_2844.png,2418,468;x_deadmeat/x_pictos/d_2844.png,2329,483;x_deadmeat/x_pictos/d_1219-fs8.png,2618,443;x_deadmeat/x_pictos/d_1219-fs8.png,2652,443;x_deadmeat/x_pictos/d_1208-fs8.png,1909,515;x_deadmeat/x_pictos/d_1694-fs8.png,2278,472;x_deadmeat/x_pictos/d_2844.png,1875,543;x_deadmeat/x_pictos/d_2844.png,1982,526;x_deadmeat/x_pictos/d_1733-fs8.png,2179,502;x_deadmeat/x_pictos/d_1733-fs8.png,2088,522;x_deadmeat/x_pictos/d_1219-fs8.png,1960,513;x_deadmeat/x_pictos/d_1797-fs8.png,2694,409;x_transformice/x_inventaire/2526.jpg,3017,605;x_transformice/x_inventaire/2527.jpg,2996,652;x_transformice/x_inventaire/2527.jpg,2829,696;x_transformice/x_inventaire/2528.jpg,3236,697;x_transformice/x_inventaire/2528.jpg,3345,638;x_transformice/x_inventaire/2528.jpg,3573,649;x_transformice/x_inventaire/2528.jpg,3466,673;x_transformice/x_inventaire/2527.jpg,1583,642;x_transformice/x_inventaire/2527.jpg,1477,600;x_transformice/x_inventaire/2527.jpg,1406,606;x_transformice/x_inventaire/2527.jpg,1073,788;x_transformice/x_inventaire/2527.jpg,1114,699;x_transformice/x_inventaire/2526.jpg,1851,572;x_transformice/x_inventaire/2526.jpg,1153,750;x_transformice/x_inventaire/2526.jpg,1248,664;x_transformice/x_inventaire/2526.jpg,1307,606;x_transformice/x_inventaire/2526.jpg,1265,543;x_deadmeat/x_pictos/d_1797-fs8.png,3617,410;x_deadmeat/x_pictos/d_1797-fs8.png,3469,409;x_deadmeat/x_pictos/d_1797-fs8.png,2874,405;x_deadmeat/x_pictos/d_1797-fs8.png,2524,409;x_deadmeat/x_pictos/d_1797-fs8.png,1754,409;x_deadmeat/x_pictos/d_1797-fs8.png,2380,408;x_deadmeat/x_pictos/d_1797-fs8.png,1610,408;x_deadmeat/x_pictos/d_1797-fs8.png,2243,411;x_deadmeat/x_pictos/d_1797-fs8.png,1473,411;x_deadmeat/x_pictos/d_1797-fs8.png,2089,414;x_deadmeat/x_pictos/d_1797-fs8.png,1319,414;x_deadmeat/x_pictos/d_1797-fs8.png,1930,409;x_deadmeat/x_pictos/d_1797-fs8.png,1160,409;../godspaw/img/drapeau1.png,1506,642;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4424,-84;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3940,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3014,-8;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3526,16;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3184,-160;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2280,-164;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1578,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,256,-182;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,690,-188;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1038,-26;../godspaw/img/drapeau0.png,4100,78;../godspaw/img/drapeau0.png,3680,148;../godspaw/img/drapeau0.png,1860,156;../godspaw/img/drapeau0.png,2858,154;../godspaw/img/drapeau0.png,2384,102;x_bouboum/x_skin/x_skin_23/x_illu_300.png,4259,24;x_deadmeat/x_pictos/d_1208-fs8.png,4568,790;x_deadmeat/x_pictos/d_1208-fs8.png,4109,797;x_deadmeat/x_pictos/d_1208-fs8.png,3507,775;x_deadmeat/x_pictos/d_1208-fs8.png,4623,753;x_deadmeat/x_pictos/d_1208-fs8.png,4054,760;x_deadmeat/x_pictos/d_1208-fs8.png,3452,738;x_deadmeat/x_pictos/d_1208-fs8.png,4734,766;x_deadmeat/x_pictos/d_1208-fs8.png,3943,773;x_deadmeat/x_pictos/d_1208-fs8.png,3341,751;x_deadmeat/x_pictos/d_1208-fs8.png,368,621;x_deadmeat/x_pictos/d_1694-fs8.png,431,595;x_deadmeat/x_pictos/d_1208-fs8.png,1880,700;x_deadmeat/x_pictos/d_1208-fs8.png,1715,730;x_deadmeat/x_pictos/d_1208-fs8.png,1534,764;x_deadmeat/x_pictos/d_1212-fs8.png,3547,355;x_deadmeat/x_pictos/d_1212-fs8.png,1726,349;x_deadmeat/x_pictos/d_1212-fs8.png,3441,352;x_deadmeat/x_pictos/d_1212-fs8.png,1620,346;x_deadmeat/x_pictos/d_1212-fs8.png,3170,352;x_deadmeat/x_pictos/d_1212-fs8.png,1349,346;x_deadmeat/x_pictos/d_1212-fs8.png,3343,354;x_deadmeat/x_pictos/d_1212-fs8.png,1522,348;x_deadmeat/x_pictos/d_1212-fs8.png,3072,354;x_deadmeat/x_pictos/d_1212-fs8.png,1251,348;x_deadmeat/x_pictos/d_1212-fs8.png,3260,352;x_deadmeat/x_pictos/d_1212-fs8.png,1439,346;x_deadmeat/x_pictos/d_1212-fs8.png,2989,352;x_deadmeat/x_pictos/d_1212-fs8.png,1168,346;x_deadmeat/x_pictos/d_1694-fs8.png,1331,643;x_deadmeat/x_pictos/d_1694-fs8.png,2066,647;x_deadmeat/x_pictos/d_1694-fs8.png,2250,684;x_deadmeat/x_pictos/d_1694-fs8.png,3528,697;x_deadmeat/x_pictos/d_1694-fs8.png,3892,750;x_deadmeat/x_pictos/d_1694-fs8.png,3290,728;x_deadmeat/x_pictos/d_1694-fs8.png,3860,750;x_deadmeat/x_pictos/d_1694-fs8.png,3258,728;x_deadmeat/x_pictos/d_1694-fs8.png,2740,760;x_deadmeat/x_pictos/d_1694-fs8.png,3740,749;x_deadmeat/x_pictos/d_1694-fs8.png,3138,727;x_deadmeat/x_pictos/d_1694-fs8.png,4642,730;x_deadmeat/x_pictos/d_1694-fs8.png,4027,737;x_deadmeat/x_pictos/d_1694-fs8.png,3425,715;x_deadmeat/x_pictos/d_1694-fs8.png,4369,734;x_deadmeat/x_pictos/d_1694-fs8.png,4300,741;x_deadmeat/x_pictos/d_1694-fs8.png,3698,719;x_deadmeat/x_pictos/d_1206-fs8.png,3655,322;x_deadmeat/x_pictos/d_1206-fs8.png,1804,321;x_deadmeat/x_pictos/d_1206-fs8.png,3403,320;x_deadmeat/x_pictos/d_1206-fs8.png,1552,319;x_deadmeat/x_pictos/d_1206-fs8.png,3149,319;x_deadmeat/x_pictos/d_1206-fs8.png,1298,318;x_deadmeat/x_pictos/d_1206-fs8.png,4620,322;x_deadmeat/x_pictos/d_1206-fs8.png,3530,322;x_deadmeat/x_pictos/d_1206-fs8.png,1679,321;x_deadmeat/x_pictos/d_1206-fs8.png,3278,320;x_deadmeat/x_pictos/d_1206-fs8.png,1427,319;x_deadmeat/x_pictos/d_1206-fs8.png,3024,319;x_deadmeat/x_pictos/d_1206-fs8.png,613,318;x_deadmeat/x_pictos/d_1206-fs8.png,1173,318;x_deadmeat/x_pictos/d_1206-fs8.png,4702,321;x_deadmeat/x_pictos/d_1206-fs8.png,3612,321;x_deadmeat/x_pictos/d_1206-fs8.png,1761,320;x_deadmeat/x_pictos/d_1206-fs8.png,3360,319;x_deadmeat/x_pictos/d_1206-fs8.png,1509,318;x_deadmeat/x_pictos/d_1206-fs8.png,3106,318;x_deadmeat/x_pictos/d_1206-fs8.png,1255,317;x_deadmeat/x_pictos/d_1206-fs8.png,4577,321;x_deadmeat/x_pictos/d_1206-fs8.png,3487,321;x_deadmeat/x_pictos/d_1206-fs8.png,1636,320;x_deadmeat/x_pictos/d_1206-fs8.png,3235,319;x_deadmeat/x_pictos/d_1206-fs8.png,1384,318;x_deadmeat/x_pictos/d_1206-fs8.png,2981,318;x_deadmeat/x_pictos/d_1206-fs8.png,570,317;x_deadmeat/x_pictos/d_1206-fs8.png,1130,317;x_deadmeat/x_pictos/d_1206-fs8.png,4659,321;x_deadmeat/x_pictos/d_1206-fs8.png,3569,321;x_deadmeat/x_pictos/d_1206-fs8.png,1718,320;x_deadmeat/x_pictos/d_1206-fs8.png,3317,319;x_deadmeat/x_pictos/d_1206-fs8.png,1466,318;x_deadmeat/x_pictos/d_1206-fs8.png,3063,318;x_deadmeat/x_pictos/d_1206-fs8.png,1212,317;x_deadmeat/x_pictos/d_1206-fs8.png,3444,321;x_deadmeat/x_pictos/d_1206-fs8.png,1593,320;x_deadmeat/x_pictos/d_1206-fs8.png,3192,319;x_deadmeat/x_pictos/d_1206-fs8.png,1341,318;x_deadmeat/x_pictos/d_1206-fs8.png,2938,318;x_deadmeat/x_pictos/d_1206-fs8.png,527,317;x_deadmeat/x_pictos/d_1206-fs8.png,1087,317;x_deadmeat/x_pictos/d_10-fs8.png,3688,255;x_deadmeat/x_pictos/d_10-fs8.png,4382,248;x_deadmeat/x_pictos/d_10-fs8.png,3848,193;x_deadmeat/x_pictos/d_10-fs8.png,3970,194;x_deadmeat/x_pictos/d_10-fs8.png,4095,198;x_deadmeat/x_pictos/d_10-fs8.png,4224,206;x_deadmeat/x_pictos/d_16-fs8.png,4355,59;x_deadmeat/x_pictos/d_16-fs8.png,4046,-1;x_deadmeat/x_pictos/d_16-fs8.png,3799,42;x_deadmeat/x_pictos/d_16-fs8.png,2777,73;x_deadmeat/x_pictos/d_16-fs8.png,2528,30;x_deadmeat/x_pictos/d_16-fs8.png,2265,24;x_deadmeat/x_pictos/d_16-fs8.png,1911,60;x_deadmeat/x_pictos/d_16-fs8.png,1773,84;x_deadmeat/x_pictos/d_2847.png,3047,748;x_deadmeat/x_pictos/d_2847.png,4664,750;x_deadmeat/x_pictos/d_2847.png,4006,757;x_deadmeat/x_pictos/d_2847.png,3404,735;x_deadmeat/x_pictos/d_1098-fs8.png,3158,755;x_deadmeat/x_pictos/d_1098-fs8.png,4554,744;x_deadmeat/x_pictos/d_1098-fs8.png,4077,751;x_deadmeat/x_pictos/d_1098-fs8.png,3475,729;x_deadmeat/x_pictos/d_1098-fs8.png,4665,753;x_deadmeat/x_pictos/d_1098-fs8.png,3966,760;x_deadmeat/x_pictos/d_1098-fs8.png,3364,738;x_deadmeat/x_pictos/d_1098-fs8.png,810,666;x_deadmeat/x_pictos/d_1098-fs8.png,1555,744;x_deadmeat/x_pictos/d_2847.png,927,99;x_deadmeat/x_pictos/d_2847.png,643,98;x_deadmeat/x_pictos/d_3283.png,285,-89;x_deadmeat/x_pictos/d_3283.png,43,-90;x_deadmeat/x_pictos/d_1733-fs8.png,906,144;x_deadmeat/x_pictos/d_1733-fs8.png,623,142;x_deadmeat/x_pictos/d_1583-fs8.png,676,-44;x_deadmeat/x_pictos/d_1078-fs8.png,-185,-96;x_deadmeat/x_pictos/d_1078-fs8.png,-163,18;x_deadmeat/x_pictos/d_1078-fs8.png,-205,23;x_deadmeat/x_pictos/d_10-fs8.png,145,-77;x_deadmeat/x_pictos/d_20-fs8.png,-103,99;x_deadmeat/x_pictos/d_20-fs8.png,-19,100;x_deadmeat/x_pictos/d_20-fs8.png,111,90;x_deadmeat/x_pictos/d_20-fs8.png,443,95;x_deadmeat/x_pictos/d_20-fs8.png,360,91;x_deadmeat/x_pictos/d_20-fs8.png,216,96;x_transformice/x_evt/x_evt_25/abwnpzec/pont-bois.png,558,196;x_deadmeat/x_pictos/d_1764-fs8.png,1245,628;x_deadmeat/x_pictos/d_1764-fs8.png,1412,652;x_deadmeat/x_pictos/d_1764-fs8.png,1838,639;x_deadmeat/x_pictos/d_1764-fs8.png,2111,613;x_deadmeat/x_pictos/d_1764-fs8.png,2932,715;x_deadmeat/x_pictos/d_2844.png,3837,752;x_deadmeat/x_pictos/d_2844.png,3235,730;x_deadmeat/x_pictos/d_2844.png,4504,737;x_deadmeat/x_pictos/d_2844.png,4099,744;x_deadmeat/x_pictos/d_2844.png,3497,722;x_deadmeat/x_pictos/d_2844.png,2879,751;x_deadmeat/x_pictos/d_2844.png,2790,766;x_deadmeat/x_pictos/d_2844.png,453,622;x_deadmeat/x_pictos/d_2844.png,535,627;x_deadmeat/x_pictos/d_2844.png,841,672;x_deadmeat/x_pictos/d_2844.png,938,687;x_deadmeat/x_pictos/d_2844.png,1025,699;x_deadmeat/x_pictos/d_2844.png,1104,707;x_deadmeat/x_pictos/d_2844.png,1411,760;x_deadmeat/x_pictos/d_2844.png,1532,756;x_deadmeat/x_pictos/d_2844.png,1846,728;x_deadmeat/x_pictos/d_2844.png,1953,711;x_deadmeat/x_pictos/d_3136.png,1757,665;x_deadmeat/x_pictos/d_3136.png,2207,629;x_deadmeat/x_pictos/d_3136.png,4453,765;x_deadmeat/x_pictos/d_3136.png,4224,772;x_deadmeat/x_pictos/d_3136.png,3637,729;x_deadmeat/x_pictos/d_2336.png,2164,668;x_deadmeat/x_pictos/d_2336.png,2077,672;x_deadmeat/x_pictos/d_2336.png,1800,702;x_deadmeat/x_pictos/d_2336.png,1715,705;x_deadmeat/x_pictos/d_2336.png,1625,711;x_deadmeat/x_pictos/d_2336.png,1376,714;x_deadmeat/x_pictos/d_2336.png,1291,704;x_deadmeat/x_pictos/d_2336.png,1212,684;x_deadmeat/x_pictos/d_2336.png,734,613;x_deadmeat/x_pictos/d_2336.png,648,601;x_deadmeat/x_pictos/d_1733-fs8.png,623,644;x_deadmeat/x_pictos/d_1733-fs8.png,710,656;x_deadmeat/x_pictos/d_1733-fs8.png,2143,708;x_deadmeat/x_pictos/d_1733-fs8.png,2057,713;x_deadmeat/x_pictos/d_1733-fs8.png,1776,741;x_deadmeat/x_pictos/d_1733-fs8.png,1692,746;x_deadmeat/x_pictos/d_1733-fs8.png,1603,753;x_deadmeat/x_pictos/d_1733-fs8.png,1353,755;x_deadmeat/x_pictos/d_1733-fs8.png,1272,742;x_deadmeat/x_pictos/d_1733-fs8.png,1190,727;x_deadmeat/x_pictos/d_1219-fs8.png,3584,724;x_deadmeat/x_pictos/d_1219-fs8.png,3192,712;x_deadmeat/x_pictos/d_1219-fs8.png,3079,726;x_deadmeat/x_pictos/d_1219-fs8.png,2756,756;x_deadmeat/x_pictos/d_1219-fs8.png,3550,692;x_deadmeat/x_pictos/d_1219-fs8.png,3113,726;x_deadmeat/x_pictos/d_1219-fs8.png,2263,666;x_deadmeat/x_pictos/d_1219-fs8.png,1931,698;x_deadmeat/x_pictos/d_1219-fs8.png,1495,735;x_deadmeat/x_pictos/d_1219-fs8.png,923,655;x_deadmeat/x_pictos/d_1219-fs8.png,394,581;x_deadmeat/x_pictos/d_1219-fs8.png,1154,332;x_deadmeat/x_pictos/d_1219-fs8.png,1488,727;x_deadmeat/x_pictos/d_1797-fs8.png,3322,408;x_deadmeat/x_pictos/d_1797-fs8.png,3181,412;x_deadmeat/x_pictos/d_1797-fs8.png,3031,410;x_deadmeat/x_pictos/d_1098-fs8.png,706,610;x_bouboum/x_fond/x_f7.jpg,2400,-450;x_bouboum/x_fond/x_f7.jpg,2400,-50;x_bouboum/x_fond/x_f7.jpg,1600,-450;x_bouboum/x_fond/x_f7.jpg,1600,-50;x_bouboum/x_fond/x_f7.jpg,800,-450;x_bouboum/x_fond/x_f7.jpg,800,-50;x_bouboum/x_fond/x_f7.jpg,0,-450;x_bouboum/x_fond/x_f7.jpg,3200,-450;x_bouboum/x_fond/x_f7.jpg,3200,-50;x_bouboum/x_fond/x_f7.jpg,4000,-450;x_bouboum/x_fond/x_f7.jpg,0,-50;x_bouboum/x_fond/x_f7.jpg,4000,-50" DS="m;362,181,2421,275,4134,252" L="4800" G="0,8.65" MEDATA="32,1;;;;-0;0:::1-" H="800" /><Z><S><S Y="350" T="5" P="0,0,0.3,0.2,0,0,0,0" L="400" X="2400" H="120" /><S Y="384" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="400" X="2015" H="120" /><S Y="384" T="5" P="0,0,0.3,0.2,10,0,0,0" L="400" X="2785" H="120" /><S Y="-650" T="12" X="700" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" H="10" /><S Y="-650" T="12" X="4100" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" H="10" /><S Y="550" T="5" P="0,0,0.3,0.2,0,0,0,0" L="780" X="190" H="675" /><S Y="463" T="5" P="0,0,0.3,0.2,0,0,0,0" L="397" X="863" H="312" /><S Y="479" T="5" P="0,0,0.3,0.2,40,0,0,0" L="280" X="1093" H="225" /><S Y="1025" T="5" P="0,0,0.3,0.2,40,0,0,0" L="780" X="-156" H="1015" /><S Y="548" T="5" P="0,0,0.3,0.2,2,0,0,0" L="484" X="2707" H="76" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" X="1310" H="1500" /><S Y="916" T="5" P="0,0,0.3,0.2,-5,0,0,0" L="880" X="1904" H="275" /><S Y="871" T="5" P="0,0,0.3,0.2,8,0,0,0" L="1226" X="947" H="275" /><S Y="206" T="7" P="0,0,0.1,0.2,0,0,0,0" L="780" X="190" H="18" /><S Y="297" T="7" P="0,0,0.1,0.2,0,0,0,0" L="394" X="863" H="18" /><S Y="493" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="480" X="3929" H="378" /><S Y="505" T="5" P="0,0,0.3,0.2,10,0,0,0" L="480" X="4335" H="401" /><S Y="909" T="5" P="0,0,0.3,0.2,3,0,0,0" L="848" X="4012" H="225" /><S Y="905" T="5" P="0,0,0.3,0.2,-2,0,0,0" L="848" X="3185" H="225" /><S Y="35" T="5" P="0,0,0,0.2,-95,0,0,0" L="2105" X="5073" H="715" /><S Y="213" T="12" X="804" P="0,0,0.3,0.2,0,0,0,0" L="447" o="ffffffff" H="21" /><S Y="225" T="12" X="1053" P="0,0,0.3,0.2,25,0,0,0" L="70" o="ffffffff" H="21" /><S Y="-27" T="12" X="0" P="0,0,0,0.01,90,0,0,0" L="1447" o="ffffffff" H="21" /><S Y="-25" T="12" X="-25" P="0,0,0,0,90,0,0,0" L="1447" o="ffffffff" H="21" /><S Y="910" T="5" P="0,0,0.3,0.2,-3,0,0,0" L="848" X="4474" H="225" /><S Y="912" T="5" P="0,0,0.3,0.2,8,0,0,0" L="534" X="2571" H="275" /><S Y="558" T="5" P="0,0,0.3,0.2,2,0,0,0" L="627" X="3415" H="141" /><S Y="573" T="5" P="0,0,0.3,0.2,2,0,0,0" L="603" X="2644" H="76" /><S Y="596" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" X="2118" H="76" /><S Y="469" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" X="2071" H="76" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" X="4290" H="1500" /><S Y="505" T="5" P="0,0,0.3,0.2,20,0,0,0" L="280" X="1034" H="225" /><S Y="580" T="9" m="" H="460" P="0,0,0,0,0,0,0,0" L="3000" X="2080" /><S Y="580" T="9" m="" H="460" P="0,0,0,0,0,0,0,0" L="2000" X="4580" /></S><D><P Y="810" T="88" P="0,0" X="3992" /><P Y="803" T="88" P="0,1" X="4724" /><P Y="792" T="85" X="3494" P="0,0" C="4b8e72" /><P Y="787" T="85" X="3815" P="0,0" C="4b8e72" /><P Y="810" T="85" X="3557" P="0,0" C="4b8e72" /><P Y="832" T="85" X="4159" P="0,0" C="4b8e72" /><P Y="825" T="85" X="4557" P="0,1" C="4b8e72" /><P Y="785" T="79" P="0,0" X="3678" /><P Y="807" T="79" P="0,0" X="4280" /><P Y="800" T="79" P="0,1" X="4436" /><P Y="200" T="4" P="0,0" X="31" /><DC Y="184" X="-12" /><P Y="326" T="2" P="0,0" X="1996" /><P Y="296" T="2" P="0,0" X="2200" /><P Y="296" T="2" P="0,0" X="2622" /><P Y="314" T="12" P="0,0" X="2090" /><P Y="296" T="12" P="0,0" X="2328" /><P Y="330" T="12" P="0,0" X="2772" /><P Y="296" T="13" P="0,0" X="2258" /><P Y="340" T="13" P="0,0" X="2842" /><P Y="342" T="0" P="0,0" X="1942" /><P Y="298" T="0" P="0,0" X="3970" /><P Y="292" T="0" P="0,0" X="4240" /><P Y="294" T="3" P="0,0" X="3978" /><P Y="274" T="3" P="0,0" X="4096" /><P Y="348" T="3" P="0,0" X="3680" /><P Y="352" T="0" P="0,0" X="4572" /><P Y="324" T="2" P="0,0" X="3816" /><P Y="302" T="2" P="0,0" X="3946" /><P Y="282" T="2" P="0,0" X="4234" /><P Y="302" T="1" P="0,0" X="4030" /><P Y="302" T="1" P="0,0" X="4258" /><P Y="308" T="1" P="0,0" X="2180" /><P Y="320" T="1" P="0,0" X="2726" /><T Y="744" X="2332" /><T Y="808" X="4351" /><T Y="734" X="942" /></D><O /><L /></Z></C>', '<C><P  D="x_bouboum/x_skin/x_skin_8/x_illu_300.png,1518,524;x_deadmeat/x_pictos/d_1219-fs8.png,2659,729;x_deadmeat/x_pictos/d_2844.png,2424,717;x_deadmeat/x_pictos/d_1694-fs8.png,2374,711;x_deadmeat/x_pictos/d_1694-fs8.png,2704,738;x_deadmeat/x_pictos/d_2847.png,2613,743;x_deadmeat/x_pictos/d_1764-fs8.png,2566,717;x_deadmeat/x_pictos/d_2844.png,2504,730;x_transformice/x_inventaire/2527.jpg,3032,423;x_transformice/x_inventaire/2527.jpg,3199,379;x_transformice/x_inventaire/2528.jpg,3358,412;x_deadmeat/x_pictos/d_1208-fs8.png,3629,490;x_deadmeat/x_pictos/d_1208-fs8.png,3574,453;x_deadmeat/x_pictos/d_1208-fs8.png,3463,466;x_deadmeat/x_pictos/d_1694-fs8.png,3650,412;x_deadmeat/x_pictos/d_1694-fs8.png,3412,443;x_deadmeat/x_pictos/d_1694-fs8.png,3380,443;x_deadmeat/x_pictos/d_1694-fs8.png,3862,464;x_deadmeat/x_pictos/d_1694-fs8.png,3260,442;x_deadmeat/x_pictos/d_1694-fs8.png,3547,430;x_deadmeat/x_pictos/d_1694-fs8.png,3820,434;x_deadmeat/x_pictos/d_2847.png,3169,463;x_deadmeat/x_pictos/d_2847.png,3526,450;x_deadmeat/x_pictos/d_1098-fs8.png,3280,470;x_deadmeat/x_pictos/d_1098-fs8.png,3597,444;x_deadmeat/x_pictos/d_1098-fs8.png,3486,453;x_deadmeat/x_pictos/d_2844.png,3357,445;x_deadmeat/x_pictos/d_2844.png,3619,437;x_deadmeat/x_pictos/d_3136.png,3759,444;x_deadmeat/x_pictos/d_1219-fs8.png,3706,439;x_deadmeat/x_pictos/d_1219-fs8.png,3314,427;x_deadmeat/x_pictos/d_1219-fs8.png,3201,441;x_deadmeat/x_pictos/d_1219-fs8.png,3672,407;x_deadmeat/x_pictos/d_1219-fs8.png,3235,441;x_transformice/x_inventaire/2527.jpg,2363,453;x_transformice/x_inventaire/2526.jpg,2384,406;x_transformice/x_inventaire/2528.jpg,2533,428;x_deadmeat/x_pictos/d_1208-fs8.png,2837,468;x_deadmeat/x_pictos/d_1208-fs8.png,2726,481;x_deadmeat/x_pictos/d_1694-fs8.png,2810,445;x_deadmeat/x_pictos/d_2847.png,2789,465;x_deadmeat/x_pictos/d_1098-fs8.png,2749,468;x_deadmeat/x_pictos/d_1694-fs8.png,2677,444;x_deadmeat/x_pictos/d_2847.png,2586,465;x_deadmeat/x_pictos/d_1764-fs8.png,2471,432;x_deadmeat/x_pictos/d_2844.png,2418,468;x_deadmeat/x_pictos/d_2844.png,2329,483;x_deadmeat/x_pictos/d_1219-fs8.png,2618,443;x_deadmeat/x_pictos/d_1219-fs8.png,2652,443;x_deadmeat/x_pictos/d_1208-fs8.png,1909,515;x_deadmeat/x_pictos/d_1694-fs8.png,2278,472;x_deadmeat/x_pictos/d_2844.png,1875,543;x_deadmeat/x_pictos/d_2844.png,1982,526;x_deadmeat/x_pictos/d_1733-fs8.png,2179,502;x_deadmeat/x_pictos/d_1733-fs8.png,2088,522;x_deadmeat/x_pictos/d_1219-fs8.png,1960,513;x_deadmeat/x_pictos/d_1797-fs8.png,2694,409;x_transformice/x_inventaire/2526.jpg,3017,605;x_transformice/x_inventaire/2527.jpg,2996,652;x_transformice/x_inventaire/2527.jpg,2829,696;x_transformice/x_inventaire/2528.jpg,3236,697;x_transformice/x_inventaire/2528.jpg,3345,638;x_transformice/x_inventaire/2528.jpg,3573,649;x_transformice/x_inventaire/2528.jpg,3466,673;x_transformice/x_inventaire/2527.jpg,1583,642;x_transformice/x_inventaire/2527.jpg,1477,600;x_transformice/x_inventaire/2527.jpg,1406,606;x_transformice/x_inventaire/2527.jpg,1073,788;x_transformice/x_inventaire/2527.jpg,1114,699;x_transformice/x_inventaire/2526.jpg,1851,572;x_transformice/x_inventaire/2526.jpg,1153,750;x_transformice/x_inventaire/2526.jpg,1248,664;x_transformice/x_inventaire/2526.jpg,1307,606;x_transformice/x_inventaire/2526.jpg,1265,543;x_deadmeat/x_pictos/d_1797-fs8.png,3617,410;x_deadmeat/x_pictos/d_1797-fs8.png,3469,409;x_deadmeat/x_pictos/d_1797-fs8.png,2874,405;x_deadmeat/x_pictos/d_1797-fs8.png,2524,409;x_deadmeat/x_pictos/d_1797-fs8.png,1754,409;x_deadmeat/x_pictos/d_1797-fs8.png,2380,408;x_deadmeat/x_pictos/d_1797-fs8.png,1610,408;x_deadmeat/x_pictos/d_1797-fs8.png,2243,411;x_deadmeat/x_pictos/d_1797-fs8.png,1473,411;x_deadmeat/x_pictos/d_1797-fs8.png,2089,414;x_deadmeat/x_pictos/d_1797-fs8.png,1319,414;x_deadmeat/x_pictos/d_1797-fs8.png,1930,409;x_deadmeat/x_pictos/d_1797-fs8.png,1160,409;../godspaw/img/drapeau1.png,1506,642;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4424,-84;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3940,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3014,-8;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3526,16;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3184,-160;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2280,-164;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1578,-202;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,256,-182;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,690,-188;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1038,-26;../godspaw/img/drapeau0.png,4100,78;../godspaw/img/drapeau0.png,3680,148;../godspaw/img/drapeau0.png,1860,156;../godspaw/img/drapeau0.png,2858,154;../godspaw/img/drapeau0.png,2384,102;x_bouboum/x_skin/x_skin_5/x_illu_300.png,4267,49;x_deadmeat/x_pictos/d_1208-fs8.png,4568,790;x_deadmeat/x_pictos/d_1208-fs8.png,4109,797;x_deadmeat/x_pictos/d_1208-fs8.png,3507,775;x_deadmeat/x_pictos/d_1208-fs8.png,4623,753;x_deadmeat/x_pictos/d_1208-fs8.png,4054,760;x_deadmeat/x_pictos/d_1208-fs8.png,3452,738;x_deadmeat/x_pictos/d_1208-fs8.png,4734,766;x_deadmeat/x_pictos/d_1208-fs8.png,3943,773;x_deadmeat/x_pictos/d_1208-fs8.png,3341,751;x_deadmeat/x_pictos/d_1208-fs8.png,368,621;x_deadmeat/x_pictos/d_1694-fs8.png,431,595;x_deadmeat/x_pictos/d_1208-fs8.png,1880,700;x_deadmeat/x_pictos/d_1208-fs8.png,1715,730;x_deadmeat/x_pictos/d_1208-fs8.png,1534,764;x_deadmeat/x_pictos/d_1212-fs8.png,3547,355;x_deadmeat/x_pictos/d_1212-fs8.png,1726,349;x_deadmeat/x_pictos/d_1212-fs8.png,3441,352;x_deadmeat/x_pictos/d_1212-fs8.png,1620,346;x_deadmeat/x_pictos/d_1212-fs8.png,3170,352;x_deadmeat/x_pictos/d_1212-fs8.png,1349,346;x_deadmeat/x_pictos/d_1212-fs8.png,3343,354;x_deadmeat/x_pictos/d_1212-fs8.png,1522,348;x_deadmeat/x_pictos/d_1212-fs8.png,3072,354;x_deadmeat/x_pictos/d_1212-fs8.png,1251,348;x_deadmeat/x_pictos/d_1212-fs8.png,3260,352;x_deadmeat/x_pictos/d_1212-fs8.png,1439,346;x_deadmeat/x_pictos/d_1212-fs8.png,2989,352;x_deadmeat/x_pictos/d_1212-fs8.png,1168,346;x_deadmeat/x_pictos/d_1694-fs8.png,1331,643;x_deadmeat/x_pictos/d_1694-fs8.png,2066,647;x_deadmeat/x_pictos/d_1694-fs8.png,2250,684;x_deadmeat/x_pictos/d_1694-fs8.png,3528,697;x_deadmeat/x_pictos/d_1694-fs8.png,3892,750;x_deadmeat/x_pictos/d_1694-fs8.png,3290,728;x_deadmeat/x_pictos/d_1694-fs8.png,3860,750;x_deadmeat/x_pictos/d_1694-fs8.png,3258,728;x_deadmeat/x_pictos/d_1694-fs8.png,2740,760;x_deadmeat/x_pictos/d_1694-fs8.png,3740,749;x_deadmeat/x_pictos/d_1694-fs8.png,3138,727;x_deadmeat/x_pictos/d_1694-fs8.png,4642,730;x_deadmeat/x_pictos/d_1694-fs8.png,4027,737;x_deadmeat/x_pictos/d_1694-fs8.png,3425,715;x_deadmeat/x_pictos/d_1694-fs8.png,4369,734;x_deadmeat/x_pictos/d_1694-fs8.png,4300,741;x_deadmeat/x_pictos/d_1694-fs8.png,3698,719;x_deadmeat/x_pictos/d_1206-fs8.png,3655,322;x_deadmeat/x_pictos/d_1206-fs8.png,1804,321;x_deadmeat/x_pictos/d_1206-fs8.png,3403,320;x_deadmeat/x_pictos/d_1206-fs8.png,1552,319;x_deadmeat/x_pictos/d_1206-fs8.png,3149,319;x_deadmeat/x_pictos/d_1206-fs8.png,1298,318;x_deadmeat/x_pictos/d_1206-fs8.png,4620,322;x_deadmeat/x_pictos/d_1206-fs8.png,3530,322;x_deadmeat/x_pictos/d_1206-fs8.png,1679,321;x_deadmeat/x_pictos/d_1206-fs8.png,3278,320;x_deadmeat/x_pictos/d_1206-fs8.png,1427,319;x_deadmeat/x_pictos/d_1206-fs8.png,3024,319;x_deadmeat/x_pictos/d_1206-fs8.png,613,318;x_deadmeat/x_pictos/d_1206-fs8.png,1173,318;x_deadmeat/x_pictos/d_1206-fs8.png,4702,321;x_deadmeat/x_pictos/d_1206-fs8.png,3612,321;x_deadmeat/x_pictos/d_1206-fs8.png,1761,320;x_deadmeat/x_pictos/d_1206-fs8.png,3360,319;x_deadmeat/x_pictos/d_1206-fs8.png,1509,318;x_deadmeat/x_pictos/d_1206-fs8.png,3106,318;x_deadmeat/x_pictos/d_1206-fs8.png,1255,317;x_deadmeat/x_pictos/d_1206-fs8.png,4577,321;x_deadmeat/x_pictos/d_1206-fs8.png,3487,321;x_deadmeat/x_pictos/d_1206-fs8.png,1636,320;x_deadmeat/x_pictos/d_1206-fs8.png,3235,319;x_deadmeat/x_pictos/d_1206-fs8.png,1384,318;x_deadmeat/x_pictos/d_1206-fs8.png,2981,318;x_deadmeat/x_pictos/d_1206-fs8.png,570,317;x_deadmeat/x_pictos/d_1206-fs8.png,1130,317;x_deadmeat/x_pictos/d_1206-fs8.png,4659,321;x_deadmeat/x_pictos/d_1206-fs8.png,3569,321;x_deadmeat/x_pictos/d_1206-fs8.png,1718,320;x_deadmeat/x_pictos/d_1206-fs8.png,3317,319;x_deadmeat/x_pictos/d_1206-fs8.png,1466,318;x_deadmeat/x_pictos/d_1206-fs8.png,3063,318;x_deadmeat/x_pictos/d_1206-fs8.png,1212,317;x_deadmeat/x_pictos/d_1206-fs8.png,3444,321;x_deadmeat/x_pictos/d_1206-fs8.png,1593,320;x_deadmeat/x_pictos/d_1206-fs8.png,3192,319;x_deadmeat/x_pictos/d_1206-fs8.png,1341,318;x_deadmeat/x_pictos/d_1206-fs8.png,2938,318;x_deadmeat/x_pictos/d_1206-fs8.png,527,317;x_deadmeat/x_pictos/d_1206-fs8.png,1087,317;x_deadmeat/x_pictos/d_10-fs8.png,3688,255;x_deadmeat/x_pictos/d_10-fs8.png,4382,248;x_deadmeat/x_pictos/d_10-fs8.png,3848,193;x_deadmeat/x_pictos/d_10-fs8.png,3970,194;x_deadmeat/x_pictos/d_10-fs8.png,4095,198;x_deadmeat/x_pictos/d_10-fs8.png,4224,206;x_deadmeat/x_pictos/d_16-fs8.png,4355,59;x_deadmeat/x_pictos/d_16-fs8.png,4046,-1;x_deadmeat/x_pictos/d_16-fs8.png,3799,42;x_deadmeat/x_pictos/d_16-fs8.png,2777,73;x_deadmeat/x_pictos/d_16-fs8.png,2528,30;x_deadmeat/x_pictos/d_16-fs8.png,2265,24;x_deadmeat/x_pictos/d_16-fs8.png,1911,60;x_deadmeat/x_pictos/d_16-fs8.png,1773,84;x_deadmeat/x_pictos/d_2847.png,3047,748;x_deadmeat/x_pictos/d_2847.png,4664,750;x_deadmeat/x_pictos/d_2847.png,4006,757;x_deadmeat/x_pictos/d_2847.png,3404,735;x_deadmeat/x_pictos/d_1098-fs8.png,3158,755;x_deadmeat/x_pictos/d_1098-fs8.png,4554,744;x_deadmeat/x_pictos/d_1098-fs8.png,4077,751;x_deadmeat/x_pictos/d_1098-fs8.png,3475,729;x_deadmeat/x_pictos/d_1098-fs8.png,4665,753;x_deadmeat/x_pictos/d_1098-fs8.png,3966,760;x_deadmeat/x_pictos/d_1098-fs8.png,3364,738;x_deadmeat/x_pictos/d_1098-fs8.png,810,666;x_deadmeat/x_pictos/d_1098-fs8.png,1555,744;x_deadmeat/x_pictos/d_2847.png,927,99;x_deadmeat/x_pictos/d_2847.png,643,98;x_deadmeat/x_pictos/d_3283.png,285,-89;x_deadmeat/x_pictos/d_3283.png,43,-90;x_deadmeat/x_pictos/d_1733-fs8.png,906,144;x_deadmeat/x_pictos/d_1733-fs8.png,623,142;x_deadmeat/x_pictos/d_1583-fs8.png,676,-44;x_deadmeat/x_pictos/d_1078-fs8.png,-185,-96;x_deadmeat/x_pictos/d_1078-fs8.png,-163,18;x_deadmeat/x_pictos/d_1078-fs8.png,-205,23;x_deadmeat/x_pictos/d_10-fs8.png,145,-77;x_deadmeat/x_pictos/d_20-fs8.png,-103,99;x_deadmeat/x_pictos/d_20-fs8.png,-19,100;x_deadmeat/x_pictos/d_20-fs8.png,111,90;x_deadmeat/x_pictos/d_20-fs8.png,443,95;x_deadmeat/x_pictos/d_20-fs8.png,360,91;x_deadmeat/x_pictos/d_20-fs8.png,216,96;x_transformice/x_evt/x_evt_25/abwnpzec/pont-bois.png,558,196;x_deadmeat/x_pictos/d_1764-fs8.png,1245,628;x_deadmeat/x_pictos/d_1764-fs8.png,1412,652;x_deadmeat/x_pictos/d_1764-fs8.png,1838,639;x_deadmeat/x_pictos/d_1764-fs8.png,2111,613;x_deadmeat/x_pictos/d_1764-fs8.png,2932,715;x_deadmeat/x_pictos/d_2844.png,3837,752;x_deadmeat/x_pictos/d_2844.png,3235,730;x_deadmeat/x_pictos/d_2844.png,4504,737;x_deadmeat/x_pictos/d_2844.png,4099,744;x_deadmeat/x_pictos/d_2844.png,3497,722;x_deadmeat/x_pictos/d_2844.png,2879,751;x_deadmeat/x_pictos/d_2844.png,2790,766;x_deadmeat/x_pictos/d_2844.png,453,622;x_deadmeat/x_pictos/d_2844.png,535,627;x_deadmeat/x_pictos/d_2844.png,841,672;x_deadmeat/x_pictos/d_2844.png,938,687;x_deadmeat/x_pictos/d_2844.png,1025,699;x_deadmeat/x_pictos/d_2844.png,1104,707;x_deadmeat/x_pictos/d_2844.png,1411,760;x_deadmeat/x_pictos/d_2844.png,1532,756;x_deadmeat/x_pictos/d_2844.png,1846,728;x_deadmeat/x_pictos/d_2844.png,1953,711;x_deadmeat/x_pictos/d_3136.png,1757,665;x_deadmeat/x_pictos/d_3136.png,2207,629;x_deadmeat/x_pictos/d_3136.png,4453,765;x_deadmeat/x_pictos/d_3136.png,4224,772;x_deadmeat/x_pictos/d_3136.png,3637,729;x_deadmeat/x_pictos/d_2336.png,2164,668;x_deadmeat/x_pictos/d_2336.png,2077,672;x_deadmeat/x_pictos/d_2336.png,1800,702;x_deadmeat/x_pictos/d_2336.png,1715,705;x_deadmeat/x_pictos/d_2336.png,1625,711;x_deadmeat/x_pictos/d_2336.png,1376,714;x_deadmeat/x_pictos/d_2336.png,1291,704;x_deadmeat/x_pictos/d_2336.png,1212,684;x_deadmeat/x_pictos/d_2336.png,734,613;x_deadmeat/x_pictos/d_2336.png,648,601;x_deadmeat/x_pictos/d_1733-fs8.png,623,644;x_deadmeat/x_pictos/d_1733-fs8.png,710,656;x_deadmeat/x_pictos/d_1733-fs8.png,2143,708;x_deadmeat/x_pictos/d_1733-fs8.png,2057,713;x_deadmeat/x_pictos/d_1733-fs8.png,1776,741;x_deadmeat/x_pictos/d_1733-fs8.png,1692,746;x_deadmeat/x_pictos/d_1733-fs8.png,1603,753;x_deadmeat/x_pictos/d_1733-fs8.png,1353,755;x_deadmeat/x_pictos/d_1733-fs8.png,1272,742;x_deadmeat/x_pictos/d_1733-fs8.png,1190,727;x_deadmeat/x_pictos/d_1219-fs8.png,3584,724;x_deadmeat/x_pictos/d_1219-fs8.png,3192,712;x_deadmeat/x_pictos/d_1219-fs8.png,3079,726;x_deadmeat/x_pictos/d_1219-fs8.png,2756,756;x_deadmeat/x_pictos/d_1219-fs8.png,3550,692;x_deadmeat/x_pictos/d_1219-fs8.png,3113,726;x_deadmeat/x_pictos/d_1219-fs8.png,2263,666;x_deadmeat/x_pictos/d_1219-fs8.png,1931,698;x_deadmeat/x_pictos/d_1219-fs8.png,1495,735;x_deadmeat/x_pictos/d_1219-fs8.png,923,655;x_deadmeat/x_pictos/d_1219-fs8.png,394,581;x_deadmeat/x_pictos/d_1219-fs8.png,1154,332;x_deadmeat/x_pictos/d_1219-fs8.png,1488,727;x_deadmeat/x_pictos/d_1797-fs8.png,3322,408;x_deadmeat/x_pictos/d_1797-fs8.png,3181,412;x_deadmeat/x_pictos/d_1797-fs8.png,3031,410;x_deadmeat/x_pictos/d_1098-fs8.png,706,610;x_bouboum/x_fond/x_f6.jpg,2400,-450;x_bouboum/x_fond/x_f6.jpg,2400,-50;x_bouboum/x_fond/x_f6.jpg,1600,-450;x_bouboum/x_fond/x_f6.jpg,1600,-50;x_bouboum/x_fond/x_f6.jpg,800,-450;x_bouboum/x_fond/x_f6.jpg,800,-50;x_bouboum/x_fond/x_f6.jpg,0,-450;x_bouboum/x_fond/x_f6.jpg,3200,-450;x_bouboum/x_fond/x_f6.jpg,3200,-50;x_bouboum/x_fond/x_f6.jpg,4000,-450;x_bouboum/x_fond/x_f6.jpg,0,-50;x_bouboum/x_fond/x_f6.jpg,4000,-50" MEDATA="32,1;;;;-0;0:::1-" L="4800" DS="m;362,181,2421,275,4134,252" G="0,8.65" H="800" /><Z><S><S Y="350" T="5" P="0,0,0.3,0.2,0,0,0,0" L="400" H="120" X="2400" /><S Y="384" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="400" H="120" X="2015" /><S Y="384" T="5" P="0,0,0.3,0.2,10,0,0,0" L="400" H="120" X="2785" /><S Y="-650" T="12" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="700" H="10" /><S Y="-650" T="12" P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="4100" H="10" /><S Y="550" T="5" P="0,0,0.3,0.2,0,0,0,0" L="780" H="675" X="190" /><S Y="463" T="5" P="0,0,0.3,0.2,0,0,0,0" L="397" H="312" X="863" /><S Y="479" T="5" P="0,0,0.3,0.2,40,0,0,0" L="280" H="225" X="1093" /><S Y="1025" T="5" P="0,0,0.3,0.2,40,0,0,0" L="780" H="1015" X="-156" /><S Y="548" T="5" P="0,0,0.3,0.2,2,0,0,0" L="484" H="76" X="2707" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" H="1500" X="1310" /><S Y="916" T="5" P="0,0,0.3,0.2,-5,0,0,0" L="880" H="275" X="1904" /><S Y="871" T="5" P="0,0,0.3,0.2,8,0,0,0" L="1226" H="275" X="947" /><S Y="206" T="7" P="0,0,0.1,0.2,0,0,0,0" L="780" H="18" X="190" /><S Y="297" T="7" P="0,0,0.1,0.2,0,0,0,0" L="394" H="18" X="863" /><S Y="493" T="5" P="0,0,0.3,0.2,-10,0,0,0" L="480" H="378" X="3929" /><S Y="505" T="5" P="0,0,0.3,0.2,10,0,0,0" L="480" H="401" X="4335" /><S Y="909" T="5" P="0,0,0.3,0.2,3,0,0,0" L="848" H="225" X="4012" /><S Y="905" T="5" P="0,0,0.3,0.2,-2,0,0,0" L="848" H="225" X="3185" /><S Y="35" T="5" P="0,0,0,0.2,-95,0,0,0" L="2105" H="715" X="5073" /><S Y="213" T="12" P="0,0,0.3,0.2,0,0,0,0" L="447" o="ffffffff" X="804" H="21" /><S Y="225" T="12" P="0,0,0.3,0.2,25,0,0,0" L="70" o="ffffffff" X="1053" H="21" /><S Y="-27" T="12" P="0,0,0,0.01,90,0,0,0" L="1447" o="ffffffff" X="0" H="21" /><S Y="-25" T="12" P="0,0,0,0,90,0,0,0" L="1447" o="ffffffff" X="-25" H="21" /><S Y="910" T="5" P="0,0,0.3,0.2,-3,0,0,0" L="848" H="225" X="4474" /><S Y="912" T="5" P="0,0,0.3,0.2,8,0,0,0" L="534" H="275" X="2571" /><S Y="558" T="5" P="0,0,0.3,0.2,2,0,0,0" L="627" H="141" X="3415" /><S Y="573" T="5" P="0,0,0.3,0.2,2,0,0,0" L="603" H="76" X="2644" /><S Y="596" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" H="76" X="2118" /><S Y="469" T="5" P="0,0,0.3,0.2,-8,0,0,0" L="484" H="76" X="2071" /><S Y="1662" T="5" P="0,0,0.3,0.2,0,0,0,0" L="3000" H="1500" X="4290" /><S Y="505" T="5" P="0,0,0.3,0.2,20,0,0,0" L="280" H="225" X="1034" /><S Y="580" T="9" m="" P="0,0,0,0,0,0,0,0" L="3000" X="2080" H="460" /><S Y="580" T="9" m="" P="0,0,0,0,0,0,0,0" L="2000" X="4580" H="460" /></S><D><P Y="810" T="88" X="3992" P="0,0" /><P Y="803" T="88" X="4724" P="0,1" /><P Y="792" T="85" P="0,0" X="3494" C="4b8e72" /><P Y="787" T="85" P="0,0" X="3815" C="4b8e72" /><P Y="810" T="85" P="0,0" X="3557" C="4b8e72" /><P Y="832" T="85" P="0,0" X="4159" C="4b8e72" /><P Y="825" T="85" P="0,1" X="4557" C="4b8e72" /><P Y="785" T="79" X="3678" P="0,0" /><P Y="807" T="79" X="4280" P="0,0" /><P Y="800" T="79" X="4436" P="0,1" /><P Y="200" T="4" X="31" P="0,0" /><DC Y="184" X="-12" /><P Y="326" T="2" X="1996" P="0,0" /><P Y="296" T="2" X="2200" P="0,0" /><P Y="296" T="2" X="2622" P="0,0" /><P Y="314" T="12" X="2090" P="0,0" /><P Y="296" T="12" X="2328" P="0,0" /><P Y="330" T="12" X="2772" P="0,0" /><P Y="296" T="13" X="2258" P="0,0" /><P Y="340" T="13" X="2842" P="0,0" /><P Y="342" T="0" X="1942" P="0,0" /><P Y="298" T="0" X="3970" P="0,0" /><P Y="292" T="0" X="4240" P="0,0" /><P Y="294" T="3" X="3978" P="0,0" /><P Y="274" T="3" X="4096" P="0,0" /><P Y="348" T="3" X="3680" P="0,0" /><P Y="352" T="0" X="4572" P="0,0" /><P Y="324" T="2" X="3816" P="0,0" /><P Y="302" T="2" X="3946" P="0,0" /><P Y="282" T="2" X="4234" P="0,0" /><P Y="302" T="1" X="4030" P="0,0" /><P Y="302" T="1" X="4258" P="0,0" /><P Y="308" T="1" X="2180" P="0,0" /><P Y="320" T="1" X="2726" P="0,0" /><T Y="744" X="2332" /><T Y="808" X="4351" /><T Y="734" X="942" /></D><O /><L /></Z></C>'}

local cache = {}
local db = {}
local game = {}
local banned_players = {}

tfm.exec.setRoomMaxPlayers(config.max_players)

local function reset_game()
game = {
players = {};
freezers = {};
freezed = {};
unfreezer_alive = 0;
freezer_alive = 0;
ending = false;
started = false;
potencial_players = {};
give_cheese = false;
set_freezers = false;
}
end

local split = function(t, s)
local a={}
for i in string.gmatch(t, "[^" .. (s or "%s") .. "]+") do
a[#a + 1] = i
end
return a
end

local function translate(message)
return translations[config.room_language] and translations[config.room_language][message] or translations[config.room_language][message]
end

local function freeze(freezer_name)
for name, data in next, tfm.get.room.playerList do
local freezer = tfm.get.room.playerList[freezer_name]

if math.abs(data.x - freezer.x) <= config.freezer_radius and math.abs(data.y - freezer.y) <= config.freezer_radius then
if not game.freezers[name] and not data.isDead then
if wait("player_freeze", freezer_name, config.freezer_delay, false) then
tfm.exec.killPlayer(name)
game.freezed[name] = tfm.exec.addShamanObject(54, data.x, data.y, 0, 0, 0, false)

tfm.exec.chatMessage(translate("freezed"), name)
tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)

if game.players[name].hp > 0 then
updateLife(name, -1)
end

if game.players[name].hp < 1 then
tfm.exec.chatMessage(translate("noLife"), name)
tfm.exec.chatMessage(translate("nowPopsicle"):format(name))
else
tfm.exec.chatMessage(translate("freezedLife"):format(game.players[name].hp), name)
end
tfm.exec.setNameColor(freezer_name, 0x009DFF)
end
break
end
end
end
end

local function unfreeze(unfreezer_name)
local noLife

for name, id in next, game.freezed do
local object = tfm.get.room.objectList[id]
local unfreezer = tfm.get.room.playerList[unfreezer_name]

if math.abs(object.x - unfreezer.x) <= config.unfreezer_radius and math.abs(object.y - unfreezer.y) <= config.unfreezer_radius then
if game.players[name].hp > 0 then
if wait("player_freeze", unfreezer_name, config.unfreezer_delay, false) then
game.players[name].x = object.x
game.players[name].y = object.y

tfm.exec.removeObject(id)
ui.removeTextArea(config.object_start_id + id)

tfm.exec.respawnPlayer(name)
tfm.exec.chatMessage(translate("unfreezed"):format(unfreezer_name), name)
tfm.exec.playSound("/transformice/son/depart.mp3", 75, nil, nil, name)
db[name].chance = db[name].chance + 1

local lucky = math.random(100)
if lucky <= 15 then
tfm.exec.chatMessage(translate("gotHp"):format(name), unfreezer_name)
updateLife(unfreezer_name, 1)
else
tfm.exec.chatMessage(translate("unfreezedsomeone"):format(name), unfreezer_name)
end

game.freezed[name] = nil
end
else
noLife = true
end
break
end
end

if noLife then
tfm.exec.chatMessage(translate("playerWithoutLife"), unfreezer_name)
end
end

function change_map()
if #cache == 0 then
for index, map in next, maps do
cache[#cache + 1] = map
end
end
tfm.exec.newGame(table.remove(cache, math.random(#cache)), math.random(1, 5) == 1 and true or false)
end

function updateLife(name, to_inc)
if to_inc then
game.players[name].hp = game.players[name].hp + to_inc
end

local hp = game.players[name].hp
tfm.exec.setPlayerScore(name, hp, false)

for i, v in next, game.players[name].lifes do
tfm.exec.removeImage(v)
end

if hp > 0 then
for i = 1, hp do
game.players[name].lifes[#game.players[name].lifes + 1] = tfm.exec.addImage('1674802a592.png', ':1', 5 + (28 * (i - 1)), 23, name)
end
end
end

function eventNewGame()
ui.setMapName("<N><b>#Freezer</b><font color='#0080ff'><b>Water</b> <VP>- por <b>Akwimos#1937</b>")
tfm.exec.setGameTime(config.game_time)

if game and game.freezed then
for i, id in next, game.freezed do
ui.removeTextArea(config.object_start_id + id)
end
end

reset_game()
ui.removeTextArea(1)

for name, data in next, tfm.get.room.playerList do
game.players[name] = {
hp = 3;
lifes = {};
o = 100;
}

tfm.exec.setPlayerScore(name, game.players[name].hp, false)
tfm.exec.setNameColor(name, 0xB5B5B5)
showWater(name)
game.unfreezer_alive = game.unfreezer_alive + 1

if banned_players[name] then
tfm.exec.killPlayer(name)
updateLife(name, game.players[name].hp * -1)
else
updateLife(name)
end
end
end

function updateChance(name, chance)
local c = ("%.2d"):format(chance)
c = tonumber(c:find("0") == 1 and c:sub(2) or c)

if c < 0 then
c = 0
end

ui.addTextArea(1, translate("chance"):format(tostring(c)).."%", name, 10, 340, 0, 0, 1, 1, 0, true)
end

function showWater(name)
	tfm.exec.addImage("18200689108.png", "?1", -800, 332, name, 1.0, 1.0, 0, 1.0)
	tfm.exec.addImage("18200689108.png", "!1", -800, 332, name, 1.0, 1.0, 0, 0.7)
	tfm.exec.addImage("1820068de62.png", "!1", -800, 390, name, 6, 4, 0, 1)
	tfm.exec.addImage("18200692b61.jpg","?1",-800,376,name,4,3)
	tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	ui.addTextArea(11,"",name,8,390,790,3,0x101010,0x060606,1.0,true)
end

function eventLoop(s, r)
for name, data in next, tfm.get.room.playerList do
	if game.started and not data.isDead and game.players[name] then
		if tfm.get.room.playerList[name].y < 348 then
			if game.players[name].o < 99 then
				game.players[name].o=game.players[name].o+2.5
			end
		else
			tfm.exec.playSound("/transformice/son/bulle2.mp3", 20, nil, nil, name)
			game.players[name].o=game.players[name].o-1.5
		end
		if game.players[name].o <= 0 then
			game.players[name].hp=0
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage(translate("player_drowned"):format(name))
			tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, name)
		end
		if game.players[name].o > 30 then
			ui.addTextArea(10,"",name,8,390,(game.players[name].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
		else
			tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, name)
			ui.addTextArea(10,"",name,8,390,(game.players[name].o*7.9),3,0x801500,0xa01000,1.0,true)
		end
	end
end
if not game.set_freezers and s >= config.select_freezers_time and s <= config.select_freezers_time+2000 then
game.set_freezers = true
local total_chance, total_data = 0, 0

local pont = 0

for name, data in next, game.potencial_players do
pont = pont + 1
end

local isdead = {}

for name, data in next, tfm.get.room.playerList do
if pont >= config.min_moving_players and not game.potencial_players[name] and not data.isDead then
tfm.exec.killPlayer(name)
isdead[name] = true
else
total_data = total_data + 1
total_chance = total_chance + db[name].chance
end
end

local players = {}

for name, data in next, tfm.get.room.playerList do
if not data.isDead and not isdead[name] and not banned_players[name] then
players[#players + 1] = name
end
end

local p = math.floor(#players/config.players_per_freezers) + 1
for i = 1, p do
local rand = math.random() * total_chance

local found = false

while not found do
for id, name in next, players do
if rand < db[name].chance then
total_chance = total_chance - db[name].chance
game.freezers[#game.freezers + 1] = table.remove(players, id)
game.unfreezer_alive = game.unfreezer_alive - 1
game.freezer_alive = game.freezer_alive + 1
db[name].chance = 1
ui.removeTextArea(1, name)
found = true
break
else
rand = rand - db[name].chance
end
end
end
end

if #game.freezers <= 0 then
return change_map()
end

game.freezers = stable(game.freezers)

for name, data in next, tfm.get.room.playerList do
if not data.isDead then
if game.freezers[name] then
tfm.exec.chatMessage(translate("are_freezer"), name)
tfm.exec.setNameColor(name, 0x009DFF)
updateLife(name, game.players[name].hp * -1)
else
db[name].chance = db[name].chance + 1
total_chance = total_chance + 1
tfm.exec.chatMessage(translate("are_unfreezer"):format(config.start_hp), name)
end
end
end

for name, data in next, db do
if not game.freezers[name] then
updateChance(name, data.chance*100/total_chance)
end
end

game.started = true
elseif not game.give_cheese and r >= config.end_game_time and r <= config.end_game_time+2000 and game.unfreezer_alive > 0 then
game.give_cheese = true
end_game(false)
elseif game.freezer_alive and (r <= 0 or (game.freezer_alive <= 0 and game.unfreezer_alive <= 0)) then
change_map()
end

if game.ending then
for name in next, admins do
local p = tfm.get.room.playerList[name]
if p and not p.isDead and not game.freezers[name] then
tfm.exec.setNameColor(name, math.random(0x000000, 0xFFFFFF))
end
end
elseif not game.started then
for name, data in next, tfm.get.room.playerList do
if not data.isDead and (data.movingLeft or data.movingRight or data.isJumping) then
game.potencial_players[name] = data
end
end
end

if game.freezed then
for name, id in next, game.freezed do
local object = tfm.get.room.objectList[id]

if object and game.players[name].hp > 0 then
ui.addTextArea(config.object_start_id + id, "<B><font color='#000000'>" .. name .. "</font></B>\n<p align='center'><B><R>"..game.players[name].hp.." hp</R></B>", nil, object.x - (string.len(name) * 4), object.y - 10, 0, 0, 1, 1, 0, false)
else
game.freezed[name] = nil
ui.removeTextArea(config.object_start_id + id)
break
end
end
end
end

function end_game(freezers_won)
if not game.ending then
game.ending = true

if freezers_won then
for name, data in next, tfm.get.room.playerList do
if not data.isDead and game.freezers[name] then
tfm.exec.giveCheese(name)
tfm.exec.playSound("/deadmaze/niveau/gain_niveau.mp3", 68, nil, nil, name)
end
end
else
for name, data in next, tfm.get.room.playerList do
if not data.isDead and not game.freezers[name] then
tfm.exec.giveCheese(name)
tfm.exec.playSound("/deadmaze/niveau/gain_niveau.mp3", 68, nil, nil, name)
end
end
end

for name in next, game.players do
updateLife(name, game.players[name].hp * -1)
end

local ids = {}

for i, v in next, tfm.get.room.objectList do
ids[#ids + 1] = v.id
end
for i, v in next, ids do
tfm.exec.removeObject(v)
end

for i, id in next, game.freezed do
ui.removeTextArea(config.object_start_id + id)
end

game.freezed = {}
tfm.exec.setGameTime(30)
end
end

function check_players(name, died)
if not game.freezers[name] then
game.unfreezer_alive = game.unfreezer_alive + (died and -1 or 1)

if game.unfreezer_alive <= 0 then
return end_game(true)
end
else
game.freezer_alive = game.freezer_alive + (died and -1 or 1)
game.freezers[name] = nil

for _ in next, game.freezers do
return
end

return end_game()
end

if game.freezer_alive <= 0 and game.unfreezer_alive <= 0 then
return change_map()
end
end

function eventKeyboard(name, key, down, x, y)
if key == 32 then
if not tfm.get.room.playerList[name].isDead and not game.ending then
if wait("wait_keyboard", name, 1000, false) then
if game and game.freezers and game.freezers[name] then
freeze(name)
else
unfreeze(name)
end
end
end
end
end

function eventPlayerDied(name)
check_players(name, true)
end

function eventPlayerLeft(name)
if game.players[name] then
game.players[name].hp = 0
end
end

function eventPlayerWon(name)
check_players(name, true)
db[name].chance = db[name].chance + 5
end

function eventPlayerRespawn(name)
check_players(name)

if game.players[name].x then
tfm.exec.movePlayer(name, game.players[name].x, game.players[name].y)
end
end

function eventNewPlayer(name)
tfm.exec.bindKeyboard(name, 32, true, true)
tfm.exec.lowerSyncDelay(name)

db[name] = {
chance = 1;
}

tfm.exec.chatMessage(translate("welcome"), name)
ui.setMapName("<N><b>#Freezer</b><font color='#0080ff'><b>Water</b> <VP>- por <b>Akwimos#1937</b>")
end

function eventChatCommand(name, command)
local arg = split(command, " ")

if admins[name] then
if arg[1] == 'ban' and arg[2] then
if banned_players[arg[2]] then
tfm.exec.chatMessage('ERROR', name)
else
tfm.exec.chatMessage(translate("player_banned"):format(arg[2]))
banned_players[arg[2]] = true
tfm.exec.killPlayer(arg[2])
end
elseif arg[1] == 'unban' and arg[2] then
if banned_players[arg[2]] then
tfm.exec.chatMessage(translate("player_unbanned"):format(arg[2]))
banned_players[arg[2]] = nil
else
tfm.exec.chatMessage('ERROR', name)
end
elseif arg[1] == 'np' and arg[2] then
tfm.exec.newGame(arg[2])
elseif arg[1] == 'freeze' and arg[2] and tfm.get.room.playerList[arg[2]] then
freeze(arg[2])
elseif arg[1] == 'unfreeze' and arg[2] and tfm.get.room.playerList[arg[2]] then
unfreeze(arg[2])
end
end

end

table.foreach(tfm.get.room.playerList, eventNewPlayer)

for index, value in next, {'AutoShaman', 'AutoNewGame', 'AutoTimeLeft', 'AutoScore', 'PhysicalConsumables', 'DebugCommand', 'MinimalistMode'} do
tfm.exec['disable' .. value]()
end

change_map()
