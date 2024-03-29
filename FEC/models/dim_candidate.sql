-- models/dim_candidate.sql

WITH source_candidates AS (
  SELECT
    CAND_ID,
    PRINCIPAL_CMTE_ID,
    CAND_PTY_AFFILIATION,
    CAND_OFFICE,
    CAND_ELECTION_YR,
    CAND_OFFICE_ST,
    CAND_OFFICE_DISTRICT,
    CAND_ICI,
    CAND_STATUS,
    CAND_NAME,
    CAND_ST1,
    CAND_ST2,
    CAND_CITY,
    CAND_ST,
    CAND_ZIP
  FROM {{ source('STAGED', 'STA_CN') }}
)

SELECT
  ROW_NUMBER() OVER (ORDER BY CAND_ID) AS candidate_key,  -- Generates a surrogate key for candidate_key
  CAND_ID AS candidate_id,
  PRINCIPAL_CMTE_ID AS principal_committee_id,
  CAND_PTY_AFFILIATION AS party_code,
  CAND_OFFICE AS office_code,
  CAND_ELECTION_YR::INT AS election_year,
  CAND_OFFICE_ST AS office_state_code,
  CAND_OFFICE_DISTRICT AS district_number,
  CAND_ICI AS incumbent_code,
  CAND_STATUS AS status_code,
  CAND_NAME AS candidate_name,
  CAND_ST1 AS street_address1,
  CAND_ST2 AS street_address2,
  CAND_CITY AS city,
  CAND_ST AS state_code,
  CAND_ZIP AS zip_code
FROM source_candidates
