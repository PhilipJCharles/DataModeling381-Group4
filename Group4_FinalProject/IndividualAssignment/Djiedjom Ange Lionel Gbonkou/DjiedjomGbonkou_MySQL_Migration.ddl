USE RawEuropeanCarManufacturer2;

CREATE TABLE `Audit.CommonColumnsForTriggerTemplate`
(
	`RowLevelHashKey` BLOB NOT NULL ,
	`Note` VARCHAR(200) NOT NULL ,
	`IsDeleted` CHAR(1) NULL ,
	`TransactionNumber` SMALLINT NULL ,
	`UserAuthenticatedKey` INTEGER NULL ,
	`SysStartTime` DATE NULL ,
	`SysEndTime` DATE NULL 
);

ALTER TABLE `Audit.CommonColumnsForTriggerTemplate`
	ADD  CONSTRAINT XPKCommonColumnsForTriggerTemplate PRIMARY KEY  ( `RowLevelHashKey`(25) ASC );

CREATE TABLE `Audit.Country`
(
	`CountryAuditId` SMALLINT COMMENT 'The COUNTRYAUDITID defines the CountryAuditId of the CountryHistory' NOT NULL ,
	`CountryId` SMALLINT COMMENT 'The COUNTRYID defines the CountryId of the CountryHistory' NOT NULL ,
	`CountryAuditType` VARCHAR(20) COMMENT 'The COUNTRYAUDITTYPE defines the CountryAuditType of the CountryHistory' NOT NULL ,
	`CountryAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The COUNTRYAUDITDATE defines the CountryAuditDate of the CountryHistory' NULL ,
	`CountryFieldName` VARCHAR(20) COMMENT 'The COUNTRYFIELDNAME defines the CountryFieldName of the CountryHistory' NOT NULL ,
	`CountryOldValue` VARCHAR(20) COMMENT 'The COUNTRYOLDVALUE defines the CountryOldValue of the CountryHistory' NULL ,
	`CountryNewValue` VARCHAR(20) COMMENT 'The COUNTRYNEWVALUE defines the CountryNewValue of the CountryHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the CountryHistory' NULL 
);

ALTER TABLE `Audit.Country`
	ADD  CONSTRAINT XPKCountryHistory PRIMARY KEY  ( `CountryAuditId` ASC );

CREATE TABLE `Audit.Customer`
(
	`CustomerAuditId` SMALLINT COMMENT 'The CUSTOMERAUDITID defines the CustomerAuditId of the CustomerHistory' NOT NULL ,
	`CustomerId` SMALLINT COMMENT 'The CUSTOMERID defines the CustomerId of the CustomerHistory' NOT NULL ,
	`CustomerAuditType` VARCHAR(20) COMMENT 'The CUSTOMERAUDITTYPE defines the CustomerAuditType of the CustomerHistory' NOT NULL ,
	`CustomerAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The CUSTOMERAUDITDATE defines the CustomerAuditDate of the CustomerHistory' NULL ,
	`CustomerFieldName` VARCHAR(20) COMMENT 'The CUSTOMERFIELDNAME defines the CustomerFieldName of the CustomerHistory' NOT NULL ,
	`CustomerOldValue` VARCHAR(20) COMMENT 'The CUSTOMEROLDVALUE defines the CustomerOldValue of the CustomerHistory' NULL ,
	`CustomerNewValue` VARCHAR(20) COMMENT 'The CUSTOMERNEWVALUE defines the CustomerNewValue of the CustomerHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the CustomerHistory' NULL 
);

ALTER TABLE `Audit.Customer`
	ADD  CONSTRAINT XPKCustomerHistory PRIMARY KEY  ( `CustomerAuditId` ASC );

CREATE TABLE `Audit.ManufacturerVehicleMake`
(
	`ManufacturerMakeAuditId` SMALLINT COMMENT 'The MANUFACTURERMAKEAUDITID defines the ManufacturerMakeAuditId of the ManufacturerMake' NOT NULL ,
	`ManufacturerMakeId` SMALLINT COMMENT 'The MANUFACTURERMAKEID defines the ManufacturerMakeId of the ManufacturerMake' NOT NULL ,
	`ManufacturerMakeAuditType` VARCHAR(20) COMMENT 'The MANUFACTURERMAKEAUDITTYPE defines the ManufacturerMakeAuditType of the ManufacturerMake' NOT NULL ,
	`ManufacturerMakeAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The MANUFACTURERMAKEAUDITDATE defines the ManufacturerMakeAuditDate of the ManufacturerMake' NULL ,
	`ManufacturerMakeFieldName` VARCHAR(20) COMMENT 'The MANUFACTURERMAKEFIELDNAME defines the ManufacturerMakeFieldName of the ManufacturerMake' NOT NULL ,
	`ManufacturerMakeOldValue` VARCHAR(20) COMMENT 'The MANUFACTURERMAKEOLDVALUE defines the ManufacturerMakeOldValue of the ManufacturerMake' NULL ,
	`ManufacturerMakeNewValue` VARCHAR(20) COMMENT 'The MANUFACTURERMAKENEWVALUE defines the ManufacturerMakeNewValue of the ManufacturerMake' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerMake' NULL 
);

ALTER TABLE `Audit.ManufacturerVehicleMake`
	ADD  CONSTRAINT XPKManufacturerMake PRIMARY KEY  ( `ManufacturerMakeAuditId` ASC );

CREATE TABLE `Audit.ManufacturerVehicleModel`
(
	`ManufacturerModelAuditId` SMALLINT COMMENT 'The MANUFACTURERMODELAUDITID defines the ManufacturerModelAuditId of the ManufacturerModel' NOT NULL ,
	`ManufacturerVehicleModelID` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelID of the ManufacturerModel' NOT NULL ,
	`ManufacturerModelAuditType` VARCHAR(20) COMMENT 'The MANUFACTURERMODELAUDITTYPE defines the ManufacturerModelAuditType of the ManufacturerModel' NOT NULL ,
	`ManufacturerModelAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The MANUFACTURERMODELAUDITDATE defines the ManufacturerModelAuditDate of the ManufacturerModel' NULL ,
	`ManufacturerModelFieldName` VARCHAR(20) COMMENT 'The MANUFACTURERMODELFIELDNAME defines the ManufacturerModelFieldName of the ManufacturerModel' NOT NULL ,
	`ManufacturerModelOldValue` VARCHAR(20) COMMENT 'The MANUFACTURERMODELOLDVALUE defines the ManufacturerModelOldValue of the ManufacturerModel' NULL ,
	`ManufacturerModelNewValue` VARCHAR(20) COMMENT 'The MANUFACTURERMODELNEWVALUE defines the ManufacturerModelNewValue of the ManufacturerModel' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerModel' NULL 
);

