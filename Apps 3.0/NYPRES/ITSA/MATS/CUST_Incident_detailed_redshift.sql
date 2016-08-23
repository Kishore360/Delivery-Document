select 'ldb.f_incident' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
union
select 'ldb.d_incident_closure_subcategory_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
join        ldb.d_incident_closure_subcategory_c      a13
                  on         (a11.closure_subcategory_c_key = a13.row_key) 
union
select 'ldb.d_incident_closure_category_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
join        ldb.d_incident_closure_category_c      a13
                  on         (a11.closure_category_c_key = a13.row_key) 
				  union
				  select 'ldb.d_incident_wing_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
join        ldb.d_incident_wing_c      a13
                  on         (a11.wing_c_key = a13.row_key) 
				  
				   union
				  select 'ldb.d_outage_record_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
join        ldb.d_outage_record_c      a13
                  on         (a11.outage_record_c_key = a13.row_key)
							   union
				  select 'ldb.d_kb_knowledge_c' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident       a11 
join        ldb.d_kb_knowledge_c      a13
                  on         (a11.kb_article_c_key = a13.row_key)
				  