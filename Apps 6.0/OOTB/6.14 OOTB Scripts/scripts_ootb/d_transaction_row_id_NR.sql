SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.country_code' ELSE 'SUCCESS' END as Message
FROM
    (SELECT DISTINCT pageview.name, pageview.appId, pageview.sourceinstance
    FROM #MDS_TABLE_SCHEMA.PageView_final pageview
    LEFT OUTER JOIN #MDS_TABLE_SCHEMA.key_transactions_final key_transactions
    ON SUBSTR(SUBSTR(pageview.name, INSTR(pageview.name, '/')), INSTR(SUBSTR(pageview.name, INSTR(pageview.name, '/') + 1), '/') + 1) 
    LIKE CONCAT(key_transactions.transactionname, '%')
        AND pageview.appId = key_transactions.applicationid
    WHERE key_transactions.name IS NULL 
        UNION 
        SELECT DISTINCT Transaction.name, Transaction.appId, Transaction.sourceinstance
    FROM app_test.transaction_nr Transaction
    LEFT OUTER JOIN
     #MDS_TABLE_SCHEMA.key_transactions_final key_transactions 
     ON substr( substr(Transaction.name,instr(Transaction.name,'/')),instr( substr(Transaction.name,instr(Transaction.name,'/')+ 1),'/')+1 )
     like  CONCAT(key_transactions.transactionname,'%') AND Transaction.appId = key_transactions.applicationid       
            WHERE NOT EXISTS (SELECT DISTINCT appId,name FROM
                        #MDS_TABLE_SCHEMA.PageView_final pg WHERE pg.appId = Transaction.appId AND pg.name=Transaction.name  ) 
                AND key_transactions.name IS NULL    
    UNION 
    SELECT DISTINCT name, applicationid AS appID, sourceinstance
    FROM
        #MDS_TABLE_SCHEMA.key_transactions_final) SRC
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_transaction TRGT ON (CONCAT(SRC.name, '~', SRC.appId) = TRGT.row_id
        AND SRC.sourceinstance = TRGT.source_id)
WHERE
    COALESCE(CONCAT(SRC.name, '~', SRC.appId), '') <> COALESCE(TRGT.row_id, '')
