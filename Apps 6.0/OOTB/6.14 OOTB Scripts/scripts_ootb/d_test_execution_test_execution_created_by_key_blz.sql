SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.test_execution_created_by_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON  COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.runneruserid),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(SRC.runneruserid,'UNSPECIFIED') is null THEN 0 else '-1' end)<> COALESCE(TRGT.test_execution_created_by_key,'')