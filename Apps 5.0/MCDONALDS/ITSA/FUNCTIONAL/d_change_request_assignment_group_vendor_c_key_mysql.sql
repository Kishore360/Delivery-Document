SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from mcdonalds_mdsdb.change_request_final SRC1
left join (SELECT *, CONCAT('SUBSIDIARY~',left(vendors,32)) as jn1 FROM mcdonalds_mdsdb.sys_user_group_final) SRC 
on SRC1.assignment_group=SRC.sys_id and SRC1.sourceinstance=SRC.sourceinstance
join  (SELECT *, RIGHT(row_id,32) as jn2  FROM mcdonalds_mdwdb.d_internal_organization) TRGT
on SRC.sys_id = jn2 and SRC.sourceinstance = TRGT.source_id
LEFT JOIN mcdonalds_mdwdb.d_internal_organization LKP
on LKP.row_id = jn1 and LKP.source_id = SRC1.sourceinstance
where COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end)<>(TRGT.vendor_c_key);
