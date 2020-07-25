/*Creates access to worklib rather than SAS temp Work folder*/
libname worklib 'D:\Worklib';
run;
/*--- Email Summary Report ---*/
data WORKLIB.emailsummaryreport_DACH    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_DACH.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Benelux    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Benelux.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Central    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Central.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Greece ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Greece.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Iberia    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Iberia.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Italy    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Italy.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Russia    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Russia.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_Turkey    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Turkey.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_FR    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_FR.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;


data WORKLIB.emailsummaryreport_Nordics    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_Nordics.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_UK_IE    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_UK_IE.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;

data WORKLIB.emailsummaryreport_CEL    ;
infile 'C:\Users\Douglas.Hunter\MyData\DataTransfer\SFDC\MatchbackHistory\RecentEmailSendingSummary_CEL.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
    LENGTH
        JobID              8
        Name             $ 70
        Subject          $ 145
        SendStartTime      8
        SendCompleteTime   8
        EmailsSent         8
        EmailsDelivered    8
        Undeliverable      8
        SurveyResponses    8
        TotalClickThroughs   8
        UniqueClickThroughs   8
        UniqueEmailsOpened   8
        Unsubscribes       8
        FTAFForwarders     8
        FTAFRecipients     8
        FTAFSubscribers    8
        OpenRate         $ 8
        DeliverabilityRate $ 8
        BounceRate       $ 8
        UnsubscribeRate  $ 8
        UniqueClickThroughRate $ 10
        UniqueComplaints   8
        CumulativeComplaints   8 ;
    FORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INFORMAT
        JobID            BEST7.
        Name             $CHAR70.
        Subject          $CHAR145.
        SendStartTime    DATETIME18.
        SendCompleteTime DATETIME18.
        EmailsSent       BEST7.
        EmailsDelivered  BEST7.
        Undeliverable    BEST5.
        SurveyResponses  BEST1.
        TotalClickThroughs BEST5.
        UniqueClickThroughs BEST5.
        UniqueEmailsOpened BEST6.
        Unsubscribes     BEST4.
        FTAFForwarders   BEST1.
        FTAFRecipients   BEST1.
        FTAFSubscribers  BEST1.
        OpenRate         $CHAR8.
        DeliverabilityRate $CHAR8.
        BounceRate       $CHAR8.
        UnsubscribeRate  $CHAR8.
        UniqueClickThroughRate $CHAR10.
        UniqueComplaints BEST3.
        CumulativeComplaints BEST3. ;
    INPUT
        JobID            : ?? BEST7.
        Name             : $CHAR70.
        Subject          : $CHAR145.
        SendStartTime    : ?? ANYDTDTM19.
        SendCompleteTime : ?? ANYDTDTM19.
        EmailsSent       : ?? BEST7.
        EmailsDelivered  : ?? BEST7.
        Undeliverable    : ?? BEST5.
        SurveyResponses  : ?? BEST1.
        TotalClickThroughs : ?? BEST5.
        UniqueClickThroughs : ?? BEST5.
        UniqueEmailsOpened : ?? BEST6.
        Unsubscribes     : ?? BEST4.
        FTAFForwarders   : ?? BEST1.
        FTAFRecipients   : ?? BEST1.
        FTAFSubscribers  : ?? BEST1.
        OpenRate         : $CHAR8.
        DeliverabilityRate : $CHAR8.
        BounceRate       : $CHAR8.
        UnsubscribeRate  : $CHAR8.
        UniqueClickThroughRate : $CHAR10.
        UniqueComplaints : ?? BEST3.
        CumulativeComplaints : ?? BEST3. ;
RUN;


proc sql;
create table WORKLIB.emailsummaryreport_all as 
Select * from WORKLIB.emailsummaryreport_DACH
	union
Select * from WORKLIB.emailsummaryreport_Benelux
	union
Select * from WORKLIB.emailsummaryreport_Central
	union
Select * from WORKLIB.emailsummaryreport_Greece
	union
Select * from WORKLIB.emailsummaryreport_Iberia
	union
Select * from WORKLIB.emailsummaryreport_Italy
	union
Select * from WORKLIB.emailsummaryreport_Russia
	union
Select * from WORKLIB.emailsummaryreport_Turkey
	union
Select * from WORKLIB.emailsummaryreport_FR
	union
Select * from WORKLIB.emailsummaryreport_Nordics
	union
Select * from WORKLIB.emailsummaryreport_UK_IE
	union
Select * from WORKLIB.emailsummaryreport_CEL
;
quit;

