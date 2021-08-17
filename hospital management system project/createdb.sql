CREATE TABLE Doctor (
    Doctor_ID int not NULL,
    DLast_Name varchar(255),
    DFirst_Name varchar(255),
    DAddress varchar(255),
    D_Salary int,
    D_Job   varchar(255),
    DPhone_Number  char(11),
    Doctor_mail  varchar(255),
    DSex      varchar(15),
    Room_Number int,
    D_Title    varchar(255),
    D_Age   int not null, 
   primary KEY(Doctor_ID)
);
CREATE TABLE SHIFT(
Shift_ID int not null,
SEnd time,
SDate date,
SStart time,
primary KEY(Shift_ID)
);
CREATE TABLE DEPARTMENT(
Department_ID int not null,
DepartmentName varchar(255),
Dep_Capacity int,
primary KEY(Department_ID)
);

CREATE TABLE Employee (
Employee_ID int not null,
Department_ID int not null,
Shift_ID int not null,
EType  varchar(25),
ESalary int,
EEmail varchar(255),
ELastName varchar(255),
EFirstName varchar(255),
ESex varchar(255),
EAge int not null,
primary KEY(Employee_ID),
foreign KEY(Department_ID)references Department(Department_ID),
foreign KEY(Shift_ID)references SHIFT(Shift_ID)
);

CREATE TABLE ROOMS(
Rooms_ID int not null,
Rperiod date,
Room_price int,
primary KEY(Rooms_ID)
);

CREATE TABLE PATIENT(
Patient_ID int not null,
Rooms_ID int not null,
PSex varchar(255),
PFirst_Name varchar(255),
PLast_Name varchar(255),
PAddress varchar(255),
P_Birth_date date,
Discharged varchar(255),
Admitted varchar(255),
PAge int not null,
primary KEY(Patient_ID),
foreign KEY(Rooms_ID)references ROOMS(Rooms_ID)
);
CREATE TABLE P_PHONENUMBER(
Patient_ID int not null,
P_Phone_Number char(11),
primary KEY(Patient_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID)
);
CREATE TABLE MEDICINE(
Medicine_ID int not null,
Price int,
Quantity varchar(255),
primary KEY(Medicine_ID)
);
CREATE TABLE NURSE(
Nurse_ID int not null,
NPhone_Number char(11),
N_Salary int not null,
NHistory varchar(255),
NEmail varchar(255),
NAddress varchar(255),
N_Degree varchar(255),
NSex varchar(255),
N_LastName varchar(255),
N_FirstName varchar(255),
primary KEY(Nurse_ID)
);
CREATE TABLE LABORATORY(
LAB_ID int not null,
LType varchar(255),
primary KEY(LAB_ID)
);
CREATE TABLE ROOMTYPE(
Rooms_ID int not null,
Room_type varchar(255),
primary KEY(Rooms_ID),
foreign KEY(Rooms_ID)references ROOMS(Rooms_ID)
);
CREATE TABLE PRESCRIPTION(
Prescription_ID int not null,
Patient_ID int not null,
Doctor_ID int not null,
P_Time time,
Fee int,
P_Date date,
primary KEY(Prescription_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID),
foreign KEY(Doctor_ID)references DOCTOR(Doctor_ID)
);

CREATE TABLE DESK_CLERK(
Clerk_ID int not null,
Clerk_Num char(11),
CFirst_Name varchar(255),
CLast_Name varchar(255),
primary KEY(Clerk_ID)
);

CREATE TABLE SURGERY(
Op_ID int not null,
SDepartment varchar(255),
Op_price int,
STime time,
primary KEY(Op_ID)
);

CREATE TABLE APPOINTMENT(
Patient_ID int not null,
ATime time,
ADate date,
Atype varchar(255),
primary KEY(Patient_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID)
);

CREATE TABLE ATTEND(
Doctor_ID int not null,
Op_ID int not null,
Surgery_Count int,
primary KEY(Doctor_ID,Op_ID),
foreign KEY(Doctor_ID)references DOCTOR(Doctor_ID),
foreign KEY(Op_ID)references SURGERY(Op_ID)
);


