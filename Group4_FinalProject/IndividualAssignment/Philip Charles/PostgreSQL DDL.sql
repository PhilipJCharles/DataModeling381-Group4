CREATE DATABASE "1045Group4BIClass-PostgreSQL16";

CREATE SCHEMA "Output";
CREATE SCHEMA "Group4FinalSchema";
CREATE SCHEMA "dApplication";
CREATE SCHEMA "sdDateTime";
CREATE SCHEMA "sdTime";
CREATE SCHEMA "sdString";
CREATE SCHEMA "sdNames";
CREATE SCHEMA "DbSecurity";
CREATE SCHEMA "sdNumber";
CREATE SCHEMA "Location";
CREATE SCHEMA "HumanResources";
CREATE SCHEMA "Marketing";
CREATE SCHEMA "Inventory";
CREATE SCHEMA "Audit";
CREATE SCHEMA "sdInteger";
CREATE SCHEMA "sdNumericFlag";
CREATE SCHEMA "sdDouble";
CREATE SCHEMA "sdDates";
CREATE SCHEMA "sdDescription";
CREATE SCHEMA "sdChar";
CREATE SCHEMA "sdNumericString";
CREATE SCHEMA "sdFlag";
CREATE SCHEMA "G4Views";

COMMENT ON SCHEMA "Group4FinalSchema" IS 'Default schema for Group4';
COMMENT ON SCHEMA "dApplication" IS 'dApplication Schema for the root domain';
COMMENT ON SCHEMA "sdDateTime" IS 'sdDateTime schema defines the parent domain sdDateTime';
COMMENT ON SCHEMA "sdTime" IS 'sdTime schema defines the sdTime domain and its subdomains';
COMMENT ON SCHEMA "sdString" IS 'sdString schema defines the related string objects';
COMMENT ON SCHEMA "sdNames" IS 'sdNames schema defines the objects related to names of columns';
COMMENT ON SCHEMA "DbSecurity" IS 'This schema is specifically for the UserAuthorization';
COMMENT ON SCHEMA "sdNumber" IS 'sdNumber schema defines the subdomains related to Numbers';
COMMENT ON SCHEMA "Location" IS 'Location schema defines the location-related objects';
COMMENT ON SCHEMA "HumanResources" IS 'HumanResources defines the related objects that deal with the employed personnel in the company';
COMMENT ON SCHEMA "Marketing" IS 'Marketing schema encapsulates the objects related to the finance sector of the company';
COMMENT ON SCHEMA "Inventory" IS 'Inventory Schema defines the items the manufacturer contains';
COMMENT ON SCHEMA "Audit" IS 'Audit Schema is for record-keeping purposes';
COMMENT ON SCHEMA "sdInteger" IS 'Schema for the parent domain sdInteger';
COMMENT ON SCHEMA "sdNumericFlag" IS 'schema for the parent domain sdNumericFlag';
COMMENT ON SCHEMA "sdDouble" IS 'Schema for the parent domain sdDouble';
COMMENT ON SCHEMA "sdDates" IS 'Schema for the parent domain sdDates';
COMMENT ON SCHEMA "sdDescription" IS 'Schema name for sdDescription';
COMMENT ON SCHEMA "sdChar" IS 'Schema name for parent domain sdChar';
COMMENT ON SCHEMA "sdNumericString" IS 'Schema for the parent domain sdNumericString';
COMMENT ON SCHEMA "sdFlag" IS 'Schema name for sdFlag parent domain';



CREATE DOMAIN "Group4FinalSchema"."dApplication" AS CHAR(18);
CREATE DOMAIN "dApplication"."sdString" AS VARCHAR(20);
CREATE DOMAIN "dApplication"."sdDateTime" AS TIMESTAMP;
CREATE DOMAIN "dApplication"."sdNumber" AS SMALLINT NOT NULL;
CREATE DOMAIN "sdString"."sdNames" AS VARCHAR(10);
CREATE DOMAIN "sdDateTime"."sdTime" AS TIME;
CREATE DOMAIN "sdDateTime"."sdDate" AS DATE;
CREATE DOMAIN "sdTime"."ClassTime" AS TIME;
CREATE DOMAIN "sdInteger"."SurrogateKeyInt" AS INTEGER;
CREATE DOMAIN "sdNames"."ProjectName" AS CHAR(21);
CREATE DOMAIN "sdNames"."FirstName" AS VARCHAR(25) NOT NULL;
CREATE DOMAIN "sdNames"."LastName" AS VARCHAR(35) NOT NULL;
CREATE DOMAIN "sdNames"."Name" AS VARCHAR(20) NOT NULL;
CREATE DOMAIN "sdDateTime"."DateTimeStamp" AS TIMESTAMP;
CREATE DOMAIN "sdString"."sdChar" AS VARCHAR(20);
CREATE DOMAIN "sdChar"."ISO3" AS CHAR(3) NOT NULL;
CREATE DOMAIN "sdChar"."ISO2" AS CHAR(2) NOT NULL;
CREATE DOMAIN "sdNumber"."sdDouble" AS DOUBLE PRECISION NOT NULL;
CREATE DOMAIN "sdNumber"."sdInteger" AS SMALLINT NOT NULL;
CREATE DOMAIN "sdInteger"."SmallInteger" AS SMALLINT NOT NULL;
CREATE DOMAIN "sdInteger"."BigInteger" AS INTEGER NOT NULL;
CREATE DOMAIN "dApplication"."sdFlag" AS CHAR(1);
CREATE DOMAIN "sdFlag"."sdNumericFlag" AS CHAR(1);
CREATE DOMAIN "sdNumericFlag"."BitFlag" AS BOOLEAN;
CREATE DOMAIN "sdString"."sdNumericString" AS VARCHAR(20);
CREATE DOMAIN "sdNumericString"."PostalCode" AS VARCHAR(10);
CREATE DOMAIN "sdChar"."Invoice" AS CHAR(8) NOT NULL;
CREATE DOMAIN "sdDouble"."Currency" AS MONEY NOT NULL;
CREATE DOMAIN "sdDates"."DateType" AS DATE NOT NULL;
CREATE DOMAIN "sdString"."sdDescription" AS VARCHAR(20);
CREATE DOMAIN "sdDescription"."Description" AS VARCHAR(20);
CREATE DOMAIN "sdNumericString"."StockCode" AS VARCHAR(50) NOT NULL;
CREATE DOMAIN "sdNumericString"."HashKey" AS BYTEA;
CREATE SEQUENCE "sdInteger"."SurrogateKeyIntSeq" START 1;

