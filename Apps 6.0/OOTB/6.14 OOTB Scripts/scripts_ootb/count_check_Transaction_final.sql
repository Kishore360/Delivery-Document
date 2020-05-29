SELECT CASE WHEN result = 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN result = 0 THEN 'MDS to DWH data validation failed for Transaction_final' ELSE 'SUCCESS' END as Message
 from 
 (select case when (select count(1) from app_test.transaction_nr ) = 
 (select count(1) from #MDS_TABLE_SCHEMA.Transaction_final) then 1 else 0 end as result) a
	