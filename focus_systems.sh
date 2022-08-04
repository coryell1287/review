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

       Wrong! There is no tomorrow, 
       so get this right now!

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
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
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
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
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

# read -p "What is a tier in software architecture? " response
# answer="Tier is a logical separation of components in an application or a service."
# additional_feedback=""
# evaluate_answer "$response" "$answer" 


# next_question


# read -p "What are examples of components? " response
# answer="* Database * Backend * Application server * User interface * Messaging * Caching"
# additional_feedback=""
# evaluate_answer "$response" "$answer"



# echo "

#     Reference for layout of components
#     Go the below link and draw the components 

#     https://res.cloudinary.com/practicaldev/image/fetch/s--q34VJPm3--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/tulofphvlpo28ngrfrao.jpeg

# "

# read -p "What is the structure of a single-tier application? " response
# answer="In a single-tier application, the user interface, the backend business logic, and the database reside in the same machine."
# additional_feedback="

#     Typical examples of single-tier applications are desktop applications 
#     like MS Office, PC Games, image editing software like Gimp, Photoshop,
#     etc


# "
# evaluate_answer "$response" "$answer" "$additional_feedback"


# next_question

read -p "What is an example of two-tier application? " response
answer="A two-tier application involves a client and a server."
additional_feedback="

    A two-tier application involves a client and a server.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is an example of two-tier application? 

    A two-tier application involves a client and a server.
    
Enter the next line: " response
answer="The client contains the user interface with the business logic in one machine."
additional_feedback="

    A two-tier application involves a client and a server.
    The client contains the user interface with the business 
    logic in one machine. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is an example of two-tier application? 

    A two-tier application involves a client and a server.
    The client contains the user interface with the business 
    logic in one machine. 

Enter the next line: " response
answer="The backend server includes the database running on a different machine."
additional_feedback="

    A two-tier application involves a client and a server.
    The client contains the user interface with the business 
    logic in one machine. The backend server includes the 
    database running on a different machine.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is an example of two-tier application? 

    A two-tier application involves a client and a server.
    The client contains the user interface with the business 
    logic in one machine. The backend server includes the 
    database running on a different machine. 

Enter the next line: " response
answer="The database server is hosted by the business who has control over it."
additional_feedback="

    A two-tier application involves a client and a server.
    The client contains the user interface with the business 
    logic in one machine. The backend server includes the 
    database running on a different machine. The backend server 
    includes the database running on a different machine. The 
    database server is hosted by the business who has control 
    over it.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


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
answer="With the single responsibility principle, the components are loosely coupled in terms of responsibility and making a change to one doesn't impact the functionality of other components."
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