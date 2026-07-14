/* cap input rows for the captured run */
options obs=100;

/* Original final.sas reads library.global_trends from an external disk
   (libname library "D:\MATH309\finalproject"). To run Analysis 3 in
   isolation, point `library` at a writable work path and seed a small mock
   global_trends with the exact columns Analysis 3 reads. The recoding and
   PROC LOGISTIC below are the author's own code, unchanged. */
libname library "%sysfunc(pathname(work))";

data library.global_trends;
  input country fav_china intl_system growinflu_china
        relations_china china_politics confid_xi;
  datalines;
14 1 8 2 3 3 8
14 4 1 8 4 1 8
14 1 2 1 4 1 4
14 3 2 3 3 2 3
14 3 1 1 1 1 4
14 3 1 1 8 2 4
14 4 2 8 8 3 4
14 4 8 3 4 1 4
14 2 2 8 4 2 1
14 4 8 1 2 1 8
14 3 2 2 4 9 8
14 3 1 2 8 2 3
14 4 2 3 3 3 3
14 8 8 8 4 4 3
14 8 1 8 3 2 8
14 1 2 1 2 4 8
14 8 8 1 8 2 2
14 4 1 8 2 2 3
14 4 2 1 8 9 3
14 2 1 2 8 9 4
14 1 2 2 4 4 4
14 1 1 2 2 4 3
14 1 2 8 2 9 1
14 8 8 2 4 2 1
14 3 1 2 4 3 4
14 2 8 2 4 2 4
14 2 1 3 4 4 8
14 3 2 2 2 4 8
14 2 2 3 1 2 8
14 8 8 8 3 9 2
14 4 1 3 2 3 2
14 2 1 8 2 4 4
14 8 1 1 1 4 1
14 3 8 3 1 9 3
14 2 2 8 8 4 2
14 8 8 2 8 2 3
14 4 1 1 2 3 4
14 3 1 8 2 4 4
14 8 8 3 8 4 1
14 4 8 8 1 3 2
22 2 2 2 2 3 3
7 1 2 3 2 4 2
7 1 1 1 3 2 2
22 2 1 3 1 1 3
1 1 2 1 1 2 4
;
run;
