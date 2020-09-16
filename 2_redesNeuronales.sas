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


/******************************************
  MODELOS REDES NEURONALES
*******************************************/
  * Ordenamos el conjutno ;
  proc sort data=setTransformadas; by status; run;
  proc surveyselect data=setTransformadas out=muestra outall N=3596 seed=123456;
    strata status / alloc=proportional; 
  run;
  data train valida; set muestra; if selected=1 then output train; else output valida; run;

  /* CATALOGO */
  PROC DMDB DATA=setTransformadas dmdbcat=setTransformadasCat;
  target status ;
  var SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
    interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
    region5 volunteers1;
  class status;
  run;

/******************************************
  MISC POR NUMERO DE NODOS
*******************************************/
  data union; run;
  %macro nodos;
    %do nodos=1 %to 15;
      proc neural data=setTransformadas dmdbcat=setTransformadasCat;
        input SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 min4 agency2 
            interModel1 interType1 interType3 interType4 masking2 phase1 region3 region4 
            region5 volunteers1 ;
        target status / level=nominal;
        hidden &nodos;
        prelim 2 preiter=3;
        train tech=levmar;
        score data=setTransformadas out=salpredi outfit=salfit;
      run;
      data salfit; set salfit; nodos=&nodos; if _n_=2 then output;
      data union; set union salfit; run;
    %end;
  %mend;

  %nodos

  data union_numNodos; set union; if _n_=1 then delete; run;

  /* GRAFICO */
  proc print data=union_numNodos; run;
  legend1 label=none frame;                                                                                                               
  axis1 label=("nº nodos") minor=none offset=(1,1);                                                                                     
  axis2 label=(angle=90 "MISC");  

  title j=c 'RASE x número de nodos';
  symbol i=join v=circle;
  proc gplot data=union_numNodos;
  plot (_MISC_)*nodos / overlay legend=legend1                                                                               
                      haxis=axis1 vaxis=axis2; 
  run;


/******************************************
  VALIDACION CRUZADA NUMERO DE NODOS
*******************************************/
  %macro nodosvalcruza(ini= ,fin= , increme=, data=, vardepen=, conti=, categor=);

    %do nod=&ini %to &fin %by &increme;
      %cruzadabinarianeural(archivo=&data, vardepen=&vardepen, conti=&conti, categor=&categor, 
                                ngrupos=5, sinicio=113355, sfinal=113360, 
                                nodos=&nod, algo=levmar, early=300, acti=tanh, 
                  objetivo=);
      data finaln&nod; set final; modelo=&nod; run;
    %end;

    data union;
      set %do i=&ini %to &fin %by &increme; 
          finaln&i 
        %end;
  %mend;

  data union; set finaln1 finaln2 finaln3 finaln4 finaln5 finaln6 finaln7 finaln8 finaln9; run;
  proc boxplot data=union; 
    plot media*modelo;
    label modelo = 'Número de nodos';
    label media  = 'Tasa de fallos'; 
  run;

  %nodosvalcruza(ini=1,fin=15,increme=1, data=setTransformadas, vardepen=status,
           conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2 
             min4 agency2 interModel1 interType1 interType3 interType4 
             masking2 phase1 region3 region4 region5 volunteers1,
           categor=);

  ods graphics on / reset=all;
  ods graphics off;
  proc print data=union;run;
  proc boxplot data=union; plot media*modelo; run;



/******************************************
    ALGORITMO DE OPTIMIZACION
*******************************************/
  * LEVMAR ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=levmar);
  data final1; set final; modelo=1;
  * QUANEW ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=quanew);
  data final2; set final; modelo=2;
  * CONGRA ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=congra);
  data final3; set final; modelo=3;
  * DBLDOG ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=dbldog);	
  data final4; set final; modelo=4;					  
  * TRUREG ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=trureg);
  data final5; set final; modelo=5;					  
  * BPROP 1 ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=bprop mom=0.9 learn=0.1);
  data final6; set final; modelo=6;
  * BPROP 2 ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=997755, sfinal=997765, nodos=7,
              algo=bprop mom=0.2 learn=0.5);
  data final7; set final; modelo=7;

  /* GRAFICO */
  ods graphics on / reset=all;
  ods graphics off;
  data unionRedesAlgo; set final1 final2 final3 final4 final5 final6 final7;
  proc boxplot data=unionRedesAlgo; 
    plot media*m;
    label m = 'Modelos: Algoritmo de optimización';
    label media  = 'Tasa de fallos'; 
  run;


