#!/bin/bash

correct=0
questions=0

calculate_score() {
    ((questions = questions + 1))

    if [[ correct -eq 0 ]]; then
        echo "     
########################################

       Wrong! There is no tommorrow, 
       so get this right right now!

########################################
             "
        echo "     
########################################

 You got nothing correct. Stop and go study.

########################################
             "
    else
        score=$(((questions / correct) * 100))
        echo "     
########################################

   You scored $score% on Docker review.

########################################
             "
    fi
}

increment_correct_responses() {
    ((correct = correct + 1))
}

increment_questions_count() {
    ((questions = questions + 1))
}

affirm_answer() {
    if [[ -z "$1" ]]; then
        echo "
########################################
              Correct
########################################
    "
    else
        echo "     
########################################
              Correct
########################################
             "
        echo "$1"
    fi
}

evaluate_answer() {

    if [ "$1" == "$2" ]; then
        increment_correct_responses
        affirm_answer "$3"
    else
        echo "     
########################################
        
       Wrong! There is no tommorrow, 
       so get this right right now!

        
       Your answer:     "$1"
       Correct answer:  "$2"

########################################
             "
    fi
}

evaluate_answer_written_with_code() {
    increment_questions_count

    if [[ "$1" == "$2" ]]; then
        increment_correct_responses
        affirm_answer "$3"
    else

        echo "     
########################################
        
       Wrong! There is no tommorrow, 
       so get this right right now!

        
       Your answer:     "$1"
       Correct answer:  "$2"

########################################
             "
        calculate_score
        exit 1
    fi
    calculate_score
}

next_question() {
    echo "
 ########################################
             Next Question 
 ########################################
"
}

next_line() {
    echo "
 ########################################
                Next Line 
 ########################################
"
}



read -p "What is a tier in software architecture? " response
answer="Tier is a logical separation of components in an application or a service."
additional_feedback=""
evaluate_answer "$response" "$answer" 


next_question


read -p "What are examples of components? " response
answer="Database Backend application server User interface Messaging Caching"
additional_feedback=""
evaluate_answer "$response" "$answer"



echo "

    Reference for layout of components

    https://res.cloudinary.com/practicaldev/image/fetch/s--q34VJPm3--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/tulofphvlpo28ngrfrao.jpeg

"

read -p "Go the below link and draw the components " response
answer="In a single-tier application, the user interface, backend business logic, and the database reside in the same machine."
additional_feedback="

    Typical examples of single-tier applications are desktop applications 
    like MS Office, PC Games, image editing software like Gimp, Photoshop,
    etc


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is an example of two-tier application? " response
answer="A two-tier application involves a client and a server. The client contains the user interface with the business logic in one machine. The backend server includes the database running on a different machine. The database server is hosted by the business and has control over it."
additional_feedback=""
evaluate_answer "$response" "$answer"


echo "

    Two-tier application

    https://www.educative.io/api/collection/6064040858091520/6411938009448448/page/6353247012913152/image/6125166331428864

"

next_question

read -p "What is an example of three-tier application? " response
answer="In a three-tier application, the user interface, business logic, and the database all reside on different machines and, thus, have different tiers. They are physically separated."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is an example of n-tier application? " response
answer="An n-tier application is an application that has more than three components (user interface, backend server, database) involved in its architecture."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the benefit of single responsibility principle in regards to software components? " response
answer="With the single responsibility principle, the components are loosely coupled in terms of responsibility and making a change to one doesn’t impact the functionality of other components."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are stored procedures? " response
answer="Stored procedures enable us to add business logic to the database."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some things to consider when using stored procedures? " response
answer="With stored procedures, if the app requires a new database, a architect needs to decide what to do about the business logic."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the differences between tiers and layers? " response
answer="Layers typically mean the user interface, business, service and the data access layers."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What a reason to choose a two-tier application? " response
answer="Minimize latency. When the business logic resides on the client there are fewer network calls to the backend server which keeps the latency of the application low."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What a reason to choose a two-tier application? 

Enter the next line: " response
answer="Control over the data of the application. All the data in the application is stored in the database server hosted by the business. The business has complete control over the database component."
additional_feedback="

    * Minimize latency. When the business logic resides on the client there are 
      fewer network calls to the backend server which keeps the latency of the 
      application low.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the reason to choose a three-tier application? " response
answer="Control over the code/business logic and security. In a three-tier architecture, the business logic resides in the backend server. No client has access to the backend code, and this makes the code secure. Also, the business has complete control over it."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the reason to choose a three-tier application? 

     * Control over the code/business logic and security. In a three-tier architecture, 
      the business logic resides in the backend server. No client has access to the 
      backend code, and this makes the code secure. Also, the business has complete 
      control over it.