CREATE TABLE "Location"."Country"
( 
	"CountryId" SERIAL PRIMARY KEY,
	"CountryISO3" "sdChar"."ISO3" NOT NULL CHECK (LENGTH("CountryISO3") = 3 AND "CountryISO3" !~ '[0-9]'),
	"CountryName" "sdNames"."Name" NOT NULL CHECK ("CountryName" ~ '^[A-Za-z]'),
	"CountryISO2" "sdChar"."ISO2" NOT NULL CHECK (LENGTH("CountryISO2") = 2 AND "CountryISO2" !~ '[0-9]'),
	"CountrySalesRegion" "sdNames"."Name" CHECK ("CountrySalesRegion" ~ '^[A-Za-z]'),
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"CountrySysStartTime" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	"CountrySysEndTime" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey" "sdNumericString"."HashKey"
);


ALTER TABLE "Location"."Country"
ADD CONSTRAINT "CK_Location_Country_CountryISO3" CHECK (LENGTH("CountryISO3") = 3 AND "CountryISO3" !~ '[0-9]'),
ADD CONSTRAINT "CK_Location_Country_CountryName" CHECK ("CountryName" ~ '^[A-Za-z]'),
ADD CONSTRAINT "CK_Location_Country_CountryISO2" CHECK (LENGTH("CountryISO2") = 2 AND "CountryISO2" !~ '[0-9]'),
ADD CONSTRAINT "CK_Location_Country_CountrySalesRegion" CHECK ("CountrySalesRegion" ~ '^[A-Za-z]');


COMMENT ON SCHEMA "Location" IS 'A COUNTRY represents the countries where car manufacturers operate';
COMMENT ON TABLE "Location"."Country" IS 'A COUNTRY represents the countries where car manufacturers operate';
COMMENT ON COLUMN "Location"."Country"."CountryId" IS 'The COUNTRYID defines the CountryId of the Country';
COMMENT ON COLUMN "Location"."Country"."CountryISO3" IS 'The COUNTRYISO3 defines the CountryISO3 of the Country';
COMMENT ON COLUMN "Location"."Country"."CountryName" IS 'The COUNTRYNAME defines the CountryName of the Country';
COMMENT ON COLUMN "Location"."Country"."CountryISO2" IS 'The COUNTRYISO2 defines the CountryISO2 of the Country';
COMMENT ON COLUMN "Location"."Country"."CountrySalesRegion" IS 'The COUNTRYSALESREGION defines the CountrySalesRegion of the Country';
COMMENT ON COLUMN "Location"."Country"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Country';
COMMENT ON COLUMN "Location"."Country"."CountrySysStartTime" IS 'The COUNTRYSYSSTARTTIME defines the CountrySysStartTime of the Country';
COMMENT ON COLUMN "Location"."Country"."CountrySysEndTime" IS 'The COUNTRYSYSENDTIME defines the CountrySysEndTime of the Country';
COMMENT ON COLUMN "Location"."Country"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Country';


CREATE TABLE "Audit"."Country"
( 
	"CountryAuditId"     SERIAL PRIMARY KEY,
	"CountryId"          "sdInteger"."SmallInteger",
	"CountryAuditType"   "sdNames"."Name",
	"CountryAuditDate"   "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
	"CountryFieldName"   "sdNames"."Name",
	"CountryOldValue"    "sdDescription"."Description",
	"CountryNewValue"    "sdDescription"."Description",
	"RowLevelHashKey"    "sdNumericString"."HashKey"
);

COMMENT ON TABLE "Audit"."Country" IS 'Table representing audit history for the Country table';
COMMENT ON COLUMN "Audit"."Country"."CountryAuditId" IS 'Identifier for the audit entry';
COMMENT ON COLUMN "Audit"."Country"."CountryId" IS 'Identifier for the Country in the audit history';
COMMENT ON COLUMN "Audit"."Country"."CountryAuditType" IS 'Type of audit entry for the Country';
COMMENT ON COLUMN "Audit"."Country"."CountryAuditDate" IS 'Timestamp of the audit entry';
COMMENT ON COLUMN "Audit"."Country"."CountryFieldName" IS 'Field name that was audited';
COMMENT ON COLUMN "Audit"."Country"."CountryOldValue" IS 'Old value of the audited field';
COMMENT ON COLUMN "Audit"."Country"."CountryNewValue" IS 'New value of the audited field';
COMMENT ON COLUMN "Audit"."Country"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "Marketing"."Customer"
( 
    "CustomerId"                 SERIAL PRIMARY KEY,
    "CustomerFirstName"          "sdNames"."FirstName" CHECK ("CustomerFirstName" ~ '^[A-Za-z]+$'),
    "CustomerLastName"           "sdNames"."LastName" NOT NULL CHECK ("CustomerLastName" ~ '^[A-Za-z]+$'),
    "CustomerFullName"           "sdNames"."Name" GENERATED ALWAYS AS ("CustomerFirstName" || ' ' || "CustomerLastName") STORED,
    "CustomerTown"               "sdNames"."Name" NOT NULL CHECK ("CustomerTown" ~ '^[A-Za-z]+$'),
    "CustomerStreetNumber"       "sdInteger"."BigInteger",
    "CustomerStreetName"         "sdNames"."Name" CHECK ("CustomerStreetName" ~ '^[A-Za-z]+$'),
    "CustomerPostalCode"         "sdNumericString"."PostalCode" DEFAULT 'Not Provided' CHECK ("CustomerPostalCode" ~ '[0-9]'),
    "CustomerIsCustomerReseller" "sdNumericFlag"."BitFlag" NOT NULL,
    "CustomerIsCustomerCreditRisk" "sdNumericFlag"."BitFlag" NOT NULL,
    "CountryId"                  "sdInteger"."SurrogateKeyInt",
    "UserAuthorizationId"       "sdInteger"."SurrogateKeyInt",
    "SysStartTime"               "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "SysEndTime"                 "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "RowLevelHashKey"            "sdNumericString"."HashKey"
);

