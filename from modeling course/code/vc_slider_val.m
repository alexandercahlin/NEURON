function vc_slider_val

global handles vars

xlims = get(handles.vc_mainplot, 'XLim');
slider_val = (xlims(1)+xlims(2))/2;
slider_min = get(handles.vc_slider, 'Min');
slider_max = get(handles.vc_slider, 'Max');
if slider_val < slider_min
    set(handles.vc_slider, 'Min', slider_val);
end
if slider_val > slider_max
    set(handles.vc_slider, 'Max', slider_val);
end


%set current slider value
set(handles.vc_slider, 'Value',slider_val);

%%% Change width of slider on zoom. 
xwidth = xlims(2) - xlims(1);
slider_min = get(handles.vc_slider, 'Min');
slider_max = get(handles.vc_slider, 'Max');
scrollwidth = slider_max - slider_min;
set(handles.vc_slider, 'sliderstep', [0.1, max(0.1, xwidth/scrollwidth*2)]);


ylims = get(handles.vc_mainplot, 'YLim');
slider_val = (ylims(1)+ylims(2))/2;
slider_min = get(handles.vc_vertslider, 'Min');
slider_max = get(handles.vc_vertslider, 'Max');
if slider_val < slider_min
    set(handles.vc_vertslider, 'Min', slider_val);
end
if slider_val > slider_max
    set(handles.vc_vertslider, 'Max', slider_val);
end


%set current slider value
set(handles.vc_vertslider, 'Value',slider_val);

%%% Change width of slider on zoom. 
ywidth = ylims(2) - ylims(1);
slider_min = get(handles.vc_vertslider, 'Min');
slider_max = get(handles.vc_vertslider, 'Max');
scrollwidth = slider_max - slider_min;
set(handles.vc_vertslider, 'sliderstep', [0.1, max(0.1, ywidth/scrollwidth*2)]);
