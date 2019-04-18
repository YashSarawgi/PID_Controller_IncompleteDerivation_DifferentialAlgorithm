function plot_final_result(T,caseType,n)
    Kp = T(1,1);
    Ti = T(2,1);
    Td = T(3,1);
    disp(Kp)
    disp(Ti)
    disp(Td)
s=tf('s');
if caseType ==1
    sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068))/((s*((s^2)+110*s+6068))+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068));
elseif caseType ==2
    sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*((1-0.5*s)/(1+0.5*s)))/((1+5*s)+((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1))))*((1-0.5*s)/(1+0.5*s)));
elseif caseType==3
    sys = ((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s))/(((s+1)^3)+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s));
else
    print("Invalid case");
end
    
%sys=((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s))/(((s+1)^3)+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(1-0.5*s));
stepplot(sys);
stepinfo(sys)
end
