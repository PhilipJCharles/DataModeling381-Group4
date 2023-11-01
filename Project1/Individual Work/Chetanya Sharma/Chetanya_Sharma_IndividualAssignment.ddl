
CREATE TABLE [Back_office_employee]
( 
	[employee_number]    integer  NOT NULL ,
	[employee_first_name] varchar(20)  NULL ,
	[employee_address]   varchar(20)  NULL ,
	[employee_address_2] varchar(20)  NULL ,
	[employee_phone]     integer  NULL ,
	[hire_date]          datetime  NULL ,
	[salary]             integer  NULL ,
	[email]              varchar(20)  NULL 
)
go

CREATE TABLE [Credit_Card]
( 
	[USER_ID]            integer  NOT NULL ,
	[credit_card]        integer  NULL ,
	[credit_card_exp]    datetime  NULL ,
	[status_code]        varchar(20)  NULL 
)
go

CREATE TABLE [Movies]
( 
	[movie_number]       char(18)  NOT NULL ,
	[movie_title]        varchar(20)  NULL ,
	[description]        varchar(20)  NULL ,
	[star_1_name]        varchar(20)  NULL ,
	[rating]             integer  NULL ,
	[star_2_name]        varchar(20)  NULL ,
	[genre]              varchar(20)  NULL ,
	[rental_date]        datetime  NULL 
)
go

CREATE TABLE [Payment]
( 
	[USER_ID]            integer  NOT NULL ,
	[Payment_trans_numb] integer  NOT NULL ,
	[payment_type]       integer  NULL ,
	[payment_amount]     integer  NULL ,
	[payment_date]       datetime  NULL ,
	[payment_status]     varchar(20)  NULL ,
	[check_bank_number]  integer  NULL ,
	[check_number]       integer  NULL ,
	[credit_card_exp]    datetime  NULL ,
	[credit_card_type]   char(18)  NULL ,
	[employee_number]    integer  NULL 
)
go

CREATE TABLE [Rental_movie]
( 
	[movie_number]       integer  NULL ,
	[rental_id]          integer  NULL 
)
go

CREATE TABLE [Rentals]
( 
	[USER_ID]            integer  NOT NULL ,
	[rental_record_date] char(18)  NULL ,
	[employee_phone]     integer  NULL ,
	[rental_date]        datetime  NULL ,
	[due_date]           datetime  NULL ,
	[rental_status]      varchar(20)  NULL ,
	[Payment_trans_numb] integer  NOT NULL ,
	[rental_rate]        integer  NULL ,
	[overdue_charge]     integer  NULL ,
	[rental_id]          char(18)  NOT NULL 
)
go

CREATE TABLE [Subscriptions]
( 
	[USER_ID]            integer  NULL ,
	[subscription_id]    integer  NOT NULL ,
	[subscription_type]  varchar(20)  NULL ,
	[start_date]         datetime  NULL ,
	[end_date]           datetime  NULL 
)
go

CREATE TABLE [USER]
( 
	[USER_ID]            integer  NOT NULL ,
	[USER_EMAIL]         varchar(20)  NULL ,
	[ADDRESS]            varchar(20)  NULL ,
	[CITY]               varchar(20)  NULL ,
	[STATE]              varchar(20)  NULL ,
	[USER_FIRST]         varchar(20)  NULL ,
	[USERLAST]           varchar(20)  NULL ,
	[Zipcode]            integer  NULL ,
	[employee_number]    integer  NULL 
)
go

ALTER TABLE [Back_office_employee]
	ADD CONSTRAINT [XPKBack_office_employee] PRIMARY KEY  CLUSTERED ([employee_number] ASC)
go

ALTER TABLE [Credit_Card]
	ADD CONSTRAINT [XPKCredit_Card] PRIMARY KEY  CLUSTERED ([USER_ID] ASC)
go

ALTER TABLE [Movies]
	ADD CONSTRAINT [XPKMovies] PRIMARY KEY  CLUSTERED ([movie_number] ASC)
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  CLUSTERED ([Payment_trans_numb] ASC)
go

ALTER TABLE [Rentals]
	ADD CONSTRAINT [XPKRentals] PRIMARY KEY  CLUSTERED ([rental_id] ASC)
go

ALTER TABLE [Subscriptions]
	ADD CONSTRAINT [XPKSubscriptions] PRIMARY KEY  CLUSTERED ([subscription_id] ASC)
go