Enter the next line: " response
answer="Control over data. All the data in the application is stored in the database server hosted by the business. The business has complete control over the database component."
additional_feedback="

    * Control over the code/business logic and security. In a three-tier architecture, 
      the business logic resides in the backend server. No client has access to the 
      backend code, and this makes the code secure. Also, the business has complete 
      control over it.

    * Control over data. All the data in the application is stored in the database 
      server hosted by the business. The business has complete control over the database 
      component.  

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a application server? " response
answer="Servers that run web applications."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the HTTP protocol? " response
answer="HTTP protocol is a request-response protocol that defines how information is transmitted across the web."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are were limitations to Java Server Pages? " response
answer="Developers have to write separate code/classes for handling requests from different types of clients. We needed a separate servlet for handling requests from a mobile client and a separate one for a web-based client."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the default mode of HTTP communication? " response
answer="The client sends the request and the server responds with the data. This communication is called the HTTP PULL mechanism."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is an important thing to note about the HTTP PULL mechanism? " response
answer="An important thing to note here is that every request to the server and the response to it consumes bandwidth. Every hit on the server costs the business money and adds more load on the server."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does the HTTP PUSH mechanism work? " response
answer="In this mechanism, the client sends the request for particular information to the server just once. After the first request, the server keeps pushing the new updates to the client whenever they are available."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does Time To Live (TTL) work? " response
answer="If the client doesn't receive a response from the server within the TTL, the browser kills the connection and the client has to re-send the request to receive the data from the server before the TTL ends again."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the drawbacks to opening connections? " response
answer="Open connections consume resources, and there is a limit to the number of open connections a server can handle at once. If the connections don't close and new ones are being introduced, over time, the server will run out of memory."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a persistent communication? " response
answer="A persistent connection is a network connection between the client and the server that remains open for further requests and responses, as opposed to being closed after a single communication."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How is a persistent connection possible if the browser kills the open connections to the server every X seconds?" response
answer="The connection between the client and the server stays open with the help of Heartbeat Interceptors."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are heartbeat interceptors? " response
answer="These are just blank request responses between the client and the server to prevent the browser from killing the connection."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is AJAX long polliing? " response
answer="In this technique instead of immediately returning the response, the server holds the response until it finds an update to be sent to the client. The server doesn't return an empty response. If the connection breaks, the client has to re-establish the connection to the server."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is server-sent events? " response
answer="Instead of the client polling for data, the server automatically pushes the data to the client whenever the updates are available. The incoming messages from the server are treated as events."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the use-case for SSE? " response
answer="SSE is ideal for scenarios like a real-time Twitter feed, displaying stock quotes on the UI and real-time notifications."
additional_feedback=""
evaluate_answer "$response" "$answer"


next_question

read -p "What is scalability? " response
answer="Scalability means the ability of the application to handle and withstand increased workload without sacrificing the latency."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is network latency? " response
answer="Network latency is the amount of time that the network takes to send a data packet from point A to point B."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is application latency? " response
answer="Application latency is the amount of time the application takes to process a user request."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How do you test a system for latency? " response
answer="The first step is to run stress and load tests on the application and scan for the bottlenecks that slow down the system as a whole."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is vertical scaling? " response
answer="Vertical scaling keeps your existing infrastructure but adds computing power."
additional_feedback="Vertical scaling is also known as scaling up."
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is horizontal scaling? " response
answer="Horizontal scaling simply adds more instances of machines without first implementing improvements to existing specifications."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the advantages of horizontal scaling? " response
answer="Horizontal scaling also provides us with the ability to dynamically scale in real-time as the traffic on our website increases and decreases over a period of time as opposed to vertical scaling which requires pre-planning and a stipulated time to be pulled off."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does it mean when a company has cloud elasticy? " response
answer="It indicates the stretching and returning to the original infrastructural computational capacity."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is high availability? " response
answer="High availability means the application stays alive online all the time even if a few server nodes crash. "
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a common architectural mistake that can hurt scalability? " response
answer="A common architectural mistake is not using asynchronous processes and modules whereever required rather all the processes are scheduled sequentially."
additional_feedback="

    * A common architectural mistake is not using asynchronous 
      processes and modules whereever required rather all the 
      processes are scheduled sequentially.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a common architectural mistake that can hurt scalability?

    * A common architectural mistake is not using asynchronous 
      processes and modules whereever required rather all the 
      processes are scheduled sequentially.


Enter the next line: " response
answer="Not using caching in the application wisely. Caching intercepts all the requests going to the database, reducing the overall load."
additional_feedback="

    * A common architectural mistake is not using asynchronous 
      processes and modules whereever required rather all the 
      processes are scheduled sequentially.
    
    * Not using caching in the application wisely. Caching 
      intercepts all the requests going to the database, 
      reducing the overall load.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a common architectural mistake that can hurt scalability?

    * A common architectural mistake is not using asynchronous 
      processes and modules whereever required rather all the 
      processes are scheduled sequentially.
    
    * Not using caching in the application wisely. Caching 
      intercepts all the requests going to the database, 
      reducing the overall load.


