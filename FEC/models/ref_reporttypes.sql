-- sta_report_types.sql
SELECT
    REPORTTYPECODE,
    REPORTTYPENAME,
    REPORTTYPEDESC
FROM {{ source('STAGED', 'STA_REPORT_TYPES') }}