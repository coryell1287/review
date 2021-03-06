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
    echo "    You scored $score% on Python Linked list."
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

evaluate_answer_written_with_code() {
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

evaluate_answer_written_with_code_written_with_code() {
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
read -p "
    Implement a function that removes all the even elements from a given list. Name it remove_even(lst).

    def remove_even(lst):

    # Enter code line by line unitl the solution is complete.

    print(remove_even([3, 2, 41, 3, 34]))

Enter code here: " response
answer="odds = []"
additional_feedback="

    def remove_even(lst):
        odds = []  # Create a new empty list

    print(remove_even([3, 2, 41, 3, 34]))

"
evaluate_answer_written_with_code_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Implement a function that removes all the even elements from a given list. Name it remove_even(lst).

    def remove_even(lst):
        odds = []  # Create a new empty list
   

    print(remove_even([3, 2, 41, 3, 34]))

Enter code here: " response
answer="for number in lst:"
additional_feedback="

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:

    print(remove_even([3, 2, 41, 3, 34]))

"
evaluate_answer_written_with_code_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Implement a function that removes all the even elements from a given list. Name it remove_even(lst).

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:

    print(remove_even([3, 2, 41, 3, 34]))

Enter code here: " response
answer="if number % 2 != 0:"
additional_feedback="

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:
             if number % 2 != 0:

    print(remove_even([3, 2, 41, 3, 34]))

"
evaluate_answer_written_with_code_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Implement a function that removes all the even elements from a given list. Name it remove_even(lst).

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:
             if number % 2 != 0:

    print(remove_even([3, 2, 41, 3, 34]))

Enter code here: " response
answer="odds.append(number)"
additional_feedback="

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:
             if number % 2 != 0:
                odds.append(number)

    print(remove_even([3, 2, 41, 3, 34]))

"
evaluate_answer_written_with_code_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Implement a function that removes all the even elements from a given list. Name it remove_even(lst).

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:
             if number % 2 != 0:
                odds.append(number)

    print(remove_even([3, 2, 41, 3, 34]))

Enter code here: " response
answer="odds.append(number)"
additional_feedback="

    def remove_even(lst):
        odds = []  # Create a new empty list
        for number in lst:  # Iterate over input list
            # Check if the item in the list is NOT even
            # ('%' is the modulus symbol!)
            if number % 2 != 0:
                odds.append(number)  # If it isn't even append it to the empty list
        return odds  # Return the new list


    print(remove_even([3, 2, 41, 3, 34]))

"
evaluate_answer_written_with_code_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the time complexity of the previous solution? " response
answer="Because the entire list has to be iterated over, this solution is in O(n) time."
evaluate_answer_written_with_code "$response" "$answer"

next_question

read -p "How do you solve the previous question using list comprehension? " response
answer="[number for number in lst if number % 2 != 0]"
additional_feedback="

    def remove_even(lst):
        return [number for number in lst if number % 2 != 0]

    print(remove_even([3, 2, 41, 3, 34]))
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the time complexity of the previous solution? " response
answer="The time complexity of this solution is also O(n), since only the syntax has changed while the algorithm still iterates over all elements of the list."
evaluate_answer_written_with_code "$response" "$answer"

next_question

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        # Write your code here
        pass

Enter your code here: " response
answer="index_arr1 = 0"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0


Enter your code here: " response
answer="index_arr2 = 0"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0


Enter your code here: " response
answer="index_result = 0"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0

Enter your code here: " response
answer="result = []"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

Enter your code here: " response
answer="for i in range(len(lst1)+len(lst2)):"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):


Enter your code here: " response
answer="result.append(i)"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)

Enter your code here: " response
answer="while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):

Enter your code here: " response
answer="if (lst1[index_arr1] < lst2[index_arr2]):"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):

Enter your code here: " response
answer="result[index_result] = lst1[index_arr1]"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]

Enter your code here: " response
answer="index_result += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1

