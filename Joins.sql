/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
 Select p.name, c.name
 From products p
 Inner join categories c
 On p.CategoryID = c.CategoryID
 Where c.Name = "computers" ;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

Select p.name, p.price, r.rating
From products p 
Inner Join reviews r 
On p.ProductID = r.ProductID
where r.Rating = 5; 


/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName, e.LastName, Sum(Quanity) as sum
From sales s
Inner Join employees e
on e.EmployeeID = s.EmployeeID
group by e.FirstName, e.LastName
Order by sum desc
limit 2; 


/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.name, c.name
From departments d
Inner Join categories c
on d.DepartmentID = c.DepartmentID 
where c.name = "Appliances" or c.name = "Games"; 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT products.name, SUM(sales.Quantity), (products.Price * SUM(sales.Quantity))
 FROM products
 INNER JOIN sales
 ON products.ProductID = sales.ProductID
 WHERE products.name LIKE "Eagles: Hotel California"
 GROUP BY products.name, products.price;
 
 
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

Select products.name, reviews.reviewer, reviews.rating, reviews.comment
From products
Inner Join reviews
On products.ProductID = reviews.ProductID
Where products.name Like "Visio Tv"
Order by reviews.rating
Limit 1; 




-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

Select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
From employees
Inner join sales 
on employees.EmployeeID = sales.EmployeeID
Inner join products
on sales.ProductID = products.ProductID

