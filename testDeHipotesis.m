
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Carga   d e   d a t o s 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('minoristasSinOutliers.mat')%cargamos los datos sin outliers
load('arraycidx.mat') % cargamos los centroides


GRUPO1=(X(cidx==1,:));
GRUPO2=(X(cidx==2,:));
GRUPO3=(X(cidx==3,:));
GRUPO4=(X(cidx==4,:));
GRUPO5=(X(cidx==5,:));

rng('default')
productosNombre = {'Fresh','Milk','Grocery','Frozen','Detergents_Paper','Delicassen'};
for i=1: size(X,2)
    pproducto = anova1(X(:,i),cidx); % bl�ce an�lisis de varianza por producto
    texto = sprintf('\n\nanova -> %s p=% d',productosNombre{i},pproducto);
    disp(texto);
    title(productosNombre{i});
    if pproducto<0.05 %comparaci�n de valor de probabilidad para determinar la varianza
        [p12,h12]= ranksum(GRUPO1(:,i),GRUPO2(:,i)); % analisis de la varianza entre grupos por columna
        texto1 = sprintf('ranksum -> GRUPO 1-2     p = %d | h =% d',p12,h12);
        disp(texto1);
        [p13,h13]= ranksum(GRUPO1(:,i),GRUPO3(:,i));
         texto2 = sprintf('ranksum -> GRUPO 1-3     p = %d | h =% d',p13,h13);
        disp(texto2);
        [p14,h14]= ranksum(GRUPO1(:,i),GRUPO4(:,i));
         texto3 = sprintf('ranksum -> GRUPO 1-4     p = %d | h =% d',p14,h14);
        disp(texto3);
        [p15,h15]= ranksum(GRUPO1(:,i),GRUPO5(:,i));
         texto4 = sprintf('ranksum -> GRUPO 1-5     p = %d | h =% d',p15,h15);
        disp(texto4);
        [p23,h23]= ranksum(GRUPO2(:,i),GRUPO3(:,i));
         texto5 = sprintf('ranksum -> GRUPO 2-3     p = %d | h =% d',p23,h23);
        disp(texto5);
        [p24,h24]= ranksum(GRUPO2(:,i),GRUPO4(:,i));
         texto6 = sprintf('ranksum -> GRUPO 2-4     p = %d | h =% d',p24,h24);
        disp(texto6);
        [p25,h25]= ranksum(GRUPO2(:,i),GRUPO5(:,i));
         texto7 = sprintf('ranksum -> GRUPO 2-5     p = %d | h =% d',p25,h25);
        disp(texto7);
        [p34,h34]= ranksum(GRUPO3(:,i),GRUPO4(:,i));
         texto8 = sprintf('ranksum -> GRUPO 3-4     p = %d | h =% d',p34,h34);
        disp(texto8);
        [p35,h35]= ranksum(GRUPO3(:,i),GRUPO5(:,i));
         texto9 = sprintf('ranksum -> GRUPO 3-5     p = %d | h =% d',p35,h35);
        disp(texto9);
        [p45,h45]= ranksum(GRUPO4(:,i),GRUPO5(:,i));
        texto10 = sprintf('ranksum -> GRUPO 4-5     p = %d | h =% d',p45,h45);
        disp(texto10);
    end    
    
end    