Enter your code here: " response
answer="index_arr1 += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1

Enter your code here: " response
answer="else:"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:

Enter your code here: " response
answer="result[index_result] = lst2[index_arr2]"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]


Enter your code here: " response
answer="index_result += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1

Enter your code here: " response
answer="index_arr2 += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
      

Enter your code here: " response
answer="while (index_arr1 < len(lst1)):"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            

Enter your code here: " response
answer="result[index_result] = lst1[index_arr1]"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]

Enter your code here: " response
answer="index_result += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1

Enter your code here: " response
answer="index_arr1 += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1

Enter your code here: " response
answer="while (index_arr2 < len(lst2)):"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):

Enter your code here: " response
answer="result[index_result] = lst2[index_arr2]"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
        
Enter your code here: " response
answer="index_result += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
            index_result += 1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
            index_result += 1
        
Enter your code here: " response
answer="index_arr2 += 1"
additional_feedback="

     def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
            index_result += 1
            index_arr2 += 1
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
Implement a function that merges two sorted lists of m and n elements respectively, 
into another sorted list. Name it merge_lists(lst1, lst2).

    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
            result[index_result] = lst2[index_arr2]
            index_result += 1
        
Enter your code here: " response
answer="return result"
additional_feedback="
# Merge list1 and list2 and return resulted list
    def merge_lists(lst1, lst2):
        index_arr1 = 0
        index_arr2 = 0
        index_result = 0
        result = []

        for i in range(len(lst1)+len(lst2)):
            result.append(i)
        # Traverse Both lists and insert smaller value from arr1 or arr2
        # into result list and then increment that lists index.
        # If a list is completely traversed, while other one is left then just
        # copy all the remaining elements into result list
        while (index_arr1 < len(lst1)) and (index_arr2 < len(lst2)):
            if (lst1[index_arr1] < lst2[index_arr2]):
                result[index_result] = lst1[index_arr1]
                index_result += 1
                index_arr1 += 1
            else:
                result[index_result] = lst2[index_arr2]
                index_result += 1
                index_arr2 += 1
        while (index_arr1 < len(lst1)):
            result[index_result] = lst1[index_arr1]
            index_result += 1
            index_arr1 += 1
        while (index_arr2 < len(lst2)):
            result[index_result] = lst2[index_arr2]
            index_result += 1
            index_arr2 += 1
        return result


    print(merge_lists([4, 5, 6], [-2, -1, 0, 7]))



    The solution above is a more intuitive way to solve this problem. Start by 
    creating a new empty list. This list will be filled with all the elements of 
    both lists in sorted order and returned. Then initialize three variables to 
    zero to store the current index of each list. Then compare the elements of the 
    two given lists at the current index of each, append the smaller one to the new 
    list and increment the index of that list by 1. Repeat until the end of one of 
    the lists is reached and append the other list to the merged list.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the time complexity of the previous solution? " response
answer="The time complexity for this algorithm is O(n+m) where n and m are the lengths of the lists. This is because both lists are iterated over at least once."
evaluate_answer "$response" "$answer"

next_question

read -p "Write a program that get items a through c in the list. 

    l = ['a', 'b', 'c', 'd', 'e']

Enter the line: " response
answer="print(l[0:3])"
additional_feedback="

    l = ['a', 'b', 'c', 'd', 'e']
    print(l[0:3])
    // ['a', 'b', 'c']
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Concatenate items in a list. " response
answer="print([1,2] + [3,4])"
evaluate_answer "$response" "$answer"

next_question

read -p "Iterate over items in a list

    l=[1, 2, 4, 8, 10]
    

Enter the next line: " response
answer="for val in l: print(val)"
additional_feedback="

    l=[1, 2, 4, 8, 10]
    for val in l:
       print(val)

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Write a program that get items a through c in the list. " response
answer=""
evaluate_answer "$response" "$answer"
