function u = Crossover(X,v,CR,Np)
    u = zeros(3,Np);
    for i=0:Np-1
        K2 = rand(3,1)>CR;
        K1 = K2<0.5;
        u(:,i+1) =  (K1.*v(:,i+1))+(K2.*X(:,i+1));
    end    
end