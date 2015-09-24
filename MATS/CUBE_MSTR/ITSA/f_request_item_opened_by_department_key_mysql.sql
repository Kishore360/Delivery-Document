
 
select COALESCE(LKP.row_key ,CASE WHEN scu.department is  null
 THEN 0 else '-1' end), COALESCE(TRGT.opened_by_department_key,'')
from
  <<tenant>>_mdsdb.sc_req_item_final SRC
left join  <<tenant>>_mdsdb.sys_user_final scu on SRC.opened_by = scu.sys_id
LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
left join <<tenant>>_mdwdb.d_internal_organization LKP
on  LKP.row_key = TRGT.row_key   AND LKP.source_id =  TRGT.source_id
 WHERE COALESCE(LKP.row_key ,CASE WHEN scu.department is  null
 THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_department_key,'')
