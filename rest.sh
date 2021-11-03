#!/bin/bash

correct=0
questions=0

increment_correct_responses() {
    ((correct = correct + 1))
}

increment_questions_count() {
    ((questions = questions + 1))
}

affirm_answer() {
    if [[ -z "$1" ]]; then
        echo "
    Correct. 

    "
    else
        echo "$1"
    fi
}

evaluate_answer() {

    if [[ "$1" == "$2" ]]; then
        increment_correct_responses
        affirm_answer "$3"
    else

        echo "
    
    Wrong! There is no tommorrow, so get this right right now!
    
    "
    fi
}

next_question() {
    echo "
 ########################################
             Next Question 
 ########################################
"
}

read -p "Complete this sentence: 
    An HTTP method is __________ if an identical request can be made __________
    in a row with the same effect while leaving the server in the same state. 
    In other words, an idempotent method should not have any side-effects (except for 
    keeping statistics).
    
Enter your answer: " response

answer="idempotent once or several times"
additional_feedback="
    Correct.

    An HTTP method is idempotent if an identical request can be made once or several 
    times in a row with the same effect while leaving the server in the same state. 
    In other words, an idempotent method should not have any side-effects (except for 
    keeping statistics).
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "Complete this sentence: 

         Implemented correctly, the ____, ______, _____, and _____ methods are 
         idempotent, but not the ______ method. All _____ methods are also idempotent.

Enter your answer: " response
additional_feedback="Implemented correctly, the GET, HEAD, PUT, and DELETE methods are 
                     idempotent, but not the POST method. All safe methods are also idempotent."
answer="GET HEAD PUT DELETE POST safe"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "Complete this sentence: 
         
         POST is idempotent because if called several times, it ____________.

Enter your answer: " response
answer="adds several rows"
additional_feedback="
    Correct.

    POST is idempotent because if called several times, it adds several rows.

    
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "Complete this sentence: 
        
        The HTTP GET method ________ a representation of the specified resource.

Enter your answer: " response
answer="request"
additional_feedback="
     Correct.

     The HTTP GET method request a representation of the specified resource.

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question




read -p "Complete this sentence: 
         The HTTP PATCH request method applies _____ _______ to a resource.       

Enter this answer: " response
answer="partial modifications"
additional_feedback="
    Correct.
    The HTTP PATCH request method applies partial modifications to a resource.
"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question



read -p "Complete this sentence: 

        The HTTP PUT request method ______ a new resource or _____ 
        a representation of the target resource with the ______ _______.

Enter your answer: " response
answer="creates replaces request payload"
additional_feedback="
    Correct.
    The HTTP PUT request method creates a new resource or replaces 
    a representation of the target resource with the request payload.
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question




read -p "Complete this sentence:

         When the PUT request successfully creates a representation, then the 
         origin server must inform the user agent by sending a ___ ______ 
         _______.

Enter your answer: " response
additional_feedback="
        Correct.

        When the PUT request successfully creates a representation, then the 
        origin server must inform the user agent by sending a 201 (Created) 
        response.
"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question



read -p "What is the difference between PUT and POST? " response
answer="PATCH is a set of instructions on how to modify a resource. PUT is a complet respentation of a resource."
additional_feedback="
        Correct.

        A PATCH request is considered a set of instructions on how to modify a resource. 
        Contrast this with PUT; which is a complete representation of a resource.
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question




read -p "Complete this sentence: 
    
         The HTTP POST method _________________. 

Enter your answer: " response
answer="sends data to the server"
additional_feedback="
        Correct.

        The HTTP POST method sends data to the server.
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question




read -p "What is Cross-origin resource sharing? " response
answer="Cross-Origin Resource Sharing (CORS) is an HTTP-header based mechanism that allows a server to indicate any origins (domain, scheme, or port) other than its own from which a browser should permit loading resources."
evaluate_answer "$response" "$answer"



next_question


read -p "What mechanism does CORS rely on to know whether an actual request will be permitted.? " response
answer="Preflight. In that preflight, the browser sends headers that indicate the HTTP method and headers that will be used in the actual request."
evaluate_answer "$response" "$answer"



next_question


read -p "How does the preflight mechanism work? " response
answer="A preflight request solicits supported methods from the server with HTTP OPTIONS request method. Upon approval from the server the, actual request is sent." 
evaluate_answer "$response" "$answer"



next_question



read -p "Which methods do not trigger a preflight? " response
answer="GET HEAD POST"
evaluate_answer "$response" "$answer"




next_question


read -p "

        Not all browsers currently support following redirects after a preflighted request.
        Until browsers catch up with the spec, you may be able to work around this limitation 
        by doing one or both of the following:

Enter your answer: " response
answer="Change the server-side behavior to avoid the preflight or to avoid the redirect or avoid both. Change the request to a simple request that doesn’t cause a preflight."
evaluate_answer "$response" "$answer"


next_question