Enter the next line: " response
answer="Inefficient configuration and setup of load balancers."
additional_feedback="

    * A common architectural mistake is not using asynchronous 
      processes and modules whereever required rather all the 
      processes are scheduled sequentially.
    
    * Not using caching in the application wisely. Caching 
      intercepts all the requests going to the database, 
      reducing the overall load.
    
    * Inefficient configuration and setup of load balancers.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is profiling? " response
answer="Profiling is the dynamic analysis of code. It helps us measure the space and the time complexity of our code and enables us to figure out issues like concurrency errors, memory errors and robustness and safety of the program."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some techiques to improve scaliability? " response
answer="* Use caching * Use a CDN * Use data compression"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does fault tolerance mean? " response
answer="Fault tolerance refers to the ability of a system (computer, network, cloud cluster, etc.) to continue operating without interruption when one or more of its components fail."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is fault tolerance at the application level achieved? " response
answer="The entire massive service is architecturally broken down into more granular loosely coupled services called microservices."
additional_feedback="

    An illustration showing bounded context.
    https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.systango.com%2Fblog%2Fwp-content%2Fuploads%2F2019%2F05%2FMicroservice-Architecture-img-1.png&f=1&nofb=1

    A simple example showing API gateway
    https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsmartbear.com%2Fgetattachment%2FLearn%2FAPI-Design%2FWhat-Is-Microservices-Architecture%2FScreen-Shot-2018-06-05-at-9-33-26-PM.png&f=1&nofb=1
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is redundancy? " response
answer="Redundancy is duplicating the server instances and keeping them on standby to take over in case any of the active server instances go down."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is active-passive high availability mode? " response
answer="An initial set of nodes are active, and a set of redundant nodes are passive, on standby. Active nodes get replaced by passive nodes in case of failures."
additional_feedback="

    Example of active-passive mode
    https://www.scaleyourapp.com/wp-content/uploads/2019/06/Distributed-Cache-Service-Redundancy-min.jpg

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is replication? " response
answer="Replication means having a number of similar nodes running the workload together. There are no standby or passive instances. When a single or a few nodes go down, the remaining nodes bear the load of the service."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "Replication is also called active-active high availability mode. What is active-active? " response
answer="All the server instances are active at any point in time."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a contigency that can eliminate a single point of failure in the context of data center zones? " response
answer="Data center workloads are spread across different data centers across the world in different geographical locations."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is high availability cluster (fail-over cluster)? " response
answer="A set of nodes running in conjunction with each other that ensures the high availability of the service."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the private network that connects the nodes in high availability cluster? " response
answer="The private network is a heartbeat network and it continuously monitors the health and the status of each node in the cluster."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is zookeeper? " response
answer="Zookeeper is a distributed coordination service that holds shared distributed memory and helps keep a single state across all the nodes in a cluster."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the Redundant Array of Independent Disks (RAID) techique? " response
answer="All the possible components having a single point of failure are made redundant to ensure the availability of the service."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a load balancer? " response
answer="Load balancers distribute heavy traffic load across the servers running in the cluster based on several different algorithms. This averts the risk of all the traffic converging to a single or a few machines in the cluster."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How do load balancers intelligently route all the user requests to the active nodes in the cluster? " response
answer="To ensure that the user request is always routed to the machine that is up and running, load balancers regularly perform health checks on the machines in the cluster."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are machines that are up and running in the cluster called? " response
answer="in-service machines"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is an Internet Protocol? " response
answer="It's a protocol that facilitates the delivery of data packets from one machine to another using their IP addresses."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a DNS query? " response
answer="A DNS Query is a request for information sent from a DNS Client to a DNS Server."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the four key components of a DNS infrastructure? " response
answer="DNS Recursive nameserver aka DNS Resolver"
additional_feedback="

    * DNS Recursive nameserver aka DNS Resolver

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the four key components of a DNS infrastructure?

    * DNS Recursive nameserver aka DNS Resolver

Enter the next line: " response
answer="DNS Recursive nameserver aka DNS Resolver"
additional_feedback="

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the four key components of a DNS infrastructure? 

    * DNS Recursive nameserver aka DNS Resolver

Enter the next line: " response
answer="DNS Recursive nameserver aka DNS Resolver"
additional_feedback="

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the four key components of a DNS infrastructure? 

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver

Enter the next line: " response
answer="Top-Level Domain nameserver"
additional_feedback="

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver
    * Top-Level Domain nameserver

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the four key components of a DNS infrastructure? 

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver
    * Top-Level Domain nameserver

Enter the next line: " response
answer="Authoritative nameserver"
additional_feedback="

    * DNS Recursive nameserver aka DNS Resolver
    * Root nameserver
    * Top-Level Domain nameserver
    * Authoritative nameserver

