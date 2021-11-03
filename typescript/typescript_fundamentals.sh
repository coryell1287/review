correct=0
questions=0

increment_correct_responses() {
    ((correct = correct + 1))
}

increment_questions_count() {
    ((questions = questions + 1))
}

affirm_answer() {
    if [[ -z "$1" ]]; then
        echo "
    Correct. 

    "
    else
        echo "$1"
    fi
}

evaluate_answer() {

    if [ "$1" == "$2" ]; then
        increment_correct_responses
        affirm_answer "$3"
    else

        echo "
    
    Wrong! There is no tommorrow, so get this right right now!
    
    "
    fi
}

next_question() {
    echo "
 ########################################
             Next Question 
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
        
        Correct.

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
answer="console.log(fn.description + \" returned \" + fn(6))"
additional_feedback="

        Correct.

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



read -p "How would a constructor signature look like for SomeConstructor type? 

    type SomeConstructor = {
      // define the property here
    };

    function fn(ctor: SomeConstructor) {
        return new ctor(\"hello\");
    }


Enter your answer: " response
additional_feedback="

        Correct.

        type SomeConstructor = {
          new (s: string): SomeObject;
        };

        function fn(ctor: SomeConstructor) {
            return new ctor(\"hello\");
        }
"
evaluate_answer "$response" "$answer" "additional_feedback"




next_question



read -p "Define the types of the map function. " response
answer="<T, U>(arr: T[], func: (arg: T) => Output): U[]"
additional_feedback="

    Correct.

    function map<T, U>(arr: T[], func: (arg: T) => Output): U[] {
        return arr.map(func);
    }

    const parsed = map([\"1\", \"2\", \"3\"], (n) => parseInt(n));

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
        const longerString = longest(\"alice\", \"bob\");

Enter your answer: " response
answer="T extends { length: number }>(a: T, b: T)"
additional_feedback="
    
    Correct.

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
    const longerString = longest(\"alice\", \"bob\");

"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "Define a type that will make the following code legal? 
        
        const arr = combine([1, 2, 3], [\"hello\"]);

Enter your and" response
answer="<string | number>"
additional_feedback="

        Correct.
        const arr = combine<string | number>([1, 2, 3], [\"hello\"]);
"
evaluate_answer "$response" "$answer" "$additional_feedback"



next_question


read -p "Complete the implementation signature to make the overload valid. 

        function len(s: string): number;
        function len(arr: string[]): number;
        function len(x) {
            /* what the parameters here be ?*/
            return x.length;
        }

        len([""])


Enter your answer: " response
answer="string[] | string"
additional_feedback "$response" "$answer" "$additional_feedback"



next_question


read -p "What is Function type? " response
answer="Function describes properties like bind, call, apply, and any property of a function in JavaScript."
additional_feedback="

    Correct.

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

Enter your answer " response
answer="as const"
additional_feedback="

    Correct.

    TypeScript does not assume that arrays are immutable. 
    // Inferred as 2-length tuple
    const args = [8, 5] as const;
    // OK
    const angle = Math.atan2(...args);

"
evaluate_answer "$response" "$answer" "$additional_feedback"




next_question
