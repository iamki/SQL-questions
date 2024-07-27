--https://platform.stratascratch.com/coding/10318-new-products?code_type=1
--where i practiced join with subqueries

SELECT a.company_name, coalesce(ac-bc) AS net_differences 
  FROM (SELECT company_name, count(company_name) ac FROM car_launches WHERE year=2020 group by company_name) a
    JOIN (SELECT company_name, count(company_name) bc FROM car_launches WHERE year<2020 group by company_name) b
      ON a.company_name = b.company_name
;
