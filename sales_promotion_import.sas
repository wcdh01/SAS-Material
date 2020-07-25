/* --------------------------------------------------------------------   
   Source file:
   C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\sales_promotion.csv
   -------------------------------------------------------------------- */

DATA WORK.sales_promotion;
    LENGTH
        ACCOUNT__C       $ 18
        ASSET__C         $ 18
        CATEGORY__C      $ 15
        CREATEDBYID      $ 18
        CREATEDDATE        8
        ENDDATE__C         8
        ID               $ 18
        ISDELETED        $ 5
        LASTMODIFIEDBYID $ 18
        LASTMODIFIEDDATE   8
        LASTREFERENCEDDATE $ 1
        LASTVIEWEDDATE   $ 1
        NAME             $ 78
        OWNERID          $ 18
        PRODUCTNAME__C   $ 38
        PRODUCTPURCHASEDATE__C   8
        RESELLERNAME__C  $ 80
        SERIALNUMBER__C  $ 54
        STARTDATE__C       8
        STORENAME__C     $ 79
        SUBCATEGORY__C   $ 27
        SUBMISSIONCOUNTRY__C $ 2
        SUBSTATUS__C     $ 28
        SYSTEMMODSTAMP   $ 24 ;
    FORMAT
        ACCOUNT__C       $CHAR18.
        ASSET__C         $CHAR18.
        CATEGORY__C      $CHAR15.
        CREATEDBYID      $CHAR18.
        CREATEDDATE      DATETIME21.2
        ENDDATE__C       YYMMDD10.
        ID               $CHAR18.
        ISDELETED        $CHAR5.
        LASTMODIFIEDBYID $CHAR18.
        LASTMODIFIEDDATE DATETIME21.2
        LASTREFERENCEDDATE $CHAR1.
        LASTVIEWEDDATE   $CHAR1.
        NAME             $CHAR78.
        OWNERID          $CHAR18.
        PRODUCTNAME__C   $CHAR38.
        PRODUCTPURCHASEDATE__C YYMMDD10.
        RESELLERNAME__C  $CHAR80.
        SERIALNUMBER__C  $CHAR54.
        STARTDATE__C     YYMMDD10.
        STORENAME__C     $CHAR79.
        SUBCATEGORY__C   $CHAR27.
        SUBMISSIONCOUNTRY__C $CHAR2.
        SUBSTATUS__C     $CHAR28.
        SYSTEMMODSTAMP   $CHAR24. ;
    INFORMAT
        ACCOUNT__C       $CHAR18.
        ASSET__C         $CHAR18.
        CATEGORY__C      $CHAR15.
        CREATEDBYID      $CHAR18.
        CREATEDDATE      DATETIME21.
        ENDDATE__C       YYMMDD10.
        ID               $CHAR18.
        ISDELETED        $CHAR5.
        LASTMODIFIEDBYID $CHAR18.
        LASTMODIFIEDDATE DATETIME21.
        LASTREFERENCEDDATE $CHAR1.
        LASTVIEWEDDATE   $CHAR1.
        NAME             $CHAR78.
        OWNERID          $CHAR18.
        PRODUCTNAME__C   $CHAR38.
        PRODUCTPURCHASEDATE__C YYMMDD10.
        RESELLERNAME__C  $CHAR80.
        SERIALNUMBER__C  $CHAR54.
        STARTDATE__C     YYMMDD10.
        STORENAME__C     $CHAR79.
        SUBCATEGORY__C   $CHAR27.
        SUBMISSIONCOUNTRY__C $CHAR2.
        SUBSTATUS__C     $CHAR28.
        SYSTEMMODSTAMP   $CHAR24. ;
    INFILE 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\sales_promotion.csv'
        LRECL=444
        TERMSTR=CRLF
        DLM=','
        MISSOVER
        DSD 
        FIRSTOBS=2;
    INPUT
        ACCOUNT__C       : $CHAR18.
        ASSET__C         : $CHAR18.
        CATEGORY__C      : $CHAR15.
        CREATEDBYID      : $CHAR18.
        CREATEDDATE      : ?? ANYDTDTM24.
        ENDDATE__C       : ?? YYMMDD10.
        ID               : $CHAR18.
        ISDELETED        : $CHAR5.
        LASTMODIFIEDBYID : $CHAR18.
        LASTMODIFIEDDATE : ?? ANYDTDTM24.
        LASTREFERENCEDDATE : $CHAR1.
        LASTVIEWEDDATE   : $CHAR1.
        NAME             : $CHAR78.
        OWNERID          : $CHAR18.
        PRODUCTNAME__C   : $CHAR38.
        PRODUCTPURCHASEDATE__C : ?? YYMMDD10.
        RESELLERNAME__C  : $CHAR80.
        SERIALNUMBER__C  : $CHAR54.
        STARTDATE__C     : ?? YYMMDD10.
        STORENAME__C     : $CHAR79.
        SUBCATEGORY__C   : $CHAR27.
        SUBMISSIONCOUNTRY__C : $CHAR2.
        SUBSTATUS__C     : $CHAR28.
        SYSTEMMODSTAMP   : $CHAR24. ;
RUN;
