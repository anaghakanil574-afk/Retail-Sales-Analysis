 USE new_schema;
 SELECT * FROM retail_sales_dataset;
 create table sales like retail_sales_dataset;
 insert sales select *from retail_sales_dataset;
 select*from sales;
 
 
 -- 1. Calculate Total Revenue Generated from All Sales--
 
 SELECT SUM(`Total Amount`) AS Total_Revenue
FROM sales;
select*from sales;


-- 2. Count the Total Number of Transactions--

SELECT COUNT(*) AS total_transactions
FROM sales;


-- 3. Analyze Revenue by Product Category--

 SELECT `product category`,
       SUM(`total amount`) AS revenue
FROM sales
GROUP BY `product category`
order by `Revenue`;


-- 4. Analyze Revenue Contribution by Age Group--

select `Age Group`,sum(`Total Amount`) as Revenue
from sales 
group by `Age Group`
order by `Revenue` desc;

-- 5. Compare Revenue Performance by Gender--

select `Gender`,sum(`Total Amount`) as Revenue
from sales
group by `Gender`
order by `Revenue` desc;
select*from sales;

-- 6. Analyze Product Category Performance by Units Sold--

select `Product Category`,sum(`Quantity`) AS Unit_sold
from sales
group by(`Product Category`)
order by Unit_sold desc;

-- 7. Calculate Average Transaction Value per Customer--

select `Customer ID`,avg(`Total Amount`) As avg_transaction
from sales
group by `Customer ID`;

-- 8. Calculate Overall Average Transaction Value--

select avg(`Total Amount`) As avg_transaction
from sales;
 
 -- 9. Identify Top 10 Customers Based on Highest Single Transaction Amount--
 
 select `customer ID`,max(`Total Amount`) AS Revenue
 from sales
 group by `customer ID`
 order by `Revenue`desc
 limit 10;
 
 -- 10. Analyze Daily Revenue Trend--
 
 select `Date`,sum(`Total Amount`) AS Revenue
 from sales
 group by `Date`
 order by `Date` desc;
 
 
-- 11. Analyze Monthly Revenue Trend--
 
 SELECT MONTH(STR_TO_DATE(Date,'%d-%m-%Y')) AS Month_No,
       SUM(`Total Amount`) AS Revenue
FROM sales
GROUP BY Month_No
ORDER BY Month_No;

-- 12. Analyze Revenue Distribution Across Gender and Product Categories--

select `Gender`,`product Category`,sum(`Total Amount`) AS Revenue
from sales
group by `product Category`,`Gender`;
 
 -- 13. Identify Top 10 Customers Based on Total Revenue Contribution--
 
select `customer ID`,sum(`Total Amount`) as Revenue
from sales
group by `customer ID`
order by Revenue desc
limit 10;


-- 14. Rank Customers Based on Total Revenue Using RANK Window Function--

SELECT
    `Customer ID`,
    SUM(`Total Amount`) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(`Total Amount`) DESC
    ) AS revenue_rank
FROM sales
GROUP BY `Customer ID`;

-- 15. Extract Top 10 Customers Using ROW_NUMBER Window Function--

SELECT *
FROM (
    SELECT
        `Customer ID`,
        SUM(`Total Amount`) AS Total_Revenue,
        ROW_NUMBER() OVER (
            ORDER BY SUM(`Total Amount`) DESC
        ) AS Revenue_Rank
    FROM sales
    GROUP BY `Customer ID`
) AS RankedCustomers
WHERE Revenue_Rank <= 10;


-- 16. Rank Top Customers Within Each Gender Group--

SELECT
    `Gender`,
    `Customer ID`,
    SUM(`Total Amount`) AS Total_Revenue,
    ROW_NUMBER() OVER (
        PARTITION BY `Gender`
        ORDER BY SUM(`Total Amount`) DESC
    ) AS Revenue_Rank
FROM sales
GROUP BY `Gender`, `Customer ID`;
 
 -- 17. Rank Top Customers Within Each Age Group--
 
 SELECT
    `Age Group`,
    `Customer ID`,
    SUM(`Total Amount`) AS Total_Revenue,
    ROW_NUMBER() OVER (
        PARTITION BY `Age Group`
        ORDER BY SUM(`Total Amount`) DESC
    ) AS Revenue_Rank
FROM sales
GROUP BY `Age Group`, `Customer ID`;


 -- 18. Generate Row Numbers Within Gender and Age Groups--
 
select `Gender`,`Age`,
row_number() over(
PARTITION BY `Gender`,`Age`) as row_num
from sales;
 