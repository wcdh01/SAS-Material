/**********************************************************************
	* FACCOUNT *
***********************************************************************/
    data WORK.FAccount    ;
    %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
    infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\faccounts.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
       informat ACCOUNTID__C $20. ;
       informat CONTACT_ID_18_DIGITS__PC $20. ;
       informat CANONIDUUID__C $38. ;
       informat MARKETINGID__PC $34. ;
       informat EMAILOPTIN__PC $7. ;
       informat PERSONEMAIL $32. ;
       informat LASTNAME $16. ;
       informat CREATEDBYID $20. ;
       informat CREATEDDATE $26. ;
       format ACCOUNTID__C $20. ;
       format CONTACT_ID_18_DIGITS__PC $20. ;
       format CANONIDUUID__C $38. ;
       format MARKETINGID__PC $34. ;
       format EMAILOPTIN__PC $7. ;
       format PERSONEMAIL $32. ;
       format LASTNAME $16. ;
       format CREATEDBYID $20. ;
       format CREATEDDATE $26. ;
    input
                ACCOUNTID__C  $
                CONTACT_ID_18_DIGITS__PC  $
                CANONIDUUID__C  $
                MARKETINGID__PC  $
                EMAILOPTIN__PC  $
                PERSONEMAIL  $
                LASTNAME  $
                CREATEDBYID  $
                CREATEDDATE  $
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
