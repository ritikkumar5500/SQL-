create database intel_assignment1

create table STUDIES
(
PNAME VARCHAR(20),
INSTITUTE VARCHAR(30),
COURSE VARCHAR(10),
[COURSE FEE] INT
)

INSERT STUDIES VALUES
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000)


--CREATE SOFTWARE TABLE
CREATE TABLE SOFTWARE
(
PNAME VARCHAR(20),
TITLE VARCHAR(30),
DEVELOPIN VARCHAR(20),
SCOST INT,
DCOST INT,
SOLD INT
)

INSERT SOFTWARE VALUES
('MARY','README','CPP', 300, 1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43 ),
('ANAND','VIDEOTITLING', 'PASCAL', 7500, 16000,9),
('JULIANA', 'INVENTORY', 'COBOL', 3000, 3500,0 ),
('KAMALA', 'PAYROLL PKG', 'DBASE', 9000, 20000,7 ),
('MARY', 'FINANCIALACCT', 'ORACLE', 18000, 85000 ,4),
('MARY', 'CODE GENERATOR', 'C' ,4500, 20000,23),
('PATTRICK', 'README', 'CPP', 300, 1200, 84),
('QADIR', 'BOMBS AWAY', 'ASSEMBLY', 750, 3000, 11),
('QADIR', 'VACCINES', 'C', 1900, 3100, 21),
('RAMESH', 'HOTEL MGMT', 'DBASE', 13000, 35000, 4),
('RAMESH', 'DEAD LEE', 'PASCAL', 599.95, 4500, 73),
('REMITHA', 'PC UTILITIES', 'C', 725, 5000, 51),
('REMITHA', 'TSR HELP PKG', 'ASSEMBLY', 2500, 6000, 7),
('REVATHI', 'HOSPITAL MGMT', 'PASCAL', 1100, 75000, 2),
('VIJAYA', 'TSR EDITOR', 'C', 900, 700,6)

SELECT * FROM SOFTWARE

--CREATE PROGRAMMER TABLE
CREATE TABLE PROGRAMMER
(PNAME VARCHAR(20),
DOB DATE,
DOJ DATE,
GENDER CHAR(1),
PROF1 VARCHAR(20),
PROF2 VARCHAR(20),
SALARY INT
)

