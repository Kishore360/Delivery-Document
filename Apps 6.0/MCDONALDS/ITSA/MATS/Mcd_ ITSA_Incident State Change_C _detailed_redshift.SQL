/* Tables Accessed:
D_CONFIGURATION_ITEM_INCIDENT
D_INCIDENT
D_INCIDENT_ACTIVITY_CALENDAR_MONTH
D_INCIDENT_ACTIVITY_DATE
D_INCIDENT_ASSIGNED_TO
D_INCIDENT_ASSIGNMENT_GROUP
D_INCIDENT_ASSIGNMENT_GROUP_MANAGER
D_INCIDENT_CONFIGURATION_ITEM_MDM
D_INCIDENT_PRIORITY
D_INCIDENT_STATE
D_INCIDENT_STATE_FROM
D_INCIDENT_STATE_TO
D_PARENT_INCIDENT
F_INCIDENT_STATE
 */
 
 select 'ldb."F_INCIDENT_STATE" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 union
select 'ldb."D_INCIDENT_ACTIVITY_DATE" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT_ACTIVITY_DATE" a12 
 on (a11.incident_activity_date_key = a12.ROW_KEY)  
 union
select 'ldb."D_INCIDENT_ACTIVITY_CALENDAR_MONTH" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT_ACTIVITY_DATE" a12 
 on (a11.incident_activity_date_key = a12.ROW_KEY) 
join "ldb"."D_INCIDENT_ACTIVITY_CALENDAR_MONTH" a13 
 on (a12.month_start_date_key = a13.ROW_KEY) 
 UNION 
 select 'ldb."D_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
UNION 
select 'ldb."D_PARENT_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_PARENT_INCIDENT" a13  on (a12.PARENT_INCIDENT_KEY = a13.ROW_KEY)
  UNION 
  select 'ldb."D_INCIDENT_STATE_TO" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT_STATE_TO" a12  on (a11.to_state_src_key = a12.ROW_KEY)
 UNION 
   select 'ldb."D_INCIDENT_STATE_FROM" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT_STATE_FROM" a12  on (a11.from_state_src_key = a12.ROW_KEY)
 UNION 
 select 'ldb."D_INCIDENT_STATE" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_INCIDENT_STATE" a13  on (a12.STATE_SRC_KEY = a13.ROW_KEY)
  UNION 
   select 'ldb."D_INCIDENT_PRIORITY" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_INCIDENT_PRIORITY" a13  on (a12.PRIORITY_SRC_KEY = a13.ROW_KEY)
  UNION 
     select 'ldb."D_CONFIGURATION_ITEM_INCIDENT" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a13  on (a12.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
  UNION 
      select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_CONFIGURATION_ITEM_INCIDENT" a13  on (a12.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
    join "ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM" a14  on (a13.MDM_KEY = a14.ROW_KEY)
    UNION 
         select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a13  on (a12.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)
  UNION 
select 'ldb."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP" a13  on (a12.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)
    join "ldb"."D_INCIDENT_ASSIGNMENT_GROUP_MANAGER" a14  on (a13.MANAGER_KEY = a14.ROW_KEY)
    UNION 
 select 'ldb."D_INCIDENT_ASSIGNED_TO" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_INCIDENT_STATE" a11 
 join "ldb"."D_INCIDENT" a12  on (a11.INCIDENT_KEY = a12.ROW_KEY)
  join "ldb"."D_INCIDENT_ASSIGNED_TO" a13  on (a12.ASSIGNED_TO_KEY = a13.ROW_KEY)
    
    
    
    


