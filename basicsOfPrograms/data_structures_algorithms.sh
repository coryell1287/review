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
    echo "    You scored $score% on Data Structures and Algorithms."
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


read -p "

    Which function runs the fastest.

    def print_numbers_version_one(): 
       number = 2 
       while number <= 100:  # If number is even, print it: 
         if number % 2 == 0:
           print (number) 

         number += 1 


    def print_numbers_version_two():
       number = 2

       while number <= 100
         print(number)

         number += 2

"


read -p "Why is measuring an operation in terms of time undependable? " response
answer="Measuring the speed of an operation in terms of time is undependable because the time will always change depending on the hardware it runs on."
additional_feedback=""
evaluate_answer "$response" "$answer"

answer="This is because Version 1 ends up looping 100 times" response
answer="while Version 2 only loops 50 times." response
answer="The first version then, takes twice as many steps as the second version." response
answer="This is because Version 1 ends up looping 100 times" response
answer="while Version 2 only loops 50 times." response
answer="The first version then, takes twice as many steps as the second version." response
answer=""
additional_feedback
evaluate_answer "$response" "$answer"



read -p "What is reading from an array? " response
answer="Reading means providing the computer an index and the computer returning a value."
evaluate_answer "$response" "$answer"

next_question


read -p "What is searching an array? " response
answer="Searching is providing the computer a value and the computer returning the index of that value's location."
evaluate_answer "$response" "$answer"

next_question

read -p "Does insertion take more time to perform on an array? " response
answer="Depending on where the insertion is, inserting an item into an array will take time. Inserting at the end of the array is a quick step because the computer only has to allocate an additional cell at the end. Inserting an item into the array in another location means moving the existing items in the array to make room for the new item."
evaluate_answer "$response" "$answer"

next_question

read -p "What are the implications of inserting an item at the beginning of an array? " response
answer="When a program inserts an item at the beginning of the array the insertion takes N + 1 steps. N is a variable that represents the number of items in the array. All N items need to shift to make room for the new item at the beginning of the array."
evaluate_answer "$response" "$answer"

next_question

read -p "What is an algorithm? " response
answer="An algorithm is a set of instructions for completing a specific task."
evaluate_answer "$response" "$answer"

next_question

read -p "Why does insertion take longer in an order array than it does in a classic array? " response
answer="When inserting into an ordered array, the program has to search the entire to find the exact order the item should be placed before completing the insertion."
evaluate_answer "$response" "$answer"

next_question

read -p "Why does insertion in a Set take longer than a classic array? " response
answer="Insertion into Set includes more steps because the program has to search through the array to ensure the item doesn't exist before insertion."
evaluate_answer "$response" "$answer"

next_question

read -p "What is an advantage of searching an ordered array? " response
answer="Because a program performing a search on an ordered array can determine when to end the search by checking to see whether the search value is greater than or less than an item at each index, alternatively the ordered array can use a binary search, which is a much faster algorithm than a linear search."
evaluate_answer "$response" "$answer"

next_question

read -p "What pattern emerges when an array length is doubled? " response
answer="Each time the data in the array is doubled, the binary search algorithm adds just one more step."
evaluate_answer "$response" "$answer"

next_question

read -p "How many steps would it take to search an array with a size of three? " response
answer="Binary search would take a maximum of two steps."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the time complexity for a binary search? " response
answer="O(log N)"
evaluate_answer "$response" "$answer"

next_question

read -p "What is log2 8? " response
answer="3"
evaluate_answer "$response" "$answer"

next_question

read -p "Why is the above answer correct? " response
answer="Because you have to multiply 2 by itself 3 times to get 8."
evaluate_answer "$response" "$answer"

next_question

read -p "What is one way of solving the previous question? " response
answer="Dividing 8 by 2 until we ended up with 1."
evaluate_answer "$response" "$answer"

next_question

read -p "How do logarithms describe a binary search? " response
answer="As a program searches for a particular item, the array cells are divided until narrowed down to the correct number."
evaluate_answer "$response" "$answer"   



next_question

read -p "

   How many steps would it take to perform a linear search for 
   the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]? 

Enter the next line: " response
answer=""
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take: 

   Reading? 

Enter the line next: " response
answer="Reading from an array always takes just one step."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take: 

   Searching for a value not contained within the array? 

Enter the line next: " response
answer="Searching for a nonexistent element within an array of size 100 will take 100 steps"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take: 

   Searching for a value not contained within the array? 

   Searching for a nonexistent element within an array of size 100 will take 
   100 steps, 

Enter the line next: " response
answer="as the computer needs to inspect each element of the array before determining the element cannot be found."
additional_feedback="

   Searching for a nonexistent element within an array of size 100 will take 
   100 steps, as the computer needs to inspect each element of the array before 
   determining the element cannot be found.

"
evaluate_answer_written_with_code "$response" "$answer"  "$additional_feedback" 

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take:

   Insertion at the beginning of the array?  

Enter your answer: " response
answer="The insertion will take 101 steps: 100 shifts of each element to the right"
additional_feedback="

   The insertion will take 101 steps: 100 shifts of each element 
   to the right,

"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take:

   Insertion at the beginning of the array?  

Enter your answer: " response
answer="and one step to insert the new element at the front of the array."
additional_feedback="

   The insertion will take 101 steps: 100 shifts of each element 
   to the right, and one step to insert the new element at the front 
   of the array.

"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take:

   Insertion at the end of the array? 

Enter your answer: " response
answer="Insertion at the end of an array always takes one step."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take:

   Deletion at the beginning of the array?

Enter your answer: " response
answer="The deletion will take 100 steps: first the computer deletes the first element"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take:

   Deletion at the beginning of the array?

   The deletion will take 100 steps: first the computer deletes the first 
   element and then shifts the remaining 99 elements to the left, one at a 
   time.

Enter your answer: " response
answer="and then shifts the remaining 99 elements to the left, one at a time."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_question

read -p "

   For an array containing 100 elements, provide the number of steps the 
   following operations would take: 

   Deletion at the end of the array?

Enter your answer: " response
answer="Deletion at the end of an array always takes one step."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Reading?

Enter your answer: " response
answer="Reading from a Set will take just one step."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Searching for a value not contained within the Set?

Enter your answer: " response
answer="Searching the Set will take 100 steps because each element must be inspected."
evaluate_answer "$response" "$answer"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Insertion of a new value at the beginning of the set?

Enter your answer: " response
answer="To insert into the set, the program performs a full search to make sure the value doesn't already exist within the set."
additional_feedback="

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Insertion of a new value at the beginning of the set?


   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set.

Enter your answer: " response
answer="This search will take 100 steps."
additional_feedback="

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Insertion of a new value at the beginning of the set?

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

Enter your answer: " response
answer="Then, shift all 100 elements to the right to make room for the new value."
additional_feedback="

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

   * Then, shift all 100 elements to the right to make room for the 
     new value.  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Insertion of a new value at the beginning of the set?

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

   * Then, shift all 100 elements to the right to make room for the 
     new value.

Enter your answer: " response
answer="Finally, drop the new value at the beginning of the set."
additional_feedback="

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

   * Then, shift all 100 elements to the right to make room for the 
     new value.  

   * Finally, drop the new value at the beginning of the set. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take: 

   Insertion of a new value at the beginning of the set?

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

   * Then, shift all 100 elements to the right to make room for the 
     new value.  

   * Finally, drop the new value at the beginning of the set.

Enter your answer: " response
answer="This is a total of 201 steps."
additional_feedback="

   * To insert into the set, the program performs a full search to 
     make sure the value doesn't already exist within the set. This 
     search will take 100 steps.

   * Then, shift all 100 elements to the right to make room for the 
     new value.  

   * Finally, drop the new value at the beginning of the set.

   This is a total of 201 steps. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_question

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take:

   Insertion of a new value at the end of the set?

