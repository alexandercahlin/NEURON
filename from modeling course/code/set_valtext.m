function set_valtext(h,val)

  global vars handles

  u = get(h,'UserData');

  if isfinite(u.scale)
    sval = val * u.scale;
  else
    sval = val;
  end

  set(h,'String',sprintf(u.fmt,sval))

  if ~isempty(u.varname)
    str_eval(['vars.' u.varname], val);
  end

