function reset_channel(varname)

  global handles vars

  initval = str_get(['handles.' varname '.ion']);
  str_set(['handles.' varname '.ion'], 'Value', initval);
  str_eval(['vars.' varname '.ion'], initval);
  
  str_feval(@reset_valbox,['handles.' varname '.gmax']);


  for g = (1:2)
    if ((g == 2) & strcmp(varname,'HH_K'))
      return;
    end

    gate = int2str(g);

    initval = str_get(['handles.' varname '.gate' gate '.exponent']);
    str_set(['handles.' varname '.gate' gate '.exponent'], 'Value', initval);
    % need to use initval-1 below because exponents start at 0
    str_eval(['vars.' varname '.gate' gate '.expt'], initval - 1);

    % for alpha
    initval = str_get(['handles.' varname '.gate' gate '.alpha.fn']);
    str_set(['handles.' varname '.gate' gate '.alpha.fn'],'Value', initval);
    str_eval(['vars.' varname '.gate' gate '.alpha.fn'], initval);

    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.alpha.c']);
    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.alpha.th']);
    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.alpha.s']);

    % for beta
    initval = str_get(['handles.' varname '.gate' gate '.beta.fn']);
    str_set(['handles.' varname '.gate' gate '.beta.fn'],'Value', initval);
    str_eval(['vars.' varname '.gate' gate '.beta.fn'], initval);

    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.beta.c']);
    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.beta.th']);
    str_feval(@reset_valbox,['handles.' varname '.gate' gate '.beta.s']);
  end