Enter the next line: " response
answer="This insertion takes 101 steps."
additional_feedback="

   This insertion takes 101 steps.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take:

   Insertion of a new value at the end of the set?

   This insertion takes 101 steps.

Enter the next line: " response
answer="The program performs a full search before inserting, which takes 100 steps."
additional_feedback="

   This insertion takes 101 steps. The program performs a full search before 
   inserting, which takes 100 steps. 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_line

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take:

   Insertion of a new value at the end of the set?

   This insertion takes 101 steps.

Enter the next line: " response
answer="Then insert the new value at the end of the set."
additional_feedback="

   This insertion takes 101 steps. The program performs a full search before 
   inserting, which takes 100 steps. 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"   

next_question

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take:

   Deletion at the beginning of the set? 

Enter your answer: " response
answer="The deletion will take 100 steps, just like a classic array."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   For a Set containing 100 elements, provide the number of 
   steps the following operations would take:

   Deletion at the end of the set? 

Enter your answer: " response
answer="The deletion will take one step, just like a classic array."
evaluate_answer "$response" "$answer"   

next_question

read -p "

   To count how many times the value apple is found inside an array. 
   How many steps would it take to find all the apples? 

   Give your answer in terms of N.


Enter your answer: " response
answer="If the array contains N elements, searching for all instances of the string apple in an array will take N steps."
additional_feedback="If the array contains N elements, searching for all instances of the string apple in an array will take N steps."
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   To count how many times the value apple is found inside an array. 
   How many steps would it take to find all the apples? 

   Give your answer in terms of N.

   If the array contains N elements, searching for all instances of 
   the string apple in an array will take N steps.


Enter your answer: " response
answer="When searching for just one instance, we can cut our search short as soon as we find it."
additional_feedback="

   If the array contains N elements, searching for all instances of 
   the string apple in an array will take N steps.

   When searching for just one instance, we can cut our search short 
   as soon as we find it. 
   
"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   To count how many times the value apple is found inside an array. 
   How many steps would it take to find all the apples? 

   Give your answer in terms of N.

   If the array contains N elements, searching for all instances of 
   the string apple in an array will take N steps.


Enter your answer: " response
answer="But if we need to find all instances, we have no choice but inspect each element of the entire array."
additional_feedback="

   If the array contains N elements, searching for all instances of 
   the string apple in an array will take N steps.

   When searching for just one instance, we can cut our search short 
   as soon as we find it. 

   But if we need to find all instances, we have no choice but inspect each element 
   of the entire array.

"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "

   How many steps would it take to perform a linear search 
   for the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]? 

Enter your answer: " response
answer="Linear search on this array would take four steps."
additional_feedback="

   Linear search on this array would take four steps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "

   How many steps would it take to perform a linear search 
   for the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]? 

   Linear search on this array would take four steps. 

Enter your answer: " response
answer="Start at the beginning of the array and check each element from left to right."
additional_feedback="

   Linear search on this array would take four steps. Start at the 
   beginning of the array and check each element from left to right.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "

   How many steps would it take to perform a linear search 
   for the number 8 in the ordered array, [2, 4, 6, 8, 10, 12, 13]? 

   Linear search on this array would take four steps. 

Enter your answer: " response
answer="Because the 8 is the fourth number, we'll find it in four steps."
additional_feedback="

   Linear search on this array would take four steps. Start at the 
   beginning of the array and check each element from left to right.
   Because the 8 is the fourth number, we'll find it in four steps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "How many steps would binary search take for the previous example? 

Enter the next line: " response
answer="Binary search would take just one step in this case."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "How many steps would binary search take for the previous example? 

   Binary search would take just one step in this case.

Enter the next line: " response
answer="Start the binary search at the middlemost element"
additional_feedback="

   Binary search would take just one step in this case. Start the 
   binary search at the middlemost element,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "How many steps would binary search take for the previous example? 

   Binary search would take just one step in this case. Start the 
   binary search at the middlemost element,

Enter the next line: " response
answer="and the 8 just happens to be the middlemost element."
additional_feedback="

   Binary search would take just one step in this case. Start the 
   binary search at the middlemost element, and the 8 just happens 
   to be the middlemost element.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "
   What is the maximum number of steps it would take to perform 
   a binary search on an array of size 100,000? 

Enter the next line: " response
additional_feedback="

   To solve this, count how many times 100,000 is divided until 
   it gets down to 1.

"
answer="To solve this, count how many times 100,000 is divided until it gets down to 1."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   What is the maximum number of steps it would take to perform 
   a binary search on an array of size 100,000? 

   To solve this, count how many times 100,000 is divided until 
   it gets down to 1.

Enter the next line: " response
additional_feedback="

   To solve this, count how many times 100,000 is divided until 
   it gets down to 1. It takes us 16 times until to get down to 
   1.53.

"
answer="It takes us 16 times until to get down to 1.53."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   What is the maximum number of steps it would take to perform 
   a binary search on an array of size 100,000? 

   To solve this, count how many times 100,000 is divided until 
   it gets down to 1. It takes us 16 times until to get down to 
   1.53.

Enter the next line: " response
additional_feedback="

   To solve this, count how many times 100,000 is divided until 
   it gets down to 1. It takes us 16 times until to get down to 
   1.53. This means a worst-case scenario would take about 16 times.

"
answer="This means a worst-case scenario would take about 16 times."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "Describe the number of steps for inserting into an ordered array. " response
answer="The number of steps for insertion remains similar no matter where in the ordered array our new value ends up."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up.

Enter the next line: " response
answer="If our value ends up toward the beginning of the ordered array"
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array,

Enter the next line: " response
answer="we have fewer comparisons and more shifts."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array,

Enter the next line: " response
answer="If our value ends up toward the end, we get more comparisons but fewer shifts."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts.



"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array,

Enter the next line: " response
answer="The fewest steps occur when the new value winds up at the very end, since no shifts are necessary."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary. 


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array,

Enter the next line: " response
answer="The fewest steps occur when the new value winds up at the very end, since no shifts are necessary."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary.

Enter the next line: " response
answer="In this case, we take N steps to compare the new value with all N existing values"
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary.

   In this case, we take N steps to compare the new value with all N 
   existing values 


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "
   Describe the number of steps for inserting into an ordered array. 

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary.

   In this case, we take N steps to compare the new value with all N 
   existing values

Enter the next line: " response
answer="plus one step for the insertion itself, yielding a total of N + 1 steps."
additional_feedback="

   The number of steps for insertion remains similar no matter 
   where in the ordered array our new value ends up. If our value 
   ends up toward the beginning of the ordered array, we have fewer 
   comparisons and more shifts.

   If our value ends up toward the end, we get more comparisons but 
   fewer shifts. The fewest steps occur when the new value winds up 
   at the very end, since no shifts are necessary.

   In this case, we take N steps to compare the new value with all N 
   existing values, plus one step for the insertion itself, yielding 
   a total of N + 1 steps. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the steps to solving a bubble sort? " response
answer="Point to two consecutive values in the array."
additional_feedback="

    1. Point to two consecutive values in the array.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array.

Enter the next line: " response
answer="Initially, start by pointing to the array's first two values."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.)

Enter the next line: " response
answer="If the two items are out of order (in other words, the left value is greater than the right value)"
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value),

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.)
    
    2. If the two items are out of order (in other words, the left value is greater 
       than the right value),

Enter the next line: " response
answer="swap them (if they already happen to be in the correct order, do nothing for this step)."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).

Enter the next line: " response
answer="Move the pointers one cell to the right."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

Enter the next line: " response
answer="Repeat Steps 1 through 3 until we reach the end of the array, or if we reach the values that have already been sorted."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

