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

        echo "    You scored $score% on Testing."

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


read -p "What is the purpose of testing? " response
answer="Testing guards against regression and ensures project reliability, allowing developers to make changes and introduce more code without additional bugs."
evaluate_answer "$response" "$answer"


next_question


read -p "What is a common misconception about code coverage? " response
answer="Code coverage informs the team what they are doing wrong but does not inform the team what is working. One-hundred percent test coverage does not highlight which test suites add value to the project."
evaluate_answer "$response" "$answer"

next_question


read -p "What is an example of improving test coverage without improving test value? " response
answer="Developers can improve tests coverage by writing more compact tests, such as refactoring an if condition and using ternary operators. Because the coverage is reporting the line number of the executed code, the coverage increases, but it does not improve the value of the test suites."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the purpose of branch coverage? " response
answer="Branch coverage compensates for code coverage by focusing on how many control structures a test suite traverses."
evaluate_answer "$response" "$answer" 


next_question


read -p "What is a limitation of branch coverage? " response
answer="If the code interacts with external libraries, then branch coverage will not account for the different branches those libraries will take."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is a good test suite? " response
answer="A good test suite integrates into the development cycle. It targets only the most critical part of the code. It provides maximum value with minimum maintenance."
evaluate_answer "$response" "$answer"
        
 
next_question


read -p "What is an essential test? " response
answer="Essential tests are the ones that verify the domain model: business logic."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What are the attributes of a good unit test? " response
answer="* Protection against regressions * Resistance to refactoring *  Fast feedback * Maintainability"
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is code regression? " response
answer="Regressions occur when modifications to the code cause existing features to stop working."
evaluate_answer "$response" "$answer"

 
next_question


read -p "How does a team evaluate how well a test scores on the metric of protecting against regressions?" response
answer="* The amount of code that the test suite executes * The complexity of that code * The code’s domain significance"
evaluate_answer "$response" "$answer"

 
next_question


read -p "Why is the amount of code a test suite executes important? " response
answer="An extensive testing suite, testing critical parts of the codebase, not boilerplate code, has a greater chance of revealing regressions."
evaluate_answer "$response" "$answer"

 
next_question


read -p "Why is the resistance to refactoring important? " response
answer="Developers should refactor code, changing the underlying logic without the test failing."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is the importance of fast feedback? " response
answer="Fast tests mean more of them can run. More tests that check the codebase’s critical parts mean a greater chance of catching regressions."
evaluate_answer "$response" "$answer"

 
next_question


read -p "Why is understanding the different testing styles important? " response
answer="Understing difference of opinion affects what constitutes a unit and the treatment of the system under tests (SUT) and its dependencies."
evaluate_answer "$response" "$answer"

next_question


read -p "What is a good book for understanding the Detroit School of testing? " response
answer="Kent Beck's Test-Driven Development: By Example"
evaluate_answer "$response" "$answer"

next_question


read -p "What is a good book for understanding the London School of testing? " response
answer="Growing Object-Oriented Software, Guided by Tests, by Steve Freeman and Nat Pryce."
evaluate_answer "$response" "$answer"

next_question


read -p "Describe the London School of testing. " response
answer="For the London school, a unit under test is a unit of code, usually a class. The London school states that the units under test should be isolated. All of its dependencies, except immutable dependencies, should be replaced with test doubles in tests. If the class depends on another class, it is replaced with a test double, focusing on just class under test, separating its behavior from any external influence."
evaluate_answer "$response" "$answer"

next_question


read -p "Describe the Detroit School of testing. " response
answer="Classical or Detroit school defines a unit under test as a unit of behavior, not a unit of code. Therefore, developers should replace only shared dependencies with test doubles. Shared dependencies provide means for tests to affect each other’s execution flow. The classical school states that the unit tests need to be isolated, not the units of code."
evaluate_answer "$response" "$answer"

next_question


read -p "What is an issue with London School of testing? " response
answer="The issue with the London School of unit testing is the problem of over-specification—coupling tests to the SUT’s implementation details. Testing implementation details leads to flaky tests."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is an out-of-process dependency? " response
answer="An out-of-process dependency is a dependency hosted by a process other than the program’s execution process (for example, a database, a message bus, or an SMTP service)."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is an integration test? " response
answer="Integration tests verify the interaction between the domain model and the out-of-process dependencies."
evaluate_answer "$response" "$answer"

 
next_question


read -p "When is a good circumstance to use unit test over integration test? " response
answer="Use unit tests to test business logic and edge cases and use integration tests to test ideal paths and scenarios the unit test cannot cover."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is an edge case? " response
answer="Edge case involve business scenario resulting in an error."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is an e2e test? " response
answer="An e2e test is a test against a deployed fully-functioning application with no mocks."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is a shared dependency? " response
answer="A shared dependency is a dependency that provides means for other tests to affect each other’s outcomes. A typical example of shared dependencies is a static mutable field. A change to such a field is visible across all unit tests running within the same process. A database is another typical example of a shared dependency."
evaluate_answer "$response" "$answer"


 
next_question


read -p "What is the benefit of testing in isolation and mocking a dependency? " response
answer="Testing in isolation and mocking the external dependencies means that if something in the system break, the developer will know that the program under test is what broke and will not have to track other possible problems."
evaluate_answer "$response" "$answer"

 
next_question


read -p "When should a developer mock an out-of-process dependency? " response
answer="Developers should mock any out-of-process dependency that is not in their control. Developers do not have control over third-party payment gateway. Instances such as those require developers to mock the functionality."
evaluate_answer "$response" "$answer"

 
next_question


read -p "What is a mock? " response
answer="Mocks or spies focus on outgoing interactions to help emulate and examine interactions between the SUT and its dependencies. Outgoing interactions are calls the SUT makes to dependencies to change their state. Sending an email is an outcoming interaction that results in a side effect in the SMTP server. A test double emulating such an interaction is a mock."
evaluate_answer "$response" "$answer"

next_question

read -p "What does verification mean? " response
answer="Verification is the process of checking the correctness of the product developed based on understanding the customer requirements by testing it against the specifications in the requirements and design documents."
evaluate_answer "$response" "$answer"

next_question

read -p "What does validation mean? " response
answer="Validation attempts to find errors by executing the program in an authentic environment. It checks the product from the user's perspective to ensure that it is as per user expectations."
evaluate_answer "$response" "$answer"

next_question

read -p "What a good quote regarding processes and quality? " response
answer="A product will have good quality if there are good processes for enforcing quality."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the definition of Plan in the plan-do-check-act cycle? " response
answer="Plan: Establish the objectives and define processes necessary to deliver results in accordance with the expected target or goals."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the definition of Do in the plan-do-check-act cycle? " response
answer="Do: Implement the plan, execute the process and make the product deliver the service."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the definition of Check in the plan-do-check-act cycle? " response
answer="Check: Analyze the results obtained and compare them against the expected results."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the definition of Act in the plan-do-check-act cycle? " response
answer="Act: If the difference between the actual and expected results are significant, corretive actions need to be taken to modify the process."
evaluate_answer "$response" "$answer"






