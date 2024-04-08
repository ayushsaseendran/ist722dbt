-- models/campaign_expenditures.sql
select
    ce.expenditurekey as expenditure_key,
    ce.amount as expenditure_amount,
    dd.date as expenditure_date,
    dd.year as expenditure_year,
    dd.month as expenditure_month,
    dd.quarter as expenditure_quarter,
    dd.day as expenditure_day,
    dd.dayofweek as expenditure_day_of_week,
    dd.weekofyear as expenditure_week_of_year,
    dd.dayofyear as expenditure_day_of_year,
    dd.quartername as expenditure_quarter_name,
    dd.monthname as expenditure_month_name,
    dd.dayname as expenditure_day_name,
    dd.weekday as expenditure_weekday,
    ds.state_name as expenditure_state,
    dc.committee_id,
    dc.party_affiliation as committee_party_affiliation,
    dc.type_code as committee_type_code,
    dc.designation_code as committee_designation_code,
    dc.filing_frequency_code as committee_filing_frequency_code,
    dc.organization_type_code as committee_organization_type_code,
    dc.committee_name,
    dc.treasurer_name as committee_treasurer_name,
    dp.payee_name,
    dp.payee_city,
    dp.payee_state,
    dp.payee_zip_code
from {{ ref("fact_campaign_expenditures") }} ce
left join {{ ref("dim_date") }} dd on ce.datekey = dd.datekey
left join {{ ref("dim_state") }} ds on ce.statekey = ds.state_key
left join {{ ref("dim_committie") }} dc on ce.committeekey = dc.committee_key
left join {{ ref("dim_payees") }} dp on ce.payeekey = dp.payee_key
