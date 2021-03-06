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

-- 7 invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT Invoice.Total as "Invoice Total", Customer.FirstName as "Customer First Name", Customer.LastName as "Customer Last Name", Invoice.BillingCountry, Employee.FirstName as "Agent First Name", Employee.LastName as "Agent Last Name"
FROM Customer
JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
JOIN Employee
ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY Employee.LastName;

-- 8 total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
-- SELECT * FROM TableName where DATEPART(yy, YourDateColumn) = 1996 --For Year
-- SELECT COUNT() as "total Invoices 2009 and 2011"
-- FROM Invoice
-- WHERE strftime('%Y', Invoice.invoiceDate) = "2009" OR  strftime('%Y', Invoice.invoiceDate) = "2011";

SELECT COUNT() as "total Invoices 2009 and 2011"
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "2011%"
OR Invoice.InvoiceDate LIKE "2009%";

-- 9 - total_sales_{year}.sql: What are the respective total sales for each of those years? Can only get one year at a time
SELECT strftime('%Y', Invoice.invoiceDate) as "Year" , SUM(Invoice.Total) as "Total Sales"
FROM Invoice
WHERE Invoice.InvoiceDate LIKE "2011%";

-- 10 invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceLine.InvoiceId) as "Number of Line Items on Invoice"
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = 37;

-- 11 line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceLine.InvoiceId, COUNT(InvoiceLine.InvoiceId) as "Number of Line Items on Invoice"
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId;

-- 12 line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLine.InvoiceLineId as "Invoice Line Item", Track.Name
FROM InvoiceLine
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
ORDER BY InvoiceLine.InvoiceLineId;

-- 13 line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT InvoiceLine.InvoiceLineId as "Invoice Line Item", Track.Name as "Track Name", Artist.Name
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId;




