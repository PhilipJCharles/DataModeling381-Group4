
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

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [BitcoinPayment]
( 
	[WalletType]         varchar  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL ,
	[WalletAddress]      varchar(max)  NOT NULL 
)
go

CREATE TABLE [CreditCardPayment]
( 
	[CreditCardNumber]   integer  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL ,
	[CreditCardExpDate]  integer  NOT NULL ,
	[CreditCardCVV]      integer  NOT NULL 
)
go

CREATE TABLE [CUST]
( 
	[CUST_address]       [address] ,
	[CUST_city]          [city] ,
	[CUST_first_name]    [first_name] ,
	[CUST_last_name]     [last_name] ,
	[CUST_state]         [state] ,
	[CUST_zip_code]      [zip_code] ,
	[email]              varchar  NULL ,
	[CUST_number]        integer  NOT NULL ,
	[SubscriptionStatus] bit  NULL 
)
go

CREATE TABLE [Digital_Rental]
( 
	[RentalDuration]     char(18)  NULL ,
	[movie_number]       integer  NOT NULL 
)
go

CREATE TABLE [DigitalRental]
( 
	[RentalStartTime]    datetime  NOT NULL ,
	[RentalEndTime]      datetime  NOT NULL ,
	[RentalDuration]     integer  NOT NULL ,
	[EMovieNumber]       integer  NOT NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL 
)
go

CREATE TABLE [EBuy]
( 
	[ERentalType]        char(18)  NULL ,
	[movie_number]       integer  NOT NULL 
)
go

CREATE TABLE [EBuy]
( 
	[ERentalType]        varchar  NOT NULL ,
	[EMovieNumber]       integer  NOT NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL 
)
go

