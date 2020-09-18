/*********************
Elianni Aguero Selva
TFM - Mineria de Datos
*********************/


/*****************************************
******************************************
              BAGGING
******************************************
*****************************************/


/**********************************************
  TAMANNO HOJAS PROFUNDIDAD 5
***********************************************/
%macro tamannoHojas;
	%do num=5 %to 70 %by 4;
  	%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
    						conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
	  						maxtrees=200, variables=18, porcenbag=0.8,
	  						maxbranch=2, tamhoja=&num, maxdepth=5, pvalor=0.01,
	  						ngrupos=5, sinicio=223345, sfinal=223350, 
	  						objetivo=tasafallos);
    data finaln&num; set final; modelo=&num; run;
  %end;
%mend;

data union; set finaln5  finaln9  finaln13 finaln17 finaln21 finaln25 finaln29 finaln33 
				finaln37 finaln41 finaln45 finaln49 finaln53 finaln57 finaln61 finaln65 
				finaln69; run;
        
proc boxplot data=union; 
	plot media*modelo;
	label modelo = 'Tamaño hojas';
	label media  = 'Tasa de fallos'; 
run;



/**********************************************
  TAMANNO HOJAS PROFUNDIDAD 10
***********************************************/
%macro tamannoHojas;
	%do num=5 %to 70 %by 4;
  	%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
    						conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
	  						maxtrees=200, variables=18, porcenbag=0.8,
	  						maxbranch=2, tamhoja=&num, maxdepth=10, pvalor=0.01,
	  						ngrupos=5, sinicio=223345, sfinal=223350, 
	  						objetivo=tasafallos);
    data finaln&num; set final; modelo=&num; run;
  %end;
%mend;

data union; set finaln5  finaln9  finaln13 finaln17 finaln21 finaln25 finaln29 finaln33 
				finaln37 finaln41 finaln45 finaln49 finaln53 finaln57 finaln61 finaln65 
				finaln69; run;
        
proc boxplot data=union; 
	plot media*modelo;
	label modelo = 'Tamaño hojas';
	label media  = 'Tasa de fallos'; 
run;


/**********************************************
  TAMANNO HOJAS PROFUNDIDAD 15
***********************************************/
%macro tamannoHojas;
	%do num=5 %to 70 %by 4;
  	%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
    						conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
	  						maxtrees=200, variables=18, porcenbag=0.8,
	  						maxbranch=2, tamhoja=&num, maxdepth=15, pvalor=0.01,
	  						ngrupos=5, sinicio=223345, sfinal=223350, 
	  						objetivo=tasafallos);
    data finaln&num; set final; modelo=&num; run;
  %end;
%mend;

data union; set finaln5  finaln9  finaln13 finaln17 finaln21 finaln25 finaln29 finaln33 
				finaln37 finaln41 finaln45 finaln49 finaln53 finaln57 finaln61 finaln65 
				finaln69; run;
        
proc boxplot data=union; 
	plot media*modelo;
	label modelo = 'Tamaño hojas';
	label media  = 'Tasa de fallos'; 
run;


/************************************
porcentaje de observaciones
*************************************/
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M1_001; set final; modelo=50;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M1_005; set final; modelo=60;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.7,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M1_01; set final; modelo=70;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M1_05; set final; modelo=80;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.9,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M1_09; set final; modelo=90;

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M2_001; set final; modelo=50;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M2_005; set final; modelo=60;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.7,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M2_01; set final; modelo=70;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M2_05; set final; modelo=80;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.9,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M2_09; set final; modelo=90;

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M3_001; set final; modelo=50;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M3_005; set final; modelo=60;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.7,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M3_01; set final; modelo=70;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M3_05; set final; modelo=80;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.9,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=891312, sfinal=891320, 
						objetivo=tasafallos);
data M3_09; set final; modelo=90;

data union; set M1_001 M1_005 M1_01 M1_05 M1_09
				M2_001 M2_005 M2_01 M2_05 M2_09
				M3_001 M3_005 M3_01 M3_05 M3_09; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_aux; 
	plot media*m;
	label m = '% de observaciones';
	label media  = 'Tasa de fallos'; 
run;

data union_aux;
	set union;
	if modelo = 50 then do; m='50%'; end;
	if modelo = 60 then do; m='60%'; end;
	if modelo = 70 then do; m='70%'; end;
	if modelo = 80 then do; m='80%'; end;
	if modelo = 90 then do; m='90%'; end;
run;


