%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Carga   d e   d a t o s 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('minoristasSinOutliers.mat')


ArraySuma = sum(X,2); % hacemos la suma de todas las columnas por fila
ArraySuma = sort(ArraySuma, 'descend'); % Se ordena de mayor gasto a menor
SumaTotal = sum(ArraySuma,'all'); % se hace la suma total de los elementos
Pareto20 = round(0.2 * (size(X,1)),1); %establecemos el 20% de los minoristas
Pareto20elements = ArraySuma(1:floor(Pareto20)); %recuperamos el 20% de los minoristas en una matriz
Pareto20suma = sum(Pareto20elements,'all'); %sumamos el gasto del 20% de los mejores minoristas

ParetoPorcentaje = (Pareto20suma * 100) / SumaTotal;

if ParetoPorcentaje >= 80
     texto = sprintf('Se cumple la regla de pareto, el 20%% de los minoristas equivale al %.2f%% de las ventas',ParetoPorcentaje);
else
          texto = sprintf('No se cumple la regla de pareto, el 20%% de los minoristas es menor al 80%% de ventas, en este caso al %.2f%% de las ventas',ParetoPorcentaje);
end

disp(texto);

