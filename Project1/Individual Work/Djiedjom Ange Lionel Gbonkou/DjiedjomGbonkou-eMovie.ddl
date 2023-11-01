
CREATE TABLE [INVENTORY]
( 
	[InventoryID]        varchar()  NOT NULL ,
	[MovieID]            varchar()  NOT NULL ,
	[Location]           varchar()  NULL ,
	[Condition]          varchar()  NULL ,
	[AvailabilityStatus] varchar()  NULL 
)
go

CREATE TABLE [MOVIE]
( 
	[MovieID]            varchar()  NOT NULL ,
	[Title]              varchar()  NULL ,
	[ReleaseDate]        datetime  NULL ,
	[Genre]              varchar()  NULL ,
	[InventoryCount]     integer  NULL 
)
go

CREATE TABLE [MOVIE_RENTAL]
( 
	[MovieID]            varchar()  NOT NULL ,
	[RentalID]           varchar()  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[PaymentID]          varchar()  NOT NULL ,
	[UserID]             varchar()  NOT NULL ,
	[PaymentDate]        datetime  NULL ,
	[Amount]             decimal()  NULL ,
	[PaymentMethod]      varchar()  NULL ,
	[TransactionID]      varchar()  NULL 
)
go

CREATE TABLE [RENTAL]
( 
	[RentalID]           varchar()  NOT NULL ,
	[UserID]             varchar()  NULL ,
	[MovieID]            varchar()  NULL ,
	[RentalDate]         datetime  NULL ,
	[ReturnDate]         datetime  NULL ,
	[RentalFee]          decimal()  NULL 
)
go

CREATE TABLE [REVIEW]
( 
	[ReviewID]           varchar()  NOT NULL ,
	[MovieID]            varchar()  NOT NULL ,
	[ReviewerName]       varchar()  NULL ,
	[Rating]             integer  NULL ,
	[Comment]            text  NULL ,
	[UserID]             varchar()  NOT NULL 
)
go

CREATE TABLE [SUBSCRIPTION]
( 
	[SubscriptionID]     varchar()  NOT NULL ,
	[Name]               varchar()  NULL ,
	[Description]        text  NULL ,
	[Price]              decimal()  NULL ,
	[DuurationInDays]    integer  NULL 
)
go

CREATE TABLE [TRANSACTION]
( 
	[TransactionID]      varchar()  NOT NULL ,
	[UserID]             varchar()  NOT NULL ,
	[TransactionType]    varchar()  NULL ,
	[TransactionDate]    datetime  NULL ,
	[TransactionAmount]  decimal()  NULL 
)
go

CREATE TABLE [USER]
( 
	[UserID]             varchar()  NOT NULL ,
	[Username]           varchar()  NULL ,
	[Email]              varchar()  NULL ,
	[Password]           varchar()  NULL 
)
go

CREATE TABLE [USER_RENTAL]
( 
	[UserID]             varchar()  NOT NULL ,
	[RentalID]           varchar()  NOT NULL 
)
go

CREATE TABLE [USER_SUBSCRIPTION]
( 
	[UserID]             varchar()  NOT NULL ,
	[SubscriptionID]     varchar()  NOT NULL ,
	[StartDate]          date  NULL ,
	[EndDate]            char(18)  NULL 
)
go

ALTER TABLE [INVENTORY]
	ADD CONSTRAINT [XPKINVENTORY] PRIMARY KEY  CLUSTERED ([InventoryID] ASC,[MovieID] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XPKMOVIE] PRIMARY KEY  CLUSTERED ([MovieID] ASC)
go

ALTER TABLE [MOVIE_RENTAL]
	ADD CONSTRAINT [XPKMOVIE_RENTAL] PRIMARY KEY  CLUSTERED ([MovieID] ASC,[RentalID] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPAYMENT] PRIMARY KEY  CLUSTERED ([PaymentID] ASC,[UserID] ASC)
go

ALTER TABLE [RENTAL]
	ADD CONSTRAINT [XPKRENTAL] PRIMARY KEY  CLUSTERED ([RentalID] ASC)
go

ALTER TABLE [REVIEW]
	ADD CONSTRAINT [XPKREVIEW] PRIMARY KEY  CLUSTERED ([ReviewID] ASC,[UserID] ASC,[MovieID] ASC)
