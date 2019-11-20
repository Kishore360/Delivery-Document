SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_sensitivity' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as CNT
from png_mdsdb.pg_mega_cmdb_ci_appl_final a
join
png_mdwdb.d_rita_application_c b
on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
join
(select c.row_key as row_key,
group_concat(e.name_c) AS attribute_name
from
png_mdwdb.d_rita_application_c c
join png_mdwdb.d_m2m_ci_data_privacy_c d
on (c.row_key=d.rita_application_c_key)
join png_mdwdb.d_data_privacy_attributes_c e
on (e.row_key=d.data_privacy_attributes_c_key)
group by c.row_key) f
on (b.row_key=f.row_key)
where
b.gdpr_sensitivity<>
(case 
when f.attribute_name like '%Biometric data%' 
or f.attribute_name like '%Genetic data%' 
or f.attribute_name like '%Sex life, sexual orientation questions%' 
or f.attribute_name like '%Data about children under 13%' 
or f.attribute_name like '%Criminal or judicial records%' 
or f.attribute_name like '%Precise geo location data%' 
or f.attribute_name like '%Racial or ethnic origin%' 
or f.attribute_name like '%Political opinions, political party affiliation%' 
or f.attribute_name like '%Trade union membership%' 
or f.attribute_name like '%Data about teens between 13-15 years old%' 
or f.attribute_name like '%Other health or medical data%'  
or f.attribute_name like '%Protected Health Information%'   then 'Sensitive' 
else 'Non-Sensitive' 
end)
) temp;




select count(1) as CNT
from png_mdsdb.pg_mega_cmdb_ci_appl_final a
join
png_mdwdb.d_rita_application_c b
on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
join
(select c.row_key as row_key,
group_concat(e.name_c) AS attribute_name
from
png_mdwdb.d_rita_application_c c
join png_mdwdb.d_m2m_ci_data_privacy_c d
on (c.row_key=d.rita_application_c_key)
join png_mdwdb.d_data_privacy_attributes_c e
on (e.row_key=d.data_privacy_attributes_c_key)
group by c.row_key) f
on (b.row_key=f.row_key)
where
b.gdpr_sensitivity<>
(case 
when f.attribute_name like '%Biometric data%' 
or f.attribute_name like '%Genetic data%' 
or f.attribute_name like '%Sex life, sexual orientation questions%' 
or f.attribute_name like '%Data about children under 13%' 
or f.attribute_name like '%Criminal or judicial records%' 
or f.attribute_name like '%Precise geo location data%' 
or f.attribute_name like '%Racial or ethnic origin%' 
or f.attribute_name like '%Political opinions, political party affiliation%' 
or f.attribute_name like '%Trade union membership%' 
or f.attribute_name like '%Data about teens between 13-15 years old%' 
or f.attribute_name like '%Other health or medical data%'  
or f.attribute_name like '%Protected Health Information%'   then 'Sensitive' 
else 'Non-Sensitive' 
end) 