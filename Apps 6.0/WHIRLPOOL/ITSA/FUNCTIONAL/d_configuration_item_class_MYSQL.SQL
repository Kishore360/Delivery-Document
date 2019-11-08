
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.CLASS' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM whirlpool_mdsdb.cmdb_ci_final SRC 
left join whirlpool_mdsdb.sys_db_object_final sdof
on SRC.sys_class_name=sdof.name and SRC.SourceInstance=sdof.SourceInstance
join whirlpool_mdwdb.d_configuration_item TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where sdof.label<>TRGT.CLASS
and SRC.cdctype='X')ma;



 