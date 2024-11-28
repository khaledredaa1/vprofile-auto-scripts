# vprofile-auto-scripts
## Description ##
Automating the application build on the local infrastructure using "Shell Scripts".
Building a multi-tier Java Web application on "AWS Cloud" using "Shell Scripts".

## Purpose ##
- This project aim to configure each project component from scratch and address any issues arises during configuration.
- This project develop a deeper understanding of the underlying technologies and help to gain valuable troubleshooting skills.

## Used Tools ##
- Vagrant: For creating and managing virtual machines.
- VirtualBox or VMware: Hypervisor software for running virtual machines.
- Tomcat: Servlet container for running Java web applications.
- Nginx: Web server and reverse proxy for serving static content and routing requests.
- RabbitMQ: Message broker for handling asynchronous communication between components.
- Memcached: Distributed memory caching system for improving performance.
- MySQL: Relational database management system for storing application data.
- Maven: Build automation tool for managing Java projects.
- Git: Version control system for tracking changes to project files.

## Project Steps ##
- Set up Vagrant environment: Install Vagrant and configure virtual machine settings.
- Create virtual machines: Use Vagrant to create separate virtual machines for each service (Tomcat, Nginx, RabbitMQ, Memcached, MySQL).
- Auto scripts: Run shell scripts Automatically on each virtual machine to install and set up the corresponding service.
- Integration: Connect the services together to form a multi-tier architecture.
- Testing: Validate the functionality of the web application and troubleshoot any issues that arise.
- Documentation: Document the configuration steps and any troubleshooting techniques used during the project.
