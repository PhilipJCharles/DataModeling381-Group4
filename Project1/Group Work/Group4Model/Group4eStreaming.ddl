
CREATE SCHEMA [Account]
go

CREATE SCHEMA [Service]
go

CREATE SCHEMA [Transactions]
go

CREATE SCHEMA [Location]
go

CREATE SCHEMA [ContentManagement]
go

CREATE SCHEMA [Unique]
go

CREATE TYPE [dGroup4]
	FROM CHAR(18) NULL
go

CREATE TYPE [dAddress]
	FROM VARCHAR(20) NOT NULL
go

CREATE TYPE [sdAddressLine]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of ADDRESS LINE ATTRIBUTE',
@level0type = 'TYPE', @level0name = 'sdAddressLine'
go

CREATE TYPE [sdCity]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of CITY attribute.',
@level0type = 'TYPE', @level0name = 'sdCity'
go

CREATE TYPE [sdState]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of STATE attribute.',
@level0type = 'TYPE', @level0name = 'sdState'
go

CREATE TYPE [sdZipCode]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of ZIP CODE attribute',
@level0type = 'TYPE', @level0name = 'sdZipCode'
go

CREATE TYPE [dDateTime]
	FROM DATETIME NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'DateTime domain handles both date and time related attributes',
@level0type = 'TYPE', @level0name = 'dDateTime'
go

CREATE TYPE [dEmail]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'dEmail domain handles email related attributes',
@level0type = 'TYPE', @level0name = 'dEmail'
go

CREATE TYPE [dName]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of NAME attributes.',
@level0type = 'TYPE', @level0name = 'dName'
go

CREATE TYPE [dNumber]
	FROM INTEGER NOT NULL
go

CREATE TYPE [dPhoneNumber]
	FROM CHAR(10) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of PHONE attribute.',
@level0type = 'TYPE', @level0name = 'dPhoneNumber'
go

CREATE TYPE [dString]
	FROM CHAR(18) NULL
go

CREATE TYPE [sdFirstName]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of FIRST NAME attributes.',
@level0type = 'TYPE', @level0name = 'sdFirstName'
go

CREATE TYPE [sdLastName]
	FROM VARCHAR(20) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Group 4 domain of LAST NAME attribute.',
@level0type = 'TYPE', @level0name = 'sdLastName'
go

CREATE TYPE [sdAge]
	FROM INTEGER NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'sdAge subdomain handles the Age related attributes',
@level0type = 'TYPE', @level0name = 'sdAge'
go

CREATE TYPE [sdDates]
	FROM DATE NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'sdDates domain handles Date related attributes',
@level0type = 'TYPE', @level0name = 'sdDates'
go

CREATE TYPE [sdPassword]
	FROM VARCHAR(10) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'sdPassword domains handles the password related attributes',
@level0type = 'TYPE', @level0name = 'sdPassword'
go

CREATE TYPE [Unique].[sdKey]
	FROM INTEGER NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'sdUnique domain handles the primary keys',
@level0type = 'TYPE', @level0name = 'sdUnique'
go

CREATE TYPE [sdCreditCardNumber]
	FROM CHAR(16) NULL
go

CREATE TYPE [sdCVV]
	FROM INTEGER NOT NULL
go

CREATE TYPE [sdBitcoinWalletAddress]
	FROM VARCHAR(70) NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Limits a bitcoin address to a 70 char string. Note: a Bitcoin address is normally stored as a Base32 encoded string',
@level0type = 'TYPE', @level0name = 'sdBitcoinWalletAddress'
go

CREATE TYPE [dMoney]
	FROM MONEY NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'dMoney domain deals with money related attributes',
@level0type = 'TYPE', @level0name = 'dMoney'
go

CREATE TYPE [sdPaymentType]
	FROM INTEGER NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the sdpaymenttype domain related attribute',
@level0type = 'TYPE', @level0name = 'sdPaymentType'
go

CREATE TYPE [sdSubscriptionType]
	FROM CHAR(1) NULL
go

CREATE TYPE [dBool]
	FROM BIT NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'dBool is the domain for boolean related attirubtes',
@level0type = 'TYPE', @level0name = 'dBool'
go

CREATE TYPE [sdDescription]
	FROM VARCHAR(50) NOT NULL
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'sdDescription Hanldes description related attributes',
@level0type = 'TYPE', @level0name = 'sdDescription'
go

CREATE TYPE [Domain_1206]
	FROM DATE NOT NULL
go

CREATE TYPE [sdsubscriptionStartDate]
	FROM DATE NULL
go

CREATE TYPE [sdSubscriptionEndDate]
	FROM DATE NOT NULL
