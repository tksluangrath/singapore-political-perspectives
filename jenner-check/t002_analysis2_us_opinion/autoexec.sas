/* cap input rows for the captured run */
options obs=100;

/* Original final.sas reads library.global_trends from an external disk
   (libname library "D:\MATH309\finalproject"). To run Analysis 2 in
   isolation, point `library` at a writable work path and seed a small mock
   global_trends with the exact columns Analysis 2 reads. The recoding,
   PROC MEANS and PROC LOGISTIC below are the author's own code, unchanged. */
libname library "%sysfunc(pathname(work))";

data library.global_trends;
  input country use_internet own_cell_standalone
        fav_US growinflu_us reliable_US afg_handle;
  datalines;
14 1 1 4 3 3 4
14 1 2 3 3 9 5
14 1 1 2 1 2 1
14 1 2 4 8 3 5
14 1 2 1 3 3 3
14 1 1 3 2 1 1
14 1 1 8 8 9 5
14 1 2 1 3 2 4
14 1 1 8 2 3 2
14 1 1 8 2 3 1
14 2 2 8 3 9 4
14 1 1 2 1 9 5
14 1 1 4 2 4 4
14 1 1 3 3 2 5
14 1 1 3 3 4 4
14 1 1 4 8 9 4
14 1 1 4 1 4 8
14 1 1 8 1 4 4
14 1 1 1 3 2 8
14 1 1 8 3 4 8
14 2 1 8 2 2 1
14 1 1 8 8 2 3
14 1 1 2 3 1 4
14 1 1 4 8 2 3
14 1 2 3 8 4 5
14 1 1 2 1 9 3
14 1 1 2 2 9 3
14 2 1 1 1 3 2
14 2 2 1 8 9 1
14 1 2 8 1 9 1
14 2 2 8 8 4 5
14 1 1 3 2 9 1
14 2 1 1 8 1 5
14 1 1 2 8 1 2
14 2 2 4 1 3 5
14 1 1 8 2 2 8
14 1 1 4 8 4 8
14 1 2 1 2 4 2
14 1 1 3 2 4 4
14 2 1 8 2 2 8
1 1 2 3 1 2 1
1 2 2 2 2 2 3
7 2 1 3 1 3 4
1 1 1 2 1 2 4
22 2 2 2 3 3 3
;
run;
