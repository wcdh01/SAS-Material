/*************************************************************************/
        /* SASVDML_SharePoint 
        export SAS Data Set to S Drive CRMDT */
/*************************************************************************/


/*Extracts data from SFTP site and puts into directory
X "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\bq_transfer.bat" ;
*/
/* Start timer to record download time for files */
%let _timer_start = %sysfunc(datetime());

data _null_;
call system("C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\s7vdml_extract.bat");
run;

/***
# Download from remote directory 
RecentEmailSendingSummary_DACH_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_DACH.csv" 
RecentEmailSendingSummary_Central_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Central.csv" 
RecentEmailSendingSummary_Greece_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Greece.csv" 
RecentEmailSendingSummary_Iberia_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Iberia.csv" 
RecentEmailSendingSummary_Italy_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Italy.csv" 
RecentEmailSendingSummary_Russia_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Russia.csv" 
RecentEmailSendingSummary_Turkey_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Turkey.csv" 
RecentEmailSendingSummary_FR_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_FR.csv" 
RecentEmailSendingSummary_Nordics_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Nordics.csv" 
RecentEmailSendingSummary_UK_IE_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_UK_IE.csv" 
RecentEmailSendingSummary_Benelux_*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Benelux.csv"
Email_Engagement_Status_NVL.csv  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\*"
Email_Engagement_Status_Contact.csv  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\*"
nvl.csv  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\non_validated_lead.csv"
interactions.csv  "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\interactions.csv"
Emailname*.csv "C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\*"


***/

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 30*'-' / ' TOTAL DURATION:' dur time13.2 / 30*'-';
run;


/* Start timer to record runtime of program */
%let _timer_start = %sysfunc(datetime());

* imports required files;
filename folder "C:\Users\Douglas.Hunter\MyData\MyDownloads";
/*%include folder(WelcomePack_import);*/
%include folder(sfdc_import);
%include folder(asset_import);
%include folder(product2_import);
%include folder(faccount_import);
%include folder(interactions_import);
%include folder(nvl_import);
%include folder(cps_import);
%include folder(email_engagement_import);
%include folder(ecom_import);
%include folder(addrcity_import);
%include folder(all_emailsummaryreport_import);

/*%Let path=C:\Users\Douglas.Hunter\MyData\MyDownloads ;*/
/*%include "&path/WelcomePack_import" ;*/

/******************************************************************************
        Saves files to SASVDML directory D:\SASVDML
******************************************************************************/
data SASVDML.Account;
    set work.sfdc;
run;

data SASVDML.faccount;
    set work.faccount;
run;

data SASVDML.Product2;
    set work.Product2;
run;

data SASVDML.Asset;
    set work.Asset;
run;

data SASVDML.MembershipScheme__c;
    set work.cps;
run;

data SASVDML.email_engagement;
    set work.email_engagement;
run;

data SASVDML.STATUS_NVL;
    set work.STATUS_NVL;
run;

data SASVDML.NVL;
    set work.NVL;
run;

data SASVDML.Interactions;
    set work.Interactions;
run;

data SASVDML.ORDERS;
    set work.ORDERS;
run;

data SASVDML.ORDERITEM;
    set work.ORDERITEM;
run;

data SASVDML.ADDRCITY;
    set work.AddrCity;
run;

data SASVDML.Emailsummaryreport_all;
    set worklib.Emailsummaryreport_all;
run;


/*Count 10,996,678 and 47 columns*/
PROC SQL; 
CREATE TABLE sasvdml.Asset_Product2 AS 
SELECT t1.*,t1.ID as Asset_ID, t2.*, t2.ID as Prd2_ID, t2.Name as Prod2_Name
,case when t2.cemiscode__c = '--' and t2.subcategory__c = 'EOS' then 'AC' else cemiscode__c end as cemiscode
,CASE WHEN NOT MISSING(T1.PURCHASEDATE) THEN PURCHASEDATE ELSE T1.INSTALLDATE END AS PURCHASE_DATE FORMAT YYMMDD10.
,put(calculated PURCHASE_DATE,Year4.) as Purchase_Year
,put(calculated PURCHASE_DATE,Year4.) as Year
,1 as user_with_products 
,index(t3.personemail,"_") as m4
,SUBSTR(t2.mercurycode__c,1,8) as MC8
FROM SASVDML.ASSET t1, SASVDML.Product2 t2, SASVDML.faccount t3
WHERE t1.PRODUCT2ID = t2.ID 
    AND t1.contactid = t3.CONTACT_ID_18_DIGITS__PC
    AND calculated m4 NE 1
    AND t1.contactid is not missing 
    AND t1.REMOVED__C = 'false' 
    AND t1.RETURNED__C = 'false'