CREATE TABLE [EMP]
( 
	[EMP_first_name]     [first_name] ,
	[EMP_address]        [address] ,
	[EMP_phone]          [phone] ,
	[store_number]       integer  NULL ,
	[EMP_address_2]      [address_2] ,
	[email]              varchar(20)  NULL ,
	[salary]             integer  NULL ,
	[hire_date]          datetime  NULL ,
	[soc_sec_number]     integer  NULL ,
	[EMP_number]         varchar(20)  NOT NULL ,
	[supervisor]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [MO_RENT_REC]
( 
	[rental_date]        datetime  NULL ,
	[due_date]           datetime  NULL ,
	[rental_status]      varchar(20)  NULL ,
	[payment_transaction_number] integer  NOT NULL ,
	[overdue_charge]     integer  NULL ,
	[rental_rate]        integer  NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL ,
	[PaymentType]        varchar  NULL ,
	[RentalType]         char(18)  NULL 
)
go

CREATE TABLE [Movie]
( 
	[movie_title]        [title] ,
	[movie_director]     [director] ,
	[description]        varchar(20)  NULL ,
	[star_1_name]        [first_name] ,
	[rating]             varchar  NULL ,
	[star_2_name]        [first_name] ,
	[movie_number]       integer  NOT NULL ,
	[genre]              char  NULL ,
	[rental_rate]        numeric  NULL ,
	[movie_url]          varchar  NULL ,
	[movie_clip]         varbinary  NULL 
)
go

CREATE TABLE [MOVIE_COPY]
( 
	[general_condition]  varchar(20)  NULL ,
	[movie_format]       varchar(20)  NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_STORE]
( 
	[movie_number]       integer  NOT NULL ,
	[store_number]       integer  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[payment_transaction_number] integer  NOT NULL ,
	[payment_type]       char(18)  NULL ,
	[payment_amount]     numeric  NULL ,
	[payment_date]       datetime  NULL ,
	[EMP_number]         varchar(20)  NOT NULL ,
	[customer_no]        integer  NULL ,
	[epay_vendor_number] integer  NULL ,
	[epay_account_number] integer  NULL 
)
go

CREATE TABLE [PaypalPayment]
( 
	[PayPalUsername]     varchar  NULL ,
	[payment_transaction_number] integer  NOT NULL ,
	[PayPalPassword]     char(18)  NULL 
)
go

CREATE TABLE [PhysicalRental]
( 
	[StoreNumber]        integer  NULL ,
	[store_number]       integer  NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL 
)
go

CREATE TABLE [STORE]
( 
	[store_manager]      [manager] ,
	[store_address]      [address] ,
	[store_address_2]    [address_2] ,
	[store_phone]        [phone] ,
	[store_city]         [city] ,
	[store_state]        [state] ,
	[store_zip_code]     [zip_code] ,
	[store_number]       integer  NOT NULL 
)
go

CREATE TABLE [StreamMovie]
( 
	[SubscriptionStatus] char(18)  NULL ,
	[movie_number]       integer  NOT NULL 
)
go

CREATE TABLE [StreamMovie]
( 
	[SubscriptionStatus] bit  NOT NULL ,
	[NumTimesWatched]    integer  NOT NULL ,
	[EMovieNumber]       integer  NOT NULL ,
	[CUST_number]        integer  NOT NULL ,
	[rental_record_date] datetime  NOT NULL ,
	[mo_co_num]          integer  NOT NULL ,
	[movie_number]       integer  NOT NULL ,
	[EMP_phone]          [phone]  NOT NULL ,
	[soc_sec_number]     integer  NOT NULL ,
	[payment_transaction_number] integer  NOT NULL 
)
go

ALTER TABLE [BitcoinPayment]
	ADD CONSTRAINT [XPKBitcoinPayment] PRIMARY KEY  CLUSTERED ([payment_transaction_number] ASC)
go

ALTER TABLE [CreditCardPayment]
	ADD CONSTRAINT [XPKCreditCardPayment] PRIMARY KEY  CLUSTERED ([payment_transaction_number] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCUSTOMER] PRIMARY KEY  CLUSTERED ([CUST_number] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XAK1CUSTOMER] UNIQUE ([CUST_address]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1CUSTOMER] ON [CUST]
( 
	[CUST_last_name]      ASC
)
go

ALTER TABLE [Digital_Rental]
	ADD CONSTRAINT [XPKDigital_Rental] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [DigitalRental]
	ADD CONSTRAINT [XPKDigitalRental] PRIMARY KEY  CLUSTERED ([EMovieNumber] ASC,[rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[EMP_phone] ASC,[soc_sec_number] ASC,[CUST_number] ASC,[payment_transaction_number] ASC)
go

ALTER TABLE [EBuy]
	ADD CONSTRAINT [XPKEBuy] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [EBuy]
	ADD CONSTRAINT [XPKEBuy] PRIMARY KEY  CLUSTERED ([EMovieNumber] ASC,[rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[EMP_phone] ASC,[soc_sec_number] ASC,[CUST_number] ASC,[payment_transaction_number] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XPKEMPLOYEE] PRIMARY KEY  CLUSTERED ([EMP_number] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XAK1EMPLOYEE] UNIQUE ([soc_sec_number]  ASC,[EMP_phone]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1EMPLOYEE] ON [EMP]
( 
	[EMP_first_name]      ASC
)
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [XPKMOVIE_RENTAL_RECORD] PRIMARY KEY  CLUSTERED ([rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[soc_sec_number] ASC,[EMP_phone] ASC,[CUST_number] ASC,[payment_transaction_number] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XPKMovie] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [Movie]
	ADD CONSTRAINT [XAK1Movie] UNIQUE ([movie_title]  ASC)
go

ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [XPKMOVIE_COPY] PRIMARY KEY  CLUSTERED ([mo_co_num] ASC,[movie_number] ASC)
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [XPKMOVIE_STORE] PRIMARY KEY  CLUSTERED ([movie_number] ASC,[store_number] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPAYMENT] PRIMARY KEY  CLUSTERED ([payment_transaction_number] ASC)
go

ALTER TABLE [PaypalPayment]
	ADD CONSTRAINT [XPKPaypalPayment] PRIMARY KEY  CLUSTERED ([payment_transaction_number] ASC)
go

ALTER TABLE [PhysicalRental]
	ADD CONSTRAINT [XPKPhysicalRental] PRIMARY KEY  CLUSTERED ([rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[EMP_phone] ASC,[soc_sec_number] ASC,[CUST_number] ASC,[payment_transaction_number] ASC)
go

ALTER TABLE [STORE]
	ADD CONSTRAINT [XPKSTORE] PRIMARY KEY  CLUSTERED ([store_number] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1STORE] ON [STORE]
( 
	[store_manager]       ASC
)
go

ALTER TABLE [StreamMovie]
	ADD CONSTRAINT [XPKStreamMovie] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [StreamMovie]
	ADD CONSTRAINT [XPKStreamMovie] PRIMARY KEY  CLUSTERED ([EMovieNumber] ASC,[rental_record_date] ASC,[mo_co_num] ASC,[movie_number] ASC,[EMP_phone] ASC,[soc_sec_number] ASC,[CUST_number] ASC,[payment_transaction_number] ASC)
go

CREATE VIEW [CUSTOMER_INVOICE]([CreditCardNumber],[CUST_number],[CUST_address],[email],[CUST_city],[CUST_first_name],[CUST_last_name],[CUST_state],[CUST_zip_code],[rental_record_date],[mo_co_num],[movie_number],[rental_date],[due_date],[rental_status],[overdue_charge],[rental_rate],[movie_title],[Overdue_Charge_Rate])
AS
SELECT ALL [CreditCardPayment].[CreditCardNumber],[CUST].[CUST_number],[CUST].[CUST_address],[CUST].[email],[CUST].[CUST_city],[CUST].[CUST_first_name],[CUST].[CUST_last_name],[CUST].[CUST_state],[CUST].[CUST_zip_code],[MO_RENT_REC].[rental_record_date],[MO_RENT_REC].[mo_co_num],[MO_RENT_REC].[movie_number],[MO_RENT_REC].[rental_date],[MO_RENT_REC].[due_date],[MO_RENT_REC].[rental_status],[MO_RENT_REC].[overdue_charge],[MO_RENT_REC].[rental_rate],[Movie].[movie_title],rental_rate * 1.5
	FROM [CreditCardPayment],[CUST],[MO_RENT_REC],[Movie]
go

CREATE VIEW [OVERDUE_NOTICE]([CreditCardNumber],[Overdue_Charge_Rate],[CUST_number],[CUST_address],[email],[CUST_city],[CUST_first_name],[CUST_last_name],[CUST_state],[CUST_zip_code],[rental_record_date],[mo_co_num],[movie_number],[rental_date],[due_date],[rental_status],[overdue_charge],[rental_rate])
AS
SELECT ALL [CreditCardPayment].[CreditCardNumber],rental_rate * 1.5,[CUST].[CUST_number],[CUST].[CUST_address],[CUST].[email],[CUST].[CUST_city],[CUST].[CUST_first_name],[CUST].[CUST_last_name],[CUST].[CUST_state],[CUST].[CUST_zip_code],[MO_RENT_REC].[rental_record_date],[MO_RENT_REC].[mo_co_num],[MO_RENT_REC].[movie_number],[MO_RENT_REC].[rental_date],[MO_RENT_REC].[due_date],[MO_RENT_REC].[rental_status],[MO_RENT_REC].[overdue_charge],[MO_RENT_REC].[rental_rate]
	FROM [CreditCardPayment],[CUST],[MO_RENT_REC]
go


ALTER TABLE [BitcoinPayment]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PAYMENT]([payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [CreditCardPayment]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PAYMENT]([payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Digital_Rental]
	ADD CONSTRAINT [R_42] FOREIGN KEY ([movie_number]) REFERENCES [EBuy]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [DigitalRental]
	ADD CONSTRAINT [R_45] FOREIGN KEY ([EMovieNumber],[rental_record_date],[mo_co_num],[movie_number],[EMP_phone],[soc_sec_number],[CUST_number],[payment_transaction_number]) REFERENCES [EBuy]([EMovieNumber],[rental_record_date],[mo_co_num],[movie_number],[EMP_phone],[soc_sec_number],[CUST_number],[payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [EBuy]
	ADD CONSTRAINT [R_50] FOREIGN KEY ([movie_number]) REFERENCES [Movie]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [EBuy]
	ADD CONSTRAINT [R_55] FOREIGN KEY ([rental_record_date],[mo_co_num],[movie_number],[soc_sec_number],[EMP_phone],[CUST_number],[payment_transaction_number]) REFERENCES [MO_RENT_REC]([rental_record_date],[mo_co_num],[movie_number],[soc_sec_number],[EMP_phone],[CUST_number],[payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [EMP]
	ADD CONSTRAINT [FK_Emp_STORE] FOREIGN KEY ([store_number]) REFERENCES [STORE]([store_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [FK_Emp_EMP] FOREIGN KEY ([supervisor]) REFERENCES [EMP]([EMP_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_EMP] FOREIGN KEY ([soc_sec_number],[EMP_phone]) REFERENCES [EMP]([soc_sec_number],[EMP_phone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_MOVIE_COPY] FOREIGN KEY ([mo_co_num],[movie_number]) REFERENCES [MOVIE_COPY]([mo_co_num],[movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_CUST] FOREIGN KEY ([CUST_number]) REFERENCES [CUST]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_PAYMENT] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PAYMENT]([payment_transaction_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [FK_MoRentRec_CUST_CREDIT] FOREIGN KEY ([payment_transaction_number]) REFERENCES [CreditCardPayment]([payment_transaction_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_33] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PaypalPayment]([payment_transaction_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_34] FOREIGN KEY ([payment_transaction_number]) REFERENCES [BitcoinPayment]([payment_transaction_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Movie_genre]', '[Movie].[genre]'
go


ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [FK_MovieCopy_MOVIE] FOREIGN KEY ([movie_number]) REFERENCES [Movie]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [FK_Movie_Store_MOVIE] FOREIGN KEY ([movie_number]) REFERENCES [Movie]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [FK_Movie_Store_STORE] FOREIGN KEY ([store_number]) REFERENCES [STORE]([store_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_Payment_EMP] FOREIGN KEY ([EMP_number]) REFERENCES [EMP]([EMP_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [FK_Payment_CUST] FOREIGN KEY ([customer_no]) REFERENCES [CUST]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PaypalPayment]
	ADD CONSTRAINT [R_39] FOREIGN KEY ([payment_transaction_number]) REFERENCES [PAYMENT]([payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [PhysicalRental]
	ADD CONSTRAINT [R_49] FOREIGN KEY ([store_number]) REFERENCES [STORE]([store_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PhysicalRental]
	ADD CONSTRAINT [R_56] FOREIGN KEY ([rental_record_date],[mo_co_num],[movie_number],[soc_sec_number],[EMP_phone],[CUST_number],[payment_transaction_number]) REFERENCES [MO_RENT_REC]([rental_record_date],[mo_co_num],[movie_number],[soc_sec_number],[EMP_phone],[CUST_number],[payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [StreamMovie]
	ADD CONSTRAINT [R_43] FOREIGN KEY ([movie_number]) REFERENCES [EBuy]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [StreamMovie]
	ADD CONSTRAINT [R_44] FOREIGN KEY ([EMovieNumber],[rental_record_date],[mo_co_num],[movie_number],[EMP_phone],[soc_sec_number],[CUST_number],[payment_transaction_number]) REFERENCES [EBuy]([EMovieNumber],[rental_record_date],[mo_co_num],[movie_number],[EMP_phone],[soc_sec_number],[CUST_number],[payment_transaction_number])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [StreamMovie]
	ADD CONSTRAINT [R_54] FOREIGN KEY ([CUST_number]) REFERENCES [CUST]([CUST_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_BitcoinPayment ON BitcoinPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on BitcoinPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* BitcoinPayment record is sent to MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000293dc", PARENT_OWNER="", PARENT_TABLE="BitcoinPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BitcoinPayment because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PAYMENT  BitcoinPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="BitcoinPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.payment_transaction_number = PAYMENT.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM BitcoinPayment
          WHERE
            /* %JoinFKPK(BitcoinPayment,PAYMENT," = "," AND") */
            BitcoinPayment.payment_transaction_number = PAYMENT.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BitcoinPayment because PAYMENT exists.'
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


CREATE TRIGGER tU_BitcoinPayment ON BitcoinPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on BitcoinPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* BitcoinPayment record is sent to MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b0ca", PARENT_OWNER="", PARENT_TABLE="BitcoinPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BitcoinPayment because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  BitcoinPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="BitcoinPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.payment_transaction_number = PAYMENT.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BitcoinPayment because PAYMENT does not exist.'
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




CREATE TRIGGER tD_CreditCardPayment ON CreditCardPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CreditCardPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CreditCardPayment record is sent to MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000298dd", PARENT_OWNER="", PARENT_TABLE="CreditCardPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CreditCardPayment because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PAYMENT  CreditCardPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CreditCardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.payment_transaction_number = PAYMENT.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM CreditCardPayment
          WHERE
            /* %JoinFKPK(CreditCardPayment,PAYMENT," = "," AND") */
            CreditCardPayment.payment_transaction_number = PAYMENT.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CreditCardPayment because PAYMENT exists.'
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


CREATE TRIGGER tU_CreditCardPayment ON CreditCardPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CreditCardPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CreditCardPayment record is sent to MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002e077", PARENT_OWNER="", PARENT_TABLE="CreditCardPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CreditCardPayment because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  CreditCardPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CreditCardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.payment_transaction_number = PAYMENT.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CreditCardPayment because PAYMENT does not exist.'
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
    /* CUST  StreamMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00031934", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CUST_number" */
    IF EXISTS (
      SELECT * FROM deleted,StreamMovie
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because StreamMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="customer_no" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CUST_number
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
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CUST_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
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
           @insCUST_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST  StreamMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003567d", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamMovie
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.CUST_number = deleted.CUST_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because StreamMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="customer_no" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CUST_number
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
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CUST_number = deleted.CUST_number
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




CREATE TRIGGER tD_Digital_Rental ON Digital_Rental FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Digital_Rental */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EBuy  Digital_Rental on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014638", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="Digital_Rental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,EBuy
      WHERE
        /* %JoinFKPK(deleted,EBuy," = "," AND") */
        deleted.movie_number = EBuy.movie_number AND
        NOT EXISTS (
          SELECT * FROM Digital_Rental
          WHERE
            /* %JoinFKPK(Digital_Rental,EBuy," = "," AND") */
            Digital_Rental.movie_number = EBuy.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Digital_Rental because EBuy exists.'
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


CREATE TRIGGER tU_Digital_Rental ON Digital_Rental FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Digital_Rental */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EBuy  Digital_Rental on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016b4a", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="Digital_Rental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EBuy
        WHERE
          /* %JoinFKPK(inserted,EBuy) */
          inserted.movie_number = EBuy.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Digital_Rental because EBuy does not exist.'
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




CREATE TRIGGER tD_DigitalRental ON DigitalRental FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on DigitalRental */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EBuy  DigitalRental on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e801", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="DigitalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
    IF EXISTS (SELECT * FROM deleted,EBuy
      WHERE
        /* %JoinFKPK(deleted,EBuy," = "," AND") */
        deleted.EMovieNumber = EBuy.EMovieNumber AND
        deleted.rental_record_date = EBuy.rental_record_date AND
        deleted.mo_co_num = EBuy.mo_co_num AND
        deleted.movie_number = EBuy.movie_number AND
        deleted.EMP_phone = EBuy.EMP_phone AND
        deleted.soc_sec_number = EBuy.soc_sec_number AND
        deleted.CUST_number = EBuy.CUST_number AND
        deleted.payment_transaction_number = EBuy.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM DigitalRental
          WHERE
            /* %JoinFKPK(DigitalRental,EBuy," = "," AND") */
            DigitalRental.EMovieNumber = EBuy.EMovieNumber AND
            DigitalRental.rental_record_date = EBuy.rental_record_date AND
            DigitalRental.mo_co_num = EBuy.mo_co_num AND
            DigitalRental.movie_number = EBuy.movie_number AND
            DigitalRental.EMP_phone = EBuy.EMP_phone AND
            DigitalRental.soc_sec_number = EBuy.soc_sec_number AND
            DigitalRental.CUST_number = EBuy.CUST_number AND
            DigitalRental.payment_transaction_number = EBuy.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last DigitalRental because EBuy exists.'
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


CREATE TRIGGER tU_DigitalRental ON DigitalRental FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on DigitalRental */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMovieNumber integer, 
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @insCUST_number integer, 
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EBuy  DigitalRental on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002888e", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="DigitalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMovieNumber) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(CUST_number) OR
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EBuy
        WHERE
          /* %JoinFKPK(inserted,EBuy) */
          inserted.EMovieNumber = EBuy.EMovieNumber and
          inserted.rental_record_date = EBuy.rental_record_date and
          inserted.mo_co_num = EBuy.mo_co_num and
          inserted.movie_number = EBuy.movie_number and
          inserted.EMP_phone = EBuy.EMP_phone and
          inserted.soc_sec_number = EBuy.soc_sec_number and
          inserted.CUST_number = EBuy.CUST_number and
          inserted.payment_transaction_number = EBuy.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update DigitalRental because EBuy does not exist.'
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




CREATE TRIGGER tD_EBuy ON EBuy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EBuy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EBuy  StreamMovie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003209d", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,StreamMovie
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EBuy because StreamMovie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EBuy  Digital_Rental on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="Digital_Rental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,Digital_Rental
      WHERE
        /*  %JoinFKPK(Digital_Rental,deleted," = "," AND") */
        Digital_Rental.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EBuy because Digital_Rental exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie  EBuy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.movie_number = Movie.movie_number AND
        NOT EXISTS (
          SELECT * FROM EBuy
          WHERE
            /* %JoinFKPK(EBuy,Movie," = "," AND") */
            EBuy.movie_number = Movie.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EBuy because Movie exists.'
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


CREATE TRIGGER tU_EBuy ON EBuy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EBuy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EBuy  StreamMovie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00038e3a", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,StreamMovie
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EBuy because StreamMovie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EBuy  Digital_Rental on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="Digital_Rental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_42", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Digital_Rental
      WHERE
        /*  %JoinFKPK(Digital_Rental,deleted," = "," AND") */
        Digital_Rental.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EBuy because Digital_Rental exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie  EBuy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.movie_number = Movie.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EBuy because Movie does not exist.'
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




CREATE TRIGGER tD_EBuy ON EBuy FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EBuy */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EBuy  DigitalRental on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00062673", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="DigitalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
    DELETE DigitalRental
      FROM DigitalRental,deleted
      WHERE
        /*  %JoinFKPK(DigitalRental,deleted," = "," AND") */
        DigitalRental.EMovieNumber = deleted.EMovieNumber AND
        DigitalRental.rental_record_date = deleted.rental_record_date AND
        DigitalRental.mo_co_num = deleted.mo_co_num AND
        DigitalRental.movie_number = deleted.movie_number AND
        DigitalRental.EMP_phone = deleted.EMP_phone AND
        DigitalRental.soc_sec_number = deleted.soc_sec_number AND
        DigitalRental.CUST_number = deleted.CUST_number AND
        DigitalRental.payment_transaction_number = deleted.payment_transaction_number

    /* erwin Builtin Trigger */
    /* EBuy  StreamMovie on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
    DELETE StreamMovie
      FROM StreamMovie,deleted
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.EMovieNumber = deleted.EMovieNumber AND
        StreamMovie.rental_record_date = deleted.rental_record_date AND
        StreamMovie.mo_co_num = deleted.mo_co_num AND
        StreamMovie.movie_number = deleted.movie_number AND
        StreamMovie.EMP_phone = deleted.EMP_phone AND
        StreamMovie.soc_sec_number = deleted.soc_sec_number AND
        StreamMovie.CUST_number = deleted.CUST_number AND
        StreamMovie.payment_transaction_number = deleted.payment_transaction_number

    /* erwin Builtin Trigger */
    /* MO_RENT_REC  EBuy on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
    IF EXISTS (SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /* %JoinFKPK(deleted,MO_RENT_REC," = "," AND") */
        deleted.payment_transaction_number = MO_RENT_REC.payment_transaction_number AND
        deleted.EMP_phone = MO_RENT_REC.EMP_phone AND
        deleted.soc_sec_number = MO_RENT_REC.soc_sec_number AND
        deleted.rental_record_date = MO_RENT_REC.rental_record_date AND
        deleted.mo_co_num = MO_RENT_REC.mo_co_num AND
        deleted.movie_number = MO_RENT_REC.movie_number AND
        deleted.CUST_number = MO_RENT_REC.CUST_number AND
        NOT EXISTS (
          SELECT * FROM EBuy
          WHERE
            /* %JoinFKPK(EBuy,MO_RENT_REC," = "," AND") */
            EBuy.payment_transaction_number = MO_RENT_REC.payment_transaction_number AND
            EBuy.EMP_phone = MO_RENT_REC.EMP_phone AND
            EBuy.soc_sec_number = MO_RENT_REC.soc_sec_number AND
            EBuy.rental_record_date = MO_RENT_REC.rental_record_date AND
            EBuy.mo_co_num = MO_RENT_REC.mo_co_num AND
            EBuy.movie_number = MO_RENT_REC.movie_number AND
            EBuy.CUST_number = MO_RENT_REC.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EBuy because MO_RENT_REC exists.'
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


CREATE TRIGGER tU_EBuy ON EBuy FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EBuy */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMovieNumber integer, 
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @insCUST_number integer, 
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EBuy  DigitalRental on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="000a69b6", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="DigitalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_45", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMovieNumber) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(CUST_number) OR
    UPDATE(payment_transaction_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insEMovieNumber = inserted.EMovieNumber, 
             @insrental_record_date = inserted.rental_record_date, 
             @insmo_co_num = inserted.mo_co_num, 
             @insmovie_number = inserted.movie_number, 
             @insEMP_phone = inserted.EMP_phone, 
             @inssoc_sec_number = inserted.soc_sec_number, 
             @insCUST_number = inserted.CUST_number, 
             @inspayment_transaction_number = inserted.payment_transaction_number
        FROM inserted
      UPDATE DigitalRental
      SET
        /*  %JoinFKPK(DigitalRental,@ins," = ",",") */
        DigitalRental.EMovieNumber = @insEMovieNumber,
        DigitalRental.rental_record_date = @insrental_record_date,
        DigitalRental.mo_co_num = @insmo_co_num,
        DigitalRental.movie_number = @insmovie_number,
        DigitalRental.EMP_phone = @insEMP_phone,
        DigitalRental.soc_sec_number = @inssoc_sec_number,
        DigitalRental.CUST_number = @insCUST_number,
        DigitalRental.payment_transaction_number = @inspayment_transaction_number
      FROM DigitalRental,inserted,deleted
      WHERE
        /*  %JoinFKPK(DigitalRental,deleted," = "," AND") */
        DigitalRental.EMovieNumber = deleted.EMovieNumber AND
        DigitalRental.rental_record_date = deleted.rental_record_date AND
        DigitalRental.mo_co_num = deleted.mo_co_num AND
        DigitalRental.movie_number = deleted.movie_number AND
        DigitalRental.EMP_phone = deleted.EMP_phone AND
        DigitalRental.soc_sec_number = deleted.soc_sec_number AND
        DigitalRental.CUST_number = deleted.CUST_number AND
        DigitalRental.payment_transaction_number = deleted.payment_transaction_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade EBuy update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EBuy  StreamMovie on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMovieNumber) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(CUST_number) OR
    UPDATE(payment_transaction_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insEMovieNumber = inserted.EMovieNumber, 
             @insrental_record_date = inserted.rental_record_date, 
             @insmo_co_num = inserted.mo_co_num, 
             @insmovie_number = inserted.movie_number, 
             @insEMP_phone = inserted.EMP_phone, 
             @inssoc_sec_number = inserted.soc_sec_number, 
             @insCUST_number = inserted.CUST_number, 
             @inspayment_transaction_number = inserted.payment_transaction_number
        FROM inserted
      UPDATE StreamMovie
      SET
        /*  %JoinFKPK(StreamMovie,@ins," = ",",") */
        StreamMovie.EMovieNumber = @insEMovieNumber,
        StreamMovie.rental_record_date = @insrental_record_date,
        StreamMovie.mo_co_num = @insmo_co_num,
        StreamMovie.movie_number = @insmovie_number,
        StreamMovie.EMP_phone = @insEMP_phone,
        StreamMovie.soc_sec_number = @inssoc_sec_number,
        StreamMovie.CUST_number = @insCUST_number,
        StreamMovie.payment_transaction_number = @inspayment_transaction_number
      FROM StreamMovie,inserted,deleted
      WHERE
        /*  %JoinFKPK(StreamMovie,deleted," = "," AND") */
        StreamMovie.EMovieNumber = deleted.EMovieNumber AND
        StreamMovie.rental_record_date = deleted.rental_record_date AND
        StreamMovie.mo_co_num = deleted.mo_co_num AND
        StreamMovie.movie_number = deleted.movie_number AND
        StreamMovie.EMP_phone = deleted.EMP_phone AND
        StreamMovie.soc_sec_number = deleted.soc_sec_number AND
        StreamMovie.CUST_number = deleted.CUST_number AND
        StreamMovie.payment_transaction_number = deleted.payment_transaction_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade EBuy update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MO_RENT_REC  EBuy on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MO_RENT_REC
        WHERE
          /* %JoinFKPK(inserted,MO_RENT_REC) */
          inserted.payment_transaction_number = MO_RENT_REC.payment_transaction_number and
          inserted.EMP_phone = MO_RENT_REC.EMP_phone and
          inserted.soc_sec_number = MO_RENT_REC.soc_sec_number and
          inserted.rental_record_date = MO_RENT_REC.rental_record_date and
          inserted.mo_co_num = MO_RENT_REC.mo_co_num and
          inserted.movie_number = MO_RENT_REC.movie_number and
          inserted.CUST_number = MO_RENT_REC.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EBuy because MO_RENT_REC does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="00053f19", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EMP_number" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_number = deleted.EMP_number
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
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="supervisor" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.supervisor = deleted.EMP_number
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
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="soc_sec_number""EMP_phone" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_phone = deleted.EMP_phone AND
        MO_RENT_REC.soc_sec_number = deleted.soc_sec_number
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
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="supervisor" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.supervisor = EMP.EMP_number AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,EMP," = "," AND") */
            EMP.supervisor = EMP.EMP_number
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
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="store_number" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.store_number = STORE.store_number AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,STORE," = "," AND") */
            EMP.store_number = STORE.store_number
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
           @insEMP_number varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00062d2c", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EMP_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_number = deleted.EMP_number
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
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="supervisor" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.supervisor = deleted.EMP_number
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
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="soc_sec_number""EMP_phone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_phone = deleted.EMP_phone AND
        MO_RENT_REC.soc_sec_number = deleted.soc_sec_number
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
    FK_CONSTRAINT="FK_Emp_EMP", FK_COLUMNS="supervisor" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(supervisor)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.supervisor = EMP.EMP_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.supervisor IS NULL
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
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="store_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.store_number = STORE.store_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.store_number IS NULL
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




CREATE TRIGGER tD_MO_RENT_REC ON MO_RENT_REC FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MO_RENT_REC  PhysicalRental on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000d6c2f", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
    DELETE PhysicalRental
      FROM PhysicalRental,deleted
      WHERE
        /*  %JoinFKPK(PhysicalRental,deleted," = "," AND") */
        PhysicalRental.payment_transaction_number = deleted.payment_transaction_number AND
        PhysicalRental.EMP_phone = deleted.EMP_phone AND
        PhysicalRental.soc_sec_number = deleted.soc_sec_number AND
        PhysicalRental.rental_record_date = deleted.rental_record_date AND
        PhysicalRental.mo_co_num = deleted.mo_co_num AND
        PhysicalRental.movie_number = deleted.movie_number AND
        PhysicalRental.CUST_number = deleted.CUST_number

    /* erwin Builtin Trigger */
    /* MO_RENT_REC  EBuy on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
    DELETE EBuy
      FROM EBuy,deleted
      WHERE
        /*  %JoinFKPK(EBuy,deleted," = "," AND") */
        EBuy.payment_transaction_number = deleted.payment_transaction_number AND
        EBuy.EMP_phone = deleted.EMP_phone AND
        EBuy.soc_sec_number = deleted.soc_sec_number AND
        EBuy.rental_record_date = deleted.rental_record_date AND
        EBuy.mo_co_num = deleted.mo_co_num AND
        EBuy.movie_number = deleted.movie_number AND
        EBuy.CUST_number = deleted.CUST_number

    /* erwin Builtin Trigger */
    /* BitcoinPayment record is sent to MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BitcoinPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,BitcoinPayment
      WHERE
        /* %JoinFKPK(deleted,BitcoinPayment," = "," AND") */
        deleted.payment_transaction_number = BitcoinPayment.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,BitcoinPayment," = "," AND") */
            MO_RENT_REC.payment_transaction_number = BitcoinPayment.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because BitcoinPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PaypalPayment record is sent to MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PaypalPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PaypalPayment
      WHERE
        /* %JoinFKPK(deleted,PaypalPayment," = "," AND") */
        deleted.payment_transaction_number = PaypalPayment.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,PaypalPayment," = "," AND") */
            MO_RENT_REC.payment_transaction_number = PaypalPayment.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because PaypalPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.payment_transaction_number = PAYMENT.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,PAYMENT," = "," AND") */
            MO_RENT_REC.payment_transaction_number = PAYMENT.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CreditCardPayment record is sent to MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCardPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,CreditCardPayment
      WHERE
        /* %JoinFKPK(deleted,CreditCardPayment," = "," AND") */
        deleted.payment_transaction_number = CreditCardPayment.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CreditCardPayment," = "," AND") */
            MO_RENT_REC.payment_transaction_number = CreditCardPayment.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CreditCardPayment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CUST_number" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUST_number = CUST.CUST_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST," = "," AND") */
            MO_RENT_REC.CUST_number = CUST.CUST_number
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
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="mo_co_num""movie_number" */
    IF EXISTS (SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /* %JoinFKPK(deleted,MOVIE_COPY," = "," AND") */
        deleted.mo_co_num = MOVIE_COPY.mo_co_num AND
        deleted.movie_number = MOVIE_COPY.movie_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,MOVIE_COPY," = "," AND") */
            MO_RENT_REC.mo_co_num = MOVIE_COPY.mo_co_num AND
            MO_RENT_REC.movie_number = MOVIE_COPY.movie_number
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
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="soc_sec_number""EMP_phone" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_phone = EMP.EMP_phone AND
        deleted.soc_sec_number = EMP.soc_sec_number AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,EMP," = "," AND") */
            MO_RENT_REC.EMP_phone = EMP.EMP_phone AND
            MO_RENT_REC.soc_sec_number = EMP.soc_sec_number
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
           @inspayment_transaction_number integer, 
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insCUST_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MO_RENT_REC  PhysicalRental on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0011f401", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(CUST_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @inspayment_transaction_number = inserted.payment_transaction_number, 
             @insEMP_phone = inserted.EMP_phone, 
             @inssoc_sec_number = inserted.soc_sec_number, 
             @insrental_record_date = inserted.rental_record_date, 
             @insmo_co_num = inserted.mo_co_num, 
             @insmovie_number = inserted.movie_number, 
             @insCUST_number = inserted.CUST_number
        FROM inserted
      UPDATE PhysicalRental
      SET
        /*  %JoinFKPK(PhysicalRental,@ins," = ",",") */
        PhysicalRental.payment_transaction_number = @inspayment_transaction_number,
        PhysicalRental.EMP_phone = @insEMP_phone,
        PhysicalRental.soc_sec_number = @inssoc_sec_number,
        PhysicalRental.rental_record_date = @insrental_record_date,
        PhysicalRental.mo_co_num = @insmo_co_num,
        PhysicalRental.movie_number = @insmovie_number,
        PhysicalRental.CUST_number = @insCUST_number
      FROM PhysicalRental,inserted,deleted
      WHERE
        /*  %JoinFKPK(PhysicalRental,deleted," = "," AND") */
        PhysicalRental.payment_transaction_number = deleted.payment_transaction_number AND
        PhysicalRental.EMP_phone = deleted.EMP_phone AND
        PhysicalRental.soc_sec_number = deleted.soc_sec_number AND
        PhysicalRental.rental_record_date = deleted.rental_record_date AND
        PhysicalRental.mo_co_num = deleted.mo_co_num AND
        PhysicalRental.movie_number = deleted.movie_number AND
        PhysicalRental.CUST_number = deleted.CUST_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade MO_RENT_REC update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MO_RENT_REC  EBuy on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(CUST_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @inspayment_transaction_number = inserted.payment_transaction_number, 
             @insEMP_phone = inserted.EMP_phone, 
             @inssoc_sec_number = inserted.soc_sec_number, 
             @insrental_record_date = inserted.rental_record_date, 
             @insmo_co_num = inserted.mo_co_num, 
             @insmovie_number = inserted.movie_number, 
             @insCUST_number = inserted.CUST_number
        FROM inserted
      UPDATE EBuy
      SET
        /*  %JoinFKPK(EBuy,@ins," = ",",") */
        EBuy.payment_transaction_number = @inspayment_transaction_number,
        EBuy.EMP_phone = @insEMP_phone,
        EBuy.soc_sec_number = @inssoc_sec_number,
        EBuy.rental_record_date = @insrental_record_date,
        EBuy.mo_co_num = @insmo_co_num,
        EBuy.movie_number = @insmovie_number,
        EBuy.CUST_number = @insCUST_number
      FROM EBuy,inserted,deleted
      WHERE
        /*  %JoinFKPK(EBuy,deleted," = "," AND") */
        EBuy.payment_transaction_number = deleted.payment_transaction_number AND
        EBuy.EMP_phone = deleted.EMP_phone AND
        EBuy.soc_sec_number = deleted.soc_sec_number AND
        EBuy.rental_record_date = deleted.rental_record_date AND
        EBuy.mo_co_num = deleted.mo_co_num AND
        EBuy.movie_number = deleted.movie_number AND
        EBuy.CUST_number = deleted.CUST_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade MO_RENT_REC update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* BitcoinPayment record is sent to MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="BitcoinPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BitcoinPayment
        WHERE
          /* %JoinFKPK(inserted,BitcoinPayment) */
          inserted.payment_transaction_number = BitcoinPayment.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because BitcoinPayment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PaypalPayment record is sent to MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PaypalPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PaypalPayment
        WHERE
          /* %JoinFKPK(inserted,PaypalPayment) */
          inserted.payment_transaction_number = PaypalPayment.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because PaypalPayment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.payment_transaction_number = PAYMENT.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because PAYMENT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CreditCardPayment record is sent to MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CreditCardPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_MoRentRec_CUST_CREDIT", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CreditCardPayment
        WHERE
          /* %JoinFKPK(inserted,CreditCardPayment) */
          inserted.payment_transaction_number = CreditCardPayment.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CreditCardPayment does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="FK_MoRentRec_CUST", FK_COLUMNS="CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUST_number = CUST.CUST_number
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
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="mo_co_num""movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(mo_co_num) OR
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE_COPY
        WHERE
          /* %JoinFKPK(inserted,MOVIE_COPY) */
          inserted.mo_co_num = MOVIE_COPY.mo_co_num and
          inserted.movie_number = MOVIE_COPY.movie_number
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
    FK_CONSTRAINT="FK_MoRentRec_EMP", FK_COLUMNS="soc_sec_number""EMP_phone" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_phone = EMP.EMP_phone and
          inserted.soc_sec_number = EMP.soc_sec_number
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




CREATE TRIGGER tD_Movie ON Movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movie  EBuy on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00030704", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,EBuy
      WHERE
        /*  %JoinFKPK(EBuy,deleted," = "," AND") */
        EBuy.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because EBuy exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MOVIE_COPY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movie because MOVIE_COPY exists.'
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
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movie  EBuy on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003651d", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="EBuy"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EBuy
      WHERE
        /*  %JoinFKPK(EBuy,deleted," = "," AND") */
        EBuy.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because EBuy exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MOVIE_COPY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movie because MOVIE_COPY exists.'
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
    /* ERWIN_RELATION:CHECKSUM="00027ef9", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="mo_co_num""movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.mo_co_num = deleted.mo_co_num AND
        MO_RENT_REC.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie is rented as MOVIE_COPY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.movie_number = Movie.movie_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_COPY
          WHERE
            /* %JoinFKPK(MOVIE_COPY,Movie," = "," AND") */
            MOVIE_COPY.movie_number = Movie.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_COPY because Movie exists.'
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
           @insmo_co_num integer, 
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d826", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="FK_MoRentRec_MOVIE_COPY", FK_COLUMNS="mo_co_num""movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(mo_co_num) OR
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.mo_co_num = deleted.mo_co_num AND
        MO_RENT_REC.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie is rented as MOVIE_COPY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="FK_MovieCopy_MOVIE", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.movie_number = Movie.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_COPY because Movie does not exist.'
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
    /* ERWIN_RELATION:CHECKSUM="000287dc", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="store_number" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.store_number = STORE.store_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,STORE," = "," AND") */
            MOVIE_STORE.store_number = STORE.store_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movie rents MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,Movie
      WHERE
        /* %JoinFKPK(deleted,Movie," = "," AND") */
        deleted.movie_number = Movie.movie_number AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,Movie," = "," AND") */
            MOVIE_STORE.movie_number = Movie.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because Movie exists.'
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
           @insmovie_number integer, 
           @insstore_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002bfd3", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="store_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.store_number = STORE.store_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because STORE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movie rents MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movie"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_MOVIE", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movie
        WHERE
          /* %JoinFKPK(inserted,Movie) */
          inserted.movie_number = Movie.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because Movie does not exist.'
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
    /* PAYMENT  BitcoinPayment on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00063ad6", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="BitcoinPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="payment_transaction_number" */
    DELETE BitcoinPayment
      FROM BitcoinPayment,deleted
      WHERE
        /*  %JoinFKPK(BitcoinPayment,deleted," = "," AND") */
        BitcoinPayment.payment_transaction_number = deleted.payment_transaction_number

    /* erwin Builtin Trigger */
    /* PAYMENT  PaypalPayment on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PaypalPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="payment_transaction_number" */
    DELETE PaypalPayment
      FROM PaypalPayment,deleted
      WHERE
        /*  %JoinFKPK(PaypalPayment,deleted," = "," AND") */
        PaypalPayment.payment_transaction_number = deleted.payment_transaction_number

    /* erwin Builtin Trigger */
    /* PAYMENT  CreditCardPayment on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CreditCardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="payment_transaction_number" */
    DELETE CreditCardPayment
      FROM CreditCardPayment,deleted
      WHERE
        /*  %JoinFKPK(CreditCardPayment,deleted," = "," AND") */
        CreditCardPayment.payment_transaction_number = deleted.payment_transaction_number

    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="customer_no" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.customer_no = CUST.CUST_number AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST," = "," AND") */
            PAYMENT.customer_no = CUST.CUST_number
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
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EMP_number" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_number = EMP.EMP_number AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,EMP," = "," AND") */
            PAYMENT.EMP_number = EMP.EMP_number
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
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT  BitcoinPayment on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00095fec", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="BitcoinPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @inspayment_transaction_number = inserted.payment_transaction_number
        FROM inserted
      UPDATE BitcoinPayment
      SET
        /*  %JoinFKPK(BitcoinPayment,@ins," = ",",") */
        BitcoinPayment.payment_transaction_number = @inspayment_transaction_number
      FROM BitcoinPayment,inserted,deleted
      WHERE
        /*  %JoinFKPK(BitcoinPayment,deleted," = "," AND") */
        BitcoinPayment.payment_transaction_number = deleted.payment_transaction_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  PaypalPayment on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PaypalPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @inspayment_transaction_number = inserted.payment_transaction_number
        FROM inserted
      UPDATE PaypalPayment
      SET
        /*  %JoinFKPK(PaypalPayment,@ins," = ",",") */
        PaypalPayment.payment_transaction_number = @inspayment_transaction_number
      FROM PaypalPayment,inserted,deleted
      WHERE
        /*  %JoinFKPK(PaypalPayment,deleted," = "," AND") */
        PaypalPayment.payment_transaction_number = deleted.payment_transaction_number
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade PAYMENT update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  CreditCardPayment on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="CreditCardPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @inspayment_transaction_number = inserted.payment_transaction_number
        FROM inserted
      UPDATE CreditCardPayment
      SET
        /*  %JoinFKPK(CreditCardPayment,@ins," = ",",") */
        CreditCardPayment.payment_transaction_number = @inspayment_transaction_number
      FROM CreditCardPayment,inserted,deleted
      WHERE
        /*  %JoinFKPK(CreditCardPayment,deleted," = "," AND") */
        CreditCardPayment.payment_transaction_number = deleted.payment_transaction_number
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
    FK_CONSTRAINT="FK_MoRentRec_PAYMENT", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Payment_CUST", FK_COLUMNS="customer_no" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(customer_no)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.customer_no = CUST.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.customer_no IS NULL
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
    FK_CONSTRAINT="FK_Payment_EMP", FK_COLUMNS="EMP_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_number = EMP.EMP_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EMP_number IS NULL
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




CREATE TRIGGER tD_PaypalPayment ON PaypalPayment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PaypalPayment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PaypalPayment record is sent to MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000290e9", PARENT_OWNER="", PARENT_TABLE="PaypalPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PaypalPayment because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* PAYMENT  PaypalPayment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PaypalPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="payment_transaction_number" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.payment_transaction_number = PAYMENT.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM PaypalPayment
          WHERE
            /* %JoinFKPK(PaypalPayment,PAYMENT," = "," AND") */
            PaypalPayment.payment_transaction_number = PAYMENT.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PaypalPayment because PAYMENT exists.'
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


CREATE TRIGGER tU_PaypalPayment ON PaypalPayment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PaypalPayment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PaypalPayment record is sent to MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d69a", PARENT_OWNER="", PARENT_TABLE="PaypalPayment"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="record is sent to", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.payment_transaction_number = deleted.payment_transaction_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PaypalPayment because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* PAYMENT  PaypalPayment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="PaypalPayment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.payment_transaction_number = PAYMENT.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PaypalPayment because PAYMENT does not exist.'
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




CREATE TRIGGER tD_PhysicalRental ON PhysicalRental FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PhysicalRental */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MO_RENT_REC  PhysicalRental on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042d6c", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
    IF EXISTS (SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /* %JoinFKPK(deleted,MO_RENT_REC," = "," AND") */
        deleted.payment_transaction_number = MO_RENT_REC.payment_transaction_number AND
        deleted.EMP_phone = MO_RENT_REC.EMP_phone AND
        deleted.soc_sec_number = MO_RENT_REC.soc_sec_number AND
        deleted.rental_record_date = MO_RENT_REC.rental_record_date AND
        deleted.mo_co_num = MO_RENT_REC.mo_co_num AND
        deleted.movie_number = MO_RENT_REC.movie_number AND
        deleted.CUST_number = MO_RENT_REC.CUST_number AND
        NOT EXISTS (
          SELECT * FROM PhysicalRental
          WHERE
            /* %JoinFKPK(PhysicalRental,MO_RENT_REC," = "," AND") */
            PhysicalRental.payment_transaction_number = MO_RENT_REC.payment_transaction_number AND
            PhysicalRental.EMP_phone = MO_RENT_REC.EMP_phone AND
            PhysicalRental.soc_sec_number = MO_RENT_REC.soc_sec_number AND
            PhysicalRental.rental_record_date = MO_RENT_REC.rental_record_date AND
            PhysicalRental.mo_co_num = MO_RENT_REC.mo_co_num AND
            PhysicalRental.movie_number = MO_RENT_REC.movie_number AND
            PhysicalRental.CUST_number = MO_RENT_REC.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PhysicalRental because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE  PhysicalRental on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="store_number" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.store_number = STORE.store_number AND
        NOT EXISTS (
          SELECT * FROM PhysicalRental
          WHERE
            /* %JoinFKPK(PhysicalRental,STORE," = "," AND") */
            PhysicalRental.store_number = STORE.store_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PhysicalRental because STORE exists.'
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


CREATE TRIGGER tU_PhysicalRental ON PhysicalRental FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PhysicalRental */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @insCUST_number integer, 
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MO_RENT_REC  PhysicalRental on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003ffbe", PARENT_OWNER="", PARENT_TABLE="MO_RENT_REC"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="payment_transaction_number""rental_record_date""mo_co_num""
              movie_number""EMP_phone""soc_sec_number""CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(payment_transaction_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MO_RENT_REC
        WHERE
          /* %JoinFKPK(inserted,MO_RENT_REC) */
          inserted.payment_transaction_number = MO_RENT_REC.payment_transaction_number and
          inserted.EMP_phone = MO_RENT_REC.EMP_phone and
          inserted.soc_sec_number = MO_RENT_REC.soc_sec_number and
          inserted.rental_record_date = MO_RENT_REC.rental_record_date and
          inserted.mo_co_num = MO_RENT_REC.mo_co_num and
          inserted.movie_number = MO_RENT_REC.movie_number and
          inserted.CUST_number = MO_RENT_REC.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PhysicalRental because MO_RENT_REC does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE  PhysicalRental on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="store_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.store_number = STORE.store_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.store_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PhysicalRental because STORE does not exist.'
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
    /* STORE  PhysicalRental on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003091a", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="store_number" */
    IF EXISTS (
      SELECT * FROM deleted,PhysicalRental
      WHERE
        /*  %JoinFKPK(PhysicalRental,deleted," = "," AND") */
        PhysicalRental.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because PhysicalRental exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="store_number" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.store_number = deleted.store_number
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
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="store_number" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.store_number = deleted.store_number
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
           @insstore_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE  PhysicalRental on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00035210", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="PhysicalRental"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_49", FK_COLUMNS="store_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PhysicalRental
      WHERE
        /*  %JoinFKPK(PhysicalRental,deleted," = "," AND") */
        PhysicalRental.store_number = deleted.store_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because PhysicalRental exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Movie_Store_STORE", FK_COLUMNS="store_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.store_number = deleted.store_number
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
    FK_CONSTRAINT="FK_Emp_STORE", FK_COLUMNS="store_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(store_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.store_number = deleted.store_number
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




CREATE TRIGGER tD_StreamMovie ON StreamMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EBuy  StreamMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001525b", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,EBuy
      WHERE
        /* %JoinFKPK(deleted,EBuy," = "," AND") */
        deleted.movie_number = EBuy.movie_number AND
        NOT EXISTS (
          SELECT * FROM StreamMovie
          WHERE
            /* %JoinFKPK(StreamMovie,EBuy," = "," AND") */
            StreamMovie.movie_number = EBuy.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamMovie because EBuy exists.'
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


CREATE TRIGGER tU_StreamMovie ON StreamMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EBuy  StreamMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016744", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_43", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EBuy
        WHERE
          /* %JoinFKPK(inserted,EBuy) */
          inserted.movie_number = EBuy.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamMovie because EBuy does not exist.'
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




CREATE TRIGGER tD_StreamMovie ON StreamMovie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on StreamMovie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST  StreamMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003ea8b", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CUST_number" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CUST_number = CUST.CUST_number AND
        NOT EXISTS (
          SELECT * FROM StreamMovie
          WHERE
            /* %JoinFKPK(StreamMovie,CUST," = "," AND") */
            StreamMovie.CUST_number = CUST.CUST_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamMovie because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EBuy  StreamMovie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
    IF EXISTS (SELECT * FROM deleted,EBuy
      WHERE
        /* %JoinFKPK(deleted,EBuy," = "," AND") */
        deleted.EMovieNumber = EBuy.EMovieNumber AND
        deleted.rental_record_date = EBuy.rental_record_date AND
        deleted.mo_co_num = EBuy.mo_co_num AND
        deleted.movie_number = EBuy.movie_number AND
        deleted.EMP_phone = EBuy.EMP_phone AND
        deleted.soc_sec_number = EBuy.soc_sec_number AND
        deleted.CUST_number = EBuy.CUST_number AND
        deleted.payment_transaction_number = EBuy.payment_transaction_number AND
        NOT EXISTS (
          SELECT * FROM StreamMovie
          WHERE
            /* %JoinFKPK(StreamMovie,EBuy," = "," AND") */
            StreamMovie.EMovieNumber = EBuy.EMovieNumber AND
            StreamMovie.rental_record_date = EBuy.rental_record_date AND
            StreamMovie.mo_co_num = EBuy.mo_co_num AND
            StreamMovie.movie_number = EBuy.movie_number AND
            StreamMovie.EMP_phone = EBuy.EMP_phone AND
            StreamMovie.soc_sec_number = EBuy.soc_sec_number AND
            StreamMovie.CUST_number = EBuy.CUST_number AND
            StreamMovie.payment_transaction_number = EBuy.payment_transaction_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last StreamMovie because EBuy exists.'
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


CREATE TRIGGER tU_StreamMovie ON StreamMovie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on StreamMovie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMovieNumber integer, 
           @insCUST_number integer, 
           @insrental_record_date datetime, 
           @insmo_co_num integer, 
           @insmovie_number integer, 
           @insEMP_phone phone, 
           @inssoc_sec_number integer, 
           @inspayment_transaction_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST  StreamMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00040ab2", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CUST_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CUST_number = CUST.CUST_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CUST_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamMovie because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EBuy  StreamMovie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EBuy"
    CHILD_OWNER="", CHILD_TABLE="StreamMovie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_44", FK_COLUMNS="payment_transaction_number""EMovieNumber""rental_record_date""
              mo_co_num""movie_number""EMP_phone""soc_sec_number""
              CUST_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMovieNumber) OR
    UPDATE(rental_record_date) OR
    UPDATE(mo_co_num) OR
    UPDATE(movie_number) OR
    UPDATE(EMP_phone) OR
    UPDATE(soc_sec_number) OR
    UPDATE(CUST_number) OR
    UPDATE(payment_transaction_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EBuy
        WHERE
          /* %JoinFKPK(inserted,EBuy) */
          inserted.EMovieNumber = EBuy.EMovieNumber and
          inserted.rental_record_date = EBuy.rental_record_date and
          inserted.mo_co_num = EBuy.mo_co_num and
          inserted.movie_number = EBuy.movie_number and
          inserted.EMP_phone = EBuy.EMP_phone and
          inserted.soc_sec_number = EBuy.soc_sec_number and
          inserted.CUST_number = EBuy.CUST_number and
          inserted.payment_transaction_number = EBuy.payment_transaction_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update StreamMovie because EBuy does not exist.'
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