INSERT PROGRAMMER VALUES
('ANAND', '12-Apr-66', '21-Apr-92', 'M', 'PASCAL', 'BASIC', 3200),
('ALTAF', '02-Jul-64', '13-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800),
('JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'DBASE', 3000),
('KAMALA', '30-Oct-68', '02-Jan-92', 'F', 'C', 'DBASE', 2900),
('MARY', '24-Jun-70', '01-Feb-91', 'F', 'CPP', 'ORACLE', 4500),
('NELSON', '11-Sep-85', '11-Oct-89', 'M', 'COBOL', 'DBASE', 2500),
('PATTRICK', '10-Nov-65', '21-Apr-90', 'M','PASCAL', 'CLIPPER', 2800),
('QADIR', '31-Aug-65', '21-Apr-91', 'M', 'ASSEMBLY', 'C', 3000),
('RAMESH', '03-May-67', '28-Feb-91', 'M', 'PASCAL', 'DBASE', 3200),
('REBECCA', '01-Jan-67', '01-Dec-90', 'F', 'BASIC', 'COBOL', 2500),
('REMITHA', '19-Apr-70', '20-Apr-93', 'F', 'C', 'ASSEMBLY', 3600),
('REVATHI', '02-Dec-69', '02-Jan-92', 'F', 'PASCAL', 'BASIC', 3700),
('VIJAYA', '14-Dec-65', '02-May-92', 'F', 'FOXPRO', 'C', 350)



SELECT * FROM STUDIES
SELECT * FROM SOFTWARE
SELECT * FROM PROGRAMMER

--QUERY 1: selling cost average in pascal
SELECT AVG(SCOST) AS AVG_COST FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL'


--QUERY2: DISPLAY NAMES,AGES OF ALL PROGRAMMERS
SELECT PNAME,YEAR(GETDATE())-YEAR(DOB) AS AGE FROM PROGRAMMER


--QUERY3: DISPLAY THE NAMES OF THOSE WHO HAVE DONE THE DAP COURSE
SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP'


--QUERY4: Display the Names and Date of Births of all Programmers Born in January
SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB) = '01'


--QUERY5: . What is the Highest Number of copies sold by a Package
SELECT TOP 1 WITH TIES TITLE,SUM(SOLD) AS NO_OF_PACKAGES FROM SOFTWARE 
GROUP BY TITLE  ORDER BY SUM(SOLD) DESC


--QUERY 6: Display lowest course Fee
SELECT MIN([COURSE FEE]) AS LOW_FEE FROM STUDIES


--QUERY7: How many programmers done the PGDCA Course?
SELECT COUNT(*) AS NO_OF_PROGRAMMERS FROM STUDIES WHERE COURSE = 'PGDCA'


--QUERY8: How much revenue has been earned thru sales of Packages Developed in C. REVENUE = NO .OF UNITS SOLD * AVERAGE PRICE
SELECT SUM(SOLD * SCOST) AS REVENUE FROM SOFTWARE WHERE DEVELOPIN = 'C'


--QUERY9 : Display the Details of the Software Developed by Ramesh
SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH'


--QUERY 10:How many Programmers Studied at Sabhari
SELECT COUNT(*) AS 'NO OF PROGRAMMERS'FROM STUDIES WHERE INSTITUTE = 'SABHARI'


--QUERY 11: Display details of Packages whose sales crossed the 2000 Mark
SELECT * FROM SOFTWARE WHERE (SOLD *SCOST) > 2000


--QUERY 12: Display the Details of Packages for which Development Cost have been recovered
SELECT * FROM SOFTWARE WHERE (SCOST * SOLD) >= DCOST 


--QUERY 13: What is the cost of the costliest software development in Basic? 
SELECT MAX(DCOST) AS HIGHEST FROM SOFTWARE WHERE DEVELOPIN = 'BASIC'


----QUERY 14: . How many Packages Developed in DBASE?
select count(TITLE)from SOFTWARE where DEVELOPIN = 'DBASE'


--QUERY 15: . How many programmers studied in Pragathi? 
SELECT COUNT(*) FROM STUDIES WHERE INSTITUTE = 'PRAGATHI' 


--QUERY 16:  How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(*) FROM STUDIES WHERE [COURSE FEE] BETWEEN 5000 AND 10000


--QUERY 17: What is AVG Course Fee?
SELECT AVG([COURSE FEE]) AS AVG_COURSE_FEE FROM STUDIES


--QUERY 18: Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'


--QUERY 19:  How many Programmers know either COBOL or PASCAL.
SELECT COUNT(PNAME) AS 'NO OF PROGRAMMERS' FROM PROGRAMMER WHERE PROF1 ='COBOL' OR PROF1='PASCAL'
OR PROF2 = 'COBOL' OR PROF2= 'PASCAL'


--QUERY 20:How many Programmers Don’t know PASCAL and C 
SELECT COUNT(PNAME) FROM PROGRAMMER WHERE PROF1!= 'PASCAL' AND PROF1!= 'C' AND PROF2!= 'PASCAL' AND PROF2!= 'C'


--QUERY 21: How old is the Oldest Male Programmer. 
SELECT MAX(YEAR(GETDATE())-YEAR(DOB)) AS AGE FROM PROGRAMMER WHERE GENDER ='M'


--QUERY 22: What is the AVG age of Female Programmers? 
SELECT AVG(YEAR(GETDATE())-YEAR(DOB)) AS AVG_AGE FROM PROGRAMMER WHERE GENDER = 'F'


--QUERY 23: Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
SELECT PNAME, YEAR(GETDATE())-YEAR(DOJ) AS EXPERIENCE FROM PROGRAMMER ORDER BY PNAME DESC 


--QUERY 24: Who are the Programmers who celebrate their Birthday’s During the Current Month? 
SELECT PNAME FROM PROGRAMMER where MONTH(GETDATE())= MONTH(DOB)


--QUERY 25: How many Female Programmers are there?
SELECT COUNT(*) AS FEMALE_PROGRAMMERS FROM PROGRAMMER WHERE GENDER = 'F'


--QUERY 26: What are the Languages studied by Male Programmers
SELECT DISTINCT PROF1 FROM PROGRAMMER WHERE GENDER = 'M' 
UNION
SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE GENDER = 'M'


--QUERY 27:  What is the AVG Salary?
SELECT AVG(SALARY) AS AVG_SALARY FROM PROGRAMMER


--QUERY 28: How many people draw salary 2000 to 4000? 
SELECT COUNT(*) FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000


--QUERY 29: Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL')


--QUERY 30: Display the Cost of Package Developed By each Programmer?
SELECT TITLE,SUM(DCOST) AS [PACKAGE COST] FROM SOFTWARE GROUP BY TITLE


--QUERY 31: Display the sales values of the Packages Developed by the each Programmer. 
SELECT PNAME,SUM(SCOST) AS [PACKAGE COST] FROM SOFTWARE GROUP BY PNAME


--QUERY 32: Display the Number of Packages sold by Each Programmer. 
SELECT PNAME,SUM(SOLD) AS [NO OF PACKAGES] FROM SOFTWARE GROUP BY PNAME


--QUERY 33: Display the sales cost of the packages Developed by each Programmer Language wise. 
SELECT DEVELOPIN,SUM(SCOST) AS TOT_SCOST FROM SOFTWARE GROUP BY DEVELOPIN


--QUIZ 34: Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN,AVG(DCOST) AS [AVG Development Cost], AVG(SCOST*SOLD) AS [AVG Selling Cost],
AVG(SCOST) AS [AVG Price per Copy] FROM SOFTWARE GROUP BY DEVELOPIN


--	QUIZ 35: Display each programmer’s name, costliest and cheapest Packages Developed by him or her
SELECT PNAME, MAX(DCOST) AS MAX_DCOST, MIN(DCOST) AS MIN_DCOST FROM SOFTWARE GROUP BY PNAME


--QUERY 36: Display each institute name with number of Courses, Average Cost per Course. 
SELECT INSTITUTE, COUNT(*) AS 'NO OF COURSES', AVG([COURSE FEE])/COUNT(*) AS AVG_COST_PER_COURSE
FROM STUDIES GROUP BY INSTITUTE


--QUERY 37: Display each institute Name with Number of Students. 
SELECT INSTITUTE, COUNT(PNAME) AS 'NO OF STUDENTS' FROM STUDIES  GROUP BY INSTITUTE

--QUERY 38: . Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER


--QUERY 39: Display the Name of Programmers and Their Packages
SELECT PNAME,TITLE FROM SOFTWARE ORDER BY PNAME,TITLE

--QUERY 40: Display the Number of Packages in Each Language Except C and C++. 
SELECT COUNT(TITLE) AS 'NO OF PACKAGES' FROM SOFTWARE WHERE DEVELOPIN != 'C' AND  DEVELOPIN != 'CPP'


--QUERY 41: Display the Number of Packages in Each Language for which Development Cost is less than 1000
SELECT COUNT(TITLE) AS 'NO OF PACKAGE' FROM SOFTWARE WHERE DCOST<1000

--QUERY 42: Display AVG Difference between SCOST, DCOST for Each Package.
SELECT TITLE, AVG(DCOST-SCOST) AS AVG_DIFF FROM SOFTWARE GROUP BY TITLE


/***QUERY 43: Display the total SCOST, DCOST and amount to Be Recovered for each 
Programmer for Those Whose Cost has not yet been Recovered. ***/
SELECT PNAME,SUM(SCOST)AS TOTAL_SCOST, SUM(DCOST)AS TOTAL_DCOST, SUM(DCOST-(SOLD*SCOST))AS RECOVERED_AMOUNT FROM SOFTWARE 
GROUP BY PNAME HAVING SUM(DCOST)>SUM(SOLD*SCOST)


--QUERY 44: Display Highest, Lowest and Average Salaries for those earning more than 2000
SELECT MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY,
AVG(SALARY) AS AVG_SALARY FROM PROGRAMMER WHERE SALARY > 2000


--QUERY 45: Who is the Highest Paid C Programmers?
SELECT  TOP 1 PNAME , MAX(SALARY) AS MAX_SAL FROM PROGRAMMER 
WHERE PROF1 = 'C' OR PROF2 = 'C'  GROUP BY PNAME ORDER BY MAX_SAL DESC


--QUERY 46: Who is the Highest Paid Female COBOL Programmer?
SELECT * FROM PROGRAMMER WHERE SALARY = 
(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 = 'COBOL' OR PROF2 ='COBOL') AND GENDER = 'F'


--QUERY 47: Display the names of the highest paid programmers for each Language. 
SELECT DISTINCT PNAME,PROF1 FROM PROGRAMMER WHERE SALARY IN
(SELECT MAX(SALARY) FROM PROGRAMMER GROUP BY PROF1)


--QUERY 48: Who is the least experienced Programmer.
SELECT PNAME FROM PROGRAMMER WHERE (YEAR(GETDATE())-YEAR(DOJ)) = (SELECT MIN(TB.EXPERIENCE) 
FROM (SELECT (YEAR(GETDATE())-YEAR(DOJ)) AS EXPERIENCE FROM PROGRAMMER)TB)


--QUERY 49: Who is the most experienced male programmer knowing PASCAL.
WITH TEMP AS
(SELECT PNAME,GENDER, (YEAR(GETDATE())-YEAR(DOJ)) AS EXPERIENCE FROM PROGRAMMER 
WHERE (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL') AND GENDER = 'M')
SELECT TOP 1 * FROM TEMP ORDER BY EXPERIENCE DESC


--QUERY 50: . Which Language is known by only one Programmer? 
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1) =1
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2) =1


--QUERY 51: Who is the Above Programmer Referred in 50? 
SELECT P1.PNAME,P1.PROF1,P1.PROF2 FROM PROGRAMMER P1
INNER JOIN (
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1) =1
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2) =1) P2
ON P1.PROF1=P2.PROF1 
--OR
SELECT PNAME FROM PROGRAMMER WHERE PROF1 IN('CPP','FOXPRO','ORACLE') 
UNION
SELECT PNAME FROM PROGRAMMER WHERE PROF2 IN ('CPP','FOXPRO','ORACLE')  