Enter the next line: " response
answer="We then move the two pointers back to the first two values of the array"
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array,

Enter the next line: " response
answer="and execute another pass-through of the array by running Steps 1 through 4 again."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array, 
       and execute another pass-through of the array by running Steps 1 through 
       4 again.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array, 
       and execute another pass-through of the array by running Steps 1 through 
       4 again.

Enter the next line: " response
answer="We keep on executing these pass-throughs until we have a pass-through in which we did not perform any swaps."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array, 
       and execute another pass-through of the array by running Steps 1 through 
       4 again. 
       
       We keep on executing these pass-throughs until we have a pass-through in 
       which we did not perform any swaps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "What are the steps to solving a bubble sort? 

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array, 
       and execute another pass-through of the array by running Steps 1 through 
       4 again.

Enter the next line: " response
answer="When this happens, it means our array is fully sorted and our work is done."
additional_feedback="

    1. Point to two consecutive values in the array. (Initially, start by pointing 
       to the array's first two values.) Compare the first item with the second one.

    2. If the two items are out of order (in other words, the left value is greater 
       than the right value), swap them (if they already happen to be in the correct 
       order, do nothing for this step).
    
    3. Move the pointers one cell to the right.

    4. Repeat Steps 1 through 3 until we reach the end of the array, or if we reach 
       the values that have already been sorted.

    5. We then move the two pointers back to the first two values of the array, 
       and execute another pass-through of the array by running Steps 1 through 
       4 again. 
       
       We keep on executing these pass-throughs until we have a pass-through in 
       which we did not perform any swaps.

       When this happens, it means our array is fully sorted and our work is done.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  
  

next_question

read -p "What are the two operations that take place during a bubble sort? " response
answer="comparisons and swaps"
evaluate_answer "$response" "$answer"   

next_question

read -p "How do comparisons and swaps work during bubble sort? " response
answer="Comparisons: two numbers are compared with one another to determine which is greater."
additional_feedback="

   Comparisons: two numbers are compared with one another to determine 
   which is greater. 

"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_line

read -p "How do comparisons and swaps work during bubble sort? 

   Comparisons: two numbers are compared with one another to determine 
   which is greater.

Enter the next line: " response
answer="Swaps: two numbers are swapped with one another in order to sort them."
additional_feedback="

   Comparisons: two numbers are compared with one another to determine 
   which is greater. 

   Swaps: two numbers are swapped with one another in order to sort them.

"
evaluate_answer "$response" "$answer" "$additional_feedback"  

next_question

read -p "For 5 elements in an array, how many steps would take place in a bubble sort " response
answer="20"
evaluate_answer "$response" "$answer"   

next_question

read -p "How would you express a bubble sort in big o notation? " response
answer="O(N^2)"
evaluate_answer "$response" "$answer"   

next_question

read -p "What O(N^2) called? " response
answer="quadratic time"
evaluate_answer "$response" "$answer"   

next_question

read -p "

   Describe why this code is quadratic.


   function hasDuplicateValue(array) {
      for (let i = 0; i < array.length; i++) {
         for (let j = 0; j < array.length; j++) {
            if (i !== j && array[i] === array[j]) {
              return true;
            }
         }
      }
     return false;
   }  

Enter the next line: " response
answer="For N values in the array, the function would perform N^2 comparisons."
additional_feedback="

   For N values in the array, the function would perform N^2 comparisons.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "

   Describe why this code is quadratic.


   function hasDuplicateValue(array) {
      for (let i = 0; i < array.length; i++) {
         for (let j = 0; j < array.length; j++) {
            if (i !== j && array[i] === array[j]) {
              return true;
            }
         }
      }
     return false;
   } 

   For N values in the array, the function would perform N^2 comparisons.


Enter the next line: " response
answer="The outer loop must iterate N times to get through the entire array"
additional_feedback="

   For N values in the array, the function would perform N^2 comparisons.
   The outer loop must iterate N times to get through the entire array,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "

   Describe why this code is quadratic.


   function hasDuplicateValue(array) {
      for (let i = 0; i < array.length; i++) {
         for (let j = 0; j < array.length; j++) {
            if (i !== j && array[i] === array[j]) {
              return true;
            }
         }
      }
     return false;
   } 


   For N values in the array, the function would perform N^2 comparisons.
   The outer loop must iterate N times to get through the entire array,

Enter the next line: " response
answer="and for each iteration, the inner loop must iterate another N times."
additional_feedback="

   For N values in the array, the function would perform N^2 comparisons.
   The outer loop must iterate N times to get through the entire array,
   and for each iteration, the inner loop must iterate another N times.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_line

read -p "

   Describe why this code is quadratic.


   function hasDuplicateValue(array) {
      for (let i = 0; i < array.length; i++) {
         for (let j = 0; j < array.length; j++) {
            if (i !== j && array[i] === array[j]) {
              return true;
            }
         }
      }
     return false;
   }

   For N values in the array, the function would perform N^2 comparisons.
   The outer loop must iterate N times to get through the entire array,
   and for each iteration, the inner loop must iterate another N times.

Enter the next line: " response
answer="That's N steps * N steps, which is N^2 steps, or an O(N^2) algorithm."
additional_feedback="

   For N values in the array, the function would perform N^2 comparisons.
   The outer loop must iterate N times to get through the entire array,
   and for each iteration, the inner loop must iterate another N times.
   That's N steps * N steps, which is N^2 steps, or an O(N^2) algorithm.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"  

next_question

read -p "Why is this algorithm more efficient?

   function hasDuplicateValue(array) {
      let steps = 0;
      let existingNumbers = [];
      for (let i = 0; i < array.length; i++) {
         steps++;
         if (existingNumbers[array[i]] === 1) {
            return true;
         } else {
            existingNumbers[array[i]] = 1;
         }
      }
      console.log(steps);
      return false;
   }

Enter the next line: " response
answer="The algorithm is more efficient because there's only one loop, and it simply iterates for as many numbers as there are in the array."
evaluate_answer "$response" "$answer"

next_question

read -p " " response
answer=""
evaluate_answer "$response" "$answer"   




 

Replace the question marks in the following table to describe how many steps occur for a given number of data elements across various types of 

Big O: 
N Elements | O(N) | O(log N) |  O(N^2) 
100        |  ?   |    ?     |   ?
100        |  ?   |    ?     |   ? 
2000       |  ?   |    ?     |   ?


If we have an O(N2) algorithm that processes an array and find 
that it takes 256 steps, what is the size of the array?


Use Big O Notation to describe the time complexity of the following function. 
It finds the greatest product of any pair of two numbers within a given array:


read -p "

def greatestProduct(array):
    greatestProductSoFar = array[0] * array[1]
    for i, iVal in enumerate(array):
        for j, jVal in enumerate(array):
            if i != j and iVal * jVal > greatestProductSoFar:
                greatestProductSoFar = iVal * jVal
            return greatestProductSoFar


"


read -p "

   The following function finds the greatest single number within an array, 
   but has an efficiency of O(N2). Rewrite the function so that it becomes 
   a speedy O(N):

   def greatestNumber(array):
      for i in array:
         isIValTheGreatest = True

         for j in array:
               if j > i:
                  isIValTheGreatest = False

               if isIValTheGreatest:
                  return i

"


next_question

read -p "" response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

echo "

   We check each cell of the array from left to right to determine 
which value is least. As we move from cell to cell, we keep track 
of the lowest value we've encountered so far. (We'll do this by 
storing its index in a variable.) If we encounter a cell that 
contains a value that is even lower than the one in our variable, 
we replace it so that the variable now points to the new index.


Once we've determined which index contains the lowest value, we 
swap its value with the value we began the pass-through with. 
This would be index 0 in the first pass-through, index 1 in the 
second passthrough, and so on.

