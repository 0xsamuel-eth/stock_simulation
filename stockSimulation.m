%  Name(s): Samuel Masten -- no partner
%  Email(s): samasten@ncsu.edu
%  Date: 09-29-21
%  Lab Section #: 204
%  Project 2: Stock Simulator, Fall 2021
clc ; clear ; close;

%% 2.1

%creating the intro to the game by printing the headings
fprintf('---------------------------------------------\n');
fprintf('WELCOME TO DILBERTs STOCK SIMULATION!\n');
fprintf('\n---------------------------------------------\n');

%Displaying the possible stock markets using print statements
fprintf( 'Possible stock markets:\n');
fprintf('\t     Tech(1)\n') 
fprintf('\t   Retail(2)\n') %line breaks in between statements keeps each sentence on a different line 
fprintf('\tFinancial(3)\n')

%using an input statement to ask the user which market they will choose
MarketChosen = input('   Select stock market: ');

    

fprintf('\n---------------------------------------------\n');

%% 2.2

TechData = readmatrix('techStocks.xlsx'); %storing the techStocks data as a variable
RetailData = readmatrix('retailStocks.xlsx'); %storing the retailStocks data as a variable
FinancialData = readmatrix('financialStocks.xlsx'); %storing the financialStocks data as a variable


%% 2.6 - Running the Game and Functions

numShares = 0; %initially he has zero shares
NetWorth = 50000; %initially he has 50000 dollars
money = 50000; %initially the money variable is also 50000

