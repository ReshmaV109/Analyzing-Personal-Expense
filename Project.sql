use result

SELECT * FROM result.final_exp_data;

-- Total amount spent in each category
select Category, sum(Amount) as total_spent from final_exp_data  group by Category;

-- Total amount spent in each payment mode
select Payment_modes, sum(Amount) as total_amt from final_exp_data  group by Payment_modes;

-- Total cashback received
select sum(Amount) as total_cashback from final_exp_data;

-- Top 5 most expensive category
SELECT category, SUM(amount) AS total_spending FROM final_exp_data GROUP BY category
ORDER BY total_spending DESC
LIMIT 5;

-- Amount spent on transportation using payment mode
SELECT payment_modes, SUM(amount) AS total_spent FROM final_exp_data WHERE category = 'transportation'
GROUP BY payment_modes;

--  Total spending in each month
SELECT MONTH(date) AS month, SUM(amount) AS total_spending FROM  final_exp_data GROUP BY MONTH(date)
ORDER BY month;

-- Which months have the highest spending in categories
SELECT MONTH(date) AS month,category,SUM(amount) AS total_spending FROM final_exp_data WHERE category IN ('Subscriptions', 'Gold investment', 'Groceries')
GROUP BY MONTH(date), category
ORDER BY category;

-- Overall spending changed over time
SELECT DATE_FORMAT(date, '%Y-%m') AS month_year,  SUM(amount) AS total_spending FROM final_exp_data                                    
GROUP BY DATE_FORMAT(date, '%Y-%m')            
ORDER BY month_year ASC; 

-- Highest percentage of the total spending in categories
SELECT category, ROUND((SUM(amount) / (SELECT SUM(amount) FROM final_exp_data )) * 100, 2) AS percentage
FROM final_exp_data 
GROUP BY category ORDER BY percentage DESC LIMIT 1;

-- Amount spent on fruits & vegetables using payment mode
SELECT payment_modes, SUM(amount) AS total_spent FROM final_exp_data WHERE category = 'Fruits and vegetables'
GROUP BY payment_modes;

-- Amount using credit card bills
SELECT category, SUM(amount) AS total_bill
FROM final_exp_data WHERE payment_modes='Credit card'
GROUP BY category;

-- Amount using UPI bills
SELECT category, SUM(amount) AS total_bill
FROM final_exp_data WHERE payment_modes='upi'
GROUP BY category;

-- Amount that is greater than 900 and less than 700  based on months and category
SELECT date, category, amount FROM final_exp_data WHERE amount > 700 and amount < 900;

