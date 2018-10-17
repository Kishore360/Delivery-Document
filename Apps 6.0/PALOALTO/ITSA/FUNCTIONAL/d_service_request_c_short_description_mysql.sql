SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_service_request_c.short_description' ELSE 'SUCCESS' END as Message 
from 

(select count(1) as cnt 

from (select sys_id,sourceinstance, short_description from paloalto_mdsdb.u_service_request_final where CDCTYPE<>'D') i
 
left join paloalto_mdwdb.d_service_request_c d
 
ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance 

where 
replace(convert(coalesce(i.short_description,'UNSPECIFIED') using ASCII),'?',' ')<>d.short_description)temp;