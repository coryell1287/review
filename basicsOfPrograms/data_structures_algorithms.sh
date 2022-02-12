


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

read -p "This is because Version 1 ends up looping 100 times" response
read -p "This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times." response
read -p "This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times. The first version then, takes twice as many steps as the second version." response
read -p "This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times. The first version then, takes twice as many steps as the second version. This is because Version 1 ends up looping 100 times" response
read -p "This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times. The first version then, takes twice as many steps as the second version. This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times." response
read -p "This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times. The first version then, takes twice as many steps as the second version.This is because Version 1 ends up looping 100 times, while Version 2 only loops 50 times. The first version then, takes twice as many steps as the second version." response
answer=""
additional_feedback
evaluate_answer "$response" "$answer"


Wengrow, Jay A Common-Sense Guide to Data Structures and Algorithms, Second Edition . Pragmatic Bookshelf. Kindle Edition. 


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

read -p " " response
answer=""
evaluate_answer "$response" "$answer"   



