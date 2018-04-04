function set_channel_button(name,val)

global vars handles

obj = str_eval(['handles.button_' name]);

if nargin < 2
  val = get(obj,'Value');
end

str_eval(['vars.switch_' name], val);

color_button(obj)

recalc_Vr
recalc_Rm