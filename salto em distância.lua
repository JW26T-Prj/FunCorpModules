admin="" -- Insira seu nome aqui, FunCorp! / Insert your name here, FunCorp!
freeze=true -- Troque para 'false' para desativar o congelamento no espaço // Change to 'false' to disable mice freezing in space

data={}; recorde=0; recorder="----";
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f]()
end
tfm.exec.newGame('<C><P L="29000" H="6000" d="x_deadmeat/x_pictos/d_1694-fs8.png,27433,5423;x_deadmeat/x_pictos/d_1694-fs8.png,25393,5423;x_deadmeat/x_pictos/d_1694-fs8.png,28748,5433;x_deadmeat/x_pictos/d_1694-fs8.png,26708,5433;x_deadmeat/x_pictos/d_1219-fs8.png,29105,5423;x_deadmeat/x_pictos/d_1219-fs8.png,27065,5423;x_deadmeat/x_pictos/d_1219-fs8.png,28443,5420;x_deadmeat/x_pictos/d_1219-fs8.png,26403,5420;x_deadmeat/x_pictos/d_1219-fs8.png,27918,5418;x_deadmeat/x_pictos/d_1219-fs8.png,25878,5418;x_deadmeat/x_pictos/d_10-fs8.png,28104,5228;x_deadmeat/x_pictos/d_10-fs8.png,26064,5228;x_deadmeat/x_pictos/d_10-fs8.png,28474,5221;x_deadmeat/x_pictos/d_10-fs8.png,26434,5221;x_deadmeat/x_pictos/d_10-fs8.png,29113,5225;x_deadmeat/x_pictos/d_10-fs8.png,27073,5225;x_deadmeat/x_pictos/d_10-fs8.png,27670,5225;x_deadmeat/x_pictos/d_10-fs8.png,25630,5225;x_deadmeat/x_pictos/d_10-fs8.png,-25,5026;x_deadmeat/x_pictos/d_1694-fs8.png,23433,5423;x_deadmeat/x_pictos/d_1694-fs8.png,15293,5423;x_deadmeat/x_pictos/d_1694-fs8.png,7153,5423;x_deadmeat/x_pictos/d_1694-fs8.png,19343,5423;x_deadmeat/x_pictos/d_1694-fs8.png,11203,5423;x_deadmeat/x_pictos/d_1694-fs8.png,3063,5423;x_deadmeat/x_pictos/d_1694-fs8.png,21393,5423;x_deadmeat/x_pictos/d_1694-fs8.png,13253,5423;x_deadmeat/x_pictos/d_1694-fs8.png,5113,5423;x_deadmeat/x_pictos/d_1694-fs8.png,17303,5423;x_deadmeat/x_pictos/d_1694-fs8.png,9163,5423;x_deadmeat/x_pictos/d_1694-fs8.png,1023,5423;x_deadmeat/x_pictos/d_1694-fs8.png,24748,5433;x_deadmeat/x_pictos/d_1694-fs8.png,16608,5433;x_deadmeat/x_pictos/d_1694-fs8.png,8468,5433;x_deadmeat/x_pictos/d_1694-fs8.png,20658,5433;x_deadmeat/x_pictos/d_1694-fs8.png,12518,5433;x_deadmeat/x_pictos/d_1694-fs8.png,4378,5433;x_deadmeat/x_pictos/d_1694-fs8.png,22708,5433;x_deadmeat/x_pictos/d_1694-fs8.png,14568,5433;x_deadmeat/x_pictos/d_1694-fs8.png,6428,5433;x_deadmeat/x_pictos/d_1694-fs8.png,18618,5433;x_deadmeat/x_pictos/d_1694-fs8.png,10478,5433;x_deadmeat/x_pictos/d_1694-fs8.png,2338,5433;x_deadmeat/x_pictos/d_1219-fs8.png,25105,5423;x_deadmeat/x_pictos/d_1219-fs8.png,16965,5423;x_deadmeat/x_pictos/d_1219-fs8.png,8825,5423;x_deadmeat/x_pictos/d_1219-fs8.png,21015,5423;x_deadmeat/x_pictos/d_1219-fs8.png,12875,5423;x_deadmeat/x_pictos/d_1219-fs8.png,4735,5423;x_deadmeat/x_pictos/d_1219-fs8.png,23065,5423;x_deadmeat/x_pictos/d_1219-fs8.png,14925,5423;x_deadmeat/x_pictos/d_1219-fs8.png,6785,5423;x_deadmeat/x_pictos/d_1219-fs8.png,18975,5423;x_deadmeat/x_pictos/d_1219-fs8.png,10835,5423;x_deadmeat/x_pictos/d_1219-fs8.png,2695,5423;x_deadmeat/x_pictos/d_1219-fs8.png,24443,5420;x_deadmeat/x_pictos/d_1219-fs8.png,16303,5420;x_deadmeat/x_pictos/d_1219-fs8.png,8163,5420;x_deadmeat/x_pictos/d_1219-fs8.png,20353,5420;x_deadmeat/x_pictos/d_1219-fs8.png,12213,5420;x_deadmeat/x_pictos/d_1219-fs8.png,4073,5420;x_deadmeat/x_pictos/d_1219-fs8.png,22403,5420;x_deadmeat/x_pictos/d_1219-fs8.png,14263,5420;x_deadmeat/x_pictos/d_1219-fs8.png,6123,5420;x_deadmeat/x_pictos/d_1219-fs8.png,18313,5420;x_deadmeat/x_pictos/d_1219-fs8.png,10173,5420;x_deadmeat/x_pictos/d_1219-fs8.png,2033,5420;x_deadmeat/x_pictos/d_1219-fs8.png,23918,5418;x_deadmeat/x_pictos/d_1219-fs8.png,15778,5418;x_deadmeat/x_pictos/d_1219-fs8.png,7638,5418;x_deadmeat/x_pictos/d_1219-fs8.png,19828,5418;x_deadmeat/x_pictos/d_1219-fs8.png,11688,5418;x_deadmeat/x_pictos/d_1219-fs8.png,3548,5418;x_deadmeat/x_pictos/d_1219-fs8.png,21878,5418;x_deadmeat/x_pictos/d_1219-fs8.png,13738,5418;x_deadmeat/x_pictos/d_1219-fs8.png,5598,5418;x_deadmeat/x_pictos/d_1219-fs8.png,17788,5418;x_deadmeat/x_pictos/d_1219-fs8.png,9648,5418;x_deadmeat/x_pictos/d_1219-fs8.png,1508,5418;x_deadmeat/x_pictos/d_10-fs8.png,24104,5228;x_deadmeat/x_pictos/d_10-fs8.png,15964,5228;x_deadmeat/x_pictos/d_10-fs8.png,7824,5228;x_deadmeat/x_pictos/d_10-fs8.png,20014,5228;x_deadmeat/x_pictos/d_10-fs8.png,11874,5228;x_deadmeat/x_pictos/d_10-fs8.png,3734,5228;x_deadmeat/x_pictos/d_10-fs8.png,22064,5228;x_deadmeat/x_pictos/d_10-fs8.png,13924,5228;x_deadmeat/x_pictos/d_10-fs8.png,5784,5228;x_deadmeat/x_pictos/d_10-fs8.png,17974,5228;x_deadmeat/x_pictos/d_10-fs8.png,9834,5228;x_deadmeat/x_pictos/d_10-fs8.png,1694,5228;x_deadmeat/x_pictos/d_10-fs8.png,24474,5221;x_deadmeat/x_pictos/d_10-fs8.png,16334,5221;x_deadmeat/x_pictos/d_10-fs8.png,8194,5221;x_deadmeat/x_pictos/d_10-fs8.png,20384,5221;x_deadmeat/x_pictos/d_10-fs8.png,12244,5221;x_deadmeat/x_pictos/d_10-fs8.png,4104,5221;x_deadmeat/x_pictos/d_10-fs8.png,22434,5221;x_deadmeat/x_pictos/d_10-fs8.png,14294,5221;x_deadmeat/x_pictos/d_10-fs8.png,6154,5221;x_deadmeat/x_pictos/d_10-fs8.png,18344,5221;x_deadmeat/x_pictos/d_10-fs8.png,10204,5221;x_deadmeat/x_pictos/d_10-fs8.png,2064,5221;x_deadmeat/x_pictos/d_10-fs8.png,25113,5225;x_deadmeat/x_pictos/d_10-fs8.png,16973,5225;x_deadmeat/x_pictos/d_10-fs8.png,8833,5225;x_deadmeat/x_pictos/d_10-fs8.png,21023,5225;x_deadmeat/x_pictos/d_10-fs8.png,12883,5225;x_deadmeat/x_pictos/d_10-fs8.png,4743,5225;x_deadmeat/x_pictos/d_10-fs8.png,23073,5225;x_deadmeat/x_pictos/d_10-fs8.png,14933,5225;x_deadmeat/x_pictos/d_10-fs8.png,6793,5225;x_deadmeat/x_pictos/d_10-fs8.png,18983,5225;x_deadmeat/x_pictos/d_10-fs8.png,10843,5225;x_deadmeat/x_pictos/d_10-fs8.png,2703,5225;x_deadmeat/x_pictos/d_10-fs8.png,23670,5225;x_deadmeat/x_pictos/d_10-fs8.png,15530,5225;x_deadmeat/x_pictos/d_10-fs8.png,7390,5225;x_deadmeat/x_pictos/d_10-fs8.png,19580,5225;x_deadmeat/x_pictos/d_10-fs8.png,11440,5225;x_deadmeat/x_pictos/d_10-fs8.png,3300,5225;x_deadmeat/x_pictos/d_10-fs8.png,21630,5225;x_deadmeat/x_pictos/d_10-fs8.png,13490,5225;x_deadmeat/x_pictos/d_10-fs8.png,5350,5225;x_deadmeat/x_pictos/d_10-fs8.png,17540,5225;x_deadmeat/x_pictos/d_10-fs8.png,9400,5225;x_deadmeat/x_pictos/d_10-fs8.png,1260,5225" D="x_transformice/x_inventaire/2528.jpg,578,5896;x_transformice/x_inventaire/2527.jpg,724,5895;x_transformice/x_inventaire/2526.jpg,418,5767;x_transformice/x_inventaire/2526.jpg,575,5807;x_transformice/x_inventaire/2528.jpg,696,5828;x_transformice/x_inventaire/2527.jpg,450,5879;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,244,5518;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,244,5704;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,431,5517;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,618,5517;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,430,5702;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,617,5703;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,219,5585;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,242,5891;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,429,5889;x_transformice/x_evt/x_evt_20/azctnlhkqsf/fond-eau.jpg,616,5889;x_transformice/x_inventaire/2528.jpg,-34,5757" G="0,12" mgoc="-1" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="1" X="516" Y="5490" L="10" H="10" P="0,0,0,0.2,26,0,0,0" N=""/><S T="12" X="653" Y="5515" L="308" H="10" P="0,0,0.3,0.2,0,0,0,0" o="1679C6" c="4" N=""/><S T="6" X="121" Y="5840" L="400" H="800" P="0,0,0.3,0.2,26,0,0,0" N=""/><S T="2" X="317" Y="5440" L="397" H="92" P="0,0,0,1.8,26,0,0,0" N=""/><S T="6" X="80" Y="5700" L="160" H="800" P="0,0,0,0,0,0,0,0" N=""/><S T="12" X="-5" Y="4005" L="10" H="2414" P="0,0,0,0,0,0,0,0" o="d1d1d1" m=""/><S T="6" X="2305" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="4660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="7660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="10660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="13660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="12" X="-5" Y="1298" L="10" H="3000" P="0,0,0,0,0,0,0,0" o="d1d1d1" m=""/><S T="6" X="16660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="19660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="22660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="6" X="25660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/><S T="7" X="538" Y="5993" L="558" H="16" P="0,0,0.1,0.2,0,0,0,0"/><S T="1" X="815" Y="5470" L="20" H="60" P="0,0,0,0.2,0,0,0,0"/><S T="3" X="468" Y="6343" L="678" H="684" P="0,0,0,20,0,0,0,0"/><S T="3" X="-431" Y="6142" L="1190" H="1085" P="0,0,0,20,0,0,0,0"/><S T="9" X="514" Y="5752" L="701" H="465" P="0,0,0,0,0,0,0,0" m=""/><S T="19" X="-214" Y="5602" L="432" H="10" P="0,0,800,0,0,0,0,0" m=""/><S T="6" X="28660" Y="7000" L="3000" H="3000" P="0,0,9999,0,90,0,0,0" N=""/></S><D><P X="1453" Y="5503" T="0" P="1,0"/><P X="9593" Y="5503" T="0" P="1,0"/><P X="17733" Y="5503" T="0" P="1,0"/><P X="5543" Y="5503" T="0" P="1,0"/><P X="13683" Y="5503" T="0" P="1,0"/><P X="21823" Y="5503" T="0" P="1,0"/><P X="3493" Y="5503" T="0" P="1,0"/><P X="11633" Y="5503" T="0" P="1,0"/><P X="19773" Y="5503" T="0" P="1,0"/><P X="7583" Y="5503" T="0" P="1,0"/><P X="15723" Y="5503" T="0" P="1,0"/><P X="23863" Y="5503" T="0" P="1,0"/><P X="2486" Y="5498" T="0" P="1,0"/><P X="10626" Y="5498" T="0" P="1,0"/><P X="18766" Y="5498" T="0" P="1,0"/><P X="6576" Y="5498" T="0" P="1,0"/><P X="14716" Y="5498" T="0" P="1,0"/><P X="22856" Y="5498" T="0" P="1,0"/><P X="4526" Y="5498" T="0" P="1,0"/><P X="12666" Y="5498" T="0" P="1,0"/><P X="20806" Y="5498" T="0" P="1,0"/><P X="8616" Y="5498" T="0" P="1,0"/><P X="16756" Y="5498" T="0" P="1,0"/><P X="24896" Y="5498" T="0" P="1,0"/><P X="1148" Y="5500" T="0" P="1,0"/><P X="9288" Y="5500" T="0" P="1,0"/><P X="17428" Y="5500" T="0" P="1,0"/><P X="5238" Y="5500" T="0" P="1,0"/><P X="13378" Y="5500" T="0" P="1,0"/><P X="21518" Y="5500" T="0" P="1,0"/><P X="3188" Y="5500" T="0" P="1,0"/><P X="11328" Y="5500" T="0" P="1,0"/><P X="19468" Y="5500" T="0" P="1,0"/><P X="7278" Y="5500" T="0" P="1,0"/><P X="15418" Y="5500" T="0" P="1,0"/><P X="23558" Y="5500" T="0" P="1,0"/><P X="2881" Y="5503" T="0" P="1,0"/><P X="11021" Y="5503" T="0" P="1,0"/><P X="19161" Y="5503" T="0" P="1,0"/><P X="6971" Y="5503" T="0" P="1,0"/><P X="15111" Y="5503" T="0" P="1,0"/><P X="23251" Y="5503" T="0" P="1,0"/><P X="4921" Y="5503" T="0" P="1,0"/><P X="13061" Y="5503" T="0" P="1,0"/><P X="21201" Y="5503" T="0" P="1,0"/><P X="9011" Y="5503" T="0" P="1,0"/><P X="17151" Y="5503" T="0" P="1,0"/><P X="25291" Y="5503" T="0" P="1,0"/><P X="2233" Y="5500" T="5" P="1,0"/><P X="10373" Y="5500" T="5" P="1,0"/><P X="18513" Y="5500" T="5" P="1,0"/><P X="6323" Y="5500" T="5" P="1,0"/><P X="14463" Y="5500" T="5" P="1,0"/><P X="22603" Y="5500" T="5" P="1,0"/><P X="4273" Y="5500" T="5" P="1,0"/><P X="12413" Y="5500" T="5" P="1,0"/><P X="20553" Y="5500" T="5" P="1,0"/><P X="8363" Y="5500" T="5" P="1,0"/><P X="16503" Y="5500" T="5" P="1,0"/><P X="24643" Y="5500" T="5" P="1,0"/><P X="2313" Y="5498" T="5" P="1,0"/><P X="10453" Y="5498" T="5" P="1,0"/><P X="18593" Y="5498" T="5" P="1,0"/><P X="6403" Y="5498" T="5" P="1,0"/><P X="14543" Y="5498" T="5" P="1,0"/><P X="22683" Y="5498" T="5" P="1,0"/><P X="4353" Y="5498" T="5" P="1,0"/><P X="12493" Y="5498" T="5" P="1,0"/><P X="20633" Y="5498" T="5" P="1,0"/><P X="8443" Y="5498" T="5" P="1,0"/><P X="16583" Y="5498" T="5" P="1,0"/><P X="24723" Y="5498" T="5" P="1,0"/><P X="1676" Y="5506" T="5" P="1,0"/><P X="9816" Y="5506" T="5" P="1,0"/><P X="17956" Y="5506" T="5" P="1,0"/><P X="5766" Y="5506" T="5" P="1,0"/><P X="13906" Y="5506" T="5" P="1,0"/><P X="22046" Y="5506" T="5" P="1,0"/><P X="3716" Y="5506" T="5" P="1,0"/><P X="11856" Y="5506" T="5" P="1,0"/><P X="19996" Y="5506" T="5" P="1,0"/><P X="7806" Y="5506" T="5" P="1,0"/><P X="15946" Y="5506" T="5" P="1,0"/><P X="24086" Y="5506" T="5" P="1,0"/><P X="1098" Y="5500" T="5" P="1,0"/><P X="9238" Y="5500" T="5" P="1,0"/><P X="17378" Y="5500" T="5" P="1,0"/><P X="5188" Y="5500" T="5" P="1,0"/><P X="13328" Y="5500" T="5" P="1,0"/><P X="21468" Y="5500" T="5" P="1,0"/><P X="3138" Y="5500" T="5" P="1,0"/><P X="11278" Y="5500" T="5" P="1,0"/><P X="19418" Y="5500" T="5" P="1,0"/><P X="7228" Y="5500" T="5" P="1,0"/><P X="15368" Y="5500" T="5" P="1,0"/><P X="23508" Y="5500" T="5" P="1,0"/><P X="1443" Y="5503" T="13" P="1,0"/><P X="9583" Y="5503" T="13" P="1,0"/><P X="17723" Y="5503" T="13" P="1,0"/><P X="5533" Y="5503" T="13" P="1,0"/><P X="13673" Y="5503" T="13" P="1,0"/><P X="21813" Y="5503" T="13" P="1,0"/><P X="3483" Y="5503" T="13" P="1,0"/><P X="11623" Y="5503" T="13" P="1,0"/><P X="19763" Y="5503" T="13" P="1,0"/><P X="7573" Y="5503" T="13" P="1,0"/><P X="15713" Y="5503" T="13" P="1,0"/><P X="23853" Y="5503" T="13" P="1,0"/><P X="1731" Y="5503" T="13" P="1,0"/><P X="9871" Y="5503" T="13" P="1,0"/><P X="18011" Y="5503" T="13" P="1,0"/><P X="5821" Y="5503" T="13" P="1,0"/><P X="13961" Y="5503" T="13" P="1,0"/><P X="22101" Y="5503" T="13" P="1,0"/><P X="3771" Y="5503" T="13" P="1,0"/><P X="11911" Y="5503" T="13" P="1,0"/><P X="20051" Y="5503" T="13" P="1,0"/><P X="7861" Y="5503" T="13" P="1,0"/><P X="16001" Y="5503" T="13" P="1,0"/><P X="24141" Y="5503" T="13" P="1,0"/><P X="3011" Y="5500" T="13" P="1,0"/><P X="11151" Y="5500" T="13" P="1,0"/><P X="19291" Y="5500" T="13" P="1,0"/><P X="7101" Y="5500" T="13" P="1,0"/><P X="15241" Y="5500" T="13" P="1,0"/><P X="23381" Y="5500" T="13" P="1,0"/><P X="5051" Y="5500" T="13" P="1,0"/><P X="13191" Y="5500" T="13" P="1,0"/><P X="21331" Y="5500" T="13" P="1,0"/><P X="9141" Y="5500" T="13" P="1,0"/><P X="17281" Y="5500" T="13" P="1,0"/><P X="25421" Y="5500" T="13" P="1,0"/><P X="2598" Y="5503" T="12" P="1,0"/><P X="10738" Y="5503" T="12" P="1,0"/><P X="18878" Y="5503" T="12" P="1,0"/><P X="6688" Y="5503" T="12" P="1,0"/><P X="14828" Y="5503" T="12" P="1,0"/><P X="22968" Y="5503" T="12" P="1,0"/><P X="4638" Y="5503" T="12" P="1,0"/><P X="12778" Y="5503" T="12" P="1,0"/><P X="20918" Y="5503" T="12" P="1,0"/><P X="8728" Y="5503" T="12" P="1,0"/><P X="16868" Y="5503" T="12" P="1,0"/><P X="25008" Y="5503" T="12" P="1,0"/><P X="2408" Y="5505" T="12" P="1,0"/><P X="10548" Y="5505" T="12" P="1,0"/><P X="18688" Y="5505" T="12" P="1,0"/><P X="6498" Y="5505" T="12" P="1,0"/><P X="14638" Y="5505" T="12" P="1,0"/><P X="22778" Y="5505" T="12" P="1,0"/><P X="4448" Y="5505" T="12" P="1,0"/><P X="12588" Y="5505" T="12" P="1,0"/><P X="20728" Y="5505" T="12" P="1,0"/><P X="8538" Y="5505" T="12" P="1,0"/><P X="16678" Y="5505" T="12" P="1,0"/><P X="24818" Y="5505" T="12" P="1,0"/><P X="2951" Y="5505" T="12" P="1,0"/><P X="11091" Y="5505" T="12" P="1,0"/><P X="19231" Y="5505" T="12" P="1,0"/><P X="7041" Y="5505" T="12" P="1,0"/><P X="15181" Y="5505" T="12" P="1,0"/><P X="23321" Y="5505" T="12" P="1,0"/><P X="4991" Y="5505" T="12" P="1,0"/><P X="13131" Y="5505" T="12" P="1,0"/><P X="21271" Y="5505" T="12" P="1,0"/><P X="9081" Y="5505" T="12" P="1,0"/><P X="17221" Y="5505" T="12" P="1,0"/><P X="25361" Y="5505" T="12" P="1,0"/><P X="1583" Y="5498" T="12" P="1,0"/><P X="9723" Y="5498" T="12" P="1,0"/><P X="17863" Y="5498" T="12" P="1,0"/><P X="5673" Y="5498" T="12" P="1,0"/><P X="13813" Y="5498" T="12" P="1,0"/><P X="21953" Y="5498" T="12" P="1,0"/><P X="3623" Y="5498" T="12" P="1,0"/><P X="11763" Y="5498" T="12" P="1,0"/><P X="19903" Y="5498" T="12" P="1,0"/><P X="7713" Y="5498" T="12" P="1,0"/><P X="15853" Y="5498" T="12" P="1,0"/><P X="23993" Y="5498" T="12" P="1,0"/><P X="1261" Y="5503" T="12" P="1,0"/><P X="9401" Y="5503" T="12" P="1,0"/><P X="17541" Y="5503" T="12" P="1,0"/><P X="5351" Y="5503" T="12" P="1,0"/><P X="13491" Y="5503" T="12" P="1,0"/><P X="21631" Y="5503" T="12" P="1,0"/><P X="3301" Y="5503" T="12" P="1,0"/><P X="11441" Y="5503" T="12" P="1,0"/><P X="19581" Y="5503" T="12" P="1,0"/><P X="7391" Y="5503" T="12" P="1,0"/><P X="15531" Y="5503" T="12" P="1,0"/><P X="23671" Y="5503" T="12" P="1,0"/><P X="1978" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="10118" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="18258" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="6068" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="14208" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="22348" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="4018" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="12158" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="20298" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="8108" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="16248" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="24388" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="25823" Y="5503" T="0" P="1,0"/><P X="27863" Y="5503" T="0" P="1,0"/><P X="26856" Y="5498" T="0" P="1,0"/><P X="28896" Y="5498" T="0" P="1,0"/><P X="25518" Y="5500" T="0" P="1,0"/><P X="27558" Y="5500" T="0" P="1,0"/><P X="27251" Y="5503" T="0" P="1,0"/><P X="25201" Y="5503" T="0" P="1,0"/><P X="29291" Y="5503" T="0" P="1,0"/><P X="26603" Y="5500" T="5" P="1,0"/><P X="28643" Y="5500" T="5" P="1,0"/><P X="26683" Y="5498" T="5" P="1,0"/><P X="28723" Y="5498" T="5" P="1,0"/><P X="26046" Y="5506" T="5" P="1,0"/><P X="28086" Y="5506" T="5" P="1,0"/><P X="25468" Y="5500" T="5" P="1,0"/><P X="27508" Y="5500" T="5" P="1,0"/><P X="25813" Y="5503" T="13" P="1,0"/><P X="27853" Y="5503" T="13" P="1,0"/><P X="26101" Y="5503" T="13" P="1,0"/><P X="28141" Y="5503" T="13" P="1,0"/><P X="27381" Y="5500" T="13" P="1,0"/><P X="25331" Y="5500" T="13" P="1,0"/><P X="29421" Y="5500" T="13" P="1,0"/><P X="26968" Y="5503" T="12" P="1,0"/><P X="29008" Y="5503" T="12" P="1,0"/><P X="26778" Y="5505" T="12" P="1,0"/><P X="28818" Y="5505" T="12" P="1,0"/><P X="27321" Y="5505" T="12" P="1,0"/><P X="25271" Y="5505" T="12" P="1,0"/><P X="29361" Y="5505" T="12" P="1,0"/><P X="25953" Y="5498" T="12" P="1,0"/><P X="27993" Y="5498" T="12" P="1,0"/><P X="25631" Y="5503" T="12" P="1,0"/><P X="27671" Y="5503" T="12" P="1,0"/><P X="26348" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><P X="28388" Y="5500" T="18" C="57703E,E7C3D6" P="1,0"/><DS X="80" Y="5290"/></D><O/><L/></Z></C>')
ui.setBackgroundColor("#000000")
system.disableChatCommandDisplay("reset")
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end
function updateBar()
	ui.setMapName("<D>Salto em Distância / Long Jump <V><b>II</b>   <G>|   <N>Recorde / High Score : <J><b>"..recorder.."</b> ("..recorde..")<")
