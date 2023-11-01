
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE RULE [ServiceNameProviders]
	AS @col IN ('Netflix', 'HBO', 'Hulu', 'Paramount+')
go

CREATE RULE [AcceptedCountries]
	AS @col IN ('USA', 'France', 'Italy')
go

CREATE RULE [MemberShipPlans]
	AS @col IN ('Premium', 'Standard')
go

CREATE RULE [Sequel]
	AS @col IN ('NULL')
go

CREATE TABLE [Account]
( 
	[AccountId]          bigint  NOT NULL ,
	[CustNumber]         integer  NOT NULL ,
	[StreamingServiceid] smallint  NOT NULL ,
	[MemberShipid]       smallint  NOT NULL ,
	[CreditCardNumber]   integer  NOT NULL ,
	[PaymentOptionId]    integer  NOT NULL 
)
go

CREATE TABLE [CreditCard]
( 
	[CreditCardNumber]   integer  NOT NULL ,
	[CompanyOwner]       varchar(10)  NOT NULL ,
	[CardOwner]          varchar(10)  NOT NULL ,
	[Expiration]         datetime  NOT NULL 
)
go

CREATE TABLE [Customer]
( 
	[CustCity]           [city]  NOT NULL ,
	[CustFirstName]      [first_name]  NOT NULL ,
	[CustLastName]       [last_name]  NOT NULL ,
	[CustState]          [state]  NOT NULL ,
	[CustZipCode]        [zip_code]  NOT NULL ,
	[Email]              varchar(20)  NULL ,
	[CustNumber]         integer  NOT NULL ,
	[CustCountry]        nvarchar(20)  NOT NULL 
)
go

CREATE TABLE [Genre]
( 
	[GenreId]            smallint  NOT NULL ,
	[GenreName]          char(18)  NOT NULL 
)
go

CREATE TABLE [GenreMovie]
( 
	[GenreId]            smallint  NOT NULL ,
	[MovieId]            smallint  NOT NULL 
)
go

CREATE TABLE [MemberShipPlan]
( 
	[MemberShipid]       smallint  NOT NULL ,
	[MemeberShipPlan]    char(18)  NOT NULL ,
	[AdPerVideo]         smallint  NOT NULL ,
	[Description]        varchar(50)  NOT NULL ,
	[Membershipcost]     char(18)  NOT NULL 
)
go

CREATE TABLE [MemberShipPlanMovie]
( 
	[MembershipId]       smallint  NOT NULL ,
	[MovieId]            smallint  NOT NULL ,
	[Membershipplan]     char(18)  NOT NULL ,
	[Moviename]          char(18)  NOT NULL 
)
go

CREATE TABLE [MemberShipPlanMovie]
( 
	[MemberShipId]       smallint  NOT NULL ,
	[MovieId]            smallint  NOT NULL 
)
go

CREATE TABLE [Movie]
( 
	[MovieId]            smallint  NOT NULL ,
	[MovieName]          varchar(15)  NOT NULL ,
	[Length]             TIME  NOT NULL ,
	[Description]        text  NOT NULL ,
	[Sequel]             smallint  NULL 
	CONSTRAINT [Zero_898472631]
		 DEFAULT  0
)
go

CREATE TABLE [Payment]
( 
	[paymenttransactionnumber] integer  NOT NULL ,
	[PaymentAmount]      numeric  NOT NULL ,
	[DueDate]            varchar(1)  NOT NULL ,
	[AccountId]          bigint  NOT NULL ,
	[Issued]             date  NOT NULL 
)
go

CREATE TABLE [PayMentOption]
( 
	[PaymentRateNumber]  integer  NOT NULL ,
	[PaymentOptionId]    integer  NOT NULL ,
	[PaymentRate]        char(18)  NOT NULL 
)
go

CREATE TABLE [StreamingService]
( 
	[StreamingServiceId] smallint  NOT NULL ,
	[ServiceName]        char(15)  NOT NULL ,
	[CountryOfOrigin]    varchar(30)  NOT NULL ,
	[OwnerName]          varchar(20)  NOT NULL 
)
go

