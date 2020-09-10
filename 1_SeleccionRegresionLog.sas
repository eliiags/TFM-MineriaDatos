/********************* 
TFM - Mineria de Datos
Elianni Aguero Selva
*********************/


data setOriginales; set 'C:\Users\Daniel\Desktop\ELI\set4_train.sas7bdat';
run;

/***************************************
	Métodos de seleccion de variables
***************************************/

/* Set 4: Variables originales sin transformar. Método forward */
%randomselectlog(data=setOriginales, 
				 listclass=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						   REP_phase REP_primaryPurpose REP_region,
				 vardepen=status,
				 modelo=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						REP_phase REP_primaryPurpose REP_region enrollment max min collab countries IMP_arms,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=forward, directorio=C:\Users\Daniel\Desktop\ELI);
/*
Resultados
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_primaryPurpose REP_region enrollment max
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_region enrollment max min
*/

/* Set 4: Variables originales sin transformar. Método backward */
%randomselectlog(data=setOriginales, 
				 listclass=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						   REP_phase REP_primaryPurpose REP_region,
				 vardepen=status,
				 modelo=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						REP_phase REP_primaryPurpose REP_region enrollment max min collab countries IMP_arms,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=backward, directorio=C:\Users\Daniel\Desktop\ELI);
/*
Resultados
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_primaryPurpose REP_region enrollment max
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_region enrollment max min
*/

/* Set 4: Variables originales sin transformar. Método stepwise */
%randomselectlog(data=setOriginales, 
				 listclass=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						   REP_phase REP_primaryPurpose REP_region,
				 vardepen=status,
				 modelo=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType REP_masking 
						REP_phase REP_primaryPurpose REP_region enrollment max min collab countries IMP_arms,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=stepwise, directorio=C:\Users\Daniel\Desktop\ELI);
/*
Resultados
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_primaryPurpose REP_region enrollment max
	dmc REP_volunteers REP_interType REP_masking REP_phase REP_region enrollment max min
*/



data setTransformadas_aux; set 'C:\Users\Daniel\Desktop\ELI\set5_train.sas7bdat';
run;

data setTransformadas;
set setTransformadas_aux(rename=(TI_allocation1=allocation1 TI_allocation2=allocation2 TI_dmc1=dmc1 TI_dmc2=dmc2 TI_enrollType1=enrollType1 
								TI_enrollType2=enrollType2 TI_gender1=gender1 TI_gender2=gender2 TI_gender3=gender3 TI_OPT_enrollment1=enrollment1 
								TI_OPT_enrollment2=enrollment2 TI_OPT_IMP_arms1=arms1 TI_OPT_IMP_arms2=arms2 TI_OPT_max1=max1 TI_OPT_max2=max2 
								TI_OPT_min1=min1 TI_OPT_min2=min2 TI_OPT_min3=min3 TI_OPT_min4=min4 TI_REP_agency1=agency1 TI_REP_agency2=agency2 
								TI_REP_interModel1=interModel1 TI_REP_interModel2=interModel2 TI_REP_interModel3=interModel3 TI_REP_interModel4=interModel4 
							  	TI_REP_interType1=interType1 TI_REP_interType2=interType2 TI_REP_interType3=interType3 TI_REP_interType4=interType4 
								TI_REP_interType5=interType5 TI_REP_masking1=masking1 TI_REP_masking2=masking2 TI_REP_masking3=masking3 TI_REP_masking4=masking4 
								TI_REP_masking5=masking5 TI_REP_phase1=phase1 TI_REP_phase2=phase2 TI_REP_primaryPurpose1=primPurpose1 TI_REP_primaryPurpose2=primPurpose2 
								TI_REP_primaryPurpose3=primPurpose3 TI_REP_primaryPurpose4=primPurpose4 TI_REP_region1=region1 TI_REP_region2=region2 TI_REP_region3=region3 
								TI_REP_region4=region4 TI_REP_region5=region5 TI_REP_volunteers1=volunteers1 TI_REP_volunteers2=volunteers2));
run;


