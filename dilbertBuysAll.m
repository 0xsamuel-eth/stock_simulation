function [ remainingMoney, newNumShares, buyOrNot ] = dilbertBuysAll( money, weekStockPrice, numShares)
%stimulates Dilbert buying ALL the stocks possible for a particular week
%with his available money. If the price of teh stock is higher
%than the amount of money Dilbert has then he can not buy any new shares.
%Inputs:
%           money -- real number that shows Dilbert's current amount of money
%  weekStockPrice -- real number for the price of the stock for a particular week
%       numShares -- integer for the number of stock shares Dilbert already owns
%Returns:
%  remainingMoney -- real number for the amount of mnoney Dilbert has after buying
%                    more shares.
%    newNumShares -- integer for the number of shares Dilbert has AFTER buying shares
%                    with his available money.
%        buyOrNot -- logical true if Dilbert was able to buy more stock
%                    shares, false if he didn't have enough money

if money >= weekStockPrice %if he has enough money to buy at least 1 share
    buyOrNot = money >= weekStockPrice; %buyOrNot should return TRUE
    newNumShares = numShares + floor(money/weekStockPrice); %the new number of shares should equal the existing amount plus the max new shares he can buy
    remainingMoney = money - ((newNumShares - numShares) * weekStockPrice); %the money left is equal to the money he had minus what he spent
else
    buyOrNot = money >= weekStockPrice; %buyOrNot returns FALSE if he has too little money for 1 share
    newNumShares = numShares; %his shares are still the same as before
    remainingMoney = money; %he has not spent any money so it stays the same as well
    
end
