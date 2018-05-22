SELECT COALESCE( CAST(coalesce(round(SRC.requested_hours),0) as decimal(20,10)),''), COALESCE(cast(round(TRGT.requested_hours) as decimal(20,10)),'')
from (select SUBSTRING_INDEX(row_id,'~',1) as source_row_id, resource_plan_key, project_key, resource_key,sum(F.requested_hours) as requested_hours 
from <<tenant>>_mdwdb.f_resource_allocation F
group by SUBSTRING_INDEX(row_id,'~',1) , resource_plan_key, project_key, resource_key
)TRGT
join <<tenant>>_mdsdb.resource_allocation_final SRC
on TRGT.source_row_id = SRC.sys_id
JOIN <<tenant>>_mdsdb.resource_plan_final  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
WHERE COALESCE( CAST(coalesce(round(SRC.requested_hours),0) as decimal(20,10)),'')<> COALESCE(cast(round(TRGT.requested_hours) as decimal(20,10)),'');
