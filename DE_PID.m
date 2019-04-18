function Xres = DE_PID(X,F,CR,Np,caseType,n)
    G = 1; %Number of iterations
    cost = zeros(G,1);
    for i=1:G
        v = Mutation(X,F,Np);
        u = Crossover(X,v,CR,Np);
        X = nextGeneration(X,Np,caseType,u,n);
        ind = findFinal(X,caseType,Np,n); %function used to find the index with min cost in the data
        cost(i,1) = computeCost3(X(:,ind),n);
    end   
    %plot(cost);
    Xres = X;
end