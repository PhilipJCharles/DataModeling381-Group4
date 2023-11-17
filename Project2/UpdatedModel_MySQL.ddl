
CREATE TABLE `DbSecurity.UserAuthorization`
(
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the USERAUTHORIZATION' NOT NULL ,
	`ClassTime` TIME  DEFAULT '10:45' COMMENT 'The CLASSTIME column is the ClassTime of the USERAUTHORIZATION' NOT NULL ,
	`IndividualProject` VARCHAR(20)  DEFAULT 'CSCI381 Midterm Project' COMMENT 'The INDIVIDUALPROJECT column is the IndividualProject of the USERAUTHORIZATION' NULL ,
	`GroupMemberLastName` VARCHAR(20) CONSTRAINT `CHK_DbSecurity_UserAuthorization_GroupMemberLastName` CHECK (`GroupMemberLastName` LIKE '%[^A-Za-z0-9]%') COMMENT 'The GROUPMEMBERLASTNAME column is the GroupMemberLastName of the USERAUTHORIZATION' NOT NULL ,
	`GroupMemberFirstName` VARCHAR(20) CONSTRAINT `CHK_DbSecurity_UserAuthorization_GroupMemberFirstName` CHECK (`GroupMemberFirstName` LIKE '%[^A-Za-z0-9]%') COMMENT 'The GROUPMEMBERFIRSTNAME column is the GroupMemberFirstName of the USERAUTHORIZATION' NOT NULL ,
	`GroupName` VARCHAR(20) CONSTRAINT `CHK_DbSecurity_UserAuthorization_GroupName` CHECK (`GroupName` LIKE '%[^A-Za-z0-9]%') COMMENT 'The GROUPNAME column is the GroupName of the USERAUTHORIZATION' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the USERAUTHORIZATION' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the USERAUTHORIZATION' NULL 
);

ALTER TABLE `DbSecurity.UserAuthorization`
	ADD  CONSTRAINT XPKUserAuthorization PRIMARY KEY  ( `UserAuthorizationId` ASC );

CREATE TABLE `HumanResources.Employee`
(
	`EmployeeId` INTEGER COMMENT 'The EMPLOYEEID column is the EmployeeId of the EMPLOYEE' NOT NULL ,
	`EmployeeLastName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The EMPLOYEELASTNAME column is the EmployeeLastName of the EMPLOYEE' NOT NULL ,
	`EmployeeFirstName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The EMPLOYEEFIRSTNAME column is the EmployeeFirstName of the EMPLOYEE' NOT NULL ,
	`EmployeeTitle` VARCHAR(20)  DEFAULT Unknown COMMENT 'The EMPLOYEETITLE column is the EmployeeTitle of the EMPLOYEE' NOT NULL ,
	`EmployeeTitleOfCourtesy` VARCHAR(5)  DEFAULT Unknown COMMENT 'The EMPLOYEETITLEOFCOURTESY column is the EmployeeTitleOfCourtesy of the EMPLOYEE' NOT NULL ,
	`EmployeeBirthDate` DATE CONSTRAINT `CHK_birthdate` CHECK (`EmployeeBirthDate` <= CONVERT([date],GETDATE())) COMMENT 'The EMPLOYEEBIRTHDATE column is the EmployeeBirthDate of the EMPLOYEE' NOT NULL ,
	`EmployeeHireDate` DATE  DEFAULT sysdatetime() COMMENT 'The EMPLOYEEHIREDATE column is the EmployeeHireDate of the EMPLOYEE' NOT NULL ,
	`EmployeeAddress` VARCHAR(20)  DEFAULT Unknown COMMENT 'The EMPLOYEEADDRESS column is the EmployeeAddress of the EMPLOYEE' NOT NULL ,
	`EmployeeCity` VARCHAR(20) COMMENT 'The EMPLOYEECITY column is the EmployeeCity of the EMPLOYEE' NULL ,
	`EmployeeRegion` VARCHAR(20) COMMENT 'The EMPLOYEEREGION column is the EmployeeRegion of the EMPLOYEE' NULL ,
	`EmployeePostalCode` VARCHAR(20) COMMENT 'The EMPLOYEEPOSTALCODE column is the EmployeePostalCode of the EMPLOYEE' NULL ,
	`EmployeeCountry` VARCHAR(20)  DEFAULT United States COMMENT 'The EMPLOYEECOUNTRY column is the EmployeeCountry of the EMPLOYEE' NOT NULL ,
	`EmployeePhoneNumber` CHAR(10) COMMENT 'The EMPLOYEEPHONENUMBER column is the EmployeePhoneNumber of the EMPLOYEE' NOT NULL ,
	`EmployeeManagerId` INTEGER COMMENT 'The EMPLOYEEMANAGERID column is the EmployeeManagerId of the EMPLOYEE' NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the EMPLOYEE' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the EMPLOYEE' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the EMPLOYEE' NULL 
);

