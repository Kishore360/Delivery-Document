SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(select count(1) CNT from 
(Select  (case when src.priority in (1,2) then 'Y' else 'N' end ) abc,trgt.major_incident_flag  def
FROM  aetna_mdsdb.incident_final src
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness where source_id=2 group by source_id) f1 on
 (f1.source_id = src.sourceinstance) and (src.cdctime<=f1.lastupdated) and src.cdctype<>'D'
join aetna_mdwdb.d_incident trgt 
  ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.row_id )a
where abc<>def
  )
temp;