/*************************************
p-valor
*************************************/
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M1_p1; set final; modelo='0.01';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.2,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M1_p2; set final; modelo='0.2';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.9,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M1_p9; set final; modelo='0.9';

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M2_p1; set final; modelo='0.01';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.2,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M2_p2; set final; modelo='0.2';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.9,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M2_p9; set final; modelo='0.9';

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M3_p1; set final; modelo='0.01';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.2,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M3_p2; set final; modelo='0.2';
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.9,
						ngrupos=5, sinicio=558132, sfinal=558137, 
						objetivo=tasafallos);
data M3_p9; set final; modelo='0.9';

data union; set M1_p1 M1_p2 M1_p9
				M2_p1 M2_p2 M2_p9
				M3_p1 M3_p2 M3_p9; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union; 
	plot media*modelo;
	label modelo = 'p-valor';
	label media  = 'Tasa de fallos'; 
run;






/*****************************************
******************************************
              RANDOM FOREST
******************************************
*****************************************/

/****************************
    variables
*****************************/
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=3, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v3; set final; modelo=3;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v4; set final; modelo=4;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=5, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v5; set final; modelo=5;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=6, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v6; set final; modelo=6;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=7, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v7; set final; modelo=7;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=8, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v8; set final; modelo=8;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=9, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v9; set final; modelo=9;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=10, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v10; set final; modelo=10;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=11, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v11; set final; modelo=11;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=12, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v12; set final; modelo=12;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=13, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v13; set final; modelo=13;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=14, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v14; set final; modelo=14;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=15, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v15; set final; modelo=15;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=16, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v16; set final; modelo=16;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=17, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v17; set final; modelo=17;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M1_v18; set final; modelo=18;


data union_uno; set M1_v3 M1_v4 M1_v5 M1_v6 M1_v7 M1_v8 M1_v9 M1_v10 M1_v11 
				M1_v12 M1_v13 M1_v14 M1_v15 M1_v16 M1_v17 M1_v18; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_uno; 
	plot media*modelo;
	label modelo = 'Número de variables';
	label media  = 'Tasa de fallos'; 
run;


%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=3, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v3; set final; modelo=3;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v4; set final; modelo=4;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=5, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v5; set final; modelo=5;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=6, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v6; set final; modelo=6;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=7, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v7; set final; modelo=7;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=8, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v8; set final; modelo=8;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=9, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v9; set final; modelo=9;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=10, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v10; set final; modelo=10;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=11, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v11; set final; modelo=11;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=12, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v12; set final; modelo=12;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=13, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v13; set final; modelo=13;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=14, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v14; set final; modelo=14;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=15, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v15; set final; modelo=15;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=16, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v16; set final; modelo=16;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=17, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v17; set final; modelo=17;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M2_v18; set final; modelo=18;

data union_dos; set M2_v3 M2_v4 M2_v5 M2_v6 M2_v7 M2_v8 M2_v9 M2_v10 M2_v11 
				M2_v12 M2_v13 M2_v14 M2_v15 M2_v16 M2_v17 M2_v18; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_dos; 
	plot media*modelo;
	label modelo = 'Número de variables';
	label media  = 'Tasa de fallos'; 
run;


%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=3, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v3; set final; modelo=3;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v4; set final; modelo=4;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=5, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v5; set final; modelo=5;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=6, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v6; set final; modelo=6;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=7, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v7; set final; modelo=7;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=8, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v8; set final; modelo=8;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=9, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v9; set final; modelo=9;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=10, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v10; set final; modelo=10;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=11, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v11; set final; modelo=11;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=12, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v12; set final; modelo=12;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=13, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v13; set final; modelo=13;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=14, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v14; set final; modelo=14;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=15, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v15; set final; modelo=15;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=16, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v16; set final; modelo=16;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=17, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v17; set final; modelo=17;
%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=18, porcenbag=0.6,
						maxbranch=2, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=724747, sfinal=724752, 
						objetivo=tasafallos);
data M3_v18; set final; modelo=18;

data union_tres; set M3_v3 M3_v4 M3_v5 M3_v6 M3_v7 M3_v8 M3_v9 M3_v10 M3_v11 
				M3_v12 M3_v13 M3_v14 M3_v15 M3_v16 M3_v17 M3_v18; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_tres; 
	plot media*modelo;
	label modelo = 'Número de variables';
	label media  = 'Tasa de fallos'; 
run;




/******************************
  repeticion
*****************************/

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=7, porcenbag=0.8,
						maxbranch=2, tamhoja=25, maxdepth=5, pvalor=0.01,
						ngrupos=10, sinicio=2254684, sfinal=2254694, 
						objetivo=tasafallos);
data M1_a2; set final; modelo='M1';

%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.5,
						maxbranch=2, tamhoja=61, maxdepth=10, pvalor=0.01,
						ngrupos=10, sinicio=2254684, sfinal=2254694, 
						objetivo=tasafallos);
