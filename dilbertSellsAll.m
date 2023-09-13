function [newMoney, sellOrNot ] = dilbertSellsAll( money, weekStockPrice, numShares )
%simulates Dilbert selling ALL the stocks possible for a particular week
%Dilbert can only sell if he has some stock shares.
%Inputs:
%           money -- real number that shows Dilbert's current amount of money
%  weekStockPrice -- real number for the price of the stock for a particular week
%       numShares -- integer for the number of stock shares Dilbert already owns
%Returns:
%        newMoney -- real number for the amount of mnoney Dilbert has after selling 
%                    his shares.
%       sellOrNot -- logical true if Dilbert was able to sell all his shares of stock
%                    false if he didn't have enough money

if numShares > 0 %if he has shares that he can sell
    sellOrNot = numShares > 0; %selling should be true since he has shares to sell
    newMoney = money + (weekStockPrice * numShares); %updated money should include the value he sold for
    numShares = 0; %update the number of shares since he has no shares anymore
else
    sellOrNot = numShares > 0; %if he doesn't have any shares it will return false
    newMoney = money; %since he couldn't sell anything he has the same amount of money
end
    
end %terminate function statement with end