ALTER TABLE `Audit.ManufacturerVehicleModel`
	ADD  CONSTRAINT XPKManufacturerModel PRIMARY KEY  ( `ManufacturerModelAuditId` ASC );

CREATE TABLE `Audit.ManufacturerVehicleStock`
(
	`ManufacturerVehicleStockAuditId` SMALLINT COMMENT 'The MANUFACTURERVEHICLESTOCKAUDITID defines the ManufacturerVehicleStockAuditId of the ManufacturerVehicleStockHistory' NOT NULL ,
	`ManufacturerVehicleModelId` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleStockHistory' NOT NULL ,
	`ManufacturerVehicleStockAuditType` VARCHAR(20) COMMENT 'The MANUFACTURERVEHICLESTOCKAUDITTYPE defines the ManufacturerVehicleStockAuditType of the ManufacturerVehicleStockHistory' NOT NULL ,
	`ManufacturerVehicleStockAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The MANUFACTURERVEHICLESTOCKAUDITDATE defines the ManufacturerVehicleStockAuditDate of the ManufacturerVehicleStockHistory' NULL ,
	`ManufacturerVehicleStocFieldName` VARCHAR(20) COMMENT 'The MANUFACTURERVEHICLESTOCFIELDNAME defines the ManufacturerVehicleStocFieldName of the ManufacturerVehicleStockHistory' NOT NULL ,
	`ManufacturerVehicleStockOldValue` VARCHAR(20) COMMENT 'The MANUFACTURERVEHICLESTOCKOLDVALUE defines the ManufacturerVehicleStockOldValue of the ManufacturerVehicleStockHistory' NULL ,
	`ManufacturerVehicleStockNewValue` VARCHAR(20) COMMENT 'The MANUFACTURERVEHICLESTOCKNEWVALUE defines the ManufacturerVehicleStockNewValue of the ManufacturerVehicleStockHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStockHistory' NULL 
);

ALTER TABLE `Audit.ManufacturerVehicleStock`
	ADD  CONSTRAINT XPKManufacturerVehicleStockHistory PRIMARY KEY  ( `ManufacturerVehicleStockAuditId` ASC );

CREATE TABLE `Audit.SalesOrderVehicle`
(
	`SalesOrderVehicleAuditId` SMALLINT COMMENT 'The SALESORDERVEHICLEAUDITID defines the SalesOrderVehicleAuditId of the SalesOrderVehicleHistory' NOT NULL ,
	`SalesOrderVehicleId` SMALLINT COMMENT 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleHistory' NOT NULL ,
	`SalesOrderVehicleAuditType` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEAUDITTYPE defines the SalesOrderVehicleAuditType of the SalesOrderVehicleHistory' NOT NULL ,
	`SalesOrderVehicleAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SALESORDERVEHICLEAUDITDATE defines the SalesOrderVehicleAuditDate of the SalesOrderVehicleHistory' NULL ,
	`SalesOrderVehicleFieldName` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEFIELDNAME defines the SalesOrderVehicleFieldName of the SalesOrderVehicleHistory' NOT NULL ,
	`SalesOrderVehicleOldValue` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEOLDVALUE defines the SalesOrderVehicleOldValue of the SalesOrderVehicleHistory' NULL ,
	`SalesOrderVehicleHNewValue` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEHNEWVALUE defines the SalesOrderVehicleHNewValue of the SalesOrderVehicleHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleHistory' NULL 
);

ALTER TABLE `Audit.SalesOrderVehicle`
	ADD  CONSTRAINT XPKSalesOrderVehicleHistory PRIMARY KEY  ( `SalesOrderVehicleAuditId` ASC );

