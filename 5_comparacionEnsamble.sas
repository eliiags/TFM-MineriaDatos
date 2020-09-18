/* SET10 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
						region5 volunteers1,
				  categor=,
				  ngrupos=5, sinicio=734784, sfinal=734794);
data f1; set final; modelo=1;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=734784, sfinal=734794, nodos=7,
					  algo=bprop mom=0.1 learn=0.1, acti=sin);
data f2; set final; modelo=2;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=734784, sfinal=734794, 
						objetivo=tasafallos);
data f3; set final; modelo=3;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.6,
						maxbranch=10, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=734784, sfinal=734794, 
						objetivo=tasafallos);
data f4; set final; modelo=4;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=734784, sfinal=734794, leafsize=61, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=61, objetivo=tasafallos);
data f5; set final; modelo=5;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=734784, sfinal=734794, 
			   kernel=lineal, c=0.5, directorio=c:, degree=2, k_par=1);
data f6; set final; modelo=6;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=734784, sfinal=734794, 
			   kernel=polynom, c=0.05, directorio=c:, degree=2, k_par=1);
data f7; set final; modelo=7;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=734784, sfinal=734794, 
			   kernel=RBF, c=0.1, directorio=c:, degree=4, k_par=0.5);
data f8; set final; modelo=8;

data union_todos;
set f1 f2 /*f3 f4*/ f5 /*f6 f7 f8*/; run;


ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_todos; 
	plot media*modelo;
	label modelo = 'Modelo';
	label media  = 'Tasa de fallos'; 
run;




/***************************************************************/
/***************************************************************/

%cruzadastackcon(archivo=setTransformadas, vardepen=status, listclass=, listconti=SQR_countries allocation1 dmc1 
						enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 
						masking2 phase1 region3 region4 region5 volunteers1, 
			     ngrupos=5, seminicio=254554, semifinal=254564, 
			     nodos=7, algo=bprop mom=0.1 learn=0.1, rediter=100, /*red*/
			     maxtrees=200, vars_to_try=4, trainfraction=0.6, leafsize=69, maxdepth=15,/*random forest */
	             bleafsize=61, iterations=100, bmaxbranch=2, bmaxdepth=15, shrinkage=0.05,/* g boosting*/
			   	 kernel=RBF, c=0.1, degree=2, k_par=0.5 /*SVM*/);


data cajas;
array ase{29};
set final;
do i=1 to 29;
modelo=i;
error=ase{i};
output;
end;
run;

proc sort data=cajas; by modelo; run;


ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=cajatres; 
	plot error*modelo;
	label modelo = 'Modelo';
	label error  = 'Error'; 
run;


data cajados;
set cajas; run;


data cajatres;   
	set  cajados; if modelo in (3, 5, 7, 9, 10, 12, 13, 14, 15, 18, 20, 21, 23, 24, 26, 27, 28) then delete; run;
