-- 1. Which product type generates the highest total revenue?
SELECT 
    `Product type` AS ProductType, 
    CEIL(SUM(`Revenue generated`)) AS Total_Revenue
FROM 
    supplychain.supply_chain_data
GROUP BY 
    ProductType
ORDER BY 
    Total_Revenue DESC;

-- 2. What is the distribution of products sold across different customer demographics?
SELECT 
    SUM(`number of products sold`) AS TotalProductsSold, 
    `customer demographics` AS CustomerDemographics
FROM  
    supplychain.supply_chain_data
GROUP BY 
    CustomerDemographics
ORDER BY 
    TotalProductsSold DESC;

-- 3. Which shipping carrier has the lowest average shipping cost?
SELECT 
    `shipping carriers` AS ShippingCarriers, 
    TRUNCATE(AVG(`shipping costs`), 2) AS AverageShippingCost
FROM  
    supplychain.supply_chain_data
GROUP BY 
    ShippingCarriers
ORDER BY 
    AverageShippingCost ASC;

-- 4. Which supplier has the highest defect rates?
SELECT 
    `supplier name` AS SupplierName, 
    AVG(`defect rates`) AS DefectRates
FROM 
    supplychain.supply_chain_data
GROUP BY 
    SupplierName
ORDER BY 
    DefectRates DESC;

-- 5. Which product has the highest defect rates?
SELECT 
    SKU, 
    `Product type`, 
    `Defect rates` AS DefectRates
FROM 
    supplychain.supply_chain_data
ORDER BY 
    DefectRates DESC
LIMIT 5;

-- 6. Which transportation mode incurs the highest average transportation cost?
SELECT 
    `transportation modes` AS Transportation, 
    AVG(`Cost`) AS AvgCosts
FROM 
    supplychain.supply_chain_data
GROUP BY 
    Transportation
ORDER BY 
    AvgCosts DESC;

-- 7. What is the relationship between stock levels and lead times across products?
SELECT 
    `Product type` AS ProductType, 
    SKU, 
    `stock levels` AS StockLevel, 
    `lead times` AS LeadTimes
FROM 
    supplychain.supply_chain_data
ORDER BY 
    StockLevel DESC;

-- 8. Which product or SKU has the highest manufacturing cost?
SELECT 
    SKU, 
    `manufacturing costs` AS ManufacturingCosts
FROM 
    supplychain.supply_chain_data
ORDER BY 
    ManufacturingCosts DESC;

-- 9. How do inspection results vary across suppliers or locations?
SELECT 
    `supplier name` AS Suppliers, 
    location, 
    `inspection results` AS Inspection, 
    COUNT(*) AS Count
FROM 
    supplychain.supply_chain_data
GROUP BY 
    `supplier name`, location, Inspection
ORDER BY 
    Suppliers, location, Inspection;

-- 10. What is the average order quantity per product type?
SELECT 
    AVG(`order quantities`) AS AvgOrderQty, 
    `product type` AS ProductType
FROM 
    supplychain.supply_chain_data
GROUP BY 
    ProductType
ORDER BY 
    AvgOrderQty;

-- 11. Which supplier has the shortest manufacturing lead time on average?
SELECT 
    `supplier name` AS Suppliers, 
    AVG(`Manufacturing lead time`) AS AverageLeadTime
FROM 
    supplychain.supply_chain_data
GROUP BY 
    `supplier name`
ORDER BY 
    AverageLeadTime ASC;  -- Sort in ascending order to find the shortest lead time
