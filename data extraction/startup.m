disp('startup.m says:')
disp(['   Current directory: ' cd])

% Get host name:
name = gethostname;
disp(['   Host name: ' name])

% Computer specific settings:
switch name
    % Special cases:
    case 'miman'
        RepoPath = '/srv/data/Resources/MatlabToolboxes';
        % Cluster profile
        if ~strcmp(parallel.defaultClusterProfile, 'local4')
            disp('Changing the default cluster profile to local4.')
            parallel.importProfile('/srv/data/Resources/MatlabToolboxes/ClusterProfiles/local4.settings');
            parallel.defaultClusterProfile('local4');
        end
    case 'parhalje-pc'
        RepoPath = 'C:\Users\pärh\Documents\GitHub';
%     case 'mv7417.mv.med.lu.se'
%         RepoPath = '/Users/parhalje/GitHub';
    case 'aurora'
        RepoPath = fullfile(getenv('NEURO'), 'MatlabToolboxes');
    case 'lmiman334t.srv.lu.se'
        RepoPath = '/srv/data/MatlabToolboxes';
        % Cluster profile
        if ~strcmp(parallel.defaultClusterProfile, 'local4')
            disp('Changing the default cluster profile to local4.')
            parallel.importProfile(fullfile(RepoPath, ...
                'ClusterProfiles/local4.settings'));
            parallel.defaultClusterProfile('local4');
        end
    % Standard cases:
    otherwise
        if ismac
            home = getenv('HOME');
            RepoPath = fullfile(home, 'GitHub');
        elseif isunix
            home = getenv('HOME');
            RepoPath = fullfile(home, 'GitHub');
        elseif ispc
            outp = 'S:\Videos\Dyskinesia';
        else
            error('Path not specified for this computer.')
        end
end
disp(['   Path to toolboxes: ' RepoPath])

% MeanMachine
addpath(fullfile(RepoPath, 'MeanMachine'))
mm_addpaths

% FieldTrip
% addpath(fullfile(RepoPath, 'fieldtrip'))
% ft_defaults

% NRC analysis
addpath(fullfile(RepoPath, 'nrcanalysis'))
nrc_addpaths
% addpath(fullfile(RepoPath, 'nrc_analysis_svn'))
% nrc_addpaths_legacy

% nrc-ppetersson
addpath(fullfile(RepoPath, 'nrc-ppetersson', 'Open Field Tracking'))

% E-mail
myaddress = 'miman.bmc.lu.se@gmail.com';
mypassword = 'bbvlhdnu';
setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',myaddress);
setpref('Internet','SMTP_Password',mypassword);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
clear myaddress mypassword props

clear name RepoPath home