"
evaluate_answer "$response" "$answer"

next_question

read -p "What is the role of the DNS resolver? " response
answer="The role of DNS Resolver is to receive the client request and forward it to the Root nameserver to get the address of the Top-Level domain nameserver."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the role of the Root nameserver? " response
answer="The Root nameserver returns the address of the Top-Level domain nameserver in response."
additional_feedback="As an example, the top-level domain for amazon.com is .com."
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What happens once the DNS Resolver receives the address of the top-level domain nameserver? " response
answer="Once the DNS Resolver receives the address of the top-level domain nameserver, it sends a request to it to fetch the details of the domain name."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What happens once the top-level domain name server receives the request from the Resolver? " response
answer="Once the top-level domain name server receives the request from the Resolver, it returns the IP address of the amazon.com domain name server."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the last server in the DNS query lookup process? " response
answer="The last server is the Authoritative nameserver and it it returns the IP address of the website to the DNS Resolver."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does the DNS resolve do before it forward the request to the client? " response
answer="DNS Resolver caches the data and forwards it to the client."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the purpose of DNS load balancing? " response
answer="DNS load balancing is largely used by companies to distribute traffic across multiple data centers that the application runs in."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some limitations to DNS load balancing? " response
answer="current load on the servers."
additional_feedback="

    It does take into account: 

    * current load on the servers.
    
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some limitations to DNS load balancing? 

    It does take into account: 

    * current load on the servers.

Enter the next line: " response
answer="content servers hold."
additional_feedback="

    It does take into account: 

    * current load on the servers.
    * content servers hold.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some limitations to DNS load balancing? 

    It does take into account: 

    * current load on the servers.
    * content servers hold.

Enter the next line: " response
answer="server's request processing time."
additional_feedback="

    It does take into account: 

    * current load on the servers.
    * content servers hold.
    * server's request processing time.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some limitations to DNS load balancing? 

    It does take into account: 

    * current load on the servers.
    * content servers hold.
    * server's request processing time.

Enter the next line: " response
answer="server in-service status."
additional_feedback="

    It does take into account: 
    
    * current load on the servers.
    * content servers hold.
    * server's request processing time.
    * server in-service status.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some limitations to DNS load balancing? 

    It does take into account: 

    * current load on the servers.
    * content servers hold.
    * server's request processing time.
    * server in-service status.

Enter the next line: " response
answer="Because the IP addresses are cached by the client's machine and the DNS Resolver, there is always a possibility of a request being routed to a machine that is out of service."
additional_feedback="

    It does take into account: 

    * current load on the servers.
    * content servers hold.
    * server's request processing time.
    * server in-service status.

    ###########################
    #          Bonus         #
    ##########################

    Because the IP addresses are cached by the client's machine and 
    the DNS Resolver, there is always a possibility of a request being 
    routed to a machine that is out of service.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What do hardware load balancers do? " response
answer="They sit in front of the application servers and distribute the load based on the number of currently open connections to a server, compute utilization, and several other parameters."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a limitation to hardware load balancers? " response
answer="Hardware load balancers have to be overprovisioned upfront to deal with peak traffic, which is not the case with software load balancers."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What parameters do software load balancers take into consideration? " response
answer="Software load balancers consider data hosted by the servers, cookies, HTTP headers, CPU and memory utilization, load on the network, etc., to route traffic across the servers."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is weighted round robin? " response
answer="Weighted round robin assigns weights to servers based the CPU utilization and the request processing time. Then, based on server weights, traffic is routed to them using the round robin algorithm."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does the weighted round robin? " response
answer="The traffic is routed to the machine with the least open connections of all the machines in the cluster."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does the hash algorithm work? " response
answer="The source IP where the request is coming from and the request URL are hashed to route the traffic to the backend servers."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the benefit of the hashing algorithm? " response
answer="Hashing the source IP ensures that a client's request with a certain IP will always be routed to the same server."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the benefit of the hashing algorithm? 

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

Enter next line: " response
answer="There is no need for it to fetch the client session data from the session memory of the cluster and process the request. This reduces latency."
additional_feedback="

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the benefit of the hashing algorithm? 

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

Enter next line: " response
answer="Hashing the client IP also enables the client to re-establish the connection with the same server that was processing its request in case the connection drops."
additional_feedback="

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the benefit of the hashing algorithm? 

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

Enter next line: " response
answer="Hashing a URL ensures that the request with that URL always hits a certain cache that already has data on it. This is to ensure that there is no cache miss."
additional_feedback="

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

    * Hashing a URL ensures that the request with that URL always hits a 
      certain cache that already has data on it. This is to ensure that 
      there is no cache miss.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the benefit of the hashing algorithm? 

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

