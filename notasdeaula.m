%% Macroeconomia de Curto Prazo 
% FGV EPGE - Apr/23
% Ana Paula Nothen Ruhe

clear all
clc
cd('C:\Users\B39017\Documents\Macro Curto Prazo')
addpath C:\dynare\5.4\matlab

%% Aula 1 - Abrindo Exemplos
 %cd C:\dynare\5.4\examples

%% Aula 2 - Iteração da Função Valor 
 % Modelo sem preço e sem choque
 
 % Parameters:
   sigma = 2;
   alpha = 0.5;
   beta = 0.98;
   a = 1;

 % Steady state:
   kss = (alpha*beta)^(1/(1-alpha));
   css = a*(kss^alpha) - kss;
   yss = kss^alpha;
   Kshare = kss/yss;
   
 % Capital Grid:
   kmin = 1/100;
   kmax = 98/100;
   Nk = 1000;
   
   K = linspace(kmin,kmax,Nk)'; 

 % Consumption Grid:
   C = a.*(K.^alpha) - K;

 % Utility Function:
   U = (C.^(1-sigma))/(1-sigma);

 % Value Function in Steady State:
   Vss = U./(1-beta);
    
 % Value Function Iteration
   V0 = Vss;
   V1 = zeros(Nk,1);
   tol = 10^(-6);
   erro = 1;

   c = zeros(Nk,Nk);
   kpol = zeros(Nk,1);
   kindex = zeros(Nk,1);

   while erro > tol
       for ik = 1:Nk
           for i = 1:Nk
               c(ik,i) = max(a*K(i)^alpha - K(ik),0);
           end

           [V1(ik),kindex(ik)] = max((c(:,ik).^(1-sigma))/(1-sigma) + beta.*V0);
           kpol(ik) = K(kindex(ik));
       end    
       erro = max(V1-V0);
       V0 = V1;
   end

 % Plots:
   subplot(2,2,1);
   plot(K,K)
   subplot(2,2,2);
   plot(K,kpol)
   subplot(2,2,3);
   plot(K,V1)
   
%% Aula 2 - RBC
 % Modelo sem preço


 
 
