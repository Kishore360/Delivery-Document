	SELECT CASE WHEN a.cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN a.cnt>0  
THEN 'MDS to DWH data validation failed for d_incident.incident_cbi_c_key' ELSE 'SUCCESS' END as Message FROM 
(select count(1) as cnt  from ntrs_mdsdb.incident_final a
left join ntrs_mdwdb.d_incident b11 on b11.row_id=a.sys_id and a.sourceinstance=b11.source_id

left join ntrs_mdwdb.d_lov b1 on b1.row_id=COALESCE(CONCAT('CBI_SRC_C~INCIDENT',
                '~',
                UPPER(a.u_cbi)),
                'UNSPECIFIED') and a.sourceinstance=b1.source_id
where  coalesce(b1.row_key,case when u_cbi is null then 0 else -1 end)<>b11.incident_cbi_c_key )a;