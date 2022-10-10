function [x,y]=snake_walk(L) 


%% _____ CONSTANTES Y DEF. INICIALES _____ 


occ_pos=[0,0]; % Comenzamos por (0,0) y poniendolo en un vector que será el de las posiciones ocupadas 

x=[0];  % Inicio en x 
y=[0];  %Inicio en y
trapped=false; %Condición de estar atrapado, la denotamos como falsa para poder entrar en el while.

i=1; % Contador que nos ayuda con el rellenado de la posición. MUCHO OJO, i representa la posición siguiente 

%% ______ CICLOS Y MOVIMIENTO __________


while trapped==false  %Mientras no estemos atrapados la posición seguirá actualizandose
    
i=i+1;  % Se entra al ciclo para una posición siguiente i=2, porque es a la que nos dirigimos 
cond_rumbo=false; % Imponemos condición de que la partícula se pueda mover si está libre el espacio. 

while cond_rumbo==false
 
% Este ciclo while ayuda a que la partícula intente actualizar su posicón
% hasta que encuentre un espacio libre. 
    
R_blocked=false; % Definimos 4 condiciones que nos ayudan a saber si la partícula se encuentra atrapada.
L_blocked=false;
top_blocked=false;
bot_blocked=false;   

% Estas 4 se definen como falsas al inicio del while debido a que en cada
% movimiento la condición de estar atrapado depende de donde vayamos y
% donde estemos. Se entenderá su uso a medida de la explicación del ciclo.

num=rand(); % # ALEATORIO UNIFORME


%** Se pone esta condición en caso de que el movimiento no sea válido, la
% partícula regrese a su posición anterior. **

x(1,i)=x(1,i-1); y(1,i)=y(1,i-1); 


% ESTOS 4 IF's ayudan a actualizar la posición según el número aleatorio. 

if 0.<= num && num < 0.25; x(1,i)= x(1,i-1)+L; y(1,i)= y(1,i-1);  end    
if 0.25<= num && num < 0.5 ; y(1,i)= y(1,i-1)+L; x(1,i)= x(1,i-1);  end 
if 0.5<= num && num < 0.75 ; x(1,i)= x(1,i-1)-L; y(1,i)= y(1,i-1); end 
if 0.75<= num && num < 1 ; y(1,i)= y(1,i-1)-L; x(1,i)= x(1,i-1);  end 

next_pos=[x(1,i),y(1,i)]; % Una vez obtenemos a donde nos tenemos que mover, creamos un
%vector que se encargue de representar a donde vamos.
  
mem=ismember(next_pos, occ_pos,'rows'); %Revisa la condición de que la posición a donde vamos
%sea parte de las posiciones en las que ya hemos estado antes y por tanto
%ocupadas.

if mem==false , occ_pos=cat(1,occ_pos,next_pos); cond_rumbo=true; end % Si la posición a la que vamos NO ESTA OCUPADA
%Añadimos al vector de posiciones ocupadas el vector a donde vamos.
%Cond_rumbo permite salir del ciclo.

% Es evidente, que si la posición esta ocupada, el ciclo se repite debido a
% que cond_rumbo sigue siendo falsa. Haciendo que tenga sentido la
% condición de regresar la partícula en caso del movimiento valido.
% BUSCAR** para saber a que se refiere esta explicación.

% Estos siguientes 4 IF's nos ayudan a saber si la partícula esta atrapada
% o no.

if mem==true && ismember([x(i-1)+L,y(i-1)], occ_pos,'rows')==true, R_blocked=true; end  
if mem==true && ismember([x(i-1)-L,y(i-1)], occ_pos,'rows')==true, L_blocked=true; end
if mem==true && ismember([x(i-1),y(i-1)+L], occ_pos,'rows')==true, top_blocked=true; end 
if mem==true && ismember([x(i-1),y(i-1)-L], occ_pos,'rows')==true, bot_blocked=true; end 

%EXPLICACIÓN de IF: 
%Si mem es un 1 lógico = la próxima posición esta ocupada.
%Además de esto pedimos que la posción que esté ocupada esté a una
%distancia L de la dimensión que nos interesa, podemos establecer que
%dirección está ocupada. 


% En caso de que se cumpla que las 4 direcciones estén ocupadas, concluimos
% que el camino está bloqueado.

% Imponemos cond_rumbo como true para salir del ciclo interno y trapped
% como true para salir del movimiento general. Antes de salir, debemos
% revisar que antes de salirse se regrese la trayectoria al punto anterior 

if R_blocked==true && L_blocked==true && top_blocked==true && bot_blocked==true, trapped=true; cond_rumbo=true; x(end)=x(end-1);y(end)=y(end-1); end 
    
end
    
    
end

end 

