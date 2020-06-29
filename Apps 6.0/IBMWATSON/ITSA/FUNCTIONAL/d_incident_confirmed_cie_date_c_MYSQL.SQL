SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 from ibmwatson_mdsdb.incident_final src
 left join ibmwatson_mdwdb.d_incident trgt
 on src.sys_id = trgt.row_id 
 and src.sourceinstance = trgt.source_id
left join 
(select t.sourceinstance, t.documentkey, max(t.sys_created_on) as cie_created_on
from ibmwatson_mdsdb.sys_audit_final t
JOIN ibmwatson_mdsdb.incident_final d
ON( d.sourceinstance=t.sourceinstance and
 d.sys_id=t.documentkey)
where fieldname='u_status' and tablename='incident' and t.newvalue = 21
group by t.sourceinstance, t.documentkey)sd
on sd.documentkey=trgt.row_id and sd.sourceinstance=trgt.source_id
where trgt.confirmed_cie_date_c <> case when src.u_status = 21 then sd.cie_created_on else null end;
-- END