--QUERY 52: Who is the Youngest Programmer knowing DBASE
SELECT TOP 1 PNAME,(YEAR(GETDATE())-YEAR(DOB)) AS AGE  FROM .PROGRAMMER
WHERE PROF1='DBASE' OR PROF2='DBASE'
ORDER BY AGE ASC


--QUERY 53: Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT PNAME,GENDER FROM PROGRAMMER WHERE SALARY > 3000 AND GENDER ='F' AND (PROF1 NOT IN ('C','CPP','ORACLE','DBASE') OR
PROF2 NOT IN ('C','CPP','ORACLE','DBASE'))


--QUERY 54: Which Institute has most number of Students?
SELECT TOP 1 S1.INSTITUTE,COUNT(PNAME) AS [NO OF STUDENTS]  FROM STUDIES AS S1 
GROUP BY INSTITUTE ORDER BY 'NO OF STUDENTS'DESC  


--QUERY 55: What is the Costliest course?
SELECT COURSE FROM STUDIES WHERE [COURSE FEE] = (SELECT MAX([COURSE FEE]) FROM STUDIES)


--QUERY 56: Which course has been done by the most of the Students? 
SELECT TOP 1 WITH TIES S1.COURSE,COUNT(PNAME) AS [NO OF STUDENTS]  FROM STUDIES AS S1 
GROUP BY COURSE ORDER BY 'NO OF STUDENTS'DESC     


