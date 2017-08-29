SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.assigned_loc_cost' ELSE 'SUCCESS' END as Message
 from (select SUBSTRING_INDEX(row_id,'~',1) as source_row_id, resource_plan_key, project_key, resource_key,sum(F.assigned_loc_cost) as assigned_loc_cost 
from <<tenant>>_mdwdb.f_resource_allocation F
group by SUBSTRING_INDEX(row_id,'~',1) , resource_plan_key, project_key, resource_key
)TRGT
join <<tenant>>_mdsdb.resource_allocation_final SRC
on TRGT.source_row_id = SRC.sys_id
JOIN <<tenant>>_mdsdb.resource_plan_final  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
LEFT JOIN <<tenant>>_mdsdb.fx_currency_instance_final FX1  
ON (FX1.id = SRC.sys_id 
AND FX1.sourceinstance = SRC.sourceinstance 
AND FX1.field = 'ASSIGNED_COST')
WHERE COALESCE( CAST(coalesce(FX1.amount,0) as decimal(20,10)),'')<> COALESCE(cast(round(TRGT.assigned_loc_cost) as decimal(20,10)),'');
