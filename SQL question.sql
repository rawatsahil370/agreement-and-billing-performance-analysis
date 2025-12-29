--SELECT column_name
--FROM information_schema.columns
--WHERE table_name = Company

--ALTER TABLE Company
--RENAME COLUMN "agr_Completion_Date" TO "agr_Copmletion_Date" ;

--ALTER TABLE "Company"
--RENAME COLUMN "agr_Completion_Period" TO "agr_Copmletion_Period";

--		ALTER TABLE public."Company"
--ALTER COLUMN "tndr_Issuer_Phone" TYPE VARCHAR(15);

--ALTER TABLE public."Company"
--ALTER COLUMN "agr_Copmletion_Period" TYPE VARCHAR(50);
-- or
-- ALTER COLUMN "agr_Copmletion_Period" TYPE TEXT;

--ALTER TABLE public."Company"
--ALTER COLUMN "agr_Title" TYPE VARCHAR(255);
-- or, if you never want to worry about size:
-- ALTER COLUMN "agr_Title" TYPE TEXT;

---------------------------------------------------------------------------------------------  



select * from Company

--Q1 :- Total number of agreements
select count(agr_Number)as Total_Number_of_Agreements
from company

--Q2 :- Total Billing Net Amount
select sum(billing_net_amount) As Total_Billing_Net_Amount
from company      

--Q3:- Total AMC Net Amount
select sum(amc_total_net_amount) As Total_AMC_Net_Amount
from company 


--Q4:- Total EMD Net Amount
select sum(emd_total_net_amount) As Total_EMD_Net_Amount
from company 

--Q5 :-Unique issuers and counts (top issuers)

SELECT tndr_Issuer, COUNT(*) AS tender_count
FROM company
GROUP BY tndr_Issuer
ORDER BY tender_count DESC;


select * from Company


--Q6:- Agreements with Billing Total Balance > 0
select agr_number , billing_total_balance
from company 
where billing_total_balance > 0



--Q7 :- Total tender amount and avg rate per issuer (top 10)
SELECT tndr_Issuer,
       SUM(COALESCE(tndr_Total_Amount,0)) AS total_amount,
       AVG(NULLIF(tndr_Rate,0)) AS avg_rate
FROM company
GROUP BY tndr_Issuer
ORDER BY total_amount DESC
LIMIT 10;

--Q8:- Agreements per agreement-year with total billing amount
SELECT EXTRACT(YEAR FROM agr_Agreement_Date) AS agreement_year,
       COUNT(agr_Number) AS agreements_count,
       SUM(COALESCE(billing_total_amt,0)) AS total_billing_amt
FROM company
GROUP BY agreement_year
ORDER BY agreement_year;

--Q9:- Top 5 agreements by Billing Total AMT
SELECT agr_Number, agr_Title,billing_total_amt, agr_Start_Date
FROM company
ORDER BY COALESCE(billing_total_amt,0) DESC
LIMIT 5;

--Q10:-Tenders with quantity > 100
SELECT tndr_number, tndr_tittle , tndr_quantity, tndr_rate
FROM company
WHERE COALESCE(tndr_quantity,0) > 100
ORDER BY tndr_quantity DESC;








select * from Company













