SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (

select 
CASE WHEN   a11.businessunit_custom_c_key = 0
or upper(a16.businessunit_name) in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')
or a16.businessunit_name is null then 0 ELSE 1 end,a16.businessunit_name
from mcd_mdwdb.f_problem a11
LEFT JOIN mcd_mdwdb.d_businessunit_custom_c a16 
on a11.businessunit_custom_c_key=a16.row_key
WHERE a11.Business_Unit_dq_c <> (CASE WHEN   a11.businessunit_custom_c_key = 0
or upper(a16.businessunit_name) in ('UNSPECIFIED','UNKNOWN','UNALLOCATED','UNDEFINED','',' ','UNSPECIFED','UNKONWN','NULL')
or a16.businessunit_name is null then 0 ELSE 1 end)




)a;




