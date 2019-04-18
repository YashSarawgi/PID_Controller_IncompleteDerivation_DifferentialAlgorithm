function v = Mutation(X,F,Np)
    v= zeros(3,Np);
    for i=0:Np-1  
        while(1)
            r1 = round(rand*(Np-1));
            r2 = round(rand*(Np-1));
            r3 = round(rand*(Np-1));
            if(r1~=i && r2~=i && r3~=i && r1~=r2 && r2~=r3 && r1~=r3)
                break;
            end
        end
        
        v(:,i+1) = X(:,r1+1)+(F*(X(:,r2+1)-X(:,r3+1)));
    end
    
end
