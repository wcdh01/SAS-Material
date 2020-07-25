/*--- Updated 30July2019 by Douglas ---*/
/*--- Update due to change in Laptop Hard Drive  ---*/

/* Start timer to record download time for files */
%let _timer_start = %sysfunc(datetime());

data _null_;
call system("C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\s7fiximport_extract.bat");
run;

/**** imports the following files:
*_rc_clicks.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\*"
*_rc_open.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\*"
*_rc_sends.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\*"
Job_File_Transfer_Choon.csv  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\*"
*_90dayTrackingExtract.zip  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\*"
****/

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 45*'-' / ' TOTAL FILE IMPORT DURATION:' dur time13.2 / 30*'-';
run;


/* Start timer */
%let _timer_start = %sysfunc(datetime());

%Let Today=%sysfunc(intnx(day,%sysfunc(today()),-3),yymmddn8.);
%Let Today1=%sysfunc(intnx(day,%sysfunc(today()),-3),date9.);
%Let Yesterday=%sysfunc(intnx(day,%sysfunc(today()),-4),yymmddn8.);
%Let LastWeek=%sysfunc(intnx(day,%sysfunc(today()),-10),yymmddn8.);
/*
&Today;
&Today1;
&Yesterday;
&Lastweek;
*/

/********************************************************************************************
Imports lastweeks/latest file for processing
    rc_sends 
    rc_opens 
    rc_clicks

Joins cumulative file and last weeks update together
    Sends_Append 
    Opens_Append 
    Clicks_Append

Creates a CSV backup in external drive

Imports latest required files
    OrdersImport 
    Orders 
    OrderItems 
    Accounts 
    Assets 
    CampaignCategory 
    PriceList 
    Product2_Salesforce 

Process required to complete Import Stage
    Send Campaign Join 
    Order Join
    SP removed & count
    SendCampaignDedupe
    AssetDedupe

Removes files no longer required to create hard disc space for processing

 ********************************************************************************************/

/*proc datasets library=worklib kill; run; quit; */
/*proc datasets library=work kill; run; quit; */

/*Creates access to folder for cumulative files*/
/*libname matchb 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory';*/
/*libname worklib 'D:\Worklib';*/
/*run;*/

/*Imports lastweeks/latest file for processing*/
DATA worklib.rc_sends_&Yesterday.;
    LENGTH
        OYBAccountID       8
        JobID              8
        SubscriberKey    $ 45
        SentDate          8 ;
    FORMAT
        OYBAccountID     BEST7.
        JobID            BEST7.
        SubscriberKey    $CHAR45.
        SentDate        DDMMYY10. ;
    INFORMAT
        OYBAccountID     BEST7.
        JobID            BEST7.
        SubscriberKey    $CHAR45.
        SentDate        DDMMYY10. ;
    INFILE "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\&Yesterday._rc_sends.csv"
        lrecl=32767
        ENCODING="utf-8"
        DLM=','
        MISSOVER
        DSD 
        FIRSTOBS=2 ;
    INPUT
        OYBAccountID     : ?? BEST7.
        JobID            : ?? BEST7.
        SubscriberKey    : $CHAR45.
        SentDate        : ?? ANYDTDTE29. ;
RUN;

/*Imports lastweeks/latest file for processing*/
DATA worklib.rc_opens_&Yesterday.;  
    LENGTH   
        OYBAccountID 8  
        JobID 8  
        SubscriberKey $ 45 
        OpenDate 8 ;
    DROP 
        SubscriberID
        IsUnique ;
    FORMAT   
        OYBAccountID BEST7.  
        JobID BEST7.  
        SubscriberKey $CHAR45.  
        OpenDate DDMMYY10. ; 
    INFORMAT   
        OYBAccountID BEST7.  
        JobID BEST7.  
        SubscriberKey $CHAR45.  
        OpenDate DDMMYY10.  ;
    INFILE "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\&Yesterday._rc_open.csv" 
        LRECL=32767 
        ENCODING="utf-8"   
        DLM=','   
        MISSOVER   
        DSD
        FIRSTOBS=2 ;  
    INPUT   
        OYBAccountID : ?? BEST7.
        JobID : ?? BEST7.
        SubscriberID : $1.
        SubscriberKey : $CHAR45. 
        OpenDate : ?? ANYDTDTE10.
        IsUnique : $1. ;