CREATE TABLE [StreamingServiceMovie]
( 
	[StreamingServiceId] smallint  NOT NULL ,
	[MovieId]            smallint  NOT NULL 
)
go

ALTER TABLE [Account]
	ADD CONSTRAINT [XPKAccount] PRIMARY KEY  CLUSTERED ([AccountId] ASC)
go

ALTER TABLE [CreditCard]
	ADD CONSTRAINT [XPKCreditCard] PRIMARY KEY  CLUSTERED ([CreditCardNumber] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  CLUSTERED ([CustNumber] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Customer]
( 
	[CustLastName]        ASC
)
go

ALTER TABLE [Genre]
	ADD CONSTRAINT [XPKGenre] PRIMARY KEY  CLUSTERED ([GenreId] ASC)
go

ALTER TABLE [GenreMovie]
	ADD CONSTRAINT [XPKGenreMovie] PRIMARY KEY  CLUSTERED ([GenreId] ASC,[MovieId] ASC)
go

ALTER TABLE [MemberShipPlan]
	ADD CONSTRAINT [XPKMemberShipPlan] PRIMARY KEY  CLUSTERED ([MemberShipid] ASC)
go

ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [XPKMemberShipPlanMovie] PRIMARY KEY  CLUSTERED ([MembershipId] ASC,[MovieId] ASC)
go

ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [XPKMemberShipPlanMovie] PRIMARY KEY  CLUSTERED ([MemberShipId] ASC,[MovieId] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([MovieId] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([paymenttransactionnumber] ASC)
go

ALTER TABLE [PayMentOption]
	ADD CONSTRAINT [XPKPayMentOption] PRIMARY KEY  CLUSTERED ([PaymentOptionId] ASC)
go

ALTER TABLE [StreamingService]
	ADD CONSTRAINT [XPKStreamingService] PRIMARY KEY  CLUSTERED ([StreamingServiceId] ASC)
go

ALTER TABLE [StreamingServiceMovie]
	ADD CONSTRAINT [XPKStreamingServiceMovie] PRIMARY KEY  CLUSTERED ([StreamingServiceId] ASC,[MovieId] ASC)
go


ALTER TABLE [Account]
	ADD CONSTRAINT [R_54] FOREIGN KEY ([CustNumber]) REFERENCES [Customer]([CustNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account]
	ADD CONSTRAINT [R_55] FOREIGN KEY ([StreamingServiceid]) REFERENCES [StreamingService]([StreamingServiceId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account]
	ADD CONSTRAINT [R_61] FOREIGN KEY ([MemberShipid]) REFERENCES [MemberShipPlan]([MemberShipid])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account]
	ADD CONSTRAINT [R_87] FOREIGN KEY ([CreditCardNumber]) REFERENCES [CreditCard]([CreditCardNumber])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Account]
	ADD CONSTRAINT [R_88] FOREIGN KEY ([PaymentOptionId]) REFERENCES [PayMentOption]([PaymentOptionId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[AcceptedCountries]', '[Customer].[CustCountry]'
go


ALTER TABLE [GenreMovie]
	ADD CONSTRAINT [R_44] FOREIGN KEY ([GenreId]) REFERENCES [Genre]([GenreId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [GenreMovie]
	ADD CONSTRAINT [R_45] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[MemberShipPlans]', '[MemberShipPlan].[MemberShipid]'
go


ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [R_79] FOREIGN KEY ([MembershipId]) REFERENCES [MemberShipPlan]([MemberShipid])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [R_80] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [R_93] FOREIGN KEY ([MemberShipId]) REFERENCES [MemberShipPlan]([MemberShipid])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MemberShipPlanMovie]
	ADD CONSTRAINT [R_94] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Movie]
	ADD CONSTRAINT [R_53] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [R_75] FOREIGN KEY ([AccountId]) REFERENCES [Account]([AccountId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[ServiceNameProviders]', '[StreamingService].[ServiceName]'
go


ALTER TABLE [StreamingServiceMovie]
	ADD CONSTRAINT [R_37] FOREIGN KEY ([StreamingServiceId]) REFERENCES [StreamingService]([StreamingServiceId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [StreamingServiceMovie]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [StreamingServiceMovie]
	ADD CONSTRAINT [R_81] FOREIGN KEY ([StreamingServiceId]) REFERENCES [StreamingService]([StreamingServiceId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [StreamingServiceMovie]
	ADD CONSTRAINT [R_82] FOREIGN KEY ([MovieId]) REFERENCES [Movie]([MovieId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Account ON Account FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Account */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account makes a Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00079713", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is accepted by an", 
    FK_CONSTRAINT="R_75", FK_COLUMNS="AccountId" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.AccountId = deleted.AccountId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Account because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PayMentOption is provided to an Account on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PayMentOption"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="is provided to an", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="PaymentOptionId" */
    IF EXISTS (SELECT * FROM deleted,PayMentOption
      WHERE
        /* %JoinFKPK(deleted,PayMentOption," = "," AND") */
        deleted.PaymentOptionId = PayMentOption.PaymentOptionId AND
        NOT EXISTS (
          SELECT * FROM Account
          WHERE
            /* %JoinFKPK(Account,PayMentOption," = "," AND") */
            Account.PaymentOptionId = PayMentOption.PaymentOptionId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Account because PayMentOption exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CreditCard belongs to Account on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCard"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="belongs to", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CreditCardNumber" */
    IF EXISTS (SELECT * FROM deleted,CreditCard
      WHERE
        /* %JoinFKPK(deleted,CreditCard," = "," AND") */
        deleted.CreditCardNumber = CreditCard.CreditCardNumber AND
        NOT EXISTS (
          SELECT * FROM Account
          WHERE
            /* %JoinFKPK(Account,CreditCard," = "," AND") */
            Account.CreditCardNumber = CreditCard.CreditCardNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Account because CreditCard exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MemberShipPlan has a Account on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to an", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="MemberShipid" */
    IF EXISTS (SELECT * FROM deleted,MemberShipPlan
      WHERE
        /* %JoinFKPK(deleted,MemberShipPlan," = "," AND") */
        deleted.MemberShipid = MemberShipPlan.MemberShipid AND
        NOT EXISTS (
          SELECT * FROM Account
          WHERE
            /* %JoinFKPK(Account,MemberShipPlan," = "," AND") */
            Account.MemberShipid = MemberShipPlan.MemberShipid
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Account because MemberShipPlan exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService has Account on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="StreamingServiceid" */
    IF EXISTS (SELECT * FROM deleted,StreamingService
      WHERE
        /* %JoinFKPK(deleted,StreamingService," = "," AND") */
        deleted.StreamingServiceid = StreamingService.StreamingServiceId AND
        NOT EXISTS (
          SELECT * FROM Account
          WHERE
            /* %JoinFKPK(Account,StreamingService," = "," AND") */
            Account.StreamingServiceid = StreamingService.StreamingServiceId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Account because StreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Customer has an Account on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CustNumber" */
    IF EXISTS (SELECT * FROM deleted,Customer
      WHERE
        /* %JoinFKPK(deleted,Customer," = "," AND") */
        deleted.CustNumber = Customer.CustNumber AND
        NOT EXISTS (
          SELECT * FROM Account
          WHERE
            /* %JoinFKPK(Account,Customer," = "," AND") */
            Account.CustNumber = Customer.CustNumber
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Account because Customer exists.'
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


CREATE TRIGGER tU_Account ON Account FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Account */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAccountId bigint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account makes a Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00085787", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is accepted by an", 
    FK_CONSTRAINT="R_75", FK_COLUMNS="AccountId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(AccountId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.AccountId = deleted.AccountId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Account because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PayMentOption is provided to an Account on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PayMentOption"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="is provided to an", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="PaymentOptionId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PaymentOptionId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PayMentOption
        WHERE
          /* %JoinFKPK(inserted,PayMentOption) */
          inserted.PaymentOptionId = PayMentOption.PaymentOptionId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Account because PayMentOption does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CreditCard belongs to Account on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCard"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="belongs to", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CreditCardNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CreditCardNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CreditCard
        WHERE
          /* %JoinFKPK(inserted,CreditCard) */
          inserted.CreditCardNumber = CreditCard.CreditCardNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CreditCardNumber IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Account because CreditCard does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MemberShipPlan has a Account on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to an", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="MemberShipid" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MemberShipid)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MemberShipPlan
        WHERE
          /* %JoinFKPK(inserted,MemberShipPlan) */
          inserted.MemberShipid = MemberShipPlan.MemberShipid
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Account because MemberShipPlan does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService has Account on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="StreamingServiceid" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingServiceid)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingService
        WHERE
          /* %JoinFKPK(inserted,StreamingService) */
          inserted.StreamingServiceid = StreamingService.StreamingServiceId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Account because StreamingService does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Customer has an Account on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CustNumber" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Customer
        WHERE
          /* %JoinFKPK(inserted,Customer) */
          inserted.CustNumber = Customer.CustNumber
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Account because Customer does not exist.'
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




CREATE TRIGGER tD_CreditCard ON CreditCard FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCard */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CreditCard belongs to Account on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011839", PARENT_OWNER="", PARENT_TABLE="CreditCard"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="belongs to", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CreditCardNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.CreditCardNumber = deleted.CreditCardNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CreditCard because Account exists.'
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


CREATE TRIGGER tU_CreditCard ON CreditCard FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CreditCard */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCreditCardNumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CreditCard belongs to Account on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013bba", PARENT_OWNER="", PARENT_TABLE="CreditCard"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="belongs to", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_87", FK_COLUMNS="CreditCardNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CreditCardNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.CreditCardNumber = deleted.CreditCardNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CreditCard because Account exists.'
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




CREATE TRIGGER tD_Customer ON Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Customer has an Account on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010d86", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CustNumber" */
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Customer because Account exists.'
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


CREATE TRIGGER tU_Customer ON Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
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
  /* Customer has an Account on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000129ec", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has an", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CustNumber" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustNumber)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.CustNumber = deleted.CustNumber
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Customer because Account exists.'
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




CREATE TRIGGER tD_Genre ON Genre FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Genre */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Genre  GenreMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010dff", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="GenreId" */
    IF EXISTS (
      SELECT * FROM deleted,GenreMovie
      WHERE
        /*  %JoinFKPK(GenreMovie,deleted," = "," AND") */
        GenreMovie.GenreId = deleted.GenreId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Genre because GenreMovie exists.'
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


CREATE TRIGGER tU_Genre ON Genre FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Genre */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insGenreId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Genre  GenreMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011a58", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="GenreId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(GenreId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,GenreMovie
      WHERE
        /*  %JoinFKPK(GenreMovie,deleted," = "," AND") */
        GenreMovie.GenreId = deleted.GenreId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Genre because GenreMovie exists.'
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




CREATE TRIGGER tD_GenreMovie ON GenreMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on GenreMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  GenreMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025808", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM GenreMovie
          WHERE
            /* %JoinFKPK(GenreMovie,Movie," = "," AND") */
            GenreMovie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GenreMovie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Genre  GenreMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="GenreId" */
    IF EXISTS (SELECT * FROM deleted,Genre
      WHERE
        /* %JoinFKPK(deleted,Genre," = "," AND") */
        deleted.GenreId = Genre.GenreId AND
        NOT EXISTS (
          SELECT * FROM GenreMovie
          WHERE
            /* %JoinFKPK(GenreMovie,Genre," = "," AND") */
            GenreMovie.GenreId = Genre.GenreId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last GenreMovie because Genre exists.'
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


CREATE TRIGGER tU_GenreMovie ON GenreMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on GenreMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insGenreId smallint, 
           @insMovieId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  GenreMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00029d3c", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GenreMovie because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Genre  GenreMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Genre"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="GenreId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(GenreId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Genre
        WHERE
          /* %JoinFKPK(inserted,Genre) */
          inserted.GenreId = Genre.GenreId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update GenreMovie because Genre does not exist.'
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




CREATE TRIGGER tD_MemberShipPlan ON MemberShipPlan FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MemberShipPlan */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MemberShipPlan  MemberShipPlanMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000347f6", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="MemberShipId" */
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MemberShipId = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MemberShipPlan because MemberShipPlanMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MemberShipPlan  MemberShipPlanMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_79", FK_COLUMNS="MembershipId" */
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MembershipId = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MemberShipPlan because MemberShipPlanMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MemberShipPlan has a Account on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to an", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="MemberShipid" */
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.MemberShipid = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MemberShipPlan because Account exists.'
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


CREATE TRIGGER tU_MemberShipPlan ON MemberShipPlan FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MemberShipPlan */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMemberShipid smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MemberShipPlan  MemberShipPlanMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003a135", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="MemberShipId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MemberShipid)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MemberShipId = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MemberShipPlan because MemberShipPlanMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MemberShipPlan  MemberShipPlanMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_79", FK_COLUMNS="MembershipId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MemberShipid)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MembershipId = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MemberShipPlan because MemberShipPlanMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MemberShipPlan has a Account on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has a", C2P_VERB_PHRASE="belongs to an", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="MemberShipid" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MemberShipid)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.MemberShipid = deleted.MemberShipid
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MemberShipPlan because Account exists.'
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




CREATE TRIGGER tD_MemberShipPlanMovie ON MemberShipPlanMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MemberShipPlanMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  MemberShipPlanMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002b824", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_80", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MemberShipPlanMovie
          WHERE
            /* %JoinFKPK(MemberShipPlanMovie,Movie," = "," AND") */
            MemberShipPlanMovie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MemberShipPlanMovie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MemberShipPlan  MemberShipPlanMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_79", FK_COLUMNS="MembershipId" */
    IF EXISTS (SELECT * FROM deleted,MemberShipPlan
      WHERE
        /* %JoinFKPK(deleted,MemberShipPlan," = "," AND") */
        deleted.MembershipId = MemberShipPlan.MemberShipid AND
        NOT EXISTS (
          SELECT * FROM MemberShipPlanMovie
          WHERE
            /* %JoinFKPK(MemberShipPlanMovie,MemberShipPlan," = "," AND") */
            MemberShipPlanMovie.MembershipId = MemberShipPlan.MemberShipid
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MemberShipPlanMovie because MemberShipPlan exists.'
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


CREATE TRIGGER tU_MemberShipPlanMovie ON MemberShipPlanMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MemberShipPlanMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMembershipId smallint, 
           @insMovieId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MemberShipPlanMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d926", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_80", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MemberShipPlanMovie because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MemberShipPlan  MemberShipPlanMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_79", FK_COLUMNS="MembershipId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MembershipId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MemberShipPlan
        WHERE
          /* %JoinFKPK(inserted,MemberShipPlan) */
          inserted.MembershipId = MemberShipPlan.MemberShipid
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MemberShipPlanMovie because MemberShipPlan does not exist.'
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




CREATE TRIGGER tD_MemberShipPlanMovie ON MemberShipPlanMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MemberShipPlanMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  MemberShipPlanMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002b11a", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM MemberShipPlanMovie
          WHERE
            /* %JoinFKPK(MemberShipPlanMovie,Movie," = "," AND") */
            MemberShipPlanMovie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MemberShipPlanMovie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MemberShipPlan  MemberShipPlanMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="MemberShipId" */
    IF EXISTS (SELECT * FROM deleted,MemberShipPlan
      WHERE
        /* %JoinFKPK(deleted,MemberShipPlan," = "," AND") */
        deleted.MemberShipId = MemberShipPlan.MemberShipid AND
        NOT EXISTS (
          SELECT * FROM MemberShipPlanMovie
          WHERE
            /* %JoinFKPK(MemberShipPlanMovie,MemberShipPlan," = "," AND") */
            MemberShipPlanMovie.MemberShipId = MemberShipPlan.MemberShipid
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MemberShipPlanMovie because MemberShipPlan exists.'
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


CREATE TRIGGER tU_MemberShipPlanMovie ON MemberShipPlanMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MemberShipPlanMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMemberShipId smallint, 
           @insMovieId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MemberShipPlanMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e87c", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MemberShipPlanMovie because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MemberShipPlan  MemberShipPlanMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MemberShipPlan"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_93", FK_COLUMNS="MemberShipId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MemberShipId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MemberShipPlan
        WHERE
          /* %JoinFKPK(inserted,MemberShipPlan) */
          inserted.MemberShipId = MemberShipPlan.MemberShipid
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MemberShipPlanMovie because MemberShipPlan does not exist.'
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




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  MemberShipPlanMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00070e8f", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MemberShipPlanMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  StreamingServiceMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_82", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because StreamingServiceMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  MemberShipPlanMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_80", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MemberShipPlanMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is a sequel to Movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="is a sequel to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  GenreMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,GenreMovie
      WHERE
        /*  %JoinFKPK(GenreMovie,deleted," = "," AND") */
        GenreMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because GenreMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  StreamingServiceMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="MovieId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because StreamingServiceMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is a sequel to Movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="is a sequel to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM Movie
          WHERE
            /* %JoinFKPK(Movie,Movie," = "," AND") */
            Movie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Movie because Movie exists.'
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


CREATE TRIGGER tU_Movie ON Movie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  MemberShipPlanMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0007eb1b", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_94", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MemberShipPlanMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  StreamingServiceMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_82", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because StreamingServiceMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  MemberShipPlanMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MemberShipPlanMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_80", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MemberShipPlanMovie
      WHERE
        /*  %JoinFKPK(MemberShipPlanMovie,deleted," = "," AND") */
        MemberShipPlanMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MemberShipPlanMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is a sequel to Movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="is a sequel to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Movie
      WHERE
        /*  %JoinFKPK(Movie,deleted," = "," AND") */
        Movie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because Movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  GenreMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="GenreMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,GenreMovie
      WHERE
        /*  %JoinFKPK(GenreMovie,deleted," = "," AND") */
        GenreMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because GenreMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  StreamingServiceMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="MovieId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.MovieId = deleted.MovieId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because StreamingServiceMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is a sequel to Movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="Movie"
    P2C_VERB_PHRASE="is a sequel to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_53", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.MovieId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Movie because Movie does not exist.'
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




CREATE TRIGGER tD_Payment ON Payment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Payment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Account makes a Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014dcf", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is accepted by an", 
    FK_CONSTRAINT="R_75", FK_COLUMNS="AccountId" */
    IF EXISTS (SELECT * FROM deleted,Account
      WHERE
        /* %JoinFKPK(deleted,Account," = "," AND") */
        deleted.AccountId = Account.AccountId AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Account," = "," AND") */
            Payment.AccountId = Account.AccountId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Account exists.'
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


CREATE TRIGGER tU_Payment ON Payment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Payment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspaymenttransactionnumber integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Account makes a Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016cfc", PARENT_OWNER="", PARENT_TABLE="Account"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="makes a", C2P_VERB_PHRASE="is accepted by an", 
    FK_CONSTRAINT="R_75", FK_COLUMNS="AccountId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(AccountId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Account
        WHERE
          /* %JoinFKPK(inserted,Account) */
          inserted.AccountId = Account.AccountId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Account does not exist.'
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




CREATE TRIGGER tD_PayMentOption ON PayMentOption FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PayMentOption */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PayMentOption is provided to an Account on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011fa5", PARENT_OWNER="", PARENT_TABLE="PayMentOption"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="is provided to an", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="PaymentOptionId" */
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.PaymentOptionId = deleted.PaymentOptionId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PayMentOption because Account exists.'
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


CREATE TRIGGER tU_PayMentOption ON PayMentOption FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PayMentOption */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPaymentOptionId integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PayMentOption is provided to an Account on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013db2", PARENT_OWNER="", PARENT_TABLE="PayMentOption"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="is provided to an", C2P_VERB_PHRASE="has a", 
    FK_CONSTRAINT="R_88", FK_COLUMNS="PaymentOptionId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PaymentOptionId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.PaymentOptionId = deleted.PaymentOptionId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PayMentOption because Account exists.'
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




CREATE TRIGGER tD_StreamingService ON StreamingService FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamingService */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* StreamingService  StreamingServiceMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000366df", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_81", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingService because StreamingServiceMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService has Account on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="StreamingServiceid" */
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.StreamingServiceid = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingService because Account exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService  StreamingServiceMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete StreamingService because StreamingServiceMovie exists.'
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


CREATE TRIGGER tU_StreamingService ON StreamingService FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamingService */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingServiceId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* StreamingService  StreamingServiceMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003c14d", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_81", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingService because StreamingServiceMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService has Account on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="Account"
    P2C_VERB_PHRASE="has", C2P_VERB_PHRASE="belongs to a", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="StreamingServiceid" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Account
      WHERE
        /*  %JoinFKPK(Account,deleted," = "," AND") */
        Account.StreamingServiceid = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingService because Account exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService  StreamingServiceMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamingServiceMovie
      WHERE
        /*  %JoinFKPK(StreamingServiceMovie,deleted," = "," AND") */
        StreamingServiceMovie.StreamingServiceId = deleted.StreamingServiceId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update StreamingService because StreamingServiceMovie exists.'
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




CREATE TRIGGER tD_StreamingServiceMovie ON StreamingServiceMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamingServiceMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  StreamingServiceMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005a354", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_82", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM StreamingServiceMovie
          WHERE
            /* %JoinFKPK(StreamingServiceMovie,Movie," = "," AND") */
            StreamingServiceMovie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingServiceMovie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService  StreamingServiceMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_81", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (SELECT * FROM deleted,StreamingService
      WHERE
        /* %JoinFKPK(deleted,StreamingService," = "," AND") */
        deleted.StreamingServiceId = StreamingService.StreamingServiceId AND
        NOT EXISTS (
          SELECT * FROM StreamingServiceMovie
          WHERE
            /* %JoinFKPK(StreamingServiceMovie,StreamingService," = "," AND") */
            StreamingServiceMovie.StreamingServiceId = StreamingService.StreamingServiceId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingServiceMovie because StreamingService exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  StreamingServiceMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="MovieId" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.MovieId = Movie.MovieId AND
        NOT EXISTS (
          SELECT * FROM StreamingServiceMovie
          WHERE
            /* %JoinFKPK(StreamingServiceMovie,Movie," = "," AND") */
            StreamingServiceMovie.MovieId = Movie.MovieId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingServiceMovie because Movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* StreamingService  StreamingServiceMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="StreamingServiceId" */
    IF EXISTS (SELECT * FROM deleted,StreamingService
      WHERE
        /* %JoinFKPK(deleted,StreamingService," = "," AND") */
        deleted.StreamingServiceId = StreamingService.StreamingServiceId AND
        NOT EXISTS (
          SELECT * FROM StreamingServiceMovie
          WHERE
            /* %JoinFKPK(StreamingServiceMovie,StreamingService," = "," AND") */
            StreamingServiceMovie.StreamingServiceId = StreamingService.StreamingServiceId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamingServiceMovie because StreamingService exists.'
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


CREATE TRIGGER tU_StreamingServiceMovie ON StreamingServiceMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamingServiceMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStreamingServiceId smallint, 
           @insMovieId smallint,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  StreamingServiceMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0005adc2", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_82", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingServiceMovie because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService  StreamingServiceMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_81", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingService
        WHERE
          /* %JoinFKPK(inserted,StreamingService) */
          inserted.StreamingServiceId = StreamingService.StreamingServiceId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingServiceMovie because StreamingService does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  StreamingServiceMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="MovieId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.MovieId = Movie.MovieId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingServiceMovie because Movie does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* StreamingService  StreamingServiceMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="StreamingService"
    CHILD_OWNER="", CHILD_TABLE="StreamingServiceMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="StreamingServiceId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StreamingServiceId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,StreamingService
        WHERE
          /* %JoinFKPK(inserted,StreamingService) */
          inserted.StreamingServiceId = StreamingService.StreamingServiceId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamingServiceMovie because StreamingService does not exist.'
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


