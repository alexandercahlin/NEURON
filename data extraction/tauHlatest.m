function [fitresult, gof] = tauHlatest(x, y, weights)
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

%  Auto-generated by MATLAB on 27-Mar-2018 14:48:38


%% Fit: 'untitled fit 1'.
[xData, yData, weights_1] = prepareCurveData( x, y, weights );

% Set up fittype and options.
ft = fittype( 'C*exp((-x+2.521)/tauh)-d', 'independent', 'x', 'dependent', 'y' );



excludedPoints = (xData < low(xData,yData) | (xData > 8)); %xdata < 2.55
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-2 0 0];
opts.StartPoint = [0.950222048838355 0.0344460805029088 0.438744359656398];
opts.Upper = [-0.3 0.2 2];
opts.Weights = weights_1;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
plot( fitresult, xData, yData, excludedPoints ); %h=
% legend( h, 'y vs. x with weights', 'Excluded y vs. x with weights', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel y
axis([0 xData(end) -1 0])
grid on


