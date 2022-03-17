admin={""} -- Insira o nome dos FunCorps aqui!
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog"} do
	system.disableChatCommandDisplay(f)
end
rd = {title = 117, look = "201;0,6_2651d3+3d65a6,23,34,40,63_21f1f6+475edc+471ebb+5991d7+19809b,33_2b7dde+538be1,58,18_86b78+b78d1",x = 268,y = 1893,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
ld = {title = 42, look = "138;228,49_332301+c38a07+bc7718+570e00,63_242b2c+5d7250+562d1a+572f14,11,44,82,0,0,36_3d0807+6a720a",x = 4391,y = 4058,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
ku = {title = 35, look = "201;224,48_131313+0,27,74_141b22+70d,2_1a1a1a,40_23566c+f0f0f,36,2,0",x = 3009,y = 4808,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
mf = {title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 5018,y = 319,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
dr = {title = 43, look = "150;194,6_c926d3+a63d91,39,0,0,0,0,0,0",x = 4574,y = 2329,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
cs = {title = 257, look = "1;44,40,87,3,62,91,37,52,0",x = 2475,y = 359,female = true,lookLeft = false,lookAtPlayer = true,interactive = true}
dw = {title = 2, look = "1;203,50,20,41,42,103,50,0,0",x = 2726,y = 359,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
kp = {title = 11, look = "1;16,5,20,73,26,94,29,62,46",x = 3698,y = 435,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
ag = {title = 9, look = "4;225,43,38,0,54,104,0,0,20",x = 60,y = 409,female = false,lookLeft = false,lookAtPlayer = true,interactive = true}
tfm.exec.newGame('<C><P L="5200" H="6500" d="x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1790,192" D="x_deadmeat/x_pictos/d_1694-fs8.png,2924,6213;x_deadmeat/x_pictos/d_1694-fs8.png,4906,5757;x_deadmeat/x_pictos/d_1098-fs8.png,5188,5683;x_deadmeat/x_pictos/d_1098-fs8.png,4976,5767;x_transformice/x_inventaire/2527.jpg,5038,5737;x_transformice/x_inventaire/2527.jpg,5200,5673;x_transformice/x_inventaire/2528.jpg,4986,5729;x_deadmeat/x_pictos/d_1385-fs8.png,5084,5697;x_deadmeat/x_pictos/d_1763-fs8.png,3050,6244;x_deadmeat/x_pictos/d_1763-fs8.png,2704,6271;x_deadmeat/x_pictos/d_1763-fs8.png,5152,5707;x_deadmeat/x_pictos/d_1763-fs8.png,4948,5783;x_deadmeat/x_pictos/d_1736-fs8.png,4824,5755;x_deadmeat/x_pictos/d_1736-fs8.png,2758,6209;x_deadmeat/x_pictos/d_1386-fs8.png,2604,6234;x_deadmeat/x_pictos/d_1219-fs8.png,2560,6228;x_transformice/x_inventaire/2526.jpg,2650,6227;x_transformice/x_inventaire/2527.jpg,3026,6203;x_transformice/x_inventaire/2528.jpg,2892,6233;x_deadmeat/x_pictos/d_1219-fs8.png,3076,6165;x_transformice/x_inventaire/2527.jpg,2728,6257;x_deadmeat/x_pictos/d_20-fs8.png,2924,6213;x_deadmeat/x_pictos/d_1747-fs8.png,2834,6259;x_deadmeat/x_pictos/d_1747-fs8.png,3076,6241;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,2422,5925;x_deadmeat/x_pictos/d_1763-fs8.png,236,423;x_deadmeat/x_pictos/d_1763-fs8.png,20,389;../godspaw/img/drapeau1.png,-248,183;x_deadmeat/x_pictos/d_1385-fs8.png,138,375;x_deadmeat/x_pictos/d_1385-fs8.png,-132,327;../godspaw/img/drapeau1.png,2575,183;../godspaw/img/drapeau1.png,3095,277;../godspaw/img/drapeau1.png,2050,277;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-485,12;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-773,120;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-392,-102;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5328,300;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5594,-77;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5131,107;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4673,260;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4795,-62;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4402,67;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3920,-75;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3986,215;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3258,230;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3406,-4;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2989,-218;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2449,-125;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2918,78;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1860,-140;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-21,93;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,312,39;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,73,-167;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,301,206;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1073,-79;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,539,-113;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,804,116;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,936,209;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1256,50;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2130,51;x_deadmeat/x_pictos/d_4653.png,690,318;x_deadmeat/x_pictos/d_1762-fs8.png,325,4740;x_deadmeat/x_pictos/d_1762-fs8.png,281,4566;x_deadmeat/x_pictos/d_1762-fs8.png,143,4039;x_deadmeat/x_pictos/d_1762-fs8.png,203,4272;x_transformice/x_inventaire/2526.jpg,921,4875;x_transformice/x_inventaire/2526.jpg,322,4613;x_transformice/x_inventaire/2527.jpg,1076,4891;x_transformice/x_inventaire/2527.jpg,733,4901;x_transformice/x_inventaire/2528.jpg,651,4869;x_transformice/x_inventaire/2528.jpg,1465,4893;x_transformice/x_inventaire/2527.jpg,2137,4858;x_transformice/x_inventaire/2527.jpg,3517,4194;x_transformice/x_inventaire/2527.jpg,3219,4509;x_transformice/x_inventaire/2528.jpg,2727,4798;x_transformice/x_inventaire/2528.jpg,3398,4345;x_deadmeat/x_pictos/d_1763-fs8.png,3316,4623;x_deadmeat/x_pictos/d_1763-fs8.png,3144,4769;x_deadmeat/x_pictos/d_1763-fs8.png,2970,4802;x_deadmeat/x_pictos/d_1763-fs8.png,594,4985;x_deadmeat/x_pictos/d_1763-fs8.png,1490,4971;x_deadmeat/x_pictos/d_1763-fs8.png,1465,4972;x_deadmeat/x_pictos/d_1763-fs8.png,1608,4963;x_deadmeat/x_pictos/d_1763-fs8.png,1225,4991;x_deadmeat/x_pictos/d_1763-fs8.png,1073,5007;x_deadmeat/x_pictos/d_1763-fs8.png,973,5007;x_deadmeat/x_pictos/d_1763-fs8.png,829,5001;x_deadmeat/x_pictos/d_1763-fs8.png,787,4998;x_deadmeat/x_pictos/d_4653.png,1240,4883;x_deadmeat/x_pictos/d_1385-fs8.png,354,4855;x_deadmeat/x_pictos/d_1385-fs8.png,251,4466;x_deadmeat/x_pictos/d_1385-fs8.png,170,4153;x_deadmeat/x_pictos/d_1386-fs8.png,3616,4075;x_deadmeat/x_pictos/d_1386-fs8.png,3308,4437;x_deadmeat/x_pictos/d_1386-fs8.png,3227,4637;x_deadmeat/x_pictos/d_1386-fs8.png,1524,4918;x_deadmeat/x_pictos/d_1735-fs8.png,2660,4820;x_deadmeat/x_pictos/d_1735-fs8.png,1794,4907;x_deadmeat/x_pictos/d_1735-fs8.png,513,4950;x_deadmeat/x_pictos/d_1098-fs8.png,1889,4862;x_deadmeat/x_pictos/d_1762-fs8.png,1147,4931;x_deadmeat/x_pictos/d_1219-fs8.png,2800,4745;x_deadmeat/x_pictos/d_1219-fs8.png,425,4870;x_deadmeat/x_pictos/d_1105-fs8.png,2242,4856;x_deadmeat/x_pictos/d_1105-fs8.png,888,4939;x_deadmeat/x_pictos/d_1813-fs8.png,391,4936;x_deadmeat/x_pictos/d_1813-fs8.png,2213,4880;x_deadmeat/x_pictos/d_1813-fs8.png,2772,4805;x_deadmeat/x_pictos/d_1813-fs8.png,1878,4898;x_deadmeat/x_pictos/d_1813-fs8.png,1109,4958;x_deadmeat/x_pictos/d_1813-fs8.png,859,4958;x_transformice/x_inventaire/2527.jpg,2452,1813;x_transformice/x_inventaire/2526.jpg,2568,1986;x_transformice/x_inventaire/2526.jpg,2705,1814;x_transformice/x_inventaire/2526.jpg,2602,2065;x_transformice/x_inventaire/2526.jpg,2678,1679;x_transformice/x_inventaire/2526.jpg,2549,1788;x_transformice/x_inventaire/2527.jpg,2820,1519;x_transformice/x_inventaire/2527.jpg,2386,1571;x_transformice/x_inventaire/2527.jpg,2702,1708;x_transformice/x_inventaire/2527.jpg,2497,1899;x_transformice/x_inventaire/2528.jpg,2775,1621;x_transformice/x_inventaire/2528.jpg,2594,2161;x_transformice/x_inventaire/2528.jpg,2450,1689;x_transformice/x_inventaire/2528.jpg,2638,1911;x_deadmeat/x_pictos/d_4653.png,4890,321;x_deadmeat/x_pictos/d_4524.png,1473,3814;x_deadmeat/x_pictos/d_4531.png,1632,4918;x_deadmeat/x_pictos/d_4532.png,631,4952;x_deadmeat/x_pictos/d_3298.png,3020,4755;x_deadmeat/x_pictos/d_3298.png,1641,4931;x_deadmeat/x_pictos/d_3298.png,642,4969;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,1191,4633;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,393,4642;x_deadmeat/x_pictos/d_1694-fs8.png,1019,2741;x_deadmeat/x_pictos/d_1098-fs8.png,970,2547;x_deadmeat/x_pictos/d_1219-fs8.png,783,2155;x_deadmeat/x_pictos/d_1385-fs8.png,467,1856;x_deadmeat/x_pictos/d_1385-fs8.png,1234,3542;x_deadmeat/x_pictos/d_1385-fs8.png,1174,3353;x_deadmeat/x_pictos/d_1385-fs8.png,1096,3123;x_transformice/x_inventaire/2528.jpg,3516,3145;x_deadmeat/x_pictos/d_1736-fs8.png,3369,3236;x_deadmeat/x_pictos/d_1219-fs8.png,3926,2610;x_deadmeat/x_pictos/d_1219-fs8.png,3816,2718;x_deadmeat/x_pictos/d_1762-fs8.png,5672,2164;x_deadmeat/x_pictos/d_1771-fs8.png,5232,2171;x_deadmeat/x_pictos/d_1694-fs8.png,5010,2153;x_deadmeat/x_pictos/d_1694-fs8.png,5432,2117;x_deadmeat/x_pictos/d_20-fs8.png,5494,2120;x_deadmeat/x_pictos/d_1747-fs8.png,5661,2198;x_deadmeat/x_pictos/d_1747-fs8.png,5426,2185;x_deadmeat/x_pictos/d_1747-fs8.png,5226,2190;x_deadmeat/x_pictos/d_1747-fs8.png,5007,2215;x_deadmeat/x_pictos/d_1762-fs8.png,3877,2701;x_deadmeat/x_pictos/d_1762-fs8.png,3728,2917;x_deadmeat/x_pictos/d_1762-fs8.png,4194,2455;x_deadmeat/x_pictos/d_1762-fs8.png,4072,2534;x_deadmeat/x_pictos/d_1736-fs8.png,4581,2252;x_deadmeat/x_pictos/d_1736-fs8.png,4302,2334;x_deadmeat/x_pictos/d_1219-fs8.png,4878,2147;x_deadmeat/x_pictos/d_3298.png,4842,2215;x_transformice/x_inventaire/2528.jpg,-99,2429;x_transformice/x_inventaire/2528.jpg,245,3237;x_transformice/x_inventaire/2528.jpg,367,2812;x_transformice/x_inventaire/2528.jpg,3439,574;x_transformice/x_inventaire/2528.jpg,1794,633;x_transformice/x_inventaire/2528.jpg,321,1814;x_deadmeat/x_pictos/d_1761-fs8.png,4340,3414;x_deadmeat/x_pictos/d_1761-fs8.png,4099,3290;x_deadmeat/x_pictos/d_1761-fs8.png,4175,3329;x_deadmeat/x_pictos/d_1761-fs8.png,3729,3072;x_deadmeat/x_pictos/d_1761-fs8.png,3996,3248;x_deadmeat/x_pictos/d_1761-fs8.png,4208,3350;x_deadmeat/x_pictos/d_1761-fs8.png,4305,3393;x_deadmeat/x_pictos/d_1761-fs8.png,3897,3193;x_deadmeat/x_pictos/d_1761-fs8.png,-49,2601;x_deadmeat/x_pictos/d_1761-fs8.png,-204,2358;x_deadmeat/x_pictos/d_1761-fs8.png,393,1874;x_deadmeat/x_pictos/d_1736-fs8.png,-66,315;x_deadmeat/x_pictos/d_1736-fs8.png,4431,3948;x_transformice/x_inventaire/2526.jpg,755,2085;x_transformice/x_inventaire/2526.jpg,174,1852;x_transformice/x_inventaire/2526.jpg,628,1969;x_transformice/x_inventaire/2526.jpg,237,3193;x_transformice/x_inventaire/2526.jpg,293,2852;x_transformice/x_inventaire/2527.jpg,220,2942;x_transformice/x_inventaire/2527.jpg,315,2804;x_transformice/x_inventaire/2527.jpg,183,3218;x_transformice/x_inventaire/2527.jpg,559,1942;x_transformice/x_inventaire/2527.jpg,-20,1864;x_deadmeat/x_pictos/d_1219-fs8.png,643,2004;x_deadmeat/x_pictos/d_1219-fs8.png,513,1896;x_deadmeat/x_pictos/d_1219-fs8.png,-114,1898;x_deadmeat/x_pictos/d_1219-fs8.png,267,1829;x_deadmeat/x_pictos/d_1219-fs8.png,391,2795;x_deadmeat/x_pictos/d_1219-fs8.png,335,2863;x_deadmeat/x_pictos/d_1219-fs8.png,1545,3764;x_deadmeat/x_pictos/d_1219-fs8.png,3702,4009;x_deadmeat/x_pictos/d_1219-fs8.png,3940,3179;x_deadmeat/x_pictos/d_1219-fs8.png,3312,3315;x_deadmeat/x_pictos/d_1219-fs8.png,3647,2995;x_deadmeat/x_pictos/d_1105-fs8.png,5107,3891;x_deadmeat/x_pictos/d_1105-fs8.png,3943,3990;x_deadmeat/x_pictos/d_1105-fs8.png,3999,4007;x_deadmeat/x_pictos/d_1105-fs8.png,3145,3450;x_deadmeat/x_pictos/d_1105-fs8.png,3462,3641;x_deadmeat/x_pictos/d_1105-fs8.png,3348,3526;x_deadmeat/x_pictos/d_1105-fs8.png,2678,3521;x_deadmeat/x_pictos/d_1105-fs8.png,2743,3509;x_deadmeat/x_pictos/d_1105-fs8.png,305,3239;x_deadmeat/x_pictos/d_1105-fs8.png,1405,3798;x_transformice/x_inventaire/2527.jpg,3275,531;x_transformice/x_inventaire/2526.jpg,3353,628;x_transformice/x_inventaire/2526.jpg,1948,510;x_transformice/x_inventaire/2526.jpg,1853,593;x_transformice/x_inventaire/2527.jpg,1866,534;x_deadmeat/x_pictos/d_17-fs8.png,2234,180;x_deadmeat/x_pictos/d_17-fs8.png,2843,171;x_transformice/x_inventaire/2530.jpg,4971,3832;x_transformice/x_inventaire/2530.jpg,2453,3348;x_deadmeat/x_pictos/d_1762-fs8.png,3264,3414;x_deadmeat/x_pictos/d_1762-fs8.png,3504,3649;x_deadmeat/x_pictos/d_1762-fs8.png,3673,3819;x_deadmeat/x_pictos/d_1762-fs8.png,3595,3746;x_deadmeat/x_pictos/d_1098-fs8.png,3666,3849;x_deadmeat/x_pictos/d_1098-fs8.png,3508,3692;x_deadmeat/x_pictos/d_1098-fs8.png,3360,3547;x_transformice/x_inventaire/2529.jpg,5012,3896;x_transformice/x_inventaire/2529.jpg,2859,3488;x_transformice/x_inventaire/2529.jpg,1115,3779;x_transformice/x_inventaire/2526.jpg,1337,3733;x_transformice/x_inventaire/2526.jpg,416,3894;x_transformice/x_inventaire/2526.jpg,959,3802;x_transformice/x_inventaire/2526.jpg,2186,3641;x_transformice/x_inventaire/2526.jpg,2700,3319;x_transformice/x_inventaire/2526.jpg,4941,3912;x_transformice/x_inventaire/2526.jpg,5147,3890;x_transformice/x_inventaire/2526.jpg,4534,3956;x_transformice/x_inventaire/2526.jpg,3741,3887;x_transformice/x_inventaire/2526.jpg,2688,3474;x_transformice/x_inventaire/2528.jpg,2718,3409;x_transformice/x_inventaire/2528.jpg,2451,3445;x_transformice/x_inventaire/2528.jpg,747,3853;x_transformice/x_inventaire/2527.jpg,668,3880;x_transformice/x_inventaire/2527.jpg,835,3830;x_transformice/x_inventaire/2527.jpg,2930,3417;x_transformice/x_inventaire/2527.jpg,2276,3597;x_transformice/x_inventaire/2527.jpg,2427,3496;x_transformice/x_inventaire/2527.jpg,3961,3916;x_transformice/x_inventaire/2527.jpg,4401,4001;x_transformice/x_inventaire/2527.jpg,4680,3920;x_transformice/x_inventaire/2528.jpg,4845,3906;x_transformice/x_inventaire/2528.jpg,4093,4008;x_transformice/x_inventaire/2528.jpg,502,3891;x_transformice/x_inventaire/2528.jpg,1211,3758;x_deadmeat/x_pictos/d_1771-fs8.png,3839,3936;x_deadmeat/x_pictos/d_1762-fs8.png,4050,3988;x_deadmeat/x_pictos/d_1747-fs8.png,3837,3954;x_deadmeat/x_pictos/d_1747-fs8.png,4037,4022;x_deadmeat/x_pictos/d_2847.png,4235,3985;x_deadmeat/x_pictos/d_1103-fs8.png,3614,3765;x_deadmeat/x_pictos/d_1103-fs8.png,3304,3451;x_deadmeat/x_pictos/d_1771-fs8.png,2474,3537;x_deadmeat/x_pictos/d_1771-fs8.png,2137,3702;x_deadmeat/x_pictos/d_1771-fs8.png,3046,3446;x_deadmeat/x_pictos/d_1762-fs8.png,2963,3442;x_deadmeat/x_pictos/d_1762-fs8.png,2236,3629;x_deadmeat/x_pictos/d_1098-fs8.png,2342,3553;x_deadmeat/x_pictos/d_1098-fs8.png,2018,3700;x_deadmeat/x_pictos/d_1747-fs8.png,2132,3716;x_deadmeat/x_pictos/d_1747-fs8.png,2227,3661;x_deadmeat/x_pictos/d_1747-fs8.png,2471,3553;x_deadmeat/x_pictos/d_1747-fs8.png,3040,3463;x_deadmeat/x_pictos/d_1747-fs8.png,2951,3478;x_deadmeat/x_pictos/d_1109-fs8.png,4986,3930;x_deadmeat/x_pictos/d_1109-fs8.png,307,1891;x_deadmeat/x_pictos/d_1109-fs8.png,1800,3803;x_deadmeat/x_pictos/d_1733-fs8.png,2779,3484;x_deadmeat/x_pictos/d_1733-fs8.png,2335,3594;x_deadmeat/x_pictos/d_1733-fs8.png,2013,3744;x_deadmeat/x_pictos/d_1733-fs8.png,1769,3814;x_deadmeat/x_pictos/d_1733-fs8.png,1643,3834;x_deadmeat/x_pictos/d_1733-fs8.png,1520,3835;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,205,3581;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,4111,3689;x_deadmeat/x_pictos/d_4561.png,4509,3973;x_deadmeat/x_pictos/d_4565.png,4691,3930;x_deadmeat/x_pictos/d_3628.png,5039,3773;x_deadmeat/x_pictos/d_2847.png,2640,3500;x_deadmeat/x_pictos/d_2847.png,1915,3767;x_deadmeat/x_pictos/d_2847.png,185,399;x_deadmeat/x_pictos/d_2847.png,-155,1943;x_deadmeat/x_pictos/d_2847.png,345,1860;x_deadmeat/x_pictos/d_2847.png,916,3804;x_deadmeat/x_pictos/d_2847.png,1244,3757;x_deadmeat/x_pictos/d_2847.png,844,3860;x_deadmeat/x_pictos/d_2847.png,449,3917;x_deadmeat/x_pictos/d_1771-fs8.png,1347,3789;x_deadmeat/x_pictos/d_1771-fs8.png,1171,3765;x_deadmeat/x_pictos/d_1771-fs8.png,999,3810;x_deadmeat/x_pictos/d_1771-fs8.png,412,3935;x_deadmeat/x_pictos/d_1771-fs8.png,311,3932;x_deadmeat/x_pictos/d_1771-fs8.png,532,3924;x_deadmeat/x_pictos/d_1771-fs8.png,797,3880;x_deadmeat/x_pictos/d_1771-fs8.png,714,3893;x_deadmeat/x_pictos/d_1762-fs8.png,886,2345;x_deadmeat/x_pictos/d_1762-fs8.png,-174,345;x_deadmeat/x_pictos/d_1762-fs8.png,594,1977;x_deadmeat/x_pictos/d_1762-fs8.png,-4,1905;x_deadmeat/x_pictos/d_1762-fs8.png,-158,2419;x_deadmeat/x_pictos/d_1762-fs8.png,-18,2641;x_deadmeat/x_pictos/d_1762-fs8.png,-22,2507;x_deadmeat/x_pictos/d_1762-fs8.png,328,2917;x_deadmeat/x_pictos/d_1762-fs8.png,262,3001;x_deadmeat/x_pictos/d_1762-fs8.png,194,3273;x_deadmeat/x_pictos/d_1762-fs8.png,506,3929;x_deadmeat/x_pictos/d_1762-fs8.png,956,3853;x_deadmeat/x_pictos/d_1762-fs8.png,1110,3811;x_deadmeat/x_pictos/d_1762-fs8.png,1608,3847;x_deadmeat/x_pictos/d_1762-fs8.png,1870,3795;x_deadmeat/x_pictos/d_1762-fs8.png,2180,3679;x_deadmeat/x_pictos/d_1762-fs8.png,2308,3621;x_deadmeat/x_pictos/d_1762-fs8.png,2724,3501;x_deadmeat/x_pictos/d_1762-fs8.png,3212,3417;x_deadmeat/x_pictos/d_1762-fs8.png,3458,3607;x_deadmeat/x_pictos/d_1762-fs8.png,5030,3951;x_deadmeat/x_pictos/d_1762-fs8.png,4790,4003;x_deadmeat/x_pictos/d_1762-fs8.png,4688,4013;x_deadmeat/x_pictos/d_1762-fs8.png,4326,4035;x_deadmeat/x_pictos/d_1762-fs8.png,3986,3987;x_deadmeat/x_pictos/d_1762-fs8.png,4370,3413;x_deadmeat/x_pictos/d_1762-fs8.png,4128,3303;x_deadmeat/x_pictos/d_1762-fs8.png,4042,3263;x_deadmeat/x_pictos/d_1762-fs8.png,3768,3115;x_deadmeat/x_pictos/d_1762-fs8.png,3782,2825;x_deadmeat/x_pictos/d_1762-fs8.png,3990,2593;x_deadmeat/x_pictos/d_1762-fs8.png,4246,2431;x_deadmeat/x_pictos/d_1762-fs8.png,4526,2323;x_deadmeat/x_pictos/d_1762-fs8.png,5286,2181;x_deadmeat/x_pictos/d_1762-fs8.png,5086,2199;x_deadmeat/x_pictos/d_1762-fs8.png,4820,2235;x_deadmeat/x_pictos/d_1762-fs8.png,4752,2249;x_deadmeat/x_pictos/d_1694-fs8.png,5340,2147;x_deadmeat/x_pictos/d_1694-fs8.png,4952,2185;x_deadmeat/x_pictos/d_1694-fs8.png,4434,2309;x_deadmeat/x_pictos/d_1694-fs8.png,4556,3989;x_deadmeat/x_pictos/d_1694-fs8.png,3916,3939;x_deadmeat/x_pictos/d_1694-fs8.png,4852,3955;x_deadmeat/x_pictos/d_1812-fs8.png,256,3937;x_deadmeat/x_pictos/d_1812-fs8.png,464,3923;x_deadmeat/x_pictos/d_1812-fs8.png,1032,3775;x_deadmeat/x_pictos/d_1812-fs8.png,872,3819;x_deadmeat/x_pictos/d_1812-fs8.png,664,3885;x_deadmeat/x_pictos/d_1694-fs8.png,4236,3351;x_deadmeat/x_pictos/d_1694-fs8.png,3832,3125;x_deadmeat/x_pictos/d_1694-fs8.png,2894,3445;x_deadmeat/x_pictos/d_1694-fs8.png,1290,3729;x_deadmeat/x_pictos/d_1694-fs8.png,374,3905;x_deadmeat/x_pictos/d_1694-fs8.png,214,3235;x_deadmeat/x_pictos/d_1694-fs8.png,198,3051;x_deadmeat/x_pictos/d_1694-fs8.png,358,2867;x_deadmeat/x_pictos/d_1694-fs8.png,696,2053;x_deadmeat/x_pictos/d_1694-fs8.png,216,1841;x_deadmeat/x_pictos/d_1694-fs8.png,-84,1905;x_deadmeat/x_pictos/d_1103-fs8.png,64,367;x_deadmeat/x_pictos/d_1103-fs8.png,5146,2173;x_deadmeat/x_pictos/d_1103-fs8.png,4688,2251;x_deadmeat/x_pictos/d_1103-fs8.png,4116,2469;x_deadmeat/x_pictos/d_1103-fs8.png,5112,3911;x_deadmeat/x_pictos/d_1103-fs8.png,4142,4019;x_deadmeat/x_pictos/d_1103-fs8.png,3098,3417;x_deadmeat/x_pictos/d_1103-fs8.png,2536,3503;x_deadmeat/x_pictos/d_1103-fs8.png,1962,3737;x_deadmeat/x_pictos/d_1103-fs8.png,1460,3789;x_deadmeat/x_pictos/d_1103-fs8.png,610,3893;x_deadmeat/x_pictos/d_1103-fs8.png,260,3905;x_deadmeat/x_pictos/d_1103-fs8.png,256,3219;x_deadmeat/x_pictos/d_1103-fs8.png,136,3269;x_deadmeat/x_pictos/d_3004.png,4820,3885;x_deadmeat/x_pictos/d_1103-fs8.png,410,1845;x_transformice/x_evt/x_evt_26/elisah9_trhc.png,2485,3207;x_deadmeat/x_pictos/d_3298.png,4200,4026;x_deadmeat/x_pictos/d_1103-fs8.png,100,1849;x_deadmeat/x_pictos/d_3291.png,2700,58;x_deadmeat/x_pictos/d_3292.png,2450,139;x_deadmeat/x_pictos/d_3283.png,2969,172;x_deadmeat/x_pictos/d_3004.png,4263,3991;x_deadmeat/x_pictos/d_3004.png,4519,3930;x_deadmeat/x_pictos/d_3283.png,2063,166;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,1413,3488;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,5168,3569;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,4868,3588;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,4562,3647;x_deadmeat/x_pictos/d_20-fs8.png,3013,362;x_deadmeat/x_pictos/d_20-fs8.png,2901,318;x_deadmeat/x_pictos/d_20-fs8.png,2793,274;x_deadmeat/x_pictos/d_20-fs8.png,2637,262;x_deadmeat/x_pictos/d_20-fs8.png,2521,258;x_deadmeat/x_pictos/d_20-fs8.png,2397,258;x_deadmeat/x_pictos/d_20-fs8.png,2281,274;x_deadmeat/x_pictos/d_20-fs8.png,2169,310;x_deadmeat/x_pictos/d_20-fs8.png,2041,354;x_transformice/x_evt/x_evt_01/kjneb75/loupiote2.png,2565,4100" P="" mc="" MEDATA="66,1;;;;-0;0:::1-"/><Z><S><S T="10" X="2524" Y="931" L="1222" H="340" P="0,0,0.3,0.2,30,0,0,0"/><S T="10" X="2604" Y="737" L="1048" H="522" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2600" Y="1003" L="344" H="1070" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2696" Y="957" L="1222" H="340" P="0,0,0.3,0.2,-30,0,0,0"/><S T="10" X="2578" Y="1013" L="922" H="340" P="0,0,0.3,0.2,60,0,0,0"/><S T="10" X="2720" Y="1117" L="922" H="340" P="0,0,0.3,0.2,-30,0,0,0"/><S T="10" X="2599" Y="875" L="1241" H="340" P="0,0,0.3,0.2,-7,0,0,0"/><S T="12" X="-210" Y="14" L="10" H="4000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="7" X="5954" Y="4713" L="1693" H="1736" P="0,0,1.1,0.2,-10,0,0,0"/><S T="12" X="5410" Y="900" L="10" H="3000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="12" X="-210" Y="3300" L="10" H="3000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="12" X="5410" Y="3900" L="10" H="3000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="10" X="2600" Y="424" L="360" H="100" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2260" Y="469" L="360" H="100" P="0,0,0.3,0.2,-15,0,0,0"/><S T="10" X="2940" Y="469" L="360" H="100" P="0,0,0.3,0.2,15,0,0,0"/><S T="10" X="1981" Y="630" L="360" H="100" P="0,0,0.3,0.2,-45,0,0,0"/><S T="10" X="3219" Y="630" L="360" H="100" P="0,0,0.3,0.2,45,0,0,0"/><S T="10" X="1998" Y="991" L="640" H="100" P="0,0,0.3,0.2,245,0,0,0"/><S T="10" X="3202" Y="991" L="640" H="100" P="0,0,0.3,0.2,-245,0,0,0"/><S T="10" X="2373" Y="1440" L="624" H="100" P="0,0,0.3,0.2,215,0,0,0"/><S T="10" X="2827" Y="1440" L="624" H="100" P="0,0,0.3,0.2,-215,0,0,0"/><S T="12" X="1333" Y="463" L="228" H="28" P="1,0,1.2,0.2,0,1,0,0" o="324650" i="-5,-232,x_transformice/x_evt/x_evt_19/svtrixcv/bateau.png"/><S T="7" X="6303" Y="3166" L="2121" H="1800" P="0,0,1.1,0.2,3,0,0,0"/><S T="7" X="5146" Y="2955" L="500" H="1433" P="0,0,1.1,0.2,-8,0,0,0"/><S T="7" X="2851" Y="4139" L="551" H="1206" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="3072" Y="3908" L="549" H="826" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="3743" Y="3482" L="519" H="702" P="0,0,1.1,0.2,-44,0,0,0"/><S T="7" X="4299" Y="3235" L="210" H="1260" P="0,0,1.1,0.2,-60,0,0,0"/><S T="7" X="4343" Y="3173" L="210" H="1260" P="0,0,1.1,0.2,-48,0,0,0"/><S T="7" X="4469" Y="3158" L="280" H="1406" P="0,0,1.1,0.2,-36,0,0,0"/><S T="7" X="4608" Y="3100" L="320" H="1440" P="0,0,1.1,0.2,-24,0,0,0"/><S T="7" X="4823" Y="3006" L="360" H="1408" P="0,0,1.1,0.2,-16,0,0,0"/><S T="7" X="3191" Y="4020" L="923" H="691" P="0,0,1.1,0.2,-45,0,0,0"/><S T="7" X="4000" Y="4366" L="665" H="641" P="0,0,1.1,0.2,20,0,0,0"/><S T="7" X="3989" Y="3553" L="519" H="702" P="0,0,1.1,0.2,-64,0,0,0"/><S T="7" X="4108" Y="3695" L="399" H="653" P="0,0,1.1,0.2,-94,0,0,0"/><S T="7" X="4530" Y="4263" L="399" H="852" P="0,0,1.1,0.2,-94,0,0,0"/><S T="7" X="2531" Y="4212" L="551" H="1183" P="0,0,1.1,0.2,-25,0,0,0"/><S T="7" X="2116" Y="4291" L="951" H="1012" P="0,0,1.1,0.2,-15,0,0,0"/><S T="7" X="1610" Y="4374" L="551" H="969" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="1583" Y="4013" L="640" H="278" P="0,0,1.1,0.2,15,0,0,0"/><S T="7" X="866" Y="4331" L="802" H="1133" P="0,0,1.1,0.2,75,0,0,0"/><S T="7" X="788" Y="3726" L="205" H="974" P="0,0,1.1,0.2,80,0,0,0"/><S T="7" X="-3" Y="5401" L="2421" H="985" P="0,0,1.1,0.2,75,0,0,0"/><S T="7" X="456" Y="4059" L="205" H="490" P="0,0,1.1,0.2,85,0,0,0"/><S T="7" X="-334" Y="4089" L="960" H="974" P="0,0,1.1,0.2,168,0,0,0"/><S T="7" X="-408" Y="3275" L="949" H="974" P="0,0,1.1,0.2,178,0,0,0"/><S T="7" X="696" Y="3446" L="582" H="974" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="625" Y="3069" L="582" H="649" P="0,0,1.1,0.2,40,0,0,0"/><S T="7" X="-670" Y="2648" L="1092" H="974" P="0,0,1.1,0.2,148,0,0,0"/><S T="7" X="297" Y="2598" L="582" H="253" P="0,0,1.1,0.2,30,0,0,0"/><S T="7" X="1" Y="2251" L="582" H="142" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="-571" Y="2030" L="582" H="718" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="-1154" Y="2133" L="603" H="718" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="125" Y="2206" L="582" H="142" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="280" Y="2200" L="582" H="382" P="0,0,1.1,0.2,-90,0,0,0"/><S T="7" X="429" Y="2255" L="582" H="382" P="0,0,1.1,0.2,-50,0,0,0"/><S T="7" X="684" Y="2498" L="486" H="517" P="0,0,1.1,0.2,-30,0,0,0"/><S T="7" X="810" Y="2881" L="486" H="517" P="0,0,1.1,0.2,-6,0,0,0"/><S T="12" X="1790" Y="-590" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="4316" Y="-590" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="7" X="4165" Y="4801" L="761" H="1617" P="0,0,1.1,0.2,-50,0,0,0"/><S T="7" X="2957" Y="5523" L="761" H="1359" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="1837" Y="6162" L="2371" H="1384" P="0,0,1.1,0.2,85,0,0,0"/><S T="7" X="878" Y="6207" L="1660" H="2349" P="0,0,1.1,0.2,3,0,0,0"/><S T="9" X="600" Y="2500" L="4000" H="4000" P="0,0,0,0,0,0,0,0" m=""/><S T="9" X="4600" Y="2500" L="4000" H="4000" P="0,0,0,0,0,0,0,0" m=""/><S T="7" X="930" Y="4474" L="731" H="966" P="0,0,1.1,0.2,95,0,0,0"/><S T="7" X="2084" Y="4458" L="731" H="966" P="0,0,1.1,0.2,95,0,0,0"/><S T="9" X="600" Y="6500" L="4000" H="4000" P="0,0,0,0,0,0,0,0" m=""/><S T="9" X="4603" Y="6500" L="4000" H="4000" P="0,0,0,0,0,0,0,0" m=""/><S T="13" X="4988" Y="489" L="71" P="0,0,1,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="4988" Y="380" L="10" H="92" P="0,0,1,0.2,15,0,0,0" o="324650" m=""/><S T="12" X="5045" Y="395" L="10" H="101" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="5029" Y="342" L="58" H="10" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="4386" Y="4036" L="20" H="10" P="0,0,0,0,0,0,0,0" o="324650" m=""/><S T="12" X="3004" Y="4788" L="20" H="10" P="0,0,0,0,0,0,0,0" o="324650" m=""/><S T="12" X="4569" Y="2308" L="20" H="10" P="0,0,0,0,0,0,0,0" o="324650" m=""/><S T="12" X="263" Y="1873" L="20" H="10" P="0,0,0,0,720,0,0,0" o="324650" m=""/><S T="12" X="829" Y="339" L="58" H="10" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="788" Y="377" L="10" H="92" P="0,0,1,0.2,15,0,0,0" o="324650" m=""/><S T="12" X="845" Y="392" L="10" H="101" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="7" X="3769" Y="5327" L="564" H="1551" P="0,0,1.1,0.2,-50,0,0,0"/><S T="13" X="788" Y="486" L="71" P="0,0,1,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="3695" Y="482" L="199" H="60" P="1,0,1.2,0.2,0,1,0,0" o="324650" i="-30,-197,x_bateaupirate.png"/><S T="13" X="1720" Y="121" L="210" P="0,0,0.3,0.2,0,0,0,0" o="DEE336" c="4"/><S T="12" X="4316" Y="-490" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="1790" Y="-490" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="7" X="168" Y="1640" L="582" H="382" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="-588" Y="1392" L="1971" H="602" P="0,0,1.1,0.2,-15,0,0,0"/><S T="7" X="5" Y="982" L="582" H="382" P="0,0,1.1,0.2,-20,0,0,0"/><S T="7" X="-353" Y="824" L="930" H="1073" P="0,0,1.1,0.2,-80,0,0,0"/><S T="7" X="-253" Y="1420" L="930" H="1073" P="0,0,1.1,0.2,-110,0,0,0"/><S T="7" X="3694" Y="5416" L="813" H="1359" P="0,0,1.1,0.2,-7,0,0,0"/><S T="7" X="3299" Y="7085" L="1660" H="1384" P="0,0,1.1,0.2,85,0,0,0"/><S T="7" X="4765" Y="6768" L="1660" H="1791" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="6003" Y="6084" L="1310" H="2401" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="4653" Y="5095" L="1335" H="852" P="0,0,1.1,0.2,-100,0,0,0"/><S T="7" X="3982" Y="6015" L="1700" H="884" P="0,0,0.1,0.2,-5,0,0,0"/></S><D><P X="3015" Y="3497" T="79" P="0,0"/><P X="2617" Y="3557" T="79" P="0,0"/><P X="2422" Y="3614" T="79" P="0,0"/><P X="2098" Y="3768" T="79" P="0,0"/><P X="1740" Y="3870" T="79" P="0,0"/><P X="240" Y="3080" T="79" P="0,0"/><P X="302" Y="3009" T="79" P="0,0"/><P X="-78" Y="2575" T="79" P="0,0"/><P X="58" Y="1925" T="79" P="0,0"/><P X="1687" Y="3849" T="85" C="4B8E72" P="0,0"/><P X="2825" Y="3494" T="86" C="BB5631" P="0,0"/><P X="256" Y="3290" T="81" P="0,0"/><P X="189" Y="1904" T="81" P="0,0"/><P X="3610" Y="3133" T="88" P="0,0"/><P X="3483" Y="3269" T="134" P="0,0"/><P X="848" Y="2302" T="79" P="0,0"/><P X="962" Y="2507" T="79" P="0,0"/><P X="1062" Y="2974" T="79" P="0,0"/><P X="1170" Y="3333" T="79" P="0,0"/><P X="1243" Y="3539" T="79" P="0,0"/><P X="1281" Y="3710" T="79" P="0,0"/><P X="2342" Y="4937" T="84" P="0,0"/><P X="2576" Y="4923" T="84" P="0,0"/><P X="3078" Y="4774" T="85" C="4B8E72" P="0,0"/><P X="3187" Y="4802" T="79" P="0,0"/><P X="2919" Y="4847" T="79" P="0,0"/><P X="2097" Y="4956" T="80" P="0,0"/><P X="2189" Y="4948" T="88" P="0,0"/><P X="2013" Y="4960" T="86" C="BB5631" P="0,0"/><DS X="2604" Y="361"/></D><O><O X="2885" Y="1537" C="4" P="110,1"/><O X="2821" Y="1715" C="4" P="-70,0"/><O X="2758" Y="1892" C="4" P="110,0"/><O X="2695" Y="2066" C="4" P="110,0"/><O X="2631" Y="2244" C="4" P="110,1"/><O X="2565" Y="2244" C="4" P="-110,1"/><O X="2501" Y="2066" C="4" P="-110,0"/><O X="2438" Y="1892" C="4" P="-110,0"/><O X="2374" Y="1714" C="4" P="-110,0"/><O X="2311" Y="1537" C="4" P="-110,1"/><O X="2280" Y="1449" C="11" P="0"/><O X="2917" Y="1449" C="11" P="0"/><O X="2343" Y="1626" C="14" P="0"/><O X="2407" Y="1804" C="14" P="0"/><O X="2470" Y="1979" C="14" P="0"/><O X="2533" Y="2154" C="14" P="0"/><O X="2598" Y="2332" C="11" P="0"/><O X="2663" Y="2156" C="14" P="0"/><O X="2726" Y="1977" C="14" P="0"/><O X="2789" Y="1802" C="14" P="0"/><O X="2854" Y="1626" C="14" P="0"/><O X="2167" Y="1440" C="67" P="-120,0"/><O X="2313" Y="1690" C="67" P="-120,0"/><O X="2458" Y="1942" C="67" P="-120,0"/><O X="2096" Y="1315" C="11" P="0"/><O X="2385" Y="1814" C="14" P="0"/><O X="2240" Y="1565" C="14" P="0"/><O X="2451" Y="1929" C="22" P="0"/><O X="2744" Y="1929" C="22" P="0"/><O X="2955" Y="1565" C="14" P="0"/><O X="2737" Y="1942" C="67" P="120,0"/><O X="3099" Y="1315" C="11" P="0"/><O X="2810" Y="1815" C="14" P="0"/><O X="2882" Y="1690" C="67" P="120,0"/><O X="3028" Y="1440" C="67" P="120,0"/><O X="2955" Y="1565" C="14" P="0"/><O X="3101" Y="1316" C="11" P="0"/><O X="2748" Y="1920" C="22" P="0"/><O X="2809" Y="1818" C="14" P="0"/></O><L/></Z></C>')
tfm.exec.addNPC("Rheylean Darther",rd)
tfm.exec.addNPC("Lord Dowryammer",ld)
tfm.exec.addNPC("Keith Under",ku)
tfm.exec.addNPC("Mayra Flowers",mf)
tfm.exec.addNPC("Dylan Reigns",dr)
tfm.exec.addNPC("Camille Sanders",cs)
tfm.exec.addNPC("Daniel Winngs",dw)
tfm.exec.addNPC("King Pirate",kp)
tfm.exec.addNPC("Aaron Grand",ag)

tfm.exec.setRoomMaxPlayers(40)
shaman=""; ratos=0; alives=0; cannons=6; z=0; data={}; mode="wait"; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
powerups={x1=-1,x2=-1,x3=-1,x4=-1,y1=-1,y2=-1,y3=-1,y4=-1,t1=0,t2=0,t3=0,t4=0}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,message,name,250,100,300,true)
	end
end
function defineShaman()
	max_score=0
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].score >= max_score and not tfm.get.room.playerList[name].isShaman then
			shaman=name
			tfm.exec.setShaman(shaman)
			tfm.exec.setPlayerScore(shaman,-1,false)
			tfm.exec.setShamanMode(shaman,1)
			tfm.exec.movePlayer(shaman,2600,-550,false,0,0,false)
			showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez como shaman!",name)
			alives=alives-1
			max_score=tfm.get.room.playerList[name].score
			break
		end
	end
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function showWater(name)
	tfm.exec.addImage("17f74387366.png","!1",-600,513,name,20,2,0,1)
	tfm.exec.addImage("17f74378b9a.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f7437d864.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f74378b9a.png","!1",-600,471,name,1,1,0,0.44)
	tfm.exec.addImage("17f74382569.jpg","?1",-600,513,name,2,1,0,1)
end
function eventTalkToNPC(name, npc)
	if npc == "Rheylean Darther" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Rheylean Darther] <N>Quem ousa a mergulhar nas minhas sagradas águas, e interromper a paz de <ROSE><b>Rheylean Darther</b>?<br><br><BL>Ah, é só mais um desavisado... <J>SAIA DE MINHA PRESENÇA AGORA, OU SENTIRÁ A MINHA FÚRIA!",name)
		else
			showMessage("<V>[Rheylean Darther] <VP>Vá, e devore todos estes enfadonhos em meu nome! <b>AGORA!</b>",name)
		end
	elseif npc == "Lord Dowryammer" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Lord Dowryammer] <N>Seja bem-vindo(a) ao meu recife de peixes.<br><br>Desde que o cataclisma começou, usei meus poderes secretos para aprender a mergulhar. Pensa como isso foi importante para mim...<br><br>Graças a isso, criei um recife de peixes, onde os crio para sobreviver até tudo isso acabar.<br><br><J>Mas... mal sabe você que o cataclisma não é o maior problema... O grande problema é o tal do <VP>shaman...<br><J>Falando nisso, ele ainda está aqui?",name)
		else
			showMessage("<V>[Lord Dowryammer] <R>Saia daqui agora, seu monstro imundo! Você nunca vai conseguir me pegar de novo!",name)
		end
	elseif npc == "Keith Under" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Keith Under] <N>Você tem muita coragem de estar aqui no mar profundo. Não achei que você sobreviveria. Acho que aqui o <VP>shaman<N> não me encontra. Você o viu?<br><br><R>Espera... Você o viu? Onde ele está? Se estiver por perto, preciso sair daqui AGORA!",name)
		else
			showMessage("<V>[Keith Under] <N>Entre razões e emoções, a saída... Que barulho foi esse?<br><br><J><b>AH, ELE DE NOVO NÃO! SAIA DE MIM AGORA!</b>",name)
		end
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
	elseif npc == "Dylan Reigns" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Dylan Reigns] <N>Oi. Me chame de Dylan Reigns. Sou uma das sobreviventes daquela tragédia catastrófica, e queria...<br><R>O MONSTRO ESTÁ VINDO! CORRA!!",name)
		else
			showMessage("<V>[Dylan Reigns] <R>O MONSTRO ESTÁ AQUI! ALGUÉM ME TIRE DAQUI!",name)
		end
	elseif npc == "Camille Sanders" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Camille Sanders] <N>Sou uma náufraga.<br><br>Há pouco tempo, um grande cataclisma mágico aconteceu e agora estou aqui, no meio deste oceano.<br><br>Recebi boatos de que guardiões muito poderosos estão guardando este lugar, mas não tenho como descer para descobrir.<br><br>O que sei, é que um monstro horroroso chamado <VP>shaman <N>está nos caçando para nos devorar. <br><br>Você precisa fazer de tudo para sobreviver neste lugar.<br>Seja lá como for.",name)
		else
			showMessage("<V>[Camille Sanders] <N>Olha só quem está aqui... Se não é o tal do <VP>shaman...<br><br><N>Preciso contar para... Espera, aquele é mesmo o <VP>shaman<N>?<br><br><J><b>FUJAM TODOS!!</b>",name)
		end
	elseif npc == "Daniel Winngs" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Daniel Winngs] <N>Eu era guia turístico desta região, até o momento do grande cataclisma acontecer e acabar com tudo o que eu tinha.<br><br>Agora, depois de muita luta, consegui descer até o fundo do mar e descobrir o que realmente existe lá.<br><br>E vi que ele está tomado por guardiões desconhecidos que podem até mesmo te prender no fundo do mar.<br><br>Portanto, tenha cuidado se for entrar no mar. Talvez seja um caminho sem volta.<br><br>Ah, e tome cuidado com um certo <VP>shaman<N>. Ele não quer a gente vivo, digo isso porque quase fui engolido por ele...",name)
		else
			showMessage("<V>[Daniel Winngs] <N>Saia daqui agora, seu bicho fedorento!",name)
		end
	elseif npc == "King Pirate" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[King Pirate] <N>Todos a bordo, marujos!<br>Ah, esqueci. Não tenho mais marujos. Perdi todos naquele grande cataclisma.<br>Mas gostei do seu visual. Me lembra bastante os dos meus antigos marujos...<br><br>Infelizmente sei que tenho quase certeza que não saio vivo daqui. O tal <VP>shaman<N> está no fundo do mar pronto para me engolir. E se fosse você, sairia logo daqui. Só estou aqui porque não há muito o que eu fazer...",name)
		else
			showMessage("<V>[King Pirate] <N>Pelas barbas do pirata! O monstro está aqui!<br><br><VP>Evacuar navio agora! Ah!",name)
		end
	elseif npc == "Aaron Grand" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Aaron Grand] <N>Não sei se considero isso uma saudação. Meu mental está destruído depois daquilo tudo que presenciei.<br><br>E como se não bastasse, o pior ainda está por vir. Um grande <VP>shaman<N> submarino está vindo nos devorar. Se você fosse, sairia logo daqui...<br><br>Mas já que não quer, fique um pouco aqui. Vamos conversar.",name)
		else
			showMessage("<V>[Aaron Grand] <N>Qual será sua intenção? Tirar minha vida com suas próprias mãos? Nunca!",name)
		end
	end
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			mode="end"
			shaman=""
			tfm.exec.setGameTime(10)
			for n,_ in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
				ui.removeTextArea(300,n)
			end
		end
	end
	if alives <= 0 then
		mode="end"
		shaman=""
		tfm.exec.setGameTime(15)
		showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