COMMENT ON TABLE "Marketing"."Customer" IS 'Table representing customers';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerId" IS 'Identifier for the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerFirstName" IS 'First name of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerLastName" IS 'Last name of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerTown" IS 'Town of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerStreetNumber" IS 'Street number of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerStreetName" IS 'Street name of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerPostalCode" IS 'Postal code of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerIsCustomerReseller" IS 'Flag indicating if the customer is a reseller';
COMMENT ON COLUMN "Marketing"."Customer"."CustomerIsCustomerCreditRisk" IS 'Flag indicating if the customer is a credit risk';
COMMENT ON COLUMN "Marketing"."Customer"."CountryId" IS 'Identifier for the country of the customer';
COMMENT ON COLUMN "Marketing"."Customer"."UserAuthorizationId" IS 'Identifier for user authorization';
COMMENT ON COLUMN "Marketing"."Customer"."SysStartTime" IS 'Timestamp indicating the start time of the system';
COMMENT ON COLUMN "Marketing"."Customer"."SysEndTime" IS 'Timestamp indicating the end time of the system';
COMMENT ON COLUMN "Marketing"."Customer"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "Audit"."Customer"
( 
	"CustomerAuditId"    SERIAL PRIMARY KEY,
	"CustomerId"         "sdInteger"."SmallInteger",
	"CustomerAuditType"  "sdNames"."Name",
	"CustomerAuditDate"  "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"CustomerFieldName"  "sdNames"."Name",
	"CustomerOldValue"   "sdDescription"."Description",
	"CustomerNewValue"   "sdDescription"."Description",
	"RowLevelHashKey"    "sdNumericString"."HashKey"
);


COMMENT ON TABLE "Audit"."Customer" IS 'Table representing audit history for the Customer table';
COMMENT ON COLUMN "Audit"."Customer"."CustomerAuditId" IS 'Identifier for the audit entry';
COMMENT ON COLUMN "Audit"."Customer"."CustomerId" IS 'Identifier for the Customer in the audit history';
COMMENT ON COLUMN "Audit"."Customer"."CustomerAuditType" IS 'Type of audit entry for the Customer';
COMMENT ON COLUMN "Audit"."Customer"."CustomerAuditDate" IS 'Timestamp of the audit entry';
COMMENT ON COLUMN "Audit"."Customer"."CustomerFieldName" IS 'Field name that was audited';
COMMENT ON COLUMN "Audit"."Customer"."CustomerOldValue" IS 'Old value of the audited field';
COMMENT ON COLUMN "Audit"."Customer"."CustomerNewValue" IS 'New value of the audited field';
COMMENT ON COLUMN "Audit"."Customer"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "HumanResources"."Department"
( 
	"DepartmentID"       SERIAL PRIMARY KEY,
	"DepartmentName"     "sdNames"."Name",
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"DepartmentSysStartTime" "sdDateTime"."DateTimeStamp",
	"DepartmentSysEndTime" "sdDateTime"."DateTimeStamp",
	"RowLevelHashKey"    "sdNumericString"."HashKey"
);


COMMENT ON TABLE "HumanResources"."Department" IS 'Table representing departments within the company';
COMMENT ON COLUMN "HumanResources"."Department"."DepartmentID" IS 'Identifier for the department';
COMMENT ON COLUMN "HumanResources"."Department"."DepartmentName" IS 'Name of the department';
COMMENT ON COLUMN "HumanResources"."Department"."UserAuthorizationId" IS 'User authorization identifier for the department';
COMMENT ON COLUMN "HumanResources"."Department"."DepartmentSysStartTime" IS 'SysStartTime of the department';
COMMENT ON COLUMN "HumanResources"."Department"."DepartmentSysEndTime" IS 'SysEndTime of the department';
COMMENT ON COLUMN "HumanResources"."Department"."RowLevelHashKey" IS 'Hash key for row-level identification';



CREATE TABLE "Inventory"."ManufacturerVehicleMake"
( 
	"ManufacturerVehicleMakeID" SERIAL PRIMARY KEY,
	"ManufacturerVehicleMakeName" "sdNames"."Name" NULL CHECK ("ManufacturerVehicleMakeName" ~ '^[A-Za-z]+$'),
	"CountryId"          "sdInteger"."SurrogateKeyInt",
	"MarketingTypeId"    "sdInteger"."SurrogateKeyInt",
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"SysStartTime"       "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime"         "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey"    "sdNumericString"."HashKey"
);


COMMENT ON TABLE "Inventory"."ManufacturerVehicleMake" IS 'Table representing vehicle makes by manufacturers';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."ManufacturerVehicleMakeID" IS 'Identifier for the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" IS 'Name of the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."CountryId" IS 'Identifier for the country associated with ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."MarketingTypeId" IS 'Identifier for the marketing type associated with ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."UserAuthorizationId" IS 'User authorization identifier for the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."SysStartTime" IS 'SysStartTime of the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."SysEndTime" IS 'SysEndTime of the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleMake"."RowLevelHashKey" IS 'Hash key for row-level identification';





