#!/bin/bash


correct=0
questions=0

calculate_score() {
    ((questions = questions + 1))

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
        score=$(((questions / correct) * 100))
        echo "    You scored $score% on cryptography."
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
}

evaluate_answer_written_with_code() {

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

read -p "What type goes in the greeter function?

        function greeter(/* what goes here? */) {
            fn('Hello, World');
        }
 
        function printToConsole(s: string) {
            console.log(s);
        }
        
        greeter(printToConsole);

Enter your answer: " response
answer="fn: (a: string) => void"
additional_feedback="
        
        function greeter(fn: (a: string) => void) {
            fn('Hello, World');
        }
 
        function printToConsole(s: string) {
            console.log(s);
        }
        
        greeter(printToConsole);

"
evaluate_answer "$response"  "$answer" "$additional_feedback"



next_question


read -p "How would you access the properties in the DescribableFunction type? 

        type DescribableFunction = {
            description: string;
            (someArg: number): boolean;
        };

        function doSomething(fn: DescribableFunction) {
         // console log the response here
        }

Enter your answer: " response
answer="console.log(fn.description + ' returned ' + fn(6));"
additional_feedback="

        type DescribableFunction = {
            description: string;
            (someArg: number): boolean;
        };

        function doSomething(fn: DescribableFunction) {
         console.log(fn.description + \" returned \" + fn(6));
        }
"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question



read -p "How would a constructor signature look for SomeConstructor type? 

    type SomeConstructor = {
      // define the property here
    };

    function fn(ctor: SomeConstructor) {
        return new ctor('hello');
    }


Enter your answer: " response
answer="new (s: string): SomeObject"
additional_feedback="

        type SomeConstructor = {
          new (s: string): SomeObject;
        };

        function fn(ctor: SomeConstructor) {
            return new ctor('hello');
        }
"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question



read -p "

    Define the types of the map function. 

    function map(arr, func) {
        return arr.map(func);
    }

    const parsed = map(['1', '2', '3'], (n) => parseInt(n));

Enter your answer: " response
answer="<S, N>(arr: S[], func: (arg: S) => N): N[]"
additional_feedback="

    function map<S, N>(arr: S[], func: (arg: S) => N): N[] {
        return arr.map(func);
    }

    const parsed = map(['1', '2', '3'], (n) => parseInt(n));

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question




read -p "How would you define the type if you need to access the length member on an array and string? 

        // How would the type signatures look for the parameters?
        function longest(a, b) {
           if (a.length >= b.length) {
              return a;
           } else {
              return b;
           }
        }
 
        // longerArray is of type 'number[]'
        const longerArray = longest([1, 2], [1, 2, 3]);

        // longerString is of type 'alice' | 'bob'
        const longerString = longest('alice', 'bob');

Enter your answer: " response
answer="<T extends { length: number }>(a: T, b: T)"
additional_feedback="

    function longest<T extends { length: number }>(a: T, b: T) {
        if (a.length >= b.length) {
            return a;
        } else {
            return b;
        }
    }
 
    // longerArray is of type 'number[]'
    const longerArray = longest([1, 2], [1, 2, 3]);

    // longerString is of type 'alice' | 'bob'
    const longerString = longest('alice', 'bob');

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "Define a type that will make the following code legal? 
        
        function combine<T>(arr1: T[], arr2: T[]): T[] {
            return arr1.concat(arr2);
        }

        const arr = combine([1, 2, 3], ['hello']);

Enter your answer: " response
answer="<string | number>"
additional_feedback="

        function combine<T>(arr1: T[], arr2: T[]): T[] {
            return arr1.concat(arr2);
        }

        const arr = combine<string | number>([1, 2, 3], ['hello']);
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "Complete the implementation signature to make the overload valid. 

        function len(s: string): number;
        function len(arr: string[]): number;
        function len(x) {
            /* what parameters should be in the function definition? */
            return x.length;
        }

        len([''])


Enter your answer: " response
answer="string[] | string"
additional_feedback="

        function len(s: string): number;
        function len(arr: string[]): number;
        function len(x: string[] | string) {
            /* what the parameters here be ?*/
            return x.length;
        }

        len([''])

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "What is a Function type? " response
answer="Function type describes any function property in JavaScript, for example, bind, call and apply."
additional_feedback="

    function doSomething(f: Function) {
        f(1, 2, 3);
    }

    This is an untyped function call and is generally best avoided because 
    of the unsafe any return type.

    If you need to accept an arbitrary function but don’t intend to call it, 
    the type () => void is generally safer.

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "How to fix the following code so that it is valid? 

    const args = [8, 5];

    const angle = Math.atan2(...args);
    error: A spread argument must either have a tuple type or be passed to a rest parameter.

Enter your answer: " response
answer="as const"
additional_feedback="

    TypeScript does not assume that arrays are immutable. 
    // Inferred as 2-length tuple

    const args = [8, 5] as const; // OK
    const angle = Math.atan2(...args);

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question

read -p "What is type narrowing? " response
answer="Type narrowing is the process of refining types to more specific types than declared."
evaluate_answer "$response" "$answer"



next_question



read -p "What is a type guard? " response
answer="Type guard is checking the result of typeof and similar runtime operations."
additional_feedback="

    function getScore(value: number|string): number {
        if (typeof value === 'number') { // (A)
            // %inferred-type: number
            value;
            return value;
        }
        if (typeof value === 'string') { // (B)
            // %inferred-type: string
            value;
            return value.length;
        }
        throw new Error('Unsupported value: ' + value);
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "What types do typeof return? " response
answer="string number bigint boolean symbol undefined object function"
evaluate_answer "$response" "$answer"



next_question




read -p "What operator can be used to narrow the type of the following code? 
    type Fish = { swim: () => void };
    type Bird = { fly: () => void };
 
    function move(animal: Fish | Bird) {
        if (animal) {
            return animal.swim();
        }
        
        return animal.fly();
    }


Enter your answer: " response
answer="if ('swim' in animal) { }"
additional_feedback="

      type Fish = { swim: () => void };
      type Bird = { fly: () => void };

      function move(animal: Fish | Bird) {
        if ('swim' in animal) {
            return animal.swim();
        }
        
        return animal.fly();
    }

"

evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "What is control flow analysis? " response
answer="Control flow analysis is the analysis of code based on reachability."
additional_feedback="

    TypeScript uses this flow analysis to narrow types as it encounters type guards 
    and assignments. When a variable is analyzed, control flow can split off and re-merge 
    over and over again, and that variable can be observed to have a different type at each point.

    function example() {
        let x: string | number | boolean;
        
        x = Math.random() < 0.5;
        
        console.log(x);
             
        let x: boolean
        
        if (Math.random() < 0.5) {
            x = \"hello\";
            console.log(x);
                    
        let x: string
        } else {
            x = 100;
            console.log(x);
                    
        let x: number
        }
        
        return x;
                
        let x: string | number
    }
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question



read -p "How do you define a user-defined type guard? " response
answer="Define a function whose return type is a type predicate."



next_question



read -p "What is the type predicate for the function if the type has to be Fish? 
    
    type Fish = { swim: () => void };
    type Bird = { fly: () => void };
    
    function isFish(pet: Fish | Bird) {
       return;
    }


Enter you answer: " response
answer="pet is Fish"
additional_feedback="

    type Fish = { swim: () => void };
    type Bird = { fly: () => void };

    function isFish(pet: Fish | Bird): pet is Fish {
      return;
    }

"

next_question

read -p "What should go next to the return statement? 
    
    type Fish = { swim: () => void };
    type Bird = { fly: () => void };
    
    function isFish(pet: Fish | Bird): pet is Fish {
       return;
    }


Enter you answer: " response
answer="(pet as Fish).swim !== undefined"
additional_feedback="

    type Fish = { swim: () => void };
    type Bird = { fly: () => void };

    function isFish(pet: Fish | Bird): pet is Fish {
       return (pet as Fish).swim !== undefined;
    }


    let pet = getSmallPet();
 
    if (isFish(pet)) {
      pet.swim();
    } else {
      pet.fly();
    }

"

 next_question



 read -p "How would a discriminate union be applied to the following code to narrow the type?

        interface Circle {
           kind: \"circle\";
           radius: number;
        }
 
        interface Square {
          kind: \"square\";
          sideLength: number;
        }
 
        type Shape = Circle | Square;

        function getArea(shape: Shape) {
          return Math.PI * shape.radius ** 2;
        }
 
Enter your answer: " response
answer="shape.kind === 'circle'"
additional_feedback="

    function getArea(shape: Shape) {
        if (shape.kind === \"circle\") {
            return Math.PI * shape.radius ** 2;
        }
    }
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "What does the noImplicitAny flag do? " response
answer="noImplicitAny flag raises an error on expressions and declarations with an implied any type."
additional_feedback="

    When you enable the flag, TypeScript will throw an error 
    whenever it’s impossible to infer the type of something. 
    Without the flag, TypeScript would automatically assume 
    that the type is any. With the flag enabled, you have to 
    provide type annotation. You can still use any, but now 
    you have to do this explicitly.

"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question

read -p "What is the difference between unknown and any type? " response
answer="All types are assignable to the any type and the any type is assignable to any other type. All types are assignable to the unknown type, but the unknown type is not assignable to any type"
additional_feedback="

    function foo1(bar: any) {
       const a: string = bar; // no error
       const b: number = bar; // no error
       const c: { name: string } = bar; // no error
    }

    function foo2(bar: unknown) {
        const a: string = bar; // 🔴 Type 'unknown' is not assignable to type 'string'.(2322)
        const b: number = bar; // 🔴 Type 'unknown' is not assignable to type 'number'.(2322)
        const c: { name: string } = bar; // 🔴 Type 'unknown' is not assignable to type '{ name: string; }'.(2322)
    }

    /************************************
    * All types are assignable to unknown
    *************************************/ 
        let x: unknown;

        x = 123; // no error
        x = 'abc';  // no error
        x = true; // no error

"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question


read -p "What is the consequence of using unknown? " response
answer="unknown type has to be cast to another type before a developer can use it. The consequence is that the unknown type does not propagate like any does, which is much safer."
evaluate_answer "$response" "$answer"


next_question


read -p "What is a good use case for using unknown type? " response
answer="unknown should be used when a backend service returns it or when a developer deserializes it."
evaluate_answer "$response" "$answer"


next_question



read -p "

    How would you use unknown type in the following code below? 
    
        interface Article {
           title: string;
           body: string;
        }

        fetch(\"http://example.com\")
            .then(response => response.json())
            .then((body) => {
                const article = body;
                
                console.log(article.title);
        });
    
    
Enter your answer: " response
answer="body: unknown const article = body as Article"
additional_feedback="
    interface Article {
        title: string;
        body: string;
    }

    fetch(\"http://example.com\")
    .then(response => response.json())
    .then((body) => {
        const article = body as Article;
        // we need to cast, otherwise we'd get an error
        console.log(article.title);
    });

"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question


read -p "
    Write a runtime check that could be used in the above code to make 
    sure that body is indeed an Article.
    
    function isArticle(body: unknown): boolean {
       return null;
    }

Enter the next line: " response
answer="return typeof body === \"object\" &&"
additional_feedback="
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
    Write a runtime check that could be used in the above code to make 
    sure that body is indeed an Article.
    
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
    }

Enter the next line: " response
answer="body !== null &&"
additional_feedback="
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
          body !== null &&
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Write a runtime check that could be used in the above code to make 
    sure that body is indeed an Article.
    
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
          body !== null &&
    }

Enter the next line: " response
answer="typeof (body as any).title === \"string\" &&"
additional_feedback="
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
          body !== null &&
          typeof (body as any).title === \"string\" &&
    }

"
evaluate_answer_written_with_code "$response" "$response" "$additional_feedback"


next_line



read -p "
    Write a runtime check that could be used in the above code to make 
    sure that body is indeed an Article.
    
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
          body !== null &&
          typeof (body as any).title === \"string\" &&
    }

Enter the next line: " response
answer="typeof (body as any).body === \"string\";"
additional_feedback="
    function isArticle(body: unknown): boolean {
       return typeof body === \"object\" &&
          body !== null &&
          typeof (body as any).title === \"string\" &&
          typeof (body as any).body === \"string\";
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question


read -p "Who introduced the null reference? " response
answer="Thomas Hoare"
additional_feedback="

     Thomas Hoare, a famous and influential computer scientist, introduced null 
     references to ALGOL in 1965. Many years later he admitted that it was a mistake, 
     as it resulted in \"innumerable errors, vulnerabilities, and system crashes, which 
     have probably caused a billion dollars of pain and damage in the last forty years.\"
"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question

read -p "What is the definition of a strictNullChecks? " response
answer="In strict null checking mode, the null and undefined values are not in the domain of every type and are only assignable to themselves and any (the one exception being that undefined is also assignable to void)."
additional_feedback="
    When null or undefined are not within the domain of every type, 
    errors are caught at compile time rather than at runtime.
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question


read -p "What is the defintiion of strictPropertyInitialization? " response
answer="Ensure non-undefined class properties are initialized in the constructor. This option requires – strictNullChecks be enabled in order to take effect."
additional_feedback="

   //Initializing a property in the constructor
    class HeaderComponent {
       constructor(private header: string) {}

        render() {
            return \`<h1>\${this.header.toUpperCase()}</h1>\`;
        }
    }
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "How would you add generics to the following function? 

        function map(items, mappingFunction){

        }


Enter the next line: " response
answer="map<TElement, TResult>(items: TElement[], mappingFunction: (item: TElement) => TResult): TResult[]"
additional_feedback="

    function map<TElement, TResult>(
      items: TElement[],
      mappingFunction: (item: TElement) => TResult
    ): TResult[] {

        const results = [];
        for (let person of persons) {
            results.push(person.name);
        }

        return results;
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"


next_question


read -p "Add the generics for the following function. 

    function reduce(array, reducer, initialResult): TResult {
        return null;
    }

Enter the next line: " response
answer="<TElement, TResult>(array: TElement[], reducer: (result: TResult, el: TElement) => TResult, initialResult: TResult): TResult"
additional_feedback="

    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       
    }
"
evaluate_answer "$response" "$answer"

next_question


read -p "Complete the following program. 

    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       // Code will go here
    }


Enter the next line: " response
answer="let result = initialResult;"
additional_feedback="
    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       let result = initialResult;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "Complete the following program. 

    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       let result = initialResult;
    }


Enter the next line: " response
answer="for (const element of array)"
additional_feedback="
    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       let result = initialResult;
       for (const element of array){

       }
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Complete the following program. 

    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       let result = initialResult;
       for (const element of array){

       }
    }


Enter the next line: " response
answer="result = reducer(result, element);"
additional_feedback="

    function reduce<TElement, TResult>(
        array: TElement[], 
        reducer: (result: TResult, el: TElement) => TResult, 
        initialResult: TResult
    ): TResult {
       let result = initialResult;
       for (const element of array){
            result = reducer(result, element);
       }
       return result;
    }

    const total = reduce<number, number>([1, 2, 3, 4, 5], (sum, el) => sum + el, 0);

    const ageByName = reduce<Person, Record<string, number>>(
        persons, 
        (result, person) => ({
            ...result,
            [person.name]: person.age
        }),
        {}
    );
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question


read -p "

    Add types to the following zip function that takes two arrays 
    and returns an array of pairs with elements from both arrays.

    function zip(array1, array2) {
       const length = Math.min(array1.length, array2.length);
       const result = [];

       for (let i = 0; i < length; i++) {
            result.push([array1[i], array2[i]]);
       }
       return result;
    }
Enter the next line: " response
answer="zip<T1, T2>(array1: T1[], array2: T2[]): ([T1, T2])[]"
additional_feedback="

    function zip<T1, T2>(array1: T1[], array2: T2[]): ([T1, T2])[] {
       const length = Math.min(array1.length, array2.length);
       const result = [];

       for (let i = 0; i < length; i++) {
         result.push([array1[i], array2[i]]);
       }

       return result;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "
    Add types to the following zip function that takes two arrays 
    and returns an array of pairs with elements from both arrays.

    function zip<T1, T2>(array1: T1[], array2: T2[]): ([T1, T2])[] {
       const length = Math.min(array1.length, array2.length);
       const result = [];

       for (let i = 0; i < length; i++) {
         result.push([array1[i], array2[i]]);
       }

       return result;
    }
Enter the next line: " response
answer="const result: ([T1, T2])[] = [];"
additional_feedback="

    function zip<T1, T2>(array1: T1[], array2: T2[]): ([T1, T2])[] {
       const length = Math.min(array1.length, array2.length);
       const result: ([T1, T2])[] = [];

       for (let i = 0; i < length; i++) {
         result.push([array1[i], array2[i]]);
       }

       return result;
    }

"

next_question

read -p "What is the purpose of an interface? " response
answer="Interfaces describe the shape of the data contained by the object."
evaluate_answer "$response" "$answer"


next_question



read -p "
    Write a function that takes an object and a string representing the name of 
    some property of this object.

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!
    
Enter the next line: " response
answer="interface Person { name: string; age: number; }"
additional_feedback="

   interface Person {
      name: string;
      age: number;
    }

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "
    Write a function that takes an object and a string representing the name of 
    some property of this object.

    interface Person {
      name: string;
      age: number;
    }

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!
    
Enter the next line: " response
answer="type PersonKeys = keyof Person;"
additional_feedback="
    interface Person {
      name: string;
      age: number;
    }

    type PersonKeys = keyof Person; // ‘name’ | ‘age’

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Write a function that takes an object and a string representing the name of 
    some property of this object.

    interface Person {
      name: string;
      age: number;
    }

    type PersonKeys = keyof Person; // ‘name’ | ‘age’

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!
    
Enter the next line: " response
answer="function get<T, K extends keyof T>(object: T, key: K): T[K]"
additional_feedback="
    interface Person {
      name: string;
      age: number;
    }

    type PersonKeys = keyof Person; // ‘name’ | ‘age’

    function get<T, K extends keyof T>(object: T, key: K): T[K] {
        return object[key];
    }

    declare const person: Person;
    get(person, 'name'); // ✅ No errors
    get(person, 'foo'); // 🔴 Error!

"
evaluate_answer_written_with_code "$respose" "$answer" "$additional_feedback"


next_question


read -p "
   Add types to the following pick function that takes an array of 
   items and a property name and returns an array of values of the 
   provided property of array elements.

   function pick(array, key) {
      const results = [];
      for (let element of array) {
         results.push(element[key]);
       }
       return results;
    }

Enter the next line: " response
answer="pick<T, K extends keyof T>(array: T[], key: K): (T[K])[]"
additional_feedback="

    function pick<T, K extends keyof T>(array: T[], key: K): (T[K])[] {
      const results = [];
      for (let element of array) {
         results.push(element[key]);
       }
       return results;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"



next_line


read -p "
   Add types to the following pick function that takes an array of 
   items and a property name and returns an array of values of the 
   provided property of array elements.

   function function pick<T, K extends keyof T>(array: T[], key: K): (T[K])[] {
      const results = [];
      for (let element of array) {
         results.push(element[key]);
       }
       return results;
    }
Enter the next line: " response
answer="const results: T[K][] = [];"
additional_feedback="

    function function pick<T, K extends keyof T>(array: T[], key: K): (T[K])[] {
      const results: T[K][] = [];
      for (let element of array) {
         results.push(element[key]);
       }
       return results;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "What is a union in set theory? " response
answer="The union of two sets is a set that contains all elements from both sets."
evaluate_answer "$response" "$answer"

next_question


read -p "What is a intersection in set theory? " response
answer="The intersection of two sets is a set that only contains elements that are present in both sets."
evaluate_answer "$response" "$answer"


next_question


read -p "
    What does Foo | Bar represent?

    interface Foo {
      foo: string;
      xyz: string;
    }

    interface Bar {
      bar: string;
      xyz: string;
    }

Enter your answer" response
answer="Foo | Bar represents a union of the set of objects having foo and xyz properties and the set of objects having bar and xyz. Objects belonging to such sets all have the xyz property. Some of them have foo property and others have bar property."
evaluate_answer "$response" "$answer"


next_question


read -p "
    What does Foo & Bar represent?

    interface Foo {
      foo: string;
      xyz: string;
    }

    interface Bar {
      bar: string;
      xyz: string;
    }

Enter your answer" response
answer="Foo & Bar represents an intersection of the set of objects having foo and xyz properties and the set of objects having bar and xyz. In other words, the set contains objects that belong to the sets represented by both Foo and Bar. Only objects that have all three properties (foo, bar and xyz) belong to the intersection."
evaluate_answer "$response" "$answer"


next_question


read -p "
   What is the property called in the discriminate union? 

    interface EmailContact {
        kind: 'email';
        email: string;
    }

    interface PhoneContact {
        kind: 'phone';
        phone: number;
    }
    
    type Contact = EmailContact | PhoneContact;

Enter you answer: " response
answer="discriminator"
evaluate_answer "$response" "$answer"


next_question


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type ContactInfo = | { kind: 'emailOnly'; email: string }"
additional_feedback="

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="| { kind: 'postalOnly'; address: string }"
additional_feedback="

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="| { kind: 'emailAndPostal'; email: string; address: string };"
additional_feedback="
    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type Order = {
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type Customer = { name: string; contactInfo: ContactInfo; };"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type Order = {
       customer: Customer; //add customer to the order type
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type PaidOrderData = { paymentDate: Date; amount: number };"
additional_feedback="
    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"



next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type SentOrderData = { sendingDate: Date };"
additional_feedback="
    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type DeliveredOrderData = { deliveryDate: Date };"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line



read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

     type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type Order = {
       customer: Customer; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="type OrderState = | { kind: 'new' }"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }

    type Order = {
       customer: Customer; 
       state: OrderState; // add order state
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

     type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }

    type Order = {
       customer: Customer; 
       state: OrderState; // add order state
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="| { kind: 'paid'; paidData: PaidOrderData }"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }
      | { kind: 'paid'; paidData: PaidOrderData }

    type Order = {
       customer: Customer; 
       state: OrderState; 
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line 


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

     type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }
      | { kind: 'paid'; paidData: PaidOrderData }

    type Order = {
       customer: Customer; 
       state: OrderState; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="| { kind: 'sent'; paidData: PaidOrderData; sentData: SentOrderData }"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }
      | { kind: 'paid'; paidData: PaidOrderData }
      | { kind: 'sent'; paidData: PaidOrderData; sentData: SentOrderData }

    type Order = {
       customer: Customer; 
       state: OrderState; 
       productName: string;
       price: number;
       quantity: number;
    };

"

evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
    Create types for the following domain:

    Users place orders for products. Users have contact information, 
    email or postal addresses, and at least one is required. Orders 
    should include price, product name, quantity, payment date, paid 
    amount, sending date, and delivery date.

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }
      | { kind: 'paid'; paidData: PaidOrderData }
      | { kind: 'sent'; paidData: PaidOrderData; sentData: SentOrderData }

    type Order = {
       customer: Customer; 
       state: OrderState; 
       productName: string;
       price: number;
       quantity: number;
    };

Enter the next line: " response
answer="| { kind: 'delivered'; data: PaidOrderData; sentData: SentOrderData; deliveredData: DeliveredOrderData; };"
additional_feedback="

    type Customer = {
      name: string;
      contactInfo: ContactInfo;
    };

    type ContactInfo =
      | { kind: 'emailOnly'; email: string }
      | { kind: 'postalOnly'; address: string }
      | { kind: 'emailAndPostal'; email: string; address: string };

    type PaidOrderData = { paymentDate: Date; amount: number };  
    type SentOrderData = { sendingDate: Date };
    type DeliveredOrderData = { deliveryDate: Date };

    type OrderState = 
      | { kind: 'new' }
      | { kind: 'paid'; paidData: PaidOrderData }
      | { kind: 'sent'; paidData: PaidOrderData; sentData: SentOrderData }
      | { 
          kind: 'delivered'; 
          data: PaidOrderData; 
          sentData: SentOrderData; 
          deliveredData: DeliveredOrderData; 
        };

    type Order = {
       customer: Customer; 
       state: OrderState; 
       productName: string;
       price: number;
       quantity: number;
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question


read -p "What is a state machine? " response
answer="A state machine is a directed graph where nodes represent all possible states of a view or of the whole app, and where edges represent possible transitions between the states."
evaluate_answer "$response" "$answer"


next_question


read -p "What is the Exclude built-in conditional type? " response
answer="Exclude takes a union type, T, and removes the members that are assignable to U."
evaluate_answer "$response" "$answer"


next_question


read -p "
    Exclude C from the following Union. 
    type AB = 'A' | 'B' | 'C';

Enter your answer: " response
answer="type AB = Exclude<'A' | 'B' | 'C', 'C'>;"
evaluate_answer "$response" "$answer"


next_question

read -p "
    Exclude id from the interface. 

    interface Person {
      id: number;
      name: string;
      age: number;    
    }

    function safeSetProp(obj, key, value) {
      obj[key] = value;
    }

Enter your answer: " response
answer="safeSetProp<T, K extends Exclude<keyof T, 'id'>>(obj: T, key: K, value: T[K])"
additional_feedback="
    function safeSetProp<T, K extends Exclude<keyof T, 'id'>>(obj: T, key: K, value: T[K]) {
      obj[key] = value;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "What does Extract do? " response
answer="Extract will only pick those union members of T that are assignable to U."
additional_feedback="

    type AB = Extract<'A' | 'B' | 'C', 'C'>; // 'C'

"
evaluate_answer "$response" "$answer"

next_question


read -p "Whatis the Parameters type? " response
answer="Parameters type takes a function type and returns a tuple type representing types of all parameters of the function."
evaluate_answer "$response" "$answer"


next_question


read -p "
    Create a type defintion for the following code.

    const sayHello = (name: string, age: number) => `Hello ${name}, your age is ${age}`;
Enter your answer: " response
answer="type SayHelloParams = Parameters<typeof sayHello>;"
additional_feedback="

    const sayHello = (name: string, age: number) => `Hello ${name}, your age is ${age}`;
    type SayHelloParams = Parameters<typeof sayHello>; // [name: string, age: number]
"
evaluate_answer "$response" "$answer"


next_question


read -p "

    Write a type definition that infers the props for the React component.

    class Article extends React.Component<{ content: string }> {
        render = () => this.props.content; // This would normally be some JSX.
    }

Enter the next line: " response
answer="type PropsType<C> = C extends React.ComponentType<infer P> ? P : never;"
additional_feedback="

    type PropsType<C> = C extends React.ComponentType<infer P> ? P : never;

    class Article extends React.Component<{ content: string }> {
        render = () => this.props.content; // This would normally be some JSX.
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"



next_line


read -p "

    Write a type definition that infers the props for the React component.

    type PropsType<C> = C extends React.ComponentType<infer P> ? P : never;

    class Article extends React.Component<{ content: string }> {
        render = () => this.props.content; // This would normally be some JSX.
    }

Enter the next line: " response
additional_feedback="
    type PropsType<C> = C extends React.ComponentType<infer P> ? P : never;

    class Article extends React.Component<{ content: string }> {
        render = () => this.props.content; // This would normally be some JSX.
    }

    type ArticleProps = PropsType<typeof Article>; // { content: string; }

"
answer="type ArticleProps = PropsType<typeof Article>;"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question

read -p "
    How do you perform a deep immutability? 

    type Employment = DeepReadonly<{
      person: Person;
      company: string;
    }>;

Enter you answer: " response
answer="type DeepReadonly<T> = { readonly [P in keyof T]: DeepReadonly<T[P]>; };"
additional_feedback="

    type DeepReadonly<T> = {
      readonly [P in keyof T]: DeepReadonly<T[P]>;
    };

    type Employment = DeepReadonly<{
      person: Person;
      company: string;
    }>;

    Unfortunately, this type does not provide immutability for nested arrays, 
    Maps, Sets, or some other types. It’s actually quite complex to properly 
    implement such types, so it’s best to use a library instead https://github.com/krzkaczor/ts-essentials

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question



read -p "What kind of types are Extract and Exclude? " response
answer="Extract and Exclude are conditional types."
evaluate_answer "$response" "$answer"

next_question

read -p "What does Partial<T> return? " response
answer="Partial<T> returns a type that has the same properties as T but all of them are optional."
evaluate_answer "$response" "$answer"


next_question

read -p "Define Partial<T>" response
answer="type Partial<T> = { [P in keyof T]?: T[P]; };"
additional_feedback="

    interface Settings {
      width: number;
      autoHeight: boolean;
    }

    type Partial<T> = {
        [P in keyof T]?: T[P];
    };

    const defaultSettings: Settings = {};

    function getSettings(custom: Partial<Settings>): Partial<Settings> {
      return { ...defaultSettings, ...custom };
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question



read -p "What does Required<T> remove? " response
answer="Required<T> removes optionality from T's properties."
evaluate_answer "$response" "$answer"


next_question



read -p "What does Pick<T> create? " response
answer="Pick<T> creates an interface that contains only a subset of properties of T."
evaluate_answer "$response" "$answer"


next_question

read -p "Define Pick" response
answer="type Pick<T, K extends keyof T> = { [P in K]: T[P]; };"
additional_feedback="

    interface Person {
      name: string;
      age: number;
      id: number;
    }

    type Pick<T, K extends keyof T> = {
        [P in K]: T[P];
    };

    type NameAndAge = Pick<Person, 'name' | 'age'>; // { name: string; age: number; }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question


read -p "What does Required<T> remove? " response
answer="Required<T> removes optionality from T's properties."
evaluate_answer "$response" "$answer"

next_question


read -p "Define Required<T>" response
answer="type Required<T> = { [P in keyof T]-?: T[P]; };"
additional_feedback="

    type Required<T> = {
      [P in keyof T]-?: T[P];
    };

    type Foo = Required<{ name?: string }>; // { name: string; }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What does Record create? " response
answer="Record creates a new object type."
evaluate_answer "$response" "$answer"

next_question


read -p "Define Record" response
answer="type Record<K extends keyof any, T> = { [P in K]: T; };"
additional_feedback="
    type Record<K extends keyof any, T> = {
        [P in K]: T;
    };

    type StringDictionary = Record<string, string>; // { [x: string]: string; }
    type ABCNumbers = Record<'a' | 'b' | 'c', number>; // { a: number; b: number; c: number; }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question


read -p "
    Define a type called ReturnTypes that takes an interface with 
    methods and returns an interface with properties typed using 
    return types of these methods.


    type Test = ReturnTypes<{
      a: string;
      b: (a: number) => number;
    }>; // { a: never; b: number; }


Enter your answer: " response
answer="type ReturnTypes<T> = { [K in keyof T]: T[K] extends (...args: any[]) => any ? ReturnType<T[K]> : never; }"
additional_feedback="

    type ReturnTypes<T> = {
      [K in keyof T]: T[K] extends (...args: any[]) => any ? ReturnType<T[K]> : never;
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What are type guards? " response
answer="Nullable type guard typeof instanceof"
additional_feedback="

    typeof only works with JavaScript primitive types (string, number, 
    undefined, null, Boolean, and symbol). You cannot use it to check 
    the type of an interface because this information is erased at 
    runtime.

    instanceof can use type information for classes at runtime.

    class Person {
      constructor(public name: string) {}
    }

    function greet(obj: any) {
      if (obj instanceof Person) {
        console.log(obj.name);
      }
    }
"


next_question

read -p "
    Demonstrate that Typescript uses structural typing.

    interface Cat {
      name: string;
      breed: string;
    }

    interface Dog {
      name: string;
      breed: string;
    }

Enter next line: " response
answer="const cat: Cat = { name: 'Filemon', breed: 'Chartreux' };"
additional_feedback="

    interface Cat {
      name: string;
      breed: string;
    }

    interface Dog {
      name: string;
      breed: string;
    }

    const cat: Cat = { name: 'Filemon', breed: 'Chartreux' };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line

read -p "
    Demonstrate that Typescript uses structural typing.

    interface Cat {
      name: string;
      breed: string;
    }

    interface Dog {
      name: string;
      breed: string;
    }

Enter next line: " response
answer="let dog: Dog = cat;"
additional_feedback="

    interface Cat {
      name: string;
      breed: string;
    }

    interface Dog {
      name: string;
      breed: string;
    }

    const cat: Cat = { name: 'Filemon', breed: 'Chartreux' };
    let dog: Dog = cat; // ✅ No error
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question


read -p "
    Create a branded type for the following type. 
    type UserId

Enter the next line: " response
answer="type UserId = string & { __brand: 'UserId' };"
additional_feedback="

    type UserId = string & { __brand: 'UserId' };
    type ArticleId = string & { __brand: 'ArticleId' };

    declare const userId: UserId;

    function getArticle(articleId: ArticleId) {}

    getArticle(userId); // 🔴 Error!
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_question


read -p "
    Fix the following error in the code. 
    
    interface Person { name: string; employer?: string; };

    function getEmployers(persons: Person[]): string[] {
      return persons
         .filter(person => person.employer !== undefined)
         .map(person => person.employer); // 🔴 Error! 
    }

Enter the next line: " response
answer="filter((person): person is Required<Person> => person.employer !== undefined)"
additional_feedback="

    interface Person { name: string; employer?: string; };

    function getEmployers(persons: Person[]): string[] {
      return persons
         .filter((person): person is Required<Person> => person.employer !== undefined)
         .map(person => person.employer);
    }

"
########################################
#         Calculate your score         #
########################################

calculate_score

# interface Address {
#   street: string;
#   city?: string;
# }

# interface User {
#   name: string;
#   address: Address | undefined;
#   meta: Record<string, string>;
# }

# interface SuperUser extends User {
#   permissions: string[];
# }

# class SafeUserRepository {
#   private users: User[];

#   constructor() {
#     this.users = [
#       // Do not change the data. Let's assume it comes from the backend.
#       {
#         name: "John",
#         address: undefined,
#         meta: { created: "2019/01/03" }
#       },
#       {
#         name: "Anne",
#         address: { street: "Warsaw" },
#         meta: {
#           created: "2019/01/05",
#           modified: "2019/04/02"
#         }
#       }
#     ];
#   }

#   // `user` with given `id` might not exist, so marking the return type as possibly undefined
#   getUser(id: number): User | undefined {
#     return this.users[id];
#   }

#   getCities() {
#     return this.users
#       .map(user => user.address?.city)
#       .filter(city => city !== undefined);
#   }

#   forEachUser(action: (user: User) => void) {
#     this.users.forEach(user => action(user));
#   }
# }

# const safeUserRepository = new SafeUserRepository();

# console.log(safeUserRepository.getUser(1)?.address?.city?.toLowerCase());

# console.log(
#   safeUserRepository
#     .getCities()
#     .map(city => city?.toUpperCase())
#     .join(", ")
# );

# console.log(new Date(safeUserRepository?.getUser(0)?.meta.modfified ?? 0).getFullYear());





# interface Address {
#   street: string;
#   city?: string;
# }

# interface User {
#   name: string;
#   address: Address;
#   meta: Record<string, string>;
# }

# interface SuperUser extends User {
#   permissions: string[];
# }

# class UserRepository {
#   private users: User[] =[];

#   init() {
#     this.users = [
#       // Do not change the data. Let's assume it comes from the backend.
#       {
#         name: "John",
#         address: undefined,
#         meta: { created: "2019/01/03" }
#       },
#       {
#         name: "Anne",
#         address: { street: "Warsaw" },
#         meta: {
#           created: "2019/01/05",
#           modified: "2019/04/02"
#         }
#       }
#     ];
#   }

#   getUser(id: number) {
#     return this.users[id];
#   }

#   getCities() {
#     return this.users
#       .filter(user => user?.address?.city)
#       .map(user => user?.address?.city);
#   }

#   forEachUser(action: (user: User) => void) {
#     this.users.forEach(user => action(user));
#   }
# }

# const userRepository = new UserRepository();
# if(Boolean(userRepository)){

#   console.log(userRepository?.getUser(1).address.city.toLowerCase());
# }

# console.log(
#   userRepository
#     .getCities()
#     .map(city => city.toUpperCase())
#     .join(", ")
# );

# console.log(new Date(userRepository.getUser(0).meta.modfified).getFullYear());



# convert OOP state machine 

# type Tree = 
#       | { type: 'empty' }
#       | { type: 'leaf', value: number }
#       | { type: 'node', left: Tree, right: Tree };

# function toString(tree: Tree): string {
#     switch (tree.type) {
#         case 'empty':
#             return 'Empty';
#         case 'leaf':
#             return `Leaf(${tree.value})`;
#         case 'node':
#             return `Node(${toString(tree.left)}, ${toString(tree.right)}})`;
#     }
# }





# OOP
# abstract class Tree {
#   abstract toString(): string;
# }

# class Empty extends Tree {
#   toString() {
#     return `Empty`;
#   }
# }

# class Leaf extends Tree {
#   constructor(private value: number) {
#     super();
#   }

#   toString() {
#     return `Leaf(${this.value})`;
#   }
# }

# class Node extends Tree {
#   constructor(private left: Tree, private right: Tree) {
#     super();
#   }

#   toString() {
#     return `Node(${this.left.toString()}, ${this.right.toString()}})`;
#   }
# }


# comparison with OOP approach
# The most important difference is how these two approaches cope with change. 
# Imagine that we want to support a new operation on the Tree (e.g., sum that 
# returns the sum of all nodes in the tree). In OOP approach, we need to modify 
# every concrete class extending from Tree. This can be difficult, especially 
# if we don’t own all of these classes. In the Algebraic Data Types (ADT) approach, 
# all we need to do is write another standalone function with a switch statement.

# On the other hand, imagine that we want to add a new type of tree node (e.g., 
# NodeWithValue). As a consequence, we need to modify all Tree operations. In the 
# OOP approach, all we need to do is create a new subclass (NodeWithValue) and 
# implement all abstract methods. However, in the ADT approach, we have to add a 
# new case to every switch statement that switches over the discriminator property. 
# It might be tricky, especially if we don’t own all of the operations.