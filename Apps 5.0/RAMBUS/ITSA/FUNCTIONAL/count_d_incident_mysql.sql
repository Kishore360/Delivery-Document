 SELECT CASE WHEN src<>trgt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN src<>trgt THEN 'Failure' ELSE 'Data Matched' END as Message
FROM(
select RES1.cnt as src , RES2.cntt as trgt
from
(select count(sys_id) as cnt 
from 
rambus_mdsdb.incident_final) as RES1,
(select count(row_id) as cntt 
from rambus_mdwdb.d_incident where row_key not in (-1,0) and soft_deleted_flag='N') RES2
) a