SELECT 

CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,

CASE WHEN cnt > 0 THEN 'Data did not Match.'ELSE 'Data Matched' END AS Message 

FROM 
(select count(1) cnt 
from 
(select sys_id, sourceinstance, u_category from paloalto_mdsdb.incident_final where cdctype<>'D') a
 
left join 
(select row_key, source_id, src_rowid, dimension_class from  paloalto_mdwdb.d_lov where soft_deleted_flag<>'Y' )b 
 
on b.dimension_class like '%CATEGORY~INCIDENT%' 
and 
COALESCE(CONCAT('CATEGORY~INCIDENT','~',UPPER(a.u_category)),'UNSPECIFIED')=b.src_rowid
 
left join 
paloalto_mdwdb.d_incident c on a.sourceinstance=c.source_id and a.sys_id=c.row_id 

where COALESCE(b.row_key,case when a.u_category is null then 0 else -1 end)<>c.category_src_key)i; 