CREATE DATABASE DB_School_Management;

CREATE TABLE tbl_school(
sch_id int identity primary key,
sch_name varchar(40) not null,
sch_address varchar(50) not null,
sch_phone_no int unique
)

---STUDENT INFORMATION AND REGISTRATION---

CREATE TABLE tbl_student(
st_id int identity primary key,
roll_no int unique,
st_name varchar(40) not null,
pa_id int not null,
reg_id int not null,
st_phone_no int unique,
st_DOB date not null,
st_gender varchar(10)not null,
st_email varchar(40)unique,
constraint parient_id foreign key(pa_id) references tbl_parient(pa_id),
constraint registration_id foreign key(reg_id) references tbl_registration(reg_id)
)

CREATE TABLE tbl_parient(
pa_id int identity primary key,
pa_name varchar(40),
pa_phone_no int unique,
pa_occupation varchar(30) not null,
)

CREATE TABLE tbl_registration(
reg_id int identity primary key,
reg_no int not null,
reg_date date not null
)

--COURSE INFORMATION--

CREATE TABLE tbl_course_reg(
co_id int identity primary key,
co_name varchar(30) not null,
co_date date not null,
st_id int null,
constraint st_id foreign key(st_id) references tbl_student(st_id)
)

---CLASS INFORMATION

CREATE TABLE tbl_class(
cls_id int identity primary key,
cls_name varchar(30) not null,
st_id int not null,
co_id int not null,
teacher_id int not null,
room_id int not null,
cls_date date not null,
cls_start_time time not null,
cls_end_time time not null,
constraint student_id foreign key(st_id) references tbl_student(st_id),
constraint course_id foreign key(co_id) references tbl_course_reg(co_id),
constraint teacher_id foreign key(teacher_id) references tbl_teacher(teacher_id),
constraint room_id foreign key(room_id) references tbl_room(room_id)
)

---TEACHER PROFILE---

CREATE TABLE tbl_teacher(
teacher_id int identity primary key,
te_name varchar(40) not null,
te_phone_no int not null,
te_email varchar(40)unique,
te_gender varchar(20) not null,
te_join_date date not null
)

---ROOM ID---

CREATE TABLE tbl_room(
room_id int identity primary key,
roll_no int unique
)

---EXAMS SCHDULE DATABASE---

CREATE TABLE tbl_quezies(
quz_id int identity primary key,
quz_date date not null,
quz_type_id int not null,
st_id int not null,
teacher_id int not null,
co_id int not null,
marks int not null
constraint students_id foreign key(st_id) references tbl_student(st_id),
constraint courses_id foreign key(co_id) references tbl_course_reg(co_id),
constraint teachers_id foreign key(teacher_id) references tbl_teacher(teacher_id),
constraint quz_type_id foreign key(quz_type_id) references tbl_quze_type(quz_type_id)
)

CREATE TABLE tbl_quze_type(
quz_type_id int identity primary key,
quz_type_name varchar(10) not null
)

CREATE TABLE tbl_paper(
p_id int identity primary key,
st_id int not null,
teacher_id int not null,
quz_id int not null,
co_id int not null,
p_date date not null,
total_marks int not null,
obtain_marks int not null,
constraint stu_id foreign key(st_id) references tbl_student(st_id),
constraint co_id foreign key(co_id) references tbl_course_reg(co_id),
constraint tea_id foreign key(teacher_id) references tbl_teacher(teacher_id),
constraint quz_id foreign key(quz_id) references tbl_quezies(quz_id)
)

---STUDENT FEES DETAILS---

CREATE TABLE tbl_fee(
f_id int identity primary key,
st_id int not null,
f_date date not null,
invoice_no int not null,
last_date date not null,
amount decimal(18,3) not null,
fee_dues_id int not null,
fee_type_id int not null,
bank_id int not null,
constraint fee_dues_id foreign key(fee_dues_id) references tbl_fee_dues(fee_dues_id),
constraint fee_type_id foreign key(fee_type_id) references tbl_fee_dues(fee_type_id),
constraint bank_id foreign key(bank_id) references tbl_fee_dues(bank_id)
)

CREATE TABLE tbl_fee_dues(
fee_dues_id int identity primary key,
due_date date not null,
due_amount decimal(18,3) not null
)

CREATE TABLE tbl_fee_type(
fee_type_id int identity primary key,
fee_type_name varchar(29),
status_due varchar(20) not null,
amount decimal(18,3) not null
)

CREATE TABLE tbl_bank(
bank_id int identity primary key,
bank_name varchar(12) not null,
bank_phone_no int not null,
school_account_no int not null,
deposit_date date not null,
deposit_amount decimal(18,3)
)

---SCHOOL EMPLOYEE MANAGEMENT DATABASE---

CREATE TABLE tbl_employee(
emp_id int identity primary key,
emp_name varchar(15) not null,
emp_NO int not null,
emp_father_name varchar(12) not null,
emp_cnic_NO varchar(15)not null,
emp_phoneNo int not null,
emp_join_date date not null,
emp_status varchar(13) not null,
emp_designation_id int not null,
emp_type_id int not null,
emp_category_id int not null,
constraint designation_id foreign key(emp_designation_id) references tbl_designation(emp_designation_id),
constraint emp_type_id foreign key(emp_type_id) references tbl_employee_type(emp_type_id),
constraint emp_category_id foreign key(emp_category_id) references tbl_employee_category(emp_category_id)
)

CREATE TABLE tbl_designation(
emp_designation_id int identity primary key,
des_name varchar(19) not null
)

CREATE TABLE tbl_employee_type(
emp_type_id int identity primary key,
emp_type_name varchar(14)not null
)

CREATE TABLE tbl_employee_category(
emp_category_id int identity primary key,
emp_cate_name varchar(14)not null
)


---EMPLOYEE SALARY MANAGEMENT DATABASE--

CREATE TABLE tbl_salary(
salary_id int identity primary key,
emp_id int not null,
designation_id int not null,
allowance_id int,
bouns_id int not null,
advance_salary_id int not null,
total_salary decimal(18,3) not null,
salary_status varchar(13),
constraint employee_id foreign key(emp_id) references tbl_employee(emp_id),
constraint desig_id foreign key(designation_id) references tbl_designation(emp_designation_id),
constraint allowance_id foreign key(allowance_id) references tbl_allowance(allowance_id),
constraint bouns_id foreign key(bouns_id) references tbl_bouns(bouns_id),
constraint advance_salary_id foreign key(advance_salary_id) references tbl_advance_salary(advance_salary_id)
)

CREATE TABLE tbl_allowance(
allowance_id int identity primary key,
all_name varchar(23) not null,
all_status varchar(13) not null,
all_amount decimal(18,3) not null
)

CREATE TABLE tbl_bouns(
bouns_id int identity primary key,
bouns_name varchar(23) not null,
bouns_amount decimal(18,3) not null,
bouns_status varchar(23) not null
)

CREATE TABLE tbl_advance_salary(
advance_salary_id int identity primary key,
emp_id int not null,
advance_salary_for_mouths decimal(18,3)not null,
total_amount decimal(18,3) not null,
recover_duration int not null,
per_mouth_recover_amount decimal(18,3) not null,
recover_date date not null
)


---USER DATABASE--

CREATE TABLE tbl_user(
user_id int identity primary key,
user_name varchar(39) not null,
password varchar(23) not null,
role_id int not null,
constraint role_id foreign key(role_id) references tbl_role(role_id)
)

CREATE TABLE tbl_role(
role_id int identity primary key,
role_name varchar(34) not null
)