ALTER TABLE `HumanResources.Employee`
	ADD  CONSTRAINT PK_Employees PRIMARY KEY  ( `EmployeeId` ASC );

CREATE INDEX  `XIF2Employee` ON  `HumanResources.Employee`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Nums`
(
	`NumsN` INTEGER COMMENT 'The NUMSN column is the NumsN of the NUMS' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the NUMS' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the NUMS' NULL ,
	`DateOfLastUpdated` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATED column is the DateOfLastUpdated of the NUMS' NULL 
)
COMMENT = 'The NUMS entity defines the numbers used for the model';

ALTER TABLE `Nums`
	ADD  CONSTRAINT PK_Nums PRIMARY KEY  ( `NumsN` ASC );

CREATE INDEX  `XIF1Nums` ON  `Nums`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Production.Supplier`
(
	`SupplierId` INTEGER COMMENT 'The SUPPLIERID column is the SupplierId of the SUPPLIER' NOT NULL ,
	`SupplierCompanyName` VARCHAR(20)  DEFAULT Non-Business Customer COMMENT 'The SUPPLIERCOMPANYNAME column is the SupplierCompanyName of the SUPPLIER' NOT NULL ,
	`SupplierContactName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The SUPPLIERCONTACTNAME column is the SupplierContactName of the SUPPLIER' NOT NULL ,
	`SupplierContactTitle` VARCHAR(20)  DEFAULT Unknown COMMENT 'The SUPPLIERCONTACTTITLE column is the SupplierContactTitle of the SUPPLIER' NOT NULL ,
	`SupplierAddress` VARCHAR(20)  DEFAULT Unknown COMMENT 'The SUPPLIERADDRESS column is the SupplierAddress of the SUPPLIER' NOT NULL ,
	`SupplierCity` VARCHAR(20) COMMENT 'The SUPPLIERCITY column is the SupplierCity of the SUPPLIER' NOT NULL ,
	`SupplierRegion` VARCHAR(20) COMMENT 'The SUPPLIERREGION column is the SupplierRegion of the SUPPLIER' NULL ,
	`SupplierPostalCode` VARCHAR(20) COMMENT 'The SUPPLIERPOSTALCODE column is the SupplierPostalCode of the SUPPLIER' NULL ,
	`SupplierCountry` VARCHAR(20)  DEFAULT United States COMMENT 'The SUPPLIERCOUNTRY column is the SupplierCountry of the SUPPLIER' NOT NULL ,
	`SupplierPhoneNumber` CHAR(10) COMMENT 'The SUPPLIERPHONENUMBER column is the SupplierPhoneNumber of the SUPPLIER' NOT NULL ,
	`SupplierFaxNumber` CHAR(10) COMMENT 'The SUPPLIERFAXNUMBER column is the SupplierFaxNumber of the SUPPLIER' NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the SUPPLIER' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the SUPPLIER' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the SUPPLIER' NULL 
);

ALTER TABLE `Production.Supplier`
	ADD  CONSTRAINT PK_Suppliers PRIMARY KEY  ( `SupplierId` ASC );

CREATE INDEX  `XIF1Supplier` ON  `Production.Supplier`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Productions.Category`
(
	`CategoryId` INTEGER COMMENT 'The CATEGORYID column is the CategoryId of the CATEGORY' NOT NULL ,
	`CategoryName` VARCHAR(20) COMMENT 'The CATEGORYNAME column is the CategoryName of the CATEGORY' NOT NULL ,
	`CategoryDescription` VARCHAR(20)  DEFAULT Unknown COMMENT 'The CATEGORYDESCRIPTION column is the CategoryDescription of the CATEGORY' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the CATEGORY' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the CATEGORY' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the CATEGORY' NULL 
);

ALTER TABLE `Productions.Category`
	ADD  CONSTRAINT PK_Categories PRIMARY KEY  ( `CategoryId` ASC );

CREATE INDEX  `XIF1Category` ON  `Productions.Category`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Productions.Product`
(
	`ProductId` INTEGER COMMENT 'The PRODUCTID column is the ProductId of the PRODUCT' NOT NULL ,
	`ProductName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The PRODUCTNAME column is the ProductName of the PRODUCT' NOT NULL ,
	`SupplierId` INTEGER COMMENT 'The SUPPLIERID column is the SupplierId of the PRODUCT' NOT NULL ,
	`CategoryId` INTEGER COMMENT 'The CATEGORYID column is the CategoryId of the PRODUCT' NOT NULL ,
	`ProductUnitPrice` DECIMAL(18,2) CONSTRAINT `CHK_Products_unitprice` CHECK (`ProductUnitPrice` >= 0) COMMENT 'The PRODUCTUNITPRICE column is the ProductUnitPrice of the PRODUCT' NOT NULL ,
	`ProductDiscontinued` INTEGER  DEFAULT 0 COMMENT 'The PRODUCTDISCONTINUED column is the ProductDiscontinued of the PRODUCT' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the PRODUCT' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the PRODUCT' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the PRODUCT' NULL 
)
COMMENT = 'The PRODUCT entity defines an item that is to be bought and which category it belongs to';

