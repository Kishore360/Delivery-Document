SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
wow_mdsdb.u_incident_outage_final a
LEFT JOIN wow_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_tech)= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
left join wow_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_tech IS NULL THEN 0 else -1 end)<>b.tech_user_c_key; 