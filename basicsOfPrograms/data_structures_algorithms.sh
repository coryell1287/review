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
answer="we drop the “/ 2” because it's a regular number, and express the efficiency as O(N2)."


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
answer="For this, use a queue, which processes data FIFO (First In, First Out)."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   If you pushed numbers onto a stack in the following order: 
   1, 2, 3, 4, 5, 6, and then popped two items, which number 
   would you be able to read from the stack?

Enter the next line: " response
answer="We would be able to read the 4, which is now the top element in the stack. This is because we will have popped the 6 and the 5, which were previously sitting on top of the 4."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  If you inserted numbers into a queue in the following order: 
  1, 2, 3, 4, 5, 6, and then dequeued two items, which number 
  would you be able to read from the queue?

Enter the next line: " response
answer="We would be able to read the 3, which is now at the front of the queue, after having dequeued the 1 and the 2."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

Enter the next line: " response
answer="def reverse(string)"
additional_feedback="

   def reverse(string)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
    

Enter the next line: " response
answer="stack = Stack.new"
additional_feedback="

   def reverse(string)
      stack = Stack.new

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
     stack = Stack.new
    

Enter the next line: " response
answer="string.each_char do |char|"
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
    

Enter the next line: " response
answer="stack.push(char) end"
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

Enter the next line: " response
answer="new_string = """
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

Enter the next line: " response
answer="new_string = """
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

Enter the next line: " response
answer="while stack.read"
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

      while stack.read

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

Enter the next line: " response
answer="new_string += stack.pop end"
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

      while stack.read
         new_string += stack.pop 
      end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses a stack to reverse a string. (For example, 
  \"abcde\" would become \"edcba\".) You can work with our earlier implementation 
  of the Stack class.

  def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

Enter the next line: " response
answer="return new_string end"
additional_feedback="

   def reverse(string)
      stack = Stack.new

      string.each_char do |char|
         stack.push(char)
      end

      new_string = ""

      while stack.read
         new_string += stack.pop 
      end

      return new_string 
     end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a base case in a recursive function? " response
answer="A base case is the condition in which a recursive function will not recurse."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

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
answer="The base case is if low > high. We want to stop the recursion once low value has exceeded high value."
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
answer="We would have infinite recursion. factorial(10) calls factorial(8)"
additional_feedback="

   We would have infinite recursion. factorial(10) calls factorial(8),

"
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

   ***************************
             Answer: 
   ***************************

   We would have infinite recursion. factorial(10) calls factorial(8),


Enter the next line: " response
answer="which calls factorial(6), which calls factorial(4), which calls factorial(2)"
additional_feedback="

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2),

"
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

   ***************************
             Answer: 
   ***************************

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2),


Enter the next line: " response
answer="which calls factorial(0). Since our base case is if n == 1"
additional_feedback="

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2), which calls factorial(0). Since our base case is if 
   n == 1,

"
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

   ***************************
             Answer: 
   ***************************

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2),


Enter the next line: " response
answer="we never end up with n ever being 1, so the recursion continues."
additional_feedback="

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2), which calls factorial(0). Since our base case is if 
   n == 1, we never end up with n ever being 1, so the recursion continues.

"
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

   ***************************
             Answer: 
   ***************************

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2),


Enter the next line: " response
answer="we never end up with n ever being 1, so the recursion continues."
additional_feedback="

   We would have infinite recursion. factorial(10) calls factorial(8),
   which calls factorial(6), which calls factorial(4), which calls 
   factorial(2), which calls factorial(0). Since our base case is if 
   n == 1, we never end up with n ever being 1, so the recursion continues.
   factorial(0) calls factorial(-2), and so on.

"
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
answer="If low is 1 and high is 10, then when we call sum(1, 10), that in turn returns 10 + sum(1, 9)."
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9).

"
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

      ***************************
               Answer: 
      ***************************

      If low is 1 and high is 10, then when we call sum(1, 10), that in 
      turn returns 10 + sum(1, 9).

Enter the next line: " response
answer="If low is 1 and high is 10, then when we call sum(1, 10), that in turn returns 10 + sum(1, 9)."
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9).

"
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

      ***************************
               Answer: 
      ***************************

      If low is 1 and high is 10, then when we call sum(1, 10), that in 
      turn returns 10 + sum(1, 9).

Enter the next line: " response
answer="That is, we return the sum of 10 plus whatever the sum of 1 through 9 is."
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is.

"
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

      ***************************
               Answer: 
      ***************************

      If low is 1 and high is 10, then when we call sum(1, 10), that in 
      turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
      whatever the sum of 1 through 9 is.

Enter the next line: " response
answer="sum(1, 9) ends up calling sum(1, 8), which in turn calls sum(1, 7), and so on."
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

"
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

      ***************************
               Answer: 
      ***************************

      If low is 1 and high is 10, then when we call sum(1, 10), that in 
      turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
      whatever the sum of 1 through 9 is.

Enter the next line: " response
answer="We want the last call to be sum(1, 1), in which we simply want to return the number 1. This becomes our base case:"
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

   We want the last call to be sum(1, 1), in which we simply want to return 
   the number 1. This becomes our base case:

"
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

      ***************************
               Answer: 
      ***************************

      If low is 1 and high is 10, then when we call sum(1, 10), that in 
      turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
      whatever the sum of 1 through 9 is.

      We want the last call to be sum(1, 1), in which we simply want to return 
      the number 1. This becomes our base case:

Enter the next line: " response
answer="def sum(low, high)"
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

   We want the last call to be sum(1, 1), in which we simply want to return 
   the number 1. This becomes our base case:

   def sum(low, high)

"
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

      ***************************
               Answer: 
      ***************************

      We want the last call to be sum(1, 1), in which we simply want to return 
      the number 1. This becomes our base case:

      def sum(low, high)

Enter the next line: " response
answer="if high == low:"
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

   We want the last call to be sum(1, 1), in which we simply want to return 
   the number 1. This becomes our base case:

   def sum(low, high)
      if high == low:

"
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

      ***************************
               Answer: 
      ***************************

      We want the last call to be sum(1, 1), in which we simply want to return 
      the number 1. This becomes our base case:

      def sum(low, high)
         if high == low:   
           return low

Enter the next line: " response
answer="return low"
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

   We want the last call to be sum(1, 1), in which we simply want to return 
   the number 1. This becomes our base case:

   def sum(low, high)
     if high == low:   
       return low

"
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

      ***************************
               Answer: 
      ***************************

      We want the last call to be sum(1, 1), in which we simply want to return 
      the number 1. This becomes our base case:

      def sum(low, high)
         if high == low:   
           return low

Enter the next line: " response
answer="return high + sum(low, high - 1)"
additional_feedback="

   If low is 1 and high is 10, then when we call sum(1, 10), that in 
   turn returns 10 + sum(1, 9). That is, we return the sum of 10 plus 
   whatever the sum of 1 through 9 is. sum(1, 9) ends up calling sum(1, 8), 
   which in turn calls sum(1, 7), and so on.

   We want the last call to be sum(1, 1), in which we simply want to return 
   the number 1. This becomes our base case:

   def sum(low, high)
     if high == low:   
       return low

      return high + sum(low, high - 1)

"
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
answer="This approach is similar to the file directory example from the text:"
additional_feedback="

   This approach is similar to the file directory example from the text:


"
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
answer="def print_all_items(array):"
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):


"
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


   *******************
         Answer
   ********************

   def print_all_items(array):

Enter the next line: " response
answer="for value in array:"
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:


"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:

Enter the next line: " response
answer="if isinstance(value, list):"
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):

"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):

Enter the next line: " response
answer="print_all_items(value)"
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)

"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)

Enter the next line: " response
answer="else: print(value)"
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)
       else:
         print(value)

"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)

Enter the next line: " response
answer="We iterate over each item within the outer array."
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)
       else:
         print(value)

    We iterate over each item within the outer array. 

"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)

Enter the next line: " response
answer="If the value is itself another array, we recursively call the function on that subarray."
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)
       else:
         print(value)

    We iterate over each item within the outer array. If the value is 
    itself another array, we recursively call the function on that 
    subarray.

"
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


   *******************
         Answer
   ********************

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)

Enter the next line: " response
answer="Otherwise, it's the base case where we simply print the value to the screen."
additional_feedback="

   This approach is similar to the file directory example from the text:

   def print_all_items(array):
     for value in array:
       # if the current item is a \"list\", i.e array:
       if isinstance(value, list):
         print_all_items(value)
       else:
         print(value)

    We iterate over each item within the outer array. If the value is 
    itself another array, we recursively call the function on that 
    subarray. Otherwise, it's the base case where we simply print 
    the value to the screen.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.

