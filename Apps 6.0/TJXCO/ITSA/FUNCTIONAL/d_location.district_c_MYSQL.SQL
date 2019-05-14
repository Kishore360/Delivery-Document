SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
-- select distinct case_number,u_store,src.u_district_name,tgt.district_c, location_key,tgt.row_key
from  tjxco_mdsdb.sn_customerservice_case_final src1 left join tjxco_mdsdb.cmn_location_final src on u_store=src.sys_id
left join tjxco_mdwdb.d_location tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join tjxco_mdwdb.f_case tgt1 on location_key=tgt.row_key
left join tjxco_mdwdb.d_case tgt11 on case_key=tgt11.row_key
where  u_district_name<>tgt.district_c)temp ;