CREATE TABLE "Audit"."ManufacturerVehicleMake"
( 
	"ManufacturerMakeAuditId" SERIAL PRIMARY KEY,
	"ManufacturerMakeId" "sdInteger"."SmallInteger",
	"ManufacturerMakeAuditType" "sdNames"."Name",
	"ManufacturerMakeAuditDate" "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
	"ManufacturerMakeFieldName" "sdNames"."Name",
	"ManufacturerMakeOldValue" "sdDescription"."Description",
	"ManufacturerMakeNewValue" "sdDescription"."Description",
	"RowLevelHashKey" "sdNumericString"."HashKey"
);


COMMENT ON TABLE "Audit"."ManufacturerVehicleMake" IS 'Table representing audit history for the ManufacturerVehicleMake table';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeAuditId" IS 'Identifier for the audit entry';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeId" IS 'Identifier for the ManufacturerMake in the audit history';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeAuditType" IS 'Type of audit entry for the ManufacturerMake';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeAuditDate" IS 'Timestamp of the audit entry';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeFieldName" IS 'Field name that was audited';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeOldValue" IS 'Old value of the audited field';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."ManufacturerMakeNewValue" IS 'New value of the audited field';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleMake"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "Inventory"."ManufacturerVehicleModel"
( 
	"ManufacturerVehicleModelId" SERIAL PRIMARY KEY,
	"ManufacturerVehicleModelName" "sdNames"."Name" NULL,
	"ManufacturerVehicleModelVariantCountryID" "sdInteger"."SurrogateKeyInt",
	"ManufacturerVehicleMakeID" "sdInteger"."SurrogateKeyInt",
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"SysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey" "sdNumericString"."HashKey"
);


COMMENT ON TABLE "Inventory"."ManufacturerVehicleModel" IS 'Table representing specific models produced by a car manufacturer';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."ManufacturerVehicleModelId" IS 'Identifier for the ManufacturerVehicleModel';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."ManufacturerVehicleModelName" IS 'Name of the ManufacturerVehicleModel';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."ManufacturerVehicleModelVariantCountryID" IS 'Identifier for the ManufacturerVehicleModelVariantCountry';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."ManufacturerVehicleMakeID" IS 'Identifier for the ManufacturerVehicleMake';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."UserAuthorizationId" IS 'Identifier for user authorization';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."SysStartTime" IS 'Start time of record validity';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."SysEndTime" IS 'End time of record validity';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleModel"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "Inventory"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleStockID" SERIAL PRIMARY KEY,
	"ManufacturerVehicleStockCode" "sdNumericString"."StockCode" NOT NULL CHECK (POSITION('-' IN "ManufacturerVehicleStockCode") > 0),
	"ManufacturerVehicleModelId" "sdInteger"."SurrogateKeyInt" NOT NULL,
	"ManufacturerVehicleStockCost" "sdDouble"."Currency" NOT NULL,
	"RepairsCharge" "sdDouble"."Currency" NOT NULL,
	"StockPartsCharge" "sdDouble"."Currency" NOT NULL,
	"StockDeliveryCharge" "sdDouble"."Currency" NOT NULL,
	"IsPremiumRoadHandlingPackage" "sdNumericFlag"."BitFlag" NOT NULL,
	"VehicleColor" "sdNames"."Name" NOT NULL CHECK ("VehicleColor" ~ '^[A-Za-z]'),
	"CustomerComments" "sdDescription"."Description" NULL DEFAULT 'Not Provided',
	"PurchaseDate" "sdDates"."DateType" NOT NULL,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"SysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey" "sdNumericString"."HashKey"
);


COMMENT ON TABLE "Inventory"."ManufacturerVehicleStock" IS 'Table representing stock of vehicles held by a manufacturer';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."ManufacturerVehicleStockID" IS 'Identifier for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."ManufacturerVehicleStockCode" IS 'Code for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."ManufacturerVehicleModelId" IS 'Identifier for the ManufacturerVehicleModel';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."ManufacturerVehicleStockCost" IS 'Cost of the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."RepairsCharge" IS 'Repairs charge for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."StockPartsCharge" IS 'Stock parts charge for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."StockDeliveryCharge" IS 'Stock delivery charge for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."IsPremiumRoadHandlingPackage" IS 'Flag indicating whether the ManufacturerVehicleStock has premium road handling package';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."VehicleColor" IS 'Color of the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."CustomerComments" IS 'Comments from the customer for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."PurchaseDate" IS 'Date of purchase for the ManufacturerVehicleStock';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."UserAuthorizationId" IS 'Identifier for user authorization';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."SysStartTime" IS 'Start time of record validity';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."SysEndTime" IS 'End time of record validity';
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."RowLevelHashKey" IS 'Hash key for row-level identification';


CREATE TABLE "Audit"."ManufacturerVehicleStock"
(
    "ManufacturerVehicleStockAuditId" SERIAL PRIMARY KEY,
    "ManufacturerVehicleModelId" "sdInteger"."SmallInteger",
    "ManufacturerVehicleStockAuditType" "sdNames"."Name",
    "ManufacturerVehicleStockAuditDate" "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
    "ManufacturerVehicleStocFieldName" "sdNames"."Name",
    "ManufacturerVehicleStockOldValue" "sdDescription"."Description",
    "ManufacturerVehicleStockNewValue" "sdDescription"."Description",
    "RowLevelHashKey" "sdNumericString"."HashKey"
);


CREATE TABLE "Marketing"."MarketingCategory"
(
    "MarketingTypeId" SERIAL PRIMARY KEY,
    "MarketingCategoryType" "sdNames"."Name" CHECK ("MarketingCategoryType" ~ '^[A-Za-z]'),
    "UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
    "MarketingCategorySysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "MarketingCategorySysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "RowLevelHashKey" "sdNumericString"."HashKey"
);


