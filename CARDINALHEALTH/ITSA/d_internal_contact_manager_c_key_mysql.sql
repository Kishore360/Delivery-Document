SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_internal_contact a
join cardinalhealth_workdb.ds_internal_contact b
on a.row_id=b.row_id AND a.source_id=b.source_id 
left join cardinalhealth_mdwdb.d_internal_contact c
on c.row_id=b.manager_c_id AND c.source_id=b.source_id 
where a.manager_c_key<>COALESCE(CASE WHEN b.manager_c_id='UNSPECIFIED' THEN 0 ELSE c.row_key END,-1)
