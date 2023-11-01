
CREATE TYPE [StandardString]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [StandardNumber]
	FROM INTEGER NULL
go

CREATE TYPE [FirstName]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [LastName]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [City]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [State]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [ZipCode]
	FROM INTEGER NULL
go

CREATE TYPE [Phone]
	FROM INTEGER NULL
go

CREATE TYPE [Address2]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [Money]
	FROM MONEY NULL
go

CREATE RULE [MovieGenre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [ACTOR]
( 
	[ActorId]            integer  NOT NULL ,
	[ActorFirstName]     [FirstName] ,
	[ActorLastName]      [LastName] ,
	[ActorBirthDate]     datetime  NULL ,
	[ActorAwards]        varchar(20)  NULL ,
	[ActorSocSecNumber]  integer  NULL 
)
go

CREATE TABLE [CREDITCARD]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[CreditCardNumber]   integer  NULL ,
	[CreditCardExpiration] datetime  NULL ,
	[SecurityCode]       integer  NULL ,
	[CreditCardType]     varchar(20)  NULL 
)
go

CREATE TABLE [CUST]
( 
	[CustomerAddress]    [Address] ,
	[CustomerCity]       [City] ,
	[CustomerFirstName]  [FirstName] ,
	[CustomerLastName]   [LastName] ,
	[CustomerState]      [State] ,
	[CustomerZipCode]    [ZipCode] ,
	[Email]              varchar  NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [CUST_CREDIT]
( 
	[CreditCard]         integer  NULL ,
	[CreditCardExp]      integer  NULL ,
	[StatusCode]         varchar(20)  NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [EMP]
( 
	[EmployeeFirstName]  [FirstName] ,
	[EmployeeAddress]    [Address] ,
	[EmployeePhone]      [Phone] ,
	[StoreNumber]        integer  NULL ,
	[EmployeeAddress2]   [Address2] ,
	[Email]              varchar(20)  NULL ,
	[Salary]             [Money] ,
	[HireDate]           datetime  NULL ,
	[SocSecNumber]       integer  NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [EPAYVENDOR]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[EPayVendorNumber]   integer  NULL ,
	[EPayAccountNumber]  integer  NULL 
)
go

CREATE TABLE [GENRE]
( 
	[GenreID]            integer  NOT NULL 
	CONSTRAINT [DF_Genre_1465463119]
		 DEFAULT  Unknown,
	[GenreName]          varchar(20)  NULL ,
	[Description]        varchar(20)  NULL 
)
go

CREATE TABLE [GIFTCARD]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[GiftCardCode]       integer  NULL ,
	[GiftCardExpiration] datetime  NULL ,
	[Issuer]             varchar(20)  NULL 
)
go

CREATE TABLE [MO_RENT_REC]
( 
	[RentalDate]         datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[RentalStatus]       varchar(20)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[OverdueCharge]      [Money] ,
	[RentalRate]         [Money] ,
	[EmployeePhone]      [Phone]  NOT NULL ,
	[SocSecNumber]       integer  NOT NULL ,
	[RentalRecordDate]   datetime  NOT NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustomerNumber]     integer  NOT NULL 
)
go

CREATE TABLE [MOVIE]
( 
	[MovieTitle]         [Title] ,
	[MovieDirector]      [Director] ,
	[Description]        varchar(20)  NULL ,
	[Rating]             varchar  NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL 
)
go

CREATE TABLE [MOVIE_ACTOR]
( 
	[MovieNumber]        integer  NOT NULL ,
	[ActorId]            integer  NOT NULL ,
	[RoleId]             integer  NOT NULL ,
	[CharacterFirstName] [FirstName] ,
	[CharacterLastName]  [LastName] 
)
go

CREATE TABLE [MOVIE_COPY]
( 
	[GeneralCondition]   varchar(20)  NULL ,
	[MovieFormat]        varchar(20)  NULL ,
	[MovieCopyNumber]    integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_GENRE]
( 
	[MovieNumber]        integer  NOT NULL ,
	[GenreID]            integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_STORE]
( 
	[MovieNumber]        integer  NOT NULL ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_SUPPLIER]
( 
	[MovieNumber]        integer  NOT NULL ,
	[SupplierID]         integer  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      [Money] ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmployeeNumber]     varchar(20)  NOT NULL ,
	[CustomerNumber]     integer  NULL ,
	[CustomerNo]         integer  NULL ,
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL 
)
go

CREATE TABLE [PAYPAL]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PayPalID]           integer  NULL ,
	[PayPalUsername]     varchar(20)  NULL 
)
go

