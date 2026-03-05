/***************************************/
/* Demo 2: Working with the CAS Server */
/***************************************/

libname mydata "/home/student/workshop/Viya_Prog";

data mydata.orders_clean;
	set mydata.orders;
    Name=catx(' ',
              scan(Customer_Name,2,','),
              scan(Customer_Name,1,','));
run;

title "CAS Server Program";

proc contents data=mydata.orders;
run;

proc freq data=mydata.orders;
    tables Country OrderType;
run;

proc means data=mydata.orders;
    var RetailPrice;
    output out=mydata.orders_sum;
run;

title;
