function [fitresult, gof] = tauHfit(x, y, weights)
%CREATEFIT(X,Y,WEIGHTS)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%      Weights : weights
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 27-Mar-2018 13:00:01


%% Fit: 'untitled fit 1'.
[xData, yData, weights_1] = prepareCurveData( x, y, weights );

% Set up fittype and options.
ft = fittype( 'C*exp((-x+2.521)/tauh)-d', 'independent', 'x', 'dependent', 'y' );
backstep=diff(yData);
index=length(backstep)+1;
backend=index;



[peakI,peakindex]=min(yData);
Xlow=xData(peakindex);

excludedPoints = (xData < Xlow) | (xData > 8);
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-1.1 0 0];
opts.StartPoint = [-0.5 -0.1 0.9];
opts.Upper = [-0.4 0.3 2];
opts.Weights = weights_1;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData, excludedPoints );
legend( h, 'y vs. x with weights', 'Excluded y vs. x with weights', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel y
axis([0 6 -1.2 0.1])
grid on