RUN;   

/*Imports lastweeks/latest file for processing*/
DATA worklib.rc_clicks_000;
    LENGTH
        OYBAccountID       8
        JobID              8
        SubscriberKey    $ 45
        EventDate          8
        URL              $ 1500
        LinkName         $ 1024
        LinkContent      $ 2000 ;
    KEEP
        OYBAccountID
        JobID
        SubscriberKey
        ClickDate
        URL
        LinkName
        LinkContent ;
    FORMAT
        OYBAccountID     BEST7.
        JobID            BEST7.
        SubscriberKey    $CHAR45.
        EventDate        DATETIME18. 
        URL              $CHAR1500.
        LinkName         $CHAR1024.
        LinkContent      $CHAR2000. ;
    INFORMAT
        OYBAccountID     BEST7.
        JobID            BEST7.
        SubscriberKey    $CHAR45.
        EventDate        DATETIME18. 
        URL              $CHAR1500.
        LinkName         $CHAR1024.
        LinkContent      $CHAR2000. ;
    INFILE "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\&Yesterday._rc_clicks.csv"
        lrecl=32767
        ENCODING="utf-8"
        DLM=','
        MISSOVER
        DSD 
        FIRSTOBS=2 ;
    INPUT
        OYBAccountID     : ?? BEST7.
        JobID            : ?? BEST7.
        SubscriberKey    : $CHAR45.
        EventDate        : ?? ANYDTDTM29.
        URL              : $CHAR1500.
        LinkName         : $CHAR1024.
        LinkContent      : $CHAR2000.;
        ClickDate = datepart(EventDate);
        format ClickDate DDMMYY10.;
RUN;

/* Add in Choon Jobs file  */
DATA worklib.JobCHOON;
    LENGTH
        JobID              8
        DeliveredTime      8
        JobType          $ 13
        EmailName        $ 63 ;
    FORMAT
        JobID            BEST7.
        DeliveredTime    DATETIME18.
        JobType          $CHAR13.
        EmailName        $CHAR63. ;
    INFORMAT
        JobID            BEST7.
        DeliveredTime    DATETIME18.
        JobType          $CHAR13.
        EmailName        $CHAR63. ;
    INFILE 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\Job_File_Transfer_Choon.csv'
        LRECL=105
        ENCODING="utf-16le"
        DLM=','
        MISSOVER
        DSD 
        FIRSTOBS=2;
    INPUT
        JobID            : ?? BEST7.
        DeliveredTime    : ?? ANYDTDTM19.
        JobType          : $CHAR13.
        EmailName        : $CHAR63. ;
RUN;

data worklib.rc_clicks_&Yesterday.;
set worklib.rc_clicks_000;
    length CampaignID $25 m_id $32;
    fc=find(LinkContent,"utm_campaign=");
    famp=find(LinkContent,"&",fc);
    m = find(LinkContent,"&m_id=");
    if fc>0 then do
        CampaignID=substr(LinkContent,fc+13,famp-(fc+13));
    end;
    if m>0 then do;
        m_id = substr(LinkContent,m+6,32);
    end;
    drop fc famp m URL LinkName LinkContent;
run;

/*Joins cumulative file and last weeks update together*/
DATA worklib.Sends_Append;
SET matchb.Sends_append_&LastWeek
    worklib.rc_sends_&Yesterday.;
    IF OYBAccountID = 7258531 THEN CampaignSend = 'CEL';
        ELSE CampaignSend = 'NSO';
    IF OYBAccountID IN (7237650, 7237652, 7237655, 7237661, 7237665, 7237666, 7237667, 7237668, 7237669, 
        7237670, 7237673, 7258531, 7294903) THEN OUTPUT;
RUN;

/*Remover any duplicated records*/
PROC SORT DATA=worklib.Sends_Append
    OUT=matchb.Sends_Append_&Today
    NODUPKEY;
    BY JobID SubscriberKey SentDate;
