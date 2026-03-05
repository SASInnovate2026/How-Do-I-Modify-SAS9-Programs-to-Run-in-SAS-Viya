/***************************************/
/* Demo 2: Working with the CAS Server */
/***************************************/

cas mySession;

caslib mycas path="/home/student/workshop/Viya_Prog" libref=mycas;

libname mydata "/home/student/workshop/Viya_Prog";

proc casutil;
    load casdata="orders.sashdat" incaslib="mycas" 
         outcaslib="mycas" casout="orders" replace; 
run;

data mycas.orders_clean;
	set mycas.orders;
    Name=catx(' ',
              scan(Customer_Name,2,','),
              scan(Customer_Name,1,','));
run;

title "CAS Server Program";

proc contents data=mycas.orders;
run;

proc freqtab data=mycas.orders;
    tables Country OrderType;
run;

proc mdsummary data=mycas.orders;
    var RetailPrice;
    output out=mycas.orders_sum;
run;

title;