CREATE TABLE "Marketing"."SalesOrderVehicle"
( 
	"SalesOrderVehicleId" SERIAL PRIMARY KEY,
	"CustomerId"          "sdInteger"."SurrogateKeyInt",
	"StaffId"             "sdInteger"."SurrogateKeyInt",
	"SalesOrderVehicleInvoiceNumber" "sdChar"."Invoice" NOT NULL,
	"SalesOrderVehicleSaleDate" "sdDates"."DateType" NOT NULL,
	"SalesOrderVehicleLowerThreshold" "sdInteger"."BigInteger" NOT NULL
		CHECK ("SalesOrderVehicleLowerThreshold" >= 100 AND "SalesOrderVehicleLowerThreshold" <= 250000),
	"SalesOrderVehicleUpperThreshold" "sdInteger"."BigInteger" NOT NULL
		CHECK ("SalesOrderVehicleUpperThreshold" >= 100 AND "SalesOrderVehicleUpperThreshold" <= 250000),
	"SalesOrderVehicleCategoryDescription" VARCHAR NOT NULL
		GENERATED ALWAYS AS (
			CASE
				WHEN "SalesOrderVehicleLowerThreshold" >= 100 AND "SalesOrderVehicleUpperThreshold" <= 25000 THEN 'Very Low'
				WHEN "SalesOrderVehicleLowerThreshold" >= 25001 AND "SalesOrderVehicleUpperThreshold" <= 50000 THEN 'Low'
				WHEN "SalesOrderVehicleLowerThreshold" >= 50001 AND "SalesOrderVehicleUpperThreshold" <= 75000 THEN 'Medium'
				WHEN "SalesOrderVehicleLowerThreshold" >= 75001 AND "SalesOrderVehicleUpperThreshold" <= 100000 THEN 'High'
				WHEN "SalesOrderVehicleLowerThreshold" >= 100001 AND "SalesOrderVehicleUpperThreshold" <= 150000 THEN 'Very High'
				WHEN "SalesOrderVehicleLowerThreshold" >= 150001 AND "SalesOrderVehicleUpperThreshold" <= 250000 THEN 'Exceptional'
				ELSE 'Unknown'
			END
		) STORED,
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"SysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey" "sdNumericString"."HashKey"
);


CREATE TABLE "Audit"."SalesOrderVehicle"
(
    "SalesOrderVehicleAuditId" SERIAL PRIMARY KEY,
    "SalesOrderVehicleId" "sdInteger"."SmallInteger",
    "SalesOrderVehicleAuditType" "sdNames"."Name",
    "SalesOrderVehicleAuditDate" "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
    "SalesOrderVehicleFieldName" "sdNames"."Name",
    "SalesOrderVehicleOldValue" "sdDescription"."Description",
    "SalesOrderVehicleHNewValue" "sdDescription"."Description",
    "RowLevelHashKey" "sdNumericString"."HashKey"
);

CREATE TABLE "Marketing"."SalesOrderVehicleDetail"
(
    "SalesOrderVehicleDetailId" SERIAL PRIMARY KEY,
    "SalesOrderVehicleId" "sdInteger"."SurrogateKeyInt" NOT NULL,
    "LineItemNumber" "sdDouble"."Currency" NOT NULL,
    "SalesPrice" "sdDouble"."Currency",
    "LineItemDiscount" "sdDouble"."Currency" NOT NULL,
    "DerivedDiscountedSalePrice" "sdDouble"."Currency" GENERATED ALWAYS AS ("SalesPrice" - "LineItemDiscount") STORED NOT NULL,
    "ManufacturerVehicleStockID" "sdInteger"."SurrogateKeyInt" NOT NULL,
    "UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
    "SysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "SysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
    "RowLevelHashKey" "sdNumericString"."HashKey"
);



COMMENT ON SCHEMA "Marketing" IS 'The Marketing schema';


COMMENT ON TABLE "Marketing"."SalesOrderVehicleDetail" IS 'The SALESORDERVEHICLEDETAIL represents details about the transaction of vehicle sales';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" IS 'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleId" IS 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemNumber" IS 'The LINEITEMNUMBER defines the LineItemNumber of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemDiscount" IS 'The LINEITEMDISCOUNT defines the LineItemDiscount of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."DerivedDiscountedSalePrice" IS 'The DERIVEDDISCOUNTEDSALEPRICE defines the DerivedDiscountedSalePrice of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."ManufacturerVehicleStockID" IS 'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SysStartTime" IS 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicleDetail';

-- Add comments to the schema
COMMENT ON SCHEMA "Marketing" IS 'The Marketing schema';

-- Add comments to the SalesOrderVehicleDetail table
COMMENT ON TABLE "Marketing"."SalesOrderVehicleDetail" IS 'The SALESORDERVEHICLEDETAIL represents details about the transaction of vehicle sales';

-- Add comments to the SalesOrderVehicleDetailId column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" IS 'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetail';

-- Add comments to the SalesOrderVehicleId column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleId" IS 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleDetail';

-- Add comments to the LineItemNumber column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemNumber" IS 'The LINEITEMNUMBER defines the LineItemNumber of the SalesOrderVehicleDetail';

-- Add comments to the LineItemDiscount column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemDiscount" IS 'The LINEITEMDISCOUNT defines the LineItemDiscount of the SalesOrderVehicleDetail';

-- Add comments to the DerivedDiscountedSalePrice column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."DerivedDiscountedSalePrice" IS 'The DERIVEDDISCOUNTEDSALEPRICE defines the DerivedDiscountedSalePrice of the SalesOrderVehicleDetail';

-- Add comments to the ManufacturerVehicleStockID column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."ManufacturerVehicleStockID" IS 'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the SalesOrderVehicleDetail';

-- Add comments to the UserAuthorizationId column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicleDetail';

-- Add comments to the SysStartTime column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SysStartTime" IS 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicleDetail';

-- Add comments to the SysEndTime column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SysEndTime" IS 'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicleDetail';

-- Add comments to the SalesPrice column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesPrice" IS 'The SALESPRICE defines the SalesPrice of the SalesOrderVehicleDetail';