Enter next line: " response
answer="Hashing a URL ensures that the request with that URL always hits a certain cache that already has data on it. This is to ensure that there is no cache miss."
additional_feedback="

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

    * Hashing a URL ensures that the request with that URL always hits a 
      certain cache that already has data on it. This is to ensure that 
      there is no cache miss.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the benefit of the hashing algorithm? 

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

    * Hashing a URL ensures that the request with that URL always hits a 
      certain cache that already has data on it. This is to ensure that 
      there is no cache miss.

Enter next line: " response
answer="This also averts the need for duplicating data in every cache and is, thus, a more efficient way to implement caching."
additional_feedback="

    * Hashing the source IP ensures that a client's request with a 
      certain IP will always be routed to the same server.

    * There is no need for it to fetch the client session data 
      from the session memory of the cluster and process the request. 
      This reduces latency.

    * Hashing the client IP also enables the client to re-establish 
      the connection with the same server that was processing its request 
      in case the connection drops.

    * Hashing a URL ensures that the request with that URL always hits a 
      certain cache that already has data on it. This is to ensure that 
      there is no cache miss.

    * This also averts the need for duplicating data in every cache and 
       is, thus, a more efficient way to implement caching.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Why is DNS load balancing implemented on the authoritative nameserver? " response
answer="Because the authoritative nameserver returns the IP addresses of a domain's application servers. If we implement load balancing here, we can easily return different IP addresses of application servers on every client request."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is normalized data? " response
answer="Normalized data means an entity occurs in only one table in its simplest and atomic form and is not spread throughout the database."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What do ACID transaction ensure? " response
answer="A ACID transaction ensures that the system is either in State A or State B at all times. There is no middle state. If anything fails, the system always rolls back to State A."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "When would a relational database be an option? " response
answer="Pick a relational database if you need strong consistency, transactions, or relationships. Typical examples of apps needing strong consistency are stock trading, personal banking, etc., and relational data is common in apps in social media apps."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are NoSQL databases good for? " response
answer="NoSQL databases are built for high-frequency read writes, typically required in social applications like micro-blogging, real-time sports apps and online massive multiplayer games."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the limitations of scaling a relational database? " response
answer="They have to be sharded, replicated to make them run smoothly on a cluster. This requires careful planning, human intervention and a skillset."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How consistent are NoSQL databases? " response
answer="NoSQL databases are eventually consistent."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some consistency problems with NoSQL database? " response
answer="The data is not normalized, this introduces the risk of it being inconsistent. An entity, since spread throughout the database, has to be updated at all places."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does Polygot persistence mean? " response
answer="Polyglot persistence means using several distinct persistence technologies together in an application to fulfill its different persistence requirements.For low latency access of the frequently accessed data, we would need to implement a cache using a key-value store like Redis or Memcached."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a use case for a key-value store? " response
answer="For low latency access of the frequently accessed data, implement a cache using a key-value store like Redis or Memcached."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the use case for a wide column database? " response
answer="To understand user behavior, set up an analytics system to analyze the big data generated by the users."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a good use case for a graph database? " response
answer="A graph database would fit best for a recommendation system that recommends the latest content to the users to keep them engaged."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a good use case for a document oriented store? " response
answer="A search feature on apps that goes through all the search-related data and streams it to the elastic store from other databases powering different features of our app."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are multi-model databases? " response
answer="Multi-model databases support multiple data models."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some popular multi-model database? " response
answer="ArangoDB CosmosDB OrientDB Couchbase"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is strong consistency? " response
answer="Strong consistency means all the server nodes across the world should contain the same value of an entity at any point in time."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does a system achieve strong consistency? " response
answer="The only way to implement strong consistency is by locking down the nodes as they are being updated."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does CAP stand for? " response
answer="CAP stands for consistency, availability, partition tolerance."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does CAP theorem state should happen in case of network failure? " response
answer="The CAP theorem states that in case of a network failure, when a few of the system nodes are down, we have to choose between availability and consistency."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Real-time feeds"
additional_feedback="

    * Real-time feeds
    
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Live sports apps"
additional_feedback="

    * Real-time feeds
    * Live sports apps

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Writing product catalogues"
additional_feedback="

    * Real-time feeds
    * Live sports apps
    * Writing product catalogues

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Inventory management"
additional_feedback="

    * Real-time feeds
    * Live sports apps
    * Writing product catalogues
    * Inventory management

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Storing user comments"
additional_feedback="

    * Real-time feeds
    * Live sports apps
    * Writing product catalogues
    * Inventory management

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the typical use cases for a document-oriented database? " response
answer="Web-based multiplayer games"
additional_feedback="

    * Real-time feeds
    * Live sports apps
    * Writing product catalogues
    * Inventory management
    * Web-based multiplayer games

"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question

