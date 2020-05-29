SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_goal_gis_c.comparison_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_sid_master_final src
left join wpl_mdwdb.d_sid_master_c trgt
on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and src.availableonsapbackupreport<>trgt.availableonsapbackupreport_c)ma
;
