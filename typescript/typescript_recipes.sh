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
answer="users.sort(function(a, b) { });"
additional_feedback="

    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort(function(a, b) { 

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

    users.sort(function(a, b) { 

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

    users.sort(function(a, b) { 
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

next_line

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
evaluate_answer "$response" "$answer" "$additional_feedback"

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
evaluate_answer "$response" "$answer" "$additional_feedback"

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

Enter the next line: " response
answer="const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => );

Enter the next line: " response
answer="data.slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0));
  
Enter the next line: " response
answer=".split('\n')"
additional_feedback="

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0)
      .split('\n'));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a program that takes a csv and returns an array. 

  const csvToArray = (data: string, delimiter = ',', omitFirstRow = false): string[][] => 
     data
      .slice(omitFirstRow ? data.indexOf('\n') + 1 : 0));
      .split('\n'));
  
Enter the next line: " response
answer=".map(v => v.split(delimiter)"
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

Enter the next line: " response
answer="interface Data { x: number; y: number; z: number; }"
additional_feedback="

  interface Data {
    x: number;
    y: number;
    z: number;
  }

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


Enter the next line: " response
answer=""
additional_feedback="
  interface Data {
    x: number;
    y: number;
    z: number;
  }

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


Enter the next line: " response
answer="type DataKey = keyof Data;"
additional_feedback=""
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

Enter the next line: " response
answer="\`\${acc}\${!acc.length ? '' : delimiter}\${!obj[key] ? '' : obj[key]}\`,''"
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
answer="return Object.keys(details).reduce(function (acc, key: DetailKeys) { }, , {} as RenamedAttributes);"
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
      
    }, , {} as RenamedAttributes);
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
      
    }, , {} as RenamedAttributes);
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
    }, , {} as RenamedAttributes);
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


next_line

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
answer="return Array.from()"
additional_feedback="

  type Comp = { 
    (x: number, y: number): boolean; 
  };

  function findCommonElements(a: number[], b: number[], comp: Comp) { 
    return Array.from(

    )
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

    )
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
    )
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
    )
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
    )
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
    )
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
    )
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

read -p " " response
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
    )
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

  Write a curry function where the first function's parameters are functions in the form of a rest operator, then iterates, invoking each function with arguments passed from the inner function and returns the results. 

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

  Write a curry function where the first function's parameters are functions in the form of a rest operator, then iterates, invoking each function with arguments passed from the inner function and returns the results. 


  type Procedure = (...args: any[]) => number;

  function over<F extends Procedure>(...fns: F[]) { 

  }

  const minMax = over(Math.min, Math.max);
  console.log(minMax(1, 2, 3, 4, 5));
  console.log(minMax(1, 2, 5, 4, 3));
  console.log(minMax(1, 2, 5, -4, 3));

Enter the next line: " response
answer="function over<F extends Procedure>(...fns: F[]) { }"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " " response
answer="return function (...args: Parameters<F>) {"
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " " response
answer=""
additional_feedback=""
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"




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
