clear;clc

%% LAS ESTREPITOSAS AVENTURAS DE TRIPAS Y LA PANDILLA DEL HALCONETE MILENARIO %%


steps=1000;
L=1;

[state,x,y]=rand_walk_hw(steps,L);
[X,Y]=snake_walk(L);


%% ________   ANIMACIONES DE CAMINATAS ________

%drawing = animatedline();
%%for k = 1:length(x)
   % addpoints(drawing,x(k),y(k));
   % drawnow, %pause(0.5)
%end

% drawing2 = animatedline();
% for k = 1:length(X)
%    addpoints(drawing2,X(k),Y(k));
%   drawnow, pause(0.1)
% end

%% GRAFICAS 

% figure(2),plot(X,Y,'r--o') , hold on, plot(X(end),Y(end),'b*'), hold on, plot(X(1),Y(1),'g*'), axis equal, title ('Caminata Aleatoria'), legend ('Camino','FINAL','INICIO'), xlabel X, ylabel Y, 
% figure(3), plot(x,y,'b'), hold on, plot (x(end), y(end), 'r*'), hold on, plot(x(1), y(1), 'g*'), axis equal,  legend ('Camino','FINAL','INICIO'), xlabel x, ylabel y,
% %figure(3), bar(1:steps, state)
% figure(4), histogram(state)

% ------ VIDEO de Camianta --------

Caminata = VideoWriter('CaminataAnimada'); %Crear archivo con nombre x
Caminata.FrameRate = 60;  %FPS
open(Caminata)


rotate3d on ;
drawing = animatedline();

for k = 1:length(x)
   addpoints(drawing,x(k),y(k),z(k));
    drawnow
    
    frame = getframe(gcf); %Agarrar frame
    writeVideo(Caminata, frame);
end
close(Caminata)

