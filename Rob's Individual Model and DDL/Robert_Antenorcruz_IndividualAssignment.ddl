
CREATE TABLE [CHECK]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[CheckBankNumber]    integer  NULL ,
	[CheckNumber]        integer  NULL 
)
go

CREATE TABLE [CREDITCARD]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[CreditCardNumber]   char(18)  NULL ,
	[CreditCardExp]      char(18)  NULL ,
	[CreditCardType]     char(18)  NULL 
)
go

CREATE TABLE [CUSTOMER]
( 
	[CustAddress]        [address] ,
	[CustCity]           [city] ,
	[CustFirstName]      [first_name] ,
	[CustLastName]       [last_name] ,
	[CustState]          [state] ,
	[CustZipCode]        [zip_code] ,
	[Email]              varchar  NULL ,
	[CustNumber]         integer  NOT NULL 
)
go

CREATE TABLE [CUSTOMERCREDIT]
( 
	[CustNumber]         integer  NOT NULL ,
	[CustCredit]         integer  NULL 
)
go

CREATE TABLE [EMPLOYEE]
( 
	[EmpFirstName]       [first_name] ,
	[EmpAddress]         [address] ,
	[EmpPhone]           [phone] ,
	[StoreNumber]        integer  NULL ,
	[EmpAddress2]        [address_2] ,
	[Email]              varchar(20)  NULL ,
	[Salary]             integer  NULL ,
	[HireDate]           datetime  NULL ,
	[SocSecNumber]       integer  NULL ,
	[EmpNumber]          varchar(20)  NOT NULL ,
	[Supervisor]         varchar(20)  NOT NULL ,
	[EmpLastName]        varchar(20)  NULL 
)
go

CREATE TABLE [EPAY]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[EpayVendorNumber]   integer  NULL ,
	[EpayAccountNumber]  integer  NULL 
)
go

CREATE TABLE [MOVIE]
( 
	[MovieTitle]         [title] ,
	[MovieDirector]      [director] ,
	[Description]        varchar(20)  NULL ,
	[Star1Name]          [first_name] ,
	[Rating]             varchar  NULL ,
	[Star2Name]          [first_name] ,
	[MovieNumber]        integer  NOT NULL ,
	[Genre]              char  NULL ,
	[RentalRate]         numeric  NULL ,
	[MovieUrl]           varchar  NULL ,
	[MovieClip]          varbinary  NULL 
)
go

CREATE TABLE [MOVIE_STORE]
( 
	[MovieNumber]        integer  NOT NULL ,
	[StoreNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MOVIECOPY]
( 
	[GeneralCondition]   varchar(20)  NULL ,
	[MovieFormat]        varchar(20)  NULL ,
	[MoCoNum]            integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL 
)
go

CREATE TABLE [MOVIERENTALRECORD]
( 
	[RentalDate]         datetime  NULL ,
	[DueDate]            datetime  NULL ,
	[RentalStatus]       varchar(20)  NULL ,
	[PaymentTransactionNumber] integer  NULL ,
	[OverdueCharge]      integer  NULL ,
	[RentalRate]         integer  NULL ,
	[RentalRecordDate]   datetime  NOT NULL ,
	[MoCoNum]            integer  NOT NULL ,
	[MovieNumber]        integer  NOT NULL ,
	[CustNumber]         integer  NOT NULL ,
	[EmpNumber]          varchar(20)  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[PaymentTransactionNumber] integer  NOT NULL ,
	[PaymentType]        char(18)  NULL ,
	[PaymentAmount]      numeric  NULL ,
	[PaymentDate]        datetime  NULL ,
	[PaymentStatus]      varchar(1)  NULL ,
	[EmpNumber]          varchar(20)  NOT NULL ,
	[CustNumber]         integer  NULL 
)
go

CREATE TABLE [STORE]
( 
	[StoreManager]       [manager] ,
	[StoreAddress]       [address] ,
	[StoreAddress2]      [address_2] ,
	[StorePhone]         [phone] ,
	[StoreCity]          [city] ,
	[StoreState]         [state] ,
	[StoreZipCode]       [zip_code] ,
	[StoreNumber]        integer  NOT NULL 
)
go

ALTER TABLE [CHECK]
	ADD CONSTRAINT [XPKCheck] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [CREDITCARD]
	ADD CONSTRAINT [XPKCredit_Card] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [CUSTOMER]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustNumber] ASC)