Each pass-through consists of Steps 1 and 2. We repeat the pass-throughs 
until we reach a pass-through that would start at the end of the array. 
By this point, the array will have been fully sorted.

"


read -p "Explain how selection sort works. " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


answer="Selection Sort contains two types of steps: comparisons and swaps."
answer="That is, we compare each value with the lowest number we've encountered"
answer="in each pass-through, and we swap the lowest number into its correct position."


read -p "How does selection sort compare to bubble sort? " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


As for swaps, though, we only need to make a maximum of one 
swap per pass-through. This is because in each pass-through, 
we make either one or zero swaps, depending on whether the lowest 
number of that pass-through is already in the correct position. 
Contrast this with Bubble Sort, where in a worst-case scenario—an 
array in descending order—we have to make a swap for each and every 
comparison.

read -p "
   
   Because Selection Sort takes roughly half of N2 steps, it would 
   seem reasonable that we'd describe the efficiency of Selection 
   Sort as being O(N2 / 2). That is, for N data elements, there are 
   N2 / 2 steps.

   Selection Sort is described in Big O as O(N2), just like Bubble Sort. Why?




" response

answer="Big O Notation ignores constants."
answer="This is simply a mathematical way of saying that Big O Notation never includes regular numbers"
answer="that aren't an exponent. We simply drop these regular numbers from the expression."
answer="In our case, then, even though the algorithm takes N2 / 2 steps," 
answer="we drop the “/ 2” because it’s a regular number, and express the efficiency as O(N2)."


read -p "Use Big O Notation to describe the time complexity of an algorithm that takes 4N + 16 steps."


read -p "Use Big O Notation to describe the time complexity of an algorithm that takes 2N2."


read -p "Use Big O Notation to describe the time complexity of the following function, which returns the sum of all numbers of an array after the numbers have been doubled:"



read -p "

   Use Big O Notation to describe the time complexity of the following 
   function, which returns the sum of all numbers of an array after the 
   numbers have been doubled:

   def double_then_sum(array):
     doubled_array = []
     array.each do |number| 
       doubled_array << number *= 2
     end

     sum = 0

     doubled_array.each do |number|
         sum += number
      end

      return sum
      end
"

read -p "
   Use Big O Notation to describe the time complexity of the following function, 
   which accepts an array of strings and prints each string in multiple cases:

   def multiple_cases(array):
      array.each do |number|
      puts. string.upcase
      puts. string.downcase
      puts. string.capitalize
     end
   end
"


read -p "

   The next function iterates over an array of numbers, and for 
   each number whose index is even, it prints the sum of that number 
   plus every number in the array. What is this function’s efficiency in terms of Big O Notation?

   def every_other(array):
      array.each_with_index: |number, index|
        if index.even?
         array.each of |other_number|
           puts number + other_number
         end
       end
      end
    end
"


read -p "What are the steps to insertion sort? " response
answer="In the first pass-through, we temporarily remove the value at index 1 (the second cell) and store it in a temporary variable. This will leave a gap at that index, since it contains no value."
answer="We then begin a shifting phase, where we take each value to the left of the gap and compare it to the value in the temporary variable."
answer="As we shift values to the right, inherently the gap moves leftward. As soon as we encounter a value that is lower than the temporarily removed value, or we reach the left end of the array, this shifting phase is over."
answer="We then insert the temporarily removed value into the current gap."
answer="Steps 1 through 3 represent a single pass-through. We repeat these pass-throughs until the pass-through begins at the final index of the array. By then, the array will have been fully sorted."


read -p "What are the operatiosn involved in an insertion sort? " response
answer="removals, comparisons, shifts, insertions"


read -p "How do comparisons work in insertion sort? " response
answer="A comparison takes place each time we compare a value to the left of the gap with the temp_value."
answer="In a worst-case scenario, where the array is sorted in reverse order, we have to compare every number to the left of temp_value"

answer="with temp_value in each pass-through. This is because each value to the left of temp_value will always be greater than temp_value,"
answer="so the pass-through will only end when the gap reaches the left end of the array."


# Paragraph
answer="During the first pass-through, in which temp_value is the value at index 1,"

answer="a maximum of one comparison is made, since there is only one value to the left of the temp_value. On the second pass-through,"
answer="a maximum of two comparisons are made, and so on. On the final pass-through,"
answer="we need to compare the temp_value with every single value in the array besides temp_value itself." 
answer="In other words, if there are N elements in the array, a maximum of N - 1 comparisons are made in the final pass-through."


read -p "How do shift work in an insertion sort? " response
answer="Shifts occur each time we move a value one cell to the right."
answer="When an array is sorted in reverse order, there will be as many shifts as there are comparisons," 
answer="since every comparison will force us to shift a value to the right."




read -p "How do removals work with insertion sort? " response
answer="Removing and inserting the temp_value from the array happens once per pass-through."
answer="Since there are always N - 1 pass-throughs, we can conclude that there are N - 1 removals and N - 1 insertions."


read -p "What is the big O notation for N4 + N3 + N2 + N"
answer="O(N4)"

read -p "Why is the previous answer correct? " response
answer="Big O Notation only takes into account the highest order of N when we have multiple orders added together."


next_question
 
read -p "In a best- and worst-case scenario, selection take the same amount of steps. Why is that? " response
answer="Selection Sort doesn't have any mechanism for ending a pass-through early at any point. Each pass-through compares every value to the right of the chosen index."
additional_feedback=""
evaluate_answer "$response" "$answer" 

next_question

read -p "What is an intersection between two arrays? " response
answer="The intersection is a list of all the values that occur in both of the arrays."
evaluate_answer

next_question


read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }


Enter the next line: " response
answer="If the two arrays are of equal size, and say that N is the size of either array, the number of comparisons performed are N2."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2.


Enter the next line: " response
answer="This is because we compare each element of the first array to each element of the second array."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array.


Enter the next line: " response
answer="Thus, if we have two arrays that each contain five elements, we'd end up making 25 comparisons."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons.


Enter the next line: " response
answer="So, this intersection algorithm has an efficiency of O(N2). "
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2). 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).


Enter the next line: " response
answer="The insertions, at most, would take N steps (if the two arrays happened to be identical)."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).

   The insertions, at most, would take N steps (if the two arrays happened 
   to be identical). 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).

   The insertions, at most, would take N steps (if the two arrays happened 
   to be identical).


Enter the next line: " response
answer="This is a lower order compared to N2, so we'd still consider the algorithm to be O(N2)."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).

   The insertions, at most, would take N steps (if the two arrays happened 
   to be identical). This is a lower order compared to N2, so we'd still 
   consider the algorithm to be O(N2).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Analyze the following code describe it's Big O Notation. 

   function intersection(firstArray, secondArray) {
      let result = [];

      for (let i = 0; i < firstArray.length; i++) {
         for (let i = 0; i < secondArray.length; i++) {
            if (firstArray[i] === secondArray[i]) {
               result.push(firstArray[i]);
            }
         }
      }
      return result
   }

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).

   The insertions, at most, would take N steps (if the two arrays happened 
   to be identical). This is a lower order compared to N2, so we'd still 
   consider the algorithm to be O(N2).


Enter the next line: " response
answer="If the arrays are different sizes—say N and M—we'd say that the efficiency of this function is O(N * M)."
additional_feedback="

   If the two arrays are of equal size, and say that N is the size of 
   either array, the number of comparisons performed are N2. This is 
   because we compare each element of the first array to each element 
   of the second array. Thus, if we have two arrays that each contain 
   five elements, we'd end up making 25 comparisons. So, this intersection 
   algorithm has an efficiency of O(N2).

   The insertions, at most, would take N steps (if the two arrays happened 
   to be identical). This is a lower order compared to N2, so we'd still 
   consider the algorithm to be O(N2). If the arrays are different sizes—say
   N and M—we'd say that the efficiency of this function is O(N * M).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Use Big O Notation to describe the efficiency of an algorithm that takes 3N2 + 2N + 1 steps." response