ALTER TABLE `Productions.Product`
	ADD  CONSTRAINT PK_Products PRIMARY KEY  ( `ProductId` ASC );

CREATE INDEX  `XIF3Product` ON  `Productions.Product`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Sales.Customer`
(
	`CustomerId` INTEGER COMMENT 'The CUSTOMERID column is the CustomerId of the CUSTOMER' NOT NULL ,
	`CustomerCompanyName` VARCHAR(20)  DEFAULT Non-Business Customer COMMENT 'The CUSTOMERCOMPANYNAME column is the CustomerCompanyName of the CUSTOMER' NOT NULL ,
	`CustomerContactName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The CUSTOMERCONTACTNAME column is the CustomerContactName of the CUSTOMER' NOT NULL ,
	`CustomerContactTitle` VARCHAR(20)  DEFAULT Unknown COMMENT 'The CUSTOMERCONTACTTITLE column is the CustomerContactTitle of the CUSTOMER' NOT NULL ,
	`CustomerAddress` VARCHAR(20)  DEFAULT Unknown COMMENT 'The CUSTOMERADDRESS column is the CustomerAddress of the CUSTOMER' NOT NULL ,
	`CustomerCity` VARCHAR(20) COMMENT 'The CUSTOMERCITY column is the CustomerCity of the CUSTOMER' NOT NULL ,
	`CustomerRegion` VARCHAR(20) COMMENT 'The CUSTOMERREGION column is the CustomerRegion of the CUSTOMER' NULL ,
	`CustomerPostalCode` VARCHAR(20) COMMENT 'The CUSTOMERPOSTALCODE column is the CustomerPostalCode of the CUSTOMER' NULL ,
	`CustomerCountryCode` VARCHAR(20)  DEFAULT United States COMMENT 'The CUSTOMERCOUNTRYCODE column is the CustomerCountryCode of the CUSTOMER' NOT NULL ,
	`CustomerPhoneNumber` CHAR(10) COMMENT 'The CUSTOMERPHONENUMBER column is the CustomerPhoneNumber of the CUSTOMER' NOT NULL ,
	`CustomerFaxNumber` CHAR(10) COMMENT 'The CUSTOMERFAXNUMBER column is the CustomerFaxNumber of the CUSTOMER' NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the CUSTOMER' NOT NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the CUSTOMER' NULL ,
	`DateAded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADED column is the DateAded of the CUSTOMER' NULL 
);

ALTER TABLE `Sales.Customer`
	ADD  CONSTRAINT PK_Customers PRIMARY KEY  ( `CustomerId` ASC );

CREATE INDEX  `XIF1Customer` ON  `Sales.Customer`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Sales.Order`
(
	`OrderId` INTEGER COMMENT 'The ORDERID column is the OrderId of the ORDER' NOT NULL ,
	`CustomerId` INTEGER COMMENT 'The CUSTOMERID column is the CustomerId of the ORDER' NULL ,
	`EmployeeId` INTEGER COMMENT 'The EMPLOYEEID column is the EmployeeId of the ORDER' NOT NULL ,
	`ShipperId` INTEGER COMMENT 'The SHIPPERID column is the ShipperId of the ORDER' NOT NULL ,
	`OrderDate` DATE  DEFAULT sysdatetime() COMMENT 'The ORDERDATE column is the OrderDate of the ORDER' NOT NULL ,
	`OrderRequiredDate` DATE  DEFAULT '99991231 23:59:59' COMMENT 'The ORDERREQUIREDDATE column is the OrderRequiredDate of the ORDER' NOT NULL ,
	`ShipToDate` DATE  DEFAULT sysdatetime() COMMENT 'The SHIPTODATE column is the ShipToDate of the ORDER' NULL ,
	`Freight` DECIMAL(18,2)  DEFAULT 0 COMMENT 'The FREIGHT column is the Freight of the ORDER' NOT NULL ,
	`ShipToName` VARCHAR(20)  DEFAULT Unknown COMMENT 'The SHIPTONAME column is the ShipToName of the ORDER' NOT NULL ,
	`ShipToAddress` VARCHAR(20) COMMENT 'The SHIPTOADDRESS column is the ShipToAddress of the ORDER' NOT NULL ,
	`ShipToCity` VARCHAR(20) COMMENT 'The SHIPTOCITY column is the ShipToCity of the ORDER' NOT NULL ,
	`ShipToRegion` VARCHAR(20) COMMENT 'The SHIPTOREGION column is the ShipToRegion of the ORDER' NULL ,
	`ShipToPostalCode` VARCHAR(20) COMMENT 'The SHIPTOPOSTALCODE column is the ShipToPostalCode of the ORDER' NULL ,
	`ShipToCountry` VARCHAR(20)  DEFAULT United States COMMENT 'The SHIPTOCOUNTRY column is the ShipToCountry of the ORDER' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the ORDER' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the ORDER' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the ORDER' NULL 
)
COMMENT = 'The ORDER entity defines who ordered and where it is to be shipped';

