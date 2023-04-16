CREATE TABLE [msdb].[dbo][Customers]
(
	[Id] VARCHAR(5) NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(MAX) NULL, 
    [Address] VARCHAR(50) NULL, 
    [City] VARCHAR(50) NULL, 
    [Country] VARCHAR(50) NULL, 
    [PostalCode] NVARCHAR(50) NULL, 
    [Phone] NVARCHAR(50) NULL
)