SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
from mcdonalds_mdsdb.change_request_final SRC1
left join mcdonalds_mdsdb.sys_user_group_final SRC 
on SRC1.assignment_group=SRC.vendor and SRC1.sourceinstance=SRC.sourceinstance
join mcdonalds_mdwdb.d_change_request TRGT
on SRC1.sys_id = RIGHT(TRGT.row_id,32) and SRC1.sourceinstance = TRGT.source_id
LEFT JOIN mcdonalds_mdwdb.d_internal_organization LKP
on LKP.row_id = COALESCE(CONCAT('SUBSIDIARY~',left(SRC.vendors,32)),'UNSPECIFIED') and LKP.source_id = SRC1.sourceinstance
where COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end)<>(TRGT.vendor_c_key)