Enter the next line: " response
answer="Define a function called our function character_count. Assume the character_count function has already been implemented."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="Next, we need to identify the subproblem. If our problem is the array, then our subproblem can be the same array missing one string."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="The subproblem is the array minus the first string, which would be [\"c\"]."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"].
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="If we were to call character_count(array), we would get a return value of 8, since there are eight characters in total."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="To solve our original problem, all we have to do is add the length of the first string (\"ab\")"
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\")
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="to the result of calling the character_count function on the subproblem."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="def character_count(array)"
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="return 0 if array.length == 0"
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="return array[0].length + character_count(array[1, array.length -1])"
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
     return array[0].length + character_count(array[1, array.length -1])
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="return array[0].length + character_count(array[1, array.length -1])"
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
     return array[0].length + character_count(array[1, array.length -1])
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="Note that we made our base case to be when the array is empty, in which case there are zero string characters."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
     return array[0].length + character_count(array[1, array.length -1])
    end

   Note that we made our base case to be when the array is empty, in which case 
   there are zero string characters. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="We mention an alternative and equally viable base case in the comments, which is when the array contains one string."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
     return array[0].length + character_count(array[1, array.length -1])
    end

   Note that we made our base case to be when the array is empty, in which case 
   there are zero string characters. We mention an alternative and equally viable 
   base case in the comments, which is when the array contains one string. 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of strings 
   and returns the total number of characters across all the strings. 
   For example, if the input array is [\"ab\", \"c\", \"def\", \"ghij\"], 
   the output should be 10 since there are 10 characters in total.


   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

Enter the next line: " response
answer="In that case, we return the length of that single string."
additional_feedback="

   Define a function called our function character_count. Assume the 
   character_count function has already been implemented.

   Next, we need to identify the subproblem. If our problem is the array, 
   [\"ab\", \"c\", \"def\", \"ghij\"], then our subproblem can be the same 
   array missing one string. The subproblem is the array minus the first 
   string, which would be [\"c\", \"def\", \"ghij\"]. If we were to call 
   character_count([\"c\", \"def\", \"ghij\"]), we would get a return value of 8, 
   since there are eight characters in total.

   To solve our original problem, all we have to do is add the length of the 
   first string (\"ab\") to the result of calling the character_count function 
   on the subproblem.


   def character_count(array) 
     # Alternative base case:
     # return array[0].length if array.length == 1

     # Base case: when the array is empty: 
     return 0 if array.length == 0
     return array[0].length + character_count(array[1, array.length -1])
    end

   Note that we made our base case to be when the array is empty, in which case 
   there are zero string characters. We mention an alternative and equally viable 
   base case in the comments, which is when the array contains one string. In that
   case, we return the length of that single string.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="we could say that the subproblem is all the numbers in the array beside the first one."
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="First, let's pretend the select_even function already works."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="So, let's imagine select_even(array) already works and returns [2, 4]."
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="Since the first number in the array is 1, we actually don't want to do anything other than return the [2, 4]."
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="However, if the first number in the array was a 0, we'd want to return the [2, 4] with the 0 added to it."
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="The base case can be when the array is empty."
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="def select_even(array)"
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

   def select_even(array)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="return [] if array.empty?"
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

   def select_even(array)
     return [] if array.empty?

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="if array[0].even?"
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

   def select_even(array)
     return [] if array.empty?

     if array[0].even?

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="return [array[0]] + select_even(array[1, array.length - 1])"
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

   def select_even(array)
     return [] if array.empty?

     if array[0].even?
      return [array[0]] + select_even(array[1, array.length - 1])

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts an array of numbers 
   and returns a new array containing just the even numbers.

Enter the next line: " response
answer="else return select_even(array[1, array.length - 1])"
additional_feedback="

   First, let's pretend the select_even function already works. Next, 
   let's identify the subproblem. If we try to select all the even 
   numbers in the example array, [1, 2, 3, 4, 5], we could say that 
   the subproblem is all the numbers in the array beside the first one.
   So, let's imagine select_even([2, 3, 4, 5]) already works and returns 
   [2, 4].

   However, if the first number in the array was a 0, we'd want to return 
   the [2, 4] with the 0 added to it.

   The base case can be when the array is empty.

   def select_even(array)
     return [] if array.empty?

     if array[0].even?
      return [array[0]] + select_even(array[1, array.length - 1])
     else 
      return select_even(array[1, array.length - 1])
     end
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   There is a numerical sequence known as \"Triangular Numbers.\" 
   The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward 
   with the Nth number in the pattern, which is N plus the previous 
   number. For example, the 7th number in the sequence is 28, since 
   it's 7 (which is N) plus 21 (the previous number in the sequence). 
   Write a function that accepts a number for N and returns the correct 
   number from the series. That is, if the function was passed the number 
   7, the function would return 28.


Enter the next line: " response
answer="The definition of a triangular number was given as n plus the previous number from the pattern."
additional_feedback="

   The definition of a triangular number was given as n plus the previous 
   number from the pattern.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   There is a numerical sequence known as \"Triangular Numbers.\" 
   The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward 
   with the Nth number in the pattern, which is N plus the previous 
   number. For example, the 7th number in the sequence is 28, since 
   it's 7 (which is N) plus 21 (the previous number in the sequence). 
   Write a function that accepts a number for N and returns the correct 
   number from the series. That is, if the function was passed the number 
   7, the function would return 28.


Enter the next line: " response
answer="If the name of our function is triangle, we can express this simply as n + triangle(n - 1). The base case is when n is 1."
additional_feedback="

   The definition of a triangular number was given as n plus the previous 
   number from the pattern. If the name of our function is triangle, we can 
   express this simply as n + triangle(n - 1). The base case is when n is 1.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   There is a numerical sequence known as \"Triangular Numbers.\" 
   The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward 
   with the Nth number in the pattern, which is N plus the previous 
   number. For example, the 7th number in the sequence is 28, since 
   it's 7 (which is N) plus 21 (the previous number in the sequence). 
   Write a function that accepts a number for N and returns the correct 
   number from the series. That is, if the function was passed the number 
   7, the function would return 28.


Enter the next line: " response
answer="def triangle(n)"
additional_feedback="

   The definition of a triangular number was given as n plus the previous 
   number from the pattern. If the name of our function is triangle, we can 
   express this simply as n + triangle(n - 1). The base case is when n is 1.

   def triangle(n)
   
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   There is a numerical sequence known as \"Triangular Numbers.\" 
   The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward 
   with the Nth number in the pattern, which is N plus the previous 
   number. For example, the 7th number in the sequence is 28, since 
   it's 7 (which is N) plus 21 (the previous number in the sequence). 
   Write a function that accepts a number for N and returns the correct 
   number from the series. That is, if the function was passed the number 
   7, the function would return 28.


Enter the next line: " response
answer="return 1 if n == 1"
additional_feedback="

   The definition of a triangular number was given as n plus the previous 
   number from the pattern. If the name of our function is triangle, we can 
   express this simply as n + triangle(n - 1). The base case is when n is 1.

   def triangle(n)
     return 1 if n == 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   There is a numerical sequence known as \"Triangular Numbers.\" 
   The pattern begins as 1, 3, 6, 10, 15, 21, and continues onward 
   with the Nth number in the pattern, which is N plus the previous 
   number. For example, the 7th number in the sequence is 28, since 
   it's 7 (which is N) plus 21 (the previous number in the sequence). 
   Write a function that accepts a number for N and returns the correct 
   number from the series. That is, if the function was passed the number 
   7, the function would return 28.


Enter the next line: " response
answer="return n + triangle(n - 1)"
additional_feedback="

   The definition of a triangular number was given as n plus the previous 
   number from the pattern. If the name of our function is triangle, we can 
   express this simply as n + triangle(n - 1). The base case is when n is 1.

   def triangle(n)
     return 1 if n == 1
     return n + triangle(n - 1)
    end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="Assume index_of_x, has already been implemented. Next, define the subproblem as string minus its first character."
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="For example, if our input string is \"hex\", the subproblem is \"ex\"."
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\".

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="Now, index_of_x(\"ex\") would return 1. To calculate the index of the \"x\" for the original string"
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\". Now, index_of_x(\"ex\") 
   would return 1. To calculate the index of the \"x\" for the original string,

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="we would add 1 to this since the additional \"h\" at the front of the string moves the \"x\" down one index."
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\". 
   
   Now, index_of_x(\"ex\") would return 1. To calculate the index of 
   the \"x\" for the original string, we would add 1 to this since the 
   additional \"h\" at the front of the string moves the \"x\" down one 
   index.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="def index_of_x(string)"
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\". 
   
   Now, index_of_x(\"ex\") would return 1. To calculate the index of 
   the \"x\" for the original string, we would add 1 to this since the 
   additional \"h\" at the front of the string moves the \"x\" down one 
   index.

   def index_of_x(string)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="return 0 if string[0] == 'x'"
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\". 
   
   Now, index_of_x(\"ex\") would return 1. To calculate the index of 
   the \"x\" for the original string, we would add 1 to this since the 
   additional \"h\" at the front of the string moves the \"x\" down one 
   index.

   def index_of_x(string)
     return 0 if string[0] == 'x'

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Use recursion to write a function that accepts a string and returns the 
   first index that contains the character \"x.\" For example, the string, 
   \"abcdefghijklmnopqrstuvwxyz\" has an \"x\" at index 23. To keep things 
   simple, assume the string definitely has at least one \"x.\"


Enter the next line: " response
answer="return index_of_x(string[1, string.length - 1]) + 1"
additional_feedback="

   Assume index_of_x, has already been implemented. Next, define the 
   subproblem as string minus its first character. For example, if our 
   input string is \"hex\", the subproblem is \"ex\". 
   
   Now, index_of_x(\"ex\") would return 1. To calculate the index of 
   the \"x\" for the original string, we would add 1 to this since the 
   additional \"h\" at the front of the string moves the \"x\" down one 
   index.

   def index_of_x(string)
     return 0 if string[0] == 'x'
     return index_of_x(string[1, string.length - 1]) + 1
    end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="From the starting position, we have only two choices of movement. We can either move one space to the right or one space downward."
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="What this means is that the total number of unique shortest paths will be the number of paths"
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="from space to the right of S + the number of paths from space below S."
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="The number of paths from the space to the right of S is the same as calculating the paths in a grid of six columns and three rows."
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="The number of paths from the space below the S is the equivalent of the paths in a grid of seven columns and two rows."
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="Now add the base case. Possible base cases include when we have just one row or one column"
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows. Now add 
   the base case. Possible base cases include when we have just one row or 
   one column,


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="since in such cases, there's only one path available to us."
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows. Now add 
   the base case. Possible base cases include when we have just one row or 
   one column, since in such cases, there's only one path available to us.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="def unique_paths(rows, columns)"
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows. Now add 
   the base case. Possible base cases include when we have just one row or 
   one column, since in such cases, there's only one path available to us.

   def unique_paths(rows, columns)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="return 1 if rows == 1 || columns == 1"
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows. Now add 
   the base case. Possible base cases include when we have just one row or 
   one column, since in such cases, there's only one path available to us.

   def unique_paths(rows, columns)
     return 1 if rows == 1 || columns == 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "

   This problem is known as the \"Unique Paths\" problem: Let's 
   say you have a grid of rows and columns. Write a function that 
   accepts a number of rows and a number of columns, and calculates 
   the number of possible \"shortest\" paths from the upper-leftmost 
   square to the lower-rightmost square.

Enter the next line: " response
answer="return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)"
additional_feedback="

   From the starting position, we have only two choices of movement. We 
   can either move one space to the right or one space downward. What 
   this means is that the total number of unique shortest paths will be 
   the number of paths from space to the right of S + the number of paths 
   from space below S.

   The number of paths from the space to the right of S is the same as 
   calculating the paths in a grid of six columns and three rows. Now add 
   the base case. Possible base cases include when we have just one row or 
   one column, since in such cases, there's only one path available to us.

   def unique_paths(rows, columns)
     return 1 if rows == 1 || columns == 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="The problem here is that there are two recursive calls to the function within itself can easily reduce it to one."
additional_feedback="

   The problem here is that there are two recursive calls to the function 
   within itself can easily reduce it to one.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="def add_until_100(array)"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="return 0 if array.length == 0"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)
     return 0 if array.length == 0

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)
     return 0 if array.length == 0
     sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="if array[0] + sum_of_remaining_numbers > 100"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)
     return 0 if array.length == 0
     sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])
     if array[0] + sum_of_remaining_numbers > 100

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="return sum_of_remaining_numbers"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)
     return 0 if array.length == 0
     sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])
     if array[0] + sum_of_remaining_numbers > 100
      return sum_of_remaining_numbers

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function accepts an array of numbers and returns the sum, 
   as long as a particular number doesn't bring the sum above 100. If adding 
   a particular number will make the sum higher than 100, that number is ignored. 
   However, this function makes unnecessary recursive calls. Fix the code to 
   eliminate the unnecessary recursion:

   def add_until_100(array)
      return 0 if array.length == 0
      if array[0] + add_until_100(array[1, array.length - 1]) > 100
         return add_until_100(array[1, array.length - 1])
      else
         return array[0] + add_until_100(array[1, array.length - 1])
      end
    end
   

Enter the next line: " response
answer="else return array[0] + sum_of_remaining_numbers"
additional_feedback="

   The problem here is that there are two recursive calls to the function within 
   itself can easily reduce it to one.

   def add_until_100(array)
     return 0 if array.length == 0
     sum_of_remaining_numbers = add_until_100(array[1, array.length - 1])
     if array[0] + sum_of_remaining_numbers > 100
      return sum_of_remaining_numbers
     else 
       return array[0] + sum_of_remaining_numbers
      end
     end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function uses recursion to calculate the Nth number 
   from a mathematical sequence known as the \"Golomb sequence.\" 
   It's terribly inefficient, though! Use memoization to optimize it. 
   (You don't have to actually understand how the Golomb sequence works 
   to do this exercise.)

   def golomb(n)
      return 1 if n == 1
      return 1 + golomb(n - golomb(golomb(n - 1)));
    end

Enter the next line: " response
answer="def golmob(n, memo={})"
additional_feedback="

   def golmob(n, memo={})

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function uses recursion to calculate the Nth number 
   from a mathematical sequence known as the \"Golomb sequence.\" 
   It's terribly inefficient, though! Use memoization to optimize it. 
   (You don't have to actually understand how the Golomb sequence works 
   to do this exercise.)

   def golomb(n)
      return 1 if n == 1
      return 1 + golomb(n - golomb(golomb(n - 1)));
    end

Enter the next line: " response
answer="return 1 if n == 1"
additional_feedback="

   def golmob(n, memo={})
    return 1 if n == 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function uses recursion to calculate the Nth number 
   from a mathematical sequence known as the \"Golomb sequence.\" 
   It's terribly inefficient, though! Use memoization to optimize it. 
   (You don't have to actually understand how the Golomb sequence works 
   to do this exercise.)

   def golomb(n)
      return 1 if n == 1
      return 1 + golomb(n - golomb(golomb(n - 1)));
    end

Enter the next line: " response
answer="if !memo[n]"
additional_feedback="

   def golmob(n, memo={})
    return 1 if n == 1
   
    if !memo[n]

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function uses recursion to calculate the Nth number 
   from a mathematical sequence known as the \"Golomb sequence.\" 
   It's terribly inefficient, though! Use memoization to optimize it. 
   (You don't have to actually understand how the Golomb sequence works 
   to do this exercise.)

   def golomb(n)
      return 1 if n == 1
      return 1 + golomb(n - golomb(golomb(n - 1)));
    end

Enter the next line: " response
answer="memo[n] = 1 + golmob(n - golmob(golmob(n - 1, memo), memo), memo)"
additional_feedback="

   def golmob(n, memo={})
    return 1 if n == 1
   
    if !memo[n]
      memo[n] = 1 + golmob(n - golmob(golmob(n - 1, memo), memo), memo)
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function uses recursion to calculate the Nth number 
   from a mathematical sequence known as the \"Golomb sequence.\" 
   It's terribly inefficient, though! Use memoization to optimize it. 
   (You don't have to actually understand how the Golomb sequence works 
   to do this exercise.)

   def golomb(n)
      return 1 if n == 1
      return 1 + golomb(n - golomb(golomb(n - 1)));
    end

Enter the next line: " response
answer="return memo[n]"
additional_feedback="

   def golmob(n, memo={})
    return 1 if n == 1
   
    if !memo[n]
      memo[n] = 1 + golmob(n - golmob(golmob(n - 1, memo), memo), memo)
    end
   return memo[n]
  end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="To accomplish memoization here, we need to make a key out of both the number of 
rows and number of columns."
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="We can make our key a simple array of [rows, columns]."
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="def unique_paths(rows, columns, memo={})"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="return 1 if rows == 1 || columns == 1"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})
     return 1 if rows == 1 || columns == 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="if !memo[[rows, columns]]"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})
     return 1 if rows == 1 || columns == 1
     if !memo[[rows, columns]]

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="memo[[rows, columns]] = unique_paths(rows - 1, columns, memo)"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})
     return 1 if rows == 1 || columns == 1
     if !memo[[rows, columns]]
       memo[[rows, columns]] = unique_paths(rows - 1, columns, memo)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="+ unique_paths(rows, columns - 1, memo)"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})
     return 1 if rows == 1 || columns == 1
     if !memo[[rows, columns]]
       memo[[rows, columns]] = unique_paths(rows - 1, columns, memo) + unique_paths(rows, columns - 1, memo)
      end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Here is a solution to the \"Unique Paths\" problem from an exercise 
   in the previous chapter. Use memoization to improve its efficiency:

   def unique_paths(rows, columns)
      return 1 if rows == 1 || columns == 1
      return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
     end

