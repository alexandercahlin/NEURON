function name = gethostname()
%GETHOSTNAME  Figures out which computer we are on.
%
% SYNTAX:
%   name = gethostname

name = getenv('SNIC_RESOURCE'); % Check if we are on a SNIC resource (Aurora).
if isempty(name)
    [ret, name] = system('hostname'); % Shell command that works on both Unix and Windows. Is it always identical to $HOSTNAME?
    if ret ~= 0, % If not 0, the command has failed and we have to try another method.
        if ispc 
            name = getenv('COMPUTERNAME'); 
        else 
            name = getenv('HOSTNAME'); 
        end 
    end
end
name = lower(name);
name = deblank(name);