SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM pandg_mdsdb.incident_final a
 join pandg_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE case when a.u_financial_impact_recoverable=1 then 'Y' else 'N' end<> b.u_financial_impact_recoverable_c;


