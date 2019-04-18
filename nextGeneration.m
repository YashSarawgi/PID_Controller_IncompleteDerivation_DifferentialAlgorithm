function Xres = nextGeneration(X,Np,CaseType,u,n)
    Xres = zeros(3,Np);
    for i=0:Np-1
        if(CaseType==1)
            XCost = computeCost1(X(:,i+1),n);
            uCost = computeCost1(u(:,i+1),n);
        elseif(CaseType==2)
            XCost = computeCost2(X(:,i+1),n);
            uCost = computeCost2(u(:,i+1),n);
        elseif(CaseType==3)
            XCost = computeCost3(X(:,i+1),n);
            uCost = computeCost3(u(:,i+1),n);
        else
            disp("Invalid Case");
            return;
        end
        
        if(uCost<XCost)
            Xres(:,i+1) = u(:,i+1);
        else
            Xres(:,i+1) = X(:,i+1);
        end 
    end
end