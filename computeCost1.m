function cost = computeCost1(T,n)
    Kp = T(1,1);
    Ti = T(2,1);
    Td = T(3,1);
    s=tf('s');
    sys=((Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068))/((s*((s^2)+110*s+6068))+(Kp+((Kp/Ti)/s)+((Kp*Td*s)/((Kp*Td/n)*s+1)))*(6068));
    S = stepinfo(sys);
    overshoot = S.Overshoot;
    risetime = S.RiseTime;
    settlingtime = S.SettlingTime;
    Ess = 0;
    beta =1.15;
    cost = (1-exp(-beta))*(overshoot+Ess)+exp(-beta)*(risetime+settlingtime);
end