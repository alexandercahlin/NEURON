function set_drug(drug_num, gmax, xloc)

global handles vars

drughandle=str_eval(['handles.drug' int2str(drug_num)]);

if (gmax==0)
  str_eval(['vars.gmult' int2str(drug_num)], 1);
  set(drughandle.helpt,'visible','on');
  set(drughandle.cursor,'visible','off');
else
  str_eval(['vars.gmult' int2str(drug_num)],(100-gmax)/100);
  set(drughandle.helpt,'visible','off');
  set(drughandle.cursor,'XData',[xloc xloc],'visible','on');
  if (xloc==drughandle.xmin | abs(xloc-drughandle.xmax)<12)
    set(drughandle.cursor,'LineStyle','-');  
  else
    set(drughandle.cursor,'LineStyle',':');
  end
end
