k = 15;
[Idx, Ctrs, SumB, D] = kmeans(U,k);
A = cell(k,1);
for n = 1:k
    A{n} = find(Idx == n);
end