ALTER TABLE [USER]
	ADD CONSTRAINT [XPKUSER] PRIMARY KEY  CLUSTERED ([USER_ID] ASC)
go


ALTER TABLE [Credit_Card]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([USER_ID]) REFERENCES [USER]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Payment]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([employee_number]) REFERENCES [Back_office_employee]([employee_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_9] FOREIGN KEY ([USER_ID]) REFERENCES [USER]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Payment]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([USER_ID]) REFERENCES [Credit_Card]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Rental_movie]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([movie_number]) REFERENCES [Movies]([movie_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rental_movie]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([rental_id]) REFERENCES [Rentals]([rental_id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Rentals]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([USER_ID]) REFERENCES [Credit_Card]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rentals]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([Payment_trans_numb]) REFERENCES [Payment]([Payment_trans_numb])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rentals]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([USER_ID]) REFERENCES [USER]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Subscriptions]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([USER_ID]) REFERENCES [USER]([USER_ID])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [USER]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([employee_number]) REFERENCES [Back_office_employee]([employee_number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Back_office_employee ON Back_office_employee FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Back_office_employee */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Back_office_employee  USER on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00020c70", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="USER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="employee_number" */
    IF EXISTS (
      SELECT * FROM deleted,USER
      WHERE
        /*  %JoinFKPK(USER,deleted," = "," AND") */
        USER.employee_number = deleted.employee_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Back_office_employee because USER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Back_office_employee  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="employee_number" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.employee_number = deleted.employee_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Back_office_employee because Payment exists.'
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


CREATE TRIGGER tU_Back_office_employee ON Back_office_employee FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Back_office_employee */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insemployee_number integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Back_office_employee  USER on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00025c26", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="USER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="employee_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(employee_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,USER
      WHERE
        /*  %JoinFKPK(USER,deleted," = "," AND") */
        USER.employee_number = deleted.employee_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Back_office_employee because USER exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Back_office_employee  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="employee_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(employee_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.employee_number = deleted.employee_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Back_office_employee because Payment exists.'
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




CREATE TRIGGER tD_Credit_Card ON Credit_Card FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Credit_Card */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Credit_Card  Rentals on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00030b40", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Credit_Card because Rentals exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Credit_Card  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Credit_Card because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Credit_Card on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Credit_Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.USER_ID = USER.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Credit_Card
          WHERE
            /* %JoinFKPK(Credit_Card,USER," = "," AND") */
            Credit_Card.USER_ID = USER.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Credit_Card because USER exists.'
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


CREATE TRIGGER tU_Credit_Card ON Credit_Card FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Credit_Card */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insUSER_ID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Credit_Card  Rentals on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00035d46", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Credit_Card because Rentals exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Credit_Card  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Credit_Card because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Credit_Card on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Credit_Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.USER_ID = USER.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Credit_Card because USER does not exist.'
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




CREATE TRIGGER tD_Movies ON Movies FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Movies */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Movies  Rental_movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001188f", PARENT_OWNER="", PARENT_TABLE="Movies"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="movie_number" */
    IF EXISTS (
      SELECT * FROM deleted,Rental_movie
      WHERE
        /*  %JoinFKPK(Rental_movie,deleted," = "," AND") */
        Rental_movie.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Movies because Rental_movie exists.'
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


CREATE TRIGGER tU_Movies ON Movies FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Movies */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insmovie_number char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Movies  Rental_movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000135f9", PARENT_OWNER="", PARENT_TABLE="Movies"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="movie_number" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental_movie
      WHERE
        /*  %JoinFKPK(Rental_movie,deleted," = "," AND") */
        Rental_movie.movie_number = deleted.movie_number
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Movies because Rental_movie exists.'
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
    /* Payment  Rentals on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004b6d3", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Payment_trans_numb" */
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.Payment_trans_numb = deleted.Payment_trans_numb
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Payment because Rentals exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.USER_ID = USER.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,USER," = "," AND") */
            Payment.USER_ID = USER.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because USER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Back_office_employee  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="employee_number" */
    IF EXISTS (SELECT * FROM deleted,Back_office_employee
      WHERE
        /* %JoinFKPK(deleted,Back_office_employee," = "," AND") */
        deleted.employee_number = Back_office_employee.employee_number AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Back_office_employee," = "," AND") */
            Payment.employee_number = Back_office_employee.employee_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Back_office_employee exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Credit_Card  Payment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,Credit_Card
      WHERE
        /* %JoinFKPK(deleted,Credit_Card," = "," AND") */
        deleted.USER_ID = Credit_Card.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Payment
          WHERE
            /* %JoinFKPK(Payment,Credit_Card," = "," AND") */
            Payment.USER_ID = Credit_Card.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Payment because Credit_Card exists.'
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
           @insPayment_trans_numb integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Payment  Rentals on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005331c", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Payment_trans_numb" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Payment_trans_numb)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.Payment_trans_numb = deleted.Payment_trans_numb
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Payment because Rentals exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.USER_ID = USER.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because USER does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Back_office_employee  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="employee_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(employee_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Back_office_employee
        WHERE
          /* %JoinFKPK(inserted,Back_office_employee) */
          inserted.employee_number = Back_office_employee.employee_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.employee_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Back_office_employee does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Credit_Card  Payment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Credit_Card
        WHERE
          /* %JoinFKPK(inserted,Credit_Card) */
          inserted.USER_ID = Credit_Card.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Payment because Credit_Card does not exist.'
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




CREATE TRIGGER tD_Rental_movie ON Rental_movie FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rental_movie */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rentals  Rental_movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00027f53", PARENT_OWNER="", PARENT_TABLE="Rentals"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="rental_id" */
    IF EXISTS (SELECT * FROM deleted,Rentals
      WHERE
        /* %JoinFKPK(deleted,Rentals," = "," AND") */
        deleted.rental_id = Rentals.rental_id AND
        NOT EXISTS (
          SELECT * FROM Rental_movie
          WHERE
            /* %JoinFKPK(Rental_movie,Rentals," = "," AND") */
            Rental_movie.rental_id = Rentals.rental_id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental_movie because Rentals exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Movies  Rental_movie on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movies"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="movie_number" */
    IF EXISTS (SELECT * FROM deleted,Movies
      WHERE
        /* %JoinFKPK(deleted,Movies," = "," AND") */
        deleted.movie_number = Movies.movie_number AND
        NOT EXISTS (
          SELECT * FROM Rental_movie
          WHERE
            /* %JoinFKPK(Rental_movie,Movies," = "," AND") */
            Rental_movie.movie_number = Movies.movie_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rental_movie because Movies exists.'
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


CREATE TRIGGER tU_Rental_movie ON Rental_movie FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rental_movie */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rentals  Rental_movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f6af", PARENT_OWNER="", PARENT_TABLE="Rentals"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="rental_id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(rental_id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Rentals
        WHERE
          /* %JoinFKPK(inserted,Rentals) */
          inserted.rental_id = Rentals.rental_id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.rental_id IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental_movie because Rentals does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Movies  Rental_movie on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Movies"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="movie_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(movie_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Movies
        WHERE
          /* %JoinFKPK(inserted,Movies) */
          inserted.movie_number = Movies.movie_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.movie_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rental_movie because Movies does not exist.'
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




CREATE TRIGGER tD_Rentals ON Rentals FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rentals */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rentals  Rental_movie on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000488e0", PARENT_OWNER="", PARENT_TABLE="Rentals"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="rental_id" */
    IF EXISTS (
      SELECT * FROM deleted,Rental_movie
      WHERE
        /*  %JoinFKPK(Rental_movie,deleted," = "," AND") */
        Rental_movie.rental_id = deleted.rental_id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Rentals because Rental_movie exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Rentals on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.USER_ID = USER.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Rentals
          WHERE
            /* %JoinFKPK(Rentals,USER," = "," AND") */
            Rentals.USER_ID = USER.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rentals because USER exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Credit_Card  Rentals on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,Credit_Card
      WHERE
        /* %JoinFKPK(deleted,Credit_Card," = "," AND") */
        deleted.USER_ID = Credit_Card.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Rentals
          WHERE
            /* %JoinFKPK(Rentals,Credit_Card," = "," AND") */
            Rentals.USER_ID = Credit_Card.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rentals because Credit_Card exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Payment  Rentals on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Payment_trans_numb" */
    IF EXISTS (SELECT * FROM deleted,Payment
      WHERE
        /* %JoinFKPK(deleted,Payment," = "," AND") */
        deleted.Payment_trans_numb = Payment.Payment_trans_numb AND
        NOT EXISTS (
          SELECT * FROM Rentals
          WHERE
            /* %JoinFKPK(Rentals,Payment," = "," AND") */
            Rentals.Payment_trans_numb = Payment.Payment_trans_numb
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rentals because Payment exists.'
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


CREATE TRIGGER tU_Rentals ON Rentals FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rentals */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insrental_id char(18),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rentals  Rental_movie on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00050297", PARENT_OWNER="", PARENT_TABLE="Rentals"
    CHILD_OWNER="", CHILD_TABLE="Rental_movie"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="rental_id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(rental_id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rental_movie
      WHERE
        /*  %JoinFKPK(Rental_movie,deleted," = "," AND") */
        Rental_movie.rental_id = deleted.rental_id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Rentals because Rental_movie exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Rentals on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.USER_ID = USER.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rentals because USER does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Credit_Card  Rentals on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Credit_Card"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Credit_Card
        WHERE
          /* %JoinFKPK(inserted,Credit_Card) */
          inserted.USER_ID = Credit_Card.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rentals because Credit_Card does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Payment  Rentals on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Payment"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="Payment_trans_numb" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Payment_trans_numb)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Payment
        WHERE
          /* %JoinFKPK(inserted,Payment) */
          inserted.Payment_trans_numb = Payment.Payment_trans_numb
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rentals because Payment does not exist.'
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




CREATE TRIGGER tD_Subscriptions ON Subscriptions FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Subscriptions */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* USER  Subscriptions on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014ba8", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Subscriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="USER_ID" */
    IF EXISTS (SELECT * FROM deleted,USER
      WHERE
        /* %JoinFKPK(deleted,USER," = "," AND") */
        deleted.USER_ID = USER.USER_ID AND
        NOT EXISTS (
          SELECT * FROM Subscriptions
          WHERE
            /* %JoinFKPK(Subscriptions,USER," = "," AND") */
            Subscriptions.USER_ID = USER.USER_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Subscriptions because USER exists.'
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


CREATE TRIGGER tU_Subscriptions ON Subscriptions FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Subscriptions */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @inssubscription_id integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* USER  Subscriptions on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017b1d", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Subscriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="USER_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,USER
        WHERE
          /* %JoinFKPK(inserted,USER) */
          inserted.USER_ID = USER.USER_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.USER_ID IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Subscriptions because USER does not exist.'
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
    /* USER  Subscriptions on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00050cdc", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Subscriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Subscriptions
      WHERE
        /*  %JoinFKPK(Subscriptions,deleted," = "," AND") */
        Subscriptions.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because Subscriptions exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Rentals on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because Rentals exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Credit_Card on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Credit_Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Credit_Card
      WHERE
        /*  %JoinFKPK(Credit_Card,deleted," = "," AND") */
        Credit_Card.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because Credit_Card exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* USER  Payment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="USER_ID" */
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete USER because Payment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Back_office_employee  USER on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="USER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="employee_number" */
    IF EXISTS (SELECT * FROM deleted,Back_office_employee
      WHERE
        /* %JoinFKPK(deleted,Back_office_employee," = "," AND") */
        deleted.employee_number = Back_office_employee.employee_number AND
        NOT EXISTS (
          SELECT * FROM USER
          WHERE
            /* %JoinFKPK(USER,Back_office_employee," = "," AND") */
            USER.employee_number = Back_office_employee.employee_number
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last USER because Back_office_employee exists.'
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
           @insUSER_ID integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* USER  Subscriptions on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005c8f6", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Subscriptions"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Subscriptions
      WHERE
        /*  %JoinFKPK(Subscriptions,deleted," = "," AND") */
        Subscriptions.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because Subscriptions exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Rentals on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Rentals"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rentals
      WHERE
        /*  %JoinFKPK(Rentals,deleted," = "," AND") */
        Rentals.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because Rentals exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Credit_Card on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Credit_Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Credit_Card
      WHERE
        /*  %JoinFKPK(Credit_Card,deleted," = "," AND") */
        Credit_Card.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because Credit_Card exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* USER  Payment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="USER"
    CHILD_OWNER="", CHILD_TABLE="Payment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="USER_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(USER_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Payment
      WHERE
        /*  %JoinFKPK(Payment,deleted," = "," AND") */
        Payment.USER_ID = deleted.USER_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update USER because Payment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Back_office_employee  USER on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Back_office_employee"
    CHILD_OWNER="", CHILD_TABLE="USER"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="employee_number" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(employee_number)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Back_office_employee
        WHERE
          /* %JoinFKPK(inserted,Back_office_employee) */
          inserted.employee_number = Back_office_employee.employee_number
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.employee_number IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update USER because Back_office_employee does not exist.'
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