read -p "What are the two ways to represent graphs? " response
answer="Adjacency List and the Adjacency Matrix"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a good use case for an adjacency matrix? " response
answer="If the nodes in a graph contain a lot of edges."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a good use case for an adjacency list? " response
answer="if the edges in a graph are sparse."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How would use connections be represented in a graph? " response
answer="A graph data structure has a set of vertices or nodes and the associated edges."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would use connections be represented in a graph? 

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

Enter the next line: " response
answer="Vertices/nodes are typically seen as users or entities in a network, and the edges are seen as relationships."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges. Vertices/nodes are typically seen as 
    users or entities in a network, and the edges are seen as 
    relationships.


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would use connections be represented in a graph? 

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

Enter the next line: " response
answer="In the case of a social network, where there are, say, 2 billion users/nodes, a user/node on average would have 500 friends/edges."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges. Vertices/nodes are typically seen as 
    users or entities in a network, and the edges are seen as 
    relationships.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would use connections be represented in a graph? 

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

Enter the next line: " response
answer="The edges are pretty sparse in context to the number of nodes."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges. Vertices/nodes are typically seen as 
    users or entities in a network, and the edges are seen as 
    relationships.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

    The edges are pretty sparse in context to the number of nodes.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would use connections be represented in a graph? 

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

    The edges are pretty sparse in context to the number of nodes.

Enter the next line: " response
answer="Pick an adjacency list to represent this kind of graph because using an adjacency matrix would be a waste of memory."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges. Vertices/nodes are typically seen as 
    users or entities in a network, and the edges are seen as 
    relationships.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

    The edges are pretty sparse in context to the number of nodes.
    Pick an adjacency list to represent this kind of graph because 
    using an adjacency matrix would be a waste of memory.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would use connections be represented in a graph? 

    A graph data structure has a set of vertices or nodes and 
    the associated edges.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

    The edges are pretty sparse in context to the number of nodes.
    Pick an adjacency list to represent this kind of graph because 
    using an adjacency matrix would be a waste of memory.

Enter the next line: " response
answer="If the relationships/edges between the nodes were in billions, then the data would be represented in a adjacency matrix."
additional_feedback="

    A graph data structure has a set of vertices or nodes and 
    the associated edges. Vertices/nodes are typically seen as 
    users or entities in a network, and the edges are seen as 
    relationships.

    In the case of a social network, where there are, say, 2 
    billion users/nodes, a user/node on average would have 500 
    friends/edges.

    The edges are pretty sparse in context to the number of nodes.
    Pick an adjacency list to represent this kind of graph because 
    using an adjacency matrix would be a waste of memory.

    If the relationships/edges between the nodes were in billions, 
    then the data would be represented in a adjacency matrix.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are depth-first search used for? " response
answer="Depth-first search is primarily run to find paths and connectivity between the nodes and detect cycles in a graph."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a breadth-first search used for? " response
answer="Breadth-first search is used to find the shortest path between two nodes."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? " response
answer="Dijkstra's algorithm"
additional_feedback="

    * Dijkstra's algorithm

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm

Enter the next line: " response
answer="Bellman-Ford algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm
    * Bellman-Ford algorithm

Enter the next line: " response
answer="A* search algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm

Enter the next line: " response
answer="A* search algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm

Enter the next line: " response
answer="Floyd–Warshall algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm
    * Floyd–Warshall algorithm

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm
    * Floyd–Warshall algorithm

Enter the next line: " response
answer="Johnson's algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm
    * Floyd–Warshall algorithm
    * Johnson's algorithm


"
evaluate_answer "$response" "$answer"

next_question

read -p "What are some algorithms used to calculate the shortest distances between two paths? 

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm
    * Floyd–Warshall algorithm
    * Johnson's algorithm

Enter the next line: " response
answer="Viterbi algorithm"
additional_feedback="

    * Dijkstra's algorithm
    * Bellman-Ford algorithm
    * A* search algorithm
    * Floyd–Warshall algorithm
    * Johnson's algorithm
    * Viterbi algorithm


"
evaluate_answer "$response" "$answer"

next_question

read -p "What are use cases for graph database? " response
answer="Use cases of graph databases are building social, knowledge, and network graphs, writing AI-based apps, recommendation engines, fraud analysis apps and storing genetic data."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the primary use case for a key-value store? " response
answer="Due to the minimum latency they ensure, that is constant O(1) time, the primary use case for these databases is caching application data."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are time-series databases? " response
answer="Time-series databases are optimized for tracking and persisting data that is continually read and written in the system over a period of time."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are time-series data used for? " response
answer="Time-series data is primarily used for studying data streaming-in from applications such as IoT devices, self-driving vehicles, industry sensors, social networks, and stock market financial data."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some popular time-series databases? " response
answer="* Influx DB * Timescale DB * Prometheus"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How do wide-column databases store data? " response
answer="Wide-column databases store data in a record with a dynamic number of columns. A record can hold billions of columns."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What does throughput mean? " response
answer="Throughput means the number of network calls or request-response cycles between the client and the server within a stipulated time."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How does the cache aside strategy work? " response
answer="The data is lazy-loaded in the cache. "
additional_feedback="

    The data is lazy-loaded in the cache. 


