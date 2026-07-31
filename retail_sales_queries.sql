 USE new_schema;
 SELECT * FROM retail_sales_dataset;
 create table sales like retail_sales_dataset;
 insert sales select *from retail_sales_dataset;
 select*from sales;
 
 
 
 SELECT SUM(`Total Amount`) AS Total_Revenue
FROM sales;
select*from sales;

SELECT COUNT(*) AS total_transactions
FROM sales;

 SELECT `product category`,
       SUM(`total amount`) AS revenue
FROM sales
GROUP BY `product category`
order by `Revenue`;


select `Age Group`,sum(`Total Amount`) as Revenue
from sales 
group by `Age Group`
order by `Revenue` desc;


select `Gender`,sum(`Total Amount`) as Revenue
from sales
group by `Gender`
order by `Revenue` desc;
select*from sales;


select `Product Category`,sum(`Quantity`) AS Unit_sold
from sales
group by(`Product Category`)
order by Unit_sold desc;

select `Customer ID`,avg(`Total Amount`) As avg_transaction
from sales
group by `Customer ID`;


select avg(`Total Amount`) As avg_transaction
from sales;
 
 
 select `customer ID`,max(`Total Amount`) AS Revenue
 from sales
 group by `customer ID`
 order by `Revenue`desc
 limit 10;
 
 select*from sales;
 
 select `Date`,sum(`Total Amount`) AS Revenue
 from sales
 group by `Date`
 order by `Date` desc;
 
 SELECT MONTH(STR_TO_DATE(Date,'%d-%m-%Y')) AS Month_No,
       SUM(`Total Amount`) AS Revenue
FROM sales
GROUP BY Month_No
ORDER BY Month_No;

select `Gender`,`product Category`,sum(`Total Amount`) AS Revenue
from sales
group by `product Category`,`Gender`;
 
select `customer ID`,sum(`Total Amount`) as Revenue
from sales
group by `customer ID`
order by Revenue desc
limit 10;

SELECT
    `Customer ID`,
    SUM(`Total Amount`) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(`Total Amount`) DESC
    ) AS revenue_rank
FROM sales
GROUP BY `Customer ID`;


 
 
 
