--Which countries have the most invoices ?
SELECT
	billing_country as country
FROM
	invoice
GROUP by country
HAVING count(invoice_id) = (
							SELECT count(invoice_id) 
							from invoice 
							group by billing_country 
							ORDER by count(invoice_id) DESC
							LIMIT 1
							);