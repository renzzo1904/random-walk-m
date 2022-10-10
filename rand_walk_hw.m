function [state,x,y]=rand_walk_hw(N,L)

%%
x=zeros(1,N);
y=zeros(1,N);
position=zeros(3,N);
state=zeros(1,N);

%% Ciclo para generar Caminata

c=0;
for i=2:N
    num=rand();
    
if 0.<= num && num < 0.25, state(i)=0; x(1,i)= x(1,i-1)+L; y(1,i)= y(1,i-1); end 
if 0.25<= num && num < 0.5, state(i)=1; y(1,i)= y(1,i-1)+L; x(1,i)= x(1,i-1);  end 
if 0.5<= num && num < 0.75, state(i)=2; x(1,i)= x(1,i-1)-L; y(1,i)= y(1,i-1); end
if 0.75<= num && num < 1, state(i)=3; y(1,i)= y(1,i-1)-L; x(1,i)= x(1,i-1); end

end
     
end 
