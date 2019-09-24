SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_configuration_item_c.standard_num' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdwdb.f_configuration_item_c TRGT 
 JOIN rogers6_mdwdb.d_configuration_item LKP 
ON (TRGT.configuration_item_key = LKP.row_key 
AND  TRGT.source_id = LKP.source_id ) 
WHERE LKP.standard_num<> TRGT.standard_num
 and LKP.soft_deleted_flag='N'