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

    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array. 

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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
    Write a JavaScript program to convert a comma-separated values (CSV) string to a 2D array.

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