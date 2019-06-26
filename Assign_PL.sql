1
---------------------------------------------------------------------------------
1.1
DECLARE
V_Sample1 NUMBER(2);
V_Sample2 CONSTANT NUMBER(2):=2 ;
V_Sample3 NUMBER(2) NOT NULL :=3;
V_Sample4 NUMBER(2) := 50;
V_Sample5 NUMBER(2);

answer:at line no 2 and three

----------------------------------------------------------------------------------------------------------------------------
1.2
set serveroutput on;
DECLARE --outer block
var_num1 NUMBER := 5;
BEGIN

DECLARE --inner block
var_num1 NUMBER := 10;
BEGIN
DBMS_OUTPUT.PUT_LINE('Value for var_num1:' ||var_num1);
--Can outer block variable (var_num1) be printed here.IfYes,Print the same.
END;
--Can inner block variable(var_num1)  be printed here.IfYes,Print the same.

END;

answer:-inner block variable will be print with value 10

---------------------------------------------------------------------------------------------------------------
1.3

declare
cursor display is select * from emp where empno=101 ;
val emp%rowtype;
BEGIN
open display;
loop
 fetch display into val;
 DBMS_OUTPUT.PUT_LINE(val.empno||' '||val.ename||' '||val.job||' '||val.mgr||' '||val.hiredate||' '||val.sal||' '||val.comm||' '||val.deptno);
 
 exit 
 when display%notfound;
 end loop;
 close display;
 end;

--------------------------------------------------------------------------------------------------------------------------------------------------------
1.4

declare
cursor display is select * from emp where empno=&no;
val emp%rowtype;
BEGIN
open display;
loop
 fetch display into val;
 DBMS_OUTPUT.PUT_LINE(val.empno||' '||val.ename||' '||val.job||' '||val.mgr||' '||val.hiredate||' '||val.sal||' '||val.comm||' '||val.deptno); 
 exit 
 when display%notfound;
 end loop;
 close display;
 end;

----------------------------------------------------------------------------------------------------------------------------------------------------------
1.5

declare
cursor display is select * from emp;
val emp%rowtype;
BEGIN
open display;
loop
 fetch display into val;
 if(5000>val.sal*30/100)then
 DBMS_OUTPUT.PUT_LINE(val.sal+val.sal*30/100);
 else
 DBMS_OUTPUT.PUT_LINE(val.sal+5000); 
 end if;
 --DBMS_OUTPUT.PUT_LINE(val.empno||' '||val.ename||' '||val.job||' '||val.mgr||' '||val.hiredate||' '||val.sal||' '||val.comm||' '||val.deptno); 
 exit 
 when display%notfound;
 end loop;
 close display;
 end;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
2
-------------------------------------------------------------------------------------------------------------------------------------------------------------
2.1

DECLARE
V_BONUS staff_master.staff_SAL%TYPE;
V_SAL STAFF_MASTER.STAFF_SAL%TYPE;

BEGIN
SELECT STAFF_SAL INTO V_SAL
FROM STAFF_MASTER 
WHERE staff_CODE=101;

V_BONUS:=2*V_SAL;
DBMS_OUTPUT.PUT_LINE('STAFF SALARY IS ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('STAFF BONUS IS ' || V_BONUS);

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('GIVEN CODE IS NOT VALID.ENTER VALID CODE');
END;

answer:-at line first should be use the name of table with field.      
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

2.2

DECLARE
V_BONUS staff_master.staff_SAL%TYPE;
V_SAL STAFF_MASTER.STAFF_SAL%TYPE;

BEGIN
SELECT STAFF_SAL INTO V_SAL
FROM STAFF_MASTER 
WHERE staff_CODE=101;

V_BONUS:=2*V_SAL;
DBMS_OUTPUT.PUT_LINE('STAFF SALARY IS ' || V_SAL);
DBMS_OUTPUT.PUT_LINE('STAFF BONUS IS ' || V_BONUS);

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('GIVEN CODE IS NOT VALID.ENTER VALID CODE');
END;

-----------------------------------------------------------------------------------------------------------------------------------------------

2.3

declare
cursor display is select * from emp where empno=&no;
val emp%rowtype;
BEGIN
open display;
loop
 fetch display into val;
 DBMS_OUTPUT.PUT_LINE(val.empno||' '||val.ename||' '||val.job||' '||val.mgr||' '||val.hiredate||' '||val.sal||' '||val.comm||' '||val.deptno); 
 exit 
 when display%notfound;
 end loop;
 EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('GIVEN CODE IS NOT VALID.ENTER VALID CODE');
  close display;
 end;

------------------------------------------------------------------------------------------------------------------------------------------------------------
3
----------------------------------------------------------------------------------------------------------------------------------------------
3.1

CREATE or replace FUNCTION agec(date1 date) RETURNS 
int 
DECLARE 
date2 DATE;
BEGIN 
  Select SYSDATE   into date2;
  RETURN year(sysdate)-year(date1);
END;

declare 
begin
  DBMS_output.put_line(agec(1998));
  end;
  /