Enter the next line: " response
answer="return memo[[rows, columns]]"
additional_feedback="

   To accomplish memoization here, we need to make a key out of both the number of 
   rows and number of columns. We can make our key a simple array of [rows, columns].

   def unique_paths(rows, columns, memo={})
     return 1 if rows == 1 || columns == 1
     if !memo[[rows, columns]]
       memo[[rows, columns]] = unique_paths(rows - 1, columns, memo) + unique_paths(rows, columns - 1, memo)
      end
     return memo[[rows, columns]]
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the process of partitioning an array? " response
answer="To partition an array is to take a random value from the array called the pivot"
additional_feedback="

      To partition an array is to take a random value from the 
      array called the pivot

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   What is the process of partitioning an array? 

   To partition an array is to take a random value from the 
   array called the pivot

Enter the next line: " response
answer="then move every number less than the pivot to the left"
additional_feedback="

      To partition an array is to take a random value from the 
      array called the pivot, then move every number less than 
      the pivot to the left

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   What is the process of partitioning an array? 

   To partition an array is to take a random value from the 
   array called the pivot, then move every number less than 
   the pivot to the left

Enter the next line: " response
answer="and move every number greater than the pivot to the right."
additional_feedback="

      To partition an array is to take a random value from the 
      array called the pivot, then move every number less than 
      the pivot to the left and move every number greater than 
      the pivot to the right.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="If we sort the numbers, we know that the three greatest numbers will be at the 
