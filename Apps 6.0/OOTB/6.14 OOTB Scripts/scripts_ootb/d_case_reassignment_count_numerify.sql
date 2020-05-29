select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.reassignment_count_numerify' ELSE 'SUCCESS' END as Message
 from 
 #DWH_TABLE_SCHEMA.d_case d
join #DWH_TABLE_SCHEMA.f_case f
on f.case_key = d.row_key
where d.row_key not in (0, -1) and 
d.reassignment_count_numerify <> f.reassignment_count_numerify 