end
function eventPlayerLeft(name)
	ratos=ratos-1;
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,1,false)
	ui.setBackgroundColor("#5FA9D4")
	showWater(name)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v3.0.2</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
	newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["moved"]=0; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["imaget"]=5;
	};
	data[name] = newData;
	ratos=ratos+1;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module e mapa criados por Morganadxana#0000.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
	data[name].imageid2 = tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
	data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
	data[name].imaget=5
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>10</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,76,520,315,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 25%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação do mapa e das artes")
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,90,"Changelog da Versão 3.0.2","• Várias mudanças no mapa")
	end
	if (message:sub(0,2) == "tc") then
		if tfm.get.room.playerList[name].isShaman == false then
			for n,_ in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[n].isShaman == false then
					showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
				end
			end
		end
	end
	if name == "Morganadxana#0000" or verifyAdmin(name) == true then
		if (message:sub(0,3) == "msg") then
			showMessage("<VP>• [FunCorp - <b>"..name.."</b>] "..message:sub(5).."")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
	end
end
function eventSummoningEnd(name,id,x,y)
	if time_passed >= 60 then
		if id > 0 then
			cannons=cannons-1
			if cannons >= 1 then
				showMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
			elseif cannons == 0 then
				showMessage("<VP>O shaman não pode mais usar objetos!")
			else
				showMessage("<R>O shaman excedeu o limite de objetos utilizáveis!")
				tfm.exec.killPlayer(shaman)
			end
		end
	end
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage("<R>Você não pode mais usar objetos! Invocar um objeto fará com que você morra e a partida termine!",name)
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				powerups.x1=-1
				powerups.y1=-1
				ui.removeTextArea(100,nil)
				if powerups.t1 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t1 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t1 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t1 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t1 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t1 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-25
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t1 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t1 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t1 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				powerups.x2=-1
				powerups.y2=-1
				ui.removeTextArea(101,nil)
				if powerups.t2 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t2 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t2 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t2 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t2 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t2 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t2 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t2 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t2 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				powerups.x3=-1
				powerups.y3=-1
				ui.removeTextArea(102,nil)
				if powerups.t3 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t3 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t3 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t3 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t3 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t3 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t3 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t3 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t3 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				powerups.x4=-1
				powerups.y4=-1
				ui.removeTextArea(103,nil)
				if powerups.t4 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t4 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t4 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t4 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t4 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t4 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t4 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t4 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t4 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if data[name].moved == 0 then
			data[name].moved=1
		end
	end