end of the array"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array,
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="and we can just multiply them together. The sorting will take O(N log N)."
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="function greatestProductOf3(array) { }"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).

   function greatestProductOf3(array) { 
   
   }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="array.sort((a, b) => (a < b) ? -1 : 1);"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).

   function greatestProductOf3(array) { 
      array.sort((a, b) => (a < b) ? -1 : 1);
   }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="return array[array.length - 1]"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).

   function greatestProductOf3(array) { 
      array.sort((a, b) => (a < b) ? -1 : 1);

      return array[array.length - 1]
   }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="* array[array.length - 2]"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).

   function greatestProductOf3(array) { 
      array.sort((a, b) => (a < b) ? -1 : 1);

      return array[array.length - 1] * array[array.length - 2]
   }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Given an array of positive numbers, write a function that returns 
   the greatest product of any three numbers. The approach of using 
   three nested loops would clock in at O(N3), which is very slow. 
   Use sorting to implement the function in a way that it computes 
   at O(N log N) speed. (There are even faster implementations, but 
   we're focusing on using sorting as a technique to make code faster.)

Enter the next line: " response
answer="* array[array.length -3];"
additional_feedback="

   If we sort the numbers, we know that the three greatest numbers will be at the 
   end of the array, and we can just multiply them together. The sorting will take
   O(N log N).

   function greatestProductOf3(array) { 
      array.sort((a, b) => (a < b) ? -1 : 1);

      return array[array.length - 1] * array[array.length - 2] * array[array.length -3];
   }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="If we presort the array, we can then expect each number to be at its own index."
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="That is, the 0 should be at index 0, the 1 should be at index 1, and so on."
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="We can then iterate through the array looking for a number that doesn't equal the index."
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="Once we find it, we know that we just skipped over the missing number."
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="function findMissingNumber(array) { }"
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

   function findMissingNumber(array) { 
      
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="array.sort((a, b) => (a < b) ? -1 : 1);"
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

   function findMissingNumber(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="for (let i = 0; i < array.length; i++) { }"
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

   function findMissingNumber(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);

     for (let i = 0; i < array.length; i++) { 

     }
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="if (array[i] !== i) { return i; }"
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

   function findMissingNumber(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);

     for (let i = 0; i < array.length; i++) { 
       if (array[i] !== i) { 
          return i; 
       }
     }
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   The following function finds the “missing number” from an array 
   of integers. That is, the array is expected to have all integers 
   from 0 up to the array's length, but one is missing. As examples, 
   the array, [5, 2, 4, 1, 0] is missing the number 3, and the array, 
   [9, 3, 2, 5, 6, 7, 1, 0, 4] is missing the number 8. 
   
   Here's an implementation that is O(N2) (the includes method alone 
   is already O(N), since the computer needs to search the entire array 
   to find n):

   function findMissingNumber(array) {
      for (let i = 0; i < array.length; i++) {
         if (!array.includes(i)) {
            return i;
         }
      }

      return null;
   }

   Use sorting to write a new implementation of this function that only 
   takes O(N log N). (There are even faster implementations, but we're 
   focusing on using sorting as a technique to make code faster.)


Enter the next line: " response
answer="return null;"
additional_feedback="

   If we presort the array, we can then expect each number to be at its own index.
   That is, the 0 should be at index 0, the 1 should be at index 1, and so on.
   We can then iterate through the array looking for a number that doesn't equal 
   the index. Once we find it, we know that we just skipped over the missing number.

   function findMissingNumber(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);

     for (let i = 0; i < array.length; i++) { 
       if (array[i] !== i) { 
          return i; 
       }
     }
     return null;
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="This implementation uses nested loops and is O(N2)."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="function max(array) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

   function max(array) { 
      
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="for (let i = 0; i < array.length; i++) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

   function max(array) { 
    for (let i = 0; i < array.length; i++) {
    
    }     
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="let iIsGreatestNumber = true;"
additional_feedback="
   This implementation uses nested loops and is O(N2).

   function max(array) { 
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;  
    }     
   }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="for (let = 0; j < array.length; j++) { }"
additional_feedback="
  This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
         
      }
    }
  }      


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="if (array[j] > array[i]) { iIsGreatestNumber = false; }"
additional_feedback="
  This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        } 
      }
    }
  }      


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="if (iIsGreatestNumber) { return array[i]; }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }      


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="This implementation simply sorts the array and returns the last number. The sorting is O(N log N)."
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N).      


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="function max(array) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
      
   }     


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="array.sort((a, b) => (a < b) ? -1 : 1);"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
   }     


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="return array[array.length -1];"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="This implementation is O(N) as we loop once through the array."
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="This implementation is O(N) as we loop once through the array."
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="function max(array) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
      
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="let greatestNumberSoFar = array[0];"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
     let greatestNumberSoFar = array[0];
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="for (let i = 0; i < array.length; i++) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
     let greatestNumberSoFar = array[0];
     
     for (let i = 0; i < array.length; i++) { 
        
     }
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="if (array[i] > greatestNumberSoFar) { }"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
     let greatestNumberSoFar = array[0];
     
     for (let i = 0; i < array.length; i++) { 
       if (array[i] > greatestNumberSoFar) { 
          
       }
     }
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="greatestNumberSoFar = array[i];"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
     let greatestNumberSoFar = array[0];
     
     for (let i = 0; i < array.length; i++) { 
       if (array[i] > greatestNumberSoFar) { 
         greatestNumberSoFar = array[i];
       }
     }
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

   Write three different implementations of a function that finds 
   the greatest number within an array. Write one function that is 
   O(N2), one that is O(N log N), and one that is O(N).