answer="" 
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "Use Big O Notation to describe the efficiency of an algorithm that takes N + log N steps." response
answer=""
evaluate_answer "$response" "$answer"

next_question

read -p "The following function checks whether an array of numbers contains a pair of two numbers that add up to 10.

   function twoSum(array) {
      for (let i = 0; array.length; i++) {
         for (let j = 0; array.length; j++) {
            if (i !== j && array[i] + array[j] === 10) {
               return true;
            }
         }
      }
      return false;
   }

What are the best-, average-, and worst-case scenarios? Then, express the worst-case scenario in terms of Big O Notation. " response
answer=""
evaluate_answer "$response" "$answer"

next_question

read -p "The following function returns whether or not a capital “X” is present within a string.

   functin contains(string) {
      let foundX = false;

      for (let i = 0; i < string.length; i++){
         if (string[i] === 'x') {
            foundX = true;
         }
      }
      return foundX;
   }
   
   What is this function's time complexity in terms of Big O Notation?
    
   Then, modify the code to improve the algorithm's efficiency for best- 
   and average-case scenarios. " response
answer=""
evaluate_answer "$response" "$answer"

next_question

read -p "" response
answer=""
evaluate_answer "$response" "$answer"

next_question
 
 

read -p "

   def average_of_even_numbers(array)

      sum = 0.0
      count_of_even_numbers = 0

      array.each do |number|
       if number.even?
         sum += number
         count_of_even_numbers += 1
        end
      end

      return sum / count_of_even_numbers
    end


    Remember that Big O is all about answering the key question: if there are N data elements, how many steps will the algorithm take? Therefore, the first thing we want to do is determine what the “N” data elements are. 


In this case, the algorithm is processing the array of numbers passed 
into this method. These, then, would be the “N” data elements, with N 
being the size of the array.

Next, we have to determine how many steps the algorithm takes to 
process these N values. 

We can see that the guts of the algorithm is the loop that iterates 
over each number inside the array, so we’ll want to analyze that first. 
Since the loop iterates over each of the N elements, we know that the 
algorithm takes at least N steps. 

Looking inside the loop, though, we can see that a varying number of 
steps occur within each round of the loop. For each and every number, 
we check whether the number is even. Then, if the number is even, we 
perform two more steps: we modify the sum variable, and we modify the 
count_of_even_numbers variable. So, we execute three more steps for 
even numbers than we do for odd numbers. 

As you’ve learned, Big O focuses primarily on worst-case scenarios. 
In our case, the worst case is when all the numbers are even, in which 
case we perform three steps during each round of the loop. Because of 
this, we can say that for N data elements, our algorithm takes 3N steps. 
That is, for each of the N numbers, our algorithm executes three steps.
 
Now, our method performs a few other steps outside of the loop as well. 
Before the loop, we initialize the two variables and set them to 0. 
Technically, these are two steps. After the loop, we perform another 
step: the division of sum / count_of_even_numbers. Technically, then, our 
algorithm takes three extra steps in addition to the 3N steps, so the total 
number of steps is 3N + 3. 

However, you also learned that Big O notation ignores constant numbers, 
so instead of calling our algorithm O(3N + 3), we simply call it O(N).


" response
   

 
read -p "

   Use Big O Notation to describe the time complexity of the following 
   function. The function returns true if the array is a “100-Sum Array,” 
   and false if it is not. 

   A “100-Sum Array” meets the following criteria: 
      Its first and last numbers add up to 100. 
      Its second and second-to-last numbers add up to 100. 
      Its third and third-to-last numbers add up to 100, and so on.


   def one_hundred_sum?(array)
      left_index = 0
      right_index = array.length - 1


      while left_index < array.length / 2
         if array[left_index] + array[right_index] != 100
         return false
         end


         left_index += 1
         right_index += 1
      end 
      return true
   end

Enter the next line: " response
answer="Here, N is the size of the array. The loop runs for N / 2 times, as it processes two values each round of the loop."
additional_feedback="

   Here, N is the size of the array. The loop runs for N / 2 times, 
   as it processes two values each round of the loop.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

 
read -p "

   Use Big O Notation to describe the time complexity of the following 
   function. The function returns true if the array is a “100-Sum Array,” 
   and false if it is not. 

   A “100-Sum Array” meets the following criteria: 
      Its first and last numbers add up to 100. 
      Its second and second-to-last numbers add up to 100. 
      Its third and third-to-last numbers add up to 100, and so on.


   def one_hundred_sum?(array)
      left_index = 0
      right_index = array.length - 1


      while left_index < array.length / 2
         if array[left_index] + array[right_index] != 100
         return false
         end


         left_index += 1
         right_index += 1
      end 
      return true
   end

   ####################################
   ##            Answer:             ##
   ####################################

   Here, N is the size of the array. The loop runs for N / 2 times, 
   as it processes two values each round of the loop.

Enter the next line: " response
answer="However, this is expressed as O(N) because we drop the constant."
additional_feedback="

   Here, N is the size of the array. The loop runs for N / 2 times, 
   as it processes two values each round of the loop. However, this 
   is expressed as O(N) because we drop the constant.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use Big O Notation to describe the time complexity of the following function. 
   It merges two sorted arrays together to create a new sorted array containing
   all the values from both arrays:


 def merge(array_1, array_2)
   new_array = []
   array_1_pointer = 0 
   array_2_pointer = 0

   while array_1_pointer < array_1.length || 
      array_2_pointer < array_2.length

   # If we already reached the end of the first array,
   # add item from second array:
   if !array_1[array_1_pointer] 
    new_array << array_2[array_2_pointer] 
    array_2_pointer += 1

   # If we already reached the end of the second array,
   # add item from first array:

   elsif !array_2[array_2_pointer] 
     new_array << array_1[array_1_pointer] 
     array_1_pointer += 1 

     # If the current number in first array is less than current
     # number in second array, add from first array:

      elsif array_1[array_1_pointer] < array_2[array_2_pointer] 
         new_array << array_1[array_1_pointer] 
         array_1_pointer += 1

         # If the current number in second array is less than or equal
         # to current number in first array, add from second array:

      else
         new_array << array_2[array_2_pointer]
         array_2_pointer += 1
       end 
      end 
   return new_array
 end


Enter the next line: " response
answer="There are two separate arrays, so you could express the algorithm as O(N + M), where N and M represent each array, respectively."
additional_feedback="

   There are two separate arrays, so you could express the algorithm as O(N + M), 
   where N and M represent each array, respectively.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   Use Big O Notation to describe the time complexity of the following function. 
   It merges two sorted arrays together to create a new sorted array containing
   all the values from both arrays:


 def merge(array_1, array_2)
   new_array = []
   array_1_pointer = 0 
   array_2_pointer = 0

   while array_1_pointer < array_1.length || 
      array_2_pointer < array_2.length

   # If we already reached the end of the first array,
   # add item from second array:
   if !array_1[array_1_pointer] 
    new_array << array_2[array_2_pointer] 
    array_2_pointer += 1

   # If we already reached the end of the second array,
   # add item from first array:

   elsif !array_2[array_2_pointer] 
     new_array << array_1[array_1_pointer] 
     array_1_pointer += 1 

     # If the current number in first array is less than current
     # number in second array, add from first array:

      elsif array_1[array_1_pointer] < array_2[array_2_pointer] 
         new_array << array_1[array_1_pointer] 
         array_1_pointer += 1

         # If the current number in second array is less than or equal
         # to current number in first array, add from second array:

      else
         new_array << array_2[array_2_pointer]
         array_2_pointer += 1
       end 
      end 
   return new_array
 end

   ####################################
   ##            Answer:             ##
   ####################################


   There are two separate arrays, so you could express the algorithm as O(N + M), 
   where N and M represent each array, respectively.

