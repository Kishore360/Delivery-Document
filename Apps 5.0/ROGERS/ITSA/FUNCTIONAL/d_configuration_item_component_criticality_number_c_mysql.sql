SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN  'MDS to DWH data validation failed for d_configuration_item.component_criticality_number_c' ELSE 'SUCCESS' END as Message 
-- select distinct component_criticality_c,component_criticality_number_c 
from rogers_mdwdb.d_configuration_item 
where CASE WHEN component_criticality_c = 'Vital' THEN 1
     WHEN component_criticality_c = 'Critical' THEN 2
	 WHEN component_criticality_c = 'Important' THEN 3
	 WHEN component_criticality_c = 'Productivity' THEN 4
	 WHEN component_criticality_c = 'UNSPECIFIED' THEN 5
        WHEN component_criticality_c='UNKNOWN' THEN 6 end <>component_criticality_number_c ;