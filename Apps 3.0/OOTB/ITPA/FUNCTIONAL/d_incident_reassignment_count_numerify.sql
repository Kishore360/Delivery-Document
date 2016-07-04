select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.age' ELSE 'SUCCESS' END as Message
 from 
 <<tenant>>_mdwdb.d_incident d
join <<tenant>>_mdwdb.f_incident f
on f.incident_key = d.row_key
where d.reassignment_count_numerify <> f.reassignment_count_numerify 