Enter the next line: " response
answer="However, the algorithm only processes each value once."
additional_feedback="

   There are two separate arrays, so you could express the algorithm as O(N + M), 
   where N and M represent each array, respectively. However, the algorithm only 
   processes each value once.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   Use Big O Notation to describe the time complexity of the following function. 
   It merges two sorted arrays together to create a new sorted array containing
   all the values from both arrays:


 def merge(array_1, array_2)
   new_array = []
   array_1_pointer = 0 
   array_2_pointer = 0

   while array_1_pointer < array_1.length || 
      array_2_pointer < array_2.length

   # If we already reached the end of the first array,
   # add item from second array:
   if !array_1[array_1_pointer] 
    new_array << array_2[array_2_pointer] 
    array_2_pointer += 1

   # If we already reached the end of the second array,
   # add item from first array:

   elsif !array_2[array_2_pointer] 
     new_array << array_1[array_1_pointer] 
     array_1_pointer += 1 

     # If the current number in first array is less than current
     # number in second array, add from first array:

      elsif array_1[array_1_pointer] < array_2[array_2_pointer] 
         new_array << array_1[array_1_pointer] 
         array_1_pointer += 1

         # If the current number in second array is less than or equal
         # to current number in first array, add from second array:

      else
         new_array << array_2[array_2_pointer]
         array_2_pointer += 1
       end 
      end 
   return new_array
 end


   ####################################
   ##            Answer:             ##
   ####################################

   There are two separate arrays, so you could express the algorithm as O(N + M), 
   where N and M represent each array, respectively. However, the algorithm only 
   processes each value once.

Enter the next line: " response
answer="In this case, N is the total number of values between both arrays, and the time complexity is O(N)."
additional_feedback="

   There are two separate arrays, so you could express the algorithm as O(N + M), 
   where N and M represent each array, respectively. However, the algorithm only 
   processes each value once. In this case, N is the total number of values between 
   both arrays, and the time complexity is O(N).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use Big O Notation to describe the time complexity of the following function. 
   This function solves a famous problem known as \"finding a needle in the haystack.\" 
 
   Both the needle and haystack are strings. For example, if the needle is \"def\" and 
   the haystack is \"abcdefghi\", the needle is contained somewhere in the haystack, as
   \"def\" is a substring of \"abcdefghi\". However, if the needle is \"dd\", it cannot be 
   found in the haystack of \"abcdefghi\". 
   
   This function returns true or false, depending on whether the needle can be 
   found in the haystack:


   def find_needle (needle, haystack) 
      needle_index = 0 
      haystack_index = 0 
      while haystack_index < haystack.length 
         if needle[needle_index] == haystack[haystack_index]
            found_needle = true
               while needle_index < needle.length
                  if needle[needle_index] != haystack[haystack_index + needle_index]   found_needle = false
                     break
                  end
                  needle_index += 1 
               end
               
               return true if found_needle
               needle_index = 0 
               end
               
         
               haystack_index += 1 
         end 
         
         return false 
      end


Enter the next line: " response
answer="In a worst-case scenario, this algorithm runs for the number of characters in the \"needle\" multiplied by the number of characters in the \"haystack.\""
additional_feedback="

   In a worst-case scenario, this algorithm runs for the number of characters 
   in the \"needle\" multiplied by the number of characters in the \"haystack.\"

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   Use Big O Notation to describe the time complexity of the following function. 
   This function solves a famous problem known as \"finding a needle in the haystack.\" 
 
   Both the needle and haystack are strings. For example, if the needle is \"def\" and 
   the haystack is \"abcdefghi\", the needle is contained somewhere in the haystack, as
   \"def\" is a substring of \"abcdefghi\". However, if the needle is \"dd\", it cannot be 
   found in the haystack of \"abcdefghi\". 
   
   This function returns true or false, depending on whether the needle can be 
   found in the haystack:


   def find_needle (needle, haystack) 
      needle_index = 0 
      haystack_index = 0 
      while haystack_index < haystack.length 
         if needle[needle_index] == haystack[haystack_index]
            found_needle = true
               while needle_index < needle.length
                  if needle[needle_index] != haystack[haystack_index + needle_index]   found_needle = false
                     break
                  end
                  needle_index += 1 
               end
               
               return true if found_needle
               needle_index = 0 
               end
               
         
               haystack_index += 1 
         end 
         
         return false 
      end

   ####################################
   ##            Answer:             ##
   ####################################

   In a worst-case scenario, this algorithm runs for the number of characters 
   in the \"needle\" multiplied by the number of characters in the \"haystack.\"

Enter the next line: " response
answer="Because the needle and haystack may have different numbers of characters, 
 the Big O Notation is O(N * M)."
additional_feedback="

   In a worst-case scenario, this algorithm runs for the number of characters 
   in the \"needle\" multiplied by the number of characters in the \"haystack.\"

   Because the needle and haystack may have different numbers of characters, 
   the Big O Notation is O(N * M).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

   Use Big O Notation to describe the time complexity of the following function. 
   This function finds the greatest product of three numbers from a given array:

   def largest_product(array)  
      largest_product_so_far = array[0] * array[1] * array[2] 
      i = 0  
      while i < array.length
         j = i + 1 
         while j < array.length
         k = j + 1 
         while k < array.length
            
            if array[i] * array[j] * array[k] > largest_product_so_far
               
               largest_product_so_far = array[i] * array[j] * array[k] 
               end
               k += 1 
            end 
            j += 1 
         end  
         i += 1 
      end 
      return largest_product_so_far
   end

Enter the next line: " response
answer="N is the size of the array, and the time complexity is O(N3), as the program process through triply-nested loops."
additional_feedback="

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

   Use Big O Notation to describe the time complexity of the following function. 
   This function finds the greatest product of three numbers from a given array:

   def largest_product(array)  
      largest_product_so_far = array[0] * array[1] * array[2] 
      i = 0  
      while i < array.length
         j = i + 1 
         while j < array.length
         k = j + 1 
         while k < array.length
            
            if array[i] * array[j] * array[k] > largest_product_so_far
               
               largest_product_so_far = array[i] * array[j] * array[k] 
               end
               k += 1 
            end 
            j += 1 
         end  
         i += 1 
      end 
      return largest_product_so_far
   end

   ####################################
   ##            Answer:             ##
   ####################################

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops.

Enter the next line: " response
answer="The middle loop runs N / 2 times, and the innermost loop runs N / 4 times"
additional_feedback="

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

   Use Big O Notation to describe the time complexity of the following function. 
   This function finds the greatest product of three numbers from a given array:

   def largest_product(array)  
      largest_product_so_far = array[0] * array[1] * array[2] 
      i = 0  
      while i < array.length
         j = i + 1 
         while j < array.length
         k = j + 1 
         while k < array.length
            
            if array[i] * array[j] * array[k] > largest_product_so_far
               
               largest_product_so_far = array[i] * array[j] * array[k] 
               end
               k += 1 
            end 
            j += 1 
         end  
         i += 1 
      end 
      return largest_product_so_far
   end

   ####################################
   ##            Answer:             ##
   ####################################

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times,

Enter the next line: " response
answer="so the algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps."
additional_feedback="

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times, so the 
   algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

   Use Big O Notation to describe the time complexity of the following function. 
   This function finds the greatest product of three numbers from a given array:

   def largest_product(array)  
      largest_product_so_far = array[0] * array[1] * array[2] 
      i = 0  
      while i < array.length
         j = i + 1 
         while j < array.length
         k = j + 1 
         while k < array.length
            
            if array[i] * array[j] * array[k] > largest_product_so_far
               
               largest_product_so_far = array[i] * array[j] * array[k] 
               end
               k += 1 
            end 
            j += 1 
         end  
         i += 1 
      end 
      return largest_product_so_far
   end

   ####################################
   ##            Answer:             ##
   ####################################

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times, so the 
   algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps.

