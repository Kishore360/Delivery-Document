SELECT CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt  THEN 'MDS to DWH data validation failed for d_change_request.incident_impact_reason_c' ELSE 'SUCCESS' END as Message 
FROM(
select count(1) cnt from 
(select sys_id, sourceinstance,cdctime from aetna_mdsdb.change_request_final where cdctype<>'D') src
left join (select element_id,sourceinstance,value from aetna_mdsdb.sys_journal_field_final where name ='change_request' and element ='work_notes'
and locate(lower('Subject: RESOLVED'),lower(value))>0 or locate(lower('Subject:RESOLVED'),lower(value))>0)  src1 
on src.sys_id=src1.element_id and src.sourceinstance=src1.sourceinstance
join aetna_mdwdb.d_change_request trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = src.sourceinstance) and  (src.cdctime<=f1.lastupdated)
where
(CASE WHEN locate('subject: resolved',lower(src1.value)) > 0 THEN 
SUBSTRING(src1.value,locate('subject: resolved',lower(src1.value))+length('subject: resolved'),length(src1.value))
WHEN locate('subject: resolved',lower(src1.value))>0 THEN
SUBSTRING(src1.value,locate('subject:resolved',lower(src1.value))+length('subject:resolved'),length(src1.value))
ELSE 
'UNSPECIFIED' END) <> trgt.incident_impact_reason_c)a;