--QUERY 57: Which Institute conducts costliest course
SELECT INSTITUTE FROM STUDIES WHERE [COURSE FEE] = (SELECT MAX([COURSE FEE]) FROM STUDIES)


--QUERY 58:  Display the name of the Institute and Course, which has below AVG course fee
SELECT INSTITUTE,COURSE FROM STUDIES WHERE [COURSE FEE] < (SELECT AVG([COURSE FEE]) FROM STUDIES)


--QUERY 59: Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
SELECT COURSE FROM STUDIES WHERE [COURSE FEE] < (SELECT AVG([COURSE FEE])+1000 FROM STUDIES) AND
[COURSE FEE] < (SELECT AVG([COURSE FEE])-1000 FROM STUDIES) GROUP BY COURSE


--QUERY 60: . Which package has the Highest Development cost?
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)


--QUERY 61: Which course has below AVG number of Students? 
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(PNAME) < 
(SELECT AVG(TB.COUNT_PNAME) FROM (SELECT COUNT(PNAME) AS COUNT_PNAME FROM STUDIES)TB) 


--QUERY 62: . Which Package has the lowest selling cost? 
SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE) 


--QUERY 63: Who Developed the Package that has sold the least number of copies?
SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)


--QUERY 64: Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)


/***QUERY 65: How many copies of package that has the least difference between 
development and selling cost where sold. ***/
SELECT SOLD, TITLE FROM SOFTWARE WHERE (DCOST-SCOST) =(SELECT MIN(DCOST-SCOST) FROM SOFTWARE) 


