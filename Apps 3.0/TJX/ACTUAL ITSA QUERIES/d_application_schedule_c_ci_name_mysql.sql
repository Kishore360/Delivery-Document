 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt from tjx_mdsdb.us_applicationdetails_final SRC
left join tjx_mdsdb.cmdb_ci_final LKP on SRC.sys_id=LKP.sys_id and SRC.sourceinstance=LKP.sourceinstance 
join tjx_mdwdb.d_application_schedule_c TRGT on
 concat(SRC.sys_id,'~',location_id)=left(TRGT.row_id ,65)
 and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.application,'UNSPECIFIED' )<>TRGT.ci_name)a;


