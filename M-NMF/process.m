n = 2118; % nodes
e = 174972;
m = 100; % the dimension of representation
k = 15; % the number of communities

alpha = 0.5;
beta = 0.5;
lambda = 1e9;

% first-order proximity or the adjacency matrix(B1)
A = zeros(n,n);
for i = 1:e
    A(edge2(i,1),edge2(i,2)) = 1;
end

% second-order proximity
S2 = zeros(n,n);
for i = 1:n
    for j = 1:n
        %S2(i,j) = pdist2(A(i,:),A(j,:),'cosine');
        S2(i,j) = dot(A(i,:),A(j,:))/(norm(A(i,:)*norm(A(j,:))));
    end
end

% preserve first- and second-order proximities
S = A + 5*S2;
% Initialize the nonnegative basis matrix M
M = rand(n,m);
% Initialize the representations matrix of nodes U
U = rand(n,m);
% Initialize the community indicator matrix H
H = zeros(n,k);
for i = 1:n
    r = randperm(k,1);
    H(i,r) = 1;
end
% Initialize the representations matrix of communities C
C = rand(k, m);

% Compute B2
% degree matrix of nodes
D = zeros(n,1);
for i = 1:n
    D(i,1) = sum(A(i,:));
end
B2 = zeros(n,n);
for i = 1:n
    for j = 1:n
        B2(i,j) = D(i,1)*D(j,1)/(2*exp(1));
    end
end

[U, M, H, C, L] = MNMF(S,M,U,H,C,A,B2,alpha,beta,lambda);
