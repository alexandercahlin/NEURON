function [ret]=str_eval (str, val)

global vars handles

if (nargin==1)
  switch (sum(str))
    case 1700
      ret=vars.HH_user1.gmax;
    case 2632
      ret=handles.HH_user1.gate2.beta.c;
    case 2226
      ret=handles.HH_K.gate1.beta.s;
    case 1920
      ret=vars.HH_K.gate2.beta.c;
    case 1888
      ret=handles.HH_user1.ion;
    case 2424
      ret=handles.HH_Na.gate2.beta.fn;
    case 2535
      ret=handles.HH_K.gate2.exponent;
    case 2752
      ret=handles.HH_user1.gate1.beta.th;
    case 2647
      ret=handles.HH_user1.gate1.beta.s;
    case 2279
      ret=handles.button_HH_user1;
    case 2331
      ret=handles.HH_K.gate1.beta.th;
    case 2311
      ret=handles.HH_Na.gate2.beta.c;
    case 2634
      ret=handles.HH_Na.gate1.exponent;
    case 2538
      ret=handles.HH_Na.gate2.alpha.th;
    case 1738
      ret=vars.HH_user1.gate2;
    case 2025
      ret=vars.HH_K.gate1.alpha.c;
    case 634
      ret=vars.EK;
    case 1858
      ret=handles.button_HH_K;
    case 2147
      ret=vars.HH_K.gate2.alpha.th;
    case 2453
      ret=vars.HH_user1.gate1.beta.fn;
    case 1597
      ret=vars.HH_user1.ion;
    case 2140
      ret=vars.HH_Na.gate1.beta.th;
    case 2738
      ret=handles.HH_user1.gate2.alpha.c;
    case 2955
      ret=handles.HH_user1.gate1.exponent;
    case 2316
      ret=handles.HH_K.gate1.alpha.c;
    case 2133
      ret=vars.HH_Na.gate2.beta.fn;
    case 2035
      ret=vars.HH_Na.gate1.beta.s;
    case 2437
      ret=handles.HH_K.gate1.alpha.th;
    case 2744
      ret=handles.HH_user1.gate1.beta.fn;
    case 1657
      ret=vars.switch_HH_Na;
    case 2559
      ret=vars.HH_user1.gate1.alpha.fn;
    case 904
      ret=vars.HH_Na;
    case 2429
      ret=handles.HH_K.gate1.alpha.fn;
    case 1093
      ret=vars.gmult2;
    case 2851
      ret=handles.HH_user1.gate2.alpha.fn;
    case 2754
      ret=handles.HH_user1.gate2.alpha.s;
    case 666
      ret=vars.Cm;
    case 1737
      ret=vars.HH_user1.gate1;
    case 1958
      ret=handles.button_HH_Na;
    case 1567
      ret=handles.HH_Na.ion;
    case 2020
      ret=vars.HH_Na.gate2.beta.c;
    case 2125
      ret=vars.HH_Na.gate1.alpha.c;
    case 2158
      if (strcmp(str,'handles.button_passNa'))
        ret=handles.button_passNa;
      else
        ret=handles.button_passCl;
      end
    case 2462
      if (strcmp(str,'vars.HH_user1.gate1.alpha.s'))
        ret=vars.HH_user1.gate1.alpha.s;
      else
        ret=vars.HH_user1.gate2.beta.th;
      end
    case 1317
      ret=vars.HH_K.gate2;
    case 2446
      ret=vars.HH_user1.gate1.alpha.c;
    case 2019
      ret=vars.HH_Na.gate1.beta.c;
    case 2238
      ret=vars.HH_Na.gate1.alpha.fn;
    case 1670
      ret=handles.HH_Na.gmax;
    case 2356
      ret=vars.HH_user1.gate1.beta.s;
    case 1919
      ret=vars.HH_K.gate1.beta.c;
    case 2324
      ret=handles.HH_K.gate2.beta.fn;
    case 2233
      ret=vars.HH_user1.gate2.expt;
    case 2430
      ret=handles.HH_K.gate2.alpha.fn;
    case 2142
      ret=vars.HH_Na.gate2.alpha.s;
    case 2210
      ret=handles.HH_K.gate1.beta.c;
    case 2333
      ret=handles.HH_K.gate2.alpha.s;
    case 776
      if (strcmp(str,'vars.Clo'))
        ret=vars.Clo;
      else
        ret=vars.Nao;
      end
    case 1416
      ret=vars.HH_Na.gate1;
    case 1936
      ret=vars.HH_K.gate2.beta.s;
    case 2567
      ret=vars.HH_user1.gate1.alpha.th;
    case 1570
      ret=handles.HH_K.gmax;
    case 1493
      ret=handles.g_passK;
    case 2326
      ret=handles.HH_Na.gate1.beta.s;
    case 2032
      ret=vars.HH_K.gate1.beta.fn;
    case 2041
      if (strcmp(str,'vars.HH_K.gate1.alpha.s'))
        ret=vars.HH_K.gate1.alpha.s;
      else
        ret=vars.HH_K.gate2.beta.th;
      end
    case 1467
      ret=handles.HH_K.ion;
    case 1264
      ret=handles.drug1;
    case 1722
      ret=handles.HH_K_gates;
    case 2058
      ret=handles.button_passK;
    case 961
      ret=vars.ginh1;
    case 681
      ret=vars.Rm;
    case 1417
      ret=vars.HH_Na.gate2;
    case 2631
      ret=handles.HH_user1.gate1.beta.c;
    case 2537
      ret=handles.HH_Na.gate1.alpha.th;
    case 1812
      ret=vars.HH_K.gate2.expt;
    case 574
      ret=vars.T;
    case 2340
      ret=vars.HH_user1.gate1.beta.c;
    case 2042
      ret=vars.HH_K.gate2.alpha.s;
    case 2033
      ret=vars.HH_K.gate2.beta.fn;
    case 2143
      ret=handles.HH_user1_gates;
    case 2310
      ret=handles.HH_Na.gate1.beta.c;
    case 1202
      ret=vars.g_passK;
    case 2438
      ret=handles.HH_K.gate2.alpha.th;
    case 2132
      ret=vars.HH_Na.gate1.beta.fn;
    case 2317
      ret=handles.HH_K.gate2.alpha.c;
    case 2859
      ret=handles.HH_user1.gate2.alpha.th;
    case 1757
      ret=vars.switch_passK;
    case 1912
      ret=vars.HH_Na.gate2.expt;
    case 2227
      ret=handles.HH_K.gate2.beta.s;
    case 690
      ret=vars.Vr;
    case 676
      ret=vars.Ko;
    case 2416
      ret=handles.HH_Na.gate1.alpha.c;
    case 1275
      ret=handles.stim1;
    case 2211
      ret=handles.HH_K.gate2.beta.c;
    case 2433
      ret=handles.HH_Na.gate2.alpha.s;
    case 2529
      ret=handles.HH_Na.gate1.alpha.fn;
    case 2454
      ret=vars.HH_user1.gate2.beta.fn;
    case 2036
      ret=vars.HH_Na.gate2.beta.s;
    case 2357
      ret=vars.HH_user1.gate2.beta.s;
    case 1857
      if (strcmp(str,'vars.switch_passNa'))
        ret=vars.switch_passNa;
      else
        ret=vars.switch_passCl;
      end
    case 1618
      ret=handles.v3button;
    case 670
      ret=vars.Ki;
    case 2423
      ret=handles.HH_Na.gate1.beta.fn;
    case 1225
      ret=vars.HH_user1;
    case 2246
      ret=vars.HH_Na.gate1.alpha.th;
    case 2431
      ret=handles.HH_Na.gate1.beta.th;
    case 2534
      ret=handles.HH_K.gate1.exponent;
    case 2417
      ret=handles.HH_Na.gate2.alpha.c;
    case 1616
      ret=handles.v1button;
    case 1978
      ret=vars.switch_HH_user1;
    case 2850
      ret=handles.HH_user1.gate1.alpha.fn;
    case 2753
      if (strcmp(str,'handles.HH_user1.gate1.alpha.s'))
        ret=handles.HH_user1.gate1.alpha.s;
      else
        ret=handles.HH_user1.gate2.beta.th;
      end
    case 2560
      ret=vars.HH_user1.gate2.alpha.fn;
    case 2461
      ret=vars.HH_user1.gate1.beta.th;
    case 2141
      if (strcmp(str,'vars.HH_Na.gate1.alpha.s'))
        ret=vars.HH_Na.gate1.alpha.s;
      else
        ret=vars.HH_Na.gate2.beta.th;
      end
    case 2139
      ret=vars.HH_K.gate2.alpha.fn;
    case 1092
      ret=vars.gmult1;
    case 2026
      ret=vars.HH_K.gate2.alpha.c;
    case 770
      if (strcmp(str,'vars.Cli'))
        ret=vars.Cli;
      else
        ret=vars.Nai;
      end
    case 2138
      ret=vars.HH_K.gate1.alpha.fn;
    case 734
      if (strcmp(str,'vars.ENa'))
        ret=vars.ENa;
      else
        ret=vars.ECl;
      end
    case 2447
      ret=vars.HH_user1.gate2.alpha.c;
    case 1276
      if (strcmp(str,'handles.stim2'))
        ret=handles.stim2;
      else
        ret=vars.HH_Na.ion;
      end
    case 1176
      ret=vars.HH_K.ion;
    case 1279
      ret=vars.HH_K.gmax;
    case 2146
      ret=vars.HH_K.gate1.alpha.th;
    case 2737
      ret=handles.HH_user1.gate1.alpha.c;
    case 804
      ret=vars.HH_K;
    case 2568
      ret=vars.HH_user1.gate2.alpha.th;
    case 1935
      ret=vars.HH_K.gate1.beta.s;
    case 2232
      ret=vars.HH_user1.gate1.expt;
    case 2530
      ret=handles.HH_Na.gate2.alpha.fn;
    case 1265
      ret=handles.drug2;
    case 2332
      if (strcmp(str,'handles.HH_K.gate1.alpha.s'))
        ret=handles.HH_K.gate1.alpha.s;
      else
        ret=handles.HH_K.gate2.beta.th;
      end
    case 2432
      if (strcmp(str,'handles.HH_Na.gate1.alpha.s'))
        ret=handles.HH_Na.gate1.alpha.s;
      else
        ret=handles.HH_Na.gate2.beta.th;
      end
    case 1617
      ret=handles.v2button;
    case 2956
      ret=handles.HH_user1.gate2.exponent;
    case 962
      ret=vars.ginh2;
    case 2648
      ret=handles.HH_user1.gate2.beta.s;
    case 1302
      if (strcmp(str,'vars.g_passNa'))
        ret=vars.g_passNa;
      else
        ret=vars.g_passCl;
      end
    case 2247
      ret=vars.HH_Na.gate2.alpha.th;
    case 2635
      ret=handles.HH_Na.gate2.exponent;
    case 2239
      ret=vars.HH_Na.gate2.alpha.fn;
    case 2126
      ret=vars.HH_Na.gate2.alpha.c;
    case 2858
      ret=handles.HH_user1.gate1.alpha.th;
    case 1991
      ret=handles.HH_user1.gmax;
    case 2323
      ret=handles.HH_K.gate1.beta.fn;
    case 1316
      ret=vars.HH_K.gate1;
    case 2463
      ret=vars.HH_user1.gate2.alpha.s;
    case 1811
      ret=vars.HH_K.gate1.expt;
    case 2327
      ret=handles.HH_Na.gate2.beta.s;
    case 1557
      ret=vars.switch_HH_K;
    case 1822
      ret=handles.HH_Na_gates;
    case 2745
      ret=handles.HH_user1.gate2.beta.fn;
    case 1379
      ret=vars.HH_Na.gmax;
    case 1593
      if (strcmp(str,'handles.g_passNa'))
        ret=handles.g_passNa;
      else
        ret=handles.g_passCl;
      end
    case 1642
      ret=handles.vc_curve;
    case 1911
      ret=vars.HH_Na.gate1.expt;
    case 2341
      ret=vars.HH_user1.gate2.beta.c;
    case 2040
      ret=vars.HH_K.gate1.beta.th;
    otherwise
      disp 'unknown variable name to str_eval:get';
  end
