SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_archer_application_c_slo_c' ELSE 'SUCCESS' END as Message 
from bbandt_mdwdb.f_archer_application_c trgt
join bbandt_mdsdb.us_Third_Party_SLA_SLO_Targets_final src
on trgt.application_name_c=src.application_name
where slo_c<>src.Target_perc_2;
