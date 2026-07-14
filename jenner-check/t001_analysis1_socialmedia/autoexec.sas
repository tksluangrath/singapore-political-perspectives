/* cap input rows for the captured run */
options obs=100;

/* The original final.sas reads library.global_trends from an external
   disk (libname library "D:\MATH309\finalproject"). To make Analysis 1
   runnable in isolation, point `library` at a writable work path and seed
   a small mock global_trends with the exact columns Analysis 1 reads. The
   recoding, PROC MEANS and PROC LOGISTIC below are the author's own code,
   unchanged. */
libname library "%sysfunc(pathname(work))";

data library.global_trends;
  input country use_internet own_cell_standalone
        smeffect_changemind smeffect_awareness smimpact_manipulate;
  datalines;
14 2 1 2 4 8
14 1 1 4 4 3
14 1 1 3 2 8
14 2 2 2 3 3
14 2 1 8 1 8
14 2 1 4 9 1
14 2 1 4 4 1
14 1 1 2 2 3
14 2 2 2 2 3
14 1 2 4 1 2
14 1 2 4 4 1
14 1 1 4 2 1
14 2 1 3 2 8
14 1 1 1 4 2
14 1 1 8 2 1
14 1 1 3 1 3
14 1 1 1 1 8
14 1 1 3 2 2
14 1 1 3 9 3
14 1 1 8 1 2
14 1 1 2 2 8
14 1 1 8 3 3
14 1 1 4 1 8
14 1 1 3 2 8
14 1 1 4 9 3
14 2 1 2 9 1
14 1 2 4 9 3
14 1 1 2 9 1
14 2 1 3 1 1
14 1 1 2 9 3
14 1 1 1 3 1
14 1 2 8 2 8
14 1 2 3 1 2
14 1 1 8 2 1
14 2 1 4 2 2
14 1 1 8 1 1
14 2 1 2 1 3
14 1 2 2 2 2
14 1 2 2 9 8
14 1 1 1 2 1
22 1 1 3 3 2
22 2 2 2 4 3
1 2 2 3 4 3
1 2 2 3 1 3
22 1 1 4 1 3
;
run;
