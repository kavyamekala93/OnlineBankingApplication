USE [Banking]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchName] [varchar](50) NOT NULL,
	[BranchContactNO] [varchar](50) NULL,
	[ManagerName] [varchar](50) NOT NULL,
	[ManagerContactNO] [varchar](50) NULL,
 CONSTRAINT [PK_Branch_1] PRIMARY KEY CLUSTERED 
(
	[BranchName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SelectInterest]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectInterest]
@Term varchar(50)
AS
BEGIN
SELECT
     
Term,      
MinimumAmount,    
RateOfInterest

FROM Interest
WHERE Term = @Term
END
GO
/****** Object:  StoredProcedure [dbo].[InsertInterest]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInterest]

@Term      varchar(50),
@MinimumAmount    float,
@RateOfInterest    float


AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Interest
VALUES
(
     
@Term,      
@MinimumAmount,    
@RateOfInterest
 
)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterest]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInterest]
    @Term    varchar(50)
AS
BEGIN
DELETE FROM Interest
WHERE Term = @Term
END
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[Security_Question] [varchar](5000) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SelectPayee_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPayee_Details]
@AccountNO   varchar(50)
AS
BEGIN
SELECT
AccountNO,
OtherAccountNO

ReceiverBranchName,



AmountTransferred
FROM Payee_Details
WHERE AccountNO = @AccountNO
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPayee_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPayee_Details]
@AccountNO    varchar(50),
@OtherAccountNO    varchar(50),

@ReceiverBranchName     varchar(50),



@AmountTransferred   float

AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Payee_Details
VALUES
(
@AccountNO,
@OtherAccountNO,

@ReceiverBranchName,



@AmountTransferred
)
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePayee_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePayee_Details]
@AccountNO    varchar(50)
AS
BEGIN
DELETE FROM Payee_Details
WHERE AccountNO = @AccountNO
END
GO
/****** Object:  Table [dbo].[Payee_Detail]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payee_Detail](
	[PayerAccountNO] [varchar](50) NOT NULL,
	[PayeeAccountNO] [varchar](50) NOT NULL,
	[PayeeName] [varchar](50) NOT NULL,
	[PayeeBranch] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateInterest]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInterest]

@Term      varchar(50),
@MinimumAmount    float,
@RateOfInterest    float


AS
BEGIN
UPDATE Interest
SET
Term = @Term,      
MinimumAmount = @MinimumAmount,    
RateOfInterest = @RateOfInterest


WHERE Term = @Term
END
GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Details](
	[Name] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[Pssword] [varchar](50) NOT NULL,
	[EmailID] [varchar](50) NOT NULL,
	[PhoneNO] [varchar](50) NOT NULL,
	[Adress] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Occupation] [varchar](50) NOT NULL,
	[YearlyIncome] [float] NOT NULL,
	[SecurityQuestion] [varchar](5000) NULL,
	[Answer] [varchar](5000) NULL,
 CONSTRAINT [PK_User_Details] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdatePayee_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePayee_Details]
@AccountNO    varchar(50),
@OtherAccountNO    varchar(50),

@ReceiverBranchName     varchar(50),



@AmountTransferred   float

AS
BEGIN

UPDATE Payee_Details
SET
OtherAccountNO = @OtherAccountNO,

ReceiverBranchName = @ReceiverBranchName,



AmountTransferred = @AmountTransferred

WHERE AccountNO = @AccountNO
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePassword]
       @Newpasswrd							Varchar(50)                      , 
       @UserID								VARCHAR(50)      
                        
       
       AS
       BEGIN
       UPDATE User_Details
       SET
      						 
       								 
       					    
       Pssword = @Newpasswrd  
       
       WHERE UserID = @UserID
       END
GO
/****** Object:  StoredProcedure [dbo].[spSelectNameOfUser]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectNameOfUser]
@UserID      varchar(50)
AS
BEGIN
SELECT

Name
 
 FROM User_Details
 WHERE UserID = @UserID
 END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser_Details] 
	 @Name									Varchar(50)                      , 
       @UserID							Varchar(50),
       @Pssword						    Varchar(50)                  , 
       @EmailID							    VARCHAR(50)       , 
       @PhoneNO                     Varchar(50)         , 
       @Adress                           Varchar(50)   , 
       @Age							Int,
       @Gender														Varchar(50),
       @Occupation				Varchar(50),
       @YearlyIncome				float
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	UPDATE User_Details
  SET 

	   Name = @Name, 
        
       Pssword = @Pssword, 
       EmailID = @EmailID, 
       PhoneNO = @PhoneNO, 
       Adress =  @Adress,                 
       Age = @Age,					
       Gender = @Gender,
       Occupation = @Occupation,
       YearlyIncome = @YearlyIncome			
       
       WHERE UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertPayee_Detail]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertPayee_Detail]
@PayerAccountNO    varchar(50),
@PayeeAccountNO    varchar(50),
@PayeeName varchar(50),
@PayeeBranch  varchar(50)

AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Payee_Detail
VALUES
(
@PayerAccountNO,
@PayeeAccountNO,
@PayeeName ,
@PayeeBranch
)
END
GO
/****** Object:  StoredProcedure [dbo].[spFetchRcvrName]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFetchRcvrName]
@AccountNO varchar(50)
AS
BEGIN
	
	
	SELECT PayeeName from Payee_Detail
	
	WHERE PayerAccountNO=@AccountNO

END
GO
/****** Object:  StoredProcedure [dbo].[spFetchAccountNo]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFetchAccountNo]
@Name varchar(50)
AS
BEGIN
	
	
	SELECT PayeeAccountNO from Payee_Detail  where PayeeName=@Name 
END
GO
/****** Object:  StoredProcedure [dbo].[spcheckanswer]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcheckanswer]
@userid varchar(1000),
@Answer varchar(50)
AS
BEGIN
	
	DECLARE @ans varchar(50)
	
	SELECT @ans= Answer FROM User_Details where UserID=@userid
	IF @Answer = @ans
	BEGIN
	SELECT 1 AS ReturnCode
	END
	
	ELSE
	BEGIN
	SELECT -1 AS ReturnCode
	END
	 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUser_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUser_Details] 
	 --@Name									Varchar(50)                      , 
       @UserID							Varchar(50)
       --@Pssword						    Varchar(50)                  , 
       --@EmailID							    VARCHAR(50)       , 
       --@PhoneNO                     Varchar(50)         , 
       --@Adress                           Varchar(50)   , 
       --@Age							Int,
       --@Gender														Varchar(50),
       --@Occupation				Varchar(50),
       --@YearlyIncome				float
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SELECT 
  

	  Name, 
        UserID,
       Pssword, 
       EmailID, 
       PhoneNO, 
       Adress,                 
       Age,					
       Gender,
       Occupation,
       YearlyIncome	
       
       FROM User_Details		
       
       WHERE UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBranch]

@BranchName     varchar(50),
@BranchContactNO  varchar(50),
@ManagerName     varchar(50),
@ManagerContactNO    varchar(50)

AS
BEGIN

UPDATE Branch
SET

BranchContactNO = @BranchContactNO,
ManagerName = @ManagerName ,
ManagerContactNO = @ManagerContactNO

WHERE BranchName = @BranchName
END
GO
/****** Object:  StoredProcedure [dbo].[Login_User]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login_User]
@UserID varchar(50),  
@Pssword varchar(50)  
AS  
BEGIN  
 DECLARE @Count INT  
 SELECT @Count = COUNT(UserID)  
    FROM User_Details
 WHERE [UserID] = @UserID AND [Pssword] = @Pssword  
   
 IF(@Count =1)  
 BEGIN  
  SELECT 1 AS ReturnCode  
 END  
 ELSE  
 BEGIN  
  SELECT -1 AS ReturnCode  
 END  
   
END
GO
/****** Object:  StoredProcedure [dbo].[Login_Admin]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login_Admin]
@UserID varchar(50),  
@Pssword varchar(50)  
AS  
BEGIN  
 DECLARE @Count INT  
 SELECT @Count = COUNT(UserID)  
    FROM User_Details
 WHERE [UserID] = @UserID AND [AdminPassword] = @Pssword  
   
 IF(@Count =1)  
 BEGIN  
  SELECT 1 AS ReturnCode  
 END  
 ELSE  
 BEGIN  
  SELECT -1 AS ReturnCode  
 END  
   
END
GO
/****** Object:  StoredProcedure [dbo].[ListSecurityQuestion]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListSecurityQuestion]
AS
BEGIN
SELECT Security_Question FROM SecurityQuestion
END
GO
/****** Object:  StoredProcedure [dbo].[ListBranchName]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListBranchName]
AS
BEGIN
SELECT BranchName FROM Branch
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUser_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUser_Details] 
	 @Name									Varchar(50)                      , 
       @UserID								VARCHAR(50)      , 
       @Pssword						    Varchar(50)                  , 
       @EmailID							    VARCHAR(50)       , 
       @PhoneNO                     Varchar(50)         , 
       @Adress                           Varchar(50)   , 
       @Age							Int,
       @Gender														Varchar(50),
       @Occupation				Varchar(50),
       @YearlyIncome				float,
       @SecurityQuestion                Varchar(5000),
       @Answer               Varchar(5000)
       
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT into dbo.User_Details(Name,UserID,Pssword,EmailID,PhoneNO,Adress,Age,Gender,Occupation,YearlyIncome,SecurityQuestion,Answer)
   VALUES  (
	   @Name, 
       @UserID, 
       @Pssword, 
       @EmailID, 
       @PhoneNO, 
       @Adress,                 
       @Age,					
       @Gender,
       @Occupation,
       @YearlyIncome,
       @SecurityQuestion,
       @Answer			
       )
END
GO
/****** Object:  StoredProcedure [dbo].[SelectBranch]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBranch]
@BranchName    varchar(50)
AS
BEGIN SELECT
BranchName,
BranchContactNO,
ManagerName,
ManagerContactNO

FROM Branch
WHERE BranchName = @BranchName
END
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNO] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[OpeningAmount] [float] NOT NULL,
	[OpeningDate] [datetime] NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[Balance] [float] NULL,
	[RandomNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser_Details]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery2.sql|20|0|C:\Users\IBM_ADMIN\AppData\Local\Temp\~vs3675.sql
CREATE PROCEDURE [dbo].[DeleteUser_Details]
	 
       @UserID								VARCHAR(50)      
AS      
BEGIN
	
DELETE FROM User_Details
WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBranch]
@BranchName    varchar(50)
AS
BEGIN
DELETE FROM Branch
WHERE BranchName = @BranchName
END
GO
/****** Object:  StoredProcedure [dbo].[FillManagerName]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillManagerName]
@BranchName varchar(50)
AS
BEGIN 
SELECT ManagerName FROM Branch WHERE BranchName = @BranchName
END
GO
/****** Object:  StoredProcedure [dbo].[FillManagerContact]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillManagerContact]
@BranchName varchar(50)
AS
BEGIN
SELECT
ManagerContactNO

FROM Branch 
WHERE BranchName = @BranchName
END
GO
/****** Object:  StoredProcedure [dbo].[FillBranchContact]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillBranchContact]
@BranchName varchar(50)
AS
BEGIN
SELECT
BranchContactNO

FROM Branch 
WHERE BranchName = @BranchName
END
GO
/****** Object:  StoredProcedure [dbo].[FetchSecurityquestion]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchSecurityquestion]
@userid varchar(50)
AS
BEGIN
SELECT SecurityQuestion FROM User_Details
WHERE UserID=@userid
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBranch]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBranch]

@BranchName     varchar(50),
@BranchContactNO  varchar(50),
@ManagerName     varchar(50),
@ManagerContactNO    varchar(50)

AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Branch
VALUES
(

@BranchName,
@BranchContactNO,
@ManagerName,
@ManagerContactNO 
)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAccountDetails]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAccountDetails]
       @AccountNO Varchar(50)                      , 
       @UserID VARCHAR(50)      , 
       
       @OpeningAmount  float   ,
       @OpeningDate                     datetime   ,
       
       @BranchName                      varchar(50),
       @Balance              float,
       @Rnumber VARCHAR(MAX)
       
       AS
       BEGIN
       SET NOCOUNT ON;
       INSERT into Account(AccountNO,UserID,OpeningAmount,OpeningDate,BranchName,Balance, RandomNumber)
       Values
       (
       @AccountNO,							 
       @UserID,								 
      					    
       @OpeningAmount,                   
       @OpeningDate,                     
                               
       @BranchName,
       @Balance,
       @Rnumber
       )
       END
GO
/****** Object:  StoredProcedure [dbo].[InsertAccount]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAccount]
       @AccountNO							Varchar(50)                      , 
       @UserID								VARCHAR(50)      , 
       
       @OpeningAmount                   float   ,
       @OpeningDate                     datetime   ,
       @Balance                          float,
       @BranchName                      varchar(50)
       AS
       BEGIN
       SET NOCOUNT ON;
       INSERT into Account
       Values
       (
       @AccountNO,							 
       @UserID,								 
      					    
       @OpeningAmount,                   
       @OpeningDate,                     
            @Balance,                  
       @BranchName  
       )
       END
GO
/****** Object:  StoredProcedure [dbo].[FetchBranchName]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchBranchName]
@AccountNO varchar(50)
AS
BEGIN
	
	
	SELECT BranchName from Account where AccountNO=@AccountNO 
END
GO
/****** Object:  StoredProcedure [dbo].[FetchBalance]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchBalance]  
@AccountNO varchar(50)  
AS  
BEGIN  
SELECT Round(Balance,2), RandomNumber FROM Account  
WHERE AccountNO=@AccountNO  
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccount]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAccount]
        @AccountNO    varchar(50)
AS
BEGIN
DELETE FROM Account
WHERE AccountNO = @AccountNO
END
GO
/****** Object:  StoredProcedure [dbo].[BranchBalance]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BranchBalance]
	
	
AS
BEGIN
	
	
	SELECT SUM(Balance) FROM Account 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAccountNo]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAccountNo]
@UserID varchar(50)
AS
BEGIN

	
	SELECT AccountNO from Account where UserID=@UserID 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAccount]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAccount]
@AccountNO       varchar(50)
AS
BEGIN
SELECT

AccountNO,
 UserID, 								 
 					    
 OpeningAmount,                   
 OpeningDate,                     
       Balance,                   
 BranchName
 
 FROM Account
 WHERE AccountNO = @AccountNO
 END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccount]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAccount]
       @AccountNO							Varchar(50)                      , 
       @UserID								VARCHAR(50)      , 
                        
       @OpeningAmount                   float   ,
       @OpeningDate                     datetime   ,
       @Balance                          float,
       @BranchName                     varchar(50)
       AS
       BEGIN
       UPDATE Account
       SET
      						 
       UserID = @UserID,								 
       					    
       OpeningAmount = @OpeningAmount,                   
       OpeningDate = @OpeningDate,                     
         Balance = @Balance,                    
       BranchName = @BranchName  
       
       WHERE AccountNO = @AccountNO
       END
GO
/****** Object:  Table [dbo].[Statement]    Script Date: 10/27/2014 16:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statement](
	[AccountNO] [varchar](50) NOT NULL,
	[DepositAmount] [float] NULL,
	[WithdrawalAmount] [float] NULL,
	[DateAndTime] [datetime] NULL,
	[Description] [varchar](50) NULL,
	[Balance] [float] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBalance]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateBalance]
       @AccountNO Varchar(50),@Amount float,@Type varchar(50),
       @Lud NVARCHAR(MAX),
       @Rannumber   NVARCHAR(MAX)                   
       AS
BEGIN
 DECLARE @Success INT
 DECLARE @Lud1 NVARCHAR(MAX) 
 
 SELECT @Lud1 = RandomNumber FROM Account WHERE AccountNO = @AccountNO
 
 IF(@Lud = @Lud1)
 BEGIN
 
      IF(@TYPE='DEPOSIT')
       BEGIN
			UPDATE Account
			SET
			Balance=Balance+ @Amount,	
			RandomNumber = @Rannumber
			WHERE AccountNO = @AccountNO
       END   
       ELSE 
       BEGIN
			UPDATE Account
			SET
			Balance = Balance-@Amount,
			RandomNumber = @Rannumber	
			WHERE AccountNO = @AccountNO
		END
	Return 1
	
 END 
 ELSE
 BEGIN
 	Return -1
 END
 
END
GO
/****** Object:  StoredProcedure [dbo].[spPayeeBalance]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPayeeBalance]
       @AccountNO Varchar(50),@Amount float,@PayeeAccNo Varchar(50)
       --@Lud NVARCHAR(MAX),
       --@Rannumber   NVARCHAR(MAX)                   
       AS
BEGIN
 --DECLARE @Success INT
 --DECLARE @Lud1 NVARCHAR(MAX) 
 
 --SELECT @Lud1 = RandomNumber FROM Account WHERE AccountNO = @AccountNO
 --SELECT @PayeeAccNo = PayeeAccountNO From Payee_Detail
 
 --IF(@Lud = @Lud1)
 
 
      
       BEGIN
			UPDATE Account
			SET
			Balance=Balance + @Amount
			
			WHERE AccountNO=@PayeeAccNo
       END   
       
	--Return 1
	
 --END 
 --ELSE
 --BEGIN
 --	Return -1
 --END
 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserID]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUserID]
@AccountNO varchar(50)
AS
BEGIN
SELECT UserID FROM Account
WHERE AccountNO=@AccountNO
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectLastTen]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectLastTen]
@AccountNO   varchar(50)
AS
BEGIN
create table dummy
(AccountNO VARCHAR(50),DepositAmount float,WithdrawalAmount FLOAT, DateAndTime Datetime,Description varchar(50),Balance float)
 
 insert into dummy 
 select * from Statement where AccountNO=@AccountNO ORDER BY DateAndTime 

create table dummy1
(AccountNO VARCHAR(50),DepositAmount float,WithdrawalAmount FLOAT, DateAndTime Datetime,Description varchar(50),Balance float)

insert into dummy1
SELECT top 10
*
FROM dummy order by DateAndTime desc

SELECT * FROM dummy1 order by DateAndTime asc

drop table dummy1
drop table dummy

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectAllStatement]
@AccountNO   varchar(50)
AS
BEGIN
SELECT
AccountNO,
DepositAmount, 
WithdrawalAmount,
DateAndTime,
Description,
Balance

FROM Statement

WHERE AccountNO = @AccountNO Order by DateAndTime
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatement]
@AccountNO  varchar(50),

@DepositAmount  float,
@WithdrawalAmount    float,
@DateAndTime  datetime,
@Description   varchar(50),
@Balance    float

AS
BEGIN 

UPDATE Statement
SET

DepositAmount = @DepositAmount, 
WithdrawalAmount = @WithdrawalAmount,
DateAndTime = @DateAndTime,
Description = @Description,
Balance = @Balance

WHERE AccountNO = @AccountNO
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertStatement]
@AccountNO  varchar(50),
@DepositAmount  float,
@WithdrawalAmount    float,
@DateAndTime  datetime,
@Description   varchar(50),
@Balance    float

AS
BEGIN 
SET NOCOUNT ON;
INSERT INTO Statement
VALUES
(
  @AccountNO, 
@DepositAmount ,
@WithdrawalAmount,
@DateAndTime,
@Description,
@Balance
)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStatementByDate]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStatementByDate]
@AccountNO   varchar(50),
@Date1 datetime,
@Date2 datetime
AS
BEGIN
SELECT
AccountNO,
DepositAmount, 
WithdrawalAmount,
DateAndTime,
Description,
Balance

FROM Statement

WHERE AccountNO = @AccountNO and
(DateAndTime between @Date1 and @Date2)
Order by DateAndTime
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStatement]
@AccountNO    varchar(50)
AS
BEGIN
SELECT
AccountNO,
--DepositAmount,
--WithdrawalAmount,
Round(DepositAmount,2)as DepositAmount,
Round(WithdrawalAmount,2)as WithdrawalAmount,
DateAndTime,
Description,
Round(Balance,2)as Balance

FROM Statement 
WHERE AccountNO = @AccountNO order by DateAndTime
END
GO
/****** Object:  StoredProcedure [dbo].[spCalculateInterest]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCalculateInterest]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Account set Balance=1.1*Balance
	insert into Statement(AccountNO, DepositAmount, WithdrawalAmount,DateAndTime,[Description],Balance)
select AccountNO,Balance/11,0,getdate(), 'Interest by Bank',Balance
from Account where Balance!=0
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectStatementByDate]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectStatementByDate]
@AccountNO   varchar(50),
@Date1 datetime,
@Date2 datetime
AS
BEGIN
SELECT
AccountNO,
DepositAmount, 
WithdrawalAmount,
DateAndTime,
Description,
Balance

FROM Statement

WHERE AccountNO = @AccountNO and
(DateAndTime between @Date1 and (@Date2+1))
Order by DateAndTime
END
GO
/****** Object:  StoredProcedure [dbo].[InsertStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStatement]
@AccountNO  varchar(50),

@DepositAmount  float,
@WithdrawalAmount    float,
@DateAndTime  datetime,
@Description   varchar(50),
@Balance    float

AS
BEGIN 
SET NOCOUNT ON;
INSERT INTO Statement
VALUES
(
  @AccountNO, 

@DepositAmount ,
@WithdrawalAmount,
@DateAndTime,
@Description,
@Balance
)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStatement]    Script Date: 10/27/2014 16:05:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStatement]
@AccountNO   varchar(50)
AS
BEGIN
DELETE FROM Statement
WHERE AccountNO = @AccountNO
END
GO
/****** Object:  ForeignKey [FK_Account_Branch]    Script Date: 10/27/2014 16:05:16 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Branch] FOREIGN KEY([BranchName])
REFERENCES [dbo].[Branch] ([BranchName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Branch]
GO
/****** Object:  ForeignKey [FK_Account_User_Details]    Script Date: 10/27/2014 16:05:16 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User_Details] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Details] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User_Details]
GO
/****** Object:  ForeignKey [FK_Statement_Account]    Script Date: 10/27/2014 16:05:16 ******/
ALTER TABLE [dbo].[Statement]  WITH CHECK ADD  CONSTRAINT [FK_Statement_Account] FOREIGN KEY([AccountNO])
REFERENCES [dbo].[Account] ([AccountNO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Statement] CHECK CONSTRAINT [FK_Statement_Account]
GO