Enter the next line: " response
answer="return greatestNumberSoFar;"
additional_feedback="
   This implementation uses nested loops and is O(N2).

  function max(array) {
    for (let i = 0; i < array.length; i++) {
      let iIsGreatestNumber = true;

      for (let = 0; j < array.length; j++) {
        if (array[j] > array[i]) {
          iIsGreatestNumber = false;
        }
      }
       if (iIsGreatestNumber) {
         return array[i];
       }
     }
   }

   This implementation simply sorts the array and returns the last number. 
   The sorting is O(N log N). 

   function max(array) { 
     array.sort((a, b) => (a < b) ? -1 : 1);
     return array[array.length -1];
   }     

   This implementation is O(N) as we loop once through the array.

   function max(array) { 
     let greatestNumberSoFar = array[0];
     
     for (let i = 0; i < array.length; i++) { 
       if (array[i] > greatestNumberSoFar) { 
         greatestNumberSoFar = array[i]; 
       }
     }
     return greatestNumberSoFar;
   }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"



next_question

read -p "What are nodes? " response
answer="Nodes are pieces of data that may be dispersed throughout the computer's memory."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the difference between a linked list and an array? " response
answer="The array is a contiguous block of memory, but the data from linked lists can be scattered across different cells throughout the computer's memory."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "If the nodes are not next to each other in memory, how does the 
         computer know which nodes are part of the same linked list? " response
