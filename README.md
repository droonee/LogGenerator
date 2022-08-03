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
1. Deploy an AWS Linux EC2 instance in your sandbox account (AWS Linux, Ubuntu, etc.) [AWS EC2 - Get Started](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
2. Install Sumo Logic's OT Distro [Standalone Installation](https://github.com/SumoLogic/sumologic-otel-collector/blob/main/docs/Installation.md#standalone)
3. Copy/paste the code from "ranloggen.sh" script to a .sh file on the EC2 instance.  Make the script executable on the EC2 instance with `chmod +x ranloggen.sh`
4. Use the following config for the OpenTelemetry collector.  Remember to add an installation token from your personal Sumo Logic account in the config.  Remember the log to collect from won't exist until you run the script.  So we are preparing the right filepath to the "myfakedata.log" log in the OpenTelemetry config.  The filepath will be the same directory as where you put the script on the EC2 instance - use `pwd` to find present working directory and path to where the log will be and then add that filepath to the include section of the filelog receiver in the OpenTelemetry config.
```
exporters:
  sumologic:

extensions:
  sumologic:
    install_token: <YOUR INSTALLATION TOKEN>

receivers:
  filelog:
    include:
    - /path/to/file/myfakedata.log
    include_file_name: false
    include_file_path_resolved: true
    operators:
    - type: move
      from: attributes["log.file.path_resolved"]
      to: resource["log.file.path_resolved"]
    start_at: beginning

service:
  extensions: [sumologic]
  pipelines:
    logs:
      receivers: [filelog]
      exporters: [sumologic]
```
