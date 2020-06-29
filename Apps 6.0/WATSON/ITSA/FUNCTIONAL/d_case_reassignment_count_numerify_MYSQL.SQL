select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.reassignment_count_numerify' ELSE 'SUCCESS' END as Message
 from 
 ibmwatson_mdwdb.d_case d
join ibmwatson_mdwdb.f_case f
on f.case_key = d.row_key
where d.row_key not in (0, -1) and 
d.reassignment_count_numerify <> f.reassignment_count_numerify 