go

ALTER TABLE [CUSTOMER]
	ADD CONSTRAINT [XAK1Customer] UNIQUE ([CustAddress]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [CUSTOMER]
( 
	[CustLastName]        ASC
)
go

ALTER TABLE [CUSTOMERCREDIT]
	ADD CONSTRAINT [XPKCustomer_Credit] PRIMARY KEY  CLUSTERED ([CustNumber] ASC)
go

ALTER TABLE [EMPLOYEE]
	ADD CONSTRAINT [XPKEmployee] PRIMARY KEY  CLUSTERED ([EmpNumber] ASC)
go

ALTER TABLE [EMPLOYEE]
	ADD CONSTRAINT [XAK1Employee] UNIQUE ([SocSecNumber]  ASC,[EmpPhone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Employee] ON [EMPLOYEE]
( 
	[EmpFirstName]        ASC
)
go

ALTER TABLE [EPAY]
	ADD CONSTRAINT [XPKEpay] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieNumber] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([MovieTitle]  ASC)
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [XPKMovie_Store] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MOVIECOPY]
	ADD CONSTRAINT [XPKMovie_Copy] PRIMARY KEY  CLUSTERED ([MoCoNum] ASC,[MovieNumber] ASC)
go

ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [XPKMovie_Rental_Record] PRIMARY KEY  CLUSTERED ([RentalRecordDate] ASC,[MoCoNum] ASC,[MovieNumber] ASC,[CustNumber] ASC,[EmpNumber] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([PaymentTransactionNumber] ASC)
go

ALTER TABLE [STORE]
	ADD CONSTRAINT [XPKStore] PRIMARY KEY  CLUSTERED ([StoreNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Store] ON [STORE]
( 
	[StoreManager]        ASC
)
go

CREATE VIEW [CUSTOMER_INVOICE]([CustNumber],[CustAddress],[Email],[CustCity],[CustFirstName],[CustLastName],[CustState],[CustZipCode],[RentalRecordDate],[MoCoNum],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate],[MovieTitle],[Overdue_Charge_Rate])
AS
SELECT ALL [CUSTOMER].[CustNumber],[CUSTOMER].[CustAddress],[CUSTOMER].[Email],[CUSTOMER].[CustCity],[CUSTOMER].[CustFirstName],[CUSTOMER].[CustLastName],[CUSTOMER].[CustState],[CUSTOMER].[CustZipCode],[MOVIERENTALRECORD].[RentalRecordDate],[MOVIERENTALRECORD].[MoCoNum],[MOVIERENTALRECORD].[MovieNumber],[MOVIERENTALRECORD].[RentalDate],[MOVIERENTALRECORD].[DueDate],[MOVIERENTALRECORD].[RentalStatus],[MOVIERENTALRECORD].[OverdueCharge],[MOVIERENTALRECORD].[RentalRate],[MOVIE].[MovieTitle],rental_rate * 1.5
	FROM [CUSTOMERCREDIT],[CUSTOMER],[MOVIERENTALRECORD],[MOVIE]
go

CREATE VIEW [OVERDUE_NOTICE]([Overdue_Charge_Rate],[CustNumber],[CustAddress],[Email],[CustCity],[CustFirstName],[CustLastName],[CustState],[CustZipCode],[RentalRecordDate],[MoCoNum],[MovieNumber],[RentalDate],[DueDate],[RentalStatus],[OverdueCharge],[RentalRate])
AS
SELECT ALL rental_rate * 1.5,[CUSTOMER].[CustNumber],[CUSTOMER].[CustAddress],[CUSTOMER].[Email],[CUSTOMER].[CustCity],[CUSTOMER].[CustFirstName],[CUSTOMER].[CustLastName],[CUSTOMER].[CustState],[CUSTOMER].[CustZipCode],[MOVIERENTALRECORD].[RentalRecordDate],[MOVIERENTALRECORD].[MoCoNum],[MOVIERENTALRECORD].[MovieNumber],[MOVIERENTALRECORD].[RentalDate],[MOVIERENTALRECORD].[DueDate],[MOVIERENTALRECORD].[RentalStatus],[MOVIERENTALRECORD].[OverdueCharge],[MOVIERENTALRECORD].[RentalRate]
	FROM [CUSTOMERCREDIT],[CUSTOMER],[MOVIERENTALRECORD]
go


ALTER TABLE [CHECK]
	ADD CONSTRAINT [R_23] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [CREDITCARD]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [EMPLOYEE]
	ADD CONSTRAINT [FK_Emp_STORE] FOREIGN KEY ([StoreNumber]) REFERENCES [STORE]([StoreNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [EMPLOYEE]
	ADD CONSTRAINT [FK_Emp_EMP] FOREIGN KEY ([Supervisor]) REFERENCES [EMPLOYEE]([EmpNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EPAY]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


exec sp_bindrule '[Movie_genre]', '[MOVIE].[Genre]'
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


ALTER TABLE [MOVIECOPY]
	ADD CONSTRAINT [FK_MovieCopy_MOVIE] FOREIGN KEY ([MovieNumber]) REFERENCES [MOVIE]([MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [FK_MoRentRec_MOVIE_COPY] FOREIGN KEY ([MoCoNum],[MovieNumber]) REFERENCES [MOVIECOPY]([MoCoNum],[MovieNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [FK_MoRentRec_CUST] FOREIGN KEY ([CustNumber]) REFERENCES [CUSTOMER]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [FK_MoRentRec_CUST_CREDIT] FOREIGN KEY ([CustNumber]) REFERENCES [CUSTOMERCREDIT]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [FK_MoRentRec_EMP] FOREIGN KEY ([EmpNumber]) REFERENCES [EMPLOYEE]([EmpNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIERENTALRECORD]
	ADD CONSTRAINT [FK_MoRentRec_PAYMENT] FOREIGN KEY ([PaymentTransactionNumber]) REFERENCES [PAYMENT]([PaymentTransactionNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_Payment_EMP] FOREIGN KEY ([EmpNumber]) REFERENCES [EMPLOYEE]([EmpNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_Payment_CUST] FOREIGN KEY ([CustNumber]) REFERENCES [CUSTOMER]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_Payment_CUST_CREDIT] FOREIGN KEY ([CustNumber]) REFERENCES [CUSTOMERCREDIT]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_CHECK ON CHECK FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CHECK */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  CHECK on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001669c", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CHECK"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM CHECK
          WHERE
            /* %JoinFKPK(CHECK,PAYMENT," = "," AND") */
            CHECK.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CHECK because PAYMENT exists.'
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


CREATE TRIGGER tU_CHECK ON CHECK FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CHECK */
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
  /* PAYMENT  CHECK on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017c4c", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CHECK"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="PaymentTransactionNumber" */
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
             @errmsg = 'Cannot update CHECK because PAYMENT does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="000172d4", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="PaymentTransactionNumber" */
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
  /* ERWIN_RELATION:CHECKSUM="000187c0", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="PaymentTransactionNumber" */
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




CREATE TRIGGER tD_CUSTOMER ON CUSTOMER FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTOMER */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUSTOMER makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022f20", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUSTOMER because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMER rents under MOVIERENTALRECORD on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUSTOMER because MOVIERENTALRECORD exists.'
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


CREATE TRIGGER tU_CUSTOMER ON CUSTOMER FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTOMER */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUSTOMER makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000268be", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUSTOMER because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMER rents under MOVIERENTALRECORD on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUSTOMER because MOVIERENTALRECORD exists.'
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




CREATE TRIGGER tD_CUSTOMERCREDIT ON CUSTOMERCREDIT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUSTOMERCREDIT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUSTOMERCREDIT makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023b5f", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUSTOMERCREDIT because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMERCREDIT rents under MOVIERENTALRECORD on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="uses", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUSTOMERCREDIT because MOVIERENTALRECORD exists.'
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


CREATE TRIGGER tU_CUSTOMERCREDIT ON CUSTOMERCREDIT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUSTOMERCREDIT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUSTOMERCREDIT makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00027b57", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUSTOMERCREDIT because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMERCREDIT rents under MOVIERENTALRECORD on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="uses", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUSTOMERCREDIT because MOVIERENTALRECORD exists.'
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




CREATE TRIGGER tD_EMPLOYEE ON EMPLOYEE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EMPLOYEE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EMPLOYEE receives PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005905a", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMPLOYEE because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMPLOYEE reports to EMPLOYEE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,EMPLOYEE
      WHERE
        /*  %JoinFKPK(EMPLOYEE,deleted," = "," AND") */
        EMPLOYEE.Supervisor = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMPLOYEE because EMPLOYEE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMPLOYEE completes MOVIERENTALRECORD on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMPLOYEE because MOVIERENTALRECORD exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMPLOYEE reports to EMPLOYEE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
    IF EXISTS (SELECT * FROM deleted,EMPLOYEE
      WHERE
        /* %JoinFKPK(deleted,EMPLOYEE," = "," AND") */
        deleted.Supervisor = EMPLOYEE.EmpNumber AND
        NOT EXISTS (
          SELECT * FROM EMPLOYEE
          WHERE
            /* %JoinFKPK(EMPLOYEE,EMPLOYEE," = "," AND") */
            EMPLOYEE.Supervisor = EMPLOYEE.EmpNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMPLOYEE because EMPLOYEE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMPLOYEE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.StoreNumber = STORE.StoreNumber AND
        NOT EXISTS (
          SELECT * FROM EMPLOYEE
          WHERE
            /* %JoinFKPK(EMPLOYEE,STORE," = "," AND") */
            EMPLOYEE.StoreNumber = STORE.StoreNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMPLOYEE because STORE exists.'
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


CREATE TRIGGER tU_EMPLOYEE ON EMPLOYEE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EMPLOYEE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmpNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMPLOYEE receives PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00066a95", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMPLOYEE because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMPLOYEE reports to EMPLOYEE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMPLOYEE
      WHERE
        /*  %JoinFKPK(EMPLOYEE,deleted," = "," AND") */
        EMPLOYEE.Supervisor = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMPLOYEE because EMPLOYEE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMPLOYEE completes MOVIERENTALRECORD on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.EmpNumber = deleted.EmpNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMPLOYEE because MOVIERENTALRECORD exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMPLOYEE reports to EMPLOYEE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="Supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMPLOYEE
        WHERE
          /* %JoinFKPK(inserted,EMPLOYEE) */
          inserted.Supervisor = EMPLOYEE.EmpNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Supervisor IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMPLOYEE because EMPLOYEE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMPLOYEE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
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
             @errmsg = 'Cannot update EMPLOYEE because STORE does not exist.'
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




CREATE TRIGGER tD_EPAY ON EPAY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EPAY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT  EPAY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001622a", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM EPAY
          WHERE
            /* %JoinFKPK(EPAY,PAYMENT," = "," AND") */
            EPAY.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EPAY because PAYMENT exists.'
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


CREATE TRIGGER tU_EPAY ON EPAY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EPAY */
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
  /* PAYMENT  EPAY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018302", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="PaymentTransactionNumber" */
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
             @errmsg = 'Cannot update EPAY because PAYMENT does not exist.'
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
    /* MOVIE rents MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022611", PARENT_OWNER="", PARENT_TABLE="MOVIE"
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
    /* MOVIE is rented as MOVIECOPY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIECOPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIECOPY
      WHERE
        /*  %JoinFKPK(MOVIECOPY,deleted," = "," AND") */
        MOVIECOPY.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIECOPY exists.'
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
  /* MOVIE rents MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000252c2", PARENT_OWNER="", PARENT_TABLE="MOVIE"
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
  /* MOVIE is rented as MOVIECOPY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIECOPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIECOPY
      WHERE
        /*  %JoinFKPK(MOVIECOPY,deleted," = "," AND") */
        MOVIECOPY.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIECOPY exists.'
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




CREATE TRIGGER tD_MOVIECOPY ON MOVIECOPY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIECOPY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIECOPY is rented under MOVIERENTALRECORD on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029258", PARENT_OWNER="", PARENT_TABLE="MOVIECOPY"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MoCoNum""MovieNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.MoCoNum = deleted.MoCoNum AND
        MOVIERENTALRECORD.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIECOPY because MOVIERENTALRECORD exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIECOPY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIECOPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieNumber = MOVIE.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIECOPY
          WHERE
            /* %JoinFKPK(MOVIECOPY,MOVIE," = "," AND") */
            MOVIECOPY.MovieNumber = MOVIE.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIECOPY because MOVIE exists.'
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


CREATE TRIGGER tU_MOVIECOPY ON MOVIECOPY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIECOPY */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMoCoNum integer, 
           @insMovieNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIECOPY is rented under MOVIERENTALRECORD on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d11c", PARENT_OWNER="", PARENT_TABLE="MOVIECOPY"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MoCoNum""MovieNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MoCoNum) OR
    UPDATE(MovieNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.MoCoNum = deleted.MoCoNum AND
        MOVIERENTALRECORD.MovieNumber = deleted.MovieNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIECOPY because MOVIERENTALRECORD exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIECOPY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIECOPY"
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
             @errmsg = 'Cannot update MOVIECOPY because MOVIE does not exist.'
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




CREATE TRIGGER tD_MOVIERENTALRECORD ON MOVIERENTALRECORD FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIERENTALRECORD */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MOVIERENTALRECORD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00074c6e", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIERENTALRECORD
          WHERE
            /* %JoinFKPK(MOVIERENTALRECORD,PAYMENT," = "," AND") */
            MOVIERENTALRECORD.PaymentTransactionNumber = PAYMENT.PaymentTransactionNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIERENTALRECORD because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMERCREDIT rents under MOVIERENTALRECORD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="uses", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUSTOMERCREDIT
      WHERE
        /* %JoinFKPK(deleted,CUSTOMERCREDIT," = "," AND") */
        deleted.CustNumber = CUSTOMERCREDIT.CustNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIERENTALRECORD
          WHERE
            /* %JoinFKPK(MOVIERENTALRECORD,CUSTOMERCREDIT," = "," AND") */
            MOVIERENTALRECORD.CustNumber = CUSTOMERCREDIT.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIERENTALRECORD because CUSTOMERCREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMER rents under MOVIERENTALRECORD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUSTOMER
      WHERE
        /* %JoinFKPK(deleted,CUSTOMER," = "," AND") */
        deleted.CustNumber = CUSTOMER.CustNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIERENTALRECORD
          WHERE
            /* %JoinFKPK(MOVIERENTALRECORD,CUSTOMER," = "," AND") */
            MOVIERENTALRECORD.CustNumber = CUSTOMER.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIERENTALRECORD because CUSTOMER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIECOPY is rented under MOVIERENTALRECORD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIECOPY"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MoCoNum""MovieNumber" */
    IF EXISTS (SELECT * FROM deleted,MOVIECOPY
      WHERE
        /* %JoinFKPK(deleted,MOVIECOPY," = "," AND") */
        deleted.MoCoNum = MOVIECOPY.MoCoNum AND
        deleted.MovieNumber = MOVIECOPY.MovieNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIERENTALRECORD
          WHERE
            /* %JoinFKPK(MOVIERENTALRECORD,MOVIECOPY," = "," AND") */
            MOVIERENTALRECORD.MoCoNum = MOVIECOPY.MoCoNum AND
            MOVIERENTALRECORD.MovieNumber = MOVIECOPY.MovieNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIERENTALRECORD because MOVIECOPY exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMPLOYEE completes MOVIERENTALRECORD on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (SELECT * FROM deleted,EMPLOYEE
      WHERE
        /* %JoinFKPK(deleted,EMPLOYEE," = "," AND") */
        deleted.EmpNumber = EMPLOYEE.EmpNumber AND
        NOT EXISTS (
          SELECT * FROM MOVIERENTALRECORD
          WHERE
            /* %JoinFKPK(MOVIERENTALRECORD,EMPLOYEE," = "," AND") */
            MOVIERENTALRECORD.EmpNumber = EMPLOYEE.EmpNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIERENTALRECORD because EMPLOYEE exists.'
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


CREATE TRIGGER tU_MOVIERENTALRECORD ON MOVIERENTALRECORD FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIERENTALRECORD */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRentalRecordDate datetime, 
           @insMoCoNum integer, 
           @insMovieNumber integer, 
           @insCustNumber integer, 
           @insEmpNumber varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MOVIERENTALRECORD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00079cfe", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
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
             @errmsg = 'Cannot update MOVIERENTALRECORD because PAYMENT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMERCREDIT rents under MOVIERENTALRECORD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="uses", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUSTOMERCREDIT
        WHERE
          /* %JoinFKPK(inserted,CUSTOMERCREDIT) */
          inserted.CustNumber = CUSTOMERCREDIT.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIERENTALRECORD because CUSTOMERCREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMER rents under MOVIERENTALRECORD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUSTOMER
        WHERE
          /* %JoinFKPK(inserted,CUSTOMER) */
          inserted.CustNumber = CUSTOMER.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIERENTALRECORD because CUSTOMER does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIECOPY is rented under MOVIERENTALRECORD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIECOPY"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="MoCoNum""MovieNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MoCoNum) OR
    UPDATE(MovieNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIECOPY
        WHERE
          /* %JoinFKPK(inserted,MOVIECOPY) */
          inserted.MoCoNum = MOVIECOPY.MoCoNum and
          inserted.MovieNumber = MOVIECOPY.MovieNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIERENTALRECORD because MOVIECOPY does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMPLOYEE completes MOVIERENTALRECORD on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMPLOYEE
        WHERE
          /* %JoinFKPK(inserted,EMPLOYEE) */
          inserted.EmpNumber = EMPLOYEE.EmpNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIERENTALRECORD because EMPLOYEE does not exist.'
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
    /* PAYMENT  CHECK on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00076600", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CHECK"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE CHECK
      FROM CHECK,deleted
      WHERE
        /*  %JoinFKPK(CHECK,deleted," = "," AND") */
        CHECK.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT  CREDITCARD on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CREDITCARD"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE CREDITCARD
      FROM CREDITCARD,deleted
      WHERE
        /*  %JoinFKPK(CREDITCARD,deleted," = "," AND") */
        CREDITCARD.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT  EPAY on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="PaymentTransactionNumber" */
    DELETE EPAY
      FROM EPAY,deleted
      WHERE
        /*  %JoinFKPK(EPAY,deleted," = "," AND") */
        EPAY.PaymentTransactionNumber = deleted.PaymentTransactionNumber

    /* erwin Builtin Trigger */
    /* PAYMENT is made on MOVIERENTALRECORD on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PAYMENT because MOVIERENTALRECORD exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMERCREDIT makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUSTOMERCREDIT
      WHERE
        /* %JoinFKPK(deleted,CUSTOMERCREDIT," = "," AND") */
        deleted.CustNumber = CUSTOMERCREDIT.CustNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUSTOMERCREDIT," = "," AND") */
            PAYMENT.CustNumber = CUSTOMERCREDIT.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUSTOMERCREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUSTOMER makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,CUSTOMER
      WHERE
        /* %JoinFKPK(deleted,CUSTOMER," = "," AND") */
        deleted.CustNumber = CUSTOMER.CustNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUSTOMER," = "," AND") */
            PAYMENT.CustNumber = CUSTOMER.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUSTOMER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMPLOYEE receives PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
    IF EXISTS (SELECT * FROM deleted,EMPLOYEE
      WHERE
        /* %JoinFKPK(deleted,EMPLOYEE," = "," AND") */
        deleted.EmpNumber = EMPLOYEE.EmpNumber AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,EMPLOYEE," = "," AND") */
            PAYMENT.EmpNumber = EMPLOYEE.EmpNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because EMPLOYEE exists.'
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
  /* PAYMENT  CHECK on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000a89d8", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CHECK"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE CHECK
      SET
        /*  %JoinFKPK(CHECK,@ins," = ",",") */
        CHECK.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM CHECK,inserted,deleted
      WHERE
        /*  %JoinFKPK(CHECK,deleted," = "," AND") */
        CHECK.PaymentTransactionNumber = deleted.PaymentTransactionNumber
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
    FK_CONSTRAINT="R_22", FK_COLUMNS="PaymentTransactionNumber" */
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
  /* PAYMENT  EPAY on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="EPAY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPaymentTransactionNumber = inserted.PaymentTransactionNumber
        FROM inserted
      UPDATE EPAY
      SET
        /*  %JoinFKPK(EPAY,@ins," = ",",") */
        EPAY.PaymentTransactionNumber = @insPaymentTransactionNumber
      FROM EPAY,inserted,deleted
      WHERE
        /*  %JoinFKPK(EPAY,deleted," = "," AND") */
        EPAY.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT is made on MOVIERENTALRECORD on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MOVIERENTALRECORD"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="PaymentTransactionNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentTransactionNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIERENTALRECORD
      WHERE
        /*  %JoinFKPK(MOVIERENTALRECORD,deleted," = "," AND") */
        MOVIERENTALRECORD.PaymentTransactionNumber = deleted.PaymentTransactionNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PAYMENT because MOVIERENTALRECORD exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMERCREDIT makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMERCREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST_CREDIT", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUSTOMERCREDIT
        WHERE
          /* %JoinFKPK(inserted,CUSTOMERCREDIT) */
          inserted.CustNumber = CUSTOMERCREDIT.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUSTOMERCREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUSTOMER makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUSTOMER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUSTOMER
        WHERE
          /* %JoinFKPK(inserted,CUSTOMER) */
          inserted.CustNumber = CUSTOMER.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUSTOMER does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMPLOYEE receives PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLOYEE"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EmpNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EmpNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMPLOYEE
        WHERE
          /* %JoinFKPK(inserted,EMPLOYEE) */
          inserted.EmpNumber = EMPLOYEE.EmpNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EmpNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because EMPLOYEE does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="000218ed", PARENT_OWNER="", PARENT_TABLE="STORE"
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
    /* STORE employs is EMPLOYEE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
    IF EXISTS (
      SELECT * FROM deleted,EMPLOYEE
      WHERE
        /*  %JoinFKPK(EMPLOYEE,deleted," = "," AND") */
        EMPLOYEE.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because EMPLOYEE exists.'
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
  /* ERWIN_RELATION:CHECKSUM="00025ebd", PARENT_OWNER="", PARENT_TABLE="STORE"
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
  /* STORE employs is EMPLOYEE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMPLOYEE"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="StoreNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StoreNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMPLOYEE
      WHERE
        /*  %JoinFKPK(EMPLOYEE,deleted," = "," AND") */
        EMPLOYEE.StoreNumber = deleted.StoreNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because EMPLOYEE exists.'
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


