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
    echo "    You scored $score% on web security."
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

read -p "Define click jacking. " response
answer="Clickjacking is when an attacker uses multiple transparent or opaque layers to trick a user into clicking on a button or link on another page when they were intending to click on the top level page."
additional_feedback="

    With a carefully crafted combination of stylesheets, iframes, 
    and text boxes, a user can be led to believe they are typing in 
    the password to their email or bank account, but are instead typing 
    into an invisible frame controlled by the attacker.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the first defense against clickjacking? " response
answer="Sending the proper Content Security Policy (CSP) frame-ancestors directive response headers that instruct the browser to not allow framing from other domains."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the second defense against clickjacking? " response
answer="Preventing the browser from loading the page in frame using the X-Frame-Options or Content Security Policy (frame-ancestors) HTTP headers."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the third defense against clickjacking? " response
answer="Preventing session cookies from being included when the page is loaded in a frame using the SameSite cookie attribute."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the fourth defense against clickjacking? " response
answer="Implementing JavaScript code in the page to attempt to prevent it being loaded in a frame (known as a \"frame-buster\")."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are a frame-ancestors directive? " response
answer="The frame-ancestors directive can be used in a Content-Security-Policy HTTP response header to indicate whether or not a browser should be allowed to render a page in a <frame> or <iframe>. Sites can use this to avoid Clickjacking attacks by ensuring that their content is not embedded into other sites."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the X-Frame-Options Header Types? " response
answer="DENY prevents any domain from framing the content. SAMEORIGIN only allows the current site to frame the content. ALLOW-FROM uri permits the specified uri to frame this page."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How is the protection against clickjacking implemented? " response
answer="One way is to implement a filter that automatically adds the header to every page or to add it at Web Application Firewall of Web/Application Server level."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is cross-site scripting? " response
answer="Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does cross-site scripting occur? " response
answer="XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Why Can't I Just HTML Entity Encode Untrusted Data? " response
answer="HTML entity encoding doesn't work if you're putting untrusted data inside a <script> tag anywhere, or an event handler attribute like onmouseover, or inside CSS, or in a URL."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #0 of XSS Prevention Rules? " response
answer="Never insert untrusted data except in allowed locations."
additional_feedback="

    <script>...NEVER PUT UNTRUSTED DATA HERE...</script>
    Inside an HTML comment:


    <!--...NEVER PUT UNTRUSTED DATA HERE...-->
    In an attribute name:


    <div ...NEVER PUT UNTRUSTED DATA HERE...=test />
    In a tag name:


    <NEVER PUT UNTRUSTED DATA HERE... href=\"/test\" />
    Directly in CSS:


    <style>
    ...NEVER PUT UNTRUSTED DATA HERE...
    </style>

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #1 of XSS Prevention Rules? " response
answer="HTML encode before inserting untrusted data into HTML element content."
additional_feedback="
    <body>
        ...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...
    </body>

    <div>
        ...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...
    </div>
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #2 of XSS Prevention Rules? " response
answer="JavaScript encode before inserting untrusted data into JavaScript data values."
additional_feedback="

    <script>alert('...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...')</script>
    One side of a quoted expression:

    <script>x='...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...'</script>
    Inside quoted event handler:

    <div onmouseover=\"x='...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...'\"</div>

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #3.1 of XSS Prevention Rules? " response
answer="HTML encode JSON values in an HTML context and read the data with JSON.parse."
additional_feedback="
    Ensure returned Content-Type header is application/json and not text/html. 
    This shall instruct the browser not misunderstand the context and execute injected script

    Bad HTTP response:


    HTTP/1.1 200
    Date: Wed, 06 Feb 2013 10:28:54 GMT
    Server: Microsoft-IIS/7.5....
    Content-Type: text/html; charset=utf-8 <-- bad
    ....

    Good HTTP response:


    HTTP/1.1 200
    Date: Wed, 06 Feb 2013 10:28:54 GMT
    Server: Microsoft-IIS/7.5....
    Content-Type: application/json; charset=utf-8 <--good
    .....
    A common anti-pattern one would see:


    <script>
    // Do NOT do this without encoding the data with one of the techniques listed below.
    var initData = <%= data.to_json %>;
    </script>

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #4 of XSS Prevention Rules? " response
answer="CSS encode and strictly validate before inserting untrusted data into HTML style property values."
additional_feedback="
    Property value:


    <style>
        selector { property : ...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...; }
    </style>

    <style>
        selector { property : \"...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...\"; }
    </style>

    <span style=\"property : ...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...\">text</span>
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #5 of XSS Prevention Rules? " response
answer="URL encode before inserting untrusted data into HTML URL parameter values."
additional_feedback="

    <a href=\"http://www.somesite.com?test=...ENCODE UNTRUSTED DATA BEFORE PUTTING HERE...\">link</a >

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #6 of XSS Prevention Rules? " response
answer="Sanitize HTML markup with a library designed for the job."
additional_feedback="

    HtmlSanitizer

    An open-source .Net library. The HTML is cleaned with an \"allow list\" approach. 
    All allowed tags and attributes can be configured. The library is unit tested with 
    the OWASP XSS Filter Evasion Cheat Sheet


    var sanitizer = new HtmlSanitizer();
    sanitizer.AllowedAttributes.Add(\"class\");
    var sanitized = sanitizer.Sanitize(html);
    OWASP Java HTML Sanitizer


    import org.owasp.html.Sanitizers;
    import org.owasp.html.PolicyFactory;
    PolicyFactory sanitizer = Sanitizers.FORMATTING.and(Sanitizers.BLOCKS);
    String cleanResults = sanitizer.sanitize(\"<p>Hello, <b>World!</b>\");

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #7 of XSS Prevention Rules? " response
answer="Avoid JavaScript URLs."
additional_feedback="

    Untrusted URLs that include the protocol javascript: will execute JavaScript 
    code when used in URL DOM locations such as anchor tag HREF attributes or iFrame 
    src locations. Be sure to validate all untrusted URLs to ensure they only contain 
    safe schemes such as HTTPS.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is rule #7 of XSS Prevention Rules? " response
answer="Prevent DOM-based XSS."
additional_feedback="

    For details on what DOM-based XSS is, and defenses against 
    this type of XSS flaw, please see the OWASP article on DOM 
    based XSS Prevention Cheat Sheet.
    https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Prevention_Cheat_Sheet.html
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is Bonus Rule #1 of XSS Prevention Rules? " response
answer="Use HTTPOnly cookie flag."
additional_feedback="

    Preventing all XSS flaws in an application is hard, as you can see. 
    To help mitigate the impact of an XSS flaw on your site, OWASP also 
    recommends you set the HTTPOnly flag on your session cookie and any 
    custom cookies you have that are not accessed by any JavaScript you 
    wrote. This cookie flag is typically on by default in .NET apps, but 
    in other languages you have to set it manually. For more details on 
    the HTTPOnly cookie flag, including what it does, and how to use it, 
    see the OWASP article on HTTPOnly.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is Bonus Rule #2 of XSS Prevention Rules? " response
answer="Implement content security policy."
additional_feedback="

    There is another good complex solution to mitigate the impact of an 
    XSS flaw called Content Security Policy. It's a browser side mechanism 
    which allows you to create source allow lists for client side resources 
    of your web application, e.g. JavaScript, CSS, images, etc. CSP via special 
    HTTP header instructs the browser to only execute or render resources from 
    those sources.

    For example this CSP:

    Content-Security-Policy: default-src: 'self'; script-src: 'self' static.domain.tld

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is Bonus Rule #3 of XSS Prevention Rules? " response
answer="Use an auto-escaping template system."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is Bonus Rule #4 of XSS Prevention Rules? " response
answer="Properly use modern JS frameworks."
additional_feedback="

    The following API methods and props in the table below are 
    considered dangerous and by using them you are potentially 
    exposing your users to an XSS vulnerability. If you really 
    have to use them remember that now all the data must be sanitized 
    by yourself.

    JavaScript framework	   Dangerous methods / props
    Angular (2+)	           bypassSecurityTrust
    React	                   dangerouslySetInnerHTML
    Svelte	                   {@html ...}
    Vue (2+)	               v-html

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Define injection. " response
answer="Injection is an attacker's attempt to send data to an application in a way that will change the meaning of commands being sent to an interpreter."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What makes identifying injection difficult? " response
answer="As untrusted data flows through an application, it is frequently split into parts, combined with safe data, transformed, validated, and encoded in a variety of ways. A single piece of data could go through dozens of these steps before it gets to an interpreter. This makes identifying injection problems very difficult."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What does OWASP mean? " response
answer="Open Web Application Security Project"
additional_feedback="

    Open Web Application Security Project (OWASP) is a nonprofit foundation that 
    works to improve the security of software.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Define Cross-Site Request Forgery (CSRF). " response
answer="Cross-Site Request Forgery (CSRF) is a type of attack that occurs when a malicious web site, email, blog, instant message, or program causes a user's web browser to perform an unwanted action on a trusted site when the user is authenticated."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does a CSRF work? " response
answer="A CSRF attack works because browser requests automatically include all cookies including session cookies. Therefore, if the user is authenticated to the site, the site cannot distinguish between legitimate authorized requests and forged authenticated requests."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the impact of a CSRF? " response
answer="This attack could result in a transfer of funds, changing a password, or making a purchase with the user's credentials. In effect, CSRF attacks are used by an attacker to make a target system perform a function via the victim's browser, without the victim's knowledge, at least until the unauthorized transaction has been committed."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the synchronizer token pattern? " response
answer="Synchronizer token pattern (STP) is a technique where a token, secret and unique value for each request, is embedded by the web application in all HTML forms and verified on the server side."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the double submit cookie? " response
answer="Double submit cookies is defined as sending a random value in both a cookie and as a request parameter, with the server verifying if the cookie value and request value are equal."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the double submit technique work? " response
answer="When a user visits (even before authenticating to prevent login CSRF), the site should generate a (cryptographically strong) pseudorandom value and set it as a cookie on the user's machine separate from the session identifier."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the impact of using the double submit technique? " response
answer="The site then requires that every transaction request include this pseudorandom value as a hidden form value (or other request parameter/header). If both of them match at server side, the server accepts it as legitimate request and if they don't, it would reject the request."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How is a login CSRF prevented? " response
answer="Login CSRF can be mitigated by creating pre-sessions (sessions before a user is authenticated) and including tokens in login form."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a Server-Side Request Forgery (SSRF)? " response
answer="SSRF the attacker can abuse functionality on the server to read or update internal resources."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does a Server-Side Request Forgery (SSRF) work? " response
answer="The attacker can supply or modify a URL which the code running on the server will read or submit data to, and by carefully selecting the URLs, the attacker may be able to read server configuration such as AWS metadata, connect to internal services like http enabled databases or perform post requests towards internal services which are not intended to be exposed."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the impact of a Server-Side Request Forgery attack? " response
answer="By selecting target URLs the attacker may be able to read data from services that are not directly exposed on the internet."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would a data layer secure an app against third-party analytics vendor? " response
answer="Analytics tags can be made secure using the data layer architecture because the only action needed is to send data from the data layer to the third party. Only first party code is executed; first to populate the data layer (generally on page load); then event handler JavaScript sends whatever data is needed from that page to the third party database or tag manager."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the first step to implementing a data layer? " response
answer="Limit the data layer to a DIV object with attribute values that have the marketing or user behavior data that the third-party wants."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a Content Security Policy (CSP)? " response
answer="Content Security Policy (CSP) is specification offering the possibility to instruct the client browser from which location and/or which type of resources are allowed to be loaded."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How does a CSP work? " response
answer="To define a loading behavior, the CSP specification use directive where a directive defines a loading behavior for a target resource type."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer=""
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback"


 
Uniform Resource Locator is a specific type of identifier that not only identifies the resource but tells you how to access it or where it\'s located.

For example, foo://example.com:8042/over/there?name=ferret#nose is a URI containing a scheme name, authority, path, query and fragment. A URI does not need to contain all these components. All it needs is a scheme name and a file path, which can be empty.

Here’s another example of a URI: telnet://192.0.2.16:80/. In this example, “telnet” is the scheme name and the numbers after the double slash make up the authority. The path is empty, which is why no characters come after the slash