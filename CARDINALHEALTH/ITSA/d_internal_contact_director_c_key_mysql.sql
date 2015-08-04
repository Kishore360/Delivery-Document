select count(1)
from cardinalhealth_mdwdb.d_internal_contact a
JOIN cardinalhealth_mdsdb.sys_user_final b ON right(a.row_id,32)=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact e 
ON e.row_id= COALESCE(concat('INTERNAL_CONTACT~',b.u_director),'UNSPECIFIED')AND e.source_id=b.sourceinstance
where a.director_c_key<> case when b.u_director is null then 0  ELSE COALESCE(e.row_key,-1) END;