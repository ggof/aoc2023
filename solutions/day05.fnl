(local f (require :libs.fun))
(local { : time } (require :libs.time))

;; EXTRA LAZY parsing. I couldn't see myself parsing this day's input. Might revisit?
(fn parse [lines]
  (icollect [d s l (string.gmatch lines "(%d+) (%d+) (%d+)\n")] [(tonumber d) (tonumber s) (tonumber l)]))

(fn parse-seed [line] (icollect [d (string.gmatch line "(%d+)")] (tonumber d)))

(local seeds (parse-seed "768975 36881621 56868281 55386784 1828225758 1084205557 2956956868 127170752 1117192172 332560644 357791695 129980646 819363529 9145257 993170544 70644734 3213715789 312116873 3107544690 59359615"))
(local seed->soil (parse "2797638787 1764015146 26675178
3378130613 0 34101494
388521182 772535426 141493697
1148410839 174832460 323494173
4259440029 4076987921 35527267
1664835130 2610603190 214355271
530014879 1680432282 83582864
1471905012 758583825 13951601
3909335908 4187323696 107643600
3834527400 4173068203 14255493
2824313965 136499996 38332464
191321127 498326633 7266716
1562436628 34101494 102398502
3224943851 3320680296 153186762
4058150677 3747050674 42920787
2360258758 2578478063 32125127
1485856613 682003810 76580015
613597743 1875739628 457683244
4016979508 3789971461 35854425
3412232107 562825709 61634951
4101071464 3825825886 158368565
3848782893 4112515188 60553015
3119382417 1629353314 51078968
1879190401 1555705358 58037106
2169686033 2387905338 190572725
2900098047 914029123 217063885
1071280987 2824958461 77129852
3770924949 3984194451 63602451
2449927035 2902088313 205430088
2740406427 505593349 57232360
198587843 1365772019 189933339
0 3107518401 191321127
3741733930 4047796902 29191019
2655357123 1790690324 85049304
1937227507 1133313493 232458526
2392383885 624460660 57543150
2862646429 3298839528 8221502
3170461385 2333422872 54482466
3117161932 1131093008 2220485
2870867931 3307061030 13619266
2884487197 1613742464 15610850
4052833933 3741733930 5316744
"))
(local soil->fert (parse "4028970075 3670916442 62323047
2369466456 2039626615 114411480
1849958430 857955699 318236064
3393877313 4090328901 50115157
2483877936 2154038095 163115765
1589335864 2448679033 50786994
378911477 2812908636 641955
1562596120 1971627164 26739744
2168194494 224261755 114905540
2837233268 2508892349 45204280
3094415439 2813550591 72281454
3166696893 1619734477 89254096
0 2317153860 40391789
1131679423 1771284034 40991112
1765319835 1708988573 9045883
1365410346 1420078500 197185774
2305946785 794436028 63519671
2882437548 2691241517 119296423
3001733971 3046337498 45651876
3643083526 3393877313 47307752
379553432 1812275146 28890919
1172670535 1206862634 190369115
2807083959 1741134725 30149309
2694347611 467149827 112736348
2646993701 579886175 47353910
4091293122 3733239489 203674174
1763025041 1718034456 2294794
40391789 1998366908 41259707
808535136 1176191763 22037784
799902049 1198229547 8633087
632706106 627240085 167195943
3598515708 3936913663 44567818
408444351 0 224261755
3799238698 3441185065 229731377
3443992470 4140444058 154523238
376441274 1617264274 2470203
1795171193 339167295 54787237
830572920 3091989374 301106503
81651496 1841166065 130461099
212112595 393954532 73195295
3255950989 2554096629 137144888
3690391278 3981481481 108847420
1363039650 2810537940 2370696
3047385847 2499466027 9426322
285307890 2357545649 91133384
2283100034 1397231749 22846751
1640122858 2923435315 122902183
3056812169 2885832045 37603270
1774365718 1720329250 20805475
"))

(local fert->water (parse "4242763083 2459563591 52204213
2506579022 1704611330 53532973
268946243 855055502 34908994
1704611330 3860653042 434314254
2640952334 3547869528 81626644
1436013703 728008388 21784904
0 680695205 47313183
140858905 749793292 69300705
686187385 489152830 141379201
3612022528 2522034035 498682726
827566586 959642930 428042082
260322784 12467526 8623459
2435545592 3789619612 71033430
47313183 1387685012 93545722
303855237 21090985 382332148
2425279361 2511767804 10266231
2947118206 2257396248 202167343
1457798607 403423133 23432127
2138925584 1890202132 286353777
1366335269 889964496 69678434
1255608668 819093997 35961505
210159610 630532031 50163174
1291570173 0 12467526
2560111995 2176555909 80840339
3419426199 3416054902 131814626
3149285549 3159639578 110017210
2868977092 3081498464 78141114
4110705254 1758144303 132057829
3551240825 3020716761 60781703
2722578978 3269656788 146398114
3259302759 3629496172 160123440
1304037699 426855260 62297570
"))
(local water->light (parse "1712728062 165708071 30118229
994660402 322543075 139832356
2666749758 3184731531 182834316
3535613929 2585377632 130318231
1589771501 643255284 6486180
3665932160 773195884 193821728
2655704544 2479239619 11045214
2970686930 195826300 21859186
1596257681 2345480344 116470381
2648218599 765709939 7485945
267433833 0 38915982
701913980 2301280038 4624639
2130796669 1543842466 272797567
57533669 1275520329 209900164
1756207753 3442698892 374588916
3859753888 2305904677 39575667
1134492758 2809419770 26839161
309521113 217685486 8494012
433983600 1485420493 20638459
1742846291 522451528 13361462
1161331919 2715695863 90552609
1251884528 967017612 308502717
3052622213 2490284833 95092799
454622059 2461950725 17288894
2472852656 535812990 24122952
318015125 649741464 115968475
2496975608 3367565847 75133045
553952700 3070057156 114674375
668627075 1959120081 31105212
2992546116 462375431 60076097
3147715012 299507329 20253631
2574890768 226179498 73327831
0 108174402 57533669
306349815 2806248472 3171298
2887367588 559935942 83319342
760862177 2836258931 233798225
1560387245 1990225293 29384256
3167968643 1816640033 140298355
2572108653 319760960 2782115
4260952033 4113795026 34015263
2849584074 1506058952 37783514
2403594236 38915982 69258420
706538619 2246956480 54323558
4113795026 4147810289 147157007
3308266998 2019609549 227346931
471910953 3817287808 82041747
699732287 1956938388 2181693
"))
(local light->temp (parse "1642970452 2619648642 320925092
871949201 797630676 97655745
655931949 2008010966 216017252
3785141775 4061613243 12865567
4215077801 4197959319 79889495
2563411697 1252642831 573187176
1254390764 4601171 388579688
0 1980893220 27117746
3136598873 895286421 241010052
3798007342 3785141775 276471468
467378984 1136296473 116346358
62929167 393180859 404449817
583725342 2257865135 72206607
58327996 0 4601171
1220553847 2224028218 33836917
1065490634 1825830007 155063213
2157586756 2971783984 405824941
1963895544 2330071742 193691212
4197959319 4277848814 17118482
969604946 2523762954 95885688
27117746 2940573734 31210250
"))
(local temp->humid (parse "3204530368 2689103462 122673126
1097831066 741139709 15277662
2587190266 2506197062 28166734
2972900803 2149468273 231629565
2754733708 3879909767 93747273
1118529763 1007376005 639297716
591529103 1795771252 224967444
1113108728 305315251 5421035
2266839735 3973657040 65644628
3425464071 2534363796 64415445
2332484363 2811776588 254705903
3353763689 3525362348 71700382
411622859 756417371 179906244
2629634484 2381097838 125099224
0 1646673721 149097531
1912202739 439529310 384078
1828879869 221992381 83322870
1038488928 310736286 59342138
2149468273 3597062730 22900616
3731081879 3337447905 173636959
2172368889 2598779241 90324221
218548417 439913388 193074442
3489879516 4053764933 212174931
3327203494 3090464996 12096930
149097531 370078424 69450886
2615357000 3511084864 14277484
4064227942 3102561926 230739354
3702054447 4265939864 29027432
838437176 21940629 200051752
3339300424 4039301668 14463265
2262693110 3333301280 4146625
3904718838 3619963346 159509104
2948918298 3066482491 23982505
1757827479 936323615 71052390
1912586817 632987830 108151879
2848480981 3779472450 100437317
816496547 0 21940629
"))
(local humid->location (parse "3394148556 2925849667 56813934
4223178672 3844939961 29088809
3743018622 3753904164 91035797
6295169 0 111018407
3175071902 3531111280 47991613
4252267481 2883149852 42699815
129982843 693964199 99494334
229477177 272742930 300412252
798562242 793458533 315959887
1114522129 680103472 13860727
3223063515 3050521430 171085041
1574260097 2117833331 253788822
691613952 573155182 106948290
2250567596 1223353243 43558595
2851928754 4027938301 267028995
3887810914 1266911838 1671681
3725220028 3431759743 17798594
1828048919 3449558337 77343652
2479857123 3329899124 101860619
3889482595 3526901989 4209291
3604872021 2982663601 7751828
3834054419 2371622153 53756495
1905392571 2537974827 345175025
2581717742 1324697672 270211012
1145914964 1689488198 428345133
2294126191 3221606471 108292653
3612623849 2425378648 112596179
117313576 1109418420 12669267
4163072671 2990415429 60106001
3893691886 1594908684 94579514
0 1122087687 6295169
3450962490 3874028770 153909531
2402418844 1145914964 77438279
3988271400 3579102893 174801271
3118957749 1268583519 56114153
529889429 111018407 161724523
"))

(local maps [seed->soil soil->fert fert->water water->light light->temp temp->humid humid->location])

(fn in-line? [cur d s l]
  (let [ll (- cur s)]
    (if (and (< ll l) (>= ll 0))
        (+ d ll)
        nil)))

(fn next-index [cur [[d s l] & tl]]
  (let [next (in-line? cur d s l)]
    (if (or (= 0 (length tl)) (not= nil next))
      next
      (next-index cur tl))))

(fn seed->location [s maps]
  (accumulate [acc s _ m (ipairs maps)]
    (or (next-index acc m) acc)))

(fn part-1 [seeds maps] (f.min (f.map #(seed->location $ maps) seeds)))

(time 5 #(part-1 seeds maps))