--QUERY 66: Which is the costliest package developed in PASCAL. 
SELECT TOP 1 TITLE,MAX(DCOST)  AS COSTLIEST FROM SOFTWARE 
WHERE DEVELOPIN = 'PASCAL' GROUP BY TITLE ORDER BY COSTLIEST DESC


--QUERY 67: Which language was used to develop the most number of Packages
SELECT TOP 1 WITH TIES DEVELOPIN,COUNT(*) AS [NO OF PACKAGES] FROM SOFTWARE GROUP BY DEVELOPIN ORDER BY COUNT(*) DESC


--QUERY 68: Which programmer has developed the highest number of Packages?
SELECT TOP 1 WITH TIES PNAME,COUNT(TITLE) AS NO_OF_PKGS FROM SOFTWARE GROUP BY PNAME ORDER BY NO_OF_PKGS DESC


--QUERY 69:  Who is the Author of the Costliest Package?
SELECT PNAME FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)


--QUERY 70: Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE) GROUP BY TITLE


--QUERY 71: Who are the authors of the Packages, which have recovered more than double the Development cost? 
SELECT PNAME FROM SOFTWARE WHERE (SOLD*SCOST)>(2*DCOST) GROUP BY PNAME


--QUERY 72: Display the programmer Name and the cheapest packages developed by them in each language. 
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN)


--QUERY 73:. Display the language used by each programmer to develop the Highest  Selling and Lowest-selling package. 
SELECT DISTINCT PNAME, DEVELOPIN FROM SOFTWARE
WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT DISTINCT PNAME, DEVELOPIN FROM SOFTWARE
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME) --OR
SELECT DEVELOPIN, MAX(SCOST) AS MAX_SCOST, MIN(SCOST) AS MIN_SCOST FROM SOFTWARE GROUP BY DEVELOPIN


