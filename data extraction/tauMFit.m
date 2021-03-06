function [fitresult, gof] = tauMFit(Vstore, tauM)
%CREATEFIT(VSTORE,TAUM)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : Vstore
%      Y Output: tauM
%      Weights : tauM
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 13-Mar-2018 13:57:22


%% Fit: 'untitled fit 1'.
[xData, yData, weights] = prepareCurveData( Vstore, tauM, tauM );

% Set up fittype and options.
ft = fittype( 'gauss1' );
excludedPoints = excludedata( xData, yData, 'Indices', [3 25 79] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.Normalize = 'off'; %normally on
opts.Robust = 'Bisquare';
opts.StartPoint = [7.22108670879426 -0.0652427913805697 0.359648916758563];
opts.Weights = weights;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData, excludedPoints );
legend( h, 'tauM vs. Vstore with tauM', 'Excluded tauM vs. Vstore with tauM', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel Vstore
ylabel tauM
grid on


