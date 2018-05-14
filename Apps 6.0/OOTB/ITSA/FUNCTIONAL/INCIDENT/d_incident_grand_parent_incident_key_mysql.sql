
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.grand_parent_incident_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
from (
SELECT CASE
              WHEN si.grand_parent_incident_id ='UNSPECIFIED' THEN 0
              ELSE (di.row_key)
          END AS row_key,
          si.row_id AS row_id,
          si.source_id,
    COALESCE(di.grand_parent_incident_key,'') as grand_parent_incident_key
   FROM (select 
COALESCE(parent_i.parent_incident,'UNSPECIFIED') as grand_parent_incident_id
,i.SourceInstance as source_id
,i.sys_id as row_id
FROM <<tenant>>_mdsdb.incident_final i
LEFT JOIN <<tenant>>_mdsdb.incident_final parent_i
ON i.parent_incident=parent_i.sys_id)si
   LEFT JOIN <<tenant>>_mdwdb.d_incident di ON si.grand_parent_incident_id =di.row_id
   AND di.source_id = CASE
                          WHEN si.grand_parent_incident_id = 'UNSPECIFIED' THEN 0
                          ELSE si.source_id
                      END)A  
       LEFT JOIN <<tenant>>_mdwdb.d_incident d1 ON d1.row_id = A.row_id
AND d1.source_id = A.source_id
where  d1.grand_parent_incident_key <> A.row_key)b