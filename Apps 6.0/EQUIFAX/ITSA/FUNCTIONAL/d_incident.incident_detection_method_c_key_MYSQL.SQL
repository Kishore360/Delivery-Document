SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.incident_detection_method_c_key' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as cnt from equifax_mdsdb.incident_final src
join equifax_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join equifax_mdwdb.d_lov LKP on coalesce(concat('U_DETECTION_METHOD~INCIDENT~',src.u_detection_method),'UNSPECIFIED')=LKP.row_id
and src.sourceinstance=trgt.source_id
where coalesce(LKP.row_key,case when src.u_detection_method is null then 0 else -1 end)<>trgt.incident_detection_method_c_key and src.cdctype<>'D')ma;