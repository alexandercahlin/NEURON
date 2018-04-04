function make_passive_channel(xi,yi,name,descr,ginit,gfmt)

  global vars handles

  buttonwidth = 20; buttonheight = 20; xtinc = 150;

  h = uicontrol('Style','CheckBox','Fontsize',8, ...
	    'Position',[xi yi buttonwidth buttonheight],'String','','Value',1, ...
	    'BackgroundColor',[0.7 1 0.7], ...
	    'UserData',[0.7 1 0.7], ...
	    'CallBack',['set_channel_button(''' name ''')']);
  str_eval(['handles.button_' name], h);

  str_eval(['vars.switch_' name], 1);
  color_button(h)
  xi = xi + buttonwidth + 5;

  make_valtext('',xi,yi,'%s',descr);

  str_eval(['vars.g_' name], ginit);

  temp = make_valbox(['g_' name],xi+xtinc,yi,ginit/1e-6, ...
			0.01,100.0,1e-6,@recalc_Rm_Vr,gfmt,'+',0.01);

  str_eval(['handles.g_' name], temp);