CREATE TABLE [STORE]
( 
	[StoreManager]       [Manager] ,
	[StoreAddress]       [Address] ,
	[StoreAddress2]      [Address2] ,
	[StorePhone]         [Phone] ,
	[StoreCity]          [City] ,
	[StoreState]         [State] ,
	[StoreZipCode]       [ZipCode] ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [SUBSCRIPTION]
( 
	[CustomerNumber]     integer  NOT NULL ,
	[SubscriptionId]     integer  NOT NULL ,
	[StartDate]          datetime  NULL ,
	[EndDate]            datetime  NULL ,
	[OverdueAmount]      [Money] 
)
go

CREATE TABLE [SUBTITLE]
( 
	[MovieNumber]        integer  NOT NULL 
	CONSTRAINT [DF_Subtitle_Language_1619647445]
		 DEFAULT  None
	CONSTRAINT [SubtitleLanguage_279023214]
		CHECK  ( [MovieNumber]='ENG' OR [MovieNumber]='SPN' OR [MovieNumber]='CHN' OR [MovieNumber]='RUS' OR [MovieNumber]='JPN' OR [MovieNumber]='FRN' OR [MovieNumber]='GER' OR [MovieNumber]='DUT' ),
	[SubtitleId]         integer  NULL ,
	[Language]           varchar(20)  NULL ,
	[Format]             varchar(20)  NULL ,
	[Content]            varchar(20)  NULL 
)
go

CREATE TABLE [SUPPLIER]
( 
	[SupplierID]         integer  NOT NULL ,
	[SupplierName]       varchar(20)  NULL ,
	[SupplierAddress]    [Address] ,
	[SupplierEmail]      varchar(20)  NULL ,
	[SupplierPhone]      [Phone] 
)
go

ALTER TABLE [ACTOR]
	ADD CONSTRAINT [XPKACTOR] PRIMARY KEY  CLUSTERED ([ActorId] ASC)
go

ALTER TABLE [ACTOR]
	ADD CONSTRAINT [XAK1ACTOR] UNIQUE ([ActorLastName]  ASC)
go

ALTER TABLE [ACTOR]
	ADD CONSTRAINT [XAK2ACTOR] UNIQUE ([ActorSocSecNumber]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1ACTOR] ON [ACTOR]
( 
	[ActorFirstName]      ASC
)
go

ALTER TABLE [CREDITCARD]
	ADD CONSTRAINT [XPKCREDITCARD] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCUSTOMER] PRIMARY KEY  CLUSTERED ([CustomerNumber] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XAK1CUSTOMER] UNIQUE ([CustomerAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1CUSTOMER] ON [CUST]
( 
	[CustomerLastName]    ASC
)
go

ALTER TABLE [CUST_CREDIT]
	ADD CONSTRAINT [XPKCUSTOMER_CREDIT] PRIMARY KEY  CLUSTERED ([CustomerNumber] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XPKEMPLOYEE] PRIMARY KEY  CLUSTERED ([EmployeeNumber] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XAK1EMPLOYEE] UNIQUE ([SocSecNumber]  ASC,[EmployeePhone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1EMPLOYEE] ON [EMP]
( 
	[EmployeeFirstName]   ASC
)
go

ALTER TABLE [EPAYVENDOR]
	ADD CONSTRAINT [XPKEPAYVENDOR] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [GENRE]
	ADD CONSTRAINT [XPKGENRE] PRIMARY KEY  CLUSTERED ([GenreID] ASC)
go

ALTER TABLE [GENRE]
	ADD CONSTRAINT [XAK1GENRE] UNIQUE ([GenreName]  ASC)
go

ALTER TABLE [GIFTCARD]
	ADD CONSTRAINT [XPKGIFTCARD] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [XPKMOVIE_RENTAL_RECORD] PRIMARY KEY  CLUSTERED ([RentalRecordDate] ASC,[MovieCopyNumber] ASC,[MovieNumber] ASC,[SocSecNumber] ASC,[EmployeePhone] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XPKMOVIE] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XAK1MOVIE] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [MOVIE_ACTOR]
	ADD CONSTRAINT [XPKMOVIE_ACTOR] PRIMARY KEY  CLUSTERED ([RoleId] ASC,[MovieNumber] ASC,[ActorId] ASC)
go

ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [XPKMOVIE_COPY] PRIMARY KEY  CLUSTERED ([MovieCopyNumber] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MOVIE_GENRE]
	ADD CONSTRAINT [XPKMOVIE_GENRE] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[GenreID] ASC)
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [XPKMOVIE_STORE] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[StoreNumber] ASC)
go

ALTER TABLE [MOVIE_SUPPLIER]
	ADD CONSTRAINT [XPKMOVIE_SUPPLIER] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC,[SupplierID] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPAYMENT] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [PAYPAL]
	ADD CONSTRAINT [XPKPAYPAL] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [STORE]
	ADD CONSTRAINT [XPKSTORE] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1STORE] ON [STORE]
( 
	[StoreManager]        ASC
)
go

ALTER TABLE [SUBSCRIPTION]
	ADD CONSTRAINT [XPKSUBSCRIPTION] PRIMARY KEY  CLUSTERED ([SubscriptionId] ASC,[CustomerNumber] ASC)
go