ALTER TABLE `Sales.Order`
	ADD  CONSTRAINT PK_Orders PRIMARY KEY  ( `OrderId` ASC );

CREATE INDEX  `XIF4Order` ON  `Sales.Order`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Sales.OrderDetail`
(
	`OrderId` INTEGER COMMENT 'The ORDERID column is the OrderId of the ORDERDETAIL' NOT NULL ,
	`ProductId` INTEGER COMMENT 'The PRODUCTID column is the ProductId of the ORDERDETAIL' NOT NULL ,
	`OrderDetailUnitPrice` DECIMAL(18,2)  DEFAULT 0 COMMENT 'The ORDERDETAILUNITPRICE column is the OrderDetailUnitPrice of the ORDERDETAIL' NOT NULL ,
	`OrderDetailQuantity` INTEGER  DEFAULT 1 CONSTRAINT `CHK_Quantity` CHECK ([`OrderDetailQuantity`]>(0)) COMMENT 'The ORDERDETAILQUANTITY column is the OrderDetailQuantity of the ORDERDETAIL' NOT NULL ,
	`DiscountPercentage` NUMERIC(4,3)  DEFAULT 0 CONSTRAINT `CHK_DiscountPercentage` CHECK (`DiscountPercentage` BETWEEN 0 AND 1) COMMENT 'The DISCOUNTPERCENTAGE column is the DiscountPercentage of the ORDERDETAIL' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the ORDERDETAIL' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the ORDERDETAIL' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the ORDERDETAIL' NULL 
)
COMMENT = 'The ORDERDETAIL entity gives information about the order such as the amount requested and the price';

ALTER TABLE `Sales.OrderDetail`
	ADD  CONSTRAINT PK_OrderDetails PRIMARY KEY  ( `OrderId` ASC, `ProductId` ASC );

CREATE INDEX  `XIF3OrderDetail` ON  `Sales.OrderDetail`
(
	`UserAuthorizationId` ASC
);

CREATE TABLE `Sales.Shipper`
(
	`ShipperId` INTEGER COMMENT 'The SHIPPERID column is the ShipperId of the SHIPPER' NOT NULL ,
	`ShipperCompanyName` VARCHAR(20)  DEFAULT Non-Business Customer COMMENT 'The SHIPPERCOMPANYNAME column is the ShipperCompanyName of the SHIPPER' NOT NULL ,
	`ShipperPhoneNumber` CHAR(10) COMMENT 'The SHIPPERPHONENUMBER column is the ShipperPhoneNumber of the SHIPPER' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'The USERAUTHORIZATIONID column is the UserAuthorizationId of the SHIPPER' NOT NULL ,
	`DateAdded` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEADDED column is the DateAdded of the SHIPPER' NULL ,
	`DateOfLastUpdate` TIMESTAMP  DEFAULT sysdatetime() COMMENT 'The DATEOFLASTUPDATE column is the DateOfLastUpdate of the SHIPPER' NULL 
);

ALTER TABLE DbSecurity.UserAuthorization CHANGE UserAuthorizationId UserAuthorizationId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE HumanResources.Employee CHANGE EmployeeId EmployeeId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE DbSecurity.UserAuthorization CHANGE NumsN NumsN INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Production.Supplier CHANGE SupplierId SupplierId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Productions.Category CHANGE CategoryId CategoryId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Productions.Product CHANGE ProductId ProductId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Sales.Customer CHANGE CustomerId CustomerId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Sales.Order CHANGE OrderId OrderId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Sales.OrderDetail CHANGE OrderId OrderId INT(10) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Sales.Shipper CHANGE ShipperId ShipperId INT(10) AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE `Sales.Shipper`
	ADD  CONSTRAINT PK_Shippers PRIMARY KEY  ( `ShipperId` ASC );

CREATE INDEX  `XIF1Shipper` ON  `Sales.Shipper`
(
	`UserAuthorizationId` ASC
);

ALTER TABLE `HumanResources.Employee`
	ADD  CONSTRAINT `FK_Employees_Employees` FOREIGN KEY (`EmployeeManagerId`) REFERENCES `HumanResources.Employee` (`EmployeeId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `HumanResources.Employee`
	ADD  CONSTRAINT `R_24` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Nums`
	ADD  CONSTRAINT `R_28` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Production.Supplier`
	ADD  CONSTRAINT `R_27` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Productions.Category`
	ADD  CONSTRAINT `R_22` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Productions.Product`
	ADD  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryId`) REFERENCES `Productions.Category` (`CategoryId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Productions.Product`
	ADD  CONSTRAINT `FK_product_supplier` FOREIGN KEY (`SupplierId`) REFERENCES `Production.Supplier` (`SupplierId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Productions.Product`
	ADD  CONSTRAINT `R_25` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Customer`
	ADD  CONSTRAINT `R_21` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Order`
	ADD  CONSTRAINT `FK_Order_Customer1` FOREIGN KEY (`CustomerId`) REFERENCES `Sales.Customer` (`CustomerId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Order`
	ADD  CONSTRAINT `FK_Order_Employee` FOREIGN KEY (`EmployeeId`) REFERENCES `HumanResources.Employee` (`EmployeeId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Order`
	ADD  CONSTRAINT `FK_Order_Shipper` FOREIGN KEY (`ShipperId`) REFERENCES `Sales.Shipper` (`ShipperId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Order`
	ADD  CONSTRAINT `R_23` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.OrderDetail`
	ADD  CONSTRAINT `FK_OrderDetail_Order` FOREIGN KEY (`OrderId`) REFERENCES `Sales.Order` (`OrderId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.OrderDetail`
	ADD  CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductId`) REFERENCES `Productions.Product` (`ProductId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.OrderDetail`
	ADD  CONSTRAINT `R_28` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;

ALTER TABLE `Sales.Shipper`
	ADD  CONSTRAINT `R_26` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ;