end
function eventChatCommand(n,m)
	if n == "Patrick_mahomes#1795" or n == "Forzaldenon#0000" or n == "Dhanny_mheyran#6701" or n == "Viego#0345" or n == admin then
		if m == "reset" then
			showMessage("Todas as pontuações e o recorde foram reiniciados.<br>All scores and the high score have been removed.",nil)
			recorde=0
			recorder="----";
			for _,i in next,{3,4,5,80,81} do
				ui.removeTextArea(i,name)
			end
			for name,player in pairs(tfm.get.room.playerList) do
				data[name].recorde=0
				tfm.exec.setPlayerScore(name,0,false)
			end
			updateBar()
			ui.removeTextArea(80,nil)
			ui.removeTextArea(81,nil)
		end
	end
end
function eventPlayerDied(n)
	resetPlayer(n)
end
function resetPlayer(name)
	data[name].loop=0
	tfm.exec.setPlayerGravityScale(name,1)
	tfm.exec.freezePlayer(name,false)
	if data[name] then
		data[name].freezed=false
	end
	tfm.exec.respawnPlayer(name)
	tfm.exec.giveCheese(name)
	tfm.exec.movePlayer(name,80,5250,false,0,0,false)
end
function eventNewPlayer(n)
	newData={
		["x"]=0;
		["position"]=0;
		["x2"]=0;
		["sc"]=0;
		["recorde"]=0;
		["freezed"]=false;
		["loop"]=0;
		}
		data[n]=newData;
	
	if n:sub(1,1) == "*" then
		showMessage("<R>Jogadores convidados (souris) não são permitidos neste jogo.<br>Guest players (souris) aren't allowed to play this game.",n)
	else
		tfm.exec.respawnPlayer(n)
		tfm.exec.giveCheese(n)
		data[n].loop=0
		ui.addTextArea(1,"<font size='18'><b><font face='Courier New'>0 ||||||| 5000 |||||| 10000 ||||||| 15000 |||||| 20000 ||||>",nil,20,20,670,20,0x000001,0x000001,0.8,true)
		for i=1,60 do
			local a=500*i
			ui.addTextArea(100+i,"<p align='center'><b><font size='14'><N>"..a.."",n,a+780,5460,60,20,0x101010,0x020202,0.75,false)
		end
		ui.setBackgroundColor("#000000")
		tfm.exec.setPlayerScore(n,0,false)
		showMessage("<VP>Jogo de salto em distância feito por (New Long Jump module made by) Patrick_mahomes#1795, Akwimos#1937, Dhanny_mheyran#6701 e Threshlimit#0000. <b>Versão / Version 2.3</b><br><br><BL>Imagens enviadas por (Pictures sent by) Spectra_phantom#6089, Morganadxana#0000<br><br><N>Digite /mort para retornar ao ponto inicial sempre que necessário.<br>Type /mort to return to the start point when necessary",n)
		for a=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,700),n) end
		for b=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,700),n,-1,1) end
		for c=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,700),n) end
		for d=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,700),n,-1,1) end
		for e=1,40 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(100,20000),math.random(-350,1250),n) end
		for w=0,18 do
			tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for x=0,18 do
			tfm.exec.addImage("181ba86195e.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for y=0,18 do
			tfm.exec.addImage("181ba86655c.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for z=0,18 do
			tfm.exec.addImage("181ba86b15a.png","!1",math.random(-300,16000),math.random(2400,4800),n)
		end
		for j=0,23 do
			for i=0,1 do
				tfm.exec.addImage("181b9de5c95.png","?1",-800+(j*1080),-500+(i*1080),n)
			end
		end
		tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,710,n,44,4.9,0,1)
		updateBar()
		resetPlayer(n)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(e,r)
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].loop <= 11 and e >= 3000 then
			data[name].loop=data[name].loop+1
		end
		ui.addTextArea(6,"<p align='center'><font size='20'><b><font color='#008000'><font face='Courier New'>"..data[name].recorde.."",name,700,68,80,22,0x00ff00,0x00ff00,0.9,true)
		ui.addTextArea(7,"<p align='center'><font size='20'><b><font color='#800080'><font face='Courier New'>"..recorde.."",name,700,98,80,22,0xff00ff,0x800080,0.9,true)
		data[name].x=tfm.get.room.playerList[name].x-800
		if data[name].x > 0 then
			ui.addTextArea(2,"<p align='center'><font size='20'><b><font color='#800000'><font face='Courier New'>"..data[name].x.."",name,700,18,80,22,0xff0000,0x800000,0.9,true)
			ui.addTextArea(3,"",name,30,48,data[name].x/37,5,0xff0000,0x800000,0.9,true)
			if tfm.get.room.playerList[name].vx <= 3 and tfm.get.room.playerList[name].x >= 500 and tfm.get.room.playerList[name].y >= 5450 then
				showMessage("<BL>Distância percorrida / Travelled distance : <b>"..data[name].x.."</b> pixels.",name)
				data[name].freezed=false
				tfm.exec.freezePlayer(name,false)
				if data[name].x > data[name].recorde then
					data[name].recorde=data[name].x
					showMessage("<VP>Você atingiu sua maior pontuação / You reached your high score : <b>"..data[name].x.." pixels</b>.",name)
					ui.addTextArea(4,"",name,30+data[name].recorde/37,48,1,5,0x00ff00,0x008000,0.9,true)
					ui.addTextArea(80,"",name,data[name].x+803,50,6,5990,0x00ff00,0x008000,0.8,false)
					tfm.exec.setPlayerScore(name,data[name].x,false)
				end
				if data[name].x > recorde then
					recorde=data[name].x
					recorder=name
					showMessage("<J>Novo recorde da sala / New room high score : <b>"..data[name].x.." pixels</b>, feito por (made by) "..name.."!")
					ui.addTextArea(5,"",nil,30+recorde/37,48,1,5,0xff00ff,0x800080,0.9,true)
					updateBar()
					ui.addTextArea(81,"",nil,data[name].x+803,50,6,5990,0xff00ff,0x800080,0.8,false)
					tfm.exec.setPlayerScore(name,data[name].x,false)
				end
				resetPlayer(name)
			end
		else
			if tfm.get.room.playerList[name].y >= 5520 and tfm.get.room.currentMap == "@0" and data[name].freezed == false then
				data[name].sc=data[name].sc+1
				data[name].freezed=true
				if data[name].sc == 10 then
					data[name].sc=-15
					if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
						showMessage("<VP>O fundo do mar é o céu de outro mundo...<br><BL>— Pyke",name)
					end
				end
			end
		end
		if data[name].loop >= 12 then
			if tfm.get.room.playerList[name].y <= 1500 and tfm.get.room.currentMap == "@0" then
				if data[name].freezed == false and freeze == true then
					if data[name].x > 0 then
						if tfm.get.room.playerList[name].vx >= 5.1 then
							tfm.exec.setPlayerGravityScale(name,0)
							tfm.exec.movePlayer(name,0,0,false,0,false)
							tfm.exec.freezePlayer(name)
						end
					else
						tfm.exec.setPlayerGravityScale(name,-0.2)
						data[name].sc=data[name].sc+1
						data[name].freezed=true
						if data[name].sc >= 15 then
							data[name].sc=-15
							if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
								showMessage("<VP>Nada há de caminhar sobre as estrelas...<br><BL>— Aurelion Sol",name)
							end
						end
					end
				end
			end
		end
	end
end