go

CREATE RULE [CK_ContentManagementGenre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS', 'UU')
go

CREATE TABLE [ContentManagement].[Actor]
( 
	[ActorId]            [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[ActorFirstName]     [sdFirstName] ,
	[ActorLastName]      [sdLastName] ,
	[ActorBirthDate]     [sdDates] 
)
go

ALTER TABLE [ContentManagement].[Actor]
	 WITH CHECK ADD CONSTRAINT [CK_ContentManagement_Actor_FirstName] CHECK  ( PATINDEX('%[0-9]%', ActorFirstName) < 0 )
go

ALTER TABLE [ContentManagement].[Actor]
	 WITH CHECK ADD CONSTRAINT [CK_ContentManagemet_Actor_LastName] CHECK  ( PATINDEX('%[0-9]%', ActorLastName) < 0 )
go

ALTER TABLE [ContentManagement].[Actor]
	 WITH CHECK ADD CONSTRAINT [CK_ContentManagement_Actor_BirthDate] CHECK  ( [ActorBirthDate] BETWEEN '19000101' AND CONVERT(DATE,GETDATE()) )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'An ACTOR is a person that plays a specific character in the movie.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Actor'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ACTORID is a unique ActorId defined in the ACTOR  table',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Actor',
@level2type = 'COLUMN', @level2name = 'ActorId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The FIRSTNAME is the name of a(n) ACTOR',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Actor',
@level2type = 'COLUMN', @level2name = 'ActorFirstName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The LASTNAME is the name of a(n) ACTOR',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Actor',
@level2type = 'COLUMN', @level2name = 'ActorLastName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The BIRTHDATE attribute is the BirthDate for the ACTOR',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Actor',
@level2type = 'COLUMN', @level2name = 'ActorBirthDate'
go

CREATE TABLE [Location].[Address]
( 
	[AddressId]          [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[AddressStreet]      [dName] ,
	[AddressZipCode]     [dNumber] 
	CONSTRAINT [CK_Location_Address_ZipCode]
		CHECK  ( LEN([AddressZipCode])>10 ),
	[CityId]             [Unique].[sdKey]  NOT NULL ,
	[StateId]            [Unique].[sdKey]  NOT NULL ,
	[CountryId]          [Unique].[sdKey]  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = ' Represents the information associated with a physical location of user',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ADDRESSID is a unique AddressId defined in the ADDRESS  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'AddressId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The STREET is the name of a(n) ADDRESS',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'AddressStreet'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ZIPCODE attribute is the zipcode of the ADDRESS',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'AddressZipCode'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the CITYID is a unique CityId defined in the ADDRESS  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'CityId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the STATEID is a unique StateId defined in the ADDRESS  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'StateId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the COUNTRYID is a unique CountryId defined in the ADDRESS  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Address',
@level2type = 'COLUMN', @level2name = 'CountryId'
go

CREATE TABLE [Transactions].[BitcoinPayment]
( 
	[BitcoinPaymentWalletAddress] [dNumber] ,
	[BitcoinWalletPassword] [dString]  NOT NULL 
	CONSTRAINT [CK_BitcoinPayment_BitcoinWalletPassword]
		CHECK  ( LEN([BitcoinWalletPassword]) < 20 AND 
PATINDEX('%[0-9]%', BitcoinWalletPassword) > 0 AND 
PATINDEX('%[A-Za-z]%', BitcoinWalletPassword) > 0 AND
PATINDEX('%[^a-zA-Z0-9]%', BitcoinWalletPassword) > 0 ),
	[PaymentTransactionNumber] [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A BITCOINPAYMENT is a Payment made via Bitcoin',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'BitcoinPayment'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The bitcoin wallet address for a user making a payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'BitcoinPayment',
@level2type = 'COLUMN', @level2name = 'BitcoinPaymentWalletAddress'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The bitcoin wallet password for a user making a payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'BitcoinPayment',
@level2type = 'COLUMN', @level2name = 'BitcoinWalletPassword'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The identifying number associated with a particular payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'BitcoinPayment',
@level2type = 'COLUMN', @level2name = 'PaymentTransactionNumber'
go

CREATE TABLE [Location].[City]
( 
	[CityId]             [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[CityName]           [dName] ,
	[StateId]            [Unique].[sdKey]  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Represents the city 

',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'City'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the CITYID is a unique CityId defined in the CITY  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'City',
@level2type = 'COLUMN', @level2name = 'CityId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The NAME is the name of a(n) CITY',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'City',
@level2type = 'COLUMN', @level2name = 'CityName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the STATEID is a unique StateId defined in the CITY  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'City',
@level2type = 'COLUMN', @level2name = 'StateId'
go

CREATE TABLE [ContentManagement].[Content]
( 
	[ContentId]          [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[ContentType]        [dName] ,
	[ContentReleasedDate] [sdDates] ,
	[ContentRating]      [dNumber] 
	CONSTRAINT [CK_ContentManagement_Content_Rating]
		CHECK  ( ContentRating BETWEEN 1 AND 5 ),
	[ContentDescription] [sdDescription] ,
	[ContentDirector]    [dName] 
)
go

ALTER TABLE [ContentManagement].[Content]
	 WITH CHECK ADD CONSTRAINT [CK_ContentManagement_Content_Type] CHECK  ( PATINDEX('%[0-9]%', ContentType) < 0 )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A CONTENT is the type of content being streamed.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The TYPE is the name of a(n) CONTENT',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentType'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The RELEASEDDATE attribute is the ReleasedDate for the CONTENT',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentReleasedDate'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The RATING attribute is the rating of the CONTENT',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentRating'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the DESCRIPTION attributes is the Description of the CONTENT',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentDescription'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The DIRECTOR is the name of a(n) CONTENT',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Content',
@level2type = 'COLUMN', @level2name = 'ContentDirector'
go

CREATE TABLE [Location].[Country]
( 
	[CountryId]          [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[CountryName]        [dName] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Represents a country 
',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Country'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the COUNTRYID is a unique CountryId defined in the COUNTRY  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Country',
@level2type = 'COLUMN', @level2name = 'CountryId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The NAME is the name of a(n) COUNTRY',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'Country',
@level2type = 'COLUMN', @level2name = 'CountryName'
go

CREATE TABLE [Transactions].[CreditCardPayment]
( 
	[CreditCardNumber]   [sdCreditCardNumber]  NOT NULL ,
	[CreditCardPaymentCreditCardCVV] [sdCVV]  NOT NULL 
	CONSTRAINT [CK_CreditCardPayment_CreditCardCVV]
		CHECK  ( CreditCardPaymentCreditCardCVV BETWEEN 0 AND 999 ),
	[PaymentTransactionNumber] [Unique].[sdKey] 
)
go

ALTER TABLE [Transactions].[CreditCardPayment]
	 WITH CHECK ADD CONSTRAINT [CK_CreditCardPayment_CreditCardNumber] CHECK  ( (LEN([CreditCardNumber]) = 16 AND CreditCardNumber NOT LIKE '%[^0-9]%') )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A CREDITCARDPAYMENT is a Payment made via credit card',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'CreditCardPayment'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A 16 digit credit card number',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'CreditCardPayment',
@level2type = 'COLUMN', @level2name = 'CreditCardNumber'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The CVV of the credit card',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'CreditCardPayment',
@level2type = 'COLUMN', @level2name = 'CreditCardPaymentCreditCardCVV'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The identifying number associated with a particular payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'CreditCardPayment',
@level2type = 'COLUMN', @level2name = 'PaymentTransactionNumber'
go

CREATE TABLE [Account].[FavoriteList]
( 
	[ProfileId]          [Unique].[sdKey] ,
	[FavoriteListName]   [dName] ,
	[DateCreated]        [dDateTime]  NULL 
	CONSTRAINT [DF_Account_FavoriteList_DateCreated_CurrentDateTime]
		 DEFAULT  GETDATE(),
	[FavoriteListId]     [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[ContentId]          [Unique].[sdKey]  NULL 
	CONSTRAINT [DF_Account_FavoriteList_ContentId_NullHandler]
		 DEFAULT  0
)
go

ALTER TABLE [Account].[FavoriteList]
	 WITH CHECK ADD CONSTRAINT [CK_Account_FavoriteList_FavoriteListName_ValidName] CHECK  ( PATINDEX('%[0-9]%', FavoriteListName) < 0 )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A LIST is a finite set of content stored in a profile',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the PROFILEID is a unique ProfileId defined in the FAVORITELIST  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList',
@level2type = 'COLUMN', @level2name = 'ProfileId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The NAME is the name of a(n) FAVORITELIST',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList',
@level2type = 'COLUMN', @level2name = 'FavoriteListName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The DATECREATED is the DateCreated of the FavoriteList',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList',
@level2type = 'COLUMN', @level2name = 'DateCreated'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the FAVORITELISTID is a unique FavoriteListId defined in the FAVORITELIST  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList',
@level2type = 'COLUMN', @level2name = 'FavoriteListId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'FavoriteList',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

CREATE TABLE [ContentManagement].[Genre]
( 
	[GenreId]            [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[GenreName]          [dName] 
	CONSTRAINT [DF_ContentManagement_Genre_Name]
		 DEFAULT  'UU',
	[GenreDescription]   [sdDescription] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A GENRE is a category that defines the movie.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Genre'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The Genre Id uniquely identifies the genre.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Genre',
@level2type = 'COLUMN', @level2name = 'GenreId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The name of the genre.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Genre',
@level2type = 'COLUMN', @level2name = 'GenreName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The summary of the genre.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Genre',
@level2type = 'COLUMN', @level2name = 'GenreDescription'
go

CREATE TABLE [ContentManagement].[Movie]
( 
	[ContentId]          [Unique].[sdKey] ,
	[MovieDuration]      [dNumber] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A MOVIE is a film provided by a streaming service and can be watched in a single viewing in about two hours.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The total duration of the movie.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie',
@level2type = 'COLUMN', @level2name = 'MovieDuration'
go

CREATE TABLE [ContentManagement].[Movie_Actor]
( 
	[ContentId]          [Unique].[sdKey] ,
	[ActorId]            [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie_Actor',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ACTORID is a unique ActorId defined in the CONTENTMANAGEMENTMOVIE CONTENTMANAGEMENTACTOR  table',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie_Actor',
@level2type = 'COLUMN', @level2name = 'ActorId'
go

CREATE TABLE [ContentManagement].[Movie_Genre]
( 
	[ContentId]          [Unique].[sdKey] ,
	[GenreId]            [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie_Genre',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The Genre Id uniquely identifies the genre.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'Movie_Genre',
@level2type = 'COLUMN', @level2name = 'GenreId'
go

CREATE TABLE [Transactions].[Payment]
( 
	[PaymentTransactionNumber] [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[PaymentPaymentAmount] [dMoney] 
	CONSTRAINT [Df_Payment_PaymentAmount]
		 DEFAULT  0
	CONSTRAINT [CK_Template_MinimumValueZero_473508954]
		CHECK  ( PaymentPaymentAmount >= 0 ),
	[PaymentPaymentType] [sdPaymentType]  NOT NULL 
	CONSTRAINT [DF_Payment_PaymentType]
		 DEFAULT  3
	CONSTRAINT [CK_Payment_PaymentType]
		CHECK  ( PaymentPaymentType BETWEEN 1 AND 3 ),
	[UserId]             [Unique].[sdKey]  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A PAYMENT is a specific monetary transaction made by a user',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'Payment'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The identifying number associated with a particular payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'Payment',
@level2type = 'COLUMN', @level2name = 'PaymentTransactionNumber'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The amount of money in the payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'Payment',
@level2type = 'COLUMN', @level2name = 'PaymentPaymentAmount'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The method used to make the payment (either credit card, PayPal or bitcoin).
1 is BitcoinPayment
2 is PaypalPayment
3 is CreditCardPayment
PaymentType will default to 3.',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'Payment',
@level2type = 'COLUMN', @level2name = 'PaymentPaymentType'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the USERID is a unique UserId defined in the PAYMENT  table',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'Payment',
@level2type = 'COLUMN', @level2name = 'UserId'
go

CREATE TABLE [Transactions].[PaypalPayment]
( 
	[PayPalUserName]     [dString]  NOT NULL ,
	[PayPalPassword]     [dString]  NOT NULL 
	CONSTRAINT [CK_PaypalPayment_PayPalPassword]
		CHECK  ( LEN([PayPalPassword]) < 20 AND 
PATINDEX('%[0-9]%', PayPalPassword) > 0 AND 
PATINDEX('%[A-Za-z]%', PayPalPassword) > 0 AND
PATINDEX('%[^a-zA-Z0-9]%', PayPalPassword) > 0 ),
	[PaymentTransactionNumber] [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'a PAYPALPAYMENT is a Payment made via PayPal',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'PaypalPayment'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The PayPal username for the user making a payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'PaypalPayment',
@level2type = 'COLUMN', @level2name = 'PayPalUserName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The PayPal password for the user making a payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'PaypalPayment',
@level2type = 'COLUMN', @level2name = 'PayPalPassword'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The identifying number associated with a particular payment',
@level0type = 'SCHEMA', @level0name = 'Transactions',
@level1type = 'TABLE', @level1name = 'PaypalPayment',
@level2type = 'COLUMN', @level2name = 'PaymentTransactionNumber'
go

CREATE TABLE [Service].[PremiumSubscription]
( 
	[PremiumSubscriptionSubscriptionCost] [dMoney] 
	CONSTRAINT [CK_Service_PremiumSubscription_SubscriptionCost_SubscriptionCost]
		CHECK  ( PremiumSubscriptionSubscriptionCost >= 0.00 ),
	[PremiumSubscriptionAdsPerView] [dNumber] 
	CONSTRAINT [CK_Service_PremiumSubscription__AdsPerView_AdsPerView]
		CHECK  ( PremiumSubscriptionAdsPerView >= 0 ),
	[PremiumSubscriptionMaxVideoQuality] [dNumber] 
	CONSTRAINT [CK_Service_PremiumSubscription_MaxVideoQuality_MaxVideoQuality]
		CHECK  ( [PremiumSubscriptionMaxVideoQuality]='LOW' OR [PremiumSubscriptionMaxVideoQuality]='HIGH' ),
	[UserId]             [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A PREMIUMSUBSCRIPTION is a type of subscription that determines the number of ads, and video quality.',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'PremiumSubscription'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Thedmoney of the premiumsubscription.',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'PremiumSubscription',
@level2type = 'COLUMN', @level2name = 'PremiumSubscriptionSubscriptionCost'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the USERID is a unique UserId defined in the PREMIUMSUBSCRIPTION  table',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'PremiumSubscription',
@level2type = 'COLUMN', @level2name = 'UserId'
go

CREATE TABLE [Account].[Profile]
( 
	[UserId]             [Unique].[sdKey] ,
	[ProfileId]          [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[ProfileName]        [dName] ,
	[ContentId]          [Unique].[sdKey] 
	CONSTRAINT [DF_Account_Profile_ContentId_NullHandler]
		 DEFAULT  0
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A PROFILE is a personalized sub-account within a single user''s main account.',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'Profile'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ID is a unique ID defined in the PROFILE  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'Profile',
@level2type = 'COLUMN', @level2name = 'UserId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the PROFILEID is a unique ProfileId defined in the PROFILE  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'Profile',
@level2type = 'COLUMN', @level2name = 'ProfileId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The PROFILENAME is the name of a(n) PROFILE',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'Profile',
@level2type = 'COLUMN', @level2name = 'ProfileName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'Profile',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

CREATE TABLE [Service].[StandardSubscription]
( 
	[StandardSubscriptionSubscriptionCost] [dMoney] ,
	[StandardSubscriptionAdsPerView] [dNumber] 
	CONSTRAINT [CK_Template_AdsPerView_780796290]
		CHECK  ( StandardSubscriptionAdsPerView >= 0 ),
	[StandardSubscriptionMaxVideoQuality] [dNumber] ,
	[UserId]             [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A STANDARDSUBSCRIPTION is a type of subscription that determines the number of ads, and video quality.',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'StandardSubscription'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the USERID is a unique UserId defined in the STANDARDSUBSCRIPTION  table',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'StandardSubscription',
@level2type = 'COLUMN', @level2name = 'UserId'
go

CREATE TABLE [Location].[State]
( 
	[StateId]            [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[StateName]          [dName] ,
	[CountryId]          [Unique].[sdKey]  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'Represents a state with in a country',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'State'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the STATEID is a unique StateId defined in the STATE  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'State',
@level2type = 'COLUMN', @level2name = 'StateId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The NAME is the name of a(n) STATE',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'State',
@level2type = 'COLUMN', @level2name = 'StateName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the COUNTRYID is a unique CountryId defined in the STATE  table',
@level0type = 'SCHEMA', @level0name = 'Location',
@level1type = 'TABLE', @level1name = 'State',
@level2type = 'COLUMN', @level2name = 'CountryId'
go

CREATE TABLE [Service].[Subscription]
( 
	[SubscriptionStartDate] [sdsubscriptionStartDate] ,
	[SubscriptionEndingDate] [sdSubscriptionEndDate] ,
	[SubscriptionType]   [sdSubscriptionType] 
	CONSTRAINT [DF_Service_Subscription_SubscriptionType_SubscriptionType]
		 DEFAULT  'S',
	[SubscriptionValid]  [dBool] 
	CONSTRAINT [DF_Service_Subscription_SubscriptionValid_NullHandler]
		 DEFAULT  0,
	[UserId]             [Unique].[sdKey] 
)
go

ALTER TABLE [Service].[Subscription]
	 WITH CHECK ADD CONSTRAINT [CK_Service_Subscription_SubscriptionType_SubscriptionType] CHECK  ( [SubscriptionType]='S' OR [SubscriptionType]='P' )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A SUBSCRIPTION is an agreement to provide CONTENT service to a USER.',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'Subscription'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The<default> of the subscription.',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'Subscription',
@level2type = 'COLUMN', @level2name = 'SubscriptionValid'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the USERID is a unique UserId defined in the SUBSCRIPTION  table',
@level0type = 'SCHEMA', @level0name = 'Service',
@level1type = 'TABLE', @level1name = 'Subscription',
@level2type = 'COLUMN', @level2name = 'UserId'
go

CREATE TABLE [ContentManagement].[TVShow]
( 
	[ContentId]          [Unique].[sdKey] ,
	[TVShowNumberOfSeason] [dNumber] 
	CONSTRAINT [DF_DF_ContentManagement_TVShow_NumberOfSeason]
		 DEFAULT  1,
	[TVShowNumberOfEpisode] [dNumber] 
	CONSTRAINT [DF_ContentManagement_TVShow_NumberOfEpisode]
		 DEFAULT  1
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A TVSHOW is provided by a streaming service and contains multiple episodes and seasons.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The number of season the TV show is being aired.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow',
@level2type = 'COLUMN', @level2name = 'TVShowNumberOfSeason'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The number of episodes in the TV show.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow',
@level2type = 'COLUMN', @level2name = 'TVShowNumberOfEpisode'
go

CREATE TABLE [ContentManagement].[TVShow_Actor]
( 
	[ContentId]          [Unique].[sdKey] ,
	[ActorId]            [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow_Actor',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ACTORID is a unique ActorId defined in the CONTENTMANAGEMENTTVSHOW CONTENTMANAGEMENTACTOR  table',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow_Actor',
@level2type = 'COLUMN', @level2name = 'ActorId'
go

CREATE TABLE [ContentManagement].[TVShow_Genre]
( 
	[ContentId]          [Unique].[sdKey] ,
	[GenreId]            [Unique].[sdKey] 
)
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The ContentId used to uniquely identify each content.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow_Genre',
@level2type = 'COLUMN', @level2name = 'ContentId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The Genre Id uniquely identifies the genre.',
@level0type = 'SCHEMA', @level0name = 'ContentManagement',
@level1type = 'TABLE', @level1name = 'TVShow_Genre',
@level2type = 'COLUMN', @level2name = 'GenreId'
go

CREATE TABLE [Account].[User]
( 
	[UserId]             [Unique].[sdKey]  IDENTITY ( 1,1 ) ,
	[UserFirstName]      [sdFirstName] ,
	[UserEmail]          [dEmail] ,
	[UserLastName]       [sdLastName] ,
	[UserBirthDate]      [sdDates] ,
	[UserPhoneNumber]    [dPhoneNumber] ,
	[UserPassword]       [sdPassword] ,
	[UserAge]            [sdAge]  NOT NULL ,
	[AddressId]          [Unique].[sdKey]  NOT NULL 
)
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_FirstName_ValidName] CHECK  ( PATINDEX('%[0-9]%', UserFirstName) < 0 )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_Email_ValidEmail] CHECK  ( [UserEmail] LIKE '%@gmail.com' OR [UserEmail] LIKE '%@outlook.com' OR
[UserEmail] LIKE '%@yahoo.com' )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_LastName_ValidName] CHECK  ( PATINDEX('%[0-9]%', UserLastName) < 0 )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_BirthDate_ValidBirthDate] CHECK  ( [UserBirthDate] BETWEEN '19000101' AND CONVERT(DATE,GETDATE()) )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_PhoneNumber_ValidPhoneNumber] CHECK  ( [UserPhoneNumber] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [UserPhoneNumber] LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'  )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_PhoneNumber_ValidPassword] CHECK  ( LEN([UserPassword]) < 20 AND 
PATINDEX('%[0-9]%', UserPassword) > 0 AND 
PATINDEX('%[A-Za-z]%', UserPassword) > 0 AND
PATINDEX('%[^a-zA-Z0-9]%', UserPassword) > 0 )
go

ALTER TABLE [Account].[User]
	 WITH CHECK ADD CONSTRAINT [CK_Account_User_Age_ValidAge] CHECK  ( [UserAge] >= 18 )
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'A USER is an individual who has registered for an account ',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the USERID is a unique UserId defined in the USER  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserId'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The FIRSTNAME is the name of a(n) USER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserFirstName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the EMAIL attributes is an Email for a ENTITYOWNER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserEmail'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The LASTNAME is the name of a(n) USER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserLastName'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The BIRTHDATE attribute is the BirthDate for the USER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserBirthDate'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The PHONENUMBER is the number of the USER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserPhoneNumber'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The PASSWORD attribute is the Password for a USER',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserPassword'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'The AGE is the Age of the User',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'UserAge'
go

EXEC sp_addextendedproperty
@name = 'MS_Description', @value = 'the ADDRESSID is a unique AddressId defined in the USER  table',
@level0type = 'SCHEMA', @level0name = 'Account',
@level1type = 'TABLE', @level1name = 'User',
@level2type = 'COLUMN', @level2name = 'AddressId'
go

ALTER TABLE [ContentManagement].[Actor]
	ADD CONSTRAINT [XPKActor] PRIMARY KEY  CLUSTERED ([ActorId] ASC)
go

ALTER TABLE [Location].[Address]
	ADD CONSTRAINT [XPKAddress] PRIMARY KEY  CLUSTERED ([AddressId] ASC)
go

ALTER TABLE [Transactions].[BitcoinPayment]
	ADD CONSTRAINT [XPKBitcoinPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [Location].[City]
	ADD CONSTRAINT [XPKCity] PRIMARY KEY  CLUSTERED ([CityId] ASC)
go

ALTER TABLE [ContentManagement].[Content]
	ADD CONSTRAINT [XPKContent] PRIMARY KEY  CLUSTERED ([ContentId] ASC)
go

ALTER TABLE [Location].[Country]
	ADD CONSTRAINT [XPKCountry] PRIMARY KEY  CLUSTERED ([CountryId] ASC)
go

ALTER TABLE [Transactions].[CreditCardPayment]
	ADD CONSTRAINT [XPKCreditCardPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [Account].[FavoriteList]
	ADD CONSTRAINT [XPKFavoriteList] PRIMARY KEY  CLUSTERED ([FavoriteListId] ASC)
go

ALTER TABLE [ContentManagement].[Genre]
	ADD CONSTRAINT [XPKGenre] PRIMARY KEY  CLUSTERED ([GenreId] ASC)
go

ALTER TABLE [ContentManagement].[Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([ContentId] ASC)
go

ALTER TABLE [ContentManagement].[Movie_Actor]
	ADD CONSTRAINT [XPKContentManagementMovie_ContentManagementActor] PRIMARY KEY  CLUSTERED ([ContentId] ASC,[ActorId] ASC)
go

ALTER TABLE [ContentManagement].[Movie_Genre]
	ADD CONSTRAINT [XPKContentManagementMovie_ContentManagementGenre] PRIMARY KEY  CLUSTERED ([ContentId] ASC,[GenreId] ASC)
go

ALTER TABLE [Transactions].[Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [Transactions].[PaypalPayment]
	ADD CONSTRAINT [XPKPaypalPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [Service].[PremiumSubscription]
	ADD CONSTRAINT [XPKPremiumSubscription] PRIMARY KEY  CLUSTERED ([UserId] ASC)
go

ALTER TABLE [Account].[Profile]
	ADD CONSTRAINT [XPKProfile] PRIMARY KEY  CLUSTERED ([ProfileId] ASC)
go

ALTER TABLE [Service].[StandardSubscription]
	ADD CONSTRAINT [XPKStandardSubscription] PRIMARY KEY  CLUSTERED ([UserId] ASC)
go

ALTER TABLE [Location].[State]
	ADD CONSTRAINT [XPKState] PRIMARY KEY  CLUSTERED ([StateId] ASC)
go

ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [XPKSubscription] PRIMARY KEY  CLUSTERED ([UserId] ASC)
go

ALTER TABLE [ContentManagement].[TVShow]
	ADD CONSTRAINT [XPKTVShow] PRIMARY KEY  CLUSTERED ([ContentId] ASC)
go

ALTER TABLE [ContentManagement].[TVShow_Actor]
	ADD CONSTRAINT [XPKContentManagementTVShow_ContentManagementActor] PRIMARY KEY  CLUSTERED ([ContentId] ASC,[ActorId] ASC)
go

ALTER TABLE [ContentManagement].[TVShow_Genre]
	ADD CONSTRAINT [XPKContentManagementTVShow_ContentManagementGenre] PRIMARY KEY  CLUSTERED ([ContentId] ASC,[GenreId] ASC)
go

ALTER TABLE [Account].[User]
	ADD CONSTRAINT [XPKUser] PRIMARY KEY  CLUSTERED ([UserId] ASC)
go


ALTER TABLE [Location].[Address]
	ADD CONSTRAINT [R_20] FOREIGN KEY ([CityId]) REFERENCES [Location].[City]([CityId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Location].[Address]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([StateId]) REFERENCES [Location].[State]([StateId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Location].[Address]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([CountryId]) REFERENCES [Location].[Country]([CountryId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transactions].[BitcoinPayment]
	ADD CONSTRAINT [FK_Transactions_Payment_PaymentTransactionNumber_Transactions_BitcoinPayment] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Transactions].[Payment]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Location].[City]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([StateId]) REFERENCES [Location].[State]([StateId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transactions].[CreditCardPayment]
	ADD CONSTRAINT [FK_Transactions_Payment_PaymentTransactionNumber_Transactions_CreditCardPayment] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Transactions].[Payment]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Account].[FavoriteList]
	ADD CONSTRAINT [FK_ContentManagement_Content_ContentId_Account_FavoriteList] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Content]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account].[FavoriteList]
	ADD CONSTRAINT [FK_Account_Profile_ProfileId_Account_FavoriteList] FOREIGN KEY ([ProfileId]) REFERENCES [Account].[Profile]([ProfileId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[CK_ContentManagementGenre]', '[ContentManagement].[Genre].[GenreName]'
go


ALTER TABLE [ContentManagement].[Movie]
	ADD CONSTRAINT [FK_ContentManagement_Content_ContentId_ContentManagement_Movie] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Content]([ContentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [ContentManagement].[Movie_Actor]
	ADD CONSTRAINT [FK_ContentManagement_Movie_ContentId_ContentManagement_Actor] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Movie]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ContentManagement].[Movie_Actor]
	ADD CONSTRAINT [FK_ContentManagement_Actor_ContentId_ContentManagement_Movie_Actor] FOREIGN KEY ([ActorId]) REFERENCES [ContentManagement].[Actor]([ActorId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ContentManagement].[Movie_Genre]
	ADD CONSTRAINT [FK_ContentManagement_Movie_ContentId_ContentManagement_Movie_Genre] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Movie]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ContentManagement].[Movie_Genre]
	ADD CONSTRAINT [FK_ContentManagement_Genre_ContentId_ContentManagement_Movie_Genre] FOREIGN KEY ([GenreId]) REFERENCES [ContentManagement].[Genre]([GenreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transactions].[Payment]
	ADD CONSTRAINT [FK_Account_User_UserId_Transactions_Payment] FOREIGN KEY ([UserId]) REFERENCES [Account].[User]([UserId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transactions].[PaypalPayment]
	ADD CONSTRAINT [FK_Transactions_Payment_PaymentTransactionNumber_Transactions_PaypalPayment] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [Transactions].[Payment]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Service].[PremiumSubscription]
	ADD CONSTRAINT [FK_Account_User_UserId_Service_PremiumSubscription] FOREIGN KEY ([UserId]) REFERENCES [Service].[Subscription]([UserId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Account].[Profile]
	ADD CONSTRAINT [FK_ContentManagement_Content_ContentId_Account_Profile] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Content]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account].[Profile]
	ADD CONSTRAINT [FK_Account_User_UserId_Account_Profile] FOREIGN KEY ([UserId]) REFERENCES [Account].[User]([UserId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Service].[StandardSubscription]
	ADD CONSTRAINT [FK_Account_User_UserId_Service_StandardSubscription] FOREIGN KEY ([UserId]) REFERENCES [Service].[Subscription]([UserId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Location].[State]
	ADD CONSTRAINT [R_19] FOREIGN KEY ([CountryId]) REFERENCES [Location].[Country]([CountryId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Service].[Subscription]
	ADD CONSTRAINT [FK_Account_User_UserId_Service_Subscription] FOREIGN KEY ([UserId]) REFERENCES [Account].[User]([UserId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ContentManagement].[TVShow]
	ADD CONSTRAINT [FK_ContentManagement_Content_ContentId_ContentManagement_TVShow] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[Content]([ContentId])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [ContentManagement].[TVShow_Actor]
	ADD CONSTRAINT [FK_ContentManagement_TVShow_ContentId_ContentManagement_TVShow_Actor] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[TVShow]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ContentManagement].[TVShow_Actor]
	ADD CONSTRAINT [FK_ContentManagement_Actor_ContentId_ContentManagement_TVShow_Actor] FOREIGN KEY ([ActorId]) REFERENCES [ContentManagement].[Actor]([ActorId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ContentManagement].[TVShow_Genre]
	ADD CONSTRAINT [FK_ContentManagement_TVShow_ContentId_ContentManagement_TVShow_Genre] FOREIGN KEY ([ContentId]) REFERENCES [ContentManagement].[TVShow]([ContentId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ContentManagement].[TVShow_Genre]
	ADD CONSTRAINT [FK_ContentManagement_Genre_ContentId_ContentManagement_TVShow_Genre] FOREIGN KEY ([GenreId]) REFERENCES [ContentManagement].[Genre]([GenreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Account].[User]
	ADD CONSTRAINT [R_16] FOREIGN KEY ([AddressId]) REFERENCES [Location].[Address]([AddressId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go
