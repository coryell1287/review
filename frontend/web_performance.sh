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
        echo "    You scored $score% on web performance."
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

########################################
             "
        calculate_score
        exit 1
    fi
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







next_question

read -p "What is a technique to improve the rendering phase? " response
answer="Promoting content to it's own layers and composited can improve performance by painting portions of the screen on the GPU instead of the CPU, freeing up the main thread."
evaluate_answer "$response" "$answer"

next_question

read -p "What the style phase in the rendering process? " response
answer="The style process combines the DOM and CSSOM into a render tree,  starting with the root of the DOM, then traversing each visible node until its CSSOM rules are applied."
evaluate_answer "$response" "$answer"
 
next_question

read -p "What is layout phase in the rendering process? " response
answer="Layout is the process by which the width, height, and location of all the nodes in the render tree are determined, plus the determination of the size and position of each object on the page."
evaluate_answer "$response" "$answer"

next_question

read -p "What is reflow? " response
answer="Reflow is any subsequent recalcuations of the layout's size and position determination of any part of the page or the entire document."
evaluate_answer "$response" "$answer"

next_question

read -p "What the paint phase of the rendering process? " response
answer="Paint is when the browser converts each box calculated in the layout phase to actual pixels on the screen. Painting involves drawing every visual part of an element to the screen, including text, colors, borders, shadows, and replaced elements like buttons and images."
evaluate_answer "$response" "$answer"


next_question

read -p "What is compositing? " response
answer="Compositing ensures sections of the document drawn in different layers to the screen get drawn in the correct order, and the content gets rendered correctly."
evaluate_answer "$response" "$answer"


next_question

read -p "What is Time to Interactive (TTI)? " response
answer="Time to Interactive (TTI) is the measurement of how long it took from that first request which led to the DNS lookup and SSL connection to when the page is interactive -- interactive being the point in time after the First Contentful Paint when the page responds to user interactions within 50ms."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the GPU good at handling? " response
answer="GPU is good at handling simple tasks but across multiple cores at the same time."
evaluate_answer "$response" "$answer"
Inter Process Communication (IPC)

next_question

read -p "What is Inter Process Communication? " response
answer="Inter Process Communication is how multiple processes communicate with one another."
evaluate_answer "$response" "$answer"

next_question

read -p "What is loss-less compression? " response
answer="Loss-less compression is where the compression-uncompression cycle does not alter the data that is recovered. It matches byte to byte with the original. For images, gif or png are using lossless compression."
evaluate_answer "$response" "$answer"

next_question

read -p "What is lossy compression? " response
answer="Lossy compression is where the cycle alters the original data in a imperceptible way for the user. Video formats on the Web are lossy; the jpeg image format is also lossy."
evaluate_answer "$response" "$answer"

next_question

read -p "What is end-to-end compression? " response
answer="End-to-end compression refers to a compression of the body of a message that is done by the  server and will last unchanged until it reaches the client. Whatever the intermediate nodes are, they leave the body untouched."
evaluate_answer "$response" "$answer"

next_question

read -p "What are some common compression algorithms? " response
answer="gzip, the most common one, and br."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a hop-by-hop compression? " response
answer="Hop-by-hop compression, though similar to end-to-end compression, differs by one fundamental  element: the compression does not happen on the resource in the server, creating a specific representation that is then transmitted, but on the body of the message between any two nodes on the path between the client and the server. Connections between successive intermediate nodes may apply a different compression."
evaluate_answer "$response" "$answer"

next_question

read -p "When is Transfer-Encoding used? " response
answer="Transfer-Encoding are mostly used to send a response by chunks, allowing to start transmitting a resource without knowing its length."
evaluate_answer "$response" "$answer"

next_question

read -p "" response
answer=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is preload? " response
answer="Preload is a declarative fetch, allowing you to force the browser to make a request for a resource, before browsers\' main rendering machinery starts, without blocking the document\'s onload event."
evaluate_answer "$response" "$answer"

next_question

read -p "What is prefetch? " response
answer="Prefetch is the process whereby the browser fetches the resources of a link and stores it in its local cache."
evaluate_answer "$response" "$answer"