Enter the next line: " response
answer="so the algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps."
additional_feedback="

    N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times, so the 
   algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

   Use Big O Notation to describe the time complexity of the following function. 
   This function finds the greatest product of three numbers from a given array:

   def largest_product(array)  
      largest_product_so_far = array[0] * array[1] * array[2] 
      i = 0  
      while i < array.length
         j = i + 1 
         while j < array.length
         k = j + 1 
         while k < array.length
            
            if array[i] * array[j] * array[k] > largest_product_so_far
               
               largest_product_so_far = array[i] * array[j] * array[k] 
               end
               k += 1 
            end 
            j += 1 
         end  
         i += 1 
      end 
      return largest_product_so_far
   end

   ####################################
   ##            Answer:             ##
   ####################################

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times, so the 
   algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps.

Enter the next line: " response
answer="But we drop the constant, leaving us with O(N3)."
additional_feedback="

   N is the size of the array, and the time complexity is O(N3), as 
   the program process through triply-nested loops. The middle loop 
   runs N / 2 times, and the innermost loop runs N / 4 times, so the 
   algorithm is N * (N / 2) * (N / 4), which is N3 / 8 steps. But we 
   drop the constant, leaving us with O(N3).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "

   If there were a program that kept reducing a pile of resumes until 
   it had one left, it might take the approach of alternating between 
   throwing out the top half and the bottom half. That is, it will first 
   eliminate the top half of the pile, and then proceed to eliminate 
   the bottom half of what remains. It keeps alternating between eliminating 
   the top and bottom until one lucky resume remains, and that's who is 
   hired. Describe the efficiency of this function in terms of Big O:

      

def pick_resume(resumes) 
    eliminate = \"top\"

 while resumes.length > 1
    if eliminate == \"top\"
      resumes = resumes[resumes.length / 2, resumes.length - 1]
      eliminate = \"bottom\" 
    elsif eliminate == \"bottom\"
        resumes = resumes[0, resumes.length / 2] 
        eliminate = \"top\"
        end 
      end
      
      return resumes[0] 
     end


Enter the next line: " response
answer="N is the size of the resumes array."
additional_feedback="

   N is the size of the resumes array.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   If there were a program that kept reducing a pile of resumes until 
   it had one left, it might take the approach of alternating between 
   throwing out the top half and the bottom half. That is, it will first 
   eliminate the top half of the pile, and then proceed to eliminate 
   the bottom half of what remains. It keeps alternating between eliminating 
   the top and bottom until one lucky resume remains, and that's who is 
   hired. Describe the efficiency of this function in terms of Big O:

      

def pick_resume(resumes) 
    eliminate = \"top\"

 while resumes.length > 1
    if eliminate == \"top\"
      resumes = resumes[resumes.length / 2, resumes.length - 1]
      eliminate = \"bottom\" 
    elsif eliminate == \"bottom\"
        resumes = resumes[0, resumes.length / 2] 
        eliminate = \"top\"
        end 
      end
      
      return resumes[0] 
     end

   ####################################
   ##            Answer:             ##
   ####################################
   
   N is the size of the resumes array.

Enter the next line: " response
answer="Because in each round of the loop we eliminate half of the resumes"
additional_feedback="

   N is the size of the resumes array. Because in each round of the loop 
   we eliminate half of the resumes,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   If there were a program that kept reducing a pile of resumes until 
   it had one left, it might take the approach of alternating between 
   throwing out the top half and the bottom half. That is, it will first 
   eliminate the top half of the pile, and then proceed to eliminate 
   the bottom half of what remains. It keeps alternating between eliminating 
   the top and bottom until one lucky resume remains, and that's who is 
   hired. Describe the efficiency of this function in terms of Big O:
      

def pick_resume(resumes) 
    eliminate = \"top\"

 while resumes.length > 1
    if eliminate == \"top\"
      resumes = resumes[resumes.length / 2, resumes.length - 1]
      eliminate = \"bottom\" 
    elsif eliminate == \"bottom\"
        resumes = resumes[0, resumes.length / 2] 
        eliminate = \"top\"
        end 
      end
      
      return resumes[0] 
     end

     ####################################
     ##            Answer:             ##
     ####################################

   N is the size of the resumes array. Because in each round of the loop 
   we eliminate half of the resumes,

Enter the next line: " response
answer="we have an algorithm of O(log N)."
additional_feedback="

   N is the size of the resumes array. Because in each round of the loop 
   we eliminate half of the resumes, we have an algorithm of O(log N).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "What is a definition of hashing? " response
answer="This process of taking characters and converting them to numbers."
evaluate_answer "$response" "$answer" 

next_question

read -p "What is the defintion of hash function? " response
answer="Code that is used to convert letters into numbers."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a valid hash function? " response
answer="function must convert the same string to the same number every single time it's applied."
evaluate_answer "$response" "$answer"

next_question

read -p "What is an approach to handling collision? " response
answer="When a collision occurs, instead of placing a single value in the cell, it places in it a reference to an array."
evaluate_answer "$response" "$answer"

next_question

read -p "How does the process of handling collision work? " response
answer="The computer hashes the key. It looks at the cell that the hash generated."
additional_feedback="

   The computer hashes the key. It looks at the cell that the hash generated.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does the process of handling collision work? " response
answer="If the cell containts more than on value it will be in an array of arrays rather than a single value."
additional_feedback="

   The computer hashes the key. It looks at the cell that the hash generated.
   If the cell containts more than on value it will be in an array of arrays 
   rather than a single value.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does the process of handling collision work? " response
answer="If the cell contains more than one value, it will be in an array of arrays rather than a single value."
additional_feedback="

   The computer hashes the key. It looks at the cell that the hash generated.
   If the cell contains more than one value, it will be in an array of arrays 
   rather than a single value.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does the process of handling collision work? " response
answer="The computer will then search through the array linearly, looking at index 0 of each subarray until it finds the key."
additional_feedback="

   The computer hashes the key. It looks at the cell that the hash generated.
   If the cell contains more than one value, it will be in an array of arrays 
   rather than a single value. The computer will then search through the array 
   linearly, looking at index 0 of each subarray until it finds the key.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "How does the process of handling collision work? " response
answer="It then returns the value at index 1 of the correct subarray."
additional_feedback="

   The computer hashes the key. It looks at the cell that the hash generated.
   If the cell contains more than one value, it will be in an array of arrays 
   rather than a single value. The computer will then search through the array 
   linearly, looking at index 0 of each subarray until it finds the key. It then 
   returns the value at index 1 of the correct subarray.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Explain the worst-case performance for a hash table. " response
answer="If somehow all of the data ended up within a single hash table cell, the hash table would be no better than an array."
additional_feedback="

   If somehow all of the data ended up within a single hash table cell, 
   the hash table would be no better than an array.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Explain the worst-case performance for a hash table. 

   If somehow all of the data ended up within a single hash table cell, 
   the hash table would be no better than an array.

Enter the next line: " response
answer="Therefore, the worst-case performance for a hash table lookup is O(N)."
additional_feedback="

   If somehow all of the data ended up within a single hash table cell, 
   the hash table would be no better than an array. Therefore, the worst-case 
   performance for a hash table lookup is O(N).

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are good characteristics of a hash function? " response
answer="A good hash function is one that distributes its data across all available cells."
additional_feedback="A good hash function is one that distributes its data across all available cells."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are good characteristics of a hash function? 

   A good hash function is one that distributes its data across all available cells.

