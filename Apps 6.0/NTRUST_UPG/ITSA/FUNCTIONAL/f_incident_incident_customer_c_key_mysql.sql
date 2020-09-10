SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.incident_customer_c_key' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
(select case when caller_id is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',caller_id) end as caller_id, sourceinstance,sys_id 
from     ntrust_mdsdb.incident_final where cdctype='X') SRC
JOIN ntrust_mdwdb.d_incident TRGT ON  SRC.sys_id    =TRGT.row_id and TRGT.source_id = SRC.sourceinstance
JOIN ntrust_mdwdb.d_internal_contact  TRGT2   on SRC.caller_id=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where coalesce(TRGT2.row_key,case when SRC.caller_id is null then 0 else -1 end)
         <> TRGT.incident_customer_c_key)temp;