data M2_a2; set final; modelo='M2';


%cruzadarandomforestbin(archivo=setTransformadas, vardep=status, 
								conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
								interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
								region5 volunteers1, categor=, 
						maxtrees=200, variables=4, porcenbag=0.6,
						maxbranch=10, tamhoja=69, maxdepth=15, pvalor=0.01,
						ngrupos=5, sinicio=2254684, sfinal=2254694, 
						objetivo=tasafallos);
data M3_a2; set final; modelo='M3';

data union; set M1_a2 M2_a2 M3_a2; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union; 
	plot media*modelo;
	label modelo = 'Modelos';
	label media  = 'Tasa de fallos'; 
run;





/*****************************************
******************************************
              GRADIENT BOOSTING
******************************************
*****************************************/

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.001, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final101; set final; modelo='0.001';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.01, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final102; set final; modelo='0.01';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.03, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final103; set final; modelo='0.03';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final104; set final; modelo='0.05';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.1, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final105; set final; modelo='0.1';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=50,
				     shrink=0.3, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final106; set final; modelo='0.3';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.001, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final111; set final; modelo='0.001';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.01, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final112; set final; modelo='0.01';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.03, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final113; set final; modelo='0.03';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final114; set final; modelo='0.05';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.1, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final115; set final; modelo='0.1';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.3, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final116; set final; modelo='0.3';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.001, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final121; set final; modelo='0.001';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.01, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final122; set final; modelo='0.01';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.03, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final123; set final; modelo='0.03';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final124; set final; modelo='0.05';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.1, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final125; set final; modelo='0.1';

%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=300,
				     shrink=0.3, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final126; set final; modelo='0.3';



data union_boosting_v; 
set /*final101 final102*/ final103 final104 final105 final106
	/*final111 final112*/ final113 final114 final115 final116
	/*final121*/ final122 final123 final124 final125 /*final126*/; run;


ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_boosting_v; 
	plot media*modelo;
	label modelo = 'shrink';
	label media  = 'Tasa de fallos'; 
run;






%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=5, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=5, objetivo=tasafallos);
data final205; set final; modelo=5;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=9, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=9, objetivo=tasafallos);
data final209; set final; modelo=9;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=13, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=13, objetivo=tasafallos);
data final213; set final; modelo=13;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=17, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=17, objetivo=tasafallos);
data final217; set final; modelo=17;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=21, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=21, objetivo=tasafallos);
data final221; set final; modelo=21;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=25, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=25, objetivo=tasafallos);
data final225; set final; modelo=25;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=29, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=29, objetivo=tasafallos);
data final229; set final; modelo=29;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=33, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=33, objetivo=tasafallos);
data final233; set final; modelo=33;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=37, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=37, objetivo=tasafallos);
data final237; set final; modelo=37;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=41, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=41, objetivo=tasafallos);
data final241; set final; modelo=41;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=45, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=45, objetivo=tasafallos);
data final245; set final; modelo=45;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=49, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=49, objetivo=tasafallos);
data final249; set final; modelo=49;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=53, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=53, objetivo=tasafallos);
data final253; set final; modelo=53;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=57, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=57, objetivo=tasafallos);
data final257; set final; modelo=57;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=61, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=61, objetivo=tasafallos);
data final261; set final; modelo=61;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=65, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=65, objetivo=tasafallos);
data final265; set final; modelo=65;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=69, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=69, objetivo=tasafallos);
data final269; set final; modelo=69;


data union_hojas;
set final205 final209 final213 final217 final221 final225 final229 final233 final237 final241 final245
	final249 final253 final257 final261 final265 final269; run;



ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_hojas; 
	plot media*modelo;
	label modelo = 'Tamaño de hojas';
	label media  = 'Tasa de fallos'; 
run;


%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=61, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=5, mincatsize=15, minobs=61, objetivo=tasafallos);
data final2611; set final; modelo=1;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=61, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=10, mincatsize=15, minobs=61, objetivo=tasafallos);
data final2612; set final; modelo=2;
%cruzadatreeboostbin(archivo=setTransformadas, vardepen=status,
					 conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						   interModel1 interType1 interType3 interType4 masking2 phase1 region3 
						   region4 region5 volunteers1, categor=,
					 ngrupos=5, sinicio=123456, sfinal=123460, leafsize=61, iteraciones=100,
				     shrink=0.05, maxbranch=2, maxdepth=15, mincatsize=15, minobs=61, objetivo=tasafallos);
data final2613; set final; modelo=3;


data union_kjdfsf;
	set final2611 final2612 final2613; run;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_kjdfsf; 
	plot media*modelo;
	label modelo = 'Tamaño de hojas';
	label media  = 'Tasa de fallos'; 
run;