CREATE TABLE `Audit.SalesOrderVehicleDetail`
(
	`SalesOrderVehicleDetailAuditId` SMALLINT COMMENT 'The SALESORDERVEHICLEDETAILAUDITID defines the SalesOrderVehicleDetailAuditId of the SalesOrderVehicleDetailHistory' NOT NULL ,
	`SalesOrderVehicleDetailId` SMALLINT COMMENT 'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetailHistory' NOT NULL ,
	`SalesOrderVehicleDetailAuditType` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEDETAILAUDITTYPE defines the SalesOrderVehicleDetailAuditType of the SalesOrderVehicleDetailHistory' NOT NULL ,
	`SalesOrderVehicleDetailAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SALESORDERVEHICLEDETAILAUDITDATE defines the SalesOrderVehicleDetailAuditDate of the SalesOrderVehicleDetailHistory' NULL ,
	`SalesOrderVehicleDetailFieldName` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEDETAILFIELDNAME defines the SalesOrderVehicleDetailFieldName of the SalesOrderVehicleDetailHistory' NOT NULL ,
	`SalesOrderVehicleDetailOldValue` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEDETAILOLDVALUE defines the SalesOrderVehicleDetailOldValue of the SalesOrderVehicleDetailHistory' NULL ,
	`SalesOrderVehicleDetailNewValue` VARCHAR(20) COMMENT 'The SALESORDERVEHICLEDETAILNEWVALUE defines the SalesOrderVehicleDetailNewValue of the SalesOrderVehicleDetailHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleDetailHistory' NULL 
);

ALTER TABLE `Audit.SalesOrderVehicleDetail`
	ADD  CONSTRAINT XPKSalesOrderVehicleDetailHistory PRIMARY KEY  ( `SalesOrderVehicleDetailAuditId` ASC );

CREATE TABLE `Audit.Staff`
(
	`StaffAuditId` SMALLINT COMMENT 'The STAFFAUDITID defines the StaffAuditId of the StaffHistory' NOT NULL ,
	`StaffId` SMALLINT COMMENT 'The STAFFID defines the StaffId of the StaffHistory' NOT NULL ,
	`StaffAuditType` VARCHAR(20) COMMENT 'The STAFFAUDITTYPE defines the StaffAuditType of the StaffHistory' NOT NULL ,
	`StaffAuditDate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The STAFFAUDITDATE defines the StaffAuditDate of the StaffHistory' NULL ,
	`StaffFieldName` VARCHAR(20) COMMENT 'The STAFFFIELDNAME defines the StaffFieldName of the StaffHistory' NOT NULL ,
	`StaffOldValue` VARCHAR(20) COMMENT 'The STAFFOLDVALUE defines the StaffOldValue of the StaffHistory' NULL ,
	`StaffNewValue` VARCHAR(20) COMMENT 'The STAFFNEWVALUE defines the StaffNewValue of the StaffHistory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the StaffHistory' NULL 
);

ALTER TABLE `Audit.Staff`
	ADD  CONSTRAINT XPKStaffHistory PRIMARY KEY  ( `StaffAuditId` ASC );

CREATE TABLE `dbo.sysdiagrams`
(
	`name` CHAR(255) NOT NULL ,
	`principal_id` INTEGER NOT NULL ,
	`diagram_id` INTEGER NOT NULL ,
	`version` INTEGER NULL ,
	`definition` BINARY NULL 
);

ALTER TABLE `dbo.sysdiagrams`
	ADD  CONSTRAINT PK__sysdiagr__C2B05B612F18C246 PRIMARY KEY  ( `diagram_id` ASC );

ALTER TABLE `dbo.sysdiagrams`
	ADD CONSTRAINT `UK_principal_name` UNIQUE  (
	`principal_id` ASC,
	`name` ASC );

