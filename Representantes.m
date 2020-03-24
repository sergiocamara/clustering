%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Carga   d e   d a t o s 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('minoristasSinOutliers.mat')


figure(1)
K=5;                       % Número óptimo de clusters
m=2;                       % parámetro de fcm, 2 es el defecto
MaxIteraciones=100;        % número de iteraciones
Tolerancia= 1e-5;          % tolerancia en el criterio de para
Visualizacion=0;           % 0/1
opciones=[m,MaxIteraciones,Visualizacion];
[center,U,obj_fcn] = fcm(X, K,opciones);
%%%%%%%
% p a r á m e t r o s   d e   s a l i d a              
% center    centroides de los grupos
% U         matriz de pertenencia individuo cluster 
% obj_fun   función objetivo
%%%%%%  Asignación de individuo a grupo, maximizando el nivel de
%       pertenencia al grupo
for i=1:K
maxU=max(U); % calculo del máximo nivel de pertenencia de los
             % individuos
individuos=find(U(i,:)==maxU);% calcula los individuos del
                              % grupo i que alcanzan el máximo
cidx(individuos)=i;           % asigna estos individuos al grupo i
grado_pertenecia(individuos)=maxU(individuos);
  
end

%% Representación de individuos
plot(X(cidx==1,:),'rs','MarkerSize',6,...
                  'MarkerEdgeColor','r', ...
                  'MarkerFaceColor','r');
hold on
plot(X(cidx==2,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','b', 'MarkerFaceColor','b');
hold on
plot(X(cidx==3,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','g', 'MarkerFaceColor','g');
hold on
plot(X(cidx==4,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','k', 'MarkerFaceColor','k');
hold on
plot(X(cidx==5,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','y', 'MarkerFaceColor','y');
hold on

xlabel('x_1','fontsize',18),ylabel('x_2','fontsize',18)
legend('Grupo 1','Grupo 2','Grupo 3','Grupo 4','Grupo 5'),axis('square'), box on
title('Algoritmo Fuzzy c-means','fontsize',18)




GRUPO1=(X(cidx==1,:));
GRUPO2=(X(cidx==2,:));
GRUPO3=(X(cidx==3,:));
GRUPO4=(X(cidx==4,:));
GRUPO5=(X(cidx==5,:));

RepresentanteGrupo1 = mean(GRUPO1,1);% Se hace la media que cada grupo por columna
RepresentanteGrupo2 = mean(GRUPO2,1);
RepresentanteGrupo3 = mean(GRUPO3,1);
RepresentanteGrupo4 = mean(GRUPO4,1);
RepresentanteGrupo5 = mean(GRUPO5,1);

ListRepresentantes =[RepresentanteGrupo1;RepresentanteGrupo2;RepresentanteGrupo3;RepresentanteGrupo4;RepresentanteGrupo5];
colNames = {'Fresh','Milk','Grocery','Frozen','Detergents_Paper','Delicassen'};


rowNames = {'GRUPO1','GRUPO2','GRUPO3','GRUPO4','GRUPO5'};
sTable = array2table(ListRepresentantes,'RowNames',rowNames,'VariableNames',colNames);
disp(sTable);


figure(2)

%% Representación de cada representante de cada grupo
plot(ListRepresentantes(1,:),'rs','MarkerSize',6,...
                  'MarkerEdgeColor','r', ...
                  'MarkerFaceColor','r');
hold on
plot(ListRepresentantes(2,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','b', 'MarkerFaceColor','b');
hold on
plot(ListRepresentantes(3,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','g', 'MarkerFaceColor','g');
hold on
plot(ListRepresentantes(4,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','k', 'MarkerFaceColor','k');
hold on
plot(ListRepresentantes(5,:),'bs',...
 'MarkerSize',6,'MarkerEdgeColor','y', 'MarkerFaceColor','y');
hold on

xlabel('x_1','fontsize',18),ylabel('x_2','fontsize',18)
legend('Grupo 1','Grupo 2','Grupo 3','Grupo 4','Grupo 5'),axis('square'), box on
title('Algoritmo Fuzzy c-means Representantes','fontsize',18)