answer="The node keeps a pointer to the next node's memory address. The pointer is called a link."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that prints all the elements of the list. " response
answer="def print"
additional_feedback="

   def print

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that prints all the elements of the list. " response
answer="current_node = first_node"
additional_feedback="

   def print
    current_node = first_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that prints all the elements of the list. " response
answer="while current_node"
additional_feedback="

   def print
    current_node = first_node

    while current_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that prints all the elements of the list. " response
answer="puts current_node.data"
additional_feedback="

   def print
    current_node = first_node

    while current_node
      puts current_node.data

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that prints all the elements of the list. " response
answer="current_node  = current_node.next_node"
additional_feedback="

   def print
    current_node = first_node

    while current_node
      puts current_node.data
      current_node  = current_node.next_node
     end
    end  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the DoublyLinkedList class that prints all the elements of the list in reverse order.  " response
answer="With a doubly linked list, we have immediate access to the last nodes and 
can follow their previous node links to access the previous nodes."
additional_feedback="

   With a doubly linked list, we have immediate access to the last nodes and 
   can follow their previous node links to access the previous nodes.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the DoublyLinkedList class that prints all the elements of the list in reverse order.  " response
answer="This code is simply the inverse of the previous exercise."
additional_feedback="

   With a doubly linked list, we have immediate access to the last nodes and 
   can follow their previous node links to access the previous nodes. This 
   code is simply the inverse of the previous exercise.

   def print_in_reverse
    current_node = first_node

    while current_node
      puts current_node.data
      current_node  = current_node.previous_node
     end
    end
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"
 
next_question

