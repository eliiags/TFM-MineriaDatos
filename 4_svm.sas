

%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=239944, sfinal=239950, 
			   kernel=lineal, c=0.05, directorio=c:, degree=2, k_par=1);
data final1; set final; modelo=1;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=lineal, c=0.1, directorio=c:, degree=2, k_par=1);
data final2; set final; modelo=2;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=249944, sfinal=249950, 
			   kernel=lineal, c=0.5, directorio=c:, degree=2, k_par=1);
data final3; set final; modelo=3;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=259944, sfinal=259950, 
			   kernel=lineal, c=1, directorio=c:, degree=2, k_par=1);
data final4; set final; modelo=4;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=lineal, c=5, directorio=c:, degree=2, k_par=1);
data final5; set final; modelo=5;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=269944, sfinal=269950, 
			   kernel=lineal, c=10, directorio=c:, degree=2, k_par=1);
data final6; set final; modelo=6;




%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=0.05, directorio=c:, degree=2, k_par=1);
data final7; set final; modelo=7;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=0.1, directorio=c:, degree=3, k_par=1);
data final8; set final; modelo=8;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=0.5, directorio=c:, degree=2, k_par=1);
data final9; set final; modelo=9;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=1, directorio=c:, degree=3, k_par=1);
data final10; set final; modelo=10;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=5, directorio=c:, degree=2, k_par=1);
data final11; set final; modelo=11;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=polynom, c=10, directorio=c:, degree=3, k_par=1);
data final12; set final; modelo=12;



%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=RBF, c=0.05, directorio=c:, degree=3, k_par=1);
data final13; set final; modelo=13;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=239944, sfinal=239950, 
			   kernel=RBF, c=0.1, directorio=c:, degree=4, k_par=0.5);
data final14; set final; modelo=14;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=RBF, c=0.5, directorio=c:, degree=3, k_par=1);
data final15; set final; modelo=15;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=RBF, c=1, directorio=c:, degree=4, k_par=5);
data final16; set final; modelo=16;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=RBF, c=5, directorio=c:, degree=3, k_par=1);
data final17; set final; modelo=17;
%cruzadaSVMbin(archivo=setTransformadas, vardepen=status,
			   listclass=,
			   listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 region5 volunteers1,
			   ngrupos=5, sinicio=229944, sfinal=229950, 
			   kernel=RBF, c=10, directorio=c:, degree=4, k_par=5);
data final18; set final; modelo=18;



data union_svm;
set final1 final2 final3 final4 final5 final6 
	final7 final8 final9 final10 final11 final12 
	final13 final14 final15 final16 final17; run;




ods html close; 
ods preferences;
ods graphics on / reset=all;
ods graphics off;
proc boxplot data=union_svm; 
	plot media*modelo;
	label modelo = 'Modelo';
	label media  = 'Tasa de fallos'; 
run;

