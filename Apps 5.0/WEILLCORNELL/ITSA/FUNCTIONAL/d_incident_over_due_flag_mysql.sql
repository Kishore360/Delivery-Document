SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_incident.over_due_flag' ELSE 'SUCCESS' END as Message from (SELECT * FROM (
select (CASE WHEN  CONVERT_TZ(SRC.due_date,'GMT','America/New_York') < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM weillcornell_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number),'America/New_York','GMT') and TRGT.active_flag='Y' then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def,lkp.dimension_wh_code
FROM weillcornell_mdsdb.incident_final SRC 
LEFT JOIN weillcornell_mdwdb.d_incident TRGT ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id 
JOIN weillcornell_mdwdb.d_lov_map lkp ON TRGT.state_src_key = lkp.src_key AND lkp.dimension_wh_code ='OPEN'
WHERE due_date is not null -- and active_flag='Y'

AND SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' )) b
WHERE abc <> def
UNION ALL
SELECT * FROM(
select (CASE WHEN  CONVERT_TZ(SRC.due_date,'GMT','America/New_York') < CONVERT_TZ(SRC.resolved_at,'GMT','America/New_York') THEN 'Y' ELSE 'N' END)abc, 
(TRGT.over_due_flag )def,lkp.dimension_wh_code
FROM weillcornell_mdsdb.incident_final SRC 
LEFT JOIN weillcornell_mdwdb.d_incident TRGT ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id 
JOIN weillcornell_mdwdb.d_lov_map lkp ON TRGT.state_src_key = lkp.src_key AND lkp.dimension_wh_code IN ('CLOSED','RESOLVED')
WHERE due_date is not null -- and active_flag='Y'

AND SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' )) b
WHERE abc <> def 
) x
