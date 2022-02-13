%PA#5 - implicit solutions and modes 
%Name: Abdullah Abushaban 
%student number: 101089570
%Due Feb 12th 2022 

clear all
close all

set(0,'DefaultFigureWindowStyle','docked')

%initializing ny and nx 

nx = 50;
ny = 50;

%creating a sparse G Matrix 

V = zeros(nx, ny);
G = sparse(nx * ny,nx * ny);

% G matrix

for i = 1:nx
    for j = 1:ny

        n = j + (i - 1) * ny;

        if i == 1 || j == 1 || i == nx || j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
            G(n,n) = -4;
            G(n,n + 1) = 1;
            G(n,n - 1) = 1;
            G(n,n + ny) = 1;
            G(n,n - ny) = 1;
        end

    end
end

%Plotting G using spy()

figure('name', 'Matrix');
spy(G)


% Plotting the eigenvalues 
nmodes = 9;


%Given equation to get 9 for each eigenvectors and eigenvalues

[E,D] = eigs(G,nmodes,'SM');

figure('name','EigenValues');
plot(diag(D),'*');

figure('name',' modes');

for K = 1:nmodes
    M = E(:,K);

    for i = 1:nx

        for j = 1:ny
            n = i + (j - 1) * nx;
            V(i,j) = M(n);
        end

        subplot(3,3,K);
        surf(V);
        title(['EigenVectors = ' num2str(D(K,K))])
    end

end