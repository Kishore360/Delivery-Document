SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdsdb.incident_final a
join nbcu_mdwdb.d_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where 
case when src.assignment_group in ('2c5fc7716f362100e1bef00dba3ee4b4','a45fc7716f362100e1bef00dba3ee4b5') then 'Y' else 'N' end<>b.international_first_contact_resolution_flag_c