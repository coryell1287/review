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

echo "

    ########################################
          Find Maximum in Sliding Window


          [-4, 2 -5, 3, 6]

          Step 1: For the first 3 elements in the window, max is 2.

          Step 2: Slide window one position to the right and max for window becomes 3.

          Step 3: In the last window, max is 66.


    ########################################
"

read -p "What is the runtime complexity for the previous solution? " response
answer="O(n) - Every element is pushed and popped from the deque only once in a single traversal."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the memory complexity for the previous solution? " response
answer="The memory complexity of this solution is linear, O(w), where ww is the window size in this case."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What data structure did the previous solution use? " response
answer="deque"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a deque? " response
answer="A deque is a double-ended queue in which push and pop operations work in O(1) at both ends."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How would you begin solving the sliding window problem? " response
answer="At the start of the algorithm, we search for the maximum value in the first window. The first element's index is pushed to the front of the deque."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What happens if the current elements is small? " response
answer="If an element is smaller than the one at the back of the queue, then the index of this element is pushed in and becomes the new back."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What happens if the current elements is large? " response
answer=" If the current element is larger, the back of the queue is popped repeatedly until we can find a higher value, and then we’ll push the index of the current element in as the new back."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the steps to solving the sliding window? " response
answer="Remove the indices of all elements from the back of the deque, which are smaller than or equal to the current element."
additional_feedback="

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    What are the steps to solving the sliding window? 

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.
    
    
Enter the next line: " response
answer="If the element no longer falls in the current window, remove the index of the element from the front."
additional_feedback="

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.

    * If the element no longer falls in the current window, remove 
      the index of the element from the front.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    What are the steps to solving the sliding window? 

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.
    
    * If the element no longer falls in the current window, remove 
      the index of the element from the front.
    
Enter the next line: " response
answer="Push the current element index at the back of the window."
additional_feedback="

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.
    
    * If the element no longer falls in the current window, remove 
      the index of the element from the front.

    * Push the current element index at the back of the window.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer="The index of the current maximum element is at the front."
