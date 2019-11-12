drop database if exists BANK;
create database BANK;
use BANK;

drop table if exists TRANSACTIONS;
drop table if exists BRANCH;
drop table if exists BENIFICERY ;
drop table if exists DEPENDENTS;
drop table if exists GUARANTOR;
drop table if exists EMPLOYEE;
drop table if exists CUSTOMER;
drop table if exists DEPOSITS;
drop table if exists WITHDRAW;
drop table if exists GUARANTEE_CUSTOMER; 
drop table if exists CUSTOMER_MBL;
drop table if exists GUARANTOR_Mbl;
drop table if exists DEPENDENTS_MBL;
drop table if exists BENIFICERY_Mbl;
drop table if exists Security_d;
drop table if exists Finance_d;
drop table if exists IT_d;
drop TABLE if EXISTS LOAN;


create table EMPLOYEE(
    Fname VARCHAR(30) NOT NULL, 
    Mname VARCHAR(30), 
	LName VARCHAR(30),
	E_Id INT, 
    AadharNumber INT,
    MgrID INT,
    BranchNumber INT,
    DeptName VARCHAR(30),
    DateofBirth DATE, 
    Salary FLOAT,
	JoingDate DATE NOT NULL,
    PRIMARY KEY (E_Id)
);
create table CUSTOMER(
    Fname VARCHAR(30) NOT NULL, 
	Mname VARCHAR(30), 
	LName VARCHAR(30),
	Cus_acc_no INT, 
    AadharNumber INT,
    HouseNumber INT,
    StreetNumber INT,
    LandMark varchar(30),
    DateofBirth DATE,
    Balance FLOAT,
    Sex varchar(30),
    PRIMARY KEY (Cus_acc_no)
);
create table GUARANTOR (

Account_Number INT,
Cus_acc_no INT,
Branch_NO INT,
FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(Cus_acc_no),
Primary Key (Account_Number)

);
create table BRANCH(
    BranchNumber int,
    IFSCcode INT,
    Locations varchar(30),
    BMgr_id INT,
    Primary Key (BranchNumber)

	
);
create table GUARANTEE_CUSTOMER (
Cus_acc_no INT,
Account_Number INT,
FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(Cus_acc_no)

);
create table TRANSACTIONS(
	Cust_accnt_number INT,
    TRANSACTIONID  INT NOT NULL ,
    Types VARchar(20),
    Primary Key(TRANSACTIONID)

);
create table DEPENDENTS (
	E_id INT,
    D_Name VARCHAR(30),
    Relationship varchar(20),
    DateofBirth date ,
FOREIGN Key (E_id) REFERENCES EMPLOYEE(E_id),
Primary Key(D_Name)
);
create table BENIFICERY  (
	Cus_acc_no INT,
    B_Name VARCHAR(30),
    Relationship varchar(20),
    DOB date,
    FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(Cus_acc_no),
    primary key(B_Name)
);
create table BENIFICERY_MBL(
Cus_acc_no INT,
M_no INT,
B_Name VARCHAR(30),
FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(Cus_acc_no),
FOREIGN Key (B_Name) REFERENCES BENIFICERY(B_Name)


);
create table GUARANTOR_MBL(
G_acc_no INT,
M_no INT,
Account_Number INT,
FOREIGN Key (Account_Number) REFERENCES GUARANTOR(Account_Number),
FOREIGN Key (G_acc_no) REFERENCES  CUSTOMER(Cus_acc_no)



);
create table  DEPENDENTS_MBL(
E_Id INT,
M_no INT,
D_Name VARCHAR(30), 
FOREIGN Key (E_Id) REFERENCES EMPLOYEE(E_id),
FOREIGN Key (D_Name) REFERENCES DEPENDENTS(D_Name)



);
create table CUSTOMER_Mbl(
Cus_acc_no INT,
M_no INT,
FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(Cus_acc_no)


);

create table DEPOSITS( 
     Account_Number INT,
     Branch_Number INT,
     Amount FLOAT,
	# FOREIGN Key (Transaction_id) REFERENCES TRANSACTIONS(TRANSACTIONID),
     FOREIGN Key (Account_Number) REFERENCES CUSTOMER(Cus_acc_no),
	FOREIGN Key (Branch_Number) REFERENCES BRANCH(BranchNumber)
);
create table WITHDRAW( 
    
    Account_Number INT,
    Branch_Number INT,
    Amount FLOAT,
    
    #FOREIGN Key (Transaction_id) REFERENCES TRANSACTIONS(TRANSACTIONID),
    FOREIGN Key (Account_Number) REFERENCES CUSTOMER(Cus_acc_no),
    FOREIGN Key (Branch_Number) REFERENCES BRANCH(BranchNumber)
     );
create table LOAN(
	AccountNumber INT,
    Branch_Number INT,
    E_ID INT,
    Guarantee_accnt_no INT,
    Amount INT,
    RateofInterest FLOAT,
    Tenure INT,
    FOREIGN Key (AccountNumber) REFERENCES CUSTOMER(Cus_acc_no),
    FOREIGN Key (E_ID) REFERENCES EMPLOYEE(E_ID),
    FOREIGN Key (Branch_Number) REFERENCES BRANCH(BranchNumber),
    FOREIGN Key (Guarantee_accnt_no) REFERENCES GUARANTOR(Account_Number)
);