elseif (nargin==2)
  ret='';
  switch (sum(str))
    case 1700
      vars.HH_user1.gmax=val;
    case 2632
      handles.HH_user1.gate2.beta.c=val;
    case 2226
      handles.HH_K.gate1.beta.s=val;
    case 1920
      vars.HH_K.gate2.beta.c=val;
    case 1888
      handles.HH_user1.ion=val;
    case 2424
      handles.HH_Na.gate2.beta.fn=val;
    case 2535
      handles.HH_K.gate2.exponent=val;
    case 2752
      handles.HH_user1.gate1.beta.th=val;
    case 2647
      handles.HH_user1.gate1.beta.s=val;
    case 2279
      handles.button_HH_user1=val;
    case 2331
      handles.HH_K.gate1.beta.th=val;
    case 2311
      handles.HH_Na.gate2.beta.c=val;
    case 2634
      handles.HH_Na.gate1.exponent=val;
    case 2538
      handles.HH_Na.gate2.alpha.th=val;
    case 1738
      vars.HH_user1.gate2=val;
    case 2025
      vars.HH_K.gate1.alpha.c=val;
    case 634
      vars.EK=val;
    case 1858
      handles.button_HH_K=val;
    case 2147
      vars.HH_K.gate2.alpha.th=val;
    case 2453
      vars.HH_user1.gate1.beta.fn=val;
    case 1597
      vars.HH_user1.ion=val;
    case 2140
      vars.HH_Na.gate1.beta.th=val;
    case 2738
      handles.HH_user1.gate2.alpha.c=val;
    case 2955
      handles.HH_user1.gate1.exponent=val;
    case 2316
      handles.HH_K.gate1.alpha.c=val;
    case 2133
      vars.HH_Na.gate2.beta.fn=val;
    case 2035
      vars.HH_Na.gate1.beta.s=val;
    case 2437
      handles.HH_K.gate1.alpha.th=val;
    case 2744
      handles.HH_user1.gate1.beta.fn=val;
    case 1657
      vars.switch_HH_Na=val;
    case 2559
      vars.HH_user1.gate1.alpha.fn=val;
    case 904
      vars.HH_Na=val;
    case 2429
      handles.HH_K.gate1.alpha.fn=val;
    case 1093
      vars.gmult2=val;
    case 2851
      handles.HH_user1.gate2.alpha.fn=val;
    case 2754
      handles.HH_user1.gate2.alpha.s=val;
    case 666
      vars.Cm=val;
    case 1737
      vars.HH_user1.gate1=val;
    case 1958
      handles.button_HH_Na=val;
    case 1567
      handles.HH_Na.ion=val;
    case 2020
      vars.HH_Na.gate2.beta.c=val;
    case 2125
      vars.HH_Na.gate1.alpha.c=val;
    case 2158
      if (strcmp(str,'handles.button_passNa'))
        handles.button_passNa=val;
      else
        handles.button_passCl=val;
      end
    case 2462
      if (strcmp(str,'vars.HH_user1.gate1.alpha.s'))
        vars.HH_user1.gate1.alpha.s=val;
      else
        vars.HH_user1.gate2.beta.th=val;
      end
    case 1317
      vars.HH_K.gate2=val;
    case 2446
      vars.HH_user1.gate1.alpha.c=val;
    case 2019
      vars.HH_Na.gate1.beta.c=val;
    case 2238
      vars.HH_Na.gate1.alpha.fn=val;
    case 1670
      handles.HH_Na.gmax=val;
    case 2356
      vars.HH_user1.gate1.beta.s=val;
    case 1919
      vars.HH_K.gate1.beta.c=val;
    case 2324
      handles.HH_K.gate2.beta.fn=val;
    case 2233
      vars.HH_user1.gate2.expt=val;
    case 2430
      handles.HH_K.gate2.alpha.fn=val;
    case 2142
      vars.HH_Na.gate2.alpha.s=val;
    case 2333
      handles.HH_K.gate2.alpha.s=val;
    case 2210
      handles.HH_K.gate1.beta.c=val;
    case 776
      if (strcmp(str,'vars.Clo'))
        vars.Clo=val;
      else
        vars.Nao=val;
      end
    case 1416
      vars.HH_Na.gate1=val;
    case 1936
      vars.HH_K.gate2.beta.s=val;
    case 2567
      vars.HH_user1.gate1.alpha.th=val;
    case 1570
      handles.HH_K.gmax=val;
    case 1493
      handles.g_passK=val;
    case 2326
      handles.HH_Na.gate1.beta.s=val;
    case 2032
      vars.HH_K.gate1.beta.fn=val;
    case 2041
      if (strcmp(str,'vars.HH_K.gate1.alpha.s'))
        vars.HH_K.gate1.alpha.s=val;
      else
        vars.HH_K.gate2.beta.th=val;
      end
    case 1467
      handles.HH_K.ion=val;
    case 1722
      handles.HH_K_gates=val;
    case 1264
      handles.drug1=val;
    case 2058
      handles.button_passK=val;
    case 961
      vars.ginh1=val;
    case 681
      vars.Rm=val;
    case 1417
      vars.HH_Na.gate2=val;
    case 2631
      handles.HH_user1.gate1.beta.c=val;
    case 2537
      handles.HH_Na.gate1.alpha.th=val;
    case 1812
      vars.HH_K.gate2.expt=val;
    case 574
      vars.T=val;
    case 2340
      vars.HH_user1.gate1.beta.c=val;
    case 2033
      vars.HH_K.gate2.beta.fn=val;
    case 2042
      vars.HH_K.gate2.alpha.s=val;
    case 2143
      handles.HH_user1_gates=val;
    case 2310
      handles.HH_Na.gate1.beta.c=val;
    case 1202
      vars.g_passK=val;
    case 2132
      vars.HH_Na.gate1.beta.fn=val;
    case 2438
      handles.HH_K.gate2.alpha.th=val;
    case 2317
      handles.HH_K.gate2.alpha.c=val;
    case 2859
      handles.HH_user1.gate2.alpha.th=val;
    case 1757
      vars.switch_passK=val;
    case 1912
      vars.HH_Na.gate2.expt=val;
    case 690
      vars.Vr=val;
    case 2227
      handles.HH_K.gate2.beta.s=val;
    case 676
      vars.Ko=val;
    case 2416
      handles.HH_Na.gate1.alpha.c=val;
    case 1275
      handles.stim1=val;
    case 2211
      handles.HH_K.gate2.beta.c=val;
    case 2433
      handles.HH_Na.gate2.alpha.s=val;
    case 2529
      handles.HH_Na.gate1.alpha.fn=val;
    case 2454
      vars.HH_user1.gate2.beta.fn=val;
    case 2036
      vars.HH_Na.gate2.beta.s=val;
    case 2357
      vars.HH_user1.gate2.beta.s=val;
    case 1857
      if (strcmp(str,'vars.switch_passNa'))
        vars.switch_passNa=val;
      else
        vars.switch_passCl=val;
      end
    case 670
      vars.Ki=val;
    case 1618
      handles.v3button=val;
    case 2423
      handles.HH_Na.gate1.beta.fn=val;
    case 1225
      vars.HH_user1=val;
    case 2246
      vars.HH_Na.gate1.alpha.th=val;
    case 2431
      handles.HH_Na.gate1.beta.th=val;
    case 2534
      handles.HH_K.gate1.exponent=val;
    case 1616
      handles.v1button=val;
    case 2417
      handles.HH_Na.gate2.alpha.c=val;
    case 1978
      vars.switch_HH_user1=val;
    case 2850
      handles.HH_user1.gate1.alpha.fn=val;
    case 2753
      if (strcmp(str,'handles.HH_user1.gate1.alpha.s'))
        handles.HH_user1.gate1.alpha.s=val;
      else
        handles.HH_user1.gate2.beta.th=val;
      end
    case 2560
      vars.HH_user1.gate2.alpha.fn=val;
    case 2461
      vars.HH_user1.gate1.beta.th=val;
    case 2141
      if (strcmp(str,'vars.HH_Na.gate1.alpha.s'))
        vars.HH_Na.gate1.alpha.s=val;
      else
        vars.HH_Na.gate2.beta.th=val;
      end
    case 2139
      vars.HH_K.gate2.alpha.fn=val;
    case 1092
      vars.gmult1=val;
    case 2026
      vars.HH_K.gate2.alpha.c=val;
    case 770
      if (strcmp(str,'vars.Cli'))
        vars.Cli=val;
      else
        vars.Nai=val;
      end
    case 2138
      vars.HH_K.gate1.alpha.fn=val;
    case 734
      if (strcmp(str,'vars.ENa'))
        vars.ENa=val;
      else
        vars.ECl=val;
      end
    case 2447
      vars.HH_user1.gate2.alpha.c=val;
    case 1276
      if (strcmp(str,'handles.stim2'))
        handles.stim2=val;
      else
        vars.HH_Na.ion=val;
      end
    case 1176
      vars.HH_K.ion=val;
    case 1279
      vars.HH_K.gmax=val;
    case 2146
      vars.HH_K.gate1.alpha.th=val;
    case 2737
      handles.HH_user1.gate1.alpha.c=val;
    case 804
      vars.HH_K=val;
    case 2568
      vars.HH_user1.gate2.alpha.th=val;
    case 1935
      vars.HH_K.gate1.beta.s=val;
    case 2232
      vars.HH_user1.gate1.expt=val;
    case 2530
      handles.HH_Na.gate2.alpha.fn=val;
    case 1265
      handles.drug2=val;
    case 2332
      if (strcmp(str,'handles.HH_K.gate1.alpha.s'))
        handles.HH_K.gate1.alpha.s=val;
      else
        handles.HH_K.gate2.beta.th=val;
      end
    case 2432
      if (strcmp(str,'handles.HH_Na.gate1.alpha.s'))
        handles.HH_Na.gate1.alpha.s=val;
      else
        handles.HH_Na.gate2.beta.th=val;
      end
    case 1617
      handles.v2button=val;
    case 2956
      handles.HH_user1.gate2.exponent=val;
    case 962
      vars.ginh2=val;
    case 2648
      handles.HH_user1.gate2.beta.s=val;
    case 2247
      vars.HH_Na.gate2.alpha.th=val;
    case 1302
      if (strcmp(str,'vars.g_passNa'))
        vars.g_passNa=val;
      else
        vars.g_passCl=val;
      end
    case 2239
      vars.HH_Na.gate2.alpha.fn=val;
    case 2635
      handles.HH_Na.gate2.exponent=val;
    case 2126
      vars.HH_Na.gate2.alpha.c=val;
    case 2858
      handles.HH_user1.gate1.alpha.th=val;
    case 1991
      handles.HH_user1.gmax=val;
    case 2323
      handles.HH_K.gate1.beta.fn=val;
    case 1316
      vars.HH_K.gate1=val;
    case 2463
      vars.HH_user1.gate2.alpha.s=val;
    case 1811
      vars.HH_K.gate1.expt=val;
    case 2327
      handles.HH_Na.gate2.beta.s=val;
    case 1557
      vars.switch_HH_K=val;
    case 1822
      handles.HH_Na_gates=val;
    case 2745
      handles.HH_user1.gate2.beta.fn=val;
    case 1379
      vars.HH_Na.gmax=val;
    case 1593
      if (strcmp(str,'handles.g_passNa'))
        handles.g_passNa=val;
      else
        handles.g_passCl=val;
      end
    case 1642
      handles.vc_curve=val;
    case 1911
      vars.HH_Na.gate1.expt=val;
    case 2341
      vars.HH_user1.gate2.beta.c=val;
    case 2040
      vars.HH_K.gate1.beta.th=val;
    otherwise
      disp 'unknown variable name to str_eval:set';
  end
else
  disp 'str_eval called with incorrect no of parameters';
end
