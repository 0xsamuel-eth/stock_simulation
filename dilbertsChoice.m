function [choice] = dilbertsChoice( stockPrices, week )
%Uses Dilbert's rules to make a trading decision
%If the stock prices goes up three weeks in a row then down, SELL.
%If the stock price goes down three weeks then up, BUY.
%
% Inputs:
%   stockPrices - a 52x1 array with the weekly stock prices for a company
%   week  - integer, the current simulation week
%Returns:
%  choice - integer, 1 Dilbert BUYS, 0 Dilbert HOLDS, -1 Dilbert SELLS.



if stockPrices(week) > stockPrices(week-1) && stockPrices(week-1) < stockPrices(week-2) && stockPrices(week-2) < stockPrices(i-3) %if three downs followed by an up
    choice = 1; 
    %Dilbert's choice should be BUY (1)
elseif stockPrices(week) < stockPrices(week-1) && stockPrices(week-1) > stockPrices(week-2) && stockPrices(i-2) > stockPrices(i-3)
    choice = -1;
    %in the case of three ups followed by a down, Dilbert's choice should be SELL (-1)
else
    choice = 0;
    %if neither case above occurs, his choice is HOLD (0)
end

end %making sure to end the function