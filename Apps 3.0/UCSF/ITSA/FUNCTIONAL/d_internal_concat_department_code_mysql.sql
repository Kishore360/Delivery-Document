SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from ucsf_mdwdb.d_internal_contact a
JOIN ucsf_mdsdb.sys_user_final b ON a.row_id=concat('INTERNAL_CONTACT~',b.sys_id)
AND a.source_id=b.sourceinstance
JOIN
  (SELECT max(sys_updated_on),
          sys_id,
          id,
          sourceinstance
   FROM ucsf_mdsdb.cmn_department_final
   GROUP BY id) c ON b.u_department_code=c.id
AND b.sourceinstance = c.sourceinstance
where  a.department_code <> c.sys_id ;