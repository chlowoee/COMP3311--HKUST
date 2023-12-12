create table Employee_Table
(employee_ID numeric(8,0),
union_mem# numeric(8,0),
primary key (employee_ID));

create table Technician_Table
(employee_ID numeric(8,0),
tech_name varchar2(80) NOT NULL,
skill_level numeric(2,0) NOT NULL,
salary numeric(7,0) NOT NULL,
city varchar2(80),
street varchar2(80),
house# numeric(4,0),
primary key (employee_ID),
foreign key (employee_ID) references Employee_Table on delete cascade);

create table Technician_phone
(employee_ID numeric(8,0),
phone# numeric(8,0),
primary key(employee_ID, phone#),
foreign key (employee_ID) references Technician_Table on delete cascade);

create table Controller_Table
(employee_ID numeric(8,0),
exam_date date,
primary key (employee_ID),
foreign key (employee_ID) references Employee_Table on delete cascade);

create table Model
(model# numeric(6,0),
capacity numeric(4,0),
weight numeric(5,0),
primary key (model#));

create table Plane
(plane_reg# numeric(10,0),
model# numeric(6,0),
primary key(plane_reg#, model#),
foreign key (model#) references Model on delete cascade);

create table Test
(test# varchar2(3),
plane_reg# numeric(10,0),
model# numeric (6,0),
test_name varchar2(80) NOT NULL,
score numeric(3,0) NOT NULL,
primary key(test#, plane_reg#, model#),
foreign key (plane_reg#, model#) references Plane(plane_reg#, model#) on delete cascade);

create table Done_by
(test# varchar2(3),
plane_reg# numeric(10,0),
model# numeric (6,0),
employee_ID numeric(9,0),
hours numeric(3,0) NOT NULL,
done_date date NOT NULL,
primary key(employee_ID, test#, plane_reg#, model#),
foreign key (employee_ID) references Technician_Table on delete cascade,
foreign key (test#, plane_reg#, model#) references Test(test#, plane_reg#, model#) on delete cascade);

create table Expert_of
(employee_ID numeric(8,0),
model# numeric(6,0),
primary key(employee_ID, model#),
foreign key (employee_ID) references Employee_Table on delete cascade,
foreign key (model#) references Model on delete cascade);
