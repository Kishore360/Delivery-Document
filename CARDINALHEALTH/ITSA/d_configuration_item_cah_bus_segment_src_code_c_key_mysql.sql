SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_workdb.ds_configuration_item b
on a.row_id=b.row_id and a.source_id=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on c.row_id = b.cah_bus_segment_src_code_c_id AND 
c.source_id = CASE WHEN b.cah_bus_segment_src_code_c IS NULL THEN 0 ELSE b.source_id END
where a.cah_bus_segment_src_code_c_key<> coalesce(c.row_key,-1);
