# Academic-Project-CityGuide

Project Description:

> A mobile sensing web application which helps to track the current traffic status of a city.

> Hosted in AWS Elastic Beanstalk, the application supports elastic scalability and multi-tenancy.

> Physical sensors are placed on VTA(Valley Transportation Authority, San Jose, CA).

> The observations of a physical speed sensor, are sent to its exclusive Amazon EC2 Instane. The data received by the 
instance is then forwarded to hub of that instance. Each city has a single hub, which can be dynamically scaled if required.

> The hub collects data from all sensors and helps in building a sensor network. This data is used to help end-users track 
the current traffic status. An end-user from one network can also track traffic status from other networks through hub.

> APPLICATIONS:
  > The biggest application of this project is tracking the status of a particular road at that given time, wherever the 
    VTA bus is present the closest.
  > An online shooper can track their package: where the package has currently reached and expected time of delivery.
    For example, we can place a physical speed sensor on delivery trucks, and with the help of sensed data from that network,
    depending on the traffic status an estimate can be calculated when the package will reach the shopper.

> Technologies:
  Client-side: Java, Servlets, JSP, HTML, CSS
  Database: MySQL
  Supporting APIs: EC2 Instance APIs
