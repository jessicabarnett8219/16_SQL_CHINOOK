-- 1 non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT Customer.FirstName, Customer.LastName, Customer.CustomerId, Customer.Country
FROM Customer
WHERE Customer.Country != "USA";

-- 2 brazil_customers.sql: Provide a query only showing the Customers from Brazil.

SELECT Customer.FirstName, Customer.LastName, Customer.CustomerId
FROM Customer
WHERE Customer.Country = "Brazil";

-- 3 brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Invoice
JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.Country = "Brazil";

-- 4 sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT Employee.FirstName, Employee.LastName
FROM Employee
WHERE Employee.Title = "Sales Support Agent";

-- 5 unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT Invoice.BillingCountry as "Unique Billing Country"
FROM Invoice;

-- 6 sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Invoice.InvoiceId, Employee.FirstName, Employee.LastName
FROM Customer
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee
ON Customer.SupportRepId = Employee.EmployeeId;