-- Add comments to the RowLevelHashKey column
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleDetail';

-- Add comments to the SysStartTime column in ManufacturerVehicleStock table
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."SysStartTime" IS 'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleStock';

-- Add comments to the SysEndTime column in ManufacturerVehicleStock table
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."SysEndTime" IS 'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleStock';

-- Add comments to the RowLevelHashKey column in ManufacturerVehicleStock table
COMMENT ON COLUMN "Inventory"."ManufacturerVehicleStock"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStock';

-- Add comments to the SalesOrderVehicleAuditId column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleAuditId" IS 'The SALESORDERVEHICLEAUDITID defines the SalesOrderVehicleAuditId of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleId column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleId" IS 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleAuditType column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleAuditType" IS 'The SALESORDERVEHICLEAUDITTYPE defines the SalesOrderVehicleAuditType of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleAuditDate column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleAuditDate" IS 'The SALESORDERVEHICLEAUDITDATE defines the SalesOrderVehicleAuditDate of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleFieldName column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleFieldName" IS 'The SALESORDERVEHICLEFIELDNAME defines the SalesOrderVehicleFieldName of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleOldValue column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleOldValue" IS 'The SALESORDERVEHICLEOLDVALUE defines the SalesOrderVehicleOldValue of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicleHNewValue column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."SalesOrderVehicleHNewValue" IS 'The SALESORDERVEHICLEHNEWVALUE defines the SalesOrderVehicleHNewValue of the SalesOrderVehicleHistory';

-- Add comments to the RowLevelHashKey column in SalesOrderVehicleHistory table
COMMENT ON COLUMN "Audit"."SalesOrderVehicle"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleHistory';

-- Add comments to the SalesOrderVehicle table
COMMENT ON TABLE "Marketing"."SalesOrderVehicle" IS 'The SALESORDERVEHICLE entity represents information related to the sales of a vehicle';

-- Add comments to the SalesOrderVehicleId column in SalesOrderVehicle table
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleId" IS 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicle';

-- Add comments to the CustomerId column in SalesOrderVehicle table
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."CustomerId" IS 'The CUSTOMERID defines the CustomerId of the SalesOrderVehicle';

-- Add comments to the StaffId column in SalesOrderVehicle table
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."StaffId" IS 'The STAFFID defines the StaffId of the SalesOrderVehicle';

-- Add comments to the schema
COMMENT ON SCHEMA "Marketing" IS 'The Marketing schema';

-- SalesOrderVehicleDetail
COMMENT ON TABLE "Marketing"."SalesOrderVehicleDetail" IS 'The SALESORDERVEHICLEDETAIL represents details about the transaction of vehicle sales';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" IS 'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SalesOrderVehicleId" IS 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemNumber" IS 'The LINEITEMNUMBER defines the LineItemNumber of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."LineItemDiscount" IS 'The LINEITEMDISCOUNT defines the LineItemDiscount of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."DerivedDiscountedSalePrice" IS 'The DERIVEDDISCOUNTEDSALEPRICE defines the DerivedDiscountedSalePrice of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."ManufacturerVehicleStockID" IS 'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicleDetail"."SysStartTime" IS 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicleDetail';

-- SalesOrderVehicle
COMMENT ON TABLE "Marketing"."SalesOrderVehicle" IS 'Description for SalesOrderVehicle table';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleInvoiceNumber" IS 'The SALESORDERVEHICLEINVOICENUMBER defines the SalesOrderVehicleInvoiceNumber of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleSaleDate" IS 'The SALESORDERVEHICLESALEDATE defines the SalesOrderVehicleSaleDate of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleCategoryDescription" IS 'The SALESORDERVEHICLECATEGORYDESCRIPTION defines the SalesOrderVehicleCategoryDescription of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleLowerThreshold" IS 'The SALESORDERVEHICLELOWERTHRESHOLD defines the SalesOrderVehicleLowerThreshold of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SalesOrderVehicleUpperThreshold" IS 'The SALESORDERVEHICLEUPPERTHRESHOLD defines the SalesOrderVehicleUpperThreshold of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SysStartTime" IS 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."SysEndTime" IS 'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicle';
COMMENT ON COLUMN "Marketing"."SalesOrderVehicle"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicle';

-- MarketingCategory
COMMENT ON TABLE "Marketing"."MarketingCategory" IS 'A MARKETINGCATEGORY entity categorizes cars based on a marketing criteria.';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."MarketingCategoryType" IS 'The MARKETINGCATEGORYTYPE defines the MarketingCategoryType of the MarketingCategory';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."MarketingTypeId" IS 'The MARKETINGTYPEID defines the MarketingTypeId of the MarketingCategory';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."UserAuthorizationId" IS 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the MarketingCategory';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."MarketingCategorySysStartTime" IS 'The MARKETINGCATEGORYSYSSTARTTIME defines the MarketingCategorySysStartTime of the MarketingCategory';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."MarketingCategorySysEndTime" IS 'The MARKETINGCATEGORYSYSENDTIME defines the MarketingCategorySysEndTime of the MarketingCategory';
COMMENT ON COLUMN "Marketing"."MarketingCategory"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the MarketingCategory';

-- ManufacturerVehicleStockHistory
COMMENT ON TABLE "Audit"."ManufacturerVehicleStock" IS 'Description for ManufacturerVehicleStockHistory table';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStockAuditId" IS 'The MANUFACTURERVEHICLESTOCKAUDITID defines the ManufacturerVehicleStockAuditId of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleModelId" IS 'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStockAuditType" IS 'The MANUFACTURERVEHICLESTOCKAUDITTYPE defines the ManufacturerVehicleStockAuditType of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStockAuditDate" IS 'The MANUFACTURERVEHICLESTOCKAUDITDATE defines the ManufacturerVehicleStockAuditDate of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStocFieldName" IS 'The MANUFACTURERVEHICLESTOCFIELDNAME defines the ManufacturerVehicleStocFieldName of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStockOldValue" IS 'The MANUFACTURERVEHICLESTOCKOLDVALUE defines the ManufacturerVehicleStockOldValue of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."ManufacturerVehicleStockNewValue" IS 'The MANUFACTURERVEHICLESTOCKNEWVALUE defines the ManufacturerVehicleStockNewValue of the ManufacturerVehicleStockHistory';
COMMENT ON COLUMN "Audit"."ManufacturerVehicleStock"."RowLevelHashKey" IS 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStockHistory';


