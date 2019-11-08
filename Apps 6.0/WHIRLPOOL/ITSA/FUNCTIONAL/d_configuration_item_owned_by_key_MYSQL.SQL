SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM( select count(1) as cnt 
FROM  whirlpool_mdsdb.cmdb_ci_final SRC
left join  whirlpool_mdwdb.d_internal_contact lkp on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.owned_by),'UNSPECIFIED')=lkp.row_id
 and SRC.sourceinstance=lkp.source_id
 join whirlpool_mdwdb.d_configuration_item TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN SRC.owned_by   IS NULL THEN 0 else -1 end)<>(TRGT.owned_by_key)
and SRC.cdctype ='X')ma


