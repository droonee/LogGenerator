# LogGenerator

Log generator creates random logs with four parameters (server, ip address, status code, and method).
- The server parameter is made up of a string "server" with a number between 1-3 appended to the end (i.e. server1, server2, server3)
- The ip address parameter selects the last digit in a three digit format at random in the last octet (i.e. 14.10.11.13x, where 'x' is a number between 0-9)
- The status code parameter selects from a list that contains codes 404, 200, 501, 503, 400, 202, 351
- The method parameter selects from a list that contains methods PUT, GET, POST, DELETE, and PATCH

#### Sample Logs
server2 - 14.10.11.132 - 404 - PUT  
server1 - 14.10.11.138 - 503 - GET  
server3 - 14.10.11.137 - 200 - DELETE  
...

#### Script Details
The script will generate anywhere from 1-20 logs every five seconds.  The script is designed to run for fifty minutes straight to give the user the ability to analyze data over time.  At the end of fifty minutes, the script will end and no more data will be logged.  The script is lightweight and will have very low resource utilization.  The script will write logs to a file called "myfakedata.log" line-by-line, where they can be collected from.  

## Objective of Script
The random log generator will create data that you can use to learn specific features in Sumo Logic.  You will have freedom to build anything that you have access to in your personal Sumo Logic account.  

#### You will be able to 
- Practice building and working with dashboards 
- Practice the search query language 
  - Regex parsing
  - Aggregate operators
  - Conditional statements
  - Search operators
- Practice Field Extraction Rules (FERs)
- Practice creating partitions
- Practice RBAC controls 
- Understand metadata in Sumo Logic better

#### Less focus but also exposure to
- Working in the command line and command line tools
- Sumo Logic's OpenTelemetry Distro and collector
- Provisioning an EC2 instance in your AWS sandbox account

#### Prerequisites

