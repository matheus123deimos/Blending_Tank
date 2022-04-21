function [ sys x0 ] = blending_tank(t,x,u,flag,w1,w2,w,x1,x2,p)

if abs(flag)==0
    
    %Condi��es inciais
    xi = 0 ; % Fra��o de Massa inicial (m^3);
    Vi = 2 ; % Volume inicial (m^3) (�C)
    
    x0=[xi Vi]; % Vetor de condicoes iniciais
    
    sys(1) =  2 ; % Estados Continuos
    sys(2) =  0 ; % Estados Discretos
    sys(3) =  2 ; % Sa�das
    sys(4) =  0 ; % Entradas
    sys(5) =  0 ; % Alimenta��o Direta
    sys(6) =  0 ; % Tempo de amostragem
    
elseif abs(flag)==1
    
    % Vari�veis de Estado do sistema;
    X = x(1); % Fra��o de Massa
    V = x(2); % Volume
    
    % Equa��es Diferenciais 
    dV=(w1 + w2 - w)/(p);
    dx=(w1*(x1-X)+w2*(x2-X))/(p*V);
    sys=[dx;dV];
    
elseif flag==3 
    
    % Vetor de vari�veis de sa�da, neste caso, os estados  
    y=x;
    sys=y;
else
    sys=[];
end

