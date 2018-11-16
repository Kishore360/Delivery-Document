SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.changed_on' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_rsc_positions_final) SRC
left join  fidelity_mdwdb.d_resource_plan TRGT
on concat('POSITION~',SRC.position_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC.last_update_date,'GMT','America/New_York'),'')<> coalesce(TRGT.changed_on,'')