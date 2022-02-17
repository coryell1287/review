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
    echo "    You scored $score% on React recipes explained."
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

    tic tac toe
    https://jayeshkawli.ghost.io/tic-tac-toe/

        0   1   2          0   1   2           0   1   2
    -------------      -------------       -------------   
   0 | X | X | X |     |   |   |   |       |   |   |   |
    -------------      -------------       -------------
   1 |   |   |   | Or  | X | X | X |   Or  |   |   |   | 
    -------------      -------------       -------------
   2 |   |   |   |     |   |   |   |       | X | X | X |
    -------------      -------------       -------------

        0   1   2         
     -------------      
    0 | X |   |   |     
     -------------   
    1 |   | X |   |   
     -------------   
    2 |   |   | X |   
     ------------- 
     
"

read -p "Describe how to keep up with the winner." response
answer="Because winning combination can emerge in any of these directions, maintain containers in each direction to detect the win after each move."
evaluate_answer "$response" "$answer"

next_question

read -p "If the user makes move at positions (0, 1), (2, 2), (2, 1), (0, 2), (1, 0),
         what is the value of row container? " response
answer="[2, 0, 2]"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer"

next_question

read -p "Why is the previous answer correct? " response
answer="Because row #0 was marked twice, row #1 once and row #2 twice."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "If user is going to win in first row, which moves do they have to do? " response
answer="(0, 0) (0, 1), (0, 2)"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What will be the value contained in the rows container if the user wins the first row? " response
answer="[3, 0, 0]"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How is a winner determined when the user wins a row? " response
answer="Every time user makes a move, check if the value stored in rowsContainer at the index row is equal to the size of the board."
additional_feedback="

     Every time user makes a move, check if the value stored in 
     rowsContainer at the index row is equal to the size of the 
     board. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

    How is a winner determined when the user wins a row? 

    Every time user makes a move, check if the value stored in 
    rowsContainer at the index row is equal to the size of the 
    board.

Enter the next line: " response
answer="If the value is equal to size of the board, then declare the player has won."
additional_feedback="

     Every time user makes a move, check if the value stored in 
     rowsContainer at the index row is equal to the size of the 
     board. 

     If the value is equal to size of the board, then declare 
     the player has won.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How is winner determine who wins along the diagonal row? " response
answer="First check if the incoming row is same as the input column"
additional_feedback="

    First check if the incoming row is same as the input column

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is winner determine who wins along the diagonal row? 

    First check if the incoming row is same as the input column


Enter the next line: " response
answer="and then increment the value at index corresponding to that column (Or row) by 1."
additional_feedback="

  First check if the incoming row is same as the input column and 
  then increment the value at index corresponding to that column 
  (Or row) by 1.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is winner determine who wins along the diagonal row? 

    First check if the incoming row is same as the input column and 
    then increment the value at index corresponding to that column 
    (Or row) by 1.


Enter the next line: " response
answer="After each move, sum up its elements and verify if the sum is equal to the size of the board."
additional_feedback="

  First check if the incoming row is same as the input column and 
  then increment the value at index corresponding to that column 
  (Or row) by 1.

  After each move, sum up its elements and verify if the sum is 
  equal to the size of the board.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How is winner determine who wins along the diagonal row? 

    First check if the incoming row is same as the input column and 
    then increment the value at index corresponding to that column 
    (Or row) by 1.

    After each move, sum up its elements and verify if the sum is 
    equal to the size of the board.


Enter the next line: " response
answer="If that is true, user has won along the primary diagonal."
additional_feedback="

  First check if the incoming row is same as the input column and 
  then increment the value at index corresponding to that column 
  (Or row) by 1.

  After each move, sum up its elements and verify if the sum is 
  equal to the size of the board. If that is true, user has won 
  along the primary diagonal.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the space complexity for the tic tac toe solution? " response
answer="For the board of size n * n, maintain 4 containers--one for each direction."
additional_feedback="

    For the board of size n * n, maintain 4 containers--one for each direction.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the space complexity for the tic tac toe solution?

    For the board of size n * n, maintain 4 containers--one for each direction.

Enter the next line: " response
answer="That's a total space for 4 * n elements. That makes the worst-case space complexity O(n * 4) or simple O(n)."
additional_feedback="

    For the board of size n * n, maintain 4 containers--one for each direction.
    That's a total space for 4 * n elements. That makes the worst-case space 
    complexity O(n * 4) or simple O(n).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the time complexity for the tic toe solution? " response
answer="Every time a player makes a move, the program sets the position in the containers."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity for the tic toe solution? 

    Every time a player makes a move, the program sets the position in 
    the containers. 

Enter the next line: " response
answer="This operation happens in constant time."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time.
    
    The program needs to check in all directions to see whether the player 
    won. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity for the tic toe solution? 

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time. 

    The program needs to check in all directions to see whether the player 
    won.

Enter the next line: " response
answer="The check is a constant operation for a win across rows and columns because the program can check the index and compare it with the current board size."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time. 

    The program needs to check in all directions to see whether the player 
    won. The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity for the tic toe solution? 

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time. 

    The program needs to check in all directions to see whether the player 
    won. The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size. 

Enter the next line: " response
answer="When it comes to detecting a win across diagonal directions, iterate over both containers and sum up all elements."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time. 
    
    The program needs to check in all directions to see 
    whether the player won. 

    The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

    When it comes to detecting a win across diagonal directions, iterate over 
    both containers and sum up all elements.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity for the tic toe solution? 

    Every time a player makes a move, the program sets the position in 
    the containers. This operation happens in constant time. 
    
    The program needs to check in all directions to see 
    whether the player won. 

    The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

    When it comes to detecting a win across diagonal directions, iterate over 
    both containers and sum up all elements. 

Enter the next line: " response
answer="For the board of size n, perform the traversal twice."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. 
    
    The program needs to check in all directions to see 
    whether the player won. 

    The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

    When it comes to detecting a win across diagonal directions, iterate over 
    both containers and sum up all elements. For the board of size n, perform 
    the traversal twice. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity for the tic toe solution? 

    Every time a player makes a move, the program sets the position in 
    the containers. 
    
    The program needs to check in all directions to see 
    whether the player won. 

    The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

    When it comes to detecting a win across diagonal directions, iterate over 
    both containers and sum up all elements. For the board of size n, perform 
    the traversal twice. 

Enter the next line: " response
answer="Thus time complexity for detecting a win in tic-tac-toe is O(2 * n) or simple O(n)."
additional_feedback="

    Every time a player makes a move, the program sets the position in 
    the containers. 
    
    The program needs to check in all directions to see 
    whether the player won. 

    The check is a constant operation for a win across rows and columns 
    because the program can check the index and compare it with the current 
    board size.

    When it comes to detecting a win across diagonal directions, iterate over 
    both containers and sum up all elements. For the board of size n, perform 
    the traversal twice. Thus time complexity for detecting a win in tic-tac-toe 
    is O(2 * n) or simple O(n). 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

  