"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="When the user sends a request for particular data, the system first looks for it in the cache."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="If present, it is simply returned. This is called a cache hit."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="If not, this is called a cache miss."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.



"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

    If not, this is called a cache miss. In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="When it comes to data write, it is directly written to the database."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

    If not, this is called a cache miss. In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests.

    When it comes to data write, it is directly written to the database.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="Now, this could cause data inconsistency between the cache and the database."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

    If not, this is called a cache miss. In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests.

    When it comes to data write, it is directly written to the database. Now, this could cause data inconsistency between the cache and the database.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="To avoid this, the data on the cache has a TTL (Time to live)."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

    If not, this is called a cache miss. In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests.

    When it comes to data write, it is directly written to the database. Now, this could cause data inconsistency between the cache and the database. To avoid this, the data on the cache has a TTL (Time to live).

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the cache aside strategy work? 

    The data is lazy-loaded in the cache. 

Enter the next line: " response
answer="After it expires, the data is invalidated from the cache."
additional_feedback="

    The data is lazy-loaded in the cache. When the user sends a request for particular data, the system first looks for it in the cache. If present, it is simply returned. This is called a cache hit.

    If not, this is called a cache miss. In this case, the application fetches the data from the database and returns it to the user, also updating the cache for future requests.

    When it comes to data write, it is directly written to the database. Now, this could cause data inconsistency between the cache and the database. To avoid this, the data on the cache has a TTL (Time to live). After it expires, the data is invalidated from the cache.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the read-through cache strategy? " response
answer="Application data in this strategy is also lazy-loaded in the cache only when the user requests it in a read-through strategy explicit logic updates the cache."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the write-through cache strategy? " response
answer="Every write goes through the cache before updating the database."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the write-back strategy? " response
answer="In the write-back strategy, the data is directly written to the cache instead of the database, and the cache, after some delay, as per the business logic, writes data to the database."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "When should we implement a cache-aside caching strategy? " response
answer="When our application is read-heavy. It contains data that is not frequently updated, like user profile data in a portal."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "When should we implement a write-through caching strategy? " response
answer="When the application is write-heavy like a stock market trading app or an online massive multiplayer game."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a message queue? " response
answer="A message queue, as the name says, is a queue that routes messages from the source to the destination or the sender to the receiver following the FIFO (First in, first out) policy."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the parts of the message queue? " response
answer="There is a message sender called the producer, and there is a message receiver called the consumer."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are some important features of a message queue? " response
answer="Adding priority to the messages, message acknowledgments and retrying failed messages."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the publisher-subscriber model? " response
answer="A pub-sub model is a model that enables a single or multiple producers to broadcast messages to multiple consumers."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the fanout exchange in the pub-sub model? " response
answer="Fanout exchange will push the messages to the queue and the consumers will receive the message broadcast. The relationship between the exchange and the queue is known as binding."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is a point-to-point model? " response
answer="In a point-to-point the message from the producer is consumed by only one consumer."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What are the two protocols used for " response
answer="* Advanced Message Queue Protocol (AMQP) * Simple or Streaming Text Oriented Message Protocol (STOMP)"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the down side to polling data at regular short intervals? " response
answer="It will consume a lot of bandwidth and will also put a lot of unnecessary load on the database."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the down side to polling data at regular short intervals? 

    * It will consume a lot of bandwidth and will also put a lot of 
      unnecessary load on the database.

Enter the next line: " response
answer="The user's post displayed on the home page of their connection's homepage will not be in real-time. The posts won't display until the database is polled."
additional_feedback="

    * It will consume a lot of bandwidth and will also put a lot of 
      unnecessary load on the database.

    * The user's post displayed on the home page of their connection's 
      homepage will not be in real-time. The posts won't display until 
      the database is polled.

"
evaluate_answer "$response" "$answer"

next_question

read -p "How would distributed transactions be used when a user creates a post? " response
answer="One transaction will update the database, and the other transaction will send the post payload to the message queue."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "How would distributed transactions be used when a user creates a post? 

    * One transaction will update the database, and the other transaction 
      will send the post payload to the message queue.

Enter the next line: " response
answer="On receiving the message, the message queue will asynchronously and immediately push the post to the user's connections that are online."
additional_feedback="

    * One transaction will update the database, and the other transaction 
      will send the post payload to the message queue.

    * On receiving the message, the message queue will asynchronously and 
      immediately push the post to the user's connections that are online.

"
evaluate_answer "$response" "$answer"

next_question

read -p "What is the use of a message queue in web applications? " response
answer="A message queue enables us to implement asynchronous behavior in the application."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the use of a message queue in web applications? 

