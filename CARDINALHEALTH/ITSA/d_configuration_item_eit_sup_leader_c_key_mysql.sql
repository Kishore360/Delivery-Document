SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a 
INNER JOIN cardinalhealth_workdb.ds_configuration_item b 
on a.row_id = b.row_id AND a.source_id = b.source_id 
LEFT OUTER JOIN cardinalhealth_mdwdb.d_internal_contact c 
ON c.row_id = b.eit_sup_leader_c_id AND c.source_id = b.source_id 
where a.eit_sup_leader_c_key <> COALESCE(c.row_key,-1);
