
SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message from (

select RES1.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
<<tenant>>_mdsdb.incident_final
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance) and (cdctime<=f1.lastupdated)
) as RES1,

(select count(row_id)-2 as cntt 
from <<tenant>>_mdwdb.d_incident where   soft_deleted_flag='N' ) RES2

)a; 


