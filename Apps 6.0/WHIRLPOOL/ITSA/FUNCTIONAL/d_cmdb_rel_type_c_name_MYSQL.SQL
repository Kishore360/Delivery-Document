SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_cmdb_rel_type_c.name' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT count(1) as cnt from whirlpool_mdsdb.cmdb_rel_type_final a11
left join whirlpool_mdwdb.d_cmdb_rel_type_c a12
on a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id
where a11.name<>a12.name and a11.CDCTYPE='X')ma