read -p "Add a method to the classic LinkedList class that returns the last element from the list. Assume you don't know how many elements are in the list. " response
answer="Use a while loop to move through each node. However, before we move forward"
additional_feedback="

   def last
    current_node = first_node

    while current_node.next_node
      current_node  = current_node.next_node
     end

      return current_node.data
    end

   Use a while loop to move through each node. However, before we move forward,
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Add a method to the classic LinkedList class that returns the last element from the list. Assume you don't know how many elements are in the list. " response
answer="we check ahead using the node's link to ensure that there is a next node."
additional_feedback="

   def last
    current_node = first_node

    while current_node.next_node
      current_node  = current_node.next_node
     end

      return current_node.data
    end

   Use a while loop to move through each node. However, before we move forward,
   we check ahead using the node's link to ensure that there is a next node.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="One way to reverse a classic linked list is to iterate through the list while keeping track of three variables."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="The primary variable is the current_node, which is the primary node we're iterating over."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="We also keep track of the next_node, which is the node immediately after the current_node."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="And we also keep track of the previous_node, which is the node immediately before the current_node."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="When we first begin and the current_node is the first node, the previous_node points to null; there are no nodes before the first node."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="Once we have our three variables set up, we proceed with our algorithm, which begins a loop."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="Inside the loop, we first change the current_node's link to point to the previous_node."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="Then, we shift all our variables to the right."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="We begin the loop again, repeating this process of changing the current_node's link to the point to the previous_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node,


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="until we reach the end of the list. Once we reach the end, the list will have been fully reversed."
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="def reverse!"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="previous_node = nil"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="current_node = first_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="while current_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="next_node = current_node.next_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node
       next_node = current_node.next_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="current_node.next_node = previous_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node
       next_node = current_node.next_node
       current_node.next_node = previous_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="previous_node = current_node"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node
       next_node = current_node.next_node
       current_node.next_node = previous_node

       previous_node = current_node

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="current_node = next_node end"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node
       next_node = current_node.next_node
       current_node.next_node = previous_node

       previous_node = current_node
       current_node = next_node
      end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Here's a tricky one. Add a method to the classic LinkedList class that reverses the list. That is, if the original list is A -> B -> C, all of the list's links should change so that C -> B -> A.  " response
answer="self.first_node = previous_node end"
additional_feedback="

   One way to reverse a classic linked list is to iterate through the list 
   while keeping track of three variables.

   The primary variable is the current_node, which is the primary node we're 
   iterating over. We also keep track of the next_node, which is the node 
   immediately after the current_node. And we also keep track of the previous_node, 
   which is the node immediately before the current_node.

   When we first begin and the current_node is the first node, the previous_node 
   points to null; there are no nodes before the first node.

   Once we have our three variables set up, we proceed with our algorithm, which 
   begins a loop.

   Inside the loop, we first change the current_node's link to point to the 
   previous_node.

   Then, we shift all our variables to the right.

   We begin the loop again, repeating this process of changing the current_node's 
   link to the point to the previous_node, until we reach the end of the list. Once 
   we reach the end, the list will have been fully reversed.

   def reverse!
     previous_node = nil
     current_node = first_node

     while current_node
       next_node = current_node.next_node
       current_node.next_node = previous_node

       previous_node = current_node
       current_node = next_node
      end

      self.first_node = previous_node
     end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="There are four nodes, but we only have access to node b."
additional_feedback="

   There are four nodes, but we only have access to node b.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="This means we don't have access to node a, since links only point forward in a classic linked list."
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="First, we take next node beyond the access node and copy its data into the access node, overwriting the access node's data."
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="In our example, this means copying the string c into our access node."
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="We then change the link of the access node and have it point to the node that is two nodes to the right of it."
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.

   We then change the link of the access node and have it point to the node 
   that is two nodes to the right of it.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="This effectively deletes the original c node."
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.

   We then change the link of the access node and have it point to the node 
   that is two nodes to the right of it. This effectively deletes the original 
   c node.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="def delete_middle_node(node)"
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.

   We then change the link of the access node and have it point to the node 
   that is two nodes to the right of it. This effectively deletes the original 
   c node.

   def delete_middle_node(node)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="node.data = node.next_node.data"
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.

   We then change the link of the access node and have it point to the node 
   that is two nodes to the right of it. This effectively deletes the original 
   c node.

   def delete_middle_node(node)
     node.data = node.next_node.data

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
      Here's a brilliant little linked list puzzle for you. Let's say you 
      have access to a node from somewhere in the middle of a classic linked 
      list, but not the linked list itself. That is, you have a variable that 
      points to an instance of Node, but you don't have access to the LinkedList 
      instance. In this situation, if you follow this node's link, you can find 
      all the items from this middle node until the end, but you have no way to 
      find the nodes that precede this node in the list. 

      Write code that will effectively delete this node from the list. The entire 
      remaining list should remain complete, with only this node removed.

Enter the next line: " response
answer="node.next_node = node.next_node.next_node"
additional_feedback="

   There are four nodes, but we only have access to node b. This means we 
   don't have access to node a, since links only point forward in a classic 
   linked list.

   First, we take next node beyond the access node and copy its data into the access 
   node, overwriting the access node's data. In our example, this means copying the 
   string c into our access node.

   We then change the link of the access node and have it point to the node 
   that is two nodes to the right of it. This effectively deletes the original 
   c node.

   def delete_middle_node(node)
     node.data = node.next_node.data
     node.next_node = node.next_node.next_node
    end

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

