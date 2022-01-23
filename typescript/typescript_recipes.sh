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

read -p "


        Sort the list in descending order.


        
        let artists = [
            'John White Abbott',
            'Leonardo da Vinci',
            'Charles Aubry',
            'Anna Atkins',
            'Barent Avercamp'
        ];


Enter your answer: " response
answer="a === b ? 0 : a > b ? -1 : 1"
additional_feedback="
    let artists = [
        'John White Abbott',
        'Leonardo da Vinci',
        'Charles Aubry',
        'Anna Atkins',
        'Barent Avercamp'
    ];

    artists.sort(function (a, b) {
        return a === b ? 0 : a > b ? -1 : 1;
    });
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What would be the output of the following code?

    let ages = [2, 1000, 10, 3, 23, 12, 30, 21];

    ages.sort();
    console.log(ages);

Enter your answer: " response
answer="10, 1000, 12, 2, 21, 23, 3, 30"
evaluate_answer "$response" "$answer"

next_question

read -p "In the previous answer, why did the program output those results? " response
answer="Because with the default sort(), elements are converted to strings and compared in UTF-16 code units order."
evaluate_answer "$response" "$answer"

next_question

read -p "How would you properly sort the previous example in ascending order? 

    ages.sort(function (a, b) {
       
    });


Enter your answer: " response
answer="a - b"
additional_feedback="
    
    ages.sort(function (a, b) {
       return a - b;
    });

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Sort the following array in descending order by dob. 

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

Enter the next line: " response
answer="users.sort((a, b) => +new Date(b.dob) - +new Date(a.dob));"
additional_feedback="

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort((a, b) => +new Date(b.dob) - +new Date(a.dob));
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Sort the names in ascending order. 

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];
    