;
quit;

/*Adds the Account table - Count = 10,996,166 rows and 85 column*/
proc sql;
create table sasvdml.asset_prod2_price as
Select t1.*, t1.name as Asset_Name
,t2.*, t2.Name as Prod2_Name
,SUBSTR(t2.mercurycode__c,1,8) as MC8
,t3.CANONIDUUID__C
,t3.MARKETINGID__PC
,t3.EMAILOPTIN__PC
,t4.product_value
,case when t2.cemiscode__c = '--' and t2.subcategory__c = 'EOS' then 'AC' else cemiscode__c end as cemiscode__c
,CASE WHEN NOT MISSING(T1.PURCHASEDATE) THEN PURCHASEDATE ELSE T1.INSTALLDATE END AS PURCHASE_DATE FORMAT YYMMDD10.
,put(calculated PURCHASE_DATE,Year4.) as Purchase_Year
,put(calculated PURCHASE_DATE,Year4.) as Year
,index(t3.personemail,"_") as m4
from SASVDML.ASSET t1
Inner Join SASVDML.Product2 t2 on t1.PRODUCT2ID = t2.ID
Inner Join SASVDML.faccount t3 on  t1.contactid = t3.CONTACT_ID_18_DIGITS__PC
Left Join SASVDML.PricingListData t4 on t1.Product2ID = t4.ID
where calculated m4 NE 1
    AND t1.contactid is not missing 
    AND t1.REMOVED__C = 'false' 
    AND t1.RETURNED__C = 'false'
ORDER BY 1 ASC
;
quit;


PROC SQL;
CREATE TABLE SASVDML.Final_Fullecom AS
SELECT *,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN O_SALEPRICE__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN O_SALEPRICE__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN O_SALEPRICE__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN O_SALEPRICE__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN O_SALEPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN O_SALEPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN O_SALEPRICE__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN O_SALEPRICE__C*0.23
        ELSE 0
    END) AS O_EUR_SALEPRICE FORMAT 8.2,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN O_AMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN O_AMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN O_AMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN O_AMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN O_AMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN O_AMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN O_AMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN O_AMOUNT__C*0.23
        ELSE 0
    END) AS O_EUR_AMOUNT FORMAT 8.2,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN O_NETAMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN O_NETAMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN O_NETAMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN O_NETAMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN O_NETAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN O_NETAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN O_NETAMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN O_NETAMOUNT__C*0.23
        ELSE 0
    END) AS O_EUR_NETAMOUNT FORMAT 8.2,
        (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN O_TAXAMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN O_TAXAMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN O_TAXAMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN O_TAXAMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN O_TAXAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN O_TAXAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN O_TAXAMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN O_TAXAMOUNT__C*0.23
        ELSE 0
    END) AS O_EUR_TAXAMOUNT FORMAT 8.2,
   (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN OI_SALEPRICE__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN OI_SALEPRICE__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN OI_SALEPRICE__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN OI_SALEPRICE__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN OI_SALEPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN OI_SALEPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN OI_SALEPRICE__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN OI_SALEPRICE__C*0.23
        ELSE 0
    END) AS OI_EUR_SALEPRICE FORMAT 8.2,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN OI_AMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN OI_AMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN OI_AMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN OI_AMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN OI_AMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN OI_AMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN OI_AMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN OI_AMOUNT__C*0.23
        ELSE 0
    END) AS OI_EUR_AMOUNT FORMAT 8.2,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN OI_UNITPRICE__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN OI_UNITPRICE__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN OI_UNITPRICE__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN OI_UNITPRICE__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN OI_UNITPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN OI_UNITPRICE__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN OI_UNITPRICE__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN OI_UNITPRICE__C*0.23
        ELSE 0
    END) AS OI_EUR_UNITPRICE FORMAT 8.2,
    (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN OI_NETAMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN OI_NETAMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN OI_NETAMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN OI_NETAMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN OI_NETAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN OI_NETAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN OI_NETAMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN OI_NETAMOUNT__C*0.23
        ELSE 0
    END) AS OI_EUR_NETAMOUNT FORMAT 8.2,
        (CASE
        WHEN O_CURRENCYISOCODE__C = 'EUR' or O_COUNTRYOFRESIDENCE__C IN ('AT' 'BE' 'DE' 'ES' 'FI' 'FR' 'IE' 'IT' 'NL' 'PT') THEN OI_TAXAMOUNT__C*1.00
        WHEN O_CURRENCYISOCODE__C = 'CHF' or O_COUNTRYOFRESIDENCE__C = 'CH' THEN OI_TAXAMOUNT__C*0.94
        WHEN O_CURRENCYISOCODE__C = 'DKK' or O_COUNTRYOFRESIDENCE__C = 'DK' THEN OI_TAXAMOUNT__C*0.13
        WHEN O_CURRENCYISOCODE__C = 'GBP' or O_COUNTRYOFRESIDENCE__C = 'GB' THEN OI_TAXAMOUNT__C*1.17
        WHEN O_CURRENCYISOCODE__C = 'NOK' or O_COUNTRYOFRESIDENCE__C = 'NO' THEN OI_TAXAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'SEK' or O_COUNTRYOFRESIDENCE__C = 'SE' THEN OI_TAXAMOUNT__C*0.11
        WHEN O_CURRENCYISOCODE__C = 'AED' or O_COUNTRYOFRESIDENCE__C = 'AE' THEN OI_TAXAMOUNT__C*0.22
        WHEN O_CURRENCYISOCODE__C = 'PLN' or O_COUNTRYOFRESIDENCE__C = 'PL' THEN OI_TAXAMOUNT__C*0.23
        ELSE 0
    END) AS OI_EUR_TAXAMOUNT FORMAT 8.2
