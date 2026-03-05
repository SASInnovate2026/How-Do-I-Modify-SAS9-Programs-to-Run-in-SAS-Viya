/************************************************/
/* Demo 3: Understanding Caslib and Table Scope */
/************************************************/

cas mySession;

caslib myglbl path=”/home/student/workshop/Viya_Prog/Global” libref=myglbl global;

proc casutil;
    load casdata=”orders.sas7bdat” incaslib=”myglbl”
         outcaslib=”myglbl” casout=”glbl_orders” promote; 
quit;

data myglbl.glbl_orders_clean (promote=yes);
	set myglbl.glbl_orders;
    Name=catx(' ',
              scan(Customer_Name,2,','),
              scan(Customer_Name,1,','));
run;