ALTER TABLE [SUBTITLE]
	ADD CONSTRAINT [XPKSUBTITLE] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [SUBTITLE]
	ADD CONSTRAINT [XAK1SUBTITLE] UNIQUE ([SubtitleId]  ASC)
go

ALTER TABLE [SUPPLIER]
	ADD CONSTRAINT [XPKSUPPLIER] PRIMARY KEY  CLUSTERED ([SupplierID] ASC)
go

CREATE VIEW [CUSTOMER_INVOICE]([CreditCard],[CreditCardExp],[StatusCode],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[MovieTitle],[Overdue_Charge_Rate])
AS
SELECT ALL [CUST_CREDIT].[CreditCard],[CUST_CREDIT].[CreditCardExp],[CUST_CREDIT].[StatusCode],[CUST].[CustomerNumber],[CUST].[CustomerAddress],[CUST].[Email],[CUST].[CustomerCity],[CUST].[CustomerFirstName],[CUST].[CustomerLastName],[CUST].[CustomerState],[CUST].[CustomerZipCode],[MO_RENT_REC].[RentalRecordDate],[MO_RENT_REC].[MovieCopyNumber],[MO_RENT_REC].[MovieNumber],[MO_RENT_REC].[RentalDate],[MO_RENT_REC].[DueDate],[MO_RENT_REC].[RentalStatus],[MO_RENT_REC].[OverdueCharge],[MO_RENT_REC].[RentalRate],[MOVIE].[MovieTitle],rental_rate * 1.5
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC],[MOVIE]
go

CREATE VIEW [OVERDUE_NOTICE]([CreditCard],[CreditCardExp],[StatusCode],[Overdue_Charge_Rate],[CustomerNumber],[CustomerAddress],[Email],[CustomerCity],[CustomerFirstName],[CustomerLastName],[CustomerState],[CustomerZipCode],[RentalRecordDate],[MovieCopyNumber],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate])
AS
SELECT ALL [CUST_CREDIT].[CreditCard],[CUST_CREDIT].[CreditCardExp],[CUST_CREDIT].[StatusCode],rental_rate * 1.5,[CUST].[CustomerNumber],[CUST].[CustomerAddress],[CUST].[Email],[CUST].[CustomerCity],[CUST].[CustomerFirstName],[CUST].[CustomerLastName],[CUST].[CustomerState],[CUST].[CustomerZipCode],[MO_RENT_REC].[RentalRecordDate],[MO_RENT_REC].[MovieCopyNumber],[MO_RENT_REC].[MovieNumber],[MO_RENT_REC].[RentalDate],[MO_RENT_REC].[DueDate],[MO_RENT_REC].[RentalStatus],[MO_RENT_REC].[OverdueCharge],[MO_RENT_REC].[RentalRate]
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC]
go


ALTER TABLE [CREDITCARD]
	ADD CONSTRAINT [FK_PAYMENT_CREDITCARD] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [EMP]
	ADD CONSTRAINT [FK_Emp_STORE] FOREIGN KEY ([StoreNumber]) REFERENCES [STORE]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [FK_Emp_EMP] FOREIGN KEY ([Supervisor]) REFERENCES [EMP]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EPAYVENDOR]
	ADD CONSTRAINT [FK_PAYMENT_EPAYVENDOR] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


exec sp_bindrule '[MovieGenre]', '[GENRE].[GenreID]'
go


