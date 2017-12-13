SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
from gilead_mdsdb.sys_user_group_final SRC
join gilead_mdwdb.d_internal_organization TRGT
on SRC.sys_id = RIGHT(TRGT.row_id,32) and SRC.sourceinstance = TRGT.source_id
LEFT JOIN gilead_mdwdb.d_internal_organization LKP
on LKP.row_id = COALESCE(CONCAT('SUBSIDIARY~',left(SRC.vendors,32)),'UNSPECIFIED') and LKP.source_id = SRC.sourceinstance
where COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end)<>(TRGT.vendor_c_key)
