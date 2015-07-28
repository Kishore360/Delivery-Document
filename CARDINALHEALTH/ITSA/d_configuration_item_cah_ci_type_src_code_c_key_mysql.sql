SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_workdb.ds_configuration_item b 
on a.row_id = b.row_id AND a.source_id = b.source_id 
LEFT OUTER JOIN cardinalhealth_mdwdb.d_lov c 
ON c.row_id = b.cah_ci_type_src_code_c_id 
AND c.source_id = CASE WHEN b.cah_ci_type_src_code_c IS NULL THEN 0 ELSE b.source_id END 
where a.cah_ci_type_src_code_c_key <> COALESCE(c.row_key,-1); 