RUN;

/*Put latest file into the WORK folder*/
data worklib.Sends_Append_&Today;
set matchb.Sends_Append_&Today;
run;

/*Joins cumulative file and last weeks update together*/
DATA worklib.Opens_Append;
SET matchb.Opens_append_&LastWeek
    worklib.rc_opens_&Yesterday.;
    IF OYBAccountID = 7258531 THEN CampaignSend = 'CEL';
        ELSE CampaignSend = 'NSO';
    IF OYBAccountID IN (7237650, 7237652, 7237655, 7237661, 7237665, 7237666, 7237667, 7237668, 7237669, 
        7237670, 7237673, 7258531, 7294903) THEN OUTPUT;
RUN;

/*Remover any duplicated records*/
PROC SORT DATA=worklib.Opens_Append
    OUT=matchb.Opens_Append_&Today
    NODUPKEY;
    BY JobID SubscriberKey OpenDate;
RUN;

/*Put latest file into the WORK folder*/
data worklib.Opens_Append_&Today;
set matchb.Opens_Append_&Today;
run;

/*Joins cumulative file and last weeks update together*/
DATA worklib.Clicks_Append;
SET matchb.Clicks_append_&LastWeek
    worklib.rc_clicks_&Yesterday.;
    IF OYBAccountID = 7258531 THEN CampaignSend = 'CEL';
        ELSE CampaignSend = 'NSO';
    IF OYBAccountID IN (7237650, 7237652, 7237655, 7237661, 7237665, 7237666, 7237667, 7237668, 7237669, 
        7237670, 7237673, 7258531, 7294903) THEN OUTPUT;
    drop url LinkName LinkContent ;
RUN;

/*Remover any duplicated records*/
PROC SORT DATA=worklib.Clicks_Append
    OUT=matchb.Clicks_Append_&Today
    NODUPKEY;
    BY JobID SubscriberKey ClickDate;
RUN;

/*Put latest file into the WORK folder*/
data worklib.Clicks_Append_&Today;
set matchb.Clicks_Append_&Today;
run;


DATA worklib.Product2_Salesforce;
set sasvdml.Product2 ;
RUN;


/*Gets the current currency rate*/
filename DAAA url
"https://www.dnb.no/portalfront/datafiles/miscellaneous/csv/kursliste_over_EN.csv?_=1581465794262";
data worklib.BY_AAA(drop=dd);
    length country $25;
    retain EUR ;
    infile DAAA dlm="," dsd ;
    input Country $ Unit ISO $ dd Buy Sell Change SettlementRate;
    newfx = buy/unit;
    if ISO = 'EUR' then EUR=buy ;
    new_fx = newfx/EUR ;
run;

/*Order Join*/
PROC SQL;
CREATE TABLE worklib.OrderJoin AS
SELECT  t1. ID,
    t1.ACCOUNT__C,
    t3.ID AS ContactID,
    t3.CONTACT_ID_18_DIGITS__C,
    t3.COUNTRYOFRESIDENCE__C,
    t3.MARKETINGID__C,
    t1.CURRENCYISOCODE__C,
    t1.ORDERNUMBER__C,
    t2.ORDERLINENUMBER__C as OI_ORDERLINENUMBER__C,
    t2.SALEPRICE__C as OI_SALEPRICE,
    t2.AMOUNT__C as OI_AMOUNT,
    t2.NETAMOUNT__C as OI_NETAMOUNT,
    t2.TAXAMOUNT__C as OI_TAXAMOUNT,
    t2.UNITPRICE__C as OI_UNITPRICE,
    t1.AMOUNT__C as O_AMOUNT,
    t1.SALEPRICE__C as O_SALEPRICE,
    t1.NETAMOUNT__C as O_NETAMOUNT,
    t1.TAXAMOUNT__C as O_TAXAMOUNT,
    t1.STATUS__C,
    t1.SUBMISSIONDATE__C,
    t1.TYPE__C,
    t1.PurchaseDate,
    t2.*,
    t4.new_fx