/******************************************
    FUNCION DE ACTIVACION
*******************************************/
  * TANH ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=tanh);
  data final1; set final; modelo='tanh';
  * SOF ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=sof);
  data final2; set final; modelo='sof';
  * log ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=log);
  data final3; set final; modelo='log';
  * ARC ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=arc);
  data final4; set final; modelo='arc';
  * TAN ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=tan);
  data final5; set final; modelo='tan';
  * SIN ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=sin);
  data final6; set final; modelo='sin';
  * GAU ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=gau);
  data final7; set final; modelo='gau';
  * EXP ;
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=446655, sfinal=446665, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=exp);
  data final8; set final; modelo='exp';

  /* GRAFICO */
  ods graphics on / reset=all;
  ods graphics off;
  data unionRedesFA_bprop2; set final1 /*final2 final3*/ final4 /*final5*/ final6 /*final7*/ final8;
  proc boxplot data=unionRedesFA_bprop2; 
    plot media*modelo;
    label modelo = 'Modelos: Función de activación';
    label media  = 'Tasa de fallos'; 
  run;



/******************************************
    VARIANDO PARAMETROS
*******************************************/
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=224466, sfinal=224476, nodos=7,
					  algo=bprop mom=0.1 learn=0.1, acti=sin);
data f1; set final; modelo=1;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=453210, sfinal=453215, nodos=7,
					  algo=bprop mom=0.1 learn=0.1, acti=sin);
data f2; set final; modelo=2;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=224466, sfinal=224476, nodos=7,
					  algo=bprop mom=0.9 learn=0.1, acti=sin);
data f3; set final; modelo=3;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=453210, sfinal=453215, nodos=7,
					  algo=bprop mom=0.9 learn=0.1, acti=sin);
data f4; set final; modelo=4;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=224466, sfinal=224476, nodos=7,
					  algo=bprop mom=0.5 learn=0.2, acti=sin);
data f5; set final; modelo=5;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=453210, sfinal=453215, nodos=7,
					  algo=bprop mom=0.5 learn=0.2, acti=sin);
data f6; set final; modelo=6;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=224466, sfinal=224476, nodos=7,
					  algo=bprop mom=0.2 learn=0.5, acti=sin);
data f7; set final; modelo=7;
%cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
					  conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
							min4 agency2 interModel1 interType1 interType3 interType4
							masking2 phase1 region3 region4 region5 volunteers1, categor=,
					  ngrupos=5, sinicio=453210, sfinal=453215, nodos=7,
					  algo=bprop mom=0.2 learn=0.5, acti=sin);
data f8; set final; modelo=8;


ods graphics on / reset=all;
ods graphics off;
data nuevos_bprop; set f1 f2 f3 f4 f5 f6 f7 f8;
proc boxplot data=nuevos_bprop; 
	plot media*modelo;
	label modelo = 'Modelos: bprop';
	label media  = 'Tasa de fallos'; 
run;



/* EARLY STOPPING */
  %redneuronalbinaria(archivo=SetTransformadas, 
            listclass=,
              listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1,
            vardep=status, 
            porcen=0.80, semilla=654321, ocultos=7, meto=bprop mom=0.1 learn=0.1, acti=sin);
/* EARLY STOPPING */
  %redneuronalbinaria(archivo=SetTransformadas, 
            listclass=,
              listconti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1,
            vardep=status, 
            porcen=0.80, semilla=987653, ocultos=7, meto=bprop mom=0.1 learn=0.1, acti=sin);


  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=452454, sfinal=452464, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=sin);
  data fi1; set final; modelo='sin early';
  %cruzadabinarianeural(archivo=SetTransformadas, vardepen=status,
              conti=SQR_countries allocation1 dmc1 enrollType1 enrollment2 min2
                min4 agency2 interModel1 interType1 interType3 interType4
                masking2 phase1 region3 region4 region5 volunteers1, categor=,
              ngrupos=5, sinicio=452454, sfinal=452464, nodos=7,
              algo=bprop mom=0.2 learn=0.5, acti=sin, early=160);
  data fi2; set final; modelo='con early';

  data ultimo_redes; set fi1 fi2;
  proc boxplot data=ultimo_redes; 
    plot media*modelo;
    label modelo = 'Modelos: bprop';
    label media  = 'Tasa de fallos'; 
  run;







