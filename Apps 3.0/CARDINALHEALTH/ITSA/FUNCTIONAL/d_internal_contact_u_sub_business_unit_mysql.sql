SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_internal_contact a
JOIN cardinalhealth_mdsdb.sys_user_final b ON a.row_id=concat('INTERNAL_CONTACT~',b.sys_id) AND a.source_id=b.sourceinstance
 where  a.sub_business_unit_c <> b.u_sub_business_unit ;