--QUERY 74: Who is the youngest male Programmer born in 1965? 
SELECT  PNAME,DOB FROM PROGRAMMER WHERE GENDER = 'M' AND YEAR(DOB) = '1965' ORDER BY DOB DESC


--QUERY 75: Who is the oldest Female Programmer who joined in 1992
SELECT TOP 1 PNAME,DOJ,DOB,GENDER FROM PROGRAMMER WHERE GENDER = 'F' AND YEAR(DOJ) = '1992' ORDER BY DOB ASC


--QUERY 76: In which year was the most number of Programmers born. 
SELECT TOP 1 WITH TIES YEAR(DOB) AS YEAR_BORN,COUNT(*) AS [NO OF PROGRAMMERS] FROM PROGRAMMER
GROUP BY YEAR(DOB) ORDER BY [NO OF PROGRAMMERS] DESC


--QUERY 77: In which month did most number of programmers join?
SELECT TOP 1 WITH TIES MONTH(DOJ) AS MONTH_BORN,COUNT(PNAME) AS [NO OF PROGRAMMERS]
FROM PROGRAMMER GROUP BY MONTH(DOJ)  ORDER BY [NO OF PROGRAMMERS] DESC 


--QUERY 78: In which language are most of the programmer’s proficient
WITH TEMP AS
(
SELECT PROF1,COUNT(PROF1) AS COUNT_PROF1 FROM PROGRAMMER GROUP BY PROF1
UNION
SELECT PROF2,COUNT(PROF2) AS COUNT_PROF2 FROM PROGRAMMER GROUP BY PROF2)
SELECT TOP 1 WITH TIES * FROM TEMP ORDER BY COUNT_PROF1 DESC
SELECT * FROM PROGRAMMER

--QUERY 79: Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT PNAME, GENDER,SALARY FROM PROGRAMMER WHERE GENDER = 'M' AND 
SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F')


--QUERY 80: Who are the Female Programmers earning more than the Highest Paid?
SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER)


--QUERY 81: Which language has been stated as the proficiency by most of the Programmers?
WITH TEMP AS(
SELECT PROF1, COUNT(PROF1) AS COUNT_PROF1 FROM PROGRAMMER GROUP BY PROF1 
UNION 
SELECT PROF2,COUNT(PROF2) AS COUNT_PROF2 FROM PROGRAMMER GROUP BY PROF2 )
SELECT TOP 1 WITH TIES* FROM TEMP ORDER BY COUNT_PROF1 DESC
 


--QUERY 82: . Display the details of those who are drawing the same salary.
SELECT * FROM PROGRAMMER WHERE SALARY = 
ANY(SELECT SALARY FROM PROGRAMMER P GROUP BY SALARY HAVING  COUNT(*)>1) ORDER BY SALARY


--QUERY 83: Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT S.* FROM PROGRAMMER P, SOFTWARE S WHERE S.PNAME=P.PNAME AND SALARY > 3000 AND GENDER = 'M'


--QUERY 84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT S.* FROM PROGRAMMER P, SOFTWARE S WHERE P.PNAME =S.PNAME AND DEVELOPIN = 'PASCAL' AND GENDER = 'F'


--QUERY 85. Display the details of the Programmers who joined before 1990. 
SELECT * FROM PROGRAMMER WHERE YEAR(DOJ) < 1990


--QUERY 86. Display the details of the Software Developed in C By female programmers of Pragathi. 
SELECT S.* FROM SOFTWARE S, PROGRAMMER P, STUDIES ST 
WHERE S.PNAME = P.PNAME AND P.PNAME = ST.PNAME AND 
GENDER = 'F' AND INSTITUTE = 'PRAGATHI'


