SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(Select Count(1) AS CNT 
FROM  aetna_mdsdb.incident_final src
left join aetna_mdwdb.d_incident trgt 
  ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.row_id 
where 
 (case when src.priority in (1,2) then 'Y' else 'N' end )<>trgt.major_incident_flag  and src.cdctype<>'D')
temp;