/* Set 5: Variables transformadas. Método forward */
%randomselectlog(data=setTransformadas, listclass=, vardepen=status,
				 modelo=collab countries enrollment IMP_arms LOG_collab max min SQR_countries allocation1 allocation2 dmc1 dmc2 enrollType1 enrollType2 
						gender1 gender2 gender3 enrollment1 enrollment2 arms1 arms2 max1 max2 min1 min2 min3 min4 agency1 agency2 interModel1 interModel2 
						interModel3 interModel4 interType1 interType2 interType3 interType4 interType5 masking1 masking2 masking3 masking4 masking5 phase1 
						phase2 primPurpose1 primPurpose2 primPurpose3 primPurpose4 region1 region2 region3 region4 region5 volunteers1 volunteers2,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=forward, directorio=C:\Users\eli\Desktop\TFM\MINER\TFM\LIB\);
/*
Resultados
	SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1
	SQR_countries allocation1 dmc2 enrollType1 enrollment2 min2 min4 agency1 interModel1 interType1 interType4 masking2 phase1 region3 region4 volunteers1
*/

/* Set 5: Variables transformadas. Método backward */
%randomselectlog(data=setTransformadas, 
				 listclass=,
				 vardepen=status,
				 modelo=collab countries enrollment IMP_arms LOG_collab max min SQR_countries allocation1 allocation2 dmc1 dmc2 enrollType1 enrollType2 
						gender1 gender2 gender3 enrollment1 enrollment2 arms1 arms2 max1 max2 min1 min2 min3 min4 agency1 agency2 interModel1 interModel2 
						interModel3 interModel4 interType1 interType2 interType3 interType4 interType5 masking1 masking2 masking3 masking4 masking5 phase1 
						phase2 primPurpose1 primPurpose2 primPurpose3 primPurpose4 region1 region2 region3 region4 region5 volunteers1 volunteers2,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=backward, directorio=C:\Users\Daniel\Desktop\ELI);
/*
Resultados
	enrollment allocation1 dmc1 enrollType1 enrollment1 min1 min2 min3 agency1 interModel1 interType1 interType3 interType4 masking2 phase1 primPurpose2 region1 region2 region4 volunteers1
	enrollment allocation1 dmc1 enrollType1 enrollment1 max1 min1 min2 min3 agency1 interModel1 interType1 interType3 interType4 masking2 phase1 primPurpose2 region1 region2 region4 volunteers1
*/

/* Set 5: Variables transformadas. Método stepwise */
%randomselectlog(data=setTransformadas, 
				 listclass=,
				 vardepen=status,
				 modelo=collab countries enrollment IMP_arms LOG_collab max min SQR_countries allocation1 allocation2 dmc1 dmc2 enrollType1 enrollType2 
						gender1 gender2 gender3 enrollment1 enrollment2 arms1 arms2 max1 max2 min1 min2 min3 min4 agency1 agency2 interModel1 interModel2 
						interModel3 interModel4 interType1 interType2 interType3 interType4 interType5 masking1 masking2 masking3 masking4 masking5 phase1 
						phase2 primPurpose1 primPurpose2 primPurpose3 primPurpose4 region1 region2 region3 region4 region5 volunteers1 volunteers2,
				 sinicio=112233, sfinal=112299, fracciontrain=0.8, metodo=stepwise, directorio=C:\Users\Daniel\Desktop\ELI);
/*
Resultados
	SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1
	SQR_countries allocation1 dmc2 enrollType1 enrollment2 min2 min4 agency1 interModel1 interType1 interType4 masking2 phase1 region3 region4 volunteers1
*/



/********************************************************
Modelos de regresión logística, se prueban todos los sets
********************************************************/