FROM sasvdml.Orders t1
LEFT JOIN sasvdml.OrderItem t2 ON (t1. ID = t2. order__c)
LEFT JOIN sasvdml.Account t3 ON (t1. Account__C = t3. AccountID)
LEFT JOIN worklib.BY_AAA t4 ON (t1.CURRENCYISOCODE__C = t4.ISO)
;
QUIT;

/*SP removed & count*/
PROC SQL;
CREATE TABLE worklib.Assets_NoSP AS
SELECT t1.*,
       t2.ACCOUNTID,
       t2.CONTACT_ID_18_DIGITS__C,
       t2.COUNTRYOFRESIDENCE__C,
       t2.ID AS ContactID,
       t2.MARKETINGID__C,
    (CASE WHEN t1.PurchaseDate IS MISSING THEN t1.InstallDate ELSE t1.PurchaseDate END) AS Date FORMAT DDMMYY10.
FROM sasvdml.Asset t1, sasvdml.Account t2 
WHERE t1.AccountID = t2.AccountID 
    AND t1.SelfRegistered__c = 'true' 
    AND t1.ContactID IS NOT MISSING 
    AND t1.REMOVED__C = 'false'
    AND t1.RETURNED__C = 'false'
;
QUIT;

PROC SORT DATA = worklib.Assets_NoSP
    OUT = worklib.AssetDedupe
    NODUPKEY;
    BY ContactID Name Date
;
QUIT;

PROC SQL;
CREATE TABLE worklib.ChoonClick AS
SELECT
    t2.OYBAccountID,
    t1.JobID,
    t1.name,
    t3.emailname,
    t3.JobType,
    t1.SendCompleteTime,
    t1.EmailsDelivered,
    t1.UniqueEmailsOpened,
    t1.OpenRate,
    t1.TotalClickThroughs,
    t1.UniqueClickThroughs,
    t1.UniqueClickThroughRate,
    t1.Unsubscribes,
    t1.UnsubscribeRate,
    t2.CampaignID
FROM sasvdml.emailsummaryreport_all t1
LEFT JOIN worklib.clicks_append t2 on t1. JobID = t2. JobID
LEFT JOIN worklib.jobchoon t3 on t1.JobID = t3.JobID
;
QUIT;

proc sort data=worklib.ChoonClick 
    out=worklib.uChoonClick_srtd 
    nodupkey;
    by JobID EmailsDelivered  ;
run;


/*Process required to complete Import Stage*/
PROC SQL; 
CREATE TABLE worklib.SendCampaign AS
    SELECT *
FROM worklib.Sends_append_&Today t1
LEFT JOIN worklib.uChoonClick_srtd t2 ON (t1. JobID = t2. JobID)
;
QUIT;


PROC SORT DATA = worklib.SendCampaign
    OUT = worklib.SendCampaignDedupe
    NODUPKEY;
    BY JobID SubscriberKey SentDate
;
QUIT;

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 30*'-' / ' TOTAL DURATION:' dur time13.2 / 30*'-';
run;

%include "C:\Users\Douglas.Hunter\MyData\MyDownloads\fix_Direct.sas";


/*
Removes files no longer required to create hard disc space for processing
PROC DELETE DATA=Sends&Today;
PROC DELETE DATA=Opens&Today;
PROC DELETE DATA=Clicks&Today;
PROC DELETE DATA=rc_sends_&Yesterday;
PROC DELETE DATA=rc_opens_&Yesterday;  
PROC DELETE DATA=rc_clicks_&Yesterday;
PROC DELETE DATA=rc_Clicks_000;

PROC DELETE DATA=Accounts;
PROC DELETE DATA=Orderitem;
PROC DELETE DATA=Orders;
PROC DELETE DATA=OrdersImport;
PROC DELETE DATA=Assets;
PROC DELETE DATA=Assets_nosp;

PROC DELETE DATA=Sends_Append;
PROC DELETE DATA=Opens_Append;
PROC DELETE DATA=Clicks_Append;
PROC DELETE DATA=Sendcampaign;
QUIT; 

proc datasets library=WORK kill; run; quit;


*/
