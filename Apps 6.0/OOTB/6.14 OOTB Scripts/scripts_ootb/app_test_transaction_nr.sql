DROP TABLE IF EXISTS app_test.transaction_nr;

CREATE TABLE app_test.transaction_nr ( sys_id varchar(255),  sourceinstance bigint(20) DEFAULT NULL,  
 tripId varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,   cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL, 
 error tinyint(1) DEFAULT NULL,   duration decimal(38,0) DEFAULT NULL,   transactionSubType varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
 appId decimal(38,0) DEFAULT NULL,   apdexPerfZone varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
 host varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,   databaseCallCount decimal(38,0) DEFAULT NULL, 
 timestamp decimal(38,0) DEFAULT NULL,   cdchash varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL, 
 cdchash_sequence int(11) DEFAULT NULL,   appName varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
 totalTime decimal(38,0) DEFAULT NULL,   databaseDuration decimal(38,0) DEFAULT NULL,  
 externalCallCount decimal(38,0) DEFAULT NULL,   transactionType varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
 _numerify_batchid bigint(20) DEFAULT NULL,   port decimal(38,0) DEFAULT NULL,   externalDuration decimal(38,0) DEFAULT NULL, 
 name varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,   cdctime datetime DEFAULT NULL,  
 httpResponseCode varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,   realAgentId decimal(38,0) DEFAULT NULL,   
 KEY index_1 (appId) USING BTREE,   KEY index_3 (cdchash) USING BTREE,   KEY ibi_transaction_final (_numerify_batchid) USING BTREE, 
 KEY test_tran (name,appId,sourceinstance) ) 
 as (select CONCAT( COALESCE(DATE_FORMAT(FROM_UNIXTIME(Transaction.timestamp/1000-MOD(Transaction.timestamp/1000, 600)), '%Y%m%d%H%i'),
 'UNSPECIFIED'), '~', COALESCE(FLOOR(Transaction.appId), 'UNSPECIFIED'), '~', COALESCE(Transaction.name, 'UNSPECIFIED'), '~',
 COALESCE(Transaction.host, 'UNSPECIFIED') ) as sys_id, Transaction.* from #MDS_TABLE_SCHEMA.Transaction_final Transaction);
 
 