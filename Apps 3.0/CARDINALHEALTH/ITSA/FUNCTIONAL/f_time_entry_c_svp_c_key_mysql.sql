SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.f_time_entry_c a 
INNER JOIN cardinalhealth_mdsdb.time_card_final b 
on (b.sys_id =LEFT(a.row_id,32 ) 
 AND b.sourceinstance= a.source_id  )
LEFT OUTER JOIN cardinalhealth_mdwdb.d_internal_contact c 
ON c.row_id = COALESCE(concat('INTERNAL_CONTACT~',b.u_svp),'UNSPECIFIED') AND c.source_id = b.sourceinstance
where a.svp_c_key <> (c.row_key);
