 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdsdb.cmn_schedule_final a13s
join  cardinalhealth_mdwdb.d_schedule_c a13
 on a13s.sys_id=a13.row_id and a13s.sourceinstance=a13.source_id
where  a13s.name<>a13.schedule_name or
  a13s.description<>a13.schedule_description or 
a13s.type<>a13.schedule_type





