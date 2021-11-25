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

read -p "Sort the list in descending order.

        let artists = [
            'John White Abbott',
            'Leonardo da Vinci',
            'Charles Aubry',
            'Anna Atkins',
            'Barent Avercamp'
        ];


Enter your answer: " response
answer="a === b ? 0 : a > b ? -1 : 1;"
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



read -p "In the previous answer, why did the program output those results?" response
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
answer="return a.name === b.name ? 0 : left > right ? 1 : -1;"
additional_feedback="
    let users = [
        {'name': 'Joe', 'address': 'Huston', 'dob':'February 9, 1991', 'income': 87654},
        {'name': 'Bob', 'address': 'London', 'dob':'July 1, 1986', 'income': 47974},
        {'name': 'Carl', 'address': 'Bangalore', 'dob':'December 25, 1982', 'income': 97351},
        {'name': 'Amanda', 'address': 'Lagos', 'dob':'March 19, 2001', 'income': 57753},
    ];

    users.sort(function(a, b) { 
       return a.name === b.name ? 0 : left > right ? 1 : -1;
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
answer=".then(() => { console.log('clipped'); }).catch(() => { console.error('failed') });"
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
answer="function csvToJson(data: string, delimiter = ',') { }"
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
answer="function csvToJson(data: string, delimiter = ',') { }"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ',') { 

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

    function csvToJson(data: string, delimiter = ',') { 

    }

    console.log(csvToJson('col1,col2\na,b\nc,d')); 
    // [{'col1': 'a', 'col2': 'b'}, {'col1': 'c', 'col2': 'd'}];

Enter the next line: " response
answer="const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ',') { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];
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

    function csvToJson(data: string, delimiter = ',') { 
        const titles = data.slice(0, data.indexOf('\n')).split(',') as DataKey[];
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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

    function csvToJson(data: string, delimiter = ',') { 
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
answer="return (obj[title] = values[index]), obj;"
additional_feedback="
    interface Data {
      col1: string;
      col2: string;
    }

    type DataKey = keyof Data;

    function csvToJson(data: string, delimiter = ',') { 
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


# interface Employee {
#   id: string;
#   firstName: boolean;
# }

# interface Guest {
#   firstName: string;
# }

# interface IObjectYo {
#   someProp: number;
#   same: boolean;
# }

# interface IDifObjYo {
#   otherProp: number;
#   same: boolean;
# }

# function example(someArg: IObjectYo | IDifObjYo) {
#   if ('someProp' in someArg) {
#     console.log(someArg.someProp); // tsc knows it must be type IObjectYo because someProp only belongs to IObjectYo
#   } else {
#     console.log(someArg.otherProp); // tsc knows this is IDifObjYo because the first condition failed (which means it must be of type IDifObjYo)
#   }
#   if ('same' in someArg) {
#     console.log(someArg.someProp); // make sure the property is indeed unique between the possible types or tsc can't infer
#   }


# }


# f you want the accumulator value to be indexable by string, Record<string, string> should do the trick. You can pass this as the type argument to reduce

# interface MediaQueryProps {
#   [key: string]: number;
# }

# const size: MediaQueryProps = {
#   small: 576,
#   medium: 768,
#   large: 992,
#   extra: 1200
# };

# export default Object.keys(size).reduce<Record<string, string>>((acc, cur) => {
#   acc[cur] = `(min-width: ${size[cur]}px)`;
#   return acc;
# }, {});
# const result = Object.keys(keyMap).reduce<Record<string, ValueType>>((acc, cur) => {
#             const xmlProps = keyMap[key];
#             value = getXmlValue(xml, xmlProps['name'], xmlProps['attribute']);
#             acc[cur] = value;
#             return acc;
#           }, [] as unknown as FileReaderResults);



# export const c = Object.keys(size).reduce((acc, cur) => {
#   acc[cur] = `(min-width: ${size[cur]}px)`;

#   return acc;
# }, {} as Record<keyof MediaQueryProps, string>);




# type Breakpoints = {
#   small: number;
#   medium: number;
#   large: number;
#   extra: number;
# };

# const size: Breakpoints = {
#   small: 576,
#   medium: 768,
#   large: 992,
#   extra: 1200
# };

# // Type of entry after Object.entries() is used
# type BreakpointEntry = [keyof Breakpoints, Breakpoints[keyof Breakpoints]];

# // Generic helper to make all of the properties' types: string | undefined
# type Stringify<T> = { [key in keyof T]?: string };

# // Override Object interface for custom Object.entries():
# interface CustomObject extends ObjectConstructor {
#   entries<K extends keyof Breakpoints, T>(
#     o: { [s in K]: T } | ArrayLike<T>
#   ): [K, T][];
# }

# // Let's use this interface now:
# const obj: CustomObject = Object;

# export default obj
#   .entries(size)
#   .reduce<Stringify<Breakpoint>>((acc, cur: BreakpointEntry) => {
#     const [key, value] = cur;
#     acc[key] = `(min-width: ${value}px)`;

#     return acc;
#   }, {});



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
########################################
#         Calculate your score         #
########################################

calculate_score