FROM sasvdml.fullecom_0
;
QUIT;

/*15,760,657 rows and 82 columns */
PROC SQL;
   CREATE TABLE SASVDML.core_sftbl AS
   SELECT t1.ACCOUNTID, 
          t1.BIRTHDATE, 
          t1.CANONIDREGISTRATIONCLIENTID__C, 
          t1.CANONIDVALIDATEDEMAIL__C, 
          t1.CONTACT_ID_18_DIGITS__C, 
          t1.CONTACT_SEGMENTATION__C, 
          t1.CONTACTCANONIDUUID__C, 
          t1.CORPORATEEMPLOYEE__C, 
          t1.COUNTRYOFRESIDENCE__C, 
          t1.DESCRIPTION, 
          t1.EMAILBOUNCEDDATE, 
          t1.EMAILBOUNCEDREASON, 
          t1.EMAILOPTIN__C, 
          t1.EMPLOYEETYPE__C, 
          t1.EXTERNALID__C, 
          t1.GENDER__C, 
          t1.ID, 
          t1.IRISTAUSER__C, 
          t1.IS_PII_DELETED__C, 
          t1.ISCPSACCOUNT__C, 
          t1.LANGUAGE__C, 
          t1.MAILINGCITY, 
          t1.MARKETINGCONSENT__C, 
          t1.MARKETINGID__C, 
          t1.NONVALIDATEDLEAD__C, 
          t1.POSTOPTIN__C, 
          t1.PROFILECOMPLETIONPERCENTAGE__C, 
          t1.PROXY_CONSUMER_SEGMENT__C, 
          t1.REGISTRATIONDATE__C, 
          t1.REGISTRATIONORIGIN__C, 
          t1.REGISTRATIONTIMEDAYS__C, 
          t1.SEG_CAMERAKNOWLEDGE__C, 
          t1.SEG_INCOMEFREQUENCY__C, 
          t1.SEG_MAINPHOTOSPECIALITIES__C, 
          t1.SEG_MAINPHOTOSPECIALTIESOTHER__C, 
          t1.SEG_MAINVIDEOSPECIALITIES__C, 
          t1.SEG_MAINVIDEOSPECIALTIESOTHER__C, 
          t1.SEG_OTHERPHOTOSPECIALITIES__C, 
          t1.SEG_OTHERPHOTOSPECIALITIESOTH, 
          t1.SEG_OTHERVIDEOSPECIALITIES__C, 
          t1.SEG_OTHERVIDEOSPECIALITIESOTH, 
          t1.SEG_PHOTOGRAPHYSKILL__C, 
          t1.SEG_PHOTOGRAPHYVIDEOIMPORTANCE,
          t1.SEG_RELATABLESTATEMENTS__C, 
          t1.SEG_VIDEOSKILLS__C, 
          t1.SEGMENTATION__C, 
          t1.SMSOPTIN__C, 
          t1.SOURCE__C, 
          t1.SOURCESYSTEM__C, 
          t1.TRUE_CONSUMER_SEGMENT__C, 
          t1.UNSUBSCRIBEREASON__C, 
          t1.REGDATE,
          t1.CREATDATE,
          t2.CONTACTID, 
          t2.PARENTID, 
          t2.PRODUCT2ID, 
          t2.CREATEDDATE, 
          t2.CREATEDBYID, 
          t2.LASTMODIFIEDDATE, 
          t2.LASTMODIFIEDBYID, 
          t2.SYSTEMMODSTAMP, 
          t2.NAME, 
          t2.SERIALNUMBER, 
          t2.INSTALLDATE, 
          t2.PURCHASEDATE, 
          t2.REMOVED__C, 
          t2.ASSETSREPORTFIELD__C, 
          t2.RETURNED__C, 
          t2.SALESPROMOTION__C, 
          t2.SELFREGISTERED__C, 
          t2.ISPROASSET__C, 
          t2.POINTSNOTRECALCULATED__C, 
          t2.POINTSWITHHELD__C, 
          t2.PRODUCTPOINTS__C, 
          t2.PROXY_PURCHASE_DATE__C, 
          t2.ISGREY__C, 
          t3.PRODUCTCODE, 
          t3.FAMILY, 
          t3.SUBCATEGORY__C, 
          t3.MERCURYCODE__C, 
          t3.CATEGORY__C, 
          t4.Product_Value,
          case when missing(REGDATE) then CREATDATE else REGDATE end as Proxy_RegDate format date9.,
          index(t5.personemail,"_") as m4
      FROM SASVDML.ACCOUNT t1
           LEFT JOIN SASVDML.ASSET t2 ON (t1.CONTACT_ID_18_DIGITS__C = t2.CONTACTID)
           LEFT JOIN SASVDML.PRODUCT2 t3 ON (t2.PRODUCT2ID = t3.ID)
           LEFT JOIN SASVDML.PRICINGLISTDATA t4 ON (t2.PRODUCT2ID = t4.ID)
           LEFT JOIN SASVDML.FACCOUNT t5 ON (t1.CONTACT_ID_18_DIGITS__C = t5.CONTACT_ID_18_DIGITS__PC)
      WHERE calculated m4 NE 1
            AND t1.CONTACT_ID_18_DIGITS__C is not missing
            AND t2.REMOVED__C = 'false' 
            AND t2.RETURNED__C = 'false'
