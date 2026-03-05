/*******************************************/
/* Demo 1: Working with the Compute Server */
/*******************************************/

libname mydata "s:\workshop";

data mydata.orders_clean;
	set mydata.orders;
    Name=catx(' ',
              scan(Customer_Name,2,','),
              scan(Customer_Name,1,','));
run;

title "Compute Server Program";

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
