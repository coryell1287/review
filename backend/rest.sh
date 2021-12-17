#!/bin/bash

correct=0
questions=0

calculate_float() {
    awk "BEGIN {printf \"%.2f\n\", $1 / $2}"
}

calculate_score() {

    if [[ correct -eq 0 ]]; then
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
        echo "    You scored $score% on rest architecture review."
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

        
       Your answer:     "$1"
       Correct answer:  "$2"

########################################
             "
    fi
    calculate_score
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

read -p "Complete the following sentence: 

    Applications that do not require reliable data stream service 
    may use the ______________.

"
answer="User Datagram Protocol"
additional_feedback="

    Correct.

    User Datagram Protocol provides a connectionless datagram service 
    that prioritizes time over reliability.
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What does the Transmission Control Protocol do? " response
answer="The Transmission Control Protocol provides a communication service at an intermediate level between an application program and the Internet Protocol."
additional_feedback="

    Correct.

    At the transport layer, TCP handles all handshaking and transmission 
    details and presents an abstraction of the network connection to the 
    application typically through a network socket interface.

"
evaluate_answer "$response" "$answer"

next_question

read -p "
    At the lower levels of the protocol stack, due to network congestion, what happens when
    traffic load balancing, or unpredictable network behaviour, IP packets get lost, duplicated, 
    or delivered out of order? 
    
Enter your answer " response
answer="TCP detects these problems, requests re-transmission of lost data, rearranges out-of-order data and even helps minimize network congestion to reduce the occurrence of the other problems."
evaluate_answer "$response" "$answer"

next_question

read -p "Is TCP a good option for real-time applications? " response
answer="No. Protocols like the Real-time Transport Protocol (RTP) operating over the User Datagram Protocol (UDP) are usually recommended instead"
evaluate_answer "$response" "$answer"

next_question

read -p "How does TCP and IP work together? " response
answer="While IP handles actual delivery of the data, TCP keeps track of segments - the individual units of data transmission that a message is divided into for efficient routing through the network."
additional_feedback="

    Correct.

    For example, when an HTML file is sent from a web server, the TCP software 
    layer of that server divides the file into segments and forwards them individually 
    to the internet layer in the network stack. The internet layer software encapsulates 
    each TCP segment into an IP packet by adding a header that includes (among other data) 
    the destination IP address. When the client program on the destination computer receives 
    them, the TCP software in the  transport layer re-assembles the segments and ensures they 
    are correctly ordered and error-free as it streams the file contents to the receiving 
    application.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

read -p "What does REST mean and who came up wit the concept? " response
answer="REST means Representational State Transfer. Roy Field Jr. came up with term REST in 2000 to define architectural constraints."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the client-server contraint? " response
answer="Decouple the user interface concerns from the data storage concerns with the client-server architecture style."
additional_feedback="

    Separation of concerns principles makes the distributed system's
    server components scalable by removing any view rendering related
    concerns while improving the user interface portable across multiple
    platforms. Thus the same server components can be used by multiple 
    clients on different platforms with various view specific implementation
    with the same response from the server.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the stateless constraint? " response
answer="The client is responsible storing and managing any session related information at the client side and send all information related to request to the server so that the server doesn't need to use any of the previous request details."
additional_feedback="

    The constraint provides the RESTful service with the visibility,
    reliability, and scalibility.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Explain the characterstic of visibility in REST"
evaluate_answer "$response" "$answer"
answer="Visibility: the request has everything so the server doesn't have to look beyond the single request."

next_question

read -p "Explain the characterstic of reliability in REST"
evaluate_answer "$response" "$answer"
answer="Reliability: other request do not depend on a single request so other request fail without impacting one another."

next_question

read -p "Explain the characterstic of scalability in REST"
evaluate_answer "$response" "$answer"
answer="Scalibility: Server components do not store state between request, so resources are free once a request is processed."

next_question

read -p "Explain the Cache constraint? " response
answer="The server component can label the data in the response for a request as cacheable or non-cacheable and client can re-use this response for the same request later"
evaluate_answer "$response" "$answer"

next_question

read -p "Explain the Uniform Interface constraint? " response
answer="Uniform Interface constraint enforces the component's behavior or interfaces to be uniform across all the components even though the implementation varies."
evaluate_answer "$response" "$answer"

next_question

read -p "Explain a Resource in the context of Uniform Constraint. " response
answer="It is mapping to a set of entities and can be any information that can be named: a document, image or temporal service, a collection of other resources or a non-virtual object."
evaluate_answer "$response" "$answer"

next_question

read -p "Explain a Representation in the context of Uniform Constraint. " response
answer="Representation consists of data and metadata about about the data. The data format of representation is known as media type."
evaluate_answer "$response" "$answer"

next_question

read -p "Explain a Self-Descripitive Message in the context of Uniform Constraint. " response
answer="The response from the server should contain the media type ofr the resource's representation to the client, so that the client knows how to parse and process the data."
evaluate_answer "$response" "$answer"

next_question

read -p "Explain a HATEOS in the context of Uniform Constraint. " response
answer="HATEOS is an acronym for Hypermedia As the Engine of Application State. It means the response from the server should have links for other application states so that the client can use those links to move to the next state of the applicatio."
evaluate_answer "$response" "$answer"

next_question

read -p "Explain a HATEOS in the context of Uniform Constraint. " response
answer="HATEOS is an acronym for Hypermedia As the Engine of Application State. It means the response from the server should have links for other application states so that the client can use those links to move to the next state of the applicatio."
evaluate_answer "$response" "$answer"

next_question

read -p "What is content negotiatio? " response
answer="Content negotiation is the mechanism that is used for serving different representations of a resource to the same URI to help the user agent specify which representation is best suited for the user."
additional_feedback="

    for example, which document language, which image format, or which content encoding.
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a resource? " response
answer="A resource is a specific document."
evaluate_answer "$response" "$answer"

next_question

read -p "How is a resource obtained? " response
answer="The client requests a resource via a URL."
evaluate_answer "$response" "$answer"

next_question

read -p "
    The server uses this URL to choose one of the resource variants available. 
    What is a variant in this content?

Enter your answer: " response
answer="A variant is a representation."
evaluate_answer "$response" "$answer"

next_question

read -p "How is a representation identified? " response
answer="Representation is identified using specific HTTP headers by the client (server-driven negotiation or proactive negotiation). HTTP response codes by the server (agent-driven negotiation or reactive negotiation), that are used as fallback mechanisms."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a drawback to server-driven negotiation? " response
answer="Server-driven negotiation does not scale. Negotiation involves one header per request. As the number of headers increases, the message size could eventually affect performance. Sending precise headers allows for HTTP fingerprinting and corresponding privacy concerns."
evaluate_answer "$response" "$answer"

next_question

read -p "How does agent-driven negotiation work? " response
answer="The server sends back a page that contains links to the available alternative resources when faced with an ambiguous request. The user is presented the resources and chooses the one to use."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a drawback to agent-driven negotiation? " response
answer="The process can not automatically choose between the available resources and specify the format of the page. Another request is needed to fetch the actual resource, slowing the availability of the resource to the user."
evaluate_answer "$response" "$answer"

next_question

read -p "What is cross-site request forgery? " response
answer="CSRF is an attack that tricks the victim into submitting a malicious request. It inherits the identity and privileges of the victim to perform an undesired function on the victim’s behalf."
additional_feedback="

    With a little help of social engineering (such as sending a 
    link via email or chat), an attacker may trick the users of 
    a web application into executing actions of the attacker’s 
    choosing. If the victim is a normal user, a successful CSRF 
    attack can force the user to perform state changing requests 
    like transferring funds, changing their email address, and so 
    forth. If the victim is an administrative account, CSRF can 
    compromise the entire web application

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Why do Cross-site Request Forgery target state changing request? " response
answer="Forcing the victim to retrieve data doesn’t benefit an attacker because the attacker doesn’t receive the response, the victim does."
evaluate_answer "$response" "$answer"

next_question

read -p "How does login Cross-site Request Forgery work? " response
answer="The attacker forces a non-authenticated user to log in to an account the attacker controls. If the victim does not realize this, they may add personal data—such as credit card information—to the account. The attacker can then log back into the account to view this data, along with the victim’s activity history on the web application."
evaluate_answer "$response" "$answer"

next_question

read -p "How often are DNS lookups performed? " response
answer="DNS lookups must be done for each unique hostname the requested page references. If your fonts, images, scripts, ads, and metrics all have different hostnames, a DNS lookup will have to be made for each one."
evaluate_answer "$response" "$answer"

next_question

read -p "How can multiple DNS lookups be problematic for mobile networks? " response
answer="When a user is on a mobile network, each DNS lookup has to go from the phone to the cell tower to reach an authoritative DNS server. The distance between a phone, a cell tower, and the name server can add significant latency."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a TLS negotiation? " response
answer="TLS negotiation determines which cipher will be used to encrypt the communication, verifies the server, and establishes that a secure connection is in place before beginning the actual transfer of data."
additional_feedback="

        While making the connection secure adds time to the page load,
        a secure connection is worth the latency expense, as the data 
        transmitted between the browser and the web server cannot be 
        decrypted by a third party.

"
evaluate_answer "$response" "$answer"

next_question

read -p "What is Time-to-first-byte? " response
answer="Time to First Byte (TTFB) is the time between when the user made the request—say by clicking on a link—and the receipt of this first packet of HTML. The first chunk of content is usually 14kb of data."
evaluate_answer "$response" "$answer"

next_question

read -p "What is TCP slow start? " response
answer="TCP slow start is an algorithm which balances the speed of a network connection. Slow start gradually increases the amount of data transmitted until the network's maximum bandwidth can be determined."
additional_feedback="

    TCP slow start gradually builds up transmission speeds appropriate 
    for the network's capabilities to avoid congestion.

"
evaluate_answer "$response" "$answer"

next_question

read -p "Why is it important for web performance optimization to include everything the browser needs to start rendering a page?" response
answer="Because even if the request page's HTML is larger than the initial 14KB packet, the browser will begin parsing and attempting to render an experience based on the data it has."
evaluate_answer "$response" "$answer"

next_question

read -p "What does preload scanner do? " response
answer="A preload scanner will parse through the content available and request high priority resources like CSS, JavaScript, and web fonts.  It will retrieve resources in the background so that by the time the main HTML parser reaches requested assets, they may possibly already be in flight, or have been downloaded."
additional_feedback="


    <link rel=\"stylesheet\" src=\"styles.css\"/>
    <script src=\"myscript.js\" async></script>
    <img src=\"myimage.jpg\" alt=\"image description\"/>
    <script src=\"anotherscript.js\" async></script>


    In this example, while the main thread is parsing the HTML and CSS, 
    the preload scanner will find the scripts and image, and start downloading 
    them as well. To ensure the script doesn't block the process, add the async 
    attribute, or the defer attribute if JavaScript parsing and execution order 
    is important.

    Waiting to obtain CSS doesn't block HTML parsing or downloading, 
    but it does block JavaScript, because JavaScript is often used to 
    query CSS properties’ impact on elements.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a CSSOM? " response
answer="The CSSOM is an independent data structure the browser converts into a map of styles from the CSS rules. The browser goes through each rule set in the CSS, creating a tree of nodes with a parent, child, and sibling relationships based on the CSS selectors."
evaluate_answer "$response" "$answer"

next_question

read -p "How does the browser traverse the CCSSOM? " response
answer="The browser begins with the most general rule applicable to a node and recursively refines the computed styles by applying more specific rules."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the accessibility tree? " response
answer="The accessibility object model (AOM) is like a semantic version of the DOM. The browser updates the accessibility tree when the DOM is updated."
evaluate_answer "$response" "$answer"

# next_question

# read -p "" response
# answer=""
# evaluate_answer "$response" "$answer"

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