/* SET1 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=max min dmc1 dmc2 enrollment1 enrollment2 arms1 arms2 max1 max2 min1 min2 min3 min4 interModel1  
						interType1 interType5 masking2 phase1 phase2 region1 region2 region4 volunteers1 volunteers2,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset1; set final; modelo=1;

/* SET2 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=max dmc1 enrollment2 max1 min2 min3 masking1 region2 region4 volunteers2,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset2; set final; modelo=2;

/* SET3 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=enrollment min SQR_countries dmc1 enrollType1 enrollment1 max1 min2 min4  
						interModel3 masking5 phase1 region2 region4,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset3; set final; modelo=3;

/* SET4 */
%cruzadalogistica(archivo=setOriginales,
				  vardepen=status,
				  conti=enrollment max min collab countries IMP_arms,
				  categor=REP_agency allocation enrollType gender dmc REP_volunteers REP_interModel REP_interType 
						  REP_masking REP_phase REP_primaryPurpose REP_region,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset4; set final; modelo=4;

/* SET5 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=collab countries enrollment IMP_arms LOG_collab max min SQR_countries allocation1 allocation2 
						dmc1 dmc2 enrollType1 enrollType2 gender1 gender2 gender3 enrollment1 enrollment2 arms1 arms2 
						max1 max2 min1 min2 min3 min4 agency1 agency2 interModel1 interModel2 interModel3 interModel4 
						interType1 interType2 interType3 interType4 interType5 masking1 masking2 masking3 masking4 masking5 
						phase1 phase2 primPurpose1 primPurpose2 primPurpose3 primPurpose4 region1 region2 region3 region4 
						region5 volunteers1 volunteers2,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset5; set final; modelo=5;

/* SET6 */
%cruzadalogistica(archivo=setOriginales,
				  vardepen=status,
				  conti=enrollment max,
				  categor=dmc REP_volunteers REP_interType REP_masking REP_phase REP_primaryPurpose REP_region,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset6; set final; modelo=6;

/* SET7 */
%cruzadalogistica(archivo=setOriginales,
				  vardepen=status,
				  conti=max min,
				  categor=dmc REP_volunteers REP_interType REP_masking REP_phase REP_region,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset7; set final; modelo=7;

/* SET8 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=enrollment allocation1 dmc1 enrollType1 enrollment1 min1 min2 min3 
						agency1 interModel1 interType1 interType3 interType4 masking2 phase1 
						primPurpose2 region1 region2 region4 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset8; set final; modelo=8;

/* SET9 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=enrollment allocation1 dmc1 enrollType1 enrollment1 max1 min1 min2 min3 
						agency1 interModel1 interType1 interType3 interType4 masking2 phase1 
						primPurpose2 region1 region2 region4 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset9; set final; modelo=9;

/* SET10 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
						region5 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset10; set final; modelo=10;
	
/* SET11 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=SQR_countries allocation1 dmc2 enrollType1 enrollment2 min2 min4 agency1 
						interModel1 interType1 interType4 masking2 phase1 region3 region4 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=500500, sfinal=500530);
data finalset11; set final; modelo=11;	


/* Mostramos el gráfico */
ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
data unionsets; set finalset1 finalset2 finalset3 /*finalset4*/ finalset5 /*finalset6 finalset7*/ finalset8 finalset9 finalset10 finalset11;
proc boxplot data=unionsets; 
	plot media*modelo;
	label modelo = 'Sets';
	label media  = 'Tasa de fallos'; 
run;


/* Volvemos a realizar validacion cruzada */

/* SET8 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=enrollment allocation1 dmc1 enrollType1 enrollment1 min1 min2 min3 
						agency1 interModel1 interType1 interType3 interType4 masking2 phase1 
						primPurpose2 region1 region2 region4 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=900500, sfinal=900530);
data finalset8rep; set final; modelo=8;

/* SET9 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=enrollment allocation1 dmc1 enrollType1 enrollment1 max1 min1 min2 min3 
						agency1 interModel1 interType1 interType3 interType4 masking2 phase1 
						primPurpose2 region1 region2 region4 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=900500, sfinal=900530);
data finalset9rep; set final; modelo=9;


/* SET10 */
%cruzadalogistica(archivo=setTransformadas,
				  vardepen=status,
				  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
						interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
						region5 volunteers1,
				  categor=,
				  ngrupos=10, sinicio=900500, sfinal=900530);
data finalset10rep; set final; modelo=10;

ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
data unionsetsREP; set finalset8rep finalset9rep finalset10rep;
proc boxplot data=unionsetsREP; 
	plot media*modelo;
	label modelo = 'Sets';
	label media  = 'Tasa de fallos'; 
run;
