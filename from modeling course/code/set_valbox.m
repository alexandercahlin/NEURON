function set_valbox(h,val)

  global vars handles

  if nargin == 0
    h = gcbo;
    v = str2num(get(h,'String'));
    if isempty(v)
      v = get(h,'Value');
    end
  elseif nargin == 1
    v = get(h,'Value');
  else
    v = val;
  end

  u = get(h,'UserData');
  v = max(u.valmin,min(u.valmax,v(1)));

  set(h,'Value',v)
  set(h,'String',sprintf(u.fmt,v))
  if (abs(v - u.valinit) < 1e-15) | (get(h,'Parent') == handles.HH_user1_gates)
    set(h,'BackgroundColor',[0 0 0])
  else
    set(h,'BackgroundColor',[0.6 0.2 0.2])
  end
  drawnow

  str_eval(['vars.' u.varname], v*u.scale);
  if (ischar(u.setter))
    [str_fn str_args]=strtok(u.setter,',');
    str_args=strtok(str_args,',');
    if (strcmp(str_fn,'recalc_gate_graph'))
      str_feval(@recalc_gate_graph, str_args);
    elseif (strcmp(str_fn,'update_drugbox'))
      update_drugbox(str2num(str_args),nargin); 
    end
  else
    feval(u.setter)
  end

