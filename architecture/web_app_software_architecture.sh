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

read -p "" response
answer=""
additional_feedback=""
evaluate_answer "$response" "$answer"