SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_internal_contact a
JOIN cardinalhealth_mdsdb.sys_user_final b ON a.row_id=concat('INTERNAL_CONTACT~',b.sys_id) AND a.source_id=b.sourceinstance
JOIN cardinalhealth_mdwdb.d_lov l ON l.src_rowid=COALESCE(CONCAT('PREFERRED_LANGUAGE_C~SYS_USER~~~',b.preferred_language),'UNSPECIFIED') AND l.source_id=a.source_id
where  a.language_c_key <> l.row_key ;