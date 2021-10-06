/* Tables Accessed:
D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C
D_LOV_SLA_INCIDENT_PRIORITY_C
D_LOV_SLA_INCIDENT_STATE_C
D_NEW_SLA_BUSINESS_SERVICE_C
D_SLA_ANALYSIS_C
D_SLA_INCIDENT_C
D_SLA_SCAFE_CORE_REALM_C
F_SLA_ANALYSIS_FACT_C */

select 'ldb."F_SLA_ANALYSIS_FACT_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
UNION 
select 'ldb."D_SLA_ANALYSIS_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_SLA_ANALYSIS_C"	"a14" on 	("a11"."SLA_ANALYSIS_C_KEY" = "a14"."row_key")
UNION 
select 'ldb."D_SLA_INCIDENT_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_SLA_ANALYSIS_C"	"a14" on 	("a11"."SLA_ANALYSIS_C_KEY" = "a14"."row_key")
join	"ldb"."D_SLA_INCIDENT_C"	"a16"  on 	("a14"."SLA_INCIDENT_C_KEY" = "a16"."row_key")
UNION 
select 'ldb."D_SLA_SCAFE_CORE_REALM_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_SLA_SCAFE_CORE_REALM_C"	"a14" on 	("a11"."SLA_SCAFE_CORE_REALM_C_KEY" = "a14"."row_key")
UNION 
select 'ldb."D_NEW_SLA_BUSINESS_SERVICE_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_NEW_SLA_BUSINESS_SERVICE_C"	"a14" on 	("a11"."SLA_BUSINESS_SERVICE_C_KEY" = "a14"."row_key")
UNION 
select 'ldb."D_LOV_SLA_INCIDENT_PRIORITY_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_SLA_ANALYSIS_C"	"a14" on 	("a11"."SLA_ANALYSIS_C_KEY" = "a14"."row_key")
join	"ldb"."D_SLA_INCIDENT_C"	"a16"  on 	("a14"."SLA_INCIDENT_C_KEY" = "a16"."row_key")
join	"ldb"."D_LOV_SLA_INCIDENT_PRIORITY_C"	"a19" on 	("a16"."SLA_INCIDENT_PRIORITY_SRC_C_KEY" = "a19"."row_key")
UNION 
select 'ldb."D_LOV_SLA_INCIDENT_STATE_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_SLA_ANALYSIS_C"	"a14" on 	("a11"."SLA_ANALYSIS_C_KEY" = "a14"."row_key")
join	"ldb"."D_SLA_INCIDENT_C"	"a16"  on 	("a14"."SLA_INCIDENT_C_KEY" = "a16"."row_key")
join	"ldb"."D_LOV_SLA_INCIDENT_STATE_C"	"a110"
on 	("a16"."SLA_INCIDENT_STATE_SRC_C_KEY" = "a110"."row_key")
UNION 
select 'ldb."D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_SLA_ANALYSIS_FACT_C" "a11"
join "ldb"."D_NEW_SLA_BUSINESS_SERVICE_C"	"a15" on 	("a11"."SLA_BUSINESS_SERVICE_C_KEY" = "a15"."row_key")
join	"ldb"."D_INTERNAL_CONTACT_SLA_SERVICE_OWNED_BY_C"	"a18" on 	("a15"."SLA_SERVICE_OWNED_BY_C_KEY" = "a18"."row_key")