--QUERY 87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. 
SELECT ST.INSTITUTE, COUNT(S.TITLE) AS 'NO OF PACKAGES',COUNT(S.SOLD) AS 'NO OF COPIES', 
SUM(S.SOLD*S.SCOST) AS SALES FROM SOFTWARE S, STUDIES ST
WHERE S.PNAME = ST.PNAME GROUP BY ST.INSTITUTE


/**QUERY 88. Display the details of the software developed in DBASE by Male Programmers, who 
belong to the institute in which most number of Programmers studied. **/
SELECT S.*,P.GENDER,ST.INSTITUTE FROM SOFTWARE S, STUDIES ST, PROGRAMMER P 
WHERE P.PNAME =S.PNAME AND S.PNAME =ST.PNAME AND ST.PNAME = P.PNAME
AND S.DEVELOPIN = 'DBASE' AND GENDER = 'M'
AND ST.INSTITUTE IN (SELECT INSTITUTE FROM STUDIES GROUP BY INSTITUTE
HAVING COUNT(INSTITUTE) >= ANY(SELECT COUNT(INSTITUTE) FROM STUDIES GROUP BY INSTITUTE))


/**QUERY 89. Display the details of the software Developed by the male programmers Born 
before 1965 and female programmers born after 1975**/
SELECT S.*,P.GENDER FROM SOFTWARE S, PROGRAMMER P WHERE S.PNAME = P.PNAME AND
GENDER = 'M' AND YEAR(DOB)>1965 
UNION 
SELECT S.*,P.GENDER FROM SOFTWARE S, PROGRAMMER P WHERE S.PNAME = P.PNAME
AND YEAR(DOB) > 1975 AND GENDER ='F'   


/**QUERY 90. Display the details of the software that has developed in the language which is
neither the first nor the second proficiency of the programmers. **/
SELECT S.* FROM SOFTWARE S, PROGRAMMER P WHERE S.PNAME= P.PNAME AND 
(DEVELOPIN <> PROF1 AND DEVELOPIN <> PROF2)


--QUERY 91. Display the details of the software developed by the male students of Sabhari. 
SELECT S.* FROM SOFTWARE S, STUDIES ST, PROGRAMMER P 
WHERE P.PNAME =S.PNAME AND S.PNAME =ST.PNAME AND ST.PNAME = P.PNAME
AND  GENDER = 'M' AND INSTITUTE = 'SABHARI'


--QUERY 92. Display the names of the programmers who have not developed any packages. 
SELECT PNAME FROM PROGRAMMER WHERE PNAME NOT IN (SELECT PNAME FROM SOFTWARE)


--QUERY 93. What is the total cost of the Software developed by the programmers of Apple? 
SELECT SUM(SCOST) FROM SOFTWARE S, STUDIES ST WHERE S.PNAME = ST.PNAME AND ST.INSTITUTE = 'APPLE'


--QUERY 94. Who are the programmers who joined on the same day? 
SELECT PNAME FROM PROGRAMMER WHERE DOJ = ANY(SELECT DOJ FROM PROGRAMMER GROUP BY DOJ HAVING COUNT(DOJ)>1)


--QUERY 95. Who are the programmers who have the same Prof2? 
SELECT PNAME FROM PROGRAMMER WHERE PROF2 =  
ANY(SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF2)>1)


--QUERY 96. Display the total sales value of the software, institute wise. 
SELECT ST.INSTITUTE, SUM(S.SCOST*S.SOLD) AS TOT_SALES FROM SOFTWARE S, STUDIES ST 
WHERE ST.PNAME = S.PNAME GROUP BY INSTITUTE


--QUERY 97. In which institute does the person who developed the costliest package studied. 
SELECT INSTITUTE FROM SOFTWARE S, STUDIES ST WHERE S.PNAME = ST.PNAME
GROUP BY INSTITUTE, DCOST HAVING MAX(DCOST) = (SELECT MAX(DCOST) FROM SOFTWARE)


