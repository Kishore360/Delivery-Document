SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for incident.priority_downgraded_c_flag' ELSE 'SUCCESS' END as Message from (
select case when locate('Y',b.res)>0 then 'Y' else 'N' end as priority_downgraded_c_flag,c.sys_id,
d.priority_downgraded_c_flag as target from (
select group_concat(a.flag) as res,a.documentkey from (
select case when newvalue>oldvalue then 'Y' else 'N' end as flag,documentkey from truist_mdsdb.sys_audit_final 
 where
tablename = 'incident' 
AND fieldname =  'priority' and oldvalue is not null and newvalue is not null
)a group by a.documentkey
)b
 join truist_mdsdb.incident_final c on b.documentkey=c.sys_id 
join truist_mdwdb.d_incident d on c.sys_id = d.row_id and c.sourceinstance = d. source_id
) e where priority_downgraded_c_flag <> target and c.cdctype<>'D';