CREATE TABLE "Audit"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleDetailAuditId" SERIAL PRIMARY KEY,
	"SalesOrderVehicleDetailId" "sdInteger"."SmallInteger",
	"SalesOrderVehicleDetailAuditType" "sdNames"."Name",
	"SalesOrderVehicleDetailAuditDate" "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
	"SalesOrderVehicleDetailFieldName" "sdNames"."Name",
	"SalesOrderVehicleDetailOldValue" "sdDescription"."Description",
	"SalesOrderVehicleDetailNewValue" "sdDescription"."Description",
	"RowLevelHashKey" "sdNumericString"."HashKey"
);

-- Add extended properties
COMMENT ON TABLE "Audit"."SalesOrderVehicleDetail" IS 'Table representing audit history for the SalesOrderVehicleDetail table';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailAuditId" IS 'Identifier for the audit entry';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" IS 'Identifier for the SalesOrderVehicleDetail in the audit history';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailAuditType" IS 'Type of audit entry for the SalesOrderVehicleDetail';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailAuditDate" IS 'Timestamp of the audit entry';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailFieldName" IS 'Field name that was audited';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailOldValue" IS 'Old value of the audited field';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailNewValue" IS 'New value of the audited field';
COMMENT ON COLUMN "Audit"."SalesOrderVehicleDetail"."RowLevelHashKey" IS 'Hash key for row-level identification';

-- Create the "SpendCapacity" table
CREATE TABLE "Marketing"."SpendCapacity"
( 
	"SpendCapacityID" SERIAL PRIMARY KEY,
	"SpendCapacity" "sdNames"."Name" CHECK ("SpendCapacity" IN ('Lots', 'Some', 'Immense', 'None')),
	"CustomerId" "sdInteger"."SurrogateKeyInt",
	"RowLevelHashKey" "sdNumericString"."HashKey"
);

-- Add extended properties
COMMENT ON TABLE "Marketing"."SpendCapacity" IS 'A SPENDCAPACITY is the amount description of a customer''s spending capacity';
COMMENT ON COLUMN "Marketing"."SpendCapacity"."SpendCapacityID" IS 'Identifier for the SpendCapacity';
COMMENT ON COLUMN "Marketing"."SpendCapacity"."SpendCapacity" IS 'SpendCapacity of the SpendCapacity';
COMMENT ON COLUMN "Marketing"."SpendCapacity"."CustomerId" IS 'Customer Id associated with the SpendCapacity';
COMMENT ON COLUMN "Marketing"."SpendCapacity"."RowLevelHashKey" IS 'Hash key for row-level identification';

-- Create the "Staff" table
CREATE TABLE "HumanResources"."Staff"
( 
	"StaffId" SERIAL PRIMARY KEY,
	"StaffName" "sdNames"."Name" CHECK ("StaffName" LIKE '%^[A-Za-z]%'),
	"ManagerID" "sdInteger"."SmallInteger" DEFAULT 0,
	"DepartmentID" "sdInteger"."SurrogateKeyInt",
	"UserAuthorizationId" "sdInteger"."SurrogateKeyInt",
	"SysStartTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime" "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"RowLevelHashKey" "sdNumericString"."HashKey"
);

-- Add extended properties
COMMENT ON TABLE "HumanResources"."Staff" IS 'A STAFF represents the individuals who work for the car manufacturer';
COMMENT ON COLUMN "HumanResources"."Staff"."StaffId" IS 'Identifier for the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."StaffName" IS 'StaffName of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."ManagerID" IS 'ManagerID of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."DepartmentID" IS 'DepartmentID of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."UserAuthorizationId" IS 'UserAuthorizationId of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."SysStartTime" IS 'SysStartTime of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."SysEndTime" IS 'SysEndTime of the Staff';
COMMENT ON COLUMN "HumanResources"."Staff"."RowLevelHashKey" IS 'Hash key for row-level identification';

-- Create the "Staff" audit table
CREATE TABLE "Audit"."Staff"
( 
	"StaffAuditId" SERIAL PRIMARY KEY,
	"StaffId" "sdInteger"."SmallInteger",
	"StaffAuditType" "sdNames"."Name",
	"StaffAuditDate" "dApplication"."sdDateTime" DEFAULT CURRENT_TIMESTAMP,
	"StaffFieldName" "sdNames"."Name",
	"StaffOldValue" "sdDescription"."Description",
	"StaffNewValue" "sdDescription"."Description",
	"RowLevelHashKey" "sdNumericString"."HashKey"
);

-- Add extended properties
COMMENT ON TABLE "Audit"."Staff" IS 'Table representing audit history for the Staff table';
COMMENT ON COLUMN "Audit"."Staff"."StaffAuditId" IS 'Identifier for the audit entry';
COMMENT ON COLUMN "Audit"."Staff"."StaffId" IS 'Identifier for the Staff in the audit history';
COMMENT ON COLUMN "Audit"."Staff"."StaffAuditType" IS 'Type of audit entry for the Staff';
COMMENT ON COLUMN "Audit"."Staff"."StaffAuditDate" IS 'Timestamp of the audit entry';
COMMENT ON COLUMN "Audit"."Staff"."StaffFieldName" IS 'Field name that was audited';
COMMENT ON COLUMN "Audit"."Staff"."StaffOldValue" IS 'Old value of the audited field';
COMMENT ON COLUMN "Audit"."Staff"."StaffNewValue" IS 'New value of the audited field';
COMMENT ON COLUMN "Audit"."Staff"."RowLevelHashKey" IS 'Hash key for row-level identification';

