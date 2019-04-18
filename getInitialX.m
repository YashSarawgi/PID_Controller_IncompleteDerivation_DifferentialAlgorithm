function X = getInitialX(Kp,Ti,Td,alpha,Np,caseType,n)
    KpL = (1-alpha)*Kp;
    KpH = (1+alpha)*Kp;
    TiL = (1-alpha)*Ti;
    TiH = (1+alpha)*Ti;
    TdL = (1-alpha)*Td;
    TdH = (1+alpha)*Td;
    s=tf('s');
    
    for i=0:Np-1
        while 1
            Kp = rand*(KpH-KpL) +KpL;
            Ti = rand*(TiH-TiL) +TiL;
            Td = rand*(TdH-TdL) +TdL;
            if caseType ==1
                sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068))/((s*((s^2)+110*s+6068))+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068));
            elseif caseType ==2
                sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*((1-0.5*s)/(1+0.5*s)))/((1+5*s)+((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1))))*((1-0.5*s)/(1+0.5*s)));
            elseif caseType==3
                sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s))/(((s+1)^3)+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s));
            else
                print("Invalid case");
            end
            
            S = stepinfo(sys);
            %sprintf("%.6f",S.Overshoot);
            if(isnan(S.Overshoot)==1)
                %print('inside it');
                continue;
            else
                break;
            end
        end
        
        if i==0
            X=[Kp;Ti;Td];
            continue;
        end
        NewCol = [Kp;Ti;Td];
        X=[X NewCol];
        %The uniqueness is not maintained
    end