------------Login-----------------------------
create database library
use library
create table login
(
username nvarchar(20),
password nvarchar(20)
)
insert into login(username,password)values ('Admin','112003')

select*from login

-----------------procedure Login----------------
Go
create procedure Sp_login
@username nvarchar(20),
@password nvarchar(20)
As
Begin
  select *from login where username=@username and password=@password
End

-----------------------Table AddBook-----------------------------------

Go
create table tb1_books
(
BookId int Identity(1,1),
BookName nvarchar(30),
AuthorName nvarchar(30),
Publication nvarchar(30),
PurchaseDate nvarchar(40),
BookPrice nvarchar(20),  
Quantity nvarchar(30))
select*from tb1_books
--------------procedure AddBook-----------------------------------
Go
create procedure sp_Add_books
(
@BookName nvarchar(30),
@AuthorName nvarchar(30),
@Publication nvarchar(30),
@PurchaseDate nvarchar(40),
@BookPrice nvarchar(20),  
@Quantity nvarchar(30))
AS
Begin

Insert into tb1_books(BookName ,AuthorName ,
Publication ,PurchaseDate ,
BookPrice ,  Quantity )
Values(
@BookName ,@AuthorName ,
@Publication ,@PurchaseDate ,
@BookPrice ,  @Quantity )
End
------------------------------procedeure ViewBooks--------------------------
Go
Create Procedure View_Books
@BookName Nvarchar(30)
AS
BEGIN
IF (@BookName = '')
BEGIN
select * from tb1_books
END
ELSE

BEGIN
select * from tb1_books Where BookName =@BookName
END

END
select*
-------------------------- Table Add Student-------------------------

Create table students(
Student_Name Nvarchar(20),
Entrollment_Number Nvarchar(30),
Department  Nvarchar(30),
contact Nvarchar(20),
Email Nvarchar(30),
Semester Nvarchar(20)
)
------------------------procedure Add Student-----------------------------
Go
Create procedure sp_addStudents
(
@Student_Name Nvarchar(20),
@Entrollment_Number Nvarchar(30),
@Department  Nvarchar(30),
@contact Nvarchar(20),
@Email Nvarchar(30),
@Semester Nvarchar(20)
)
AS
BEGIN
insert into students (Student_Name,
Entrollment_Number,
Department,
contact,
Email,Semester
)
VALUES
(@Student_Name,
@Entrollment_Number ,
@Department  ,
@contact ,
@Email ,
@Semester);

END
select*from students
---------------------------procedure View Students-----------------
Go
Create Procedure [dbo].[ViewStudents]
@EntrollmentNO Nvarchar(30)
AS
BEGIN
IF ( @EntrollmentNO= '')
BEGIN
select* from students
END
ELSE

BEGIN
select * from students Where
  Entrollment_Number=@EntrollmentNO
END
END

--------------------------Data of Issue Book---------------------------
Go
Create Procedure sp_getbooks
AS
BEGIN
  Select BookName from tb1_books
END
---------------------- Table Issue Book-----------------------------------

Create Table issue_book
(
Issue_ID int IDENTITY(1,1),
Student_Name Nvarchar(30),
Enrollment_no nvarchar(30),
Department Nvarchar(30),
Contact Nvarchar(30),
Email Nvarchar(30),
BookName Nvarchar(30),
Issue_Date Nvarchar(50),
Return_Date Nvarchar(50)
)
-----------------------procedure Issue Book----------------------------------
Go
Create Procedure sp_addissuebook
@Student_Name Nvarchar(30),
@Enrollment_no nvarchar(30),
@Department Nvarchar(30),
@Contact Nvarchar(30),
@Email Nvarchar(30),
@BookName Nvarchar(30),
@Issue_Date Nvarchar(50),
@Return_Date Nvarchar(50)
As
BEGIN
  INSERT INTO issue_book(
  Student_Name ,Enrollment_no ,
  Department ,Contact ,Email ,
  BookName ,Issue_Date ,Return_Date 
  )
Values(
@Student_Name ,@Enrollment_no ,
@Department ,@Contact ,@Email ,
@BookName ,@Issue_Date ,@Return_Date 
)
END
------------------------procedure View Issue Book
Go
Create Procedure [dbo].[ViewIssueBook]
@EntrollmentNO Nvarchar(30)
AS
BEGIN
IF ( @EntrollmentNO= '')
BEGIN
select * from issue_book
END
ELSE

BEGIN
select * from issue_book Where
  Enrollment_no=@EntrollmentNO
END

END
----------------------procedure Update Issue Book-----------------------
Go
Create Procedure Update_issueBook
@ID Nvarchar(30),
@Return_Date Nvarchar(30)
As
BEGIN
  Update  issue_book set Return_Date=@Return_Date
  where Issue_ID=@ID

END
-------------------procedure Reports------------------------------------
Go
Create procedure Reports
@report nvarchar(30)
AS
BEGIN
  IF(@report = 'Issue')
  BEGIN
  select * from dbo.issue_book where 
  Return_Date = ''
  END
   ELSE IF(@report = 'Return')
  BEGIN
  select * from dbo.issue_book where 
  Return_Date = ''
  END
END