Enter the next line: " response
answer="Features with asynchronous behavior such as user notifications are built with the help of message queues."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application. Features with asynchronous behavior such as user notifications etc. are built with the help of message queues.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the use of a message queue in web applications? 

Enter the next line: " response
answer="Message queues facilitate cross-module communication."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application. Features with asynchronous behavior such as user notifications etc. are built with the help of message queues.

    * Message queues facilitate cross-module communication.     

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the use of a message queue in web applications? 

Enter the next line: " response
answer="Different services running on heterogeneous technologies can communicate with each other via message queues."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application. Features with asynchronous behavior such 
      as user notifications etc. are built with the help of message 
      queues.

    * Message queues facilitate cross-module communication. Different 
      services running on heterogeneous technologies can communicate 
      with each other via message queues.     

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the use of a message queue in web applications? 

Enter the next line: " response
answer="Batch jobs in the application are run with the help of message queues."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application. Features with asynchronous behavior such 
      as user notifications etc. are built with the help of message 
      queues.

    * Message queues facilitate cross-module communication. Different 
      services running on heterogeneous technologies can communicate 
      with each other via message queues.  

    * Batch jobs in the application are ran with the help of message queues.   

"
evaluate_answer "$response" "$answer" "$additional_feedback"

read -p "What is the use of a message queue in web applications? 

Enter the next line: " response
answer="Traffic surge on the application can also be managed with the help of a message queue."
additional_feedback="

    * A message queue enables us to implement asynchronous behavior 
      in the application. Features with asynchronous behavior such 
      as user notifications etc. are built with the help of message 
      queues.

    * Message queues facilitate cross-module communication. Different 
      services running on heterogeneous technologies can communicate 
      with each other via message queues.  

    * Batch jobs in the application are ran with the help of message 
      queues.   

    * Traffic surge on the application can also be managed with the help 
      of a message queue.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How can an application achieve strong consistency with the help of a message queue?" response
answer="Queue all the incoming requests to update a particular resource and then process them one by one instead of letting all the requests update the resource in no particular order."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is data ingestion? " response
answer="Data ingestion is a collective term for the process of collecting data streaming in from several different sources and making it ready to be processed by the system."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is the data processing system? " response
answer="The data is ingested from the IoT devices and other sources into the system then routed to different components/layers through the data pipelines, algorithms are run on it, and it is eventually archived."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What happens in the data collection layer? " response
answer="Data is collected and converted into a standardized format to avoid any future processing issues."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What happens in the data processing layer? " response
answer="Data is classified into different flows and routed to different destinations."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What happens in the data analytics layer? " response
answer="Analytics are run on the data, such as predictive modeling, statistical analytics, and text analytics."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What happens in the data visualization layer? " response
answer="Data is presented before the stakeholders, generally in a web-based dashboard."
additional_feedback="Kibana is one good example of a data visualization tool."
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is distributed-data processing? " response
answer="Distributed-data processing means diverging large amounts of data to several different nodes running in a cluster for parallel processing."
additional_feedback=""
evaluate_answer "$response" "$answer"


next_question

read -p "What is MapReduce? " response
answer="MapReduce is a programming model written for managing distributed data processing across several different machines in a cluster"
additional_feedback="

    MapReduce is a programming model written for managing 
    distributed data processing across several different 
    machines in a cluster

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is MapReduce? " response
answer=", distributing tasks to several machines,"
additional_feedback="

    MapReduce is a programming model written for managing 
    distributed data processing across several different 
    machines in a cluster, distributing tasks to several 
    machines,

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is MapReduce? " response
answer="running work in parallel,"
additional_feedback="

    MapReduce is a programming model written for managing 
    distributed data processing across several different 
    machines in a cluster, distributing tasks to several 
    machines, running work in parallel,

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is MapReduce? " response
answer="and managing all the communication and data transfer within different parts of the system."
additional_feedback="

    MapReduce is a programming model written for managing 
    distributed data processing across several different 
    machines in a cluster, distributing tasks to several 
    machines, running work in parallel, and managing all 
    the communication and data transfer within different 
    parts of the system.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is MapReduce? " response
answer="The Map part of the programming model involves sorting the data based on a parameter and the Reduce part involves summarizing the sorted data."
additional_feedback="

    MapReduce is a programming model written for managing 
    distributed data processing across several different 
    machines in a cluster, distributing tasks to several 
    machines, running work in parallel, and managing all 
    the communication and data transfer within different 
    parts of the system.

    The Map part of the programming model involves sorting 
    the data based on a parameter and the Reduce part involves 
    summarizing the sorted data.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is Apache Kafka? " response
answer="Apache Kafka is an open-source distributed stream processing and messaging platform developed by LinkedIn. The storage layer of Kafka involves a distributed scalable pub-sub message queue."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "" response
answer=""
additional_feedback=""
evaluate_answer "$response" "$answer"





 

 









