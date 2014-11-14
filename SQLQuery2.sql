select distinct StyleName from Musical_Styles 
inner join Entertainer_Styles on Entertainer_Styles.StyleID = Musical_Styles.StyleID
inner join Musical_Preferences on Musical_Preferences.StyleID = Musical_Styles.StyleID
inner join Entertainers on Entertainers.EntertainerID = Entertainer_Styles.EntertainerID
inner join Customers on Customers.CustomerID = Musical_Preferences.CustomerID
where Entertainers.EntStageName = 'Topazz' and Customers.CustomerID = 10003