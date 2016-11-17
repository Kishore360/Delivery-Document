SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_location d
JOIN cardinalhealth_mdsdb.cmn_location_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where d.site_id_c <> i.u_site_id;

