SELECT
 CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message
 
FROM 
( select count(1) as cnt 
from 
(select sys_id, sourceinstance,u_subcategory from pan_mdsdb.incident_final where cdctype<>'D') SRC 
 
LEFT JOIN pan_mdwdb.d_incident TRGT 
 
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

LEFT JOIN (select src_rowid, source_id, row_key, dimension_class from  pan_mdwdb.d_lov ) LKP 
 
ON LKP.dimension_class like '%CATEGORY~INCIDENT%' and  ( concat('SUBCATEGORY~INCIDENT','~~~',upper(SRC.u_subcategory))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_subcategory IS NULL THEN 0 else '-1' end)<> (TRGT.sub_category_src_key)) temp;