SELECT 'f_sla_analysis_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
UNION 
SELECT 'd_sla_analysis_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_sla_analysis_c b ON a.sla_analysis_c_key=b.row_key
UNION 
SELECT 'd_lov_sla_state_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_lov_sla_state_c b ON  a.state_src_key=b.row_key
UNION 
SELECT 'd_lov_sla_priority_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_lov_sla_priority_c b ON  a.priority_src_key=b.row_key
UNION 
SELECT 'd_sla_analysis_contract_sla_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_sla_analysis_contract_sla_c b ON a.sla_key=b.row_key
UNION 
SELECT 'd_sla_analysis_incident_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_sla_analysis_incident_c b ON a.incident_key=b.row_key
UNION 
SELECT 'd_scafe_core_realm_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_sla_analysis_c a 
JOIN ldb.d_scafe_core_realm_c b ON a.scafe_core_realm_c_key=b.row_key




