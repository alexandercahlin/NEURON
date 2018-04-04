function [v] = Volt(t)
% definita nell'intervallo (0,16)
    m=length(t);
    v=zeros(m,1);
    int=linspace(0,16,17);
    for j=1:m
        i=max(find(t(j)>=int));
        v(j)=-90+(i-1)*10;
    end
end
