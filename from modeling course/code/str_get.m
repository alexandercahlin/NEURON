function [ret]=str_get (str)

global vars handles

if (nargin==2)
  switch (sum(str))
    case 2632
      ret=get(handles.HH_user1.gate2.beta.c,'UserData');
    case 2226
      ret=get(handles.HH_K.gate1.beta.s,'UserData');
    case 1888
      ret=get(handles.HH_user1.ion,'UserData');
    case 2424
      ret=get(handles.HH_Na.gate2.beta.fn,'UserData');
    case 2535
      ret=get(handles.HH_K.gate2.exponent,'UserData');
    case 2752
      ret=get(handles.HH_user1.gate1.beta.th,'UserData');
    case 2647
      ret=get(handles.HH_user1.gate1.beta.s,'UserData');
    case 2279
      ret=get(handles.button_HH_user1,'UserData');
    case 2331
      ret=get(handles.HH_K.gate1.beta.th,'UserData');
    case 2311
      ret=get(handles.HH_Na.gate2.beta.c,'UserData');
    case 2634
      ret=get(handles.HH_Na.gate1.exponent,'UserData');
    case 2538
      ret=get(handles.HH_Na.gate2.alpha.th,'UserData');
    case 1858
      ret=get(handles.button_HH_K,'UserData');
    case 2147
      ret=get(vars.HH_K.gate2.alpha.th,'UserData');
    case 2738
      ret=get(handles.HH_user1.gate2.alpha.c,'UserData');
    case 2955
      ret=get(handles.HH_user1.gate1.exponent,'UserData');
    case 2316
      ret=get(handles.HH_K.gate1.alpha.c,'UserData');
    case 2437
      ret=get(handles.HH_K.gate1.alpha.th,'UserData');
    case 2744
      ret=get(handles.HH_user1.gate1.beta.fn,'UserData');
    case 2429
      ret=get(handles.HH_K.gate1.alpha.fn,'UserData');
    case 2851
      ret=get(handles.HH_user1.gate2.alpha.fn,'UserData');
    case 2754
      ret=get(handles.HH_user1.gate2.alpha.s,'UserData');
    case 1958
      ret=get(handles.button_HH_Na,'UserData');
    case 1567
      ret=get(handles.HH_Na.ion,'UserData');
    case 2158
      if (strcmp(str,'handles.button_passNa'))
        ret=get(handles.button_passNa,'UserData');
      else
        ret=get(handles.button_passCl,'UserData');
      end
    case 1670
      ret=get(handles.HH_Na.gmax,'UserData');
    case 2324
      ret=get(handles.HH_K.gate2.beta.fn,'UserData');
    case 2430
      ret=get(handles.HH_K.gate2.alpha.fn,'UserData');
    case 2210
      ret=get(handles.HH_K.gate1.beta.c,'UserData');
    case 2333
      ret=get(handles.HH_K.gate2.alpha.s,'UserData');
    case 1570
      ret=get(handles.HH_K.gmax,'UserData');
    case 1493
      ret=get(handles.g_passK,'UserData');
    case 2326
      ret=get(handles.HH_Na.gate1.beta.s,'UserData');
    case 1467
      ret=get(handles.HH_K.ion,'UserData');
    case 1264
      ret=get(handles.drug1,'UserData');
    case 1722
      ret=get(handles.HH_K_gates,'UserData');
    case 2058
      ret=get(handles.button_passK,'UserData');
    case 2631
      ret=get(handles.HH_user1.gate1.beta.c,'UserData');
    case 2537
      ret=get(handles.HH_Na.gate1.alpha.th,'UserData');
    case 2143
      ret=get(handles.HH_user1_gates,'UserData');
    case 2310
      ret=get(handles.HH_Na.gate1.beta.c,'UserData');
    case 2438
      ret=get(handles.HH_K.gate2.alpha.th,'UserData');
    case 2317
      ret=get(handles.HH_K.gate2.alpha.c,'UserData');
    case 2859
      ret=get(handles.HH_user1.gate2.alpha.th,'UserData');
    case 2227
      ret=get(handles.HH_K.gate2.beta.s,'UserData');
    case 2416
      ret=get(handles.HH_Na.gate1.alpha.c,'UserData');
    case 1275
      ret=get(handles.stim1,'UserData');
    case 2211
      ret=get(handles.HH_K.gate2.beta.c,'UserData');
    case 2433
      ret=get(handles.HH_Na.gate2.alpha.s,'UserData');
    case 2529
      ret=get(handles.HH_Na.gate1.alpha.fn,'UserData');
    case 1618
      ret=get(handles.v3button,'UserData');
    case 2423
      ret=get(handles.HH_Na.gate1.beta.fn,'UserData');
    case 2431
      ret=get(handles.HH_Na.gate1.beta.th,'UserData');
    case 2534
      ret=get(handles.HH_K.gate1.exponent,'UserData');
    case 2417
      ret=get(handles.HH_Na.gate2.alpha.c,'UserData');
    case 1616
      ret=get(handles.v1button,'UserData');
    case 2850
      ret=get(handles.HH_user1.gate1.alpha.fn,'UserData');
    case 2753
      if (strcmp(str,'handles.HH_user1.gate1.alpha.s'))
        ret=get(handles.HH_user1.gate1.alpha.s,'UserData');
      else
        ret=get(handles.HH_user1.gate2.beta.th,'UserData');
      end
    case 1276
      if (strcmp(str,'handles.stim2'))
        ret=get(handles.stim2,'UserData');
      else
        ret=get(vars.HH_Na.ion,'UserData');
      end
    case 2737
      ret=get(handles.HH_user1.gate1.alpha.c,'UserData');
    case 2530
      ret=get(handles.HH_Na.gate2.alpha.fn,'UserData');
    case 1265
      ret=get(handles.drug2,'UserData');
    case 2332
      if (strcmp(str,'handles.HH_K.gate1.alpha.s'))
        ret=get(handles.HH_K.gate1.alpha.s,'UserData');
      else
        ret=get(handles.HH_K.gate2.beta.th,'UserData');
      end
    case 2432
      if (strcmp(str,'handles.HH_Na.gate1.alpha.s'))
        ret=get(handles.HH_Na.gate1.alpha.s,'UserData');
      else
        ret=get(handles.HH_Na.gate2.beta.th,'UserData');
      end
    case 1617
      ret=get(handles.v2button,'UserData');
    case 2956
      ret=get(handles.HH_user1.gate2.exponent,'UserData');
    case 2648
      ret=get(handles.HH_user1.gate2.beta.s,'UserData');
    case 2635
      ret=get(handles.HH_Na.gate2.exponent,'UserData');
    case 2239
      ret=get(vars.HH_Na.gate2.alpha.fn,'UserData');
    case 2858
      ret=get(handles.HH_user1.gate1.alpha.th,'UserData');
    case 1991
      ret=get(handles.HH_user1.gmax,'UserData');
    case 2323
      ret=get(handles.HH_K.gate1.beta.fn,'UserData');
    case 2327
      ret=get(handles.HH_Na.gate2.beta.s,'UserData');
    case 1822
      ret=get(handles.HH_Na_gates,'UserData');
    case 2745
      ret=get(handles.HH_user1.gate2.beta.fn,'UserData');
    case 1593
      if (strcmp(str,'handles.g_passNa'))
        ret=get(handles.g_passNa,'UserData');
      else
        ret=get(handles.g_passCl,'UserData');
      end
    case 1642
      ret=get(handles.vc_curve,'UserData');
    otherwise
      disp 'unknown variable name to str_get';
  end
else
  disp 'str_get called with incorrect no of parameters';
end
