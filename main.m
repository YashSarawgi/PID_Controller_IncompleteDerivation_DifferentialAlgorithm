function main(caseType)
    %To run the code type main(1) or main(2) or main(3) in the 
    %command window. 1,2,3 are the caseType!
    hold off; % to ensure that the plot is refreshed whenever the code runs
    alpha = rand(1);
    Np=30;
    F=0.5;
    CR=0.1;
    if(caseType == 1)
        Kp =33.104;
        Ti = 0.3018;
        Td = 0.0724;
        %For the given Process function in the paper the best found value
        %of n to mminimize the cost was n= 3 in this case
        n=3; %Tf=Td/n
        X = getInitialX(Kp,Ti,Td,alpha,Np,caseType,n);
        % this is the initial result but the plot function is defined in the called function
        plot_final_result([Kp;Ti;Td],caseType,n); 
        hold on;
        disp('*****************ZN values result above and the final will be shown below*************');
        %temp =X;
    elseif(caseType ==2)
        Kp = 5.5;
        Ti = 2.39;
        Td = 0.3586;
        %For the given Process function in the paper the best found value
        %of n to mminimize the cost was n=9 in this case
        n=9;%Tf=Td/n
        X = getInitialX(Kp,Ti,Td,alpha,Np,caseType,n);
        plot_final_result([Kp;Ti;Td],caseType,n);
        hold on;
        disp('*****************ZN values result above and the final will be shown below*************');
       % temp =X;
    elseif(caseType ==3)
        Kp = 1.92;
        Ti = 4.42;
        Td = 0.6637;
        n=3; %Tf=Td/n
        X = getInitialX(Kp,Ti,Td,alpha,Np,caseType,n);
        plot_final_result([Kp;Ti;Td],caseType,n);
        hold on;
        disp('*****************ZN values result above and the final will be shown below*************');
        %temp =X;
    else
        disp("Invalid Case");
        return;
    end 
   % for i = 2 % this loop was used to iteratively find out the best value
   % of n for each of the prcoesses
        X = DE_PID(X,F,CR,Np,caseType,n);
       % X = temp;     
   % end
    
    ind = findFinal(X,caseType,Np,n); % the final index from the data matrix denotes the column with least cost parameters
    %disp("After Differential Evaluation " + "[Kp,Ti,Td] are: "+X(:,ind));
    
    plot_final_result(X(:,ind),caseType,n);
end
