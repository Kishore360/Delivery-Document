SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_compliance_control_c.compliance_control_c' 
ELSE 'SUCCESS' END as Message 
FROM (select Compliance_control from pandg_mdsdb.pg_ot_compliance_controls_final) src
left join (select row_id,compliance_control_c from pandg_mdwdb.d_pandg_ot_compliance_control_c) trgt
on sha1(lower(src.Compliance_control))=trgt.row_id
where src.Compliance_control<>trgt.compliance_control_c;