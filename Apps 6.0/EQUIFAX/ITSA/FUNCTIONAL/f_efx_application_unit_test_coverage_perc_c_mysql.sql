SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.u_efx_application_final SRC 
JOIN equifax_mdwdb.f_efx_application_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id  
WHERE  case when u_unit_test_coverage ="0 - 25" then 0.05
    when u_unit_test_coverage = "26 - 50" then 0.10
    when u_unit_test_coverage = "51 - 75"  then 0.15
    when u_unit_test_coverage = "76 - 99"  then 0.20
    when u_unit_test_coverage = 100 then 0.25
    else u_unit_test_coverage/100 end <> TRGT.unit_test_coverage_perc_c and SRC.cdctype<>'D')b