if MarketChosen == 1 %if tech was chosen
    fprintf('Stock Trading Simulation for Tech companies.'); %follow format from the example run
    fprintf('\n---------------------------------------------\n');
    fprintf('\n*********************************************\n');
    for i = 2:4 %since there are three companies we can use a for loop with three iterations
    fprintf('Company: %s',TechData(1,i); %this will update for each company as they are in the 2nd,3rd, 4th spots in the spreadsheet
    fprintf('\n**********************************************\n');
    for week = 1:52 %for all 52 weeks
        stockPrices = TechData(week,2); %setting the stockprice equal to the specific week its on
        [choice] = dilbertsChoice( stockPrices, week );
        fprintf('%d: Stock Price = %d', week, StockPrices(week,2)); %the week and stock price will update with each iteration of the loop
        if choice == 1 %if buying is decided
            [ remainingMoney, newNumShares, buyOrNot ] = dilbertBuysAll( money, weekStockPrice, numShares); %since buy is the choice, we run the buy function
            NetWorth = remainingMoney + (newNumShares * StockPrices(week,2)); %the net worth will update to his holdings and his money position
            fprintf('-->Dilbert BUYs stock shares.'); %since we bought stock we display he BUYs shares
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', remainingMoney, newNumShares, NetWorth); %we now must display the updates cash, shares, and net worth positions
        elseif choice == 2 %if selling is the option our function decides
            [newMoney, sellOrNot ] = dilbertSellsAll( money, weekStockPrice, numShares ); %we need to call the sell function
            NetWorth = newMoney; %money position is equal to the newMoney output from the sell function
            fprintf('-->Dilbert SELLs his stock shares.');
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', newMoney, mumShares, NetWorth); %updating the table values
        else %if he neither sells nor buys but holds
            fprintf('-->Dilbert HOLDs his stock shares.'); %no need to call a function if he is holding
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', money, mumShares, NetWorth); %values do not change since he did not buy or sell
        
        end
        fprintf('Simulation for %s is finished.\nDilbert made a profit of $%.2f!',TechData(1,i),NetWorth - 50000); %the profit he made is equal to the difference between networth and his initial cash position
        fprintf('\n**********************************************\n');
    
    end
    NetWorthVec(i-1) = NetWorth; %we can store the networth from each company run in a vector to use for our comparison table later
    TechCompVec(i-1) = TechData(1,i); %we can also store the companies in a vector to make creating the table easier
    end
    
fprintf('\n---------------------------------------------\n');
fprintf('\t\t Trading Comparison\n\t  Company\tNet Worth'); %creating the table header
fprintf('\n---------------------------------------------\n');
fprintf('\t\t%d\t %.2f',TechCompVec',NetWorthVec')        %since it is a table we need to transpose each vector
fprintf('Dilbert should have bought the %s stock.',TechCompVec(max(NetWorthVec))) %the one he should have bought is in the same location as the largest net worth vector value 

elseif MarketChosen == 2
    fprintf('Stock Trading Simulation for Retail companies.'); %follow format from the example run
    fprintf('\n---------------------------------------------\n');
    fprintf('\n*********************************************\n');
    for i = 2:4 %initiating the for loop for the three retail companies
    fprintf('Company: %s',RetailData(1,i); %printing the retail company headings from the spreadsheet
    fprintf('\n**********************************************\n');
    for week = 1:52 %initiating the for loop for all 52 weeks
        stockPrices = RetailData(week,2);
        [choice] = dilbertsChoice( stockPrices, week ); %running the choice function to see what his action should be
        fprintf('%d: Stock Price = %d', week, StockPrices(week,2));
        if choice == 1
            [ remainingMoney, newNumShares, buyOrNot ] = dilbertBuysAll( money, weekStockPrice, numShares); %need to terminate the buy function so it doesn't produce an output in the window
            NetWorth = remainingMoney + (newNumShares * StockPrices(week,2)); %updaitng net worth to his cash and share values
            fprintf('-->Dilbert BUYs stock shares.'); %buy function running means he bought shares
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', remainingMoney, newNumShares, NetWorth);
        elseif choice == 2 %if choice function decideds he should sell shares
            [newMoney, sellOrNot ] = dilbertSellsAll( money, weekStockPrice, numShares );
            NetWorth = newMoney; %updating the cash position to the output from the sell function
            fprintf('-->Dilbert SELLs his stock shares.');
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', newMoney, mumShares, NetWorth); %updating the values for the output window
        else
            fprintf('-->Dilbert HOLDs his stock shares.'); %if neither function runs he holds his shares
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', money, mumShares, NetWorth);
        
        end
        fprintf('Simulation for %s is finished.\nDilbert made a profit of $%.2f!',RetailData(1,i),NetWorth - 50000); %profit is equal to the difference in networth currently and his original cash position
        fprintf('\n**********************************************\n');
    
     end
    NetWorthVec(i-1) = NetWorth; %storing net worth for each co in a vector
    RetailCompVec(i-1) = RetailData(1,i); %storing name of each co in a vector
    end
    
fprintf('\n---------------------------------------------\n');
fprintf('\t\t Trading Comparison\n\t  Company\tNet Worth'); %creating the table heading and breaks
fprintf('\n---------------------------------------------\n');
fprintf('\t\t%d\t %.2f',RetailCompVec',NetWorthVec') %creating our comparison table using the vectors we stored the values in        
fprintf('Dilbert should have bought the %s stock',RetailCompVec(max(NetWorthVec)))


else
    fprintf('Stock Trading Simulation for Financial companies.'); %follow format from the example run
    fprintf('\n---------------------------------------------\n');
    fprintf('\n*********************************************\n');
    for i = 2:4 %for the three companies in financials, we need three loop iterations
    fprintf('Company: %s',FinancialData(1,i);
    fprintf('\n**********************************************\n');
    for week = 1:52
        stockPrices = FinancialData(week,2); %the stockPrices input for the choice function is equal to the stockPrices in the FinancialData spreadsheet
        [choice] = dilbertsChoice( stockPrices, week ); %running the function to determine the choice Dilbert makes
        fprintf('%d: Stock Price = %d', week, StockPrices(week,2));
        if choice == 1 %if the buy condition triggers
            [ remainingMoney, newNumShares, buyOrNot ] = dilbertBuysAll( money, weekStockPrice, numShares); %we run the buy function
            NetWorth = remainingMoney + (newNumShares * StockPrices(week,2));
            fprintf('-->Dilbert BUYs stock shares.'); %buy function running means he is buying shares
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', remainingMoney, newNumShares, NetWorth);
        elseif choice == 2
            [newMoney, sellOrNot ] = dilbertSellsAll( money, weekStockPrice, numShares ); %run the sell function if choice 2 is outputted
            NetWorth = newMoney; 
            fprintf('-->Dilbert SELLs his stock shares.');
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', newMoney, mumShares, NetWorth); %update the cash, net worth, and share counts
        else
            fprintf('-->Dilbert HOLDs his stock shares.');
            fprintf('-->Money = %.2f, Stock Shares = %d, Net Worth = %8.2f', money, mumShares, NetWorth); %the values of all three variables do not change if he is holding
        
        end
        fprintf('Simulation for %s is finished.\nDilbert made a profit of $%.2f!',FinancialData(1,i),NetWorth - 50000); %printing the company name and ending net worth to the commmand window
        fprintf('\n**********************************************\n');
    
     end
    NetWorthVec(i-1) = NetWorth; %storing net worth for each financial company in a vector
    FinancialCompVec(i-1) = FinancialData(1,i); %storing name of each financial company in a vector
    end
    
fprintf('\n---------------------------------------------\n');
fprintf('\t\t Trading Comparison\n\t  Company\tNet Worth'); %using tabs to create the spacing between table headers
fprintf('\n---------------------------------------------\n');
fprintf('\t\t%d\t %.2f',FinancialCompVec',NetWorthVec') %transposing each vector since the table will list values columnwise        
fprintf('Dilbert should have bought the %s stock',FinancialCompVec(max(NetWorthVec))) 


end %finally ending this massive if statement. WOOHOO!



