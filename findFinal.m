function ind = findFinal(X,caseType,Np,n)
    if(caseType==1)
        for i=0:Np-1
            if i==0
                cost = computeCost1(X(:,i+1),n);
                ind=i+1;
                continue;
            end
            check = computeCost1(X(:,i+1),n);
            if(check<cost)
                cost=check;
                ind =i;
            end
        end
    elseif(caseType==2)
        for i=0:Np-1
            if i==0
                cost = computeCost2(X(:,i+1),n);
                ind =i+1;
                continue;
            end
            check = computeCost2(X(:,i+1),n);
            if(check<cost)
                cost=check;
                ind =i;
            end
        end
    elseif(caseType==3)
        for i=0:Np-1
            if i==0
                cost = computeCost3(X(:,i+1),n);
                ind = i+1;
                continue;
            end
            check = computeCost3(X(:,i+1),n);
            if(check<cost)
                cost=check;
                ind =i;
            end
        end
    else
        disp("Invalid Case");
        return;
    end
end