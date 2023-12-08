

set quoted_identifier on
go

CREATE SCHEMA "Output" AUTHORIZATION "dbo"
go

CREATE SCHEMA "Group4FinalSchema" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Default schema for Group4',
@level0type = N'SCHEMA', @level0name = N'Group4FinalSchema'
go

CREATE SCHEMA "dApplication" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'dApplication Schema for the root domain',
@level0type = N'SCHEMA', @level0name = N'dApplication'
go

CREATE SCHEMA "sdDateTime" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'sdDateTime schema defines the parent domain sdDateTime',
@level0type = N'SCHEMA', @level0name = N'sdDateTime'
go

CREATE SCHEMA "sdTime" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'sdTime schema defines the sdTime domain and its subdomains',
@level0type = N'SCHEMA', @level0name = N'sdTime'
go

CREATE SCHEMA "sdString" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'sdString schema defines the related string objects',
@level0type = N'SCHEMA', @level0name = N'sdString'
go

CREATE SCHEMA "sdNames" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'sdNames schema defines the objects related to names of columns',
@level0type = N'SCHEMA', @level0name = N'sdNames'
go

CREATE SCHEMA "DbSecurity" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'This schema is specifically for the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity'
go

CREATE SCHEMA "sdNumber" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'sdNumber schema defines the subdomains related to Numbers',
@level0type = N'SCHEMA', @level0name = N'sdNumber'
go

CREATE SCHEMA "Location" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Location schema defines the location related objects',
@level0type = N'SCHEMA', @level0name = N'Location'
go

CREATE SCHEMA "HumanResources" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'HumanResources defines the related objects that deals with the employed personel in the company',
@level0type = N'SCHEMA', @level0name = N'HumanResources'
go

CREATE SCHEMA "Marketing" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Marketing schema encapsulates the objects related to the finance sector of the company',
@level0type = N'SCHEMA', @level0name = N'Marketing'
go

CREATE SCHEMA "Inventory" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Inventory Schema defines the items the manufacturer contains',
@level0type = N'SCHEMA', @level0name = N'Inventory'
go

CREATE SCHEMA "Audit" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Audit Schema is to record keeping purposes',
@level0type = N'SCHEMA', @level0name = N'Audit'
go

CREATE SCHEMA "sdInteger" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema for the parent domain sdInteger',
@level0type = N'SCHEMA', @level0name = N'sdInteger'
go

CREATE SCHEMA "sdNumericFlag" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'schema for the parent domain sdNumericFlag',
@level0type = N'SCHEMA', @level0name = N'sdNumericFlag'
go

CREATE SCHEMA "sdDouble" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema for the parent domain sdDouble',
@level0type = N'SCHEMA', @level0name = N'sdDouble'
go

CREATE SCHEMA "sdDates" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema for the parent  domain sdDates',
@level0type = N'SCHEMA', @level0name = N'sdDates'
go

CREATE SCHEMA "sdDescription" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema name for the sdDescription',
@level0type = N'SCHEMA', @level0name = N'sdDescription'
go

CREATE SCHEMA "sdChar" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema name for parent domain sdChar',
@level0type = N'SCHEMA', @level0name = N'sdChar'
go

CREATE SCHEMA "sdNumericString" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema for the parent domain sdNumericString',
@level0type = N'SCHEMA', @level0name = N'sdNumericString'
go

CREATE SCHEMA "sdFlag" AUTHORIZATION "dbo"
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Schema name for sdFlag parent domain',
@level0type = N'SCHEMA', @level0name = N'sdFlag'
go

CREATE SCHEMA "Hashing"
go

CREATE SCHEMA "G4Views" AUTHORIZATION "dbo"
go

CREATE TYPE "Group4FinalSchema"."dApplication"
	FROM CHAR(18) NULL
go

CREATE TYPE "dApplication"."sdString"
	FROM VARCHAR(20) NULL
go

CREATE TYPE "dApplication"."sdDateTime"
	FROM DATETIME NULL
go

CREATE TYPE "dApplication"."sdNumber"
	FROM SMALLINT NOT NULL
go

CREATE TYPE "sdString"."sdNames"
	FROM VARCHAR(10) NULL
go

CREATE TYPE "sdDateTime"."sdTime"
	FROM DATETIME NULL
go

CREATE TYPE "sdDateTime"."sdDate"
	FROM DATETIME NULL
go

CREATE TYPE "sdTime"."ClassTime"
	FROM TIME NULL
go

CREATE TYPE "sdInteger"."SurrogateKeyInt"
	FROM SMALLINT NOT NULL
go

CREATE TYPE "sdNames"."ProjectName"
	FROM CHAR(21) NULL
go

CREATE TYPE "sdNames"."FirstName"
	FROM NVARCHAR(25) NOT NULL
go

CREATE TYPE "sdNames"."LastName"
	FROM NVARCHAR(35) NOT NULL
go

CREATE TYPE "sdNames"."Name"
	FROM NVARCHAR(20) NOT NULL
go

CREATE TYPE "sdDateTime"."DateTimeStamp"
	FROM DATETIME NULL
go

CREATE TYPE "sdString"."sdChar"
	FROM VARCHAR(20) NULL
go

CREATE TYPE "sdChar"."ISO3"
	FROM CHAR(3) NOT NULL
go

CREATE TYPE "sdChar"."ISO2"
	FROM CHAR(2) NOT NULL
go

CREATE TYPE "sdNumber"."sdDouble"
	FROM FLOAT NOT NULL
go

CREATE TYPE "sdNumber"."sdInteger"
	FROM SMALLINT NOT NULL
go

CREATE TYPE "sdInteger"."SmallInteger"
	FROM SMALLINT NOT NULL
go

CREATE TYPE "sdInteger"."BigInteger"
	FROM INT NOT NULL
go

CREATE TYPE "dApplication"."sdFlag"
	FROM CHAR(1) NULL
go

CREATE TYPE "sdFlag"."sdNumericFlag"
	FROM CHAR(1) NULL
go

CREATE TYPE "sdNumericFlag"."BitFlag"
	FROM BIT NULL
go

CREATE TYPE "sdString"."sdNumericString"
	FROM VARCHAR(20) NULL
go

CREATE TYPE "sdNumericString"."PostalCode"
	FROM VARCHAR(10) NULL
go

CREATE TYPE "sdChar"."Invoice"
	FROM CHAR(8) NOT NULL
