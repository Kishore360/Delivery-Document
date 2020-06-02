 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_test_execution.test_type_src_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.blz_master_final where cdctype<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.blz_test_final)SRC1
on SRC.testid=SRC1.id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_test_execution TRGT
on SRC.id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov LKP 
ON CONCAT('TEST_EXECUTION~TEST_TYPE~',CASE 
WHEN SRC1.configuration_type='functionalApi' THEN 'API_FUNCTIONAL_TEST' 
WHEN SRC1.configuration_type='functionalGui' THEN 'GUI_FUNCTIONAL_TEST' 
WHEN SRC1.configuration_testMode='http' THEN 'URL_TEST' WHEN SRC1.configuration_testMode='script' 
THEN  CONCAT(UPPER(SRC1.configuration_scriptType),'_TEST') END) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.configuration_testmode is null THEN 0 else '-1' end)<>COALESCE(TRGT.test_type_src_key,'');
 
 
