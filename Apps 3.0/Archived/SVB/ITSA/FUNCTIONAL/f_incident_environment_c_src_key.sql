 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.incident_final SRC
LEFT JOIN svb_mdsdb.cmdb_ci_final c
on SRC.cmdb_ci=c.sys_id and SRC.sourceinstance=c.sourceinstance
join 
svb_mdwdb.f_incident trgt
on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id
join
svb_mdwdb.d_lov lkp
on COALESCE( CONCAT('ENVIRONMENT~CMDB_CI~~~',UPPER(c.u_environment )),'UNSPECIFIED')=lkp.row_id
where COALESCE(lkp.row_key,case when c.u_environment is null then 0 else -1 end )<>trgt.environment_c_src_key
)c		