go

ALTER TABLE [SUBSCRIPTION]
	ADD CONSTRAINT [XPKSUBSCRIPTION] PRIMARY KEY  CLUSTERED ([SubscriptionID] ASC)
go

ALTER TABLE [TRANSACTION]
	ADD CONSTRAINT [XPKTRANSACTION] PRIMARY KEY  CLUSTERED ([TransactionID] ASC,[UserID] ASC)
go

ALTER TABLE [USER]
	ADD CONSTRAINT [XPKUSER] PRIMARY KEY  CLUSTERED ([UserID] ASC)
go

ALTER TABLE [USER_RENTAL]
	ADD CONSTRAINT [XPKUSER_RENTAL] PRIMARY KEY  CLUSTERED ([UserID] ASC,[RentalID] ASC)
go

ALTER TABLE [USER_SUBSCRIPTION]
	ADD CONSTRAINT [XPKUSER_SUBSCRIPTION] PRIMARY KEY  CLUSTERED ([UserID] ASC,[SubscriptionID] ASC)
go


ALTER TABLE [INVENTORY]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([MovieID]) REFERENCES [MOVIE]([MovieID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_RENTAL]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([MovieID]) REFERENCES [MOVIE]([MovieID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_RENTAL]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([RentalID]) REFERENCES [RENTAL]([RentalID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([UserID]) REFERENCES [USER]([UserID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [REVIEW]
	ADD CONSTRAINT [R_1] FOREIGN KEY ([UserID]) REFERENCES [USER]([UserID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [REVIEW]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([MovieID]) REFERENCES [MOVIE]([MovieID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [TRANSACTION]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([UserID]) REFERENCES [USER]([UserID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [USER_RENTAL]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([UserID]) REFERENCES [USER]([UserID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [USER_RENTAL]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([RentalID]) REFERENCES [RENTAL]([RentalID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [USER_SUBSCRIPTION]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([UserID]) REFERENCES [USER]([UserID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [USER_SUBSCRIPTION]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([SubscriptionID]) REFERENCES [SUBSCRIPTION]([SubscriptionID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_INVENTORY ON INVENTORY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on INVENTORY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE  INVENTORY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012c44", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="INVENTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="MovieID" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieID = MOVIE.MovieID AND
        NOT EXISTS (
          SELECT * FROM INVENTORY
          WHERE
            /* %JoinFKPK(INVENTORY,MOVIE," = "," AND") */
            INVENTORY.MovieID = MOVIE.MovieID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last INVENTORY because MOVIE exists.'
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


CREATE TRIGGER tU_INVENTORY ON INVENTORY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on INVENTORY */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insInventoryID varchar(), 
           @insMovieID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE  INVENTORY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00015b10", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="INVENTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="MovieID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieID = MOVIE.MovieID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update INVENTORY because MOVIE does not exist.'
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
    /* MOVIE  INVENTORY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002c9b6", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="INVENTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="MovieID" */
    IF EXISTS (
      SELECT * FROM deleted,INVENTORY
      WHERE
        /*  %JoinFKPK(INVENTORY,deleted," = "," AND") */
        INVENTORY.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because INVENTORY exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_RENTAL on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="MovieID" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_RENTAL
      WHERE
        /*  %JoinFKPK(MOVIE_RENTAL,deleted," = "," AND") */
        MOVIE_RENTAL.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_RENTAL exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  REVIEW on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="MovieID" */
    IF EXISTS (
      SELECT * FROM deleted,REVIEW
      WHERE
        /*  %JoinFKPK(REVIEW,deleted," = "," AND") */
        REVIEW.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because REVIEW exists.'
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
           @insMovieID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE  INVENTORY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000322b2", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="INVENTORY"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="MovieID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,INVENTORY
      WHERE
        /*  %JoinFKPK(INVENTORY,deleted," = "," AND") */
        INVENTORY.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because INVENTORY exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_RENTAL on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="MovieID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_RENTAL
      WHERE
        /*  %JoinFKPK(MOVIE_RENTAL,deleted," = "," AND") */
        MOVIE_RENTAL.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_RENTAL exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  REVIEW on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="MovieID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,REVIEW
      WHERE
        /*  %JoinFKPK(REVIEW,deleted," = "," AND") */
        REVIEW.MovieID = deleted.MovieID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because REVIEW exists.'
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




CREATE TRIGGER tD_MOVIE_RENTAL ON MOVIE_RENTAL FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_RENTAL */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* RENTAL  MOVIE_RENTAL on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025a57", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="RentalID" */
    IF EXISTS (SELECT * FROM deleted,RENTAL
      WHERE
        /* %JoinFKPK(deleted,RENTAL," = "," AND") */
        deleted.RentalID = RENTAL.RentalID AND
        NOT EXISTS (
          SELECT * FROM MOVIE_RENTAL
          WHERE
            /* %JoinFKPK(MOVIE_RENTAL,RENTAL," = "," AND") */
            MOVIE_RENTAL.RentalID = RENTAL.RentalID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_RENTAL because RENTAL exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE  MOVIE_RENTAL on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="MovieID" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieID = MOVIE.MovieID AND
        NOT EXISTS (
          SELECT * FROM MOVIE_RENTAL
          WHERE
            /* %JoinFKPK(MOVIE_RENTAL,MOVIE," = "," AND") */
            MOVIE_RENTAL.MovieID = MOVIE.MovieID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_RENTAL because MOVIE exists.'
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


CREATE TRIGGER tU_MOVIE_RENTAL ON MOVIE_RENTAL FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_RENTAL */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMovieID varchar(), 
           @insRentalID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* RENTAL  MOVIE_RENTAL on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00029c10", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="RentalID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(RentalID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,RENTAL
        WHERE
          /* %JoinFKPK(inserted,RENTAL) */
          inserted.RentalID = RENTAL.RentalID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_RENTAL because RENTAL does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE  MOVIE_RENTAL on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="MovieID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieID = MOVIE.MovieID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_RENTAL because MOVIE does not exist.'
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
    /* USER  PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012b67", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="UserID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.UserID = USER.UserID AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,USER," = "," AND") */
            PAYMENT.UserID = USER.UserID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because USER exists.'
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
           @insPaymentID varchar(), 
           @insUserID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* USER  PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00015c53", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="UserID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.UserID = USER.UserID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because USER does not exist.'
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




CREATE TRIGGER tD_RENTAL ON RENTAL FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on RENTAL */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* RENTAL  USER_RENTAL on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020394", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RentalID" */
    IF EXISTS (
      SELECT * FROM deleted,USER_RENTAL
      WHERE
        /*  %JoinFKPK(USER_RENTAL,deleted," = "," AND") */
        USER_RENTAL.RentalID = deleted.RentalID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete RENTAL because USER_RENTAL exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* RENTAL  MOVIE_RENTAL on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="RentalID" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_RENTAL
      WHERE
        /*  %JoinFKPK(MOVIE_RENTAL,deleted," = "," AND") */
        MOVIE_RENTAL.RentalID = deleted.RentalID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete RENTAL because MOVIE_RENTAL exists.'
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


CREATE TRIGGER tU_RENTAL ON RENTAL FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on RENTAL */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRentalID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* RENTAL  USER_RENTAL on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023a9b", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RentalID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(RentalID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,USER_RENTAL
      WHERE
        /*  %JoinFKPK(USER_RENTAL,deleted," = "," AND") */
        USER_RENTAL.RentalID = deleted.RentalID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update RENTAL because USER_RENTAL exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* RENTAL  MOVIE_RENTAL on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="RentalID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(RentalID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_RENTAL
      WHERE
        /*  %JoinFKPK(MOVIE_RENTAL,deleted," = "," AND") */
        MOVIE_RENTAL.RentalID = deleted.RentalID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update RENTAL because MOVIE_RENTAL exists.'
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




CREATE TRIGGER tD_REVIEW ON REVIEW FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on REVIEW */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE  REVIEW on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023548", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="MovieID" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MovieID = MOVIE.MovieID AND
        NOT EXISTS (
          SELECT * FROM REVIEW
          WHERE
            /* %JoinFKPK(REVIEW,MOVIE," = "," AND") */
            REVIEW.MovieID = MOVIE.MovieID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last REVIEW because MOVIE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  REVIEW on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="UserID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.UserID = USER.UserID AND
        NOT EXISTS (
          SELECT * FROM REVIEW
          WHERE
            /* %JoinFKPK(REVIEW,USER," = "," AND") */
            REVIEW.UserID = USER.UserID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last REVIEW because USER exists.'
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


CREATE TRIGGER tU_REVIEW ON REVIEW FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on REVIEW */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insReviewID varchar(), 
           @insMovieID varchar(), 
           @insUserID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE  REVIEW on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002818f", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="MovieID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MovieID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MovieID = MOVIE.MovieID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update REVIEW because MOVIE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  REVIEW on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="UserID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.UserID = USER.UserID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update REVIEW because USER does not exist.'
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
    /* SUBSCRIPTION  USER_SUBSCRIPTION on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012e1b", PARENT_OWNER="", PARENT_TABLE="SUBSCRIPTION"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="SubscriptionID" */
    IF EXISTS (
      SELECT * FROM deleted,USER_SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(USER_SUBSCRIPTION,deleted," = "," AND") */
        USER_SUBSCRIPTION.SubscriptionID = deleted.SubscriptionID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete SUBSCRIPTION because USER_SUBSCRIPTION exists.'
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
           @insSubscriptionID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SUBSCRIPTION  USER_SUBSCRIPTION on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000152c3", PARENT_OWNER="", PARENT_TABLE="SUBSCRIPTION"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="SubscriptionID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SubscriptionID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,USER_SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(USER_SUBSCRIPTION,deleted," = "," AND") */
        USER_SUBSCRIPTION.SubscriptionID = deleted.SubscriptionID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update SUBSCRIPTION because USER_SUBSCRIPTION exists.'
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




CREATE TRIGGER tD_TRANSACTION ON TRANSACTION FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on TRANSACTION */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* USER  TRANSACTION on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001349a", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="TRANSACTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="UserID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.UserID = USER.UserID AND
        NOT EXISTS (
          SELECT * FROM TRANSACTION
          WHERE
            /* %JoinFKPK(TRANSACTION,USER," = "," AND") */
            TRANSACTION.UserID = USER.UserID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TRANSACTION because USER exists.'
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


CREATE TRIGGER tU_TRANSACTION ON TRANSACTION FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on TRANSACTION */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insTransactionID varchar(), 
           @insUserID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* USER  TRANSACTION on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00015852", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="TRANSACTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="UserID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.UserID = USER.UserID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TRANSACTION because USER does not exist.'
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




CREATE TRIGGER tD_USER ON USER FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on USER */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* USER  USER_RENTAL on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00049c28", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="UserID" */
    IF EXISTS (
      SELECT * FROM deleted,USER_RENTAL
      WHERE
        /*  %JoinFKPK(USER_RENTAL,deleted," = "," AND") */
        USER_RENTAL.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because USER_RENTAL exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  USER_SUBSCRIPTION on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="UserID" */
    IF EXISTS (
      SELECT * FROM deleted,USER_SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(USER_SUBSCRIPTION,deleted," = "," AND") */
        USER_SUBSCRIPTION.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because USER_SUBSCRIPTION exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  TRANSACTION on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="TRANSACTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="UserID" */
    IF EXISTS (
      SELECT * FROM deleted,TRANSACTION
      WHERE
        /*  %JoinFKPK(TRANSACTION,deleted," = "," AND") */
        TRANSACTION.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because TRANSACTION exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="UserID" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  REVIEW on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="UserID" */
    IF EXISTS (
      SELECT * FROM deleted,REVIEW
      WHERE
        /*  %JoinFKPK(REVIEW,deleted," = "," AND") */
        REVIEW.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because REVIEW exists.'
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


CREATE TRIGGER tU_USER ON USER FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on USER */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insUserID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* USER  USER_RENTAL on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005224f", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="UserID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,USER_RENTAL
      WHERE
        /*  %JoinFKPK(USER_RENTAL,deleted," = "," AND") */
        USER_RENTAL.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because USER_RENTAL exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  USER_SUBSCRIPTION on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="UserID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,USER_SUBSCRIPTION
      WHERE
        /*  %JoinFKPK(USER_SUBSCRIPTION,deleted," = "," AND") */
        USER_SUBSCRIPTION.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because USER_SUBSCRIPTION exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  TRANSACTION on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="TRANSACTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="UserID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,TRANSACTION
      WHERE
        /*  %JoinFKPK(TRANSACTION,deleted," = "," AND") */
        TRANSACTION.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because TRANSACTION exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="UserID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  REVIEW on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="REVIEW"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="UserID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,REVIEW
      WHERE
        /*  %JoinFKPK(REVIEW,deleted," = "," AND") */
        REVIEW.UserID = deleted.UserID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because REVIEW exists.'
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




CREATE TRIGGER tD_USER_RENTAL ON USER_RENTAL FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on USER_RENTAL */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* RENTAL  USER_RENTAL on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00025b1a", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RentalID" */
    IF EXISTS (SELECT * FROM deleted,RENTAL
      WHERE
        /* %JoinFKPK(deleted,RENTAL," = "," AND") */
        deleted.RentalID = RENTAL.RentalID AND
        NOT EXISTS (
          SELECT * FROM USER_RENTAL
          WHERE
            /* %JoinFKPK(USER_RENTAL,RENTAL," = "," AND") */
            USER_RENTAL.RentalID = RENTAL.RentalID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last USER_RENTAL because RENTAL exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  USER_RENTAL on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="UserID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.UserID = USER.UserID AND
        NOT EXISTS (
          SELECT * FROM USER_RENTAL
          WHERE
            /* %JoinFKPK(USER_RENTAL,USER," = "," AND") */
            USER_RENTAL.UserID = USER.UserID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last USER_RENTAL because USER exists.'
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


CREATE TRIGGER tU_USER_RENTAL ON USER_RENTAL FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on USER_RENTAL */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insUserID varchar(), 
           @insRentalID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* RENTAL  USER_RENTAL on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a78d", PARENT_OWNER="", PARENT_TABLE="RENTAL"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="RentalID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(RentalID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,RENTAL
        WHERE
          /* %JoinFKPK(inserted,RENTAL) */
          inserted.RentalID = RENTAL.RentalID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update USER_RENTAL because RENTAL does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  USER_RENTAL on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_RENTAL"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="UserID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.UserID = USER.UserID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update USER_RENTAL because USER does not exist.'
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




CREATE TRIGGER tD_USER_SUBSCRIPTION ON USER_SUBSCRIPTION FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on USER_SUBSCRIPTION */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* SUBSCRIPTION  USER_SUBSCRIPTION on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029313", PARENT_OWNER="", PARENT_TABLE="SUBSCRIPTION"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="SubscriptionID" */
    IF EXISTS (SELECT * FROM deleted,SUBSCRIPTION
      WHERE
        /* %JoinFKPK(deleted,SUBSCRIPTION," = "," AND") */
        deleted.SubscriptionID = SUBSCRIPTION.SubscriptionID AND
        NOT EXISTS (
          SELECT * FROM USER_SUBSCRIPTION
          WHERE
            /* %JoinFKPK(USER_SUBSCRIPTION,SUBSCRIPTION," = "," AND") */
            USER_SUBSCRIPTION.SubscriptionID = SUBSCRIPTION.SubscriptionID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last USER_SUBSCRIPTION because SUBSCRIPTION exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  USER_SUBSCRIPTION on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="UserID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.UserID = USER.UserID AND
        NOT EXISTS (
          SELECT * FROM USER_SUBSCRIPTION
          WHERE
            /* %JoinFKPK(USER_SUBSCRIPTION,USER," = "," AND") */
            USER_SUBSCRIPTION.UserID = USER.UserID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last USER_SUBSCRIPTION because USER exists.'
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


CREATE TRIGGER tU_USER_SUBSCRIPTION ON USER_SUBSCRIPTION FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on USER_SUBSCRIPTION */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insUserID varchar(), 
           @insSubscriptionID varchar(),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* SUBSCRIPTION  USER_SUBSCRIPTION on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ca9c", PARENT_OWNER="", PARENT_TABLE="SUBSCRIPTION"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="SubscriptionID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SubscriptionID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,SUBSCRIPTION
        WHERE
          /* %JoinFKPK(inserted,SUBSCRIPTION) */
          inserted.SubscriptionID = SUBSCRIPTION.SubscriptionID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update USER_SUBSCRIPTION because SUBSCRIPTION does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  USER_SUBSCRIPTION on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="USER_SUBSCRIPTION"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="UserID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.UserID = USER.UserID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update USER_SUBSCRIPTION because USER does not exist.'
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