CREATE TABLE "DbSecurity"."UserAuthorization"
( 
	"UserAuthorizationId" SERIAL PRIMARY KEY,
	"ClassTime"          "sdTime"."ClassTime" DEFAULT '10:45',
	"IndividualProject"  "sdNames"."ProjectName" DEFAULT 'CSCI381 Final Project',
	"GroupMemberFirstName" "sdNames"."FirstName" CHECK ("GroupMemberFirstName" ~ '^[A-Za-z]+$'),
	"GroupMemberLastName" "sdNames"."LastName" CHECK ("GroupMemberLastName" ~ '^[A-Za-z]+$'),
	"GroupName"          "sdNames"."Name" CHECK ("GroupName" ~ '^[A-Za-z]+$'),
	"SysStartTime"       "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP,
	"SysEndTime"         "sdDateTime"."DateTimeStamp" DEFAULT CURRENT_TIMESTAMP
);

-- Add extended properties
COMMENT ON TABLE "DbSecurity"."UserAuthorization" IS 'Table defining authorized users with manipulation access';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."UserAuthorizationId" IS 'Identifier for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."ClassTime" IS 'Class time for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."IndividualProject" IS 'Individual project for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupMemberFirstName" IS 'First name of the group member for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupMemberLastName" IS 'Last name of the group member for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupName" IS 'Name of the group for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."SysStartTime" IS 'System start time for User Authorization';
COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."SysEndTime" IS 'System end time for User Authorization';

-- Foreign key relationships
ALTER TABLE "Location"."Country"
	ADD CONSTRAINT "FK_CountrylUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Marketing"."Customer"
	ADD CONSTRAINT "FK_CustomerlUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "HumanResources"."Department"
	ADD CONSTRAINT "FK_DepartmentlUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Inventory"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_ManufacturerVehicleMakelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Inventory"."ManufacturerVehicleModel"
	ADD CONSTRAINT "FK_ManufacturerVehicleModelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Inventory"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_ManufacturerVehicleStocklUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Marketing"."MarketingCategory"
	ADD CONSTRAINT "FK_MarketingCategorylUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Marketing"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehiclelUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "Marketing"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetailUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_StaffUserAuthorization_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId");


CREATE VIEW "G4Views"."uvw_HumanResourcesStaff" AS
SELECT
    "StaffId",
    "StaffName",
    "ManagerID",
    "DepartmentID",
    "UserAuthorizationId",
    "SysStartTime",
    "SysEndTime",
    "RowLevelHashKey"
FROM
    "HumanResources"."Staff";

CREATE VIEW "G4Views"."uvw_LocationCountry" AS
SELECT
    "CountryId",
    "CountryISO3",
    "CountryName",
    "CountryISO2",
    "CountrySalesRegion",
    "UserAuthorizationId",
    "CountrySysStartTime",
    "CountrySysEndTime",
    "RowLevelHashKey"
FROM
    "Location"."Country";

CREATE VIEW "G4Views"."uvw_MarketingCustomer" AS
SELECT
    "CustomerId",
    "CustomerLastName",
    "CustomerTown",
    "CustomerPostalCode",
    "CustomerIsCustomerReseller",
    "CustomerIsCustomerCreditRisk",
    "CountryId",
    "UserAuthorizationId",
    "SysStartTime",
    "SysEndTime",
    "CustomerFirstName",
    "CustomerFullName",
    "CustomerStreetNumber",
    "CustomerStreetName",
    "RowLevelHashKey"
FROM
    "Marketing"."Customer";
	
CREATE VIEW "G4Views"."ManufacturerVehicleView" AS
SELECT
    mvm."ManufacturerVehicleModelId",
    mvm."ManufacturerVehicleModelName",
    mvmk."ManufacturerVehicleMakeName",
    mvm."ManufacturerVehicleMakeID" AS "MakeID",
    mvs."ManufacturerVehicleStockID",
    mvs."ManufacturerVehicleStockCode",
    mvs."ManufacturerVehicleStockCost",
    mvs."RepairsCharge",
    mvs."StockPartsCharge",
    mvs."StockDeliveryCharge",
    mvs."VehicleColor"
FROM
    "Inventory"."ManufacturerVehicleModel" mvm
JOIN
    "Inventory"."ManufacturerVehicleStock" mvs ON mvm."ManufacturerVehicleModelId" = mvs."ManufacturerVehicleModelId"
JOIN
    "Inventory"."ManufacturerVehicleMake" mvmk ON mvm."ManufacturerVehicleMakeID" = mvmk."ManufacturerVehicleMakeID";

CREATE VIEW "G4Views"."CustomerSalesOrderView" AS
SELECT
    c."CustomerId",
    c."CustomerFirstName",
    c."CustomerLastName",
    c."CustomerPostalCode",
    c."CustomerTown",
    c."CustomerStreetNumber",
    c."CustomerStreetName",
    sov."SalesOrderVehicleId",
    sov."StaffId",
    sov."SalesOrderVehicleInvoiceNumber",
    sov."SalesOrderVehicleSaleDate",
    sov."SalesOrderVehicleCategoryDescription",
    sov."SalesOrderVehicleLowerThreshold",
    sov."SalesOrderVehicleUpperThreshold"
FROM
    "Marketing"."Customer" c
JOIN
    "Marketing"."SalesOrderVehicle" sov ON c."CustomerId" = sov."CustomerId";
	

CREATE VIEW "G4Views"."DepartmentStaffView" AS
SELECT
    d."DepartmentID",
    d."DepartmentName",
    s."StaffName",
    s."ManagerID"
FROM
    "HumanResources"."Department" d
JOIN
    "HumanResources"."Staff" s ON d."DepartmentID" = s."DepartmentID";

	