Enter the next line: " response
answer="The more we can spread out our data, the fewer collisions we will have."
additional_feedback="

   A good hash function is one that distributes its data across all available cells.
   The more we can spread out our data, the fewer collisions we will have.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are good characteristics of a hash function? 

   A good hash function is one that distributes its data across all available cells.
   The more we can spread out our data, the fewer collisions we will have.

Enter the next line: " response
answer="Furthermore, while avoiding collision, a hash table should maintain low memory consumption and limit the number of cells."
additional_feedback="

   A good hash function is one that distributes its data across all available cells.
   The more we can spread out our data, the fewer collisions we will have. Furthermore,
   while avoiding collision, a hash table should maintain low memory consumption and limit the number of cells.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the rule of thumb regarding the load factor for a hash table? " response
answer="For every 7 data elements stored in a hash table, it should have 10 cells."
evaluate_answer "$response" "$answer"

next_question

read -p "

   How do you optimize the following code?

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      for (let i = 0; i < smallerArray.length; i++) {
         let foundMatch = false;

         for (let j = 0; j < largerArray.length; j++) {
            if (smallerArray[i] === largerArray[i]) {
            foundMatch = true;
            break;
            }
         }
         if (foundMatch === false) {
            return false;
         }
      }
      return true;
   }

Enter the next line: " response
answer="let hashTable = {};"
additional_feedback="

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   How do you optimize the following code?

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      
   }

Enter the next line: " response
answer="for(const value of largerArray) { hashTable[value] = true; }"
additional_feedback="

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      for(const value of largerArray) { 
         hashTable[value] = true; 
      }
      
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   How do you optimize the following code?

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      for(const value of largerArray) { 
         hashTable[value] = true; 
      }
      
   }

Enter the next line: " response
answer="for(const value of smallerArray) { }"
additional_feedback="

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      for(const value of largerArray) { 
         hashTable[value] = true; 
      }

      for(const value of smallerArray) { 

      }
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

   How do you optimize the following code?

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      for(const value of largerArray) { 
         hashTable[value] = true; 
      }
      
   }

Enter the next line: " response
answer="if(!hashTable[value]) { return false; }"
additional_feedback="

   function isSubset(array1, array2) {
      let largerArray;
      let smallerArray;
      // Determine which array is smaller:
      if (array1.length > array2.length) {
         largerArray = array1;
         smallerArray = array2;
      } else {
         largerArray = array2;
         smallerArray = array1;
      }

      let hashTable = {};
      for(const value of largerArray) { 
         hashTable[value] = true; 
      }

      for(const value of smallerArray) { 
         if(!hashTable[value]) { 
            return false; 
         }
      }

      return true;
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "


 Write a function that returns the intersection of two arrays. The intersection 
 is a third array that contains all values contained within the first two arrays. 
 For example, the intersection of [1, 2, 3, 4, 5] and [0, 2, 4, 6, 8] is [2, 4]. 
 Your function should have a complexity of O(N). (If your programming language 
 has a built-in way of doing this, don't use it. The idea is to build the algorithm 
 yourself.)


 Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

 Write a function that accepts an array of strings and returns the 
 first duplicate value it finds. For example, if the array is 
 [\"a\", \"b\", \"c\", \"d\", \"c\", \"e\", \"f\"], the function should 
 return \"c\", since it's duplicated within the array. (You can assume 
 that there's one pair of duplicates within the array.) Make sure the 
 function has an efficiency of O(N).

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

 Write a function that accepts a string that contains all the letters 
 of the alphabet except one and returns the missing letter. For example, 
 the string, \"the quick brown box jumps over a lazy dog\" contains all the 
 letters of the alphabet except the letter, \"f\". The function should have 
 a time complexity of O(N).

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

 Write a function that returns the first non-duplicated character 
 in a string. For example, the string, \"minimum\" has two characters 
 that only exist once—the \"n\" and the \"u\", so your function should 
 return the \"n\", since it occurs first. The function should have an 
 efficiency of O(N).

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the three constraints regarding Stacks? " response
answer="Data can be inserted only at the end of a stack."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are the three constraints regarding Stacks? 

   • Data can be inserted only at the end of a stack.

Enter the next line: " response
answer="Data can be deleted only from the end of a stack."
additional_feedback="

   • Data can be inserted only at the end of a stack.
   • Data can be deleted only from the end of a stack.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are the three constraints regarding Stacks? 

   • Data can be inserted only at the end of a stack.
   • Data can be deleted only from the end of a stack.

Enter the next line: " response
answer="Only the last element of a stack can be read."
additional_feedback="

   • Data can be inserted only at the end of a stack.
   • Data can be deleted only from the end of a stack.
   • Only the last element of a stack can be read.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "What are the three constraints regarding Queue? " response
answer="Data can be inserted only at the end of a queue."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are the three constraints regarding Stacks? 

   • Data can be inserted only at the end of a queue.

Enter the next line: " response
answer="Data can be deleted only from the front of a queue."
additional_feedback="

   • Data can be inserted only at the end of a queue.
   • Data can be deleted only from the front of a queue.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What are the three constraints regarding Stacks? 

   • Data can be inserted only at the end of a queue.
   • Data can be deleted only from the front of a queue.

Enter the next line: " response
answer="Only the element at the front of a queue can be read."
additional_feedback="

   • Data can be inserted only at the end of a queue.
   • Data can be deleted only from the front of a queue.
   • Only the element at the front of a queue can be read.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   If you were writing software for a call center that places 
   callers on hold and then assigns them to \"the next available 
   representative,\" would you use a stack or a queue?

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   If you pushed numbers onto a stack in the following order: 
   1, 2, 3, 4, 5, 6, and then popped two items, which number 
   would you be able to read from the stack?

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  If you inserted numbers into a queue in the following order: 
  1, 2, 3, 4, 5, 6, and then dequeued two items, which number 
  would you be able to read from the queue?

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "What is a base case in a recursive function? " response
answer="A base case is the condition in which a recursive function will not recurse."
additional_feedback=""
evaluate_answer "$response" "$answer"


read -p "

      The following function prints every other number from a low 
      number to a high number. For example, if low is 0 and high is 
      10, it would print:
         
         0 
         2 
         4  
         6  
         8 
         10

      Identify the base case in the function:

      def print_every_other(low, high) 
         return if low > high
         puts low
         print_every_other(low + 2, high) 
       end

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

      My kid was playing with my computer and changed my factorial function so 
      that it computes factorial based on (n - 2) instead of (n - 1). Predict 
      what will happen when we run factorial(10) using this function:

         def factorial(n) 
            return 1 if n == 1 
            return n * factorial(n - 2)
           end


Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

      Following is a function in which we pass in two numbers called 
      low and high. The function returns the sum of all the numbers from 
      low to high. For example, if low is 1, and high is 10, the function 
      will return the sum of all numbers from 1 to 10, which is 55. However, 
      our code is missing the base case, and will run indefinitely! 
      Fix the code by adding the correct base case:

      def sum(low, high) 
         return high + sum(low, high - 1) 
      end


Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question


read -p "

   Here is an array containing both numbers as well as other arrays, 
   which in turn contain numbers and arrays:

   array = [  
      1, 
      2,  
      3,  
      [4, 5, 6], 
      7, 
      [8,  
      [9, 10, 11, 
      [12, 13, 14]  
      ]  
      ],  
      [15, 16, 17, 18, 19,  
      [20, 21, 22,  
      [23, 24, 25,  
      [26, 27, 29]  
      ], 30, 31  
      ], 32  
      ], 33
    ]

   Write a recursive function that prints all the numbers (and just numbers).



Enter the next line: " response
answer=""
additional_feedback=""
evaluate_total_missed_questions "$response" "$answer" "$additional_feedback"