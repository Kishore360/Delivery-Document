SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
aruba_mdsdb.incident_final) as RES1,

(select count(row_id)-2 as cntt 
from aruba_mdwdb.d_incident) RES2

)a;