;
QUIT;

proc contents data=sasvdml._all_ nods;
run;

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 30*'-' / ' TOTAL DURATION:' dur time13.2 / 30*'-';
run;


/* Start timer to record time it takes to put files into sftp */
%let _timer_start = %sysfunc(datetime());

data _null_;
call system("C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\crmdt_transfer.bat");
run;
/***
D:\SASVDML\Account.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\MembershipScheme__c.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\email_engagement.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\STATUS_NVL.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\NVL.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\Interactions.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\ADDRCITY.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\Emailsummaryreport_all.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\Asset_Product2.sas7bdat /Digital_River/CRMDT/*.*
D:\SASVDML\Final_Fullecom.sas7bdat /Digital_River/CRMDT/*.*
***/

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 30*'-' / ' TOTAL DURATION:' dur time13.2 / 30*'-';
run;


/* Start timer to prepare and upload files to SAS server */
%let _timer_start = %sysfunc(datetime());

libname sasvdml 'D:\SASVDML' cvpmultiplier=3.0;
libname outlib 'D:\u8' outencoding='UTF-8';
proc copy noclone in=sasvdml out=outlib  memtype=(data catalog);
    select product2 asset account orders orderitem final_fullecom;
run;
libname sasvdml 'D:\SASVDML' ;

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 50*'-' / ' TOTAL DURATION utf8 Conversion:' dur time13.2 / 30*'-';
run;


/* Start timer to prepare and upload files to SAS server */
%let _timer_start = %sysfunc(datetime());

data _null_;
call system("C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\vyeExtract.bat");
run;

/***
# Upload to remote directory
D:\u8\Product2.sas7bdat /Incoming/Product2.sas7bdat
D:\u8\account.sas7bdat /Incoming/account.sas7bdat
D:\u8\asset.sas7bdat /Incoming/asset.sas7bdat
D:\u8\Orders.sas7bdat /Incoming/*.sas7bdat
D:\u8\OrderItem.sas7bdat /Incoming/*.sas7bdat
***/

/* Stop timer */
data _null_;
  dur = datetime() - &_timer_start;
  put 45*'-' / ' TOTAL DURATION vyeExtract:' dur time13.2 / 30*'-';
run;
