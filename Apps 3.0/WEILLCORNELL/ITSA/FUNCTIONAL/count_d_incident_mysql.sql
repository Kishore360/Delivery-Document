SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt+2 as cnt, RES2.cntt from

(select count(SRC.sys_id) as cnt from
weillcornell_mdsdb.incident_final SRC
where  SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) ) as RES1,

(select count(row_id) as cntt 
from weillcornell_mdwdb.d_incident where soft_deleted_flag='N') RES2

)a;