read -p "What does the Access-Control-Allow-Origin header do? " response
answer="It specifies either a single origin which tells browsers to allow that origin to access the resource."
evaluate_answer "$response" "$answer"



next_question



read -p "What does the Access-Control-Max-Age header do? " response
answer="It indicates how long the results of a preflight request can be cached."
evaluate_answer "$response" "$answer"
additional_feedback="

        Correct.

        Access-Control-Max-Age: <delta-seconds>

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "What does the Access-Control-Allow-Credentials header do? " response
answer="Is indicates whether or not the response to the request can be exposed when the credentials flag is true."
additional_feedback="

        Correct.
        When used as part of a response to a preflight request, this indicates 
        whether or not the actual request can be made using credentials. 
        Note that simple GET requests are not preflighted, and so if a request 
        is made for a resource with credentials, if this header is not returned 
        with the resource, the response is ignored by the browser and not returned 
        to web content.

        Access-Control-Allow-Credentials: true

"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question


read -p "What is a cookie used for? " response 
answer="An HTTP cookie is used to tell if two requests come from the same browser. It remembers stateful information for the stateless HTTP protocol."
evaluate_answer "$response" "$answer"



next_question


read -p "What are three other uses for a cookie? " response
answer="Session management. Personalization: User preferences, themes, and other settings. Tracking: Recording and analyzing user behavior."
evaluate_answer "$response" "$answer"



next_question


read -p "How is session fixation attacks prevented? " response
answer="Regenerating and resending session cookies."
evaluate_answer "$response" "$answer"



next_question


read -p "How do developers ensure that cookies are sent securely and aren't accessed by unintended parties? " response
answer="Add the Secure attribute and the HttpOnly attribute."
additional_feedback="

    Correct.

    response.setHeader(\"SET-COOKIE\", \"JSESSIONID=\" + sessionid + \"; HttpOnly\");
    response.setHeader(\"SET-COOKIE\", \"JSESSIONID=\" + sessionid + \"; secure\");

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "What does the Domain attribute specify? " response
answer="The Domain attribute specifies which hosts can receive a cookie. If unspecified, the attribute defaults to the same host that set the cookie, excluding subdomains. If Domain is specified, then subdomains are always included."
evaluate_answer "$response" "$answer"



next_question



read -p "What does the SameSite attribute specify? " response
answer="The SameSite attribute lets servers specify whether and when cookies are sent with cross-site requests."
additional_feedback="

    Correct.

    This provides some protection against cross-site request forgery attacks (CSRF). 
    It takes three possible values: Strict, Lax, and None.

    Set-Cookie: mykey=myvalue; SameSite=Strict

"
evaluate_answer "$response" "$answer"


next_question







read -p "Why would using JSON web token be a better alternative than using cookies?" response
answer="When information is stored in cookies, all cookie values are visible and the user can change them."
evaluate_answer "$response" "$answer"






read -p "What are the Cookie-related Legislation or regulations that cover the use of cookies?" response
answer="General Data Privacy Regulation ePrivacy Directive California Consumer Privacy Act"
additional_feedback="

    Correct.

    The General Data Privacy Regulation (GDPR) in the European Union
    The ePrivacy Directive in the EU
    The California Consumer Privacy Act

    California's law applies only to entities with gross revenue over 
    25 million USD, among things).
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "What is covered under the Cookie-related Legislation or regulations? " response
answer="Notifying users that your site uses cookies. Allowing users to opt out of receiving some or all cookies. Allowing users to use the bulk of your service without receiving cookies."
evaluate_answer "$response" "$answer" 



next_question


read -p "What are the three steps to the client-server protocols? " response
answer="The client establishes a TCP connection. The client sends its request, and waits for the answer. The server processes the request, sending back its answer, providing a status code and appropriate data."
evaluate_answer "$response" "$answer"


next_question



read -p "What is Content Security Policy? " response
answer="Content Security Policy is an added layer of security that helps to detect and mitigate certain types of attacks, including Cross-Site Scripting (XSS) and data injection attacks."
additional_feedback="

    Correct.

    XSS attacks exploit the browser's trust in the content received from the server. 
    Malicious scripts are executed by the victim's browser because the browser trusts 
    the source of the content, even when it's not coming from where it seems to be coming 
    from.

    CSP makes it possible for server administrators to reduce or eliminate the 
    vectors by which XSS can occur by specifying the domains that the browser should 
    consider to be valid sources of executable scripts. A CSP compatible browser will 
    then only execute scripts loaded in source files received from those allowed domains, 
    ignoring all other scripts (including inline scripts and event-handling HTML attributes).

    As an ultimate form of protection, sites that want to never allow scripts to be 
    executed can opt to globally disallow script execution.
"
evaluate_answer "$response" "$answer"


########################################
#         Calculate your score         #
########################################

((questions = questions + 1))

if [[ correct -eq 0 ]]; then
    echo "
    You got nothing correct. Stop and go study.
    
    "
else
    score=$(((questions / correct) * 100))
    echo "    You scored $score% on REST knowledge."
fi

