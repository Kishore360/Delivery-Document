
SELECT CASE WHEN cnt<>cntt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<>cntt THEN concat('Failure',(cnt-cntt)) ELSE 'Data Matched' END as Message
 FROM
(

select RES1.cnt+RES3.cnt as cnt, RES2.cntt from

(select count(sys_id) as cnt from
mercuryinsurance_mdsdb.incident_final) as RES1,

(select count(sys_id) as cnt from
mercuryinsurance_mdsdb.u_asc_ticket_final) as RES3,

(select count(row_id)-2 as cntt 
from mercuryinsurance_mdwdb.d_incident where soft_deleted_flag='N') RES2

)a; 