additional_feedback="

    * Remove the indices of all elements from the back of the deque,
      which are smaller than or equal to the current element.
    
    * If the element no longer falls in the current window, remove 
      the index of the element from the front.

    * Push the current element index at the back of the window.

    * The index of the current maximum element is at the front.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Given a large array of integers and a window of size w, 
    find the current maximum value in the window as the window 
    slides through the entire array. 

    const array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    console.log(\"Array = \" + array);
    console.log(\"Max = \" + ffindMaxSlidingWindow(array, 3));

Enter the next line: " response
answer="function findMaxSlidingWindow(arr, windowSize) { }"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

echo "

    ########################################
          Find Maximum in Sliding Window

          Example 1:

          Input: [4, 0, 3, 1]
          Output: 2
          Example 2:

          Input: [8, 3, 5, 2, 4, 6, 0, 1]
          Output: 7

    ########################################
"

next_question

read -p "How do you begin to solve the above problem? " response
answer="This problem follows the Cyclic Sort pattern. Because the input array contains unique numbers from the range 0 to n, use a similar strategy as the Cyclic Sort to place the numbers on their correct index."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the next step in the strategy? " response
answer="Once every number is in its correct place, iterate the array to find the index which does not have the correct number, and that index will be the missing number."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How is this approach slightly different from the Cyclic Sort? " response
answer="In this problem, the numbers are ranged from 0 to n, compared to 1 to n in the Cyclic Sort."
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the implications of this strategy being different from the Cyclic Sort? " response
answer="In this problem, each number should be equal to its index, compared to index - 1 in the Cyclic Sort. Therefore => nums[i] == nums[nums[i]]"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the implications of this strategy being different from the Cyclic Sort? " response
answer="Because the array will have n numbers, which means array indices will range from 0 to n-1. Therefore, we will ignore the number n as we can't place it in the array, so => nums[i] < nums.length."
additional_feedback="

    * In this problem, each number should be equal to its index, compared to 
      index - 1 in the Cyclic Sort. Therefore => nums[i] == nums[nums[i]]

    * Because the array will have n numbers, which means array indices will 
      range from 0 to n-1. Therefore, we will ignore the number n as we can't 
      place it in the array, so => nums[i] < nums.length.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are the implications of this strategy being different from the Cyclic Sort? " response
answer="Because swapping the number at index i to place it at the correct index can still return the wrong number at index i, don't move to the next number after the swap until the correct number at the index i is found."
additional_feedback="

    * In this problem, each number should be equal to its index, compared to 
      index - 1 in the Cyclic Sort. Therefore => nums[i] == nums[nums[i]]

    * Because the array will have n numbers, which means array indices will 
      range from 0 to n-1. Therefore, we will ignore the number n as we can't 
      place it in the array, so => nums[i] < nums.length.

    * Because swapping the number at index i to place it at the correct index 
      can still return the wrong number at index i, don't move to the next number 
      after the swap until the correct number at the index i is found.

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    console.log(find_missing_number([4, 0, 3, 1]));
    console.log(find_missing_number([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="function findMissingNumber(nums) { }"
additional_feedback="

    function findMissingNumber(nums) { 

    }

    console.log(find_missing_number([4, 0, 3, 1]));
    console.log(find_missing_number([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 

    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="let i = 0;"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
    }

    console.log(find_missing_number([4, 0, 3, 1]));
    console.log(find_missing_number([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="const n = nums.length;"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="while (i < n) { }"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 

        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 

        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="j = nums[i];"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];

        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];

        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="if (nums[i] < n && nums[i] !== nums[j]) { }"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 

          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 

          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="[nums[i], nums[j]] = [nums[j], nums[i]];"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 
            [nums[i], nums[j]] = [nums[j], nums[i]];  
          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));   

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 

          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="else { i += 1; }"
additional_feedback="

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 
            [nums[i], nums[j]] = [nums[j], nums[i]];  
          } else {
            i += 1; 
          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
        let i = 0;
        const n = nums.length;

        while (i < n) { 
          j = nums[i];
          if (nums[i] < n && nums[i] !== nums[j]) { 
            [nums[i], nums[j]] = [nums[j], nums[i]];  
          } else {
            i += 1; 
          }
        }
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="for (i = 0; i < n; i++) { }"
additional_feedback="

    function findMissingNumber(nums) { 
      let i = 0;
      const n = nums.length;

      while (i < n) { 
        j = nums[i];
        if (nums[i] < n && nums[i] !== nums[j]) { 
          [nums[i], nums[j]] = [nums[j], nums[i]];  
        } else {
          i += 1; 
        }
      }
    }

    for (i = 0; i < n; i++) { 
        
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Given an array containing n distinct numbers taken from the range 0 to n. 
    Since the array has only n numbers out of the total n+1 numbers, find the 
    missing number. 

    function findMissingNumber(nums) { 
      let i = 0;
      const n = nums.length;

      while (i < n) { 
        j = nums[i];
        if (nums[i] < n && nums[i] !== nums[j]) { 
          [nums[i], nums[j]] = [nums[j], nums[i]];  
        } else {
          i += 1; 
        }
      }
      
      for (i = 0; i < n; i++) { 
            
      }
    }


    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

Enter the next line: " response
answer="if (nums[i] !== i) { return i; } return n;"
additional_feedback="

    function findMissingNumber(nums) { 
      let i = 0;
      const n = nums.length;

      while (i < n) { 
        j = nums[i];
        if (nums[i] < n && nums[i] !== nums[j]) { 
          [nums[i], nums[j]] = [nums[j], nums[i]];  
        } else {
          i += 1; 
        }
      }
     
      for (i = 0; i < n; i++) { 
        if (nums[i] !== i) { 
          return i; 
        } 
      }

      return n;
    }

    console.log(findMissingNumber([4, 0, 3, 1]));
    console.log(findMissingNumber([8, 3, 5, 2, 4, 6, 0, 1]));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p " " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"




