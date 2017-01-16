SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
 from cardinalhealth_mdsdb.cmn_schedule_span_final a13s
 join cardinalhealth_mdwdb.d_schedule_span_c a13
  on a13s.sys_id=a13.row_id and a13s.sourceinstance=a13.source_id
  join cardinalhealth_mdwdb.d_lov sc on sc.row_id=UPPER(CONCAT('YEARLY_TYPE~CMN_SCHEDULE_SPAN','~','','~','','~',COALESCE(a13s.yearly_type,'')))
  WHERE COALESCE(sc.row_key ) <> a13.yearly_type_src_c_key
  
  