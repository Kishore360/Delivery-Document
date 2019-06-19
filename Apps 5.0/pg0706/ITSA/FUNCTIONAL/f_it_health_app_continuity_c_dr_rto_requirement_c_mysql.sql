SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_it_health_app_continuity_c.dr_rto_requirement_c' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.us_health_app_continuity_c_final SRC
 JOIN png_mdwdb.f_it_health_app_continuity_c TRGT
ON concat (COALESCE(SRC.Actual_As_Of,'UNSPECIFIED'),COALESCE(SRC.Application,'UNSPECIFIED'),
COALESCE(SRC.CBP,'UNSPECIFIED')) = TRGT.row_id
where SRC.DR_RTO_Requirement<>TRGT.dr_rto_requirement_c