go

CREATE TYPE "sdDouble"."Currency"
	FROM MONEY NOT NULL
go

CREATE TYPE "sdDates"."DateType"
	FROM DATE NOT NULL
go

CREATE TYPE "sdString"."sdDescription"
	FROM VARCHAR(20) NULL
go

CREATE TYPE "sdDescription"."Description"
	FROM VARCHAR(20) NULL
go

CREATE TYPE "sdNumericString"."StockCode"
	FROM VARCHAR(50) NOT NULL
go

CREATE TYPE "sdNumericString"."HashKey"
	FROM VARBINARY(32) NULL
go

CREATE TABLE "Audit"."CommonColumnsForTriggerTemplate"
( 
	"RowLevelHashKey"    varbinary(32)  NOT NULL ,
	"Note"               nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	"IsDeleted"          nchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	"TransactionNumber"  smallint  NULL ,
	"UserAuthenticatedKey" int  NULL ,
	"SysStartTime"       datetime2(7)  NULL ,
	"SysEndTime"         datetime2(7)  NULL ,
	CONSTRAINT "XPKCommonColumnsForTriggerTemplate" PRIMARY KEY  CLUSTERED ("RowLevelHashKey" ASC)
)
go

CREATE TABLE "Audit"."Country"
( 
	"CountryAuditId"     "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"CountryId"          "sdInteger"."SmallInteger" ,
	"CountryAuditType"   "sdNames"."Name" ,
	"CountryAuditDate"   "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_Country_CountryAuditDate"
		 DEFAULT  sysdatetime(),
	"CountryFieldName"   "sdNames"."Name" ,
	"CountryOldValue"    "sdDescription"."Description" ,
	"CountryNewValue"    "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKCountryHistory" PRIMARY KEY  CLUSTERED ("CountryAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYAUDITID defines the CountryAuditId of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYAUDITTYPE defines the CountryAuditType of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYAUDITDATE defines the CountryAuditDate of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYFIELDNAME defines the CountryFieldName of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYOLDVALUE defines the CountryOldValue of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYNEWVALUE defines the CountryNewValue of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the CountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."Customer"
( 
	"CustomerAuditId"    "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"CustomerId"         "sdInteger"."SmallInteger" ,
	"CustomerAuditType"  "sdNames"."Name" ,
	"CustomerAuditDate"  "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Audit_Customer_CustomerAuditDate"
		 DEFAULT  sysdatetime(),
	"CustomerFieldName"  "sdNames"."Name" ,
	"CustomerOldValue"   "sdDescription"."Description" ,
	"CustomerNewValue"   "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKCustomerHistory" PRIMARY KEY  CLUSTERED ("CustomerAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERAUDITID defines the CustomerAuditId of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERAUDITTYPE defines the CustomerAuditType of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERAUDITDATE defines the CustomerAuditDate of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFIELDNAME defines the CustomerFieldName of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMEROLDVALUE defines the CustomerOldValue of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERNEWVALUE defines the CustomerNewValue of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the CustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."ManufacturerVehicleMake"
( 
	"ManufacturerMakeAuditId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"ManufacturerMakeId" "sdInteger"."SmallInteger" ,
	"ManufacturerMakeAuditType" "sdNames"."Name" ,
	"ManufacturerMakeAuditDate" "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_ManufacturerVehicleMake_ManufacturerMakeAuditDate"
		 DEFAULT  sysdatetime(),
	"ManufacturerMakeFieldName" "sdNames"."Name" ,
	"ManufacturerMakeOldValue" "sdDescription"."Description" ,
	"ManufacturerMakeNewValue" "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKManufacturerMake" PRIMARY KEY  CLUSTERED ("ManufacturerMakeAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEAUDITID defines the ManufacturerMakeAuditId of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEID defines the ManufacturerMakeId of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEAUDITTYPE defines the ManufacturerMakeAuditType of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEAUDITDATE defines the ManufacturerMakeAuditDate of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEFIELDNAME defines the ManufacturerMakeFieldName of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKEOLDVALUE defines the ManufacturerMakeOldValue of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMAKENEWVALUE defines the ManufacturerMakeNewValue of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerMakeNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."ManufacturerVehicleModel"
( 
	"ManufacturerModelAuditId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"ManufacturerVehicleModelID" "sdInteger"."SmallInteger" ,
	"ManufacturerModelAuditType" "sdNames"."Name" ,
	"ManufacturerModelAuditDate" "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_ManufacturerModelVehicle_ManufacturerVehicleModelAuditDate"
		 DEFAULT  sysdatetime(),
	"ManufacturerModelFieldName" "sdNames"."Name" ,
	"ManufacturerModelOldValue" "sdDescription"."Description" ,
	"ManufacturerModelNewValue" "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKManufacturerModel" PRIMARY KEY  CLUSTERED ("ManufacturerModelAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELAUDITID defines the ManufacturerModelAuditId of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelID of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELAUDITTYPE defines the ManufacturerModelAuditType of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELAUDITDATE defines the ManufacturerModelAuditDate of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELFIELDNAME defines the ManufacturerModelFieldName of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELOLDVALUE defines the ManufacturerModelOldValue of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODELNEWVALUE defines the ManufacturerModelNewValue of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleStockAuditId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"ManufacturerVehicleModelId" "sdInteger"."SmallInteger" ,
	"ManufacturerVehicleStockAuditType" "sdNames"."Name" ,
	"ManufacturerVehicleStockAuditDate" "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_ManufacturerVehicleStock_ManufacturerVehicleStockAuditDate"
		 DEFAULT  sysdatetime(),
	"ManufacturerVehicleStocFieldName" "sdNames"."Name" ,
	"ManufacturerVehicleStockOldValue" "sdDescription"."Description" ,
	"ManufacturerVehicleStockNewValue" "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKManufacturerVehicleStockHistory" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleStockAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKAUDITID defines the ManufacturerVehicleStockAuditId of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKAUDITTYPE defines the ManufacturerVehicleStockAuditType of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKAUDITDATE defines the ManufacturerVehicleStockAuditDate of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCFIELDNAME defines the ManufacturerVehicleStocFieldName of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStocFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKOLDVALUE defines the ManufacturerVehicleStockOldValue of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKNEWVALUE defines the ManufacturerVehicleStockNewValue of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."SalesOrderVehicle"
( 
	"SalesOrderVehicleAuditId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"SalesOrderVehicleId" "sdInteger"."SmallInteger" ,
	"SalesOrderVehicleAuditType" "sdNames"."Name" ,
	"SalesOrderVehicleAuditDate" "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_SalesOrderVehicle_SalesOrderVehicleAuditDate"
		 DEFAULT  sysdatetime(),
	"SalesOrderVehicleFieldName" "sdNames"."Name" ,
	"SalesOrderVehicleOldValue" "sdDescription"."Description" ,
	"SalesOrderVehicleHNewValue" "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKSalesOrderVehicleHistory" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEAUDITID defines the SalesOrderVehicleAuditId of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEAUDITTYPE defines the SalesOrderVehicleAuditType of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEAUDITDATE defines the SalesOrderVehicleAuditDate of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEFIELDNAME defines the SalesOrderVehicleFieldName of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEOLDVALUE defines the SalesOrderVehicleOldValue of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEHNEWVALUE defines the SalesOrderVehicleHNewValue of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleHNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleDetailAuditId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"SalesOrderVehicleDetailId" "sdInteger"."SmallInteger" ,
	"SalesOrderVehicleDetailAuditType" "sdNames"."Name" ,
	"SalesOrderVehicleDetailAuditDate" "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_SalesOrderVehicleDetail_SalesOrderVehicleDetailAuditDate"
		 DEFAULT  sysdatetime(),
	"SalesOrderVehicleDetailFieldName" "sdNames"."Name" ,
	"SalesOrderVehicleDetailOldValue" "sdDescription"."Description" ,
	"SalesOrderVehicleDetailNewValue" "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKSalesOrderVehicleDetailHistory" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleDetailAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILAUDITID defines the SalesOrderVehicleDetailAuditId of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILAUDITTYPE defines the SalesOrderVehicleDetailAuditType of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILAUDITDATE defines the SalesOrderVehicleDetailAuditDate of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILFIELDNAME defines the SalesOrderVehicleDetailFieldName of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILOLDVALUE defines the SalesOrderVehicleDetailOldValue of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILNEWVALUE defines the SalesOrderVehicleDetailNewValue of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "DbSecurity"."UserAuthorization"
( 
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"ClassTime"          "sdTime"."ClassTime" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_ClassTime"
		 DEFAULT  '10:45',
	"IndividualProject"  "sdNames"."ProjectName" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_IndividualProject"
		 DEFAULT  'CSCI381 Final Project',
	"GroupMemberFirstName" "sdNames"."FirstName" 
	CONSTRAINT "CK_DbSecurity_UserAuthorization_GroupMemberFirstName"
		CHECK  ( GroupMemberFirstName LIKE '%^[A-Za-z]%' ),
	"GroupMemberLastName" "sdNames"."LastName" 
	CONSTRAINT "CK_DbSecurity_UserAuthorization_GroupMemberLastName"
		CHECK  ( GroupMemberLastName LIKE '%^[A-Za-z]%' ),
	"GroupName"          "sdNames"."Name" 
	CONSTRAINT "CK_DbSecurity_UserAuthorization_GroupName"
		CHECK  ( GroupName LIKE '%^[A-Za-z]%' ),
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_SysEndTime"
		 DEFAULT  sysdatetime(),
	CONSTRAINT "XPKUserAuthorization" PRIMARY KEY  CLUSTERED ("UserAuthorizationId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATION table defines authorized users that are able to manipulate other columns in the data model',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CLASSTIME defines the ClassTime of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'ClassTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The INDIVIDUALPROJECT defines the IndividualProject of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'IndividualProject'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The GROUPMEMBERLASTNAME defines the GroupMemberLastName of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupMemberLastName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The GROUPMEMBERFIRSTNAME defines the GroupMemberFirstName of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupMemberFirstName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The GROUPNAME defines the GroupName of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the UserAuthorization',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

CREATE TABLE "Location"."Country"
( 
	"CountryId"          "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"CountryISO3"        "sdChar"."ISO3"  NOT NULL 
	CONSTRAINT "CK_Location_Country_CountryISO3"
		CHECK  ( LEN(CountryISO3) = 3 AND CountryISO3 NOT LIKE '%[0-9]%' ),
	"CountryName"        "sdNames"."Name"  NOT NULL 
	CONSTRAINT "CK_Location_Country_CountryName"
		CHECK  ( CountryName LIKE '%^[A-Za-z]%' ),
	"CountryISO2"        "sdChar"."ISO2"  NOT NULL 
	CONSTRAINT "CK_Location_Country_CountryISO2"
		CHECK  ( LEN(CountryISO2) = 2 AND CountryISO2 NOT LIKE '%[0-9]%' ),
	"CountrySalesRegion" "sdNames"."Name"  NULL 
	CONSTRAINT "CK_Location_Country_CountrySalesRegion"
		CHECK  ( CountrySalesRegion LIKE '%^[A-Za-z]%' ),
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"CountrySysStartTime" "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Location_Country_CountrySysStartTime"
		 DEFAULT  sysdatetime(),
	"CountrySysEndTime"  "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Location_Country_CountrySysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_Country" PRIMARY KEY  CLUSTERED ("CountryId" ASC),
	CONSTRAINT "FK_CountrylUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A COUNTRY represent the countries where car manufacturers operate',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYISO3 defines the CountryISO3 of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryISO3'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYNAME defines the CountryName of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYISO2 defines the CountryISO2 of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryISO2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSALESREGION defines the CountrySalesRegion of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountrySalesRegion'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSYSSTARTTIME defines the CountrySysStartTime of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountrySysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSYSENDTIME defines the CountrySysEndTime of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountrySysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Country',
@level0type = N'SCHEMA', @level0name = N'Location',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Marketing"."Customer"
( 
	"CustomerId"         "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"CustomerFirstName"  "sdNames"."FirstName" 
	CONSTRAINT "CK_Marketing_Customer_CustomerFirstName"
		CHECK  ( CustomerFirstName LIKE '%^[A-Za-z]%' ),
	"CustomerLastName"   "sdNames"."LastName"  NOT NULL 
	CONSTRAINT "CK_Marketing_Customer_CustomerLastName"
		CHECK  ( CustomerLastName LIKE '%^[A-Za-z]%' ),
	"CustomerFullName"   AS CONCAT(CustomerFirstName,' ', CustomerLastName) COLLATE SQL_Latin1_General_CP1_CI_AS PERSISTED NOT NULL 
	CONSTRAINT "CK_Marketing_Customer_CustomerFullName"
		CHECK  ( CustomerFullName LIKE '%^[A-Za-z]%' ),
	"CustomerTown"       "sdNames"."Name"  NOT NULL 
	CONSTRAINT "CK_Marketing_Customer_CustomerTown"
		CHECK  ( CustomerTown LIKE '%^[A-Za-z]%' ),
	"CustomerStreetNumber" "sdInteger"."BigInteger" ,
	"CustomerStreetName" "sdNames"."Name" 
	CONSTRAINT "CK_Marketing_Customer_CustomerStreetName"
		CHECK  ( CustomerStreetName LIKE '%^[A-Za-z]%' ),
	"CustomerPostalCode" "sdNumericString"."PostalCode"  NULL 
	CONSTRAINT "DF_Marketing_Customer_CustomerPostalCode"
		 DEFAULT  'Not Provided'
	CONSTRAINT "CK_Marketing_Customer_CustomerPostalCode"
		CHECK  ( CustomerPostalCode LIKE '%[0-9]%' ),
	"CustomerIsCustomerReseller" "sdNumericFlag"."BitFlag"  NOT NULL ,
	"CustomerIsCustomerCreditRisk" "sdNumericFlag"."BitFlag"  NOT NULL ,
	"CountryId"          "sdInteger"."SurrogateKeyInt" ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_Customer_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_Customer_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_Customer" PRIMARY KEY  CLUSTERED ("CustomerId" ASC),
	CONSTRAINT "FK_CustomerCountry_Country" FOREIGN KEY ("CountryId") REFERENCES "Location"."Country"("CountryId"),
	CONSTRAINT "FK_CustomerlUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMER represents individuals or organizations that purchase cars from the manufacturer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERLASTNAME defines the CustomerLastName of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerLastName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERTOWN defines the CustomerTown of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerTown'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERPOSTALCODE defines the CustomerPostalCode of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerPostalCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERISCUSTOMERRESELLER defines the CustomerIsCustomerReseller of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerIsCustomerReseller'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERISCUSTOMERCREDITRISK defines the CustomerIsCustomerCreditRisk of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerIsCustomerCreditRisk'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFIRSTNAME defines the CustomerFirstName of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerFirstName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFULLNAME defines the CustomerFullName of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerFullName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNUMBER defines the CustomerStreetNumber of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerStreetNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNAME defines the CustomerStreetName of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerStreetName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Customer',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "HumanResources"."Department"
( 
	"DepartmentID"       "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"DepartmentName"     "sdNames"."Name" ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"DepartmentSysStartTime" "sdDateTime"."DateTimeStamp" ,
	"DepartmentSysEndTime" "sdDateTime"."DateTimeStamp" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKDepartment" PRIMARY KEY  CLUSTERED ("DepartmentID" ASC),
	CONSTRAINT "FK_DepartmentlUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A DEPARTMENT is an area of specialized personel within the company',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTID defines the DepartmentID of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'DepartmentID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTNAME defines the Name of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'DepartmentName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTSYSSTARTTIME defines the SysStartTime of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'DepartmentSysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTSYSENDTIME defines the SysEndTime of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'DepartmentSysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Department',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Department',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "HumanResources"."Staff"
( 
	"StaffId"            "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"StaffName"          "sdNames"."Name"  NOT NULL 
	CONSTRAINT "CK_HumanResources_Staff_StaffName"
		CHECK  ( StaffName LIKE '%^[A-Za-z]%' ),
	"ManagerID"          "sdInteger"."SmallInteger"  NULL 
	CONSTRAINT "DF_HumanResources_Staff_ManagerID"
		 DEFAULT  0,
	"DepartmentID"       "sdInteger"."SurrogateKeyInt" ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_HumanResources_Staff_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_HumanResources_Staff_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKStaff" PRIMARY KEY  CLUSTERED ("StaffId" ASC),
	CONSTRAINT "FK_StaffStaff_Staff" FOREIGN KEY ("StaffId") REFERENCES "HumanResources"."Staff"("StaffId"),
	CONSTRAINT "FK_StaffDepartment_Department" FOREIGN KEY ("DepartmentID") REFERENCES "HumanResources"."Department"("DepartmentID"),
	CONSTRAINT "FK_StaffUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A STAFF represent the individuals who work for the car manufacturer',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFID defines the StaffId of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFNAME defines the StaffName of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANAGERID defines the ManagerID of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'ManagerID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTID defines the DepartmentID of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'DepartmentID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Staff',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Marketing"."SalesOrderVehicle"
( 
	"SalesOrderVehicleId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"CustomerId"         "sdInteger"."SurrogateKeyInt" ,
	"StaffId"            "sdInteger"."SurrogateKeyInt" ,
	"SalesOrderVehicleInvoiceNumber" "sdChar"."Invoice"  NOT NULL ,
	"SalesOrderVehicleSaleDate" "sdDates"."DateType"  NOT NULL ,
	"SalesOrderVehicleLowerThreshold" "sdInteger"."BigInteger"  NOT NULL 
	CONSTRAINT "CK_Marketing_SalesOrderVehicle_SalesOrderVehicleLowerThreshold"
		CHECK  ( (SalesOrderVehicleLowerThreshold >= 100 AND SalesOrderVehicleLowerThreshold <= 250000) ),
	"SalesOrderVehicleUpperThreshold" "sdInteger"."BigInteger"  NOT NULL 
	CONSTRAINT "CK_Marketing_SalesOrderVehicle_SalesOrderVehicleUpperThreshold"
		CHECK  ( (SalesOrderVehicleUpperThreshold >= 100 AND SalesOrderVehicleUpperThreshold <= 250000) ),
	"SalesOrderVehicleCategoryDescription" AS CASE
      WHEN SalesOrderVehicleLowerThreshold >= 100 AND SalesOrderVehicleUpperThreshold <= 25000 THEN 'Very Low'
      WHEN SalesOrderVehicleLowerThreshold >= 25001 AND SalesOrderVehicleUpperThreshold <= 50000 THEN 'Low'
      WHEN SalesOrderVehicleLowerThreshold >= 50001 AND SalesOrderVehicleUpperThreshold <= 75000 THEN 'Medium'
      WHEN SalesOrderVehicleLowerThreshold >= 75001 AND SalesOrderVehicleUpperThreshold <= 100000 THEN 'High'
      WHEN SalesOrderVehicleLowerThreshold >= 100001 AND SalesOrderVehicleUpperThreshold <= 150000 THEN 'Very High'
      WHEN SalesOrderVehicleLowerThreshold >= 150001 AND SalesOrderVehicleUpperThreshold <= 250000 THEN 'Exceptional'
      ELSE 'Unknown' 
 END COLLATE SQL_Latin1_General_CP1_CI_AS PERSISTED NOT NULL ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_SalesOrderVehicle_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_SalesOrderVehicle_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKSalesOrderVehicle" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleId" ASC),
	CONSTRAINT "FK_OrderVehicleStaff_Staff" FOREIGN KEY ("StaffId") REFERENCES "HumanResources"."Staff"("StaffId"),
	CONSTRAINT "FK_OrderVehicleCustomer_Customer" FOREIGN KEY ("CustomerId") REFERENCES "Marketing"."Customer"("CustomerId"),
	CONSTRAINT "FK_SalesOrderVehiclelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLE entity represents information related to the sales of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFID defines the StaffId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEINVOICENUMBER defines the SalesOrderVehicleInvoiceNumber of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleInvoiceNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLESALEDATE defines the SalesOrderVehicleSaleDate of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleSaleDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLECATEGORYDESCRIPTION defines the SalesOrderVehicleCategoryDescription of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleCategoryDescription'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLELOWERTHRESHOLD defines the SalesOrderVehicleLowerThreshold of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleLowerThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEUPPERTHRESHOLD defines the SalesOrderVehicleUpperThreshold of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleUpperThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Marketing"."MarketingCategory"
( 
	"MarketingTypeId"    "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"MarketingCategoryType" "sdNames"."Name"  NULL 
	CONSTRAINT "CK_Marketing_CurrentTimeStamp_MarketingCategoryType"
		CHECK  ( MarketingCategoryType LIKE '%^[A-Za-z]%' ),
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"MarketingCategorySysStartTime" "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_MarketingCategory_MarketingCategorySysStartTime"
		 DEFAULT  sysdatetime(),
	"MarketingCategorySysEndTime" "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_MarketingCategory_MarketingCategorySysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKMarketingCategory" PRIMARY KEY  CLUSTERED ("MarketingTypeId" ASC),
	CONSTRAINT "FK_MarketingCategorylUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A MARKETINGCATEGORY entity categorizes cars based on a marketing criteria. ',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MARKETINGCATEGORYTYPE defines the MarketingCategoryType of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'MarketingCategoryType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MARKETINGTYPEID defines the MarketingTypeId of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'MarketingTypeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MARKETINGCATEGORYSYSSTARTTIME defines the MarketingCategorySysStartTime of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'MarketingCategorySysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MARKETINGCATEGORYSYSENDTIME defines the MarketingCategorySysEndTime of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'MarketingCategorySysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the MarketingCategory',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'MarketingCategory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Inventory"."ManufacturerVehicleMake"
( 
	"ManufacturerVehicleMakeID" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"ManufacturerVehicleMakeName" "sdNames"."Name"  NULL 
	CONSTRAINT "CK_Inventory_ManufacturingVehicleMake_ManufacturerVehicleMakeName"
		CHECK  ( ManufacturerVehicleMakeName LIKE '%^[A-Za-z]%' ),
	"CountryId"          "sdInteger"."SurrogateKeyInt" ,
	"MarketingTypeId"    "sdInteger"."SurrogateKeyInt" ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleMake_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleMake_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_Make" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleMakeID" ASC),
	CONSTRAINT "FK_ManufacturerVehicleMakeMarketingCategory_MarketingCategory" FOREIGN KEY ("MarketingTypeId") REFERENCES "Marketing"."MarketingCategory"("MarketingTypeId"),
	CONSTRAINT "FK_ManufacturerVehicleMakelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId"),
	CONSTRAINT "FK_ManufacturerVehicleMakeCountry_Country" FOREIGN KEY ("CountryId") REFERENCES "Location"."Country"("CountryId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A MANUFACTURERVEHICLEMAKE are the specific brands of vehicles produced by a car manufacturer',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMAKEID defines the ManufacturerVehicleMakeID of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMAKENAME defines the ManufacturerVehicleMakeName of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MARKETINGTYPEID defines the MarketingTypeId of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'MarketingTypeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Inventory"."ManufacturerVehicleModel"
( 
	"ManufacturerVehicleModelId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"ManufacturerVehicleModelName" "sdNames"."Name"  NULL 
	CONSTRAINT "CK_Inventory_ManufacturerVehicleModel_ManufacturerVehicleModelName"
		CHECK  ( ManufacturerVehicleModelName NOT LIKE '%[^a-zA-Z0-9 ]%' ),
	"ManufacturerVehicleModelVariantCountryID" "sdInteger"."SurrogateKeyInt" ,
	"ManufacturerVehicleMakeID" "sdInteger"."SurrogateKeyInt" ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleModel_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleModel_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_Model_1" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleModelId" ASC),
	CONSTRAINT "FK_VehicleModelVehicleMake_VehicleMake" FOREIGN KEY ("ManufacturerVehicleMakeID") REFERENCES "Inventory"."ManufacturerVehicleMake"("ManufacturerVehicleMakeID"),
	CONSTRAINT "FK_ManufacturerVehicleModelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId"),
	CONSTRAINT "FK_ManufacturerVehicleModelCountry_Country" FOREIGN KEY ("ManufacturerVehicleModelVariantCountryID") REFERENCES "Location"."Country"("CountryId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERMODEL represents the specific models produced by a car manufacturer',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELNAME defines the ManufacturerVehicleModelName of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMAKEID defines the ManufacturerVehicleMakeID of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELVARIANTCOUNTRYID defines the ManufacturerVehicleModelVariantCountryID of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelVariantCountryID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleModel',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Inventory"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleStockID" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"ManufacturerVehicleStockCode" "sdNumericString"."StockCode"  NOT NULL 
	CONSTRAINT "CK_Inventory_ManufacturerVehicleStock_ManufacturerVehicleStockCode"
		CHECK  ( (CHARINDEX('-', ManufacturerVehicleStockCode) > 0) ),
	"ManufacturerVehicleModelId" "sdInteger"."SurrogateKeyInt"  NOT NULL ,
	"ManufacturerVehicleStockCost" "sdDouble"."Currency"  NOT NULL ,
	"RepairsCharge"      "sdDouble"."Currency"  NOT NULL ,
	"StockPartsCharge"   "sdDouble"."Currency"  NOT NULL ,
	"StockDeliveryCharge" "sdDouble"."Currency"  NOT NULL ,
	"IsPremiumRoadHandlingPackage" "sdNumericFlag"."BitFlag"  NOT NULL ,
	"VehicleColor"       "sdNames"."Name"  NOT NULL 
	CONSTRAINT "CK_Inventory_ManufacturerVehicleStock_VehicleColor"
		CHECK  ( VehicleColor LIKE '%^[A-Za-z]%' ),
	"CustomerComments"   "sdDescription"."Description"  NULL 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleStock_CustomerComments"
		 DEFAULT  'Not Provided',
	"PurchaseDate"       "sdDates"."DateType"  NOT NULL ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleStock_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Inventory_ManufacturerVehicleStock_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_Stock" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleStockID" ASC),
	CONSTRAINT "FK_ManufacturerVehicleStocklUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId"),
	CONSTRAINT "FK_VehicleStockVehicleModel_VehicleModel" FOREIGN KEY ("ManufacturerVehicleModelId") REFERENCES "Inventory"."ManufacturerVehicleModel"("ManufacturerVehicleModelId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCK represents the stock of vehicles held by a manufacturer',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKCODE defines the ManufacturerVehicleStockCode of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKCOST defines the ManufacturerVehicleStockCost of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockCost'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The REPAIRSCHARGE defines the RepairsCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'RepairsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STOCKPARTSCHARGE defines the StockPartsCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'StockPartsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STOCKDELIVERYCHARGE defines the StockDeliveryCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'StockDeliveryCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ISPREMIUMROADHANDLINGPACKAGE defines the IsPremiumRoadHandlingPackage of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'IsPremiumRoadHandlingPackage'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The VEHICLECOLOR defines the VehicleColor of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'VehicleColor'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERCOMMENTS defines the CustomerComments of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'CustomerComments'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The PURCHASEDATE defines the PurchaseDate of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'PurchaseDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Inventory',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Marketing"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleDetailId" "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 )  NOT NULL ,
	"SalesOrderVehicleId" "sdInteger"."SurrogateKeyInt"  NOT NULL ,
	"LineItemNumber"     "sdDouble"."Currency"  NOT NULL ,
	"SalesPrice"         "sdDouble"."Currency" ,
	"LineItemDiscount"   "sdDouble"."Currency"  NOT NULL ,
	"DerivedDiscountedSalePrice" AS SalesPrice - LineItemDiscount PERSISTED NOT NULL ,
	"ManufacturerVehicleStockID" "sdInteger"."SurrogateKeyInt"  NOT NULL ,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt" ,
	"SysStartTime"       "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_SalesOrderVehicleDetail_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimeStamp" 
	CONSTRAINT "DF_Marketing_SalesOrderVehicleDetail_SysEndTime"
		 DEFAULT  sysdatetime(),
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "PK_SalesDetails" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleDetailId" ASC),
	CONSTRAINT "FK_OrderVehicleDetailOrderVehicle_OrderVehicle" FOREIGN KEY ("SalesOrderVehicleId") REFERENCES "Marketing"."SalesOrderVehicle"("SalesOrderVehicleId"),
	CONSTRAINT "FK_SalesOrderVehicleDetailManufacturerVehicleStock_ManufacturerVehicleStock" FOREIGN KEY ("ManufacturerVehicleStockID") REFERENCES "Inventory"."ManufacturerVehicleStock"("ManufacturerVehicleStockID"),
	CONSTRAINT "FK_SalesOrderVehicleDetailUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAIL represents details about the transaction of vehicle sales',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The LINEITEMNUMBER defines the LineItemNumber of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'LineItemNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The LINEITEMDISCOUNT defines the LineItemDiscount of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'LineItemDiscount'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DERIVEDDISCOUNTEDSALEPRICE defines the DerivedDiscountedSalePrice of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'DerivedDiscountedSalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESPRICE defines the SalesPrice of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesPrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Marketing"."SpendCapacity"
( 
	"SpendCapacityID"    "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"SpendCapacity"      "sdNames"."Name" 
	CONSTRAINT "CK_Marketing_SpendCapacity_SpendCapacity"
		CHECK  ( SpendCapacity IN ('Lots', 'Some', 'Immense', 'None') ),
	"CustomerId"         "sdInteger"."SurrogateKeyInt" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKSpendCapacity" PRIMARY KEY  CLUSTERED ("SpendCapacityID" ASC),
	CONSTRAINT "FK_SpendCapacityCustomer_Customer" FOREIGN KEY ("CustomerId") REFERENCES "Marketing"."Customer"("CustomerId")
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A SPENDCAPACITY is the amount description of a customers spending capacity',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SpendCapacity'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SPENDCAPACITYID defines the SpendCapacityID of the SpendCapacity',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SpendCapacity',
@level2type = N'COLUMN', @level2name = N'SpendCapacityID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SPENDCAPACITY defines the SpendCapacity of the SpendCapacity',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SpendCapacity',
@level2type = N'COLUMN', @level2name = N'SpendCapacity'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the SpendCapacity',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SpendCapacity',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SpendCapacity',
@level0type = N'SCHEMA', @level0name = N'Marketing',
@level1type = N'TABLE', @level1name = N'SpendCapacity',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."Staff"
( 
	"StaffAuditId"       "sdInteger"."SurrogateKeyInt"  IDENTITY ( 1,1 ) ,
	"StaffId"            "sdInteger"."SmallInteger" ,
	"StaffAuditType"     "sdNames"."Name" ,
	"StaffAuditDate"     "dApplication"."sdDateTime" 
	CONSTRAINT "DF_Audit_Staff_StaffAuditDate"
		 DEFAULT  sysdatetime(),
	"StaffFieldName"     "sdNames"."Name" ,
	"StaffOldValue"      "sdDescription"."Description" ,
	"StaffNewValue"      "sdDescription"."Description" ,
	"RowLevelHashKey"    "sdNumericString"."HashKey" ,
	CONSTRAINT "XPKStaffHistory" PRIMARY KEY  CLUSTERED ("StaffAuditId" ASC)
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFAUDITID defines the StaffAuditId of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffAuditId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFID defines the StaffId of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFAUDITTYPE defines the StaffAuditType of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffAuditType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFAUDITDATE defines the StaffAuditDate of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffAuditDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFFIELDNAME defines the StaffFieldName of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffFieldName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFOLDVALUE defines the StaffOldValue of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffOldValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFNEWVALUE defines the StaffNewValue of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffNewValue'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the StaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "dbo"."sysdiagrams"
( 
	"diagram_id"         int  IDENTITY ( 1,1 )  NOT NULL ,
	"name"               sysname  NOT NULL ,
	"principal_id"       int  NOT NULL ,
	"version"            int  NULL ,
	"definition"         varbinary(max)  NULL ,
	CONSTRAINT "PK__sysdiagr__C2B05B612F18C246" PRIMARY KEY  CLUSTERED ("diagram_id" ASC)
)
go

CREATE NONCLUSTERED INDEX "XIF1Country" ON "Location"."Country"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1Customer" ON "Marketing"."Customer"
( 
	"CountryId"           ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2Customer" ON "Marketing"."Customer"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1Department" ON "HumanResources"."Department"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX "XIF1Staff" ON "HumanResources"."Staff"
( 
	"StaffId"             ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2Staff" ON "HumanResources"."Staff"
( 
	"DepartmentID"        ASC
)
go

CREATE NONCLUSTERED INDEX "XIF3Staff" ON "HumanResources"."Staff"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2SalesOrderVehicle" ON "Marketing"."SalesOrderVehicle"
( 
	"StaffId"             ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1SalesOrderVehicle" ON "Marketing"."SalesOrderVehicle"
( 
	"CustomerId"          ASC
)
go

CREATE NONCLUSTERED INDEX "XIF3SalesOrderVehicle" ON "Marketing"."SalesOrderVehicle"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1MarketingCategory" ON "Marketing"."MarketingCategory"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1ManufacturerVehicleMake" ON "Inventory"."ManufacturerVehicleMake"
( 
	"MarketingTypeId"     ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2ManufacturerVehicleMake" ON "Inventory"."ManufacturerVehicleMake"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF3ManufacturerVehicleMake" ON "Inventory"."ManufacturerVehicleMake"
( 
	"CountryId"           ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1ManufacturerVehicleModel" ON "Inventory"."ManufacturerVehicleModel"
( 
	"ManufacturerVehicleMakeID"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2ManufacturerVehicleModel" ON "Inventory"."ManufacturerVehicleModel"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF3ManufacturerVehicleModel" ON "Inventory"."ManufacturerVehicleModel"
( 
	"ManufacturerVehicleModelVariantCountryID"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2ManufacturerVehicleStock" ON "Inventory"."ManufacturerVehicleStock"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1ManufacturerVehicleStock" ON "Inventory"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleModelId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1SalesOrderVehicleDetail" ON "Marketing"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF2SalesOrderVehicleDetail" ON "Marketing"."SalesOrderVehicleDetail"
( 
	"ManufacturerVehicleStockID"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF3SalesOrderVehicleDetail" ON "Marketing"."SalesOrderVehicleDetail"
( 
	"UserAuthorizationId"  ASC
)
go

CREATE NONCLUSTERED INDEX "XIF1SpendCapacity" ON "Marketing"."SpendCapacity"
( 
	"CustomerId"          ASC
)
go

CREATE UNIQUE NONCLUSTERED INDEX "UK_principal_name" ON "dbo"."sysdiagrams"
( 
	"principal_id"        ASC,
	"name"                ASC
)
go

CREATE VIEW "G4Views"."uvw_MarketingCustomer"("CustomerId","CustomerLastName","CustomerTown","CustomerPostalCode","CustomerIsCustomerReseller","CustomerIsCustomerCreditRisk","CountryId","UserAuthorizationId","SysStartTime","SysEndTime","CustomerFirstName","CustomerFullName","CustomerStreetNumber","CustomerStreetName","RowLevelHashKey")
AS
SELECT "Marketing"."Customer"."CustomerId","Marketing"."Customer"."CustomerLastName","Marketing"."Customer"."CustomerTown","Marketing"."Customer"."CustomerPostalCode","Marketing"."Customer"."CustomerIsCustomerReseller","Marketing"."Customer"."CustomerIsCustomerCreditRisk","Marketing"."Customer"."CountryId","Marketing"."Customer"."UserAuthorizationId","Marketing"."Customer"."SysStartTime","Marketing"."Customer"."SysEndTime","Marketing"."Customer"."CustomerFirstName","Marketing"."Customer"."CustomerFullName","Marketing"."Customer"."CustomerStreetNumber","Marketing"."Customer"."CustomerStreetName","Marketing"."Customer"."RowLevelHashKey"
	FROM "Marketing"."Customer"
go

CREATE VIEW "G4Views"."uvw_LocationCountry"("CountryId","CountryISO3","CountryName","CountryISO2","CountrySalesRegion","UserAuthorizationId","CountrySysStartTime","CountrySysEndTime","RowLevelHashKey")
AS
SELECT "Location"."Country"."CountryId","Location"."Country"."CountryISO3","Location"."Country"."CountryName","Location"."Country"."CountryISO2","Location"."Country"."CountrySalesRegion","Location"."Country"."UserAuthorizationId","Location"."Country"."CountrySysStartTime","Location"."Country"."CountrySysEndTime","Location"."Country"."RowLevelHashKey"
	FROM "Location"."Country"
go

CREATE VIEW "G4Views"."uvw_HumanResourcesStaff"("StaffId","StaffName","ManagerID","DepartmentID","UserAuthorizationId","SysStartTime","SysEndTime","RowLevelHashKey")
AS
SELECT "HumanResources"."Staff"."StaffId","HumanResources"."Staff"."StaffName","HumanResources"."Staff"."ManagerID","HumanResources"."Staff"."DepartmentID","HumanResources"."Staff"."UserAuthorizationId","HumanResources"."Staff"."SysStartTime","HumanResources"."Staff"."SysEndTime","HumanResources"."Staff"."RowLevelHashKey"
	FROM "HumanResources"."Staff"
go

CREATE VIEW [G4Views].[CustomerSalesOrderView] AS
SELECT
    c.[CustomerId],
    c.[CustomerFirstName],
    c.[CustomerLastName],
    c.[CustomerPostalCode],
    c.[CustomerTown],
    c.[CustomerStreetNumber],
    c.[CustomerStreetName],
    sov.[SalesOrderVehicleId],
    sov.[StaffId],
    sov.[SalesOrderVehicleInvoiceNumber],
    sov.[SalesOrderVehicleSaleDate],
    sov.[SalesOrderVehicleCategoryDescription],
    sov.[SalesOrderVehicleLowerThreshold],
    sov.[SalesOrderVehicleUpperThreshold]
FROM
    [Marketing].[Customer] c
JOIN
    [Marketing].[SalesOrderVehicle] sov ON c.[CustomerId] = sov.[CustomerId];
go

CREATE VIEW [G4Views].[ManufacturerVehicleView] AS
SELECT
    mvm.[ManufacturerVehicleModelId],
    mvm.[ManufacturerVehicleModelName],
    mvmk.[ManufacturerVehicleMakeName],
    mvm.[ManufacturerVehicleMakeID] AS MakeID,
    mvs.[ManufacturerVehicleStockID],
    mvs.[ManufacturerVehicleStockCode],
    mvs.[ManufacturerVehicleStockCost],
    mvs.[RepairsCharge],
    mvs.[StockPartsCharge],
    mvs.[StockDeliveryCharge],
    mvs.[VehicleColor]
FROM
    [Inventory].[ManufacturerVehicleModel] mvm
JOIN
    [Inventory].[ManufacturerVehicleStock] mvs ON mvm.[ManufacturerVehicleModelId] = mvs.[ManufacturerVehicleModelId]
JOIN
    [Inventory].[ManufacturerVehicleMake] mvmk ON mvm.[ManufacturerVehicleMakeID] = mvmk.[ManufacturerVehicleMakeID];
go

CREATE VIEW [G4Views].[DepartmentStaffView] AS
SELECT

    d.[DepartmentID],
    d.[DepartmentName],
    s.[StaffName],
    s.[ManagerID]
FROM
    [HumanResources].[Department] d
JOIN
    [HumanResources].[Staff] s ON d.[DepartmentID] = s.[DepartmentID];
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Displays all columns from the Customer table.',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERLASTNAME defines the CustomerLastName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerLastName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERTOWN defines the CustomerTown of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerTown'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERPOSTALCODE defines the CustomerPostalCode of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerPostalCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERISCUSTOMERRESELLER defines the CustomerIsCustomerReseller of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerIsCustomerReseller'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERISCUSTOMERCREDITRISK defines the CustomerIsCustomerCreditRisk of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerIsCustomerCreditRisk'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFIRSTNAME defines the CustomerFirstName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerFirstName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFULLNAME defines the CustomerFullName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerFullName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNUMBER defines the CustomerStreetNumber of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerStreetNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNAME defines the CustomerStreetName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'CustomerStreetName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_MarketingCustomer',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Displays all columns from the Country table.',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYID defines the CountryId of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYISO3 defines the CountryISO3 of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountryISO3'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYNAME defines the CountryName of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountryName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYISO2 defines the CountryISO2 of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountryISO2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSALESREGION defines the CountrySalesRegion of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountrySalesRegion'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSYSSTARTTIME defines the CountrySysStartTime of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountrySysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The COUNTRYSYSENDTIME defines the CountrySysEndTime of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'CountrySysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Country',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_LocationCountry',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Displays all columns from the Staff table.',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFID defines the StaffId of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFNAME defines the StaffName of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'StaffName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANAGERID defines the ManagerID of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'ManagerID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTID defines the DepartmentID of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'DepartmentID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSSTARTTIME defines the SysStartTime of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SYSENDTIME defines the SysEndTime of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'uvw_HumanResourcesStaff',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFID defines the StaffId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEUPPERTHRESHOLD defines the SalesOrderVehicleUpperThreshold of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleUpperThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLECATEGORYDESCRIPTION defines the SalesOrderVehicleCategoryDescription of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleCategoryDescription'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLELOWERTHRESHOLD defines the SalesOrderVehicleLowerThreshold of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleLowerThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLESALEDATE defines the SalesOrderVehicleSaleDate of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleSaleDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEINVOICENUMBER defines the SalesOrderVehicleInvoiceNumber of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleInvoiceNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERLASTNAME defines the CustomerLastName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerLastName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERFIRSTNAME defines the CustomerFirstName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerFirstName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERID defines the CustomerId of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERTOWN defines the CustomerTown of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerTown'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNUMBER defines the CustomerStreetNumber of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerStreetNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERSTREETNAME defines the CustomerStreetName of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerStreetName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The CUSTOMERPOSTALCODE defines the CustomerPostalCode of the Customer',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'CustomerSalesOrderView',
@level2type = N'COLUMN', @level2name = N'CustomerPostalCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMAKENAME defines the ManufacturerVehicleMakeName of the ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLEMODELNAME defines the ManufacturerVehicleModelName of the ManufacturerVehicleModel',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleModelName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKCODE defines the ManufacturerVehicleStockCode of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANUFACTURERVEHICLESTOCKCOST defines the ManufacturerVehicleStockCost of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockCost'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The REPAIRSCHARGE defines the RepairsCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'RepairsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STOCKPARTSCHARGE defines the StockPartsCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'StockPartsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STOCKDELIVERYCHARGE defines the StockDeliveryCharge of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'StockDeliveryCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The VEHICLECOLOR defines the VehicleColor of the ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'ManufacturerVehicleView',
@level2type = N'COLUMN', @level2name = N'VehicleColor'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTNAME defines the Name of the Department',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'DepartmentStaffView',
@level2type = N'COLUMN', @level2name = N'DepartmentName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The STAFFNAME defines the StaffName of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'DepartmentStaffView',
@level2type = N'COLUMN', @level2name = N'StaffName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The MANAGERID defines the ManagerID of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'DepartmentStaffView',
@level2type = N'COLUMN', @level2name = N'ManagerID'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The DEPARTMENTID defines the DepartmentID of the Staff',
@level0type = N'SCHEMA', @level0name = N'G4Views',
@level1type = N'VIEW', @level1name = N'DepartmentStaffView',
@level2type = N'COLUMN', @level2name = N'DepartmentID'
go
