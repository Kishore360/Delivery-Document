Report: CCPA RITA_Inventory_Quality_C
Job: 325852
Report Cache Used: No

Number of Columns Returned:		29
Number of Temp Tables:		1

Total Number of Passes:		5
Number of SQL Passes:		5
Number of Analytical Passes:		0

Tables Accessed:
d_lov_ccpa_processing_activities_data_subject_type_c
d_lov_ccpa_processing_activities_ot_life_cycle_status_c
d_png_ccpa_processing_activities_inventory_c
d_processing_activities_ccpa_owning_organization_c


SQL Statements:

set query_group to 'MSTRReport=CCPA RITA_Inventory_Quality_C;'

CREATE TEMPORARY TABLE ZZMD00 as
select	a11.row_key AS row_key,
	sum((CASE WHEN a11.vital_issue_count_c > 0 THEN a11.vital_issue_count_c ELSE NULL END)) AS WJXBFS1,
	(CASE WHEN max((CASE WHEN a11.vital_issue_count_c > 0 THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a11.vital_issue_count_c > 0 THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS2,
	sum((CASE WHEN a11.minor_issue_count_c > 0 THEN a11.minor_issue_count_c ELSE NULL END)) AS WJXBFS3,
	(CASE WHEN max((CASE WHEN a11.minor_issue_count_c > 0 THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a11.minor_issue_count_c > 0 THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS4,
	(CASE WHEN max((CASE WHEN (a11.vital_issue_count_c > 0 or a11.minor_issue_count_c > 0) THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN (a11.vital_issue_count_c > 0 or a11.minor_issue_count_c > 0) THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS5,
	(CASE WHEN max((CASE WHEN (a11.vital_issue_count_c <=  0 and a11.minor_issue_count_c <=  0) THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN (a11.vital_issue_count_c <=  0 and a11.minor_issue_count_c <=  0) THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS6,
	(CASE WHEN max((CASE WHEN a11.vital_issue_count_c >=  0 THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a11.vital_issue_count_c >=  0 THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS7,
	(CASE WHEN max((CASE WHEN a11.minor_issue_count_c >=  0 THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a11.minor_issue_count_c >=  0 THEN a11.row_key ELSE NULL END)) ELSE NULL END) AS WJXBFS8
from	ldb.d_png_ccpa_processing_activities_inventory_c	a11
where	(a11.vital_issue_count_c > 0
 or a11.minor_issue_count_c > 0
 or (a11.vital_issue_count_c <=  0
 and a11.minor_issue_count_c <=  0)
 or a11.vital_issue_count_c >=  0
 or a11.minor_issue_count_c >=  0)
group by	a11.row_key 

select	a17.vital_issue_count_c AS vital_issue_count_c,
	CONCAT(a17.vital_issue_count_c,' issues') AS CustCol_211,
	a17.vital_issues_c AS vital_issues_c,
	a17.owning_grouping_c AS owning_grouping_c,
	a17.ccpa_owning_organization_c_key AS row_key,
	a110.organization_name AS organization_name,
	a17.ot_ccpa_life_cycle_status_c_key AS row_key0,
	a19.source_dimension_name AS source_dimension_name,
	a17.ropa_linked_it_to_asset_c AS ropa_linked_it_to_asset_c,
	a17.functional_c AS functional_c,
	pa16.row_key AS row_key1,
	a17.title_c AS title_c,
	a17.data_subject_type_c_key AS row_key2,
	a18.source_dimension_name AS source_dimension_name0,
	a17.row_id AS row_id,
	a17.minor_issue_count_c AS minor_issue_count_c,
	CONCAT(a17.minor_issue_count_c,' issues') AS CustCol_210,
	a17.minor_issues_c AS minor_issues_c,
	a17.title_c AS title_c0,
	a17.business_process_owner_c AS business_process_owner_c,
	CASE WHEN a17.vital_issue_count_c>0 THEN 'Red' WHEN (a17.vital_issue_count_c<=0 AND a17.minor_issue_count_c>0) THEN 'Yellow' ELSE 'Green' END AS CustCol_212,
	pa16.WJXBFS1 AS WJXBFS1,
	pa16.WJXBFS3 AS WJXBFS2,
	pa16.WJXBFS5 AS WJXBFS3,
	pa16.WJXBFS2 AS WJXBFS4,
	pa16.WJXBFS4 AS WJXBFS5,
	pa16.WJXBFS6 AS WJXBFS6,
	pa16.WJXBFS7 AS WJXBFS7,
	pa16.WJXBFS8 AS WJXBFS8
from	ZZMD00	pa16
	join	ldb.d_png_ccpa_processing_activities_inventory_c	a17
	  on 	(pa16.row_key = a17.row_key)
	join	ldb.d_lov_ccpa_processing_activities_data_subject_type_c	a18
	  on 	(a17.data_subject_type_c_key = a18.row_key)
	join	ldb.d_lov_ccpa_processing_activities_ot_life_cycle_status_c	a19
	  on 	(a17.ot_ccpa_life_cycle_status_c_key = a19.row_key)
	join	ldb.d_processing_activities_ccpa_owning_organization_c	a110
	  on 	(a17.ccpa_owning_organization_c_key = a110.row_key)


drop table ZZMD00


[Analytical engine calculation steps:
]
