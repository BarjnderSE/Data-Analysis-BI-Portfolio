SELECT * FROM supplychain.supply_chain_data;
-- 1. Which product type generates the highest total revenue?
SELECT `Product type` AS ProductType, ceil(SUM(`Revenue generated`)) AS Total_Revenue
FROM supplychain.supply_chain_data
GROUP BY ProductType
ORDER BY Total_Revenue DESC;

-- 2.What is the distribution of products sold across different customer demographics?
select sum(`number of products sold`) as TotalProductssold,`customer demographics` as customerdemographics
from  supplychain.supply_chain_data
group by customerdemographics
order by TotalProductssold desc;

-- 3. Which shipping carrier has the lowest average shipping cost?
 select `shipping carriers` as shippingcarriers,truncate(min(`shipping costs`),2)as shippingcost
 from  supplychain.supply_chain_data
 group by shippingcarriers
 order by shippingcost;

-- 4. Which SUPPLIER have the highest defect rates?
 select `supplier name` as suppliername, avg(`defect rates`) as defectrates
 from supplychain.supply_chain_data
  group by suppliername
  order by defectrates desc;
  -- 5. Which Product have the highest defect rates?
  SELECT SKU, `Product type`, `Defect rates` as Defect_rates
FROM supply_chain_data
ORDER BY Defect_rates DESC
LIMIT 5;

-- 6. Which transportation mode incurs the highest average transportation cost?
     SELECT `transportation modes` AS Transportation, 
       AVG(Costs) AS Avgcosts
FROM supply_chain_data
GROUP BY Transportation
ORDER BY Avgcosts DESC;
-- 7. What is the relationship between stock levels and lead times across products?
       SELECT 
       `Product type` as producttype,sku,
    `stock levels` AS `Stock Level`, 
    `lead times` AS `Lead Times`
FROM 
    supply_chain_data
     order by `Stock Level` desc;  --  its shows tock levelof sku12 is 100 but lead time is 30 days
     -- Current Stock Level:

   -- Stock Level: 100 units.
  --  This stock level is relatively healthy and indicates that you have sufficient inventory on hand to meet customer demand for the time being.

-- Lead Time:

  --  Lead Time: 30 days.
   -- A lead time of 30 days means that if you need to reorder, 
   -- it will take a full month for additional stock to arrive. This could be a concern if demand increases suddenly.
   -- and so on ....alter
   
   -- 8.Which product or SKU has the highest manufacturing cost?
   select sku,`manufacturing costs`as manufacturingcosts
   from supply_chain_data
   order by manufacturingcosts desc ;
    -- 9. How do inspection results vary across suppliers or locations?

    SELECT 
    `supplier name` AS suppliers, 
    location, 
   `inspection results` as  inspection, 
    COUNT(*) AS count
FROM 
    supply_chain_data
GROUP BY 
    `supplier name`, location,  inspection
ORDER BY 
    suppliers, location, inspection ;   
    
    -- 10. What is the average order quantity per product type?
    select avg(`order quantities`) as avgorderqty, `product type` as producttype
    from supply_chain_data
    group by producttype
    order by avgorderqty
 -- 11. Which supplier has the shortest manufacturing lead time on average?
 SELECT 
    `supplier name` AS suppliers, 
    AVG(`Manufacturing lead time`) AS average_lead_time
FROM 
    supply_chain_data
GROUP BY 
    `supplier name`
ORDER BY 
    average_lead_time ASC;  -- Sort in ascending order to find the shortest lead time