--QUERY 98. Which language listed in prof1, prof2 has not been used to develop any package. 
SELECT PROF1 FROM PROGRAMMER WHERE PROF1 NOT IN 
(SELECT DEVELOPIN FROM SOFTWARE)
UNION 
SELECT PROF2 FROM PROGRAMMER WHERE PROF2 NOT IN
(SELECT DEVELOPIN FROM SOFTWARE)


--QUERY 99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
SELECT P.SALARY,ST.COURSE FROM PROGRAMMER P, SOFTWARE S,STUDIES ST 
WHERE P.PNAME =S.PNAME AND S.PNAME =ST.PNAME
AND SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)



-- QUERY 100. What is the AVG salary for those whose software sales is more than 50,000/-. 
SELECT AVG(SALARY)AS AVG_SALARY,PNAME FROM PROGRAMMER 
WHERE PNAME IN (SELECT PNAME FROM SOFTWARE WHERE (SCOST*SOLD)>50000) GROUP BY PNAME


/**101. How many packages were developed by students, who studied in institute that 
charge the lowest course fee? **/
SELECT COUNT(ST.PNAME) AS 'NO OF PACKAGES' FROM SOFTWARE S, STUDIES ST 
WHERE S.PNAME = ST.PNAME GROUP BY S.PNAME, [COURSE FEE]
HAVING MIN([COURSE FEE]) = (SELECT MIN([COURSE FEE]) FROM STUDIES)

select count(title) from software s inner join studies st
on s.pname=st.pname
where INSTITUTE in (select institute from studies where [COURSE FEE] =(select min([COURSE FEE]) from STUDIES))



/**102. How many packages were developed by the person who developed the 
cheapest package, where did HE/SHE study? **/
SELECT COUNT(*) FROM PROGRAMMER P, SOFTWARE S , STUDIES ST
WHERE S.PNAME = P.PNAME GROUP BY DEVELOPIN HAVING MIN(DCOST) =
(SELECT MIN(DCOST) FROM SOFTWARE) -- NOT CLEAR


select institute,count(title) from software s inner join studies st
on st.PNAME=s.PNAME
where s.PNAME in (select PNAME from SOFTWARE where DCOST=(select min(dcost) from SOFTWARE))
group by INSTITUTE


--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
SELECT COUNT(DEVELOPIN) FROM PROGRAMMER P, SOFTWARE S 
WHERE S.PNAME = P.PNAME AND GENDER = 'F' AND
SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER P, SOFTWARE S WHERE S.PNAME = P.PNAME AND GENDER = 'M')


--104. How many packages are developed by the most experienced programmer form BDPS.
SELECT COUNT(*) AS 'PACKAGES' FROM SOFTWARE S, PROGRAMMER P WHERE P.PNAME = S.PNAME 
GROUP BY DOJ HAVING MAX(DOJ) = (SELECT MAX(DOJ) FROM STUDIES ST, PROGRAMMER P, SOFTWARE S
WHERE P.PNAME =S.PNAME AND ST.PNAME = P.PNAME AND (INSTITUTE ='BDPS'))


--105. List the programmers (form the software table) and the institutes they studied. 
SELECT PNAME, INSTITUTE FROM STUDIES WHERE PNAME NOT IN (SELECT PNAME FROM SOFTWARE)


--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
SELECT P.PROF1,P.PROF2,COUNT(P.PNAME)AS NUMBER_OF_PROGRAMMERS,S.TITLE FROM PROGRAMMER P
INNER JOIN SOFTWARE S ON P.PROF1=S.DEVELOPIN 
INNER JOIN SOFTWARE S1 ON P.PROF2=S1.DEVELOPIN 
GROUP BY P.PROF1,P.PROF2,P.PNAME,S.TITLE


--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT P.PNAME,COUNT(DEVELOPIN) AS DEV_IN FROM SOFTWARE S,PROGRAMMER P WHERE P.PNAME =S.PNAME GROUP BY P.PNAME