next_question

read -p "Write link element that preloads a Shopify font from a CDN. " response
answer="<link rel=\"preload\" as=\"font\" crossorigin=\"crossorigin\" type=\"font/woff2\" href=\"https://cdn.shopify.com\"/>"
evaluate_answer "$response" "$answer"
evaluate_answer "$response" "$answer"

next_question

read -p "When would a developer use preload? " response
answer="Developers preload resources when they have high-confidence the resource will be used in the current page."
evaluate_answer "$response" "$answer"

next_question

read -p "When would a developer prefetch a resource? " response
answer="Developers prefetch resources when the resource will be used for future navigations across multiple navigation boundaries."
evaluate_answer "$response" "$answer"

next_question

read -p "How are resources cached when they are preloaded or prefetched? " response
answer="If the resource has a valid cache-control with valid max-age, it is stored in the HTTP cache and is available for current and future sessions. If the resource is not cacheable, the browser will not store it in the HTTP cache—instead, it goes to the memory cache and remains until a future request."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the call-by-value strategy? " response
answer="The call-by-value strategy consists in copying the contents of the actual parameters into the formal parameters. State changes performed in the formal parameters do not reflect back into the actual parameters. "
evaluate_answer "$response" "$answer"

next_question

read -p "What is call-by-reference? " response
answer="Whereas in the call-by-value strategy we copy the contents of the actual parameter to the formal parameter, in the call-by-reference we copy the address of the actual parameter to the formal one."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a downside to eager evaluation? " response
answer="Eager evaluation has the downside that, if a user tries to interact with your page while the code is evaluating, the browser must wait until the code is done evaluating to respond."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the problem with lazy evaluation? " response
answer="The problem with waiting until the user needs the result of running that code is now you’re guaranteeing that your expensive code will block user input. Choose wisely which processes need to be delay until requested."
evaluate_answer "$response" "$answer"

next_question

read -p "Can converting synchronous code to a microtask prevent the UI from block? " response
answer="While browsers can run input callbacks ahead of queued tasks, they cannot run input callbacks ahead of queued microtasks. And since promises and async functions run as microtasks, converting your sync code to promise-based code will not prevent it from blocking user input."
evaluate_answer "$response" "$answer"

next_question

read -p "Can converting synchronous code to a microtask prevent the UI from block? " response
answer="While browsers can run input callbacks ahead of queued tasks, they cannot run input callbacks ahead of queued microtasks. And since promises and async functions run as microtasks, converting your sync code to promise-based code will not prevent it from blocking user input."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the best and worst case scenario for idle-unitl-urget? " response
answer="In the worst case, it has the exact same performance characteristics as lazy evaluation, and in the best case it doesn’t block interactivity at all because execution happens during idle periods."
evaluate_answer "$response" "$answer"

next_question

read -p "
    How does the following code work? 

    export class IdleValue {
        constructor(init) {
          this._init = init;
          this._value;
          this._idleHandle = requestIdleCallback(() => {
            this._value = this._init();
          });
       }

        getValue() {
          if (this._value === undefined) {
            cancelIdleCallback(this._idleHandle);
            this._value = this._init();
           }
          return this._value;
        }

       // ...
    }
Enter your answer: " response
answer="IdleValue class works is it schedules the initialization function to be run during the next idle period. If the idle period occurs before the IdleValue instance is referenced, then no blocking occurs and the value can be returned immediately when requested. But if, on the other hand, the value is referenced before the next idle period, then the scheduled idle callback is canceled and the initialization function is run immediately."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the last reliable callback developers have before the user terminates the page? " response
answer="The last reliable callback developers have before a page gets terminated or discarded is the visibilitychange event as the page’s visibilityState changes to hidden."
evaluate_answer "$response" "$answer"

next_question

read -p "Give an example of code developers should evaluate to determine whether the developer should use idle-unitl-urgent. " response
answer="The first thing I'd suggest to do is look at all your constructor functions, and if any of them run potentially-expensive operations, refactor them to use an IdleValue object instead."
evaluate_answer "$response" "$answer"


next_question


