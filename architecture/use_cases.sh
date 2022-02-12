#!/bin/bash

correct=0
questions=0

evaluate_total_missed_questions() {
  missed_questions=$(expr $questions - $correct)
  if [ "$missed_questions" -eq 2 ]; then
    exit 1
  fi
}

calculate_float() {
  awk "BEGIN {printf \"%.2f\n\", $1 / $2}"
}

calculate_score() {

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
    echo "########################################"
    echo "          Progress                    "
    echo "    $questions questions answered."
    echo "    $correct answered correctly."
    score=$(calculate_float $correct $questions)
    echo "    You scored $score% on Typescript recipes."
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
  increment_questions_count
  if [ "$1" == "$2" ]; then
    increment_correct_responses
    affirm_answer "$3"
  else
    echo "     
########################################
        
       Wrong! There is no tommorrow, 
       so get this right right now!

        
       Your answer:     $1
       Correct answer:  $2

########################################
             "
  fi
  calculate_score
  evaluate_total_missed_questions
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

        
       Your answer:     $1
       Correct answer:  $2

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

echo "

     ########################################
                First Question
    ########################################

"


echo "

 #######################
      DATA PIPELINES
 ###################### 

"

read -p "What is Grafana? " response
answer="An open-source tool for running analytics & monitoring our systems online."
evaluate_answer "$response" "$answer"

next_question

read -p "What databases does Grafana connect to? " response
answer="Graphite, Prometheus, Influx DB, ElasticSearch, MySQL, PostgreSQL"
evaluate_answer "$response" "$answer"

next_question

read -p "What problem does Grafana help solve? " response
answer="Grafana helps track the user behaviour, application behaviour, frequency of errors popping up in production or a pre-prod environment, type of errors popping up."
evaluate_answer "$response" "$answer"

next_question

read -p "Can Grafana be deployed on premises? " response
answer="yes"
evaluate_answer "$response" "$answer"

echo "

    Dashboard Monitoring Architecural Flow
    https://www.scaleyourapp.com/wp-content/uploads/2019/01/cAdvisor-Dashboard-monitoring-architectural-flow_one-min.jpg

"

next_question

read -p "Describe a company that uses Grafana at scale? " response
answer="Salesforce processes more than 70 million e-commerce metrics per minute."
additional_feedback="Salesforce processes more than 70 million e-commerce metrics per minute."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Describe a company that uses Grafana at scale? 

    Salesforce processes more than 70 million e-commerce metrics per minute.

Enter the next line: " response
answer="From those metrics, the company's internal teams have configured thousands of unique alert definitions."
additional_feedback="

 Salesforce processes more than 70 million e-commerce metrics per minute. 
 From those metrics, the company's internal teams have configured thousands 
 of unique alert definitions.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Describe a company that uses Grafana at scale? 

    Salesforce processes more than 70 million e-commerce metrics per minute. 
    From those metrics, the company's internal teams have configured thousands 
    of unique alert definitions.

Enter the next line: " response
answer="Grafana alerting, in combination with Salesforce's own alerting service, processes more than 120,000 alerts per minute"
additional_feedback="

 Salesforce processes more than 70 million e-commerce metrics per minute. 
 From those metrics, the company's internal teams have configured thousands 
 of unique alert definitions. Grafana alerting, in combination with Salesforce's 
 own alerting service, processes more than 120,000 alerts per minute

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Describe a company that uses Grafana at scale? 

    Salesforce processes more than 70 million e-commerce metrics per minute. 
    From those metrics, the company's internal teams have configured thousands 
    of unique alert definitions. Grafana alerting, in combination with Salesforce's 
    own alerting service, processes more than 120,000 alerts per minute

Enter the next line: " response
answer="to provide proactive monitoring capabilities to its internal teams."
additional_feedback="

 Salesforce processes more than 70 million e-commerce metrics per minute. 
 From those metrics, the company's internal teams have configured thousands 
 of unique alert definitions. Grafana alerting, in combination with Salesforce's 
 own alerting service, processes more than 120,000 alerts per minute to provide 
 proactive monitoring capabilities to its internal teams.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"
   
next_question


echo "

  #######################################
        REAL-TIME COMMUNICATION
  #######################################

"

echo "

    Diagram of LinkedIn's Real Time Delivery and the Prscence Platform

    https://www.scaleyourapp.com/wp-content/uploads/2019/02/LinkedIn-Real-time-presence-min.jpg

"

read -p "What is LinkedIn's Real Time Delivery & the Presence Platform? " response
answer="It's a publish-subscribe system that streams data to the client, be it web or a mobile client, over a persistent connection as the events occur."
evaluate_answer "$response" "$answer"

next_question

read -p "What asynchronous framework does it use? " response
answer="It uses the Play framework."
evaluate_answer "$response" "$answer"

next_question

read -p "How does LinkedIn know when a user is online? " response
answer="The Real-Time Platform makes the user subscribe to a topic for the user's connection's presence status."
additional_feedback="The Real-Time Platform makes the user subscribe to a topic for the user's connection's presence status."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does LinkedIn know when a user is online? 

    The Real-Time Platform makes the user subscribe to a topic for the 
    user's connection's presence status.

Enter the next line: " response
answer="When the user's connections come online, the platform publishes an event and notifies all subscribers of that particular topic."
additional_feedback="

    The Real-Time Platform makes the user subscribe to a topic for the 
    user's connection's presence status. When the user's connections come 
    online, the platform publishes an event and notifies all subscribers of 
    that particular topic. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does LinkedIn know when a user is online? 

    The Real-Time Platform makes the user subscribe to a topic for the 
    user's connection's presence status. When the user's connections come 
    online, the platform publishes an event and notifies all subscribers of 
    that particular topic. 

Enter the next line: " response
answer="All the subscribers, including the user, know that a specific connection is online."
additional_feedback="

    The Real-Time Platform makes the user subscribe to a topic for the 
    user's connection's presence status. When the user's connections come 
    online, the platform publishes an event and notifies all subscribers of 
    that particular topic. All the subscribers, including the user, know that 
    a specific connection is online.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How Does the Presence Platform Handle Network temporary Disconnections? " response
answer="The presence platform doesn't immediately change the user status to manage temporary disconnects as soon as the user disconnects."
additional_feedback="

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform Handle Network temporary Disconnections? 

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects.

Enter the next line: " response
answer="Instead, the platform sends periodic heartbeats to the connected members."
additional_feedback="

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. Instead, the platform sends periodic heartbeats 
    to the connected members.  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform Handle Network temporary Disconnections? 

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. Instead, the platform sends periodic heartbeats 
    to the connected members. 

Enter the next line: " response
answer="If the user connects again within a specific time, the platform doesn't show the user as offline."
additional_feedback="

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. Instead, the platform sends periodic heartbeats 
    to the connected members. If the user connects again within 
    a specific time, the platform doesn't show the user as offline. 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform Handle Network temporary Disconnections? 

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. Instead, the platform sends periodic heartbeats 
    to the connected members. 

Enter the next line: " response
answer="On the UI, the user is online."
additional_feedback="

    The presence platform doesn't immediately change the user 
    status to manage temporary disconnects as soon as the user 
    disconnects. Instead, the platform sends periodic heartbeats 
    to the connected members. If the user connects again within 
    a specific time, the platform doesn't show the user as offline.
    On the UI, the user is online. 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform actual disconnects? " response
answer="The presence platform sends the update to the real-time delivery platform."
additional_feedback="

    The presence platform sends the update to the real-time delivery platform.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform actual disconnects? " response
answer="In turn, the delivery platform updates all the subscribers of that user/topic"
additional_feedback="

    The presence platform sends the update to the real-time delivery platform.
    In turn, the delivery platform updates all the subscribers of that user/topic 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How Does the Presence Platform actual disconnects? " response
answer="and persists the user's presence state in a distributed key/value database with the last active timestamp."
additional_feedback="

    The presence platform sends the update to the real-time delivery platform.
    In turn, the delivery platform updates all the subscribers of that user/topic 
    and persists the user's presence state in a distributed key/value database with 
    the last active timestamp.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Why would the Play framework be a better option for real-time communication over Spring MVC? " response
answer="Play supports a non-blocking IO inherently unlike Spring MVC."
evaluate_answer "$response" "$answer"

next_question

read -p "What could be a problem of working with splitting the processes into 
         different threads with Spring annotations and the Executor framework? " response
answer="Spring generates many threads for every micro process when the application requirements are asynchronous."
evaluate_answer "$response" "$answer"


echo "
   
   #############################################
     Case Study on Live For Facebook Mentions
   ############################################# 
"
next_question

read -p "What is Live for Facebook Mentions? " response
answer="Live for Facebook Mentions allows verified public figures using Mentions to broadcast live video to their fans on Facebook."
evaluate_answer "$response" "$answer"

next_question

read -p "What challenges did Facebook have to solve for? " response
answer="Engineers at Facebook had to solve for huge traffic spikes."
additional_feedback="

    Engineers at Facebook had to solve for huge traffic spikes.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What challenges did Facebook have to solve for? 

    Engineers at Facebook had to solve for huge traffic spikes.

Enter the next line: " response
answer="Public figures on Facebook can have millions of followers all trying to watch a video at once."
additional_feedback="

    Engineers at Facebook had to solve for huge traffic spikes.
    Public figures on Facebook can have millions of followers all 
    trying to watch a video at once.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What was the main issue Facebook had with Live for Facebook Mentions " response
answer="Some public figures have millions of followers on Facebook."
additional_feedback="

    Some public figures have millions of followers on Facebook.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was the main issue Facebook had with Live for Facebook Mentions?

    Some public figures have millions of followers on Facebook.

Enter the next line: " response
answer="This means that when public figures start a live broadcast"
additional_feedback="

    Some public figures have millions of followers on Facebook.
    This means that when public figures start a live broadcast,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was the main issue Facebook had with Live for Facebook Mentions?

    Some public figures have millions of followers on Facebook.

Enter the next line: " response
answer="we need to be able to handle the potential of more than a million people watching the broadcast at the same time."
additional_feedback="

    Some public figures have millions of followers on Facebook.
    This means that when public figures start a live broadcast,
    we need to be able to handle the potential of more than a million
    people watching the broadcast at the same time.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What was Facebook's solution for handling numerious concurrent connections? " response
answer="Facebook never allowed traffic spikes."
additional_feedback="

    Facebook never allowed traffic spikes.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's solution for handling numerious concurrent connections? 

Enter the next line: " response
answer="Instead of having clients connecting directly to the live stream server"
additional_feedback="

    Facebook never allowed traffic spikes. Instead of having 
    clients connecting directly to the live stream server,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's solution for handling numerious concurrent connections? 

Enter the next line: " response
answer="Facebook directed clients to a network of edge caches distributed around the globe."
additional_feedback="

    Facebook never allowed traffic spikes. Instead of having 
    clients connecting directly to the live stream server,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is HLS? " response
answer="HTTP Live Streaming is an HTTP-based adaptive bitrate streaming communications protocol developed by Apple Inc. and released in 2009."
evaluate_answer "$response" "$answer"

next_question

read -p "What was Facebook's initial approach to live streaming? " response
answer="A live video is split into three-second HLS segments in our implementation."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation.
    
Enter the next line: " response
answer="These segments are sequentially requested by the video player displaying the broadcast."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast.

Enter the next line: " response
answer="The segment request is handled by one of the HTTP proxies in an edge data center"
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center

Enter the next line: " response
answer="that checks to see whether the segment is already in an edge cache."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache.

Enter the next line: " response
answer="If the segment is in cache, it's returned directly from there."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there.

Enter the next line: " response
answer="If not, the proxy issues an HTTP request to the origin cache"
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, 

Enter the next line: " response
answer="which is another cache layer with the same architecture."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, 

Enter the next line: " response
answer="If the segment is not in origin cache"
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, 

Enter the next line: " response
answer="then it needs to request it to the server handling that particular stream."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. 

Enter the next line: " response
answer="then it needs to request it to the server handling that particular stream."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. 

Enter the next line: " response
answer="Then the server returns the HTTP response with the segment"
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. Then the server returns the HTTP 
    response with the segment

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was Facebook's initial approach to live streaming? 

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. Then the server returns the HTTP 
    response with the segment 

Enter the next line: " response
answer="which is cached in each layer, so following clients receive it faster."
additional_feedback="

    A live video is split into three-second HLS segments in our implementation. 
    These segments are sequentially requested by the video player displaying the 
    broadcast. The segment request is handled by one of the HTTP proxies in an 
    edge data center that checks to see whether the segment is already in an edge 
    cache. 

    If the segment is in cache, it's returned directly from there. If not, the 
    proxy issues an HTTP request to the origin cache, which is another cache 
    layer with the same architecture.

    If the segment is not in origin cache, then it needs to request it to the 
    server handling that particular stream. Then the server returns the HTTP 
    response with the segment, which is cached in each layer, so following 
    clients receive it faster.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What were the results of Facebook's first attempt at solving the live streaming issue? " response
answer="With this scheme, more than 98 percent of segments are already in an edge cache close to the user"
additional_feedback="

    With this scheme, more than 98 percent of segments are already in an edge cache close 
    to the user,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What were the results of Facebook's first attempt at solving the live streaming issue? 

    With this scheme, more than 98 percent of segments are already in an edge cache close 
    to the user,

Enter the next line: " response
answer="and the origin server receives only a fraction of requests."
additional_feedback="

    With this scheme, more than 98 percent of segments are already in an edge cache close 
    to the user, and the origin server receives only a fraction of requests.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What issues remained to address after Facebook's initial attempt 
        at resolving the live streaming issue? 

Enter the next line: " response
answer="The solution works well, except that at our scale there was some leakage"
additional_feedback="

    The solution works well, except that at our scale there was some leakage

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What issues remained to address after Facebook's initial attempt 
        at resolving the live streaming issue? 

         The solution works well, except that at our scale there was some leakage

Enter the next line: " response
answer="- about 1.8 percent of requests were getting past the edge cache."
additional_feedback="

    The solution works well, except that at our scale there was some leakage
    - about 1.8 percent of requests were getting past the edge cache.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How did Facebook address the request getting past the edge cache? " response
answer="To make sure there was no failure at the origin level, Facebook applied a technique called request coalescing."
evaluate_answer "$response" "$answer"

next_line

read -p "How does request coalescing work? " response
answer="The edge cache returns a cache miss for the first request"
additional_feedback="

    The edge cache returns a cache miss for the first request,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does request coalescing work? 

    The edge cache returns a cache miss for the first request,

Enter the next line: " response
answer="and it holds the following requests in a queue."
additional_feedback="

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does request coalescing work? 

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue.

Enter the next line: " response
answer="Once the HTTP response comes from the server"
additional_feedback="

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does request coalescing work? 

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,

Enter the next line: " response
answer="the segment is stored in the edge cache"
additional_feedback="

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,  the segment is stored 
    in the edge cache,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does request coalescing work? 

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,  the segment is stored 
    in the edge cache,

Enter the next line: " response
answer="and the requests in the queue are responded from the edge as cache hits."
additional_feedback="

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,  the segment is stored 
    in the edge cache, and the requests in the queue are responded 
    from the edge as cache hits.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does request coalescing work? 

     The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,  the segment is stored 
    in the edge cache, and the requests in the queue are responded 
    from the edge as cache hits.

Enter the next line: " response
answer="The origin cache in turn runs the same mechanism to handle requests from multiple edge caches."
additional_feedback="

    The edge cache returns a cache miss for the first request,
    and it holds the following requests in a queue. Once the 
    HTTP response comes from the server,  the segment is stored 
    in the edge cache, and the requests in the queue are responded 
    from the edge as cache hits. The origin cache in turn runs the 
    same mechanism to handle requests from multiple edge caches.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What was the results of Facebook's edge cache solution? " response
answer="The soltuion reduced the load to origin."
evaluate_answer_written_with_code "$response" "$answer" 

next_line

read -p "What is RTMP? " response
answer="Real-Time Messaging Protocol is a streaming protocol that maintains a persistent TCP connection"
additional_feedback="

    Real-Time Messaging Protocol is a streaming protocol that maintains 
    a persistent TCP connection

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is RTMP? 

    Real-Time Messaging Protocol is a streaming protocol that maintains 
    a persistent TCP connection

Enter the next line: " response
answer="between the player and the server during the whole broadcast."
additional_feedback="

    Real-Time Messaging Protocol is a streaming protocol that maintains 
    a persistent TCP connection between the player and the server during 
    the whole broadcast.    

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Why did Facebook start using RTMP " response
answer="To bring latency down to a two- to three-second transmission"
additional_feedback="

    To bring latency down to a two- to three-second transmission

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Why did Facebook start using RTMP 

Enter the next line: " response
answer="so that people be able to have near real-time conversations without an data transmission delay."
additional_feedback="

    To bring latency down to a two- to three-second transmission, so that 
    people be able to have near real-time conversations without an data 
    transmission delay.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is RTMP different from HLS? " response
answer="Unlike HLS, RTMP uses a push model."
additional_feedback="

    Unlike HLS, RTMP uses a push model.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is RTMP different from HLS? 

    Unlike HLS, RTMP uses a push model.

Enter the next line: " response
answer="Instead of the player requesting each segment"
additional_feedback="

    Unlike HLS, RTMP uses a push model. Instead of the player requesting 
    each segment,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is RTMP different from HLS? 

    Unlike HLS, RTMP uses a push model. Instead of the player requesting 
    each segment,

Enter the next line: " response
answer="the server continuously sends video and audio data."
additional_feedback="

    Unlike HLS, RTMP uses a push model. Instead of the player requesting 
    each segment, the server continuously sends video and audio data.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is RTMP different from HLS? 

    Unlike HLS, RTMP uses a push model. Instead of the player requesting 
    each segment, the server continuously sends video and audio data.

Enter the next line: " response
answer="The client can still issue pause and resume commands when the person requests it or when the player is not visible."
additional_feedback="

    Unlike HLS, RTMP uses a push model. Instead of the player requesting 
    each segment, the server continuously sends video and audio data. The 
    client can still issue pause and resume commands when the person requests 
    it or when the player is not visible.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How did RTMP work for Facebook? " response
answer="In RTMP, the broadcast is split into two streams: a video stream and an audio stream."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream.

Enter the next line: " response
answer="The streams are split into chunks of 4 KB"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream.

Enter the next line: " response
answer="which can be multiplexed in the TCP connection"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection.

Enter the next line: " response
answer="In other words, video and audio chunks are interleaved."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection.

Enter the next line: " response
answer="At a video bit rate of 500 Kbps, each chunk is only 64 ms long"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,

Enter the next line: " response
answer="which, compared with HLS segments of 3 seconds each"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each,

Enter the next line: " response
answer="produces smoother streaming across all components."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components.

Enter the next line: " response
answer="The broadcaster can send data as soon as it has encoded 64 ms of video data"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data;

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data;

Enter the next line: " response
answer="the transcoding server can process that chunk and produce multiple output bit rates."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data; the transcoding server can process that chunk 
    and produce multiple output bit rates. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data;

Enter the next line: " response
answer="The chunk is then forwarded through proxies until it reaches the player."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data; the transcoding server can process that chunk 
    and produce multiple output bit rates. 

    The chunk is then forwarded through proxies until it reaches 
    the player.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data;

Enter the next line: " response
answer="The push model plus small chunks reduce the lag between broadcaster and viewer by 5x"
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data; the transcoding server can process that chunk 
    and produce multiple output bit rates. 

    The chunk is then forwarded through proxies until it reaches 
    the player. The push model plus small chunks reduce the lag 
    between broadcaster and viewer by 5x

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How did RTMP work for Facebook? 

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data; the transcoding server can process that chunk 
    and produce multiple output bit rates. 

    The chunk is then forwarded through proxies until it reaches 
    the player. The push model plus small chunks reduce the lag 
    between broadcaster and viewer by 5x

Enter the next line: " response
answer="producing a smooth and interactive experience."
additional_feedback="

    In RTMP, the broadcast is split into two streams: a video stream 
    and an audio stream. The streams are split into chunks of 4 KB
    which can be multiplexed in the TCP connection. In other words, 
    video and audio chunks are interleaved.

    At a video bit rate of 500 Kbps, each chunk is only 64 ms long,
    which, compared with HLS segments of 3 seconds each, produces 
    smoother streaming across all components. 

    The broadcaster can send data as soon as it has encoded 64 ms 
    of video data; the transcoding server can process that chunk 
    and produce multiple output bit rates. 

    The chunk is then forwarded through proxies until it reaches 
    the player. The push model plus small chunks reduce the lag 
    between broadcaster and viewer by 5x, producing a smooth and 
    interactive experience.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What should engineers consider when architecting a live streaming application? " response
answer="People typically watch regular, non-live videos at different times."
additional_feedback="

    People typically watch regular, non-live videos at different times. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.

Enter the next line: " response
answer="You can see the traffic spike coming if something is viral"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral,

Enter the next line: " response
answer="so the minute-to-minute need to balance the load isn't there."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there.

Enter the next line: " response
answer="With live video, a large number of people watch the same video at the same time"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there.

Enter the next line: " response
answer="with potentially no notice, which creates a load problem and a cache problem."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice, which creates a load problem and a cache problem.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice, which creates a load problem and a cache problem.

Enter the next line: " response
answer="with potentially no notice of a traffic spike, which creates a load problem and a cache problem."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice, which creates a load problem and a cache problem.

Enter the next line: " response
answer="People request the same video segment at the same time"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice, which creates a load problem and a cache problem.

Enter the next line: " response
answer="People request the same video segment at the same time, and it may not be in cache yet."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice, which creates a load problem and a cache problem.

Enter the next line: " response
answer="People request the same video segment at the same time, and it may not be in cache yet."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet.

Enter the next line: " response
answer="Without a thundering herd prevention plan"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, 

Enter the next line: " response
answer="the edge cache would return a cache miss for all the client requests"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, 

Enter the next line: " response
answer="and all of them would go to origin cache"
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, and all 
    of them would go to origin cache,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, and all 
    of them would go to origin cache,

Enter the next line: " response
answer="and all the way to the live stream server."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, and all 
    of them would go to origin cache, and all the way to the live stream 
    server.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What should engineers consider when architecting a live streaming application? 

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, and all 
    of them would go to origin cache, and all the way to the live stream 
    server.

Enter the next line: " response
answer="This would mean that a single server would receive a huge number of requests."
additional_feedback="

    People typically watch regular, non-live videos at different times.
    You can see the traffic spike coming if something is viral, so the 
    minute-to-minute need to balance the load isn't there. With live video, 
    a large number of people watch the same video at the same time with 
    potentially no notice of a traffic spike, which creates a load problem 
    and a cache problem.

    People request the same video segment at the same time, and it may not 
    be in cache yet. Without a thundering herd prevention plan, the edge 
    cache would return a cache miss for all the client requests, and all 
    of them would go to origin cache, and all the way to the live stream 
    server. This would mean that a single server would receive a huge number 
    of requests.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

echo "

    Under the hood: Broadcasting live video to millions
    https://engineering.fb.com/2015/12/03/ios/under-the-hood-broadcasting-live-video-to-millions/

"

next_line

read -p " " response
answer=""
evaluate_answer "$response" "$answer"