end
function reset()
	if ratos >= 4 then
		mode="hide"
		shaman=""
		alives=0
		for n,p in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[n].isShaman then
				tfm.exec.setPlayerScore(n,0,false)
			end
			tfm.exec.respawnPlayer(n)
			tfm.exec.setShaman(n,false)
			for i=32,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			tfm.exec.giveMeep(n,false)
			alives=alives+1
			data[n].o=99; data[n].moved=0; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		defineShaman()
		ui.setBackgroundColor("#5FA9D4")
		z=-1
		cannons=6
		ui.removeTextArea(22,nil)
		mode="hide"
		tfm.exec.setGameTime(60)
	else
		mode="wait"
		showMessage("<R>São necessários pelo menos 4 ratos para jogar este module.")
		tfm.exec.setGameTime(20)
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,20,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function genPowerup(pos,type,x,y)
	if pos == 1 then
		ui.addTextArea(100,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x1=x
		powerups.y1=y
		powerups.t1=type
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x2=x
		powerups.y2=y
		powerups.t2=type
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x3=x
		powerups.y3=y
		powerups.t3=type
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x4=x
		powerups.y4=y
		powerups.t4=type
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=12
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=14
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/1000)
	time_remain=math.ceil(r/1000)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v3.0.2</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
	local m=math.floor(r/60000)
	local s=math.floor((((m*60000)-r) * -1) / 1000)
	ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	if s < 10 then
		ui.addTextArea(-1,"<font size='45'><font face='Trebuchet MS'><font color='#222222'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	end
	if mode == "wait" then
		if time_remain < 1 then
			reset()
		end
	end
	if mode == "hide" then
		if time_remain <= 30 and time_remain >= 29 then
			for n,p in next,tfm.get.room.playerList do
				if data[n].moved == 0 then
					tfm.exec.killPlayer(n)
				end
			end
		end
	end
	if mode == "game" then
		if loop >= 16 then
			if time_passed >= 60 then
				for i=1,4 do
					genPowerup(i,math.random(1,11),math.random(500,4700),math.random(450,1500))
				end
				loop=0
			end
		end
	end
	if mode == "game" or mode == "hide" then
		ui.addTextArea(31,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,135,22,70,54,0,0,1.0,true)
		ui.addTextArea(30,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,132,19,70,54,0,0,1.0,true)
		if timer > 0 then
			timer=timer-0.5
			tfm.exec.setWorldGravity(0,22)
		elseif timer == 0 then
			tfm.exec.setWorldGravity(0,10.5)
		end
	else
		for i=-6,104 do
			ui.removeTextArea(i,nil)
		end
	end
	for n,q in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[n].y <= 495 then
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: 0m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		else
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: "..math.floor(math.pow(tfm.get.room.playerList[n].y-495,1.735)/2500).."m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		end
		if data[n] then
			data[n].x=tfm.get.room.playerList[n].x
			data[n].yp=tfm.get.room.playerList[n].y
			if mode == "game" then
				if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
					if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
						if not tfm.get.room.playerList[n].isShaman then
							tfm.exec.killPlayer(n)
						end
					end
				end
			end
			if data[n].t > 0 then
				data[n].t=data[n].t-0.5
				if data[n].t <= 0 then
					tfm.exec.removeObject(data[n].i)
					tfm.exec.freezePlayer(n,false)
					tfm.exec.removeCheese(n)
					tfm.exec.changePlayerSize(n,1)
				end
			end
			if not tfm.get.room.playerList[n].isDead then
				if mode == "game" or mode == "hide" then
					if tfm.get.room.playerList[n].y < 500 then
						if data[n].o < 99 then
							data[n].o=data[n].o+1
						end
						data[n].y=0
					else
						if tfm.get.room.playerList[n].y <= 1200 then
							data[n].o=data[n].o-0.3
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 1200 and tfm.get.room.playerList[n].y <= 3500 then
							data[n].o=data[n].o-0.4
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 3500 then
							data[n].o=data[n].o-0.8
							data[n].c=0
						end
					end
				end
				if data[n].o <= 0 then
					tfm.exec.killPlayer(n)
					showMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
					tfm.exec.addShamanObject(54, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
				end
			end
		end
		if mode == "game" or mode == "hide" then
			if data[n].o > 30 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
				data[n].d=0
				tfm.exec.setNameColor(n,0xc2c2da)
			elseif data[n].o > 0 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0x801500,0xa01000,1.0,true)
				data[n].d=data[n].d+1
				tfm.exec.setNameColor(n,0xff4500)
				if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 598 then
					showMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
				end
				if data[n].d > 7 then
					data[n].d=0
				end
			end
		else
			ui.removeTextArea(10,nil)
			ui.removeTextArea(300,nil)
		end
	end
	if r <= 2000 and mode == "hide" then
		mode="game"
		tfm.exec.setGameTime(240+math.ceil(alives*2.4))
		ui.removeTextArea(22,nil)
		showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>!<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
		for n,p in next,tfm.get.room.playerList do
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
		end
		tfm.exec.movePlayer(shaman,2600,196,false,0,0,false)
	end
	if r <= 1000 and mode == "game" then
		tfm.exec.setGameTime(15)
		mode="end"
		local lives=0
		for n,p in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
				lives=lives+1
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
			end
		end
		tfm.exec.killPlayer(shaman)
		shaman=""
		showMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
		ui.removeTextArea(300,n)
	end
	if r <= 200 and mode == "end" then
		reset()
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a>",name,355,85,90,60,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "cred" then
		eventChatCommand(name,"creditos")
	end
	if callback == "change" then
		eventChatCommand(name,"changelog")
	end
end
reset()