Enter the next line: " response
answer="users.sort(function (a, b) { });"
additional_feedback="

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort(function (a, b) { 

    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Sort the names in ascending order. 

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort(function (a, b) { 

    });

Enter the next line: " response
answer="return a.name === b.name ? 0 : a.name > b.name ? 1 : -1;"
additional_feedback="
    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort(function (a, b) { 
       return a.name === b.name ? 0 : a.name > b.name ? 1 : -1;
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Write a program that uses Navigator.clipboard to copy text from an input field. " response
answer="document.getElementById('copy').onclick = function () { }"
additional_feedback="

    document.getElementById('copy').onclick = function () { 

    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a program that uses Navigator.clipboard to copy text from an input field. 

    document.getElementById('copy').onclick = function () { 

    }


Enter the next line: " response
answer="const text: string = (document.getElementById('input') as HTMLInputElement).value;"
additional_feedback="
    document.getElementById('copy').onclick = function () { 
       const text: string = (document.getElementById('input') as HTMLInputElement).value;
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a program that uses Navigator.clipboard to copy text from an input field. 

    document.getElementById('copy').onclick = function () { 

       const text: string = (document.getElementById('input') as HTMLInputElement).value;
    }


Enter the next line: " response
answer="navigator.clipboard.writeText(text)"
additional_feedback="
    document.getElementById('copy').onclick = function () { 

       const text: string = (document.getElementById('input') as HTMLInputElement).value;
       navigator.clipboard
          .writeText(text)
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a program that uses Navigator.clipboard to copy text from an input field. 

    document.getElementById('copy').onclick = function () { 

       const text: string = (document.getElementById('input') as HTMLInputElement).value;
       navigator.clipboard
          .writeText(text)
    }


Enter the next line: " response
answer=".then(() => { console.log('clipped'); }).catch(() => { console.error('failed'); });"
additional_feedback="
    document.getElementById('copy').onclick = function () { 

       const text: string = (document.getElementById('input') as HTMLInputElement).value;
       navigator.clipboard
          .writeText(text)
          .then(() => {
              console.log('clipped');
           }).catch(() => {
              console.error('failed')
          });
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Write a  program to convert a comma-separated values (CSV) string to a 2D array. 

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];


Enter the next line: " response
answer="interface Data { col1: string; col2: string; }"
additional_feedback="

    interface Data {
      col1: string;
      col2: string;
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="type DataKey = keyof Data;"
additional_feedback="

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="function csvToJson(data: string, delimiter = ','): Data[] { }"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 

    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="const titles = data.slice(0, data.indexOf('\\n')).split(delimiter) as DataKey[];"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(delimiter) as DataKey[];
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(delimiter) as DataKey[];
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="return data.slice(data.indexOf('\n') + 1)"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
            .slice(data.indexOf('\n') + 1)
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
            .slice(data.indexOf('\n') + 1)
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer=".split('\n')"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer=".map(function (v) { });"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) {

          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) {

          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="const values = v.split(delimiter);"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) { 
              const values = v.split(delimiter);
          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];        
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) { 
              const values = v.split(delimiter);
          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="return titles.reduce(function (obj: Data, title: DataKey, index: number) { }, {} as Data);"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) { 
              const values = v.split(delimiter);
              return titles.reduce(function (obj: Data, title: DataKey, index: number) { 

              }, {} as Data);
          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a  program to convert a comma-separated values (CSV) string to a 2D array.

    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) { 
              const values = v.split(delimiter);
              return titles.reduce(function (obj: Data, title: DataKey, index: number) { 

              }, {} as Data);
          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="return (obj[title] = values[index], obj);"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ','): Data[] { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];

        return data
          .slice(data.indexOf('\n') + 1)
          .split('\n')
          .map(function (v) { 
              const values = v.split(delimiter);
              return titles.reduce(function (obj: Data, title: DataKey, index: number) { 
                  return (obj[title] = values[index], obj);
              }, {} as Data);
          });
    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Write a function that removes a duplicate string value. " response
answer="arr.filter((item, index) => arr.indexOf(item) === index);"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Calculate the total price of the items.

    const cart = [
      { name: 'Soda', price: 3.12 },
      { name: 'Margarita', price: 12.99 },
      { name: 'Beer', price: 6.50 }
    ];

Enter your answer: " response
answer="const totalPrice = cart.reduce((acc, next) => acc + next.price, 0);"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Calculate the most expensive items.

    const cart = [
      { name: 'Soda', price: 3.12 },
      { name: 'Margarita', price: 12.99 },
      { name: 'Beer', price: 6.50 }
    ];

Enter your answer: " response
answer="const mostExpensiveItem = cart.reduce((acc, next) => acc.price > next.price ? acc : next);"
evaluate_answer "$response" "$answer"

next_question

read -p "Write a program that generates random color is hexadecimals. " response
answer="const color = '#'+Math.random().toString(16).slice(-6);"
evaluate_answer "$response" "$answer"

next_question

read -p "Check for duplicate before adding it to an array. " response
answer="if (!arr.includes(item)) { arr.push(item); }"
additional_feedback="
    const arr = ['hamber', 'coal'];
    const item = 'coal';
    if (!arr.includes(item)) {
        arr.push(item);
     }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Write an function to iterate over an array and remove items 
    referenced in the second array.

    const s1 = [ 1, 2, 3, 4, 5 ];
    const s2 = [ 2, 4 ];
    
    console.log(subtracted) //[ 1, 3, 5 ]

Enter your answer: " response
answer="const subtracted = s1.filter(x => s2.indexOf(x) < 0);"
additional_feedback="
    const s1 = [ 1, 2, 3, 4, 5 ];
    const s2 = [ 2, 4 ];
    
    const subtracted = s1.filter(x => s2.indexOf(x) < 0);
    console.log(subtracted) //[ 1, 3, 5 ]

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Write an interface that changes the string type to a number. 

     interface A {
       x: string;
     }

Enter your answer: " response
answer="interface B extends Omit<A, 'x'> { x: number; }"
additional_feedback="
    interface A {
       x: string;
     }

    interface B extends Omit<A, 'x'> {
       x: number;
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Write a function to conditional check for the properties associated with the interfaces.

    interface IObjectYo {
      someProp: number;
      same: boolean;
    }

    interface IDifObjYo {
      otherProp: number;
      same: boolean;
    }

    function example(someArg: IObjectYo | IDifObjYo) {
    
    }

Enter your answer: " response
answer="if ('someProp' in someArg) { console.log(someArg.someProp); } else { console.log(someArg.otherProp); } if ('same' in someArg) { console.log(someArg.someProp); }"
additional_feedback="

    function example(someArg: IObjectYo | IDifObjYo) {
       if ('someProp' in someArg) {
         console.log(someArg.someProp); // tsc knows it must be type IObjectYo because someProp only belongs to IObjectYo
       } else {
         console.log(someArg.otherProp); // tsc knows this is IDifObjYo because the first condition failed (which means it must be of type IDifObjYo)
       }

       if ('same' in someArg) {
          console.log(someArg.someProp); // make sure the property is indeed unique between the possible types or tsc can't infer
       }
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Write a strongly-type function for the following code.

    const size = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="type Breakpoints = { small: number; medium: number; large: number; extra: number; };"
additional_feedback="

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a strongly-type function for the following code.

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];"
additional_feedback="
    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

    Write a strongly-type function for the following code. 

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="type Stringify<T> = { [key in keyof T]?: string; };"
additional_feedback="
    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    
    Write a strongly-type function for the following code.

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200,
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

     const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="interface CustomObject extends ObjectConstructor { }"
additional_feedback="
    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor { 

    }

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    
    Write a strongly-type function for the following code.

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor { 

    }

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="entries<K extends keyof Breakpoints, T>(o: { [s in K]: T } | ArrayLike<T>): [K, T][];"
additional_feedback="

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor {
      entries<K extends keyof Breakpoints, T>(
        o: { [s in K]: T } | ArrayLike<T>
      ): [K, T][];
    }

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    
    Write a strongly-type function for the following code.

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor {
      entries<K extends keyof Breakpoints, T>(
        o: { [s in K]: T } | ArrayLike<T>
      ): [K, T][];
    }

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="const obj: CustomObject = Object;"
additional_feedback="
    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor {
      entries<K extends keyof Breakpoints, T>(
        o: { [s in K]: T } | ArrayLike<T>
      ): [K, T][];
    }
    
    // Let's use this interface now:
    const obj: CustomObject = Object;

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    
    Write a strongly-type function for the following code.

    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor {
      entries<K extends keyof Breakpoints, T>(
        o: { [s in K]: T } | ArrayLike<T>
      ): [K, T][];
    }
    
    // Let's use this interface now:
    const obj: CustomObject = Object;

    const mediaQueries = Object.keys(size).reduce((acc, cur) => {
       const [key, value] = cur;
       acc[key] = \`(min-width: \${value}px)\`;
       return acc;
    }, {});

Enter your answer: " response
answer="const mediaQueries = obj.entries(size).reduce<Stringify<Breakpoints>>((acc, cur: BreakpointEntry) => { }, {});"
additional_feedback="
    type Breakpoints = {
      small: number;
      medium: number;
      large: number;
      extra: number;
    };

    const size: Breakpoints = {
      small: 576,
      medium: 768,
      large: 992,
      extra: 1200
    };

    // Type of entry after Object.entries() is used
    type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

    // Generic helper to make all of the properties' types: string | undefined
    type Stringify<T> = { [key in keyof T]?: string; };

    interface CustomObject extends ObjectConstructor {
      entries<K extends keyof Breakpoints, T>(
        o: { [s in K]: T } | ArrayLike<T>
      ): [K, T][];
    }
    
    // Let's use this interface now:
    const obj: CustomObject = Object;

    const mediaQueries = obj
      .entries(size)
      .reduce<Stringify<Breakpoints>>((acc, cur: BreakpointEntry) => {
        const [key, value] = cur;
        acc[key] = \`(min-width: \${value}px)\`;

        return acc;
      }, {});

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a program that takes a csv and returns an array. 

  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));
  
Enter the next line: " response
answer="const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );

   console.log(csvToArray('a,b\nc,d')); 
   console.log(csvToArray('a;b\nc;d', ';')); 
   console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );

  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));

Enter the next line: " response
answer="data.slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)

  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)
  
  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));
  
Enter the next line: " response
answer=".split('\n')"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)
      .split('\n')

  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)
      .split('\n')

  console.log(csvToArray('a,b\nc,d')); 
  console.log(csvToArray('a;b\nc;d', ';')); 
  console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));
  
Enter the next line: " response
answer=".map(v => v.split(delimiter));"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)
      .split('\n')
      .map(v => v.split(delimiter));

      console.log(csvToArray('a,b\nc,d')); 
      console.log(csvToArray('a;b\nc;d', ';')); 
      console.log(csvToArray('head1,head2\na,b\nc,d', ',', true));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


Enter the next line: " response
answer="interface Data { x: number; y: number; z: number; }"
additional_feedback="

  interface Data {
    x: number;
    y: number;
    z: number;
  }


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


Enter the next line: " response
answer="type DataKey = keyof Data;"
additional_feedback="

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="const jsonToCsv = (arr: Data[], delimiter = ','): string => { };"
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 

  };

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 

  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="const headings = Object.keys(arr[0]) as DataKey[];"
additional_feedback="
   interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];
  };

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="return [].join('');"
additional_feedback="

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [].join('');
  };

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="headings.join(delimiter)"
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter)
    ].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter)
    ].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="...arr.map((obj) => )"
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter),
      ...arr.map((obj) =>
     
      )
    ].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter),
      ...arr.map((obj) =>
     
      )
    ].join('');
  };

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

Enter the next line: " response
answer="headings.reduce((acc, key: DataKey) => )"
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter),
      ...arr.map((obj) =>
        headings.reduce((acc, key: DataKey) => 

        )
      )
    ].join('');
  };

  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to convert an array of objects to a comma-separated values (CSV) string. 

  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter),
      ...arr.map((obj) =>
        headings.reduce((acc, key: DataKey) => 

        )
      )
    ].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1


Enter the next line: " response
answer="\`\${acc}\${!acc.length ? '' : delimiter}\${!obj[key] ? '' : obj[key]}\`, ''"
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

  type DataKey = keyof Data;

  const jsonToCsv = (arr: Data[], delimiter = ','): string => { 
    const headings = Object.keys(arr[0]) as DataKey[];

    return [
      headings.join(delimiter),
      ...arr.map((obj) =>
        headings.reduce((acc, key: DataKey) => 
          \`\${acc}\${!acc.length ? '' : delimiter}\${!obj[key] ? '' : obj[key]}\`,
        ''
        )
      )
    ].join('');
  };


  console.log(
    jsonToCsv([
      { x: 100, y: 200, z: 200 },
      { x: 300, y: 400, z: 500 },
      { x: 6, y: 40, z: 50 },
      { x: 16, y: 88, z: 1 },
    ])
  );

  // x,y,z
  // 100,200,200
  // 300,400,500
  // 6,40,50
  // 16,88,1

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  const update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

Enter the next line: " response
answer="interface Update { status: string; message: string; }"
additional_feedback="

  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

Enter the next line: " response
answer="function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { }"
additional_feedback="

  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 

  }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 

  }

Enter the next line: " response
answer="return target in obj"
additional_feedback="

  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
  }

Enter the next line: " response
answer="? obj[target]"
additional_feedback="

  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
  }

Enter the next line: " response
answer=": Object.values(obj).reduce((acc, val) => { }, undefined);"
additional_feedback="

  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
      : Object.values(obj).reduce((acc, val) => { 

      }, undefined);
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a  program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
      : Object.values(obj).reduce((acc, val) => { 
          
      }, undefined);
  }

Enter the next line: " response
answer="if (acc !== undefined) return acc;"
additional_feedback="
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
      : Object.values(obj).reduce((acc, val) => { 
          if (acc !== undefined) return acc;
      }, undefined);
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to target a given value in a nested JSON object. 
  
  interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
      : Object.values(obj).reduce((acc, val) => { 
          if (acc !== undefined) return acc;
      }, undefined);
  }

Enter the next line: " response
answer="if (typeof val === 'object') return getValueFromKey(val, target);"
additional_feedback="
    interface Update { 
    status: string; 
    message: string; 
  }

  const update: Update = {
    status: 'success',
    message: 'https://images.dog.ceo/breeds/african/n02116738_1105.jpg',
  };

  function getValueFromKey<T, K extends keyof T>(obj: T, target: K): K { 
    return target in obj
      ? obj[target]
      : Object.values(obj).reduce((acc, val) => { 
          if (acc !== undefined) return acc;
          if (typeof val === 'object') return getValueFromKey(val, target);
      }, undefined);
  }

  console.log(dig(update, 'status'));
  console.log(dig(update, 'message'));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  const customer = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="interface CustomerDetails { name: string; job: string; shoeSize: number; }"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');

  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="type DetailKeys = keyof CustomerDetails;"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="interface RenamedAttributes extends CustomerDetails { firstName: string; actor: string; }"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="type ObjectKeys<T> = T extends object ? (keyof T)[] : T extends number ? [] : T extends Array<any> | string ? string[] : never;"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="interface ObjectConstructor { keys<T>(o: T): ObjectKeys<T> }"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program to replace the names of multiple object keys with the values provided. 

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { }"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { 

  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

  Write a program to replace the names of multiple object keys with the values provided.

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { 

  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="return Object.keys(details).reduce(function (acc, key: DetailKeys) { }, {} as RenamedAttributes);"
additional_feedback="
  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { 
    return Object.keys(details).reduce(function (acc, key: DetailKeys) { 
      
    }, {} as RenamedAttributes);
  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

  Write a program to replace the names of multiple object keys with the values provided.

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { 
    return Object.keys(details).reduce(function (acc, key: DetailKeys) { 
      
    }, {} as RenamedAttributes);
  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);

Enter the next line: " response
answer="return { ...acc, [keyMap[key] ?? key]: details[key] }"
additional_feedback="

  interface CustomerDetails { 
    name: string; 
    job: string; 
    shoeSize: number; 
  }

  type DetailKeys = keyof CustomerDetails;

  interface RenamedAttributes extends CustomerDetails { 
    firstName: string; 
    actor: string; 
  }

  type ObjectKeys<T> = 
    T extends object ? (keyof T)[] :
    T extends number ? [] :
    T extends Array<any> | string ? string[] :
    never;

  interface ObjectConstructor { 
    keys<T>(o: T): ObjectKeys<T> 
  }

  function renameKeys(keyMap: Partial<CustomerDetails>, details: CustomerDetails) { 
    return Object.keys(details).reduce(function (acc, key: DetailKeys) { 
      return { 
        ...acc, 
        [keyMap[key] ?? key]: details[key] 
      }
    }, {} as RenamedAttributes);
  }


  const customer: CustomerDetails = { name: 'Bobo', job: 'Programmer', shoeSize: 100 };

  console.log('Original Object');
  console.log(customer);

  console.log('-------------------------------------');

  const result = renameKeys({ name: 'firstName', job: 'actor' }, customer);
  console.log('New Object');
  
  console.log(result);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

Enter the next line: " response
answer="interface Items { id: number; value: string; }"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );.
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  interface Items { 
    id: number; 
    value: string; 
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

Enter the next line: " response
answer="interface CompareFunc { (a: Items, b: Items): boolean; }"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )  
  );

Enter the next line: " response
answer="function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { }"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 

  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 

  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

Enter the next line: " response
answer="return arr.filter(function (v, i) { });"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 
    return arr.filter(function (v, i) { 

    });
  }
  
  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 
    return arr.filter(function (v, i) { 

    });
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

Enter the next line: " response
answer="return arr.every(function (x, j) { });"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 
    return arr.filter(function (v, i) { 
      return arr.every(function (x, j) { 

      });
    });
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that finds the unique item.

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 
    return arr.filter(function (v, i) { 
      return arr.every(function (x, j) { 

      });
    });
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

Enter the next line: " response
answer="return (i === j) === fn(v, x);"
additional_feedback="

  interface Items { 
    id: number; 
    value: string; 
  }

  interface CompareFunc { 
    (a: Items, b: Items): boolean; 
  }

  function findUniqueItem(arr: Items[], fn: CompareFunc): Items[] { 
    return arr.filter(function (v, i) { 
      return arr.every(function (x, j) { 
        return (i === j) === fn(v, x);
      });
    });
  }

  console.log(
    findUniqueItem(
      [
        { id: 0, value: 'a' },
        { id: 1, value: 'b' },
        { id: 2, value: 'c' },
        { id: 1, value: 'd' },
        { id: 0, value: 'e' },
      ],
      (a, b) => a.id == b.id
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="type Comp = { (x: number, y: number): boolean; };"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="function findCommonElements(a: number[], b: number[], comp: Comp) { }"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 

  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 

  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="return Array.from();"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(

    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(

    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="new Set()"
additional_feedback="
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(

      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(

      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="([] as number[]).concat()"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(
        ([] as number[]).concat(

        )
      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(
        ([] as number[]).concat(

        )
      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );
  

Enter the next line: " response
answer="a, b.filter(function (x) { })"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(
        ([] as number[]).concat(
          a, 
          b.filter(function (x) { 

          })
        )
      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
  Write a program to find every element that exists in any of the two given arrays once, using a provided comparator function.
  
  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(
        ([] as number[]).concat(
          a, 
          b.filter(function (x) { 

          })
        )
      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

Enter the next line: " response
answer="return ( a.findIndex(function (y) { return comp(x, y); }) === -1 )"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(
      new Set(
        ([] as number[]).concat(
          a, 
          b.filter(function (x) { 
            return ( 
              a.findIndex(function (y) { 
                return comp(x, y); 
              }) === -1 
             )
          })
        )
      )
    );
  }

  console.log(
    findCommonElements(
      [1, 1.2, 1.5, 3, 0],
      [1.9, 3, 0, 3.9],
      (a, b) => Math.round(a) === Math.round(b)
    )
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  let output = 0;
  Array(1e6).forEach(function (_, i) {
    output += i;
  });

Write a program to measure the time taken by a function to execute. " response
answer="console.time('Execution time'); console.timeEnd('Execution time');"
additional_feedback="

  console.time('Execution time');

  let output = 0;
  Array(1e6).forEach(function (_, i) {
    output += i;
  });

  console.timeEnd('Execution time');

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function where the first function's parameters are functions 
  in the form of a rest operator, then iterates, invoking each function with 
  arguments passed from the inner function and returns the results. 

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="type Procedure = (...args: any[]) => number;"
additional_feedback="

  type Procedure = (...args: any[]) => number;

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function where the first function's parameters are functions 
  in the form of a rest operator, then iterates, invoking each function with 
  arguments passed from the inner function and returns the results. 


  type Procedure = (...args: any[]) => number;

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="function over<F extends Procedure>(...fns: F[]) { }"
additional_feedback="

  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 

  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function where the first function's parameters are functions 
  in the form of a rest operator, then iterates, invoking each function with 
  arguments passed from the inner function and returns the results. 


  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 

  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="return function (...args: Parameters<F>) { }"
additional_feedback="
  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 
    return function (...args: Parameters<F>) { 

    }
  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function where the first function's parameters are functions 
  in the form of a rest operator, then iterates, invoking each function with 
  arguments passed from the inner function and returns the results.  


  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 
    return function (...args: Parameters<F>) { 

    }
  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="return fns.map(function (fn) { });"
additional_feedback="

  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 
    return function (...args: Parameters<F>) { 
      return fns.map(function (fn) { 

      });
    }
  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function where the first function's parameters are functions 
  in the form of a rest operator, then iterates, invoking each function with 
  arguments passed from the inner function and returns the results.  


  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 
    return function (...args: Parameters<F>) { 
      return fns.map(function (fn) { 

      });
    }
  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="return fn.apply(null, args);"
additional_feedback="

  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 
    return function (...args: Parameters<F>) { 
      return fns.map(function (fn) { 
        return fn.apply(null, args);
      });
    }
  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


Enter the next line: " response
answer="const filteredArr = Array.from()"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from()

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = Array.from()


Enter the next line: " response
answer="new Set(),"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = Array.from(
    new Set()
  )


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(),
  )


Enter the next line: " response
answer="arr.map(function (a) { return a.id; }),"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  )

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  )


Enter the next line: " response
answer=".map(function (id) { });"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  ).map(function (id) { 

    }); 


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  ).map(function (id) { 

  });


Enter the next line: " response
answer="return arr.find(function (a) { });"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  ).map(function (id) { 
    return arr.find(function (a) { 

    });
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove a duplicate using Set and map.
  
  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  ).map(function (id) { 
    return arr.find(function (a) { 
      
    });
  });


Enter the next line: " response
answer="return a.id === id;"
additional_feedback="

    const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];


  const filteredArr = Array.from(
    new Set(
      arr.map(function (a) { 
        return a.id; 
      }),
    ),
  ).map(function (id) { 
    return arr.find(function (a) { 
      return a.id === id;
    });
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using find and reduce.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

Enter the next line: " response

answer="const filteredArr = arr.reduce(function (acc, cur) { }, []);"
additional_feedback="

  const filteredArr = arr.reduce(function (acc, cur) { 

  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using find and reduce.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 

  }, []);

Enter the next line: " response
answer="const x = acc.find(function (item) { });"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 

    });

  }, []);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using find and reduce.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 

    });

  }, []);

Enter the next line: " response
answer="return item.id === cur.id;"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 
      return item.id === cur.id;
    });

  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using find and reduce.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 
      return item.id === cur.id;
    });

  }, []);

Enter the next line: " response
answer="if (!x) { return acc.concat([cur]  ); }"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 
      return item.id === cur.id;
    });

    if (!x) { 
      return acc.concat([cur]  ); 
    }

  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using find and reduce.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 
      return item.id === cur.id;
    });

    if (!x) { 
      return acc.concat([cur]  ); 
    }

  }, []);

Enter the next line: " response
answer="else { return acc; }"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ]; 

  const filteredArr = arr.reduce(function (acc, cur) { 
    const x = acc.find(function (item) { 
      return item.id === cur.id;
    });

    if (!x) { 
      return acc.concat([cur]  ); 
    } else { 
      return acc; 
    }

  }, []);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Set and filter. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];
  
Enter the next line: " response
answer="const seen = new Set();"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Set and filter. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  
Enter the next line: " response
answer="const filteredArr = arr.filter(function (el) { });"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 

  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Set and filter. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 

  });
  
Enter the next line: " response
answer="const duplicate = seen.has(item.id);"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 
    const duplicate = seen.has(item.id);
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Set and filter. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 
    const duplicate = seen.has(item.id);
  });
  
Enter the next line: " response
answer="seen.add(item.id);"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 
    const duplicate = seen.has(item.id);
    seen.add(item.id);
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Set and filter. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 
    const duplicate = seen.has(item.id);
    seen.add(item.id);
  });
  
Enter the next line: " response
answer="return !duplicate;"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const seen = new Set();
  const filteredArr = arr.filter(function (el) { 
    const duplicate = seen.has(item.id);
    seen.add(item.id);
    return !duplicate;
  });  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicates using Map and map. 

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

Enter the next line: " response
answer="const filteredArr = [].concat();"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat();

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Remove duplicates using Map and map.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat();


Enter the next line: " response
answer="new Map().values(),"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(),
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove duplicates using Map and map.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(),
  );


Enter the next line: " response
answer="arr.map(function (item) { return [item.id, item]; }),"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(
      arr.map(function (item) { 
        return [item.id, item]; 
      }),
    ),
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove duplicates using Map and map.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(
      arr.map(function (item) { 
        return [item.id, item]; 
      }),
    ),
  );


Enter the next line: " response
answer="const iterator = unique[0][Symbol.iterator]();"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(
      arr.map(function (item) { 
        return [item.id, item]; 
      }),
    ),
  );

  const iterator = unique[0][Symbol.iterator]();


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove duplicates using Map and map.

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(
      arr.map(function (item) { 
        return [item.id, item]; 
      }),
    ),
  );

  const iterator = unique[0][Symbol.iterator]();


Enter the next line: " response
answer="for (let i of iterator) { console.log(i, 'item'); }"
additional_feedback="

  const arr = [
    { id: 1, name: 'test1' },
    { id: 2, name: 'test2' },
    { id: 2, name: 'test3' },
    { id: 3, name: 'test4' },
    { id: 4, name: 'test5' },
    { id: 5, name: 'test6' },
    { id: 5, name: 'test7' },
    { id: 6, name: 'test8' }
  ];

  const filteredArr = [].concat(
    new Map().values(
      arr.map(function (item) { 
        return [item.id, item]; 
      }),
    ),
  ); 

  const iterator = unique[0][Symbol.iterator]();
  for (let i of iterator) { 
    console.log(i, 'item');
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  
Enter the next line: " response
answer="function hasDuplicates(array) { }"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 

  }
  
Enter the next line: " response
answer="const words = new Map();"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 

  }
  
Enter the next line: " response
answer="for (let index = 0; index < array.length; index++) { }"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
    for (let index = 0; index < array.length; index++) { 

    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 

    }
  }
  
Enter the next line: " response
answer="const word = array[index];"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
    }
  }
  
Enter the next line: " response
answer="if (words.has(word)) { continue; }"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
    }
  }
  
Enter the next line: " response
answer="words.set(word, true);"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
      words.set(word, true);
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) { 
    const words = new Map();
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
      words.set(word, true);
    }
  }
  
Enter the next line: " response
answer="return words;"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
      words.set(word, true);
    }
    return words;
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove a duplicates by adding values to a map 

   const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
      words.set(word, true);
    }
    return words;
  }
  
Enter the next line: " response
answer="console.log(Object.keys(Object.fromEntries(hasDuplicates(array))));"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

  function hasDuplicates(array) {
    const words = new Map(); 
    for (let index = 0; index < array.length; index++) { 
      const word = array[index];
      if (words.has(word)) { 
        continue;
      }
      words.set(word, true);
    }
    return words;
  }

  console.log(Object.keys(Object.fromEntries(hasDuplicates(array))));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Remove duplicate using reduce. 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];

Enter the next line: " response
answer="const removeDuplicate = array.reduce(function (acc, cur) { }, []);"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];
  const removeDuplicate = array.reduce(function (acc, cur) { 
    
  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove duplicate using reduce. 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];
  const removeDuplicate = array.reduce(function (acc, cur) { 
    
  }, []);

Enter the next line: " response
answer="if (!acc.includes(cur)) { acc.push(cur); }"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];
  const removeDuplicate = array.reduce(function (acc, cur) { 
    if (!acc.includes(cur)) { 
      acc.push(cur);
    }
  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Remove duplicate using reduce. 

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];
  const removeDuplicate = array.reduce(function (acc, cur) { 
    if (!acc.includes(cur)) { 
      acc.push(cur);
    }
  }, []);

Enter the next line: " response
answer="return accumulator;"
additional_feedback="

  const array = ['a', 'b', 'a', 'b', 'c', 'e', 'e', 'c', 'd', 'd', 'd', 'd'];
  const removeDuplicate = array.reduce(function (acc, cur) { 
    if (!acc.includes(cur)) { 
      acc.push(cur);
    }
    return accumulator;
  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 


Enter the next line: " response
answer="function reverse (str) { }"
additional_feedback="

  function reverse (str) { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 

  function reverse (str) { 
    
  }

Enter the next line: " response
answer="let reversed = '';"
additional_feedback="

  function reverse (str) { 
    let reversed = '';
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 

  function reverse (str) { 
    let reversed = '';
  }

Enter the next line: " response
answer="for (let i = str.length - 1; i >= 0; i--) {  }"
additional_feedback="reversed += str[i];"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 

  function reverse (str) { 
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {  

    }
  }

Enter the next line: " response
answer="reversed += str[i];"
additional_feedback="

   function reverse (str) { 
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {  
      reversed += str[i];
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 

  function reverse (str) { 
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {  
      reversed += str[i];
    }
  }

Enter the next line: " response
answer="return reversed;"
additional_feedback="

  function reverse (str) { 
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {  
      reversed += str[i];
    }
    return reversed;
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using a for-loop. 

Enter the next line: " response
answer="function reverse(str) { }"
additional_feedback="

  function reverse(str) { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using for...of.

  function reverse(str) { 

  }

Enter the next line: " response
answer="let reversed = '';"
additional_feedback="

  function reverse(str) { 
    let reversed = '';
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using for...of.

  function reverse(str) { 
    let reversed = '';
  }

Enter the next line: " response
answer="for(let char of str) { }"
additional_feedback="

  function reverse(str) { 
    let reversed = '';
    for(let char of str) { 

    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using for...of.

  function reverse(str) { 
    let reversed = '';
    for(let char of str) { 

    }
  }

Enter the next line: " response
answer="reversed = char + reversed;"
additional_feedback="

  function reverse(str) { 
    let reversed = '';
    for(let char of str) { 
      reversed = char + reversed;
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using for...of.

  function reverse(str) { 
    let reversed = '';
    for(let char of str) { 
      reversed = char + reversed;
    }
  }

Enter the next line: " response
answer="return reversed;"
additional_feedback="

  function reverse(str) { 
    let reversed = '';
    for(let char of str) { 
      reversed = char + reversed;
    }
    return reversed;
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using .split('') .reverse() and .join('') " response
answer="return str.split('').reverse().join('');"
additional_feedback="

  function reverse(str) {
    return str.split('').reverse().join('');
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using .split('') .join() " response
answer="return [...str].reverse().join('');"
additional_feedback="

  function reverse(str) {
    return [...str].reverse().join('');
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using .split('') .reduce() " response
answer="return str.split('').reduce((rev, char) => char + rev, '');"
additional_feedback="

  function reverse(str) {
    return str.split('').reduce((rev, char) => char + rev, '');
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Reverse a string using branching logic and substr. " response
answer="return str.trim().length === 0 ? str : reverse(str.substr(1)) + str[0];"
additional_feedback="

  function reverse(str) {
    return str.trim().length === 0 ? str : reverse(str.substr(1)) + str[0];
  } 
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "FizzBuzz. 

Enter the next line: " response
answer="for (let i = 1; i <= 100; i++) { }"
additional_feedback="

  for (let i = 1; i <= 100; i++) { 

  }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "FizzBuzz.

  for (let i = 1; i <= 100; i++) { 

  }

Enter the next line: " response
answer="const f = i % 3 == 0;"
additional_feedback="

  for (let i = 1; i <= 100; i++) { 
    const f = i % 3 == 0;
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "FizzBuzz.

  for (let i = 1; i <= 100; i++) { 
   const f = i % 3 == 0; 
  }

Enter the next line: " response
answer="const b = i % 5 == 0;"
additional_feedback="

  for (let i = 1; i <= 100; i++) { 
    const f = i % 3 == 0;
    const b = i % 5 == 0; 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "FizzBuzz.

  for (let i = 1; i <= 100; i++) { 
    const f = i % 3 == 0; 
    const b = i % 5 == 0; 
  }

Enter the next line: " response
answer="const b = i % 5 == 0;"
answer="console.log(f ? (b ? 'FizzBuzz' : 'Fizz') : b ? 'Buzz' : i);"
additional_feedback="

  for (let i = 1; i <= 100; i++) { 
    const f = i % 3 == 0; 
    const b = i % 5 == 0;
    console.log(f ? (b ? 'FizzBuzz' : 'Fizz') : b ? 'Buzz' : i); 
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Pick a random element from an array. " response
answer="const randomValue = myArray[Math.floor(Math.random() * myArray.length)];"
evaluate_answer_written_with_code "$response" "$answer"

next_line

read -p "Flip a coin. " response
answer="const isHeads = Boolean(Math.round(Math.random()));"
evaluate_answer_written_with_code "$response" "$answer"

next_line

read -p "
  Count the instance of an an item in array and create an array 
  of the number of occurrences. 


  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }

Enter the next line: " response
answer="const countedNames = names.reduce(function (allNames, name) { }, {});"
additional_feedback="

  const countedNames = names.reduce(function (allNames, name) { 
    
  }, {});
  
  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Count the instance of an an item in array and create an array 
  of the number of occurrences. 

  const countedNames = names.reduce(function (allNames, name) { 

  }, {});

  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }

Enter the next line: " response
answer="if (name in allNames) { allNames[name]++ }"
additional_feedback="

  const countedNames = names.reduce(function (allNames, name) { 
    if (name in allNames) { 
      allNames[name]++ 
    }
  }, {});

  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }  

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Count the instance of an an item in array and create an array 
  of the number of occurrences. 

  const countedNames = names.reduce(function (allNames, name) { 
    if (name in allNames) { 
      allNames[name]++ 
    }
  }, {});

  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }

Enter the next line: " response
answer="else { allNames[name] = 1 }"
additional_feedback="

  const countedNames = names.reduce(function (allNames, name) { 
    if (name in allNames) { 
      allNames[name]++ 
    } else { 
      allNames[name] = 1 
    }
  }, {});

  // countedNames is:
  // { 'Alice': 2, 'Bob': 1, 'Tiff': 1, 'Bruce': 1 }  

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Group objects by property. 

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

Enter the next line: " response
answer="function groupBy(objectArray, property) { }"
additional_feedback="

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Group objects by property. 

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

Enter the next line: " response
answer="return objectArray.reduce(function (acc, obj) { }, {});"
additional_feedback="

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    return objectArray.reduce(function (acc, obj) { 

    }, {});
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }


"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Group objects by property. 

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    return objectArray.reduce(function (acc, obj) { 

    }, {});
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

Enter the next line: " response
answer="if (!acc[key]) { acc[key] = []; }"
additional_feedback="

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    return objectArray.reduce(function (acc, obj) { 
      if (!acc[key]) { 
        acc[key] = []; 
      }
    }, {});
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "
  Group objects by property. 

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    return objectArray.reduce(function (acc, obj) { 
      if (!acc[key]) { 
        acc[key] = []; 
      }
    }, {});
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

Enter the next line: " response
answer="acc[key].push(obj); return acc;"
additional_feedback="

  const people = [
    { name: 'Alice', age: 21 },
    { name: 'Max', age: 20 },
    { name: 'Jane', age: 20 }
  ];

  function groupBy(objectArray, property) { 
    return objectArray.reduce(function (acc, obj) { 
      if (!acc[key]) { 
        acc[key] = []; 
      }
      acc[key].push(obj); 
      return acc;
    }, {});
  }

  const groupedPeople = groupBy(people, 'age');
  // groupedPeople is:
  // { 
  //   20: [
  //     { name: 'Max', age: 20 }, 
  //     { name: 'Jane', age: 20 }
  //   ], 
  //   21: [{ name: 'Alice', age: 21 }] 
  // }

"
evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "Function composition enabling pipe. 

  // Composed functions for multiplication of specific values
  const multiply6 = pipe(double, triple)
  const multiply9 = pipe(triple, triple)
  const multiply16 = pipe(quadruple, quadruple)
  const multiply24 = pipe(double, triple, quadruple)

  // Usage
  multiply6(6)   // 36
  multiply9(9)   // 81
  multiply16(16) // 256
  multiply24(10) // 240

Enter the next line: " response
answer="const pipe = (...functions) => input => functions.reduce((acc, fn) => fn(acc), input);"

evaluate_answer_written_with_code "$response" "$answer" ""

next_line

read -p "Recursively flatten an array using reduce.

  flatDeep(arr, Infinity);
  // [1, 2, 3, 4, 5, 6];

Enter the next line: " response
answer="function flatDeep(arr, d = 1) { }"
additional_feedback="

  function flatDeep(arr, d = 1) { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Recursively flatten an array using reduce.

  function flatDeep(arr, d = 1) { 
  
  }

  flatDeep(arr, Infinity);
  // [1, 2, 3, 4, 5, 6];

Enter the next line: " response
answer="return d > 0 ? arr.reduce(function (acc, val) {  }, []) : arr.slice();"
additional_feedback="

  function flatDeep(arr, d = 1) { 
    return d > 0 ? arr.reduce(function (acc, val) {  

    }, []) : arr.slice();
  }

  flatDeep(arr, Infinity);
  // [1, 2, 3, 4, 5, 6];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Recursively flatten an array using reduce.

  function flatDeep(arr, d = 1) { 
    return d > 0 ? arr.reduce(function (acc, val) {  
      
    }, []) : arr.slice();
  }

  flatDeep(arr, Infinity);
  // [1, 2, 3, 4, 5, 6];

Enter the next line: " response
answer="return acc.concat(Array.isArray(val) ? flatDeep(val, d - 1) : val);"
additional_feedback="

  function flatDeep(arr, d = 1) { 
    return d > 0 ? arr.reduce(function (acc, val) {  
      return acc.concat(Array.isArray(val) ? flatDeep(val, d - 1) : val);
    }, []) : arr.slice();
  }

  flatDeep(arr, Infinity);
  // [1, 2, 3, 4, 5, 6];

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Run promises in a sequence.

  // promise function 1
  function p1(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 5)
    })
  }

  // promise function 2
  function p2(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 2)
    })
  }


Enter the next line: " response
answer="function runPromiseInSequence(arr, input) { }"
additional_feedback="

  function runPromiseInSequence(arr, input) { 

  }  

  // promise function 1
  function p1(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 5)
    })
  }

  // promise function 2
  function p2(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 2)
    })
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Run promises in a sequence.

  function runPromiseInSequence(arr, input) { 

  } 

  // promise function 1
  function p1(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 5)
    })
  }

  // promise function 2
  function p2(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 2)
    })
  }


Enter the next line: " response
answer="return arr.reduce((promiseChain, currentFunction) => promiseChain.then(currentFunction), Promise.resolve(input));"
additional_feedback="

 function runPromiseInSequence(arr, input) { 
   return arr.reduce((promiseChain, currentFunction) => promiseChain.then(currentFunction), 
     Promise.resolve(input)
   );
  } 

  // promise function 1
  function p1(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 5)
    })
  }

  // promise function 2
  function p2(a) {
    return new Promise((resolve, reject) => {
      resolve(a * 2)
    })
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="const argCallsTracker = (() => { })();"
additional_feedback="

  const argCallsTracker = (() => { 

  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 

  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="const wm = new WeakMap();"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="return obj => { };"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 

    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2)); 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 

    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="wm.set(obj, (wm.get(obj) || 0) + 1);"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2)); 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="return wm.get(obj);"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
      return wm.get(obj);
    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
      return wm.get(obj);
    };
  })();

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="function foo(args) { }"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
      return wm.get(obj);
    };
  })();

  function foo(args) { 

  }

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Use a WeakMap to track how often a method was called.

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
      return wm.get(obj);
    };
  })();

  function foo(args) { 

  }

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));

Enter the next line: " response
answer="const calls = argCallsTracker(args); console.log('foo called with ', JSON.stringify(args), calls, ' times');"
additional_feedback="

  const argCallsTracker = (() => { 
   const wm = new WeakMap();

    return obj => { 
      wm.set(obj, (wm.get(obj) || 0) + 1);
      return wm.get(obj);
    };
  })();

  function foo(args) { 
    const calls = argCallsTracker(args);
    console.log('foo called with ', JSON.stringify(args), calls, ' times');
  }

  const obj1 = { key: 1 };
  const obj2 = { key: 2 };

  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj1));
  console.log(foo(obj2));
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What is the difference between WeakMap and Map? " response
answer="WeakMap is weakly set. If a key is set and no methods reference it, the key will be garbage collected. A Map will keep everything even when it is not in use. WeakMap also doesn't have any iterators."
evaluate_answer_written_with_code "$response" "$answer"

next_line

read -p "Converting from Map to Object and from Object to Map. " response
answer="const objMap = Object.fromEntries(myMap.entries()); const map = new Map(objMap.entries());"
evaluate_answer_written_with_code "$response" "$answer"

next_line


read -p "Return the byte size of a given input.

  byteSize('Hello World'); // 11

Enter the next line: " response
answer="const byteSize = str => new Blob([str]).size;"
additional_feedback="

  const byteSize = str => new Blob([str]).size;
  byteSize('Hello World'); // 11

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  console.log(createPhoneNumber(1234561029));

Enter the next line: " response
answer="function createPhoneNumber (numbers) { }"
additional_feedback="

  function createPhoneNumber (numbers) { 

  }

  console.log(createPhoneNumber(1234561029));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  console.log(createPhoneNumber(1234561029));

Enter the next line: " response
answer="let format = '(xxx) xxx-xxxx';"
additional_feedback="

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
  }

  console.log(createPhoneNumber(1234561029));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
  }

  console.log(createPhoneNumber(1234561029));

Enter the next line: " response
answer="const phoneNumbers = numbers.toString();"
additional_feedback="

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();
  }

  console.log(createPhoneNumber(1234561029));  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();
  }

  console.log(createPhoneNumber(1234561029)); 

Enter the next line: " response
answer="for (let i = 0; i < phoneNumbers.length; i++) { }"
additional_feedback="

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();

    for (let i = 0; i < phoneNumbers.length; i++) { 

    }
  }

  console.log(createPhoneNumber(1234561029));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();

    for (let i = 0; i < phoneNumbers.length; i++) { 

    }
  }

  console.log(createPhoneNumber(1234561029)); 

Enter the next line: " response
answer="format = format.replace('x', phoneNumbers[i]);"
additional_feedback="

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();

    for (let i = 0; i < phoneNumbers.length; i++) { 
      format = format.replace('x', phoneNumbers[i]);
    }
  }

  console.log(createPhoneNumber(1234561029));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Define a function, createPhoneNumber, that accepts an 
  array of 10 integers (from 0-9) and returns a string of 
  those numbers in the form of a phone number.

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();

    for (let i = 0; i < phoneNumbers.length; i++) { 
      format = format.replace('x', phoneNumbers[i]);
    }
  }

  console.log(createPhoneNumber(1234561029)); 

Enter the next line: " response
answer="return format;"
additional_feedback="

  function createPhoneNumber (numbers) { 
    let format = '(xxx) xxx-xxxx';
    const phoneNumbers = numbers.toString();

    for (let i = 0; i < phoneNumbers.length; i++) { 
      format = format.replace('x', phoneNumbers[i]);
    }
    return format;
  }

  console.log(createPhoneNumber(1234561029));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

Enter the next line: " response
answer="const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

Enter the next line: " response
answer="const x = setInterval(function () { }, 1000);"
additional_feedback="

    const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () { 

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () { 

    }, 1000);

Enter the next line: " response
answer="const now = new Date().getTime();"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();

    }, 1000);  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();

    }, 1000); 

Enter the next line: " response
answer="const distance = countDownDate - now;"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

    }, 1000); 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

    }, 1000); 

Enter the next line: " response
answer="const days = Math.floor(distance / (1000 * 60 * 60 * 24));"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));

    }, 1000); 

Enter the next line: " response
answer="const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      

    }, 1000); 

Enter the next line: " response
answer="const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      

    }, 1000); 

Enter the next line: " response
answer="const seconds = Math.floor((distance % (1000 * 60)) / 1000);"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    }, 1000);

Enter the next line: " response
answer="console.log(`${days}d ${hours}h ${minutes}m ${seconds}s`);"
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);

      console.log(`${days}d ${hours}h ${minutes}m ${seconds}s`);

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a countdown timer.

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    }, 1000);

Enter the next line: " response
answer="if (distance < 0) { clearInterval(x); console.log('Expired'); } "
additional_feedback="

  const countDownDate = new Date('Jan 5, 2022 15:37:25').getTime();

    const x = setInterval(function () {

      const now = new Date().getTime();
      const distance = countDownDate - now;

      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);

      if (distance < 0) { 
        clearInterval(x); 
        console.log('Expired'); 
      }

    }, 1000);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Extraction initials.

  function extractInitials(value: string) {

  }

Enter the next line: " response
answer="return value.match(/\b\w/g)!.join('').substring(0, 2);"
additional_feedback="

  function extractInitials(value: string) {
    return value.match(/\b\w/g)!.join('').substring(0, 2);
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Create type writer function.

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

Enter the next line: " response
answer="function typeWriter () { }"
additional_feedback="

  function typeWriter () { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Create type writer function.

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 

  }

Enter the next line: " response
answer="if (i < txt.length) { }"
additional_feedback="

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 
    if (i < txt.length) { 

    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Create type writer function.

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 
    if (i < txt.length) { 

    }
  } 

Enter the next line: " response
answer="document.getElementById('demo').innerHTML += txt.charAt(i);"
additional_feedback="

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 
    if (i < txt.length) {   
      document.getElementById('demo').innerHTML += txt.charAt(i);
    }
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Create type writer function.

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 
    if (i < txt.length) {   
      document.getElementById('demo').innerHTML += txt.charAt(i);
    }
  }  

Enter the next line: " response
answer="i++; setTimeout(typeWriter, speed);"
additional_feedback="

  let i = 0;
  const txt = 'Lorem ipsum dummy text blabla.';
  const speed = 50;

  function typeWriter () { 
    if (i < txt.length) {   
      document.getElementById('demo').innerHTML += txt.charAt(i);
      i++; 
      setTimeout(typeWriter, speed);
    }
  } 


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Validate URL. 

  const matchesURLPattern = (url: string): boolean => {
  
  } 


Enter the next line: " response
answer="return new RegExp('^(https?:\\\\/\\\\/)').test(url);"
additional_feedback="

  const matchesURLPattern = (url: string): boolean => {
    return new RegExp('^(https?:\\/\\/)').test(url);
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Convert a string to camel case.

Enter the next line: " response
answer="function camelCase (str) { }"
additional_feedback="

  function camelCase(str) { 

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Convert a string to camel case.

  function camelCase(str) { 

  }

Enter the next line: " response
answer=".replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { })"
additional_feedback="

  function camelCase(str) { 
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { 

    })
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Convert a string to camel case.

  function camelCase(str) { 
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { 

    })
  }

Enter the next line: " response
answer="return index == 0 ? word.toLowerCase() : word.toUpperCase();"
additional_feedback="

  function camelCase(str) { 
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { 
      return index == 0 ? word.toLowerCase() : word.toUpperCase();
    })
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Convert a string to camel case.

  function camelCase(str) { 
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { 
      return index == 0 ? word.toLowerCase() : word.toUpperCase();
    })
  }

Enter the next line: " response
answer=".replace(/\s+/g, "");"
additional_feedback="

  function camelCase(str) { 
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) { 
      return index == 0 ? word.toLowerCase() : word.toUpperCase();
    })
    .replace(/\s+/g, "");
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Destructure undefined in JavaScript.


  function pointValues(point) {
   
    console.log(n);
    console.log(a);
  }
  pointValues({ name: 'jerry', age: 2 });
  pointValues(undefined);

Enter the next line: " response
answer="const { name: n, age: a } = { ...point };"
additional_feedback="

  function pointValues(point) {
    const { name: n, age: a } = { ...point };
    console.log(n);
    console.log(a);
  }
  pointValues({ name: 'jerry', age: 2 });
  pointValues(undefined);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


// German
["ä", "b"].sort((a, b) => a.localeCompare(b, "de")); // ['ä', 'b', 'c']

// Swedish
["ä", "b"].sort((a, b) => a.localeCompare(b, "sv")); // ['b', 'c', 'ä']


replaceString('World', 'Web', 'Brave New World');
function replaceString(oldS, newS, fullS): string {
  return fullS.split(oldS).join(newS);
}


function replaceString(oldS, newS, fullS) {
  for (let i = 0; i < fullS.length; ++i) {
    if (fullS.substring(i, i + oldS.length) == oldS) {
      fullS = fullS.substring(0, i) + newS + fullS.substring(i + oldS.length, fullS.length)
    }
  }
  return fullS
}


# // Replaces oldS with newS in the string fullS
# function replaceString(oldS, newS, fullS) {
#   for (let i = 0; i < fullS.length; ++i) {
#     if (fullS.substring(i, i + oldS.length) == oldS) {
#       fullS = fullS.substring(0, i) + newS + fullS.substring(i + oldS.length, fullS.length)
#     }
#   }
#   return fullS
# }

# replaceString('World', 'Web', 'Brave New World');

#
useEffect(() => {
            fetch("https://restcountries.eu/rest/v2/all")
                .then((res) => res.json())
                .then(
                    (result) => {
                        setIsLoaded(true);
                        setItems(result);
                    },
                    // Note: it's important to handle errors here
                    // instead of a catch() block so that we don't swallow
                    // exceptions from actual bugs in components.
                    (error) => {
                        setIsLoaded(true);
                        setError(error);
                    }
                );
        }, []);



        //     set search query to empty string
        const [q, setQ] = useState("");
        //     set search parameters
        //     we only what to search countries by capital and name
        //     this list can be longer if you want
        //     you can search countries even by their population
        // just add it to this array
        const [searchParam] = useState(["capital", "name"]);

import React from "https://cdn.skypack.dev/react@17.0.1";
import ReactDOM from "https://cdn.skypack.dev/react-dom@17.0.1";

import { useState, useEffect } from "https://cdn.skypack.dev/react";


use the notes as prompts for the questions

function App() {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [items, setItems] = useState([]);

    //     set search query to empty string
           const [q, setQ] = useState("");
    //     set search parameters
    //     we only what to search countries by capital and name
    //     this list can be longer if you want
    //     you can search countries even by their population
    // just add it to this array
    const [searchParam] = useState(["capital", "name"]);

    // Note: the empty deps array [] means
    // this useEffect will run once
    // similar to componentDidMount()

    useEffect(() => {
        fetch("https://restcountries.eu/rest/v2/all")
            .then((res) => res.json())
            .then(
                (result) => {
                    setIsLoaded(true);
                    setItems(result);
                },

                // Note: it's important to handle errors here
                // instead of a catch() block so that we don't swallow
                // exceptions from actual bugs in components.
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                }
            );
    }, []);

    
    function search(items) {
        return items.filter((item) => {
            return searchParam.some((newItem) => {
                return (
                    item[newItem]
                        .toString()
                        .toLowerCase()
                        .indexOf(q.toLowerCase()) > -1
                );
            });
        });
    }

    if (error) {
        return <>{error.message}</>;
    } else if (!isLoaded) {
        return <>loading...</>;
    } else {
        return (
            <div className="wrapper">
                <div className="search-wrapper">
                    <label htmlFor="search-form">
                        <input
                            type="search"
                            name="search-form"
                            id="search-form"
                            className="search-input"
                            placeholder="Search for..."
                            value={q}
                            /* 
                            // set the value of our useState e
                            //  anytime the user types in the search box
                            */
                            onChange={(e) => setQ(e.target.value)}
                        />
                        <span className="sr-only">Search countries here</span>
                    </label>
                </div>
                <ul className="card-grid">
                    {search(items).map((item) => (
                        <li>
                            <article className="card" key={item.callingCodes}>
                                <div className="card-image">
                                    <img src={item.flag} alt={item.name} />
                                </div>
                                <div className="card-content">
                                    <h2 className="card-name">{item.name}</h2>
                                    <ol className="card-list">
                                        <li>
                                            population:{" "}
                                            <span>{item.population}</span>
                                        </li>
                                        <li>
                                            Region: <span>{item.region}</span>
                                        </li>
                                        <li>
                                            Capital: <span>{item.capital}</span>
                                        </li>
                                    </ol>
                                </div>
                            </article>
                        </li>
                    ))}
                </ul>
            </div>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("root"));


handle the case when the string is empty

function isEmptyString(){
  return search.trim().length;

}

Not includes will return substrings
const filtered = !isEmptyString(search)
    ? people
    : people.filter((person) =>
        person.name.toLowerCase().includes(search.toLowerCase())
      );


This uses startWith to filter search

 const filter = (e) => {
    const keyword = e.target.value;

    if (keyword !== '') {
      const results = USERS.filter((user) => {
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
        // Use the toLowerCase() method to make it case-insensitive
      });
      setFoundUsers(results);
    } else {
      setFoundUsers(USERS);
      // If the text field is empty, show all users
    }

    setName(keyword);
  };
# const result = Object.keys(keyMap).reduce<Record<string, ValueType>>(
#   (acc, cur) => {
#     const xmlProps = keyMap[key]
#     value = getXmlValue(xml, xmlProps['name'], xmlProps['attribute'])
#     acc[cur] = value
#     return acc
#   },
#   ([] as unknown) as FileReaderResults,
# )
# Iterate over mixed values using reduce
#     let readResult: FileReaderResults = {
#           alias: '',
#           display_name: '',
#           enabled: false,
#           store_token: false,
#           add_read_token_role_on_create: false,
#           trust_email: false,
#           link_only: false,
#           hide_on_login_page: false,
#           gui_order: null,
#           first_broker_login_flow_alias: '',
#           post_broker_login_flow_alias: '',

#           }

#   const result = Object.keys(keyMap).reduce<Record<string, ValueType>>((map, key:KeyMap) => {
#             const xmlProps = keyMap[key];
#             value = getXmlValue(xml, xmlProps['name'], xmlProps['attribute']);
#             map[key] = value;
#             return map;
#           }, {} as FileReaderResults);


const multiSort =
  <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
  (a: Item, b: Item) => {
    // Try each comparator in turn
    for (let comparator of comparators) {
      // Get its result
      const comparatorResult = comparator(a, b);
      // Return that result only if it is non-zero
      if (comparatorResult !== 0) return comparatorResult;
    }
    // All comparators returned zero, so these items cannot be distinguished
    return 0;
  };

const sortedBooks = books.sort(
  multiSort(
    (a, b) => a.title.localeCompare(b.title),
    (a, b) => a.published - b.published,
  )
);


Can you spot the mistake in this logic? What happens when both 
a and b do not have a name? Then this comparator declares that a 
should go before b, but that is not correct, they should be treated 
as equal. In general, you should avoid checking something about one 
of the values and not the other. Formally speaking this comparator 
breaks the antisymmetric property of a total order. 

// Sort users by name, but put all nameless users at the end.
users.sort((a, b) => {
  // If a doesn't have a name...
  if (!a.name) return 1; // ...then a should go after b
  // If b doesn't have a name...
  if (!b.name) return -1; // ...then b should go after a
  // Otherwise compare by name
  return a.name.localeCompare(b.name);
});


The mathematical concept of a total order is what defines 
whether an ordering is consistent. It consists of four rules:

a <= a (reflexive)
if a <= b and b <= c then a <= c (transitive)
if a <= b and b <= a then a = b (antisymmetric)
a <= b or b <= a (strongly connected)