%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Carga   d e   d a t o s 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('arraycidx.mat') % cargamos los centroides

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