CREATE TABLE `DbSecurity.UserAuthorization`
(
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the UserAuthorization' NOT NULL ,
	`ClassTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The CLASSTIME defines the ClassTime of the UserAuthorization' NULL ,
	`IndividualProject` CHAR(21)  DEFAULT 'CSCI381 Final Project' COMMENT 'The INDIVIDUALPROJECT defines the IndividualProject of the UserAuthorization' NULL ,
	`GroupMemberLastName` VARCHAR(35) CONSTRAINT `CK_DbSecurity_UserAuthorization_GroupMemberLastName` CHECK (`GroupMemberLastName` LIKE '%^[A-Za-z]%') COMMENT 'The GROUPMEMBERLASTNAME defines the GroupMemberLastName of the UserAuthorization' NOT NULL ,
	`GroupMemberFirstName` VARCHAR(25) CONSTRAINT `CK_DbSecurity_UserAuthorization_GroupMemberFirstName` CHECK (`GroupMemberFirstName` LIKE '%^[A-Za-z]%') COMMENT 'The GROUPMEMBERFIRSTNAME defines the GroupMemberFirstName of the UserAuthorization' NOT NULL ,
	`GroupName` VARCHAR(20) CONSTRAINT `CK_DbSecurity_UserAuthorization_GroupName` CHECK (`GroupName` LIKE '%^[A-Za-z]%') COMMENT 'The GROUPNAME defines the GroupName of the UserAuthorization' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the UserAuthorization' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the UserAuthorization' NULL 
)
COMMENT = 'The USERAUTHORIZATION table defines authorized users that are able to manipulate other columns in the data model';

ALTER TABLE `DbSecurity.UserAuthorization`
	ADD  CONSTRAINT XPKUserAuthorization PRIMARY KEY  ( `UserAuthorizationId` ASC );

CREATE TABLE `HumanResources.Department`
(
	`DepartmentID` SMALLINT COMMENT 'The DEPARTMENTID defines the DepartmentID of the Department' NOT NULL ,
	`DepartmentName` VARCHAR(20) COMMENT 'The DEPARTMENTNAME defines the Name of the Department' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Department' NOT NULL ,
	`DepartmentSysStartTime` TIMESTAMP COMMENT 'The DEPARTMENTSYSSTARTTIME defines the SysStartTime of the Department' NULL ,
	`DepartmentSysEndTime` TIMESTAMP COMMENT 'The DEPARTMENTSYSENDTIME defines the SysEndTime of the Department' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Department' NULL 
)
COMMENT = 'A DEPARTMENT is an area of specialized personel within the company';

ALTER TABLE `HumanResources.Department`
	ADD  CONSTRAINT XPKDepartment PRIMARY KEY  ( `DepartmentID` ASC );

CREATE INDEX  `XIF1Department` ON  `HumanResources.Department`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `HumanResources.Staff`
(
	`StaffId` SMALLINT COMMENT 'The STAFFID defines the StaffId of the Staff' NOT NULL ,
	`StaffName` VARCHAR(20) CONSTRAINT `CK_HumanResources_Staff_StaffName` CHECK (`StaffName` LIKE '%^[A-Za-z]%') COMMENT 'The STAFFNAME defines the StaffName of the Staff' NOT NULL ,
	`ManagerID` SMALLINT  DEFAULT 0 COMMENT 'The MANAGERID defines the ManagerID of the Staff' NULL ,
	`DepartmentID` SMALLINT COMMENT 'The DEPARTMENTID defines the DepartmentID of the Staff' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Staff' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the Staff' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the Staff' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Staff' NULL 
)
COMMENT = 'A STAFF represent the individuals who work for the car manufacturer';

ALTER TABLE `HumanResources.Staff`
	ADD  CONSTRAINT XPKStaff PRIMARY KEY  ( `StaffId` ASC );

CREATE UNIQUE INDEX  `XIF1Staff` ON  `HumanResources.Staff`
(
	`StaffId` ASC
);

CREATE INDEX  `XIF2Staff` ON  `HumanResources.Staff`
(
	`DepartmentID` ASC
);

CREATE INDEX  `XIF3Staff` ON  `HumanResources.Staff`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Inventory.ManufacturerVehicleMake`
(
	`ManufacturerVehicleMakeID` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMAKEID defines the ManufacturerVehicleMakeID of the ManufacturerVehicleMake' NOT NULL ,
	`ManufacturerVehicleMakeName` VARCHAR(20) CONSTRAINT `CK_Inventory_ManufacturingVehicleMake_ManufacturerVehicleMakeNam` CHECK (`ManufacturerVehicleMakeName` LIKE '%^[A-Za-z]%') COMMENT 'The MANUFACTURERVEHICLEMAKENAME defines the ManufacturerVehicleMakeName of the ManufacturerVehicleMake' NULL ,
	`CountryId` SMALLINT COMMENT 'The COUNTRYID defines the CountryId of the ManufacturerVehicleMake' NOT NULL ,
	`MarketingTypeId` SMALLINT COMMENT 'The MARKETINGTYPEID defines the MarketingTypeId of the ManufacturerVehicleMake' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleMake' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleMake' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleMake' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleMake' NULL 
)
COMMENT = 'A MANUFACTURERVEHICLEMAKE are the specific brands of vehicles produced by a car manufacturer';

ALTER TABLE `Inventory.ManufacturerVehicleMake`
	ADD  CONSTRAINT PK_Make PRIMARY KEY  ( `ManufacturerVehicleMakeID` ASC );

CREATE INDEX  `XIF1ManufacturerVehicleMake` ON  `Inventory.ManufacturerVehicleMake`
(
	`MarketingTypeId` ASC
);

CREATE INDEX  `XIF2ManufacturerVehicleMake` ON  `Inventory.ManufacturerVehicleMake`
(
	`UserAuthorizationId` ASC
);

CREATE INDEX  `XIF3ManufacturerVehicleMake` ON  `Inventory.ManufacturerVehicleMake`
(
	`CountryId` ASC
);

CREATE TABLE `Inventory.ManufacturerVehicleModel`
(
	`ManufacturerVehicleModelId` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleModel' NOT NULL ,
	`ManufacturerVehicleModelName` VARCHAR(20) CONSTRAINT `CK_Inventory_ManufacturerVehicleModel_ManufacturerVehicleModelNa` CHECK (`ManufacturerVehicleModelName` NOT LIKE '%[^a-zA-Z0-9 ]%') COMMENT 'The MANUFACTURERVEHICLEMODELNAME defines the ManufacturerVehicleModelName of the ManufacturerVehicleModel' NULL ,
	`ManufacturerVehicleMakeID` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMAKEID defines the ManufacturerVehicleMakeID of the ManufacturerVehicleModel' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleModel' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleModel' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleModel' NULL ,
	`ManufacturerVehicleModelVariantCountryID` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMODELVARIANTCOUNTRYID defines the ManufacturerVehicleModelVariantCountryID of the ManufacturerVehicleModel' NOT NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleModel' NULL 
)
COMMENT = 'The MANUFACTURERMODEL represents the specific models produced by a car manufacturer';

ALTER TABLE `Inventory.ManufacturerVehicleModel`
	ADD  CONSTRAINT PK_Model_1 PRIMARY KEY  ( `ManufacturerVehicleModelId` ASC );

CREATE INDEX  `XIF1ManufacturerVehicleModel` ON  `Inventory.ManufacturerVehicleModel`
(
	`ManufacturerVehicleMakeID` ASC
);

CREATE INDEX  `XIF2ManufacturerVehicleModel` ON  `Inventory.ManufacturerVehicleModel`
(
	`UserAuthorizationId` ASC
);

CREATE INDEX  `XIF3ManufacturerVehicleModel` ON  `Inventory.ManufacturerVehicleModel`
(
	`ManufacturerVehicleModelVariantCountryID` ASC
);

CREATE TABLE `Inventory.ManufacturerVehicleStock`
(
	`ManufacturerVehicleStockID` SMALLINT COMMENT 'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the ManufacturerVehicleStock' NOT NULL ,
	`ManufacturerVehicleStockCode` VARCHAR(50) CONSTRAINT `CK_Inventory_ManufacturerVehicleStock_ManufacturerVehicleStockCo` CHECK ((LOCATE('-', `ManufacturerVehicleStockCode`) > 0)) COMMENT 'The MANUFACTURERVEHICLESTOCKCODE defines the ManufacturerVehicleStockCode of the ManufacturerVehicleStock' NOT NULL ,
	`ManufacturerVehicleStockCost` DECIMAL(18,2) COMMENT 'The MANUFACTURERVEHICLESTOCKCOST defines the ManufacturerVehicleStockCost of the ManufacturerVehicleStock' NOT NULL ,
	`RepairsCharge` DECIMAL(18,2) COMMENT 'The REPAIRSCHARGE defines the RepairsCharge of the ManufacturerVehicleStock' NOT NULL ,
	`StockPartsCharge` DECIMAL(18,2) COMMENT 'The STOCKPARTSCHARGE defines the StockPartsCharge of the ManufacturerVehicleStock' NOT NULL ,
	`StockDeliveryCharge` DECIMAL(18,2) COMMENT 'The STOCKDELIVERYCHARGE defines the StockDeliveryCharge of the ManufacturerVehicleStock' NOT NULL ,
	`IsPremiumRoadHandlingPackage` TINYINT COMMENT 'The ISPREMIUMROADHANDLINGPACKAGE defines the IsPremiumRoadHandlingPackage of the ManufacturerVehicleStock' NOT NULL ,
	`VehicleColor` VARCHAR(20) CONSTRAINT `CK_Inventory_ManufacturerVehicleStock_VehicleColor` CHECK (`VehicleColor` LIKE '%^[A-Za-z]%') COMMENT 'The VEHICLECOLOR defines the VehicleColor of the ManufacturerVehicleStock' NOT NULL ,
	`CustomerComments` VARCHAR(20)  DEFAULT 'Not Provided' COMMENT 'The CUSTOMERCOMMENTS defines the CustomerComments of the ManufacturerVehicleStock' NULL ,
	`PurchaseDate` DATE COMMENT 'The PURCHASEDATE defines the PurchaseDate of the ManufacturerVehicleStock' NOT NULL ,
	`ManufacturerVehicleModelId` SMALLINT COMMENT 'The MANUFACTURERVEHICLEMODELID defines the ManufacturerVehicleModelId of the ManufacturerVehicleStock' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the ManufacturerVehicleStock' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the ManufacturerVehicleStock' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the ManufacturerVehicleStock' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the ManufacturerVehicleStock' NULL 
)
COMMENT = 'The MANUFACTURERVEHICLESTOCK represents the stock of vehicles held by a manufacturer';

ALTER TABLE `Inventory.ManufacturerVehicleStock`
	ADD  CONSTRAINT PK_Stock PRIMARY KEY  ( `ManufacturerVehicleStockID` ASC );

CREATE INDEX  `XIF2ManufacturerVehicleStock` ON  `Inventory.ManufacturerVehicleStock`
(
	`UserAuthorizationId` ASC
);

CREATE INDEX  `XIF1ManufacturerVehicleStock` ON  `Inventory.ManufacturerVehicleStock`
(
	`ManufacturerVehicleModelId` ASC
);

CREATE TABLE `Location.Country`
(
	`CountryId` SMALLINT COMMENT 'The COUNTRYID defines the CountryId of the Country' NOT NULL ,
	`CountryISO3` CHAR(3) CONSTRAINT `CK_Location_Country_CountryISO3` CHECK (LENGTH(`CountryISO3`) = 3 AND `CountryISO3` NOT LIKE '%[0-9]%') COMMENT 'The COUNTRYISO3 defines the CountryISO3 of the Country' NOT NULL ,
	`CountryName` VARCHAR(20) CONSTRAINT `CK_Location_Country_CountryName` CHECK (`CountryName` LIKE '%^[A-Za-z]%') COMMENT 'The COUNTRYNAME defines the CountryName of the Country' NOT NULL ,
	`CountryISO2` CHAR(2) CONSTRAINT `CK_Location_Country_CountryISO2` CHECK (LENGTH(`CountryISO2`) = 2 AND `CountryISO2` NOT LIKE '%[0-9]%') COMMENT 'The COUNTRYISO2 defines the CountryISO2 of the Country' NOT NULL ,
	`CountrySalesRegion` VARCHAR(20) CONSTRAINT `CK_Location_Country_CountrySalesRegion` CHECK (`CountrySalesRegion` LIKE '%^[A-Za-z]%') COMMENT 'The COUNTRYSALESREGION defines the CountrySalesRegion of the Country' NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Country' NOT NULL ,
	`CountrySysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The COUNTRYSYSSTARTTIME defines the CountrySysStartTime of the Country' NULL ,
	`CountrySysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The COUNTRYSYSENDTIME defines the CountrySysEndTime of the Country' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Country' NULL 
)
COMMENT = 'A COUNTRY represent the countries where car manufacturers operate';

ALTER TABLE `Location.Country`
	ADD  CONSTRAINT PK_Country PRIMARY KEY  ( `CountryId` ASC );

CREATE INDEX  `XIF1Country` ON  `Location.Country`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Marketing.Customer`
(
	`CustomerId` SMALLINT COMMENT 'The CUSTOMERID defines the CustomerId of the Customer' NOT NULL ,
	`CustomerLastName` VARCHAR(35) CONSTRAINT `CK_Marketing_Customer_CustomerLastName` CHECK (`CustomerLastName` LIKE '%^[A-Za-z]%') COMMENT 'The CUSTOMERLASTNAME defines the CustomerLastName of the Customer' NOT NULL ,
	`CustomerTown` VARCHAR(20) CONSTRAINT `CK_Marketing_Customer_CustomerTown` CHECK (`CustomerTown` LIKE '%^[A-Za-z]%') COMMENT 'The CUSTOMERTOWN defines the CustomerTown of the Customer' NOT NULL ,
	`CustomerPostalCode` VARCHAR(10)  DEFAULT '' CONSTRAINT `CK_Marketing_Customer_CustomerPostalCode` CHECK (`CustomerPostalCode` LIKE '%[0-9]%') COMMENT 'The CUSTOMERPOSTALCODE defines the CustomerPostalCode of the Customer' NULL ,
	`CustomerIsCustomerReseller` TINYINT COMMENT 'The CUSTOMERISCUSTOMERRESELLER defines the CustomerIsCustomerReseller of the Customer' NOT NULL ,
	`CustomerIsCustomerCreditRisk` TINYINT COMMENT 'The CUSTOMERISCUSTOMERCREDITRISK defines the CustomerIsCustomerCreditRisk of the Customer' NOT NULL ,
	`CountryId` SMALLINT COMMENT 'The COUNTRYID defines the CountryId of the Customer' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the Customer' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the Customer' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the Customer' NULL ,
	`CustomerFirstName` VARCHAR(25) CONSTRAINT `CK_Marketing_Customer_CustomerFirstName` CHECK (`CustomerFirstName` LIKE '%^[A-Za-z]%') COMMENT 'The CUSTOMERFIRSTNAME defines the CustomerFirstName of the Customer' NOT NULL ,
	`CustomerFullName` VARCHAR(20) CONSTRAINT `CK_Marketing_Customer_CustomerFullName` CHECK (`CustomerFullName` LIKE '%^[A-Za-z]%') COMMENT 'The CUSTOMERFULLNAME defines the CustomerFullName of the Customer' NOT NULL ,
	`CustomerStreetNumber` INTEGER COMMENT 'The CUSTOMERSTREETNUMBER defines the CustomerStreetNumber of the Customer' NOT NULL ,
	`CustomerStreetName` VARCHAR(20) CONSTRAINT `CK_Marketing_Customer_CustomerStreetName` CHECK (`CustomerStreetName` LIKE '%^[A-Za-z]%') COMMENT 'The CUSTOMERSTREETNAME defines the CustomerStreetName of the Customer' NOT NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the Customer' NULL 
)
COMMENT = 'The CUSTOMER represents individuals or organizations that purchase cars from the manufacturer';

ALTER TABLE `Marketing.Customer`
	ADD  CONSTRAINT PK_Customer PRIMARY KEY  ( `CustomerId` ASC );

CREATE INDEX  `XIF1Customer` ON  `Marketing.Customer`
(
	`CountryId` ASC
);

CREATE INDEX  `XIF2Customer` ON  `Marketing.Customer`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Marketing.MarketingCategory`
(
	`MarketingCategoryType` VARCHAR(20) CONSTRAINT `CK_Marketing_CurrentTimeStamp_MarketingCategoryType` CHECK (`MarketingCategoryType` LIKE '%^[A-Za-z]%') COMMENT 'The MARKETINGCATEGORYTYPE defines the MarketingCategoryType of the MarketingCategory' NULL ,
	`MarketingTypeId` SMALLINT COMMENT 'The MARKETINGTYPEID defines the MarketingTypeId of the MarketingCategory' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the MarketingCategory' NOT NULL ,
	`MarketingCategorySysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The MARKETINGCATEGORYSYSSTARTTIME defines the MarketingCategorySysStartTime of the MarketingCategory' NULL ,
	`MarketingCategorySysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The MARKETINGCATEGORYSYSENDTIME defines the MarketingCategorySysEndTime of the MarketingCategory' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the MarketingCategory' NULL 
)
COMMENT = 'A MARKETINGCATEGORY entity categorizes cars based on a marketing criteria. ';

ALTER TABLE `Marketing.MarketingCategory`
	ADD  CONSTRAINT XPKMarketingCategory PRIMARY KEY  ( `MarketingTypeId` ASC );

CREATE INDEX  `XIF1MarketingCategory` ON  `Marketing.MarketingCategory`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Marketing.SalesOrderVehicle`
(
	`SalesOrderVehicleId` SMALLINT COMMENT 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicle' NOT NULL ,
	`CustomerId` SMALLINT COMMENT 'The CUSTOMERID defines the CustomerId of the SalesOrderVehicle' NOT NULL ,
	`StaffId` SMALLINT COMMENT 'The STAFFID defines the StaffId of the SalesOrderVehicle' NOT NULL ,
	`SalesOrderVehicleInvoiceNumber` CHAR(8) COMMENT 'The SALESORDERVEHICLEINVOICENUMBER defines the SalesOrderVehicleInvoiceNumber of the SalesOrderVehicle' NOT NULL ,
	`SalesOrderVehicleSaleDate` DATE COMMENT 'The SALESORDERVEHICLESALEDATE defines the SalesOrderVehicleSaleDate of the SalesOrderVehicle' NOT NULL ,
	`SalesOrderVehicleCategoryDescription` VARCHAR(20) COMMENT 'The SALESORDERVEHICLECATEGORYDESCRIPTION defines the SalesOrderVehicleCategoryDescription of the SalesOrderVehicle' NOT NULL ,
	`SalesOrderVehicleLowerThreshold` INTEGER CONSTRAINT `CK_Marketing_SalesOrderVehicle_SalesOrderVehicleLowerThreshold` CHECK ((`SalesOrderVehicleLowerThreshold` >= 100 AND `SalesOrderVehicleLowerThreshold` <= 250000)) COMMENT 'The SALESORDERVEHICLELOWERTHRESHOLD defines the SalesOrderVehicleLowerThreshold of the SalesOrderVehicle' NOT NULL ,
	`SalesOrderVehicleUpperThreshold` INTEGER CONSTRAINT `CK_Marketing_SalesOrderVehicle_SalesOrderVehicleUpperThreshold` CHECK ((`SalesOrderVehicleUpperThreshold` >= 100 AND `SalesOrderVehicleUpperThreshold` <= 250000)) COMMENT 'The SALESORDERVEHICLEUPPERTHRESHOLD defines the SalesOrderVehicleUpperThreshold of the SalesOrderVehicle' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicle' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicle' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicle' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicle' NULL 
)
COMMENT = 'The SALESORDERVEHICLE entity represents information related to the sales of a vehicle';

ALTER TABLE `Marketing.SalesOrderVehicle`
	ADD  CONSTRAINT XPKSalesOrderVehicle PRIMARY KEY  ( `SalesOrderVehicleId` ASC );

CREATE INDEX  `XIF2SalesOrderVehicle` ON  `Marketing.SalesOrderVehicle`
(
	`StaffId` ASC
);

CREATE INDEX  `XIF1SalesOrderVehicle` ON  `Marketing.SalesOrderVehicle`
(
	`CustomerId` ASC
);

CREATE INDEX  `XIF3SalesOrderVehicle` ON  `Marketing.SalesOrderVehicle`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Marketing.SalesOrderVehicleDetail`
(
	`SalesOrderVehicleDetailId` SMALLINT COMMENT 'The SALESORDERVEHICLEDETAILID defines the SalesOrderVehicleDetailId of the SalesOrderVehicleDetail' NOT NULL ,
	`SalesOrderVehicleId` SMALLINT COMMENT 'The SALESORDERVEHICLEID defines the SalesOrderVehicleId of the SalesOrderVehicleDetail' NOT NULL ,
	`LineItemNumber` DECIMAL(18,2) COMMENT 'The LINEITEMNUMBER defines the LineItemNumber of the SalesOrderVehicleDetail' NOT NULL ,
	`LineItemDiscount` DECIMAL(18,2) COMMENT 'The LINEITEMDISCOUNT defines the LineItemDiscount of the SalesOrderVehicleDetail' NOT NULL ,
	`DerivedDiscountedSalePrice` DECIMAL(18,2) COMMENT 'The DERIVEDDISCOUNTEDSALEPRICE defines the DerivedDiscountedSalePrice of the SalesOrderVehicleDetail' NOT NULL ,
	`ManufacturerVehicleStockID` SMALLINT COMMENT 'The MANUFACTURERVEHICLESTOCKID defines the ManufacturerVehicleStockID of the SalesOrderVehicleDetail' NOT NULL ,
	`UserAuthorizationId` SMALLINT COMMENT 'The USERAUTHORIZATIONID defines the UserAuthorizationId of the SalesOrderVehicleDetail' NOT NULL ,
	`SysStartTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSSTARTTIME defines the SysStartTime of the SalesOrderVehicleDetail' NULL ,
	`SysEndTime` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP COMMENT 'The SYSENDTIME defines the SysEndTime of the SalesOrderVehicleDetail' NULL ,
	`SalesPrice` DECIMAL(18,2) COMMENT 'The SALESPRICE defines the SalesPrice of the SalesOrderVehicleDetail' NOT NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SalesOrderVehicleDetail' NULL 
)
COMMENT = 'The SALESORDERVEHICLEDETAIL represents details about the transaction of vehicle sales';

ALTER TABLE `Marketing.SalesOrderVehicleDetail`
	ADD  CONSTRAINT PK_SalesDetails PRIMARY KEY  ( `SalesOrderVehicleDetailId` ASC );

CREATE INDEX  `XIF1SalesOrderVehicleDetail` ON  `Marketing.SalesOrderVehicleDetail`
(
	`SalesOrderVehicleId` ASC
);

CREATE INDEX  `XIF2SalesOrderVehicleDetail` ON  `Marketing.SalesOrderVehicleDetail`
(
	`ManufacturerVehicleStockID` ASC
);

CREATE INDEX  `XIF3SalesOrderVehicleDetail` ON  `Marketing.SalesOrderVehicleDetail`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Marketing.SpendCapacity`
(
	`SpendCapacityID` SMALLINT COMMENT 'The SPENDCAPACITYID defines the SpendCapacityID of the SpendCapacity' NOT NULL ,
	`SpendCapacity` VARCHAR(20) CONSTRAINT `CK_Marketing_SpendCapacity_SpendCapacity` CHECK (`SpendCapacity` IN ('Lots', 'Some', 'Immense', 'None')) COMMENT 'The SPENDCAPACITY defines the SpendCapacity of the SpendCapacity' NOT NULL ,
	`CustomerId` SMALLINT COMMENT 'The CUSTOMERID defines the CustomerId of the SpendCapacity' NOT NULL ,
	`RowLevelHashKey` BLOB COMMENT 'The ROWLEVELHASHKEY defines the RowLevelHashKey of the SpendCapacity' NULL 
)
COMMENT = 'A SPENDCAPACITY is the amount description of a customers spending capacity';

ALTER TABLE `Marketing.SpendCapacity`
	ADD  CONSTRAINT XPKSpendCapacity PRIMARY KEY  ( `SpendCapacityID` ASC );

CREATE INDEX  `XIF1SpendCapacity` ON  `Marketing.SpendCapacity`
(
	`CustomerId` ASC
);

ALTER TABLE `Audit.CommonColumnsForTriggerTemplate` CHANGE RowLevelHashKey RowLevelHashKey INT AUTO_INCREMENT;
ALTER TABLE `Audit.Country` CHANGE CountryAuditId CountryAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.Customer` CHANGE CustomerAuditId CustomerAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.ManufacturerVehicleMake` CHANGE ManufacturerMakeAuditId ManufacturerMakeAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.ManufacturerVehicleModel` CHANGE ManufacturerModelAuditId ManufacturerModelAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.ManufacturerVehicleStock` CHANGE ManufacturerVehicleStockAuditId ManufacturerVehicleStockAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.SalesOrderVehicle` CHANGE SalesOrderVehicleAuditId SalesOrderVehicleAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.SalesOrderVehicleDetail` CHANGE SalesOrderVehicleDetailAuditId SalesOrderVehicleDetailAuditId INT AUTO_INCREMENT;
ALTER TABLE `Audit.Staff` CHANGE StaffAuditId StaffAuditId INT AUTO_INCREMENT;
ALTER TABLE `DbSecurity.UserAuthorization` CHANGE UserAuthorizationId UserAuthorizationId INT AUTO_INCREMENT;
ALTER TABLE `HumanResources.Department` CHANGE DepartmentID DepartmentID INT AUTO_INCREMENT;
ALTER TABLE `HumanResources.Staff` CHANGE StaffId StaffId INT AUTO_INCREMENT;
ALTER TABLE `Inventory.ManufacturerVehicleMake` CHANGE ManufacturerVehicleMakeID ManufacturerVehicleMakeID INT AUTO_INCREMENT;
ALTER TABLE `Inventory.ManufacturerVehicleModel` CHANGE ManufacturerVehicleModelId ManufacturerVehicleModelId INT AUTO_INCREMENT;
ALTER TABLE `Inventory.ManufacturerVehicleStock` CHANGE ManufacturerVehicleStockID ManufacturerVehicleStockID INT AUTO_INCREMENT;
ALTER TABLE `Location.Country` CHANGE CountryId CountryId INT AUTO_INCREMENT;
ALTER TABLE `Marketing.Customer` CHANGE CustomerId CustomerId INT AUTO_INCREMENT;
ALTER TABLE `Marketing.MarketingCategory` CHANGE MarketingTypeId MarketingTypeId INT AUTO_INCREMENT;
ALTER TABLE `Marketing.SalesOrderVehicle` CHANGE SalesOrderVehicleId SalesOrderVehicleId INT AUTO_INCREMENT;
ALTER TABLE `Marketing.SalesOrderVehicleDetail` CHANGE SalesOrderVehicleDetailId SalesOrderVehicleDetailId INT AUTO_INCREMENT;
ALTER TABLE `Marketing.SpendCapacity`  CHANGE SpendCapacityId SpendCapacityId INT AUTO_INCREMENT;
ALTER TABLE `dbo.sysdiagrams` CHANGE diagram_id DiagramId INT AUTO_INCREMENT;


ALTER TABLE `HumanResources.Department`
ADD  CONSTRAINT `FK_DepartmentlUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `HumanResources.Staff`
ADD  CONSTRAINT `FK_StaffStaff_Staff` FOREIGN KEY (`StaffId`) REFERENCES `HumanResources.Staff` (`StaffId`);

ALTER TABLE `HumanResources.Staff`
ADD  CONSTRAINT `FK_StaffDepartment_Department` FOREIGN KEY (`DepartmentID`) REFERENCES `HumanResources.Department` (`DepartmentID`);

ALTER TABLE `HumanResources.Staff`
ADD  CONSTRAINT `FK_StaffUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Inventory.ManufacturerVehicleMake`
ADD  CONSTRAINT `FK_ManufacturerVehicleMakeMarketingCategory_MarketingCategory` FOREIGN KEY (`MarketingTypeId`) REFERENCES `Marketing.MarketingCategory` (`MarketingTypeId`);

ALTER TABLE `Inventory.ManufacturerVehicleMake`
ADD  CONSTRAINT `FK_ManufacturerVehicleMakelUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Inventory.ManufacturerVehicleMake`
ADD  CONSTRAINT `FK_ManufacturerVehicleMakeCountry_Country` FOREIGN KEY (`CountryId`) REFERENCES `Location.Country` (`CountryId`);

ALTER TABLE `Inventory.ManufacturerVehicleModel`
ADD  CONSTRAINT `FK_VehicleModelVehicleMake_VehicleMake` FOREIGN KEY (`ManufacturerVehicleMakeID`) REFERENCES `Inventory.ManufacturerVehicleMake` (`ManufacturerVehicleMakeID`);

ALTER TABLE `Inventory.ManufacturerVehicleModel`
ADD  CONSTRAINT `FK_ManufacturerVehicleModelUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Inventory.ManufacturerVehicleModel`
ADD  CONSTRAINT `FK_ManufacturerVehicleModelCountry_Country` FOREIGN KEY (`ManufacturerVehicleModelVariantCountryID`) REFERENCES `Location.Country` (`CountryId`);

ALTER TABLE `Inventory.ManufacturerVehicleStock`
ADD  CONSTRAINT `FK_ManufacturerVehicleStocklUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Inventory.ManufacturerVehicleStock`
	ADD  CONSTRAINT `FK_VehicleStockVehicleModel_VehicleModel` FOREIGN KEY (`ManufacturerVehicleModelId`) REFERENCES `Inventory.ManufacturerVehicleModel` (`ManufacturerVehicleModelId`);

ALTER TABLE `Location.Country`
	ADD  CONSTRAINT `FK_CountrylUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Marketing.Customer`
	ADD  CONSTRAINT `FK_CustomerCountry_Country` FOREIGN KEY (`CountryId`) REFERENCES `Location.Country` (`CountryId`);

ALTER TABLE `Marketing.Customer`
	ADD  CONSTRAINT `FK_CustomerlUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Marketing.MarketingCategory`
	ADD  CONSTRAINT `FK_MarketingCategorylUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Marketing.SalesOrderVehicle`
	ADD  CONSTRAINT `FK_OrderVehicleStaff_Staff` FOREIGN KEY (`StaffId`) REFERENCES `HumanResources.Staff` (`StaffId`);

ALTER TABLE `Marketing.SalesOrderVehicle`
	ADD  CONSTRAINT `FK_OrderVehicleCustomer_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Marketing.Customer` (`CustomerId`);

ALTER TABLE `Marketing.SalesOrderVehicle`
	ADD  CONSTRAINT `FK_SalesOrderVehiclelUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Marketing.SalesOrderVehicleDetail`
	ADD  CONSTRAINT `FK_OrderVehicleDetailOrderVehicle_OrderVehicle` FOREIGN KEY (`SalesOrderVehicleId`) REFERENCES `Marketing.SalesOrderVehicle` (`SalesOrderVehicleId`);

ALTER TABLE `Marketing.SalesOrderVehicleDetail`
	ADD  CONSTRAINT `FK_SalesOrderVehicleDetailManufacturerVehicleStock_ManufacturerV` FOREIGN KEY (`ManufacturerVehicleStockID`) REFERENCES `Inventory.ManufacturerVehicleStock` (`ManufacturerVehicleStockID`);

ALTER TABLE `Marketing.SalesOrderVehicleDetail`
	ADD  CONSTRAINT `FK_SalesOrderVehicleDetailUserAuthorization_UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`);

ALTER TABLE `Marketing.SpendCapacity`
	ADD  CONSTRAINT `FK_SpendCapacityCustomer_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Marketing.Customer` (`CustomerId`);


