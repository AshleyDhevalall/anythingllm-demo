#####################################################################
# Start of the script - Description, Requirements & Legal Disclaimer
#####################################################################
# Written by: Joshua Stenhouse joshuastenhouse@gmail.com
##############################################
# Description:
# This script demonstrates working with a SQL database using the SqlServer powershell module, auto-installed if not already, using the AdventureWorks2014 database as an example.
# Included is SELECT from single and multiple tables, CREATE, INSERT and UPDATE SQL queries all using the PowerShell SQL module and the invoke-slcmd cmdlet.
##############################################
# Requirements:
# - Internet access on the computer running this script to download the latest module
# - Run the script as administrator to enable the uninstall of the existing module and to allow the install of the new module for all users
# - Search google to download a ZIP backup of the adventure works DB or click the link provided in the virtuallysober.com blog post on using SQL with PowerShell
##############################################
# Legal Disclaimer:
# This script is written by Joshua Stenhouse is not supported under any support program or service. 
# All scripts are provided AS IS without warranty of any kind. 
# The author further disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a particular purpose. 
# The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. 
# In no event shall its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever. 
# Including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary loss arising out of the use of,
# or inability to use the sample scripts or documentation, even if the author has been advised of the possibility of such damages.
#######################
# Configure the variables below
#######################
$SQLInstance = ".\SQLEXPRESS"
$SQLDatabase = "AdventureWorks2014"
$SQLUsername = "sa"
$SQLPassword = "Srt1234!"
#####################################################################
# Nothing to change below this line, commented throughout to explain
#####################################################################
##############################################
# Checking to see if the SqlServer module is already installed, if not installing it
##############################################
$SQLModuleCheck = Get-Module -ListAvailable SqlServer
if ($SQLModuleCheck -eq $null)
{
write-host "SqlServer Module Not Found - Installing"
# Not installed, trusting PS Gallery to remove prompt on install
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Installing module
Install-Module -Name SqlServer –Scope AllUsers -Confirm:$false -AllowClobber
}
##############################################
# Importing the SqlServer module
##############################################
Import-Module SqlServer
##############################################
# Example of SELECT to pull data from a SQL table
##############################################
# Example of SQL Select query to pull data from a specific database table
$SQLQuery1 = "USE $SQLDatabase
SELECT * FROM Sales.Customer"
$SQLQuery1Output = invoke-sqlcmd -query $SQLQuery1 -ServerInstance $SQLInstance -Username $SQLUsername -Password $SQLPassword
# Showing count of rows returned
$SQLQuery1Output.Count
# Selecting first 100 results
$SQLQuery1OutputTop100List = $SQLQuery1Output | select -first 100
$SQLQuery1OutputTop100List
# Selecting customer by ID
$SQLQuery1OutputCustomer = $SQLQuery1Output | Where-Object {$_.CustomerID -eq "100"}
$SQLQuery1OutputCustomer
##############################################
# Example of multiple SELECT queries to combine data from SQL tables
##############################################
# Example of linking data between 2 tables by first getting the customer name from the store data
$SQLQuery2 = "USE $SQLDatabase
SELECT * FROM Sales.Store"
$SQLQuery2Output = invoke-sqlcmd -query $SQLQuery2 -ServerInstance $SQLInstance -Username $SQLUsername -Password $SQLPassword
# Now I'm going to use the StoreID from the Sales.Customer to get the Customer Name from Sales.Store by matching it to the BusinessEntityID
foreach ($CustomerRow in $SQLQuery1Output)
{
$CustomerName = $SQLQuery2Output | where-object {$_.BusinessEntityID -eq $CustomerRow.StoreID} | select -ExpandProperty Name
write-host "ID:"$CustomerRow.CustomerID
write-host "Name:$CustomerName"
}
# But this is just writing out the info, what if you want to build a new table array in PowerShell containing both fields? Simple! Let's create an array this time.
# Creating the array, run once not per customer
$CustomerArray = @()
# Reducing the scope of the process to run faster for the demo
$CustomersFiltered = $SQLQuery1Output | select -first 100
# Performing for each customer operation, but this time saving the data to an array
foreach ($CustomerRow in $CustomersFiltered)
{
# Getting customer name again
$CustomerName = $SQLQuery2Output | where-object {$_.BusinessEntityID -eq $CustomerRow.StoreID} | select -ExpandProperty Name
# Adding customer name and existing info to customer array line
$CustomerArrayLine = new-object PSObject
$CustomerArrayLine | Add-Member -MemberType NoteProperty -Name "CustomerID" -Value $CustomerRow.CustomerID
$CustomerArrayLine | Add-Member -MemberType NoteProperty -Name "Name" -Value $CustomerName
$CustomerArrayLine | Add-Member -MemberType NoteProperty -Name "AccountNumber" -Value $CustomerRow.AccountNumber
$CustomerArrayLine | Add-Member -MemberType NoteProperty -Name "LastModified" -Value $CustomerRow.ModifiedDate
# Adding customer line to new customer array
$CustomerArray += $CustomerArrayLine
}
# Ouputting the array to show the combination of data from 2 SQL tables
$CustomerArray 
# Boom. Headshot?
##############################################
# Example of CREATE TABLE
##############################################
# I'm now going to show you how to create a table in SQL using my new array as the example data
$SQLQuery3 = "CREATE TABLE $SQLDatabase.Sales.PowerShellData (
    CustomerID int,
    Name varchar(255),
    AccountNumber varchar(10),
    LastModified datetime 
);"
$SQLQuery3Output = invoke-sqlcmd -query $SQLQuery3 -ServerInstance $SQLInstance -Username $SQLUsername -Password $SQLPassword
##############################################
# Example of INSERT INTO a table
##############################################
# Lets now insert our array into the new table we created
ForEach ($Customer in $CustomerArray)
{
# Setting the values as variables first, also converting to correct format to match SQL DB
$CustomerID = $Customer.CustomerID -as [int]
$Name = $Customer.Name
$AccountNumber = $Customer.AccountNumber
$LastModified = $Customer.LastModified -as [datetime]
# Creating the INSERT query using the variables defined
$SQLQuery4 = "USE $SQLDatabase
INSERT INTO Sales.PowerShellData (CustomerID, Name, AccountNumber, LastModified)
VALUES('$CustomerID','$Name','$AccountNumber','$LastModified');"
# Running the INSERT query
$SQLQuery4Output = invoke-sqlcmd -query $SQLQuery4 -ServerInstance $SQLInstance -Username $SQLUsername -Password $SQLPassword
}
# Run refresh on your SQL DB and you will see the new data inserted
##############################################
# Example of UPDATE of a table
##############################################
# Finally, I'm going to show you how to update the data in an existing table by editing the lastmodified datetime on the customers in the table we just created
# Setting current date time in valid SQL date/time format
$CurrentDateTime = "{0:yyyy-MM-dd HH:mm:ss}" -f (Get-Date)
# Updating each customer row
ForEach ($Customer in $CustomerArray)
{
# Setting the values as variables first, also converting to correct format to match SQL DB
$CustomerID = $Customer.CustomerID -as [int]
# Creating the UPDATE query
$SQLQuery5 = "USE $SQLDatabase
UPDATE Sales.PowerShellData
SET LastModified='$CurrentDateTime'
WHERE CustomerID ='$CustomerID';"
# Running the INSERT query
$SQLQuery5Output = invoke-sqlcmd -query $SQLQuery5 -ServerInstance $SQLInstance -Username $SQLUsername -Password $SQLPassword
}
##############################################
# End of script
##############################################