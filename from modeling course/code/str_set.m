function str_set (str, f, val)

global vars handles

if (nargin==3)
  switch (sum(str))
    case 1700
      set(vars.HH_user1.gmax,f,val);
    case 2632
      set(handles.HH_user1.gate2.beta.c,f,val);
    case 2226
      set(handles.HH_K.gate1.beta.s,f,val);
    case 1920
      set(vars.HH_K.gate2.beta.c,f,val);
    case 1888
      set(handles.HH_user1.ion,f,val);
    case 2424
      set(handles.HH_Na.gate2.beta.fn,f,val);
    case 2535
      set(handles.HH_K.gate2.exponent,f,val);
    case 2752
      set(handles.HH_user1.gate1.beta.th,f,val);
    case 2647
      set(handles.HH_user1.gate1.beta.s,f,val);
    case 2279
      set(handles.button_HH_user1,f,val);
    case 2331
      set(handles.HH_K.gate1.beta.th,f,val);
    case 2311
      set(handles.HH_Na.gate2.beta.c,f,val);
    case 2634
      set(handles.HH_Na.gate1.exponent,f,val);
    case 2538
      set(handles.HH_Na.gate2.alpha.th,f,val);
    case 1738
      set(vars.HH_user1.gate2,f,val);
    case 2025
      set(vars.HH_K.gate1.alpha.c,f,val);
    case 634
      set(vars.EK,f,val);
    case 1858
      set(handles.button_HH_K,f,val);
    case 2147
      set(vars.HH_K.gate2.alpha.th,f,val);
    case 2453
      set(vars.HH_user1.gate1.beta.fn,f,val);
    case 1597
      set(vars.HH_user1.ion,f,val);
    case 2140
      set(vars.HH_Na.gate1.beta.th,f,val);
    case 2738
      set(handles.HH_user1.gate2.alpha.c,f,val);
    case 2955
      set(handles.HH_user1.gate1.exponent,f,val);
    case 2316
      set(handles.HH_K.gate1.alpha.c,f,val);
    case 2133
      set(vars.HH_Na.gate2.beta.fn,f,val);
    case 2035
      set(vars.HH_Na.gate1.beta.s,f,val);
    case 2437
      set(handles.HH_K.gate1.alpha.th,f,val);
    case 2744
      set(handles.HH_user1.gate1.beta.fn,f,val);
    case 1657
      set(vars.switch_HH_Na,f,val);
    case 2559
      set(vars.HH_user1.gate1.alpha.fn,f,val);
    case 904
      set(vars.HH_Na,f,val);
    case 2429
      set(handles.HH_K.gate1.alpha.fn,f,val);
    case 1093
      set(vars.gmult2,f,val);
    case 2851
      set(handles.HH_user1.gate2.alpha.fn,f,val);
    case 2754
      set(handles.HH_user1.gate2.alpha.s,f,val);
    case 666
      set(vars.Cm,f,val);
    case 1737
      set(vars.HH_user1.gate1,f,val);
    case 1958
      set(handles.button_HH_Na,f,val);
    case 1567
      set(handles.HH_Na.ion,f,val);
    case 2020
      set(vars.HH_Na.gate2.beta.c,f,val);
    case 2125
      set(vars.HH_Na.gate1.alpha.c,f,val);
    case 2158
      if (strcmp(str,'handles.button_passNa'))
        set(handles.button_passNa,f,val);
      else
        set(handles.button_passCl,f,val);
      end
    case 2462
      if (strcmp(str,'vars.HH_user1.gate1.alpha.s'))
        set(vars.HH_user1.gate1.alpha.s,f,val);
      else
        set(vars.HH_user1.gate2.beta.th,f,val);
      end
    case 1317
      set(vars.HH_K.gate2,f,val);
    case 2446
      set(vars.HH_user1.gate1.alpha.c,f,val);
    case 2019
      set(vars.HH_Na.gate1.beta.c,f,val);
    case 2238
      set(vars.HH_Na.gate1.alpha.fn,f,val);
    case 1670
      set(handles.HH_Na.gmax,f,val);
    case 2356
      set(vars.HH_user1.gate1.beta.s,f,val);
    case 1919
      set(vars.HH_K.gate1.beta.c,f,val);
    case 2324
      set(handles.HH_K.gate2.beta.fn,f,val);
    case 2233
      set(vars.HH_user1.gate2.expt,f,val);
    case 2430
      set(handles.HH_K.gate2.alpha.fn,f,val);
    case 2142
      set(vars.HH_Na.gate2.alpha.s,f,val);
    case 2210
      set(handles.HH_K.gate1.beta.c,f,val);
    case 2333
      set(handles.HH_K.gate2.alpha.s,f,val);
    case 776
      if (strcmp(str,'vars.Clo'))
        set(vars.Clo,f,val);
      else
        set(vars.Nao,f,val);
      end
    case 1416
      set(vars.HH_Na.gate1,f,val);
    case 1936
      set(vars.HH_K.gate2.beta.s,f,val);
    case 2567
      set(vars.HH_user1.gate1.alpha.th,f,val);
    case 1570
      set(handles.HH_K.gmax,f,val);
    case 1493
      set(handles.g_passK,f,val);
    case 2326
      set(handles.HH_Na.gate1.beta.s,f,val);
    case 2032
      set(vars.HH_K.gate1.beta.fn,f,val);
    case 2041
      if (strcmp(str,'vars.HH_K.gate1.alpha.s'))
        set(vars.HH_K.gate1.alpha.s,f,val);
      else
        set(vars.HH_K.gate2.beta.th,f,val);
      end
    case 1467
      set(handles.HH_K.ion,f,val);
    case 1264
      set(handles.drug1,f,val);
    case 1722
      set(handles.HH_K_gates,f,val);
    case 2058
      set(handles.button_passK,f,val);
    case 961
      set(vars.ginh1,f,val);
    case 681
      set(vars.Rm,f,val);
    case 1417
      set(vars.HH_Na.gate2,f,val);
    case 2631
      set(handles.HH_user1.gate1.beta.c,f,val);
    case 2537
      set(handles.HH_Na.gate1.alpha.th,f,val);
    case 1812
      set(vars.HH_K.gate2.expt,f,val);
    case 574
      set(vars.T,f,val);
    case 2340
      set(vars.HH_user1.gate1.beta.c,f,val);
    case 2042
      set(vars.HH_K.gate2.alpha.s,f,val);
    case 2033
      set(vars.HH_K.gate2.beta.fn,f,val);
    case 2143
      set(handles.HH_user1_gates,f,val);
    case 2310
      set(handles.HH_Na.gate1.beta.c,f,val);
    case 1202
      set(vars.g_passK,f,val);
    case 2438
      set(handles.HH_K.gate2.alpha.th,f,val);
    case 2132
      set(vars.HH_Na.gate1.beta.fn,f,val);
    case 2317
      set(handles.HH_K.gate2.alpha.c,f,val);
    case 2859
      set(handles.HH_user1.gate2.alpha.th,f,val);
    case 1757
      set(vars.switch_passK,f,val);
    case 1912
      set(vars.HH_Na.gate2.expt,f,val);
    case 2227
      set(handles.HH_K.gate2.beta.s,f,val);
    case 690
      set(vars.Vr,f,val);
    case 676
      set(vars.Ko,f,val);
    case 2416
      set(handles.HH_Na.gate1.alpha.c,f,val);
    case 1275
      set(handles.stim1,f,val);
    case 2211
      set(handles.HH_K.gate2.beta.c,f,val);
    case 2433
      set(handles.HH_Na.gate2.alpha.s,f,val);
    case 2529
      set(handles.HH_Na.gate1.alpha.fn,f,val);
    case 2454
      set(vars.HH_user1.gate2.beta.fn,f,val);
    case 2036
      set(vars.HH_Na.gate2.beta.s,f,val);
    case 2357
      set(vars.HH_user1.gate2.beta.s,f,val);
    case 1857
      if (strcmp(str,'vars.switch_passNa'))
        set(vars.switch_passNa,f,val);
      else
        set(vars.switch_passCl,f,val);
      end
    case 1618
      set(handles.v3button,f,val);
    case 670
      set(vars.Ki,f,val);
    case 2423
      set(handles.HH_Na.gate1.beta.fn,f,val);
    case 1225
      set(vars.HH_user1,f,val);
    case 2246
      set(vars.HH_Na.gate1.alpha.th,f,val);
    case 2431
      set(handles.HH_Na.gate1.beta.th,f,val);
    case 2534
      set(handles.HH_K.gate1.exponent,f,val);
    case 2417
      set(handles.HH_Na.gate2.alpha.c,f,val);
    case 1616
      set(handles.v1button,f,val);
    case 1978
      set(vars.switch_HH_user1,f,val);
    case 2850
      set(handles.HH_user1.gate1.alpha.fn,f,val);
    case 2753
      if (strcmp(str,'handles.HH_user1.gate1.alpha.s'))
        set(handles.HH_user1.gate1.alpha.s,f,val);
      else
        set(handles.HH_user1.gate2.beta.th,f,val);
      end
    case 2560
      set(vars.HH_user1.gate2.alpha.fn,f,val);
    case 2461
      set(vars.HH_user1.gate1.beta.th,f,val);
    case 2141
      if (strcmp(str,'vars.HH_Na.gate1.alpha.s'))
        set(vars.HH_Na.gate1.alpha.s,f,val);
      else
        set(vars.HH_Na.gate2.beta.th,f,val);
      end
    case 2139
      set(vars.HH_K.gate2.alpha.fn,f,val);
    case 1092
      set(vars.gmult1,f,val);
    case 2026
      set(vars.HH_K.gate2.alpha.c,f,val);
    case 770
      if (strcmp(str,'vars.Cli'))
        set(vars.Cli,f,val);
      else
        set(vars.Nai,f,val);
      end
    case 2138
      set(vars.HH_K.gate1.alpha.fn,f,val);
    case 734
      if (strcmp(str,'vars.ENa'))
        set(vars.ENa,f,val);
      else
        set(vars.ECl,f,val);
      end
    case 2447
      set(vars.HH_user1.gate2.alpha.c,f,val);
    case 1276
      if (strcmp(str,'handles.stim2'))
        set(handles.stim2,f,val);
      else
        set(vars.HH_Na.ion,f,val);
      end
    case 1176
      set(vars.HH_K.ion,f,val);
    case 1279
      set(vars.HH_K.gmax,f,val);
    case 2146
      set(vars.HH_K.gate1.alpha.th,f,val);
    case 2737
      set(handles.HH_user1.gate1.alpha.c,f,val);
    case 804
      set(vars.HH_K,f,val);
    case 2568
      set(vars.HH_user1.gate2.alpha.th,f,val);
    case 1935
      set(vars.HH_K.gate1.beta.s,f,val);
    case 2232
      set(vars.HH_user1.gate1.expt,f,val);
    case 2530
      set(handles.HH_Na.gate2.alpha.fn,f,val);
    case 1265
      set(handles.drug2,f,val);
    case 2332
      if (strcmp(str,'handles.HH_K.gate1.alpha.s'))
        set(handles.HH_K.gate1.alpha.s,f,val);
      else
        set(handles.HH_K.gate2.beta.th,f,val);
      end
    case 2432
      if (strcmp(str,'handles.HH_Na.gate1.alpha.s'))
        set(handles.HH_Na.gate1.alpha.s,f,val);
      else
        set(handles.HH_Na.gate2.beta.th,f,val);
      end
    case 1617
      set(handles.v2button,f,val);
    case 2956
      set(handles.HH_user1.gate2.exponent,f,val);
    case 962
      set(vars.ginh2,f,val);
    case 2648
      set(handles.HH_user1.gate2.beta.s,f,val);
    case 1302
      if (strcmp(str,'vars.g_passNa'))
        set(vars.g_passNa,f,val);
      else
        set(vars.g_passCl,f,val);
      end
    case 2247
      set(vars.HH_Na.gate2.alpha.th,f,val);
    case 2635
      set(handles.HH_Na.gate2.exponent,f,val);
    case 2239
      set(vars.HH_Na.gate2.alpha.fn,f,val);
    case 2126
      set(vars.HH_Na.gate2.alpha.c,f,val);
    case 2858
      set(handles.HH_user1.gate1.alpha.th,f,val);
    case 1991
      set(handles.HH_user1.gmax,f,val);
    case 2323
      set(handles.HH_K.gate1.beta.fn,f,val);
    case 1316
      set(vars.HH_K.gate1,f,val);
    case 2463
      set(vars.HH_user1.gate2.alpha.s,f,val);
    case 1811
      set(vars.HH_K.gate1.expt,f,val);
    case 2327
      set(handles.HH_Na.gate2.beta.s,f,val);
    case 1557
      set(vars.switch_HH_K,f,val);
    case 1822
      set(handles.HH_Na_gates,f,val);
    case 2745
      set(handles.HH_user1.gate2.beta.fn,f,val);
    case 1379
      set(vars.HH_Na.gmax,f,val);
    case 1593
      if (strcmp(str,'handles.g_passNa'))
        set(handles.g_passNa,f,val);
      else
        set(handles.g_passCl,f,val);
      end
    case 1642
      set(handles.vc_curve,f,val);
    case 1911
      set(vars.HH_Na.gate1.expt,f,val);
    case 2341
      set(vars.HH_user1.gate2.beta.c,f,val);
    case 2040
      set(vars.HH_K.gate1.beta.th,f,val);
    otherwise
      disp 'unknown variable name to str_set';
  end
else
  disp 'str_set called with incorrect no of parameters';
end
