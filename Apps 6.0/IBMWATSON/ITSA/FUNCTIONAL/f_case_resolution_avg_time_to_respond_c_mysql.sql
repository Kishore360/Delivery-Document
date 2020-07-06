SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_case.avg_time_to_respond_c' ELSE 'SUCCESS' END as Message from (
select count(1) cnt  
FROM ibmwatson_mdwdb.f_case fi 
inner join ibmwatson_mdwdb.d_case di on di.row_key=fi.case_key
inner join ( select documentkey ,sourceinstance, min(sys_created_on) as sys_created_on from 
(select documentkey,sys_created_on,newvalue,oldvalue,a.sourceinstance
from ibmwatson_mdsdb.sys_audit_final a 
where tablename='sn_customerservice_case' and fieldname='state' and sourceinstance=2
 )A
where oldvalue=1 group by 1,2 )r on di.row_id=r.documentkey and r.sourceinstance=di.source_id
where fi.avg_time_to_respond_c <> timestampdiff(second, di.opened_on, r.sys_created_on)
)a
;
