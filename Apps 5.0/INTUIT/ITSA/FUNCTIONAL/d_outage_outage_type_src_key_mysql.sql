SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for d_outage.outage_type_src_key' 
         ELSE 'SUCCESS' 
       END AS Message 
 FROM
                intuit_mdsdb.cmdb_ci_outage_final cmdb_ci_outage   
join  intuit_mdwdb.d_outage d on d.row_id = cmdb_ci_outage.sys_id  AND d.source_id = cmdb_ci_outage.sourceinstance				
left join intuit_mdwdb.d_lov b
on coalesce (CONCAT('TYPE','~','OUTAGE','~','~','~',UPPER(cmdb_ci_outage.type )),'UNSPECIFIED') = b.src_rowid 
where
coalesce(b.row_key,case when cmdb_ci_outage.type is null then 0 else -1 end ) <>d.outage_type_src_key