ALTER TABLE [GIFTCARD]
	ADD CONSTRAINT [FK_PAYMENT_GIFTCARD] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_EMP] FOREIGN KEY ([SocSecNumber],[EmployeePhone]) REFERENCES [EMP]([SocSecNumber],[EmployeePhone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_MOVIE_COPY] FOREIGN KEY ([MovieCopyNumber],[MovieNumber]) REFERENCES [MOVIE_COPY]([MovieCopyNumber],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_CUST] FOREIGN KEY ([CustomerNumber]) REFERENCES [CUST]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_CUST_CREDIT] FOREIGN KEY ([CustomerNumber]) REFERENCES [CUST_CREDIT]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_PAYMENT] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_ACTOR]
	ADD CONSTRAINT [FK_MOVIE_MOVIE_ACTOR] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_ACTOR]
	ADD CONSTRAINT [FK_ACTOR_MOVIE_ACTOR] FOREIGN KEY ([ActorId]) REFERENCES [ACTOR]([ActorId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [FK_MovieCopy_MOVIE] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_GENRE]
	ADD CONSTRAINT [FK_MOVIE_MOVIE_GENRE] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_GENRE]
	ADD CONSTRAINT [FK_GENRE_MOVIE_GENRE] FOREIGN KEY ([GenreID]) REFERENCES [GENRE]([GenreID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [FK_Movie_Store_MOVIE] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [FK_Movie_Store_STORE] FOREIGN KEY ([StoreNumber]) REFERENCES [STORE]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_SUPPLIER]
	ADD CONSTRAINT [FK_MOVIE_MOVIE_SUPPLIER] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_SUPPLIER]
	ADD CONSTRAINT [FK_SUPPLIER_MOVIE_SUPPLIER] FOREIGN KEY ([SupplierID]) REFERENCES [SUPPLIER]([SupplierID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_PAYMENT_EMP] FOREIGN KEY ([EmployeeNumber]) REFERENCES [EMP]([EmployeeNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_PAYMENT_CUST] FOREIGN KEY ([CustomerNo]) REFERENCES [CUST]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_PAYMENT_CUST_CREDIT] FOREIGN KEY ([CustomerNumber]) REFERENCES [CUST_CREDIT]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYPAL]
	ADD CONSTRAINT [FK_PAYMENT_PAYPAL] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [SUBSCRIPTION]
	ADD CONSTRAINT [FK_CUSTOMER_SUBSCRIPTION] FOREIGN KEY ([CustomerNumber]) REFERENCES [CUST]([CustomerNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SUBTITLE]
	ADD CONSTRAINT [FK_MOVIE_SUBTITLE] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_ACTOR ON ACTOR FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ACTOR */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ACTOR  MOVIE_ACTOR on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001123e", PARENT_OWNER="", PARENT_TABLE="ACTOR"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ACTOR_MOVIE_ACTOR", FK_COLUMNS="ActorId" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_ACTOR
      WHERE
        /*  %JoinFKPK(MOVIE_ACTOR,deleted," = "," AND") */
        MOVIE_ACTOR.ActorId = deleted.ActorId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete ACTOR because MOVIE_ACTOR exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_ACTOR ON ACTOR FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ACTOR */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insActorId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ACTOR  MOVIE_ACTOR on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012b47", PARENT_OWNER="", PARENT_TABLE="ACTOR"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ACTOR_MOVIE_ACTOR", FK_COLUMNS="ActorId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ActorId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_ACTOR
      WHERE
        /*  %JoinFKPK(MOVIE_ACTOR,deleted," = "," AND") */
        MOVIE_ACTOR.ActorId = deleted.ActorId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update ACTOR because MOVIE_ACTOR exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CREDITCARD ON CREDITCARD FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CREDITCARD */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  CREDITCARD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000177b3", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_CREDITCARD", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM CREDITCARD
          WHERE
            /* %JoinFKPK(CREDITCARD,PAYMENT," = "," AND") */
            CREDITCARD.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CREDITCARD because PAYMENT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CREDITCARD ON CREDITCARD FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CREDITCARD */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  CREDITCARD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018827", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_CREDITCARD", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CREDITCARD because PAYMENT does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUST ON CUST FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST subscribed to SUBSCRIPTION on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00032a52", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="SUBSCRIPTION"
    P2C_VERB_PHRASE="subscribed to", C2P_VERB_PHRASE="subcribed by", 
    FK_CONSTRAINT="FK_CUSTOMER_SUBSCRIPTION", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(SUBSCRIPTION,deleted," = "," AND") */
        SUBSCRIPTION.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because SUBSCRIPTION exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST", FK_COLUMNS="CustomerNo" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustomerNo = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST ON CUST FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST subscribed to SUBSCRIPTION on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00038eaa", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="SUBSCRIPTION"
    P2C_VERB_PHRASE="subscribed to", C2P_VERB_PHRASE="subcribed by", 
    FK_CONSTRAINT="FK_CUSTOMER_SUBSCRIPTION", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(SUBSCRIPTION,deleted," = "," AND") */
        SUBSCRIPTION.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because SUBSCRIPTION exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST", FK_COLUMNS="CustomerNo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustomerNo = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUST_CREDIT ON CUST_CREDIT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000237da", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST_CREDIT ON CUST_CREDIT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00026f98", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CustomerNumber = deleted.CustomerNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EMP ON EMP FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EMP */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005551b", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_PAYMENT_EMP", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EmployeePhone = deleted.EmployeePhone AND
        MO_RENT_REC.SocSecNumber = deleted.SocSecNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.Supervisor = EMP.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,EMP," = "," AND") */
            EMP.Supervisor = EMP.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.StoreNumber = STORE.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,STORE," = "," AND") */
            EMP.StoreNumber = STORE.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because STORE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EMP ON EMP FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EMP */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeeNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00063eed", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_PAYMENT_EMP", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EmployeeNumber = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.Supervisor = deleted.EmployeeNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because EMP exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="SocSecNumber""EmployeePhone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EmployeePhone = deleted.EmployeePhone AND
        MO_RENT_REC.SocSecNumber = deleted.SocSecNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.Supervisor = EMP.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because EMP does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.StoreNumber = STORE.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StoreNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because STORE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EPAYVENDOR ON EPAYVENDOR FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EPAYVENDOR */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  EPAYVENDOR on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001756c", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAYVENDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_EPAYVENDOR", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM EPAYVENDOR
          WHERE
            /* %JoinFKPK(EPAYVENDOR,PAYMENT," = "," AND") */
            EPAYVENDOR.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EPAYVENDOR because PAYMENT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EPAYVENDOR ON EPAYVENDOR FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EPAYVENDOR */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  EPAYVENDOR on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018c1b", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAYVENDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_EPAYVENDOR", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EPAYVENDOR because PAYMENT does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_GENRE ON GENRE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GENRE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* GENRE  MOVIE_GENRE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011229", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_GENRE_MOVIE_GENRE", FK_COLUMNS="GenreID" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_GENRE
      WHERE
        /*  %JoinFKPK(MOVIE_GENRE,deleted," = "," AND") */
        MOVIE_GENRE.GenreID = deleted.GenreID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete GENRE because MOVIE_GENRE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_GENRE ON GENRE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on GENRE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insGenreID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* GENRE  MOVIE_GENRE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012fb2", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_GENRE_MOVIE_GENRE", FK_COLUMNS="GenreID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(GenreID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_GENRE
      WHERE
        /*  %JoinFKPK(MOVIE_GENRE,deleted," = "," AND") */
        MOVIE_GENRE.GenreID = deleted.GenreID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update GENRE because MOVIE_GENRE exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_GIFTCARD ON GIFTCARD FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GIFTCARD */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  GIFTCARD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00017f1a", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="GIFTCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_GIFTCARD", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM GIFTCARD
          WHERE
            /* %JoinFKPK(GIFTCARD,PAYMENT," = "," AND") */
            GIFTCARD.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GIFTCARD because PAYMENT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_GIFTCARD ON GIFTCARD FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on GIFTCARD */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  GIFTCARD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018a29", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="GIFTCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_GIFTCARD", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GIFTCARD because PAYMENT does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MO_RENT_REC ON MO_RENT_REC FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00073951", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,PAYMENT," = "," AND") */
            MO_RENT_REC.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CustomerNumber = CUST_CREDIT.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST_CREDIT," = "," AND") */
            MO_RENT_REC.CustomerNumber = CUST_CREDIT.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustomerNumber = CUST.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST," = "," AND") */
            MO_RENT_REC.CustomerNumber = CUST.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /* %JoinFKPK(deleted,MOVIE_COPY," = "," AND") */
        deleted.MovieCopyNumber = MOVIE_COPY.MovieCopyNumber AND
        deleted.MovieNumber = MOVIE_COPY.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,MOVIE_COPY," = "," AND") */
            MO_RENT_REC.MovieCopyNumber = MOVIE_COPY.MovieCopyNumber AND
            MO_RENT_REC.MovieNumber = MOVIE_COPY.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because MOVIE_COPY exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="SocSecNumber""EmployeePhone" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EmployeePhone = EMP.EmployeePhone AND
        deleted.SocSecNumber = EMP.SocSecNumber AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,EMP," = "," AND") */
            MO_RENT_REC.EmployeePhone = EMP.EmployeePhone AND
            MO_RENT_REC.SocSecNumber = EMP.SocSecNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MO_RENT_REC ON MO_RENT_REC FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmployeePhone Phone, 
           @insSocSecNumber integer, 
           @insRentalRecordDate datetime, 
           @insMovieCopyNumber integer, 
           @insMovieNumber integer, 
           @insCustomerNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000783fb", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PaymentTransactionNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because PAYMENT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CustomerNumber = CUST_CREDIT.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustomerNumber = CUST.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE_COPY
        WHERE
          /* %JoinFKPK(inserted,MOVIE_COPY) */
          inserted.MovieCopyNumber = MOVIE_COPY.MovieCopyNumber and
          inserted.MovieNumber = MOVIE_COPY.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because MOVIE_COPY does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="SocSecNumber""EmployeePhone" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeePhone) OR
    UPDATE(SocSecNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EmployeePhone = EMP.EmployeePhone and
          inserted.SocSecNumber = EMP.SocSecNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE ON MOVIE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_SUPPLIER on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00061116", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_SUPPLIER", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_SUPPLIER
      WHERE
        /*  %JoinFKPK(MOVIE_SUPPLIER,deleted," = "," AND") */
        MOVIE_SUPPLIER.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_SUPPLIER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_GENRE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_GENRE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_GENRE
      WHERE
        /*  %JoinFKPK(MOVIE_GENRE,deleted," = "," AND") */
        MOVIE_GENRE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_GENRE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_ACTOR on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_ACTOR", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_ACTOR
      WHERE
        /*  %JoinFKPK(MOVIE_ACTOR,deleted," = "," AND") */
        MOVIE_ACTOR.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_ACTOR exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE provides SUBTITLE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="SUBTITLE"
    P2C_VERB_PHRASE="provides", C2P_VERB_PHRASE="is provided in", 
    FK_CONSTRAINT="FK_MOVIE_SUBTITLE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,SUBTITLE
      WHERE
        /*  %JoinFKPK(SUBTITLE,deleted," = "," AND") */
        SUBTITLE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because SUBTITLE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_COPY exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE ON MOVIE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_SUPPLIER on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006bd3b", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_SUPPLIER", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_SUPPLIER
      WHERE
        /*  %JoinFKPK(MOVIE_SUPPLIER,deleted," = "," AND") */
        MOVIE_SUPPLIER.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_SUPPLIER exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_GENRE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_GENRE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_GENRE
      WHERE
        /*  %JoinFKPK(MOVIE_GENRE,deleted," = "," AND") */
        MOVIE_GENRE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_GENRE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_ACTOR on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_ACTOR", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_ACTOR
      WHERE
        /*  %JoinFKPK(MOVIE_ACTOR,deleted," = "," AND") */
        MOVIE_ACTOR.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_ACTOR exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE provides SUBTITLE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="SUBTITLE"
    P2C_VERB_PHRASE="provides", C2P_VERB_PHRASE="is provided in", 
    FK_CONSTRAINT="FK_MOVIE_SUBTITLE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,SUBTITLE
      WHERE
        /*  %JoinFKPK(SUBTITLE,deleted," = "," AND") */
        SUBTITLE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because SUBTITLE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_COPY exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_ACTOR ON MOVIE_ACTOR FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_ACTOR */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* ACTOR  MOVIE_ACTOR on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026bbc", PARENT_OWNER="", PARENT_TABLE="ACTOR"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ACTOR_MOVIE_ACTOR", FK_COLUMNS="ActorId" */
    IF EXISTS (SELECT * FROM deleted,ACTOR
      WHERE
        /* %JoinFKPK(deleted,ACTOR," = "," AND") */
        deleted.ActorId = ACTOR.ActorId AND
        NOT EXISTS (
          SELECT * FROM MOVIE_ACTOR
          WHERE
            /* %JoinFKPK(MOVIE_ACTOR,ACTOR," = "," AND") */
            MOVIE_ACTOR.ActorId = ACTOR.ActorId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_ACTOR because ACTOR exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_ACTOR on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_ACTOR", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_ACTOR
          WHERE
            /* %JoinFKPK(MOVIE_ACTOR,MOVIE," = "," AND") */
            MOVIE_ACTOR.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_ACTOR because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_ACTOR ON MOVIE_ACTOR FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_ACTOR */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insActorId integer, 
           @insRoleId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* ACTOR  MOVIE_ACTOR on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b231", PARENT_OWNER="", PARENT_TABLE="ACTOR"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_ACTOR_MOVIE_ACTOR", FK_COLUMNS="ActorId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ActorId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,ACTOR
        WHERE
          /* %JoinFKPK(inserted,ACTOR) */
          inserted.ActorId = ACTOR.ActorId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_ACTOR because ACTOR does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_ACTOR on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_ACTOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_ACTOR", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_ACTOR because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_COPY ON MOVIE_COPY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029054", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.MovieCopyNumber = deleted.MovieCopyNumber AND
        MO_RENT_REC.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_COPY
          WHERE
            /* %JoinFKPK(MOVIE_COPY,MOVIE," = "," AND") */
            MOVIE_COPY.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_COPY because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_COPY ON MOVIE_COPY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieCopyNumber integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e653", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MovieCopyNumber""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieCopyNumber) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.MovieCopyNumber = deleted.MovieCopyNumber AND
        MO_RENT_REC.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_COPY because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_GENRE ON MOVIE_GENRE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_GENRE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* GENRE  MOVIE_GENRE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000285c3", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_GENRE_MOVIE_GENRE", FK_COLUMNS="GenreID" */
    IF EXISTS (SELECT * FROM deleted,GENRE
      WHERE
        /* %JoinFKPK(deleted,GENRE," = "," AND") */
        deleted.GenreID = GENRE.GenreID AND
        NOT EXISTS (
          SELECT * FROM MOVIE_GENRE
          WHERE
            /* %JoinFKPK(MOVIE_GENRE,GENRE," = "," AND") */
            MOVIE_GENRE.GenreID = GENRE.GenreID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_GENRE because GENRE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_GENRE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_GENRE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_GENRE
          WHERE
            /* %JoinFKPK(MOVIE_GENRE,MOVIE," = "," AND") */
            MOVIE_GENRE.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_GENRE because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_GENRE ON MOVIE_GENRE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_GENRE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insGenreID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* GENRE  MOVIE_GENRE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b80d", PARENT_OWNER="", PARENT_TABLE="GENRE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_GENRE_MOVIE_GENRE", FK_COLUMNS="GenreID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(GenreID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,GENRE
        WHERE
          /* %JoinFKPK(inserted,GENRE) */
          inserted.GenreID = GENRE.GenreID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_GENRE because GENRE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_GENRE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_GENRE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_GENRE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_GENRE because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_STORE ON MOVIE_STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000289c2", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.StoreNumber = STORE.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,STORE," = "," AND") */
            MOVIE_STORE.StoreNumber = STORE.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,MOVIE," = "," AND") */
            MOVIE_STORE.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_STORE ON MOVIE_STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002bf4e", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="StoreNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.StoreNumber = STORE.StoreNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because STORE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_SUPPLIER ON MOVIE_SUPPLIER FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_SUPPLIER */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* SUPPLIER  MOVIE_SUPPLIER on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029a58", PARENT_OWNER="", PARENT_TABLE="SUPPLIER"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SUPPLIER_MOVIE_SUPPLIER", FK_COLUMNS="SupplierID" */
    IF EXISTS (SELECT * FROM deleted,SUPPLIER
      WHERE
        /* %JoinFKPK(deleted,SUPPLIER," = "," AND") */
        deleted.SupplierID = SUPPLIER.SupplierID AND
        NOT EXISTS (
          SELECT * FROM MOVIE_SUPPLIER
          WHERE
            /* %JoinFKPK(MOVIE_SUPPLIER,SUPPLIER," = "," AND") */
            MOVIE_SUPPLIER.SupplierID = SUPPLIER.SupplierID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_SUPPLIER because SUPPLIER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_SUPPLIER on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_SUPPLIER", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIE_SUPPLIER
          WHERE
            /* %JoinFKPK(MOVIE_SUPPLIER,MOVIE," = "," AND") */
            MOVIE_SUPPLIER.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_SUPPLIER because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_SUPPLIER ON MOVIE_SUPPLIER FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_SUPPLIER */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer, 
           @insSupplierID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SUPPLIER  MOVIE_SUPPLIER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c8be", PARENT_OWNER="", PARENT_TABLE="SUPPLIER"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SUPPLIER_MOVIE_SUPPLIER", FK_COLUMNS="SupplierID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SupplierID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,SUPPLIER
        WHERE
          /* %JoinFKPK(inserted,SUPPLIER) */
          inserted.SupplierID = SUPPLIER.SupplierID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_SUPPLIER because SUPPLIER does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_SUPPLIER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MOVIE_MOVIE_SUPPLIER", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_SUPPLIER because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_PAYMENT ON PAYMENT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PAYMENT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  EPAYVENDOR on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00084ff4", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAYVENDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_EPAYVENDOR", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE EPAYVENDOR
      FROM EPAYVENDOR,deleted
      WHERE
        /*  %JoinFKPK(EPAYVENDOR,deleted," = "," AND") */
        EPAYVENDOR.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT  GIFTCARD on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="GIFTCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_GIFTCARD", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE GIFTCARD
      FROM GIFTCARD,deleted
      WHERE
        /*  %JoinFKPK(GIFTCARD,deleted," = "," AND") */
        GIFTCARD.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT  PAYPAL on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PAYPAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_PAYPAL", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE PAYPAL
      FROM PAYPAL,deleted
      WHERE
        /*  %JoinFKPK(PAYPAL,deleted," = "," AND") */
        PAYPAL.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT  CREDITCARD on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_CREDITCARD", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE CREDITCARD
      FROM CREDITCARD,deleted
      WHERE
        /*  %JoinFKPK(CREDITCARD,deleted," = "," AND") */
        CREDITCARD.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CustomerNumber = CUST_CREDIT.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST_CREDIT," = "," AND") */
            PAYMENT.CustomerNumber = CUST_CREDIT.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST", FK_COLUMNS="CustomerNo" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustomerNo = CUST.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST," = "," AND") */
            PAYMENT.CustomerNo = CUST.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_PAYMENT_EMP", FK_COLUMNS="EmployeeNumber" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EmployeeNumber = EMP.EmployeeNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,EMP," = "," AND") */
            PAYMENT.EmployeeNumber = EMP.EmployeeNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_PAYMENT ON PAYMENT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PAYMENT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  EPAYVENDOR on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000c326b", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAYVENDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_EPAYVENDOR", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE EPAYVENDOR
      SET
        /*  %JoinFKPK(EPAYVENDOR,@ins," = ",",") */
        EPAYVENDOR.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM EPAYVENDOR,inserted,deleted
      WHERE
        /*  %JoinFKPK(EPAYVENDOR,deleted," = "," AND") */
        EPAYVENDOR.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  GIFTCARD on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="GIFTCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_GIFTCARD", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE GIFTCARD
      SET
        /*  %JoinFKPK(GIFTCARD,@ins," = ",",") */
        GIFTCARD.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM GIFTCARD,inserted,deleted
      WHERE
        /*  %JoinFKPK(GIFTCARD,deleted," = "," AND") */
        GIFTCARD.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  PAYPAL on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PAYPAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_PAYPAL", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE PAYPAL
      SET
        /*  %JoinFKPK(PAYPAL,@ins," = ",",") */
        PAYPAL.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM PAYPAL,inserted,deleted
      WHERE
        /*  %JoinFKPK(PAYPAL,deleted," = "," AND") */
        PAYPAL.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  CREDITCARD on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_CREDITCARD", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE CREDITCARD
      SET
        /*  %JoinFKPK(CREDITCARD,@ins," = ",",") */
        CREDITCARD.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM CREDITCARD,inserted,deleted
      WHERE
        /*  %JoinFKPK(CREDITCARD,deleted," = "," AND") */
        CREDITCARD.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST_CREDIT", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CustomerNumber = CUST_CREDIT.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_PAYMENT_CUST", FK_COLUMNS="CustomerNo" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNo)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustomerNo = CUST.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerNo IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_PAYMENT_EMP", FK_COLUMNS="EmployeeNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmployeeNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EmployeeNumber = EMP.EmployeeNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmployeeNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_PAYPAL ON PAYPAL FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PAYPAL */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  PAYPAL on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000175e8", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PAYPAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_PAYPAL", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM PAYPAL
          WHERE
            /* %JoinFKPK(PAYPAL,PAYMENT," = "," AND") */
            PAYPAL.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYPAL because PAYMENT exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_PAYPAL ON PAYPAL FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PAYPAL */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentTransactionNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  PAYPAL on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018891", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PAYPAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_PAYMENT_PAYPAL", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYPAL because PAYMENT does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_STORE ON STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020394", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_STORE ON STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStoreNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023cb4", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because EMP exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_SUBSCRIPTION ON SUBSCRIPTION FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SUBSCRIPTION */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST subscribed to SUBSCRIPTION on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015f9b", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="SUBSCRIPTION"
    P2C_VERB_PHRASE="subscribed to", C2P_VERB_PHRASE="subcribed by", 
    FK_CONSTRAINT="FK_CUSTOMER_SUBSCRIPTION", FK_COLUMNS="CustomerNumber" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CustomerNumber = CUST.CustomerNumber AND
        NOT EXISTS (
          SELECT * FROM SUBSCRIPTION
          WHERE
            /* %JoinFKPK(SUBSCRIPTION,CUST," = "," AND") */
            SUBSCRIPTION.CustomerNumber = CUST.CustomerNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SUBSCRIPTION because CUST exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_SUBSCRIPTION ON SUBSCRIPTION FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SUBSCRIPTION */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerNumber integer, 
           @insSubscriptionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST subscribed to SUBSCRIPTION on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018054", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="SUBSCRIPTION"
    P2C_VERB_PHRASE="subscribed to", C2P_VERB_PHRASE="subcribed by", 
    FK_CONSTRAINT="FK_CUSTOMER_SUBSCRIPTION", FK_COLUMNS="CustomerNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CustomerNumber = CUST.CustomerNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SUBSCRIPTION because CUST does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_SUBTITLE ON SUBTITLE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SUBTITLE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE provides SUBTITLE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015ab1", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="SUBTITLE"
    P2C_VERB_PHRASE="provides", C2P_VERB_PHRASE="is provided in", 
    FK_CONSTRAINT="FK_MOVIE_SUBTITLE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM SUBTITLE
          WHERE
            /* %JoinFKPK(SUBTITLE,MOVIE," = "," AND") */
            SUBTITLE.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last SUBTITLE because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_SUBTITLE ON SUBTITLE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SUBTITLE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE provides SUBTITLE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017b35", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="SUBTITLE"
    P2C_VERB_PHRASE="provides", C2P_VERB_PHRASE="is provided in", 
    FK_CONSTRAINT="FK_MOVIE_SUBTITLE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieNumber = MOVIE.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update SUBTITLE because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_SUPPLIER ON SUPPLIER FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SUPPLIER */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* SUPPLIER  MOVIE_SUPPLIER on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012acd", PARENT_OWNER="", PARENT_TABLE="SUPPLIER"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SUPPLIER_MOVIE_SUPPLIER", FK_COLUMNS="SupplierID" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_SUPPLIER
      WHERE
        /*  %JoinFKPK(MOVIE_SUPPLIER,deleted," = "," AND") */
        MOVIE_SUPPLIER.SupplierID = deleted.SupplierID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete SUPPLIER because MOVIE_SUPPLIER exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_SUPPLIER ON SUPPLIER FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SUPPLIER */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSupplierID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SUPPLIER  MOVIE_SUPPLIER on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013b3f", PARENT_OWNER="", PARENT_TABLE="SUPPLIER"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_SUPPLIER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_SUPPLIER_MOVIE_SUPPLIER", FK_COLUMNS="SupplierID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SupplierID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_SUPPLIER
      WHERE
        /*  %JoinFKPK(MOVIE_SUPPLIER,deleted," = "," AND") */
        MOVIE_SUPPLIER.SupplierID = deleted.SupplierID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update SUPPLIER because MOVIE_SUPPLIER exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


