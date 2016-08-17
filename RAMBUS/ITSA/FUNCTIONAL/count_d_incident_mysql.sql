SELECT CASE WHEN src+src1<>trgt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN src+src1<>trgt THEN 'Failure' ELSE 'Data Matched' END as Message

 FROM
(

select RES1.cnt+2 as src , RES2.cntt as trgt,RES3.cnt2 as src1 
from

(select count(sys_id) as cnt 
from 
rambus_mdsdb.incident_final) as RES1,

(select count(sys_id) as cnt2 from 
rambus_mdsdb.u_ad_hoc_request_final) as RES3,


(select count(row_id) as cntt 
from rambus_mdwdb.d_incident where row_key not in (-1,0)) RES2

) a;