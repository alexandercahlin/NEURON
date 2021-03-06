function [fitresult, gof] = best(x, y, blurb1)
%CREATEFIT(X,Y,BLURB1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%      Weights : blurb1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 26-Mar-2018 19:43:40


%% Fit: 'untitled fit 1'.
[xData, yData, weights] = prepareCurveData( x, y, blurb1 );

% Set up fittype and options.
ft = fittype( '-0.03-k*(1-exp((-x+0.5)/taum)).^3.*exp((-x+0.5)/tauh)', 'independent', 'x', 'dependent', 'y' );
excludedPoints = (xData < 0.4) | (xData > 4);
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.StartPoint = [0.145538980384717 0.181847028302852 0.26380291652199];
opts.Upper = [Inf 1 5];
opts.Weights = weights;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData, excludedPoints );
% legend( h, 'y vs. x with blurb1', 'Excluded y vs. x with blurb1', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel x
% ylabel y
% grid on


