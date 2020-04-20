SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM ge_mdsdb.change_request_final a
JOIN ge_mdwdb.d_change_request d ON a.sys_id=d.row_id AND a.sourceinstance=d.source_id
LEFT JOIN
(SELECT DISTINCT c.sourceinstance AS source_id,c.sys_id AS row_id,c.cdctype
FROM ge_mdsdb.change_request_final c
JOIN ge_mdsdb.incident_final i ON c.sys_id=i.caused_by AND c.sourceinstance=i.sourceinstance
WHERE i.caused_by IS NOT NULL AND (i.opened_at > c.end_date OR i.opened_at < c.start_date)) b
ON a.sys_id = b.row_id and a.sourceinstance = b.source_id
LEFT JOIN
(SELECT DISTINCT c.sourceinstance AS source_id,c.sys_id AS row_id,c.cdctype
FROM ge_mdsdb.change_request_final c
JOIN ge_mdsdb.label_final l ON c.number = l.name AND c.sourceinstance = l.sourceinstance
JOIN ge_mdsdb.label_entry_final le ON le.label = l.sys_id AND le.sourceinstance = l.sourceinstance
JOIN ge_mdsdb.incident_final i ON le.table_key = i.sys_id AND le.sourceinstance = i.sourceinstance
WHERE l.name LIKE 'GECHG%' AND le.id_type = 'Incident' AND (i.opened_at > c.end_date OR i.opened_at < c.start_date)) c
ON a.sys_id = c.row_id and a.sourceinstance = c.source_id
LEFT JOIN ge_mdwdb.d_lov_map lm ON lm.dimension_class = 'STATE~CHANGE_REQUEST' AND a.state=lm.dimension_code
AND lm.source_id=a.sourceinstance
WHERE a.cdctype<>'D' AND ((CASE
WHEN COALESCE(a.close_code,'UNSPECIFIED') in ('successful_issues','unsuccessful')
OR b.row_id is not null OR c.row_id is not null THEN 'Y'
WHEN (COALESCE(a.close_code,'UNSPECIFIED') not in ('successful_issues','unsuccessful')
AND b.row_id is null AND c.row_id is null) AND lm.dimension_wh_code <> ('CANCELED')
AND (date_format(a.end_date,'%d-%m-%Y') < '25-03-2020' OR lm.dimension_wh_code = ('CLOSED')) THEN 'N'
WHEN (COALESCE(a.close_code,'UNSPECIFIED') not in ('successful_issues','unsuccessful')
AND b.row_id is null AND c.row_id is null) AND (lm.dimension_wh_code = ('CANCELED')
OR ((date_format(a.end_date,'%d-%m-%Y') >= '25-03-2020' AND lm.dimension_wh_code <> ('CLOSED')))) THEN 'X'
ELSE 'X' END) <> d.failure_flag);