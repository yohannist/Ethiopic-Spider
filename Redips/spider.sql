﻿Create Database NETAMDAT

On Primary
(
	  Name = 'NETAMDAT'
	, FileName = 'D:\Databases\netamdat\netamdat.mdf'
	, FileGrowth = 100
)

Go

Use NETAMDAT

Go

Create Schema web

Create Table web.Website
(
	  WebsiteID int not null primary key identity(1, 1)
	, URL nVARCHAR(MAX) not null
	, IPAddress nVARCHAR(1000)
	, Country nVARCHAR(200)
	, RobotsTxt nVARCHAR(MAX)
	, Date DateTime Not Null
)

Create Table web.WebPage
(
	  WebPageID  int not null primary key identity(1,1)
	, URL nVARCHAR(MAX) not null
	, WebsiteID int not null Foreign Key References Website(WebsiteID)
	, NavigatedFromWebPageID int Foreign Key References WebPage(WebPageID)
	, HtmlContent nVARCHAR(MAX) not null
	, TextContent nVARCHAR(MAX) not null
	, Date DateTime not null
	, NumberOfVisits int 
)

--Drop table word
Create Table web.EthiopicWord
(
	  EthiopicWordID int not null primary key identity(1,1)
	, Name nVARCHAR(600) not null
	, SourceWebPageID int  not null  Foreign Key References WebPage(WebPageID)
	, Date DateTime not null
)

Create Table web.SeedWebsite
(
	  SeedWebsiteID int Primary Key Identity (1, 1)
	, URL nVARCHAR(600) Not Null
	, IsActive Bit Not Null
	, IsVisited Bit Not Null
	, Username nVARCHAR(100)
	, Password nVARCHAR(100)
	, CrawlDelayInMinutes int
	, VisitCount int
)

/*
delete from word
delete from site

drop table word
drop table Site
drop table Paragraph

select * from site
select distinct * from word
select * from paragraph

select * from site
delete from site where URL like '%twitter%' and SiteID not in (select SourceSiteID from word)
delete from word where SourceSiteID in (select siteid from site where url like '%www.google.com%')

select distinct  * from word where Name like ('አንድ')
select (Sum(HtmlCharLength) * 2)/ (1024 * 1024) mb from Site*/



alter table web.webpage
drop column streamlength