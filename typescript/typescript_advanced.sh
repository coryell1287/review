#!/bin/bash


correct=0
questions=0

calculate_float() {
    awk "BEGIN {printf \"%.2f\n\", $1 / $2}"
}

calculate_score() {

    if [[ correct -eq 0 ]]; then
        echo "     
#################################################

  You got nothing correct. Stop and go study.

#################################################
             "
    else
        echo "########################################"
        echo "          Progress                    "
        echo "    $questions questions answered."
        echo "    $correct answered correctly."
        score=$(calculate_float $correct $questions)
        echo "    You scored $score% on Typescript advanced."
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



read -p "When was Typescript made public? " response
answer="TypeScript was made public on October 1st 2012"
evaluate_answer "$response" "$answer"

next_question

read -p "What error is thrown in the following code?

    y = 'not declared before assignments'; 
    let y = 'The line before forbid this line';
 
    z = 'not declared before assignments';
    const z = 'The line before forbid this line'; 

Enter your answer: " response
answer="Block-scoped variable 'y' used before its declaration. Block-scoped variable 'z' used before its declaration."
additional_feedback="

    /usr/lib/node_modules/ts-node/src/index.ts:245
    return new TSError(diagnosticText, diagnosticCodes)
           ^
    TSError: ⨯ Unable to compile TypeScript:
    index.ts(1,1): error TS2448: Block-scoped variable 'y' used before its declaration.
    index.ts(4,1): error TS2448: Block-scoped variable 'z' used before its declaration.
    index.ts(4,1): error TS2588: Cannot assign to 'z' because it is a constant.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What will setting the tsconfig to noEmitOnError true do? " response
answer="The Typescript compiler will not produce JavaScript files if an error occurs."
evaluate_answer "$response" "$answer"

next_question

read -p "What will be the output of the following code? 

    function f1(i2: number) {
      // i will be shadowed
      console.log('Parameter value:', i2);
      let i: number = 10; // Shadow #1
      console.log('Variable value:', i);
      for (let i = 100; i < 101; i++) {
          // Shadow #2
          console.log('For-statement value:', i);
          for (let i = 200; i < 201; i++) {
              // Shadow #3
              console.log('For-statement value 2:', i);
          }
        }
        console.log('Variable value:', i);
    }
    f1(0);


Enter your answer? " response
answer="Parameter value: 0 Variable value: 10 For-statement value: 100 For-statement value 2: 200 Variable value: 10"
evaluate_answer "$response" "$answer"

next_question

read -p "What will be the output of the following code? 

  function mainFunction2() {
    let innerFunction;
    let listFunctions = [];
    for (let i = 10; i < 15; i++) {
        innerFunction = (function(param1: number) {
            let f = function() {
                return param1;
            };
            return f;
        })(i * 100);
          listFunctions.push(innerFunction);
      }
      for (let k = 0; k < 5; k++) {
          console.log(listFunctions[k]());
      }
  }
  mainFunction2();

Enter your answer: " response 
answer="1000 1100 1200 1300 1400"
evaluate_answer "$response" "$answer"

next_question

read -p "Write 560000067 using a separator. " response
answer="560_000_067"
evaluate_answer "$response" "$answer"

next_question

read -p "
  Apply the correct typing to the array.

  let multipleTypeArray = [1, true, 3];

Enter you answer: " response
answer="let multipleTypeArrayExplicit: (number | boolean)[] = [1, true, 3];"
evaluate_answer "$response" "$answer"

next_question

read -p "What is the difference between a constant array and a read-only array?" response
answer="A developer can assign values to an array while a read-only array values cannot be changed."
additional_feedback="

  const list1: number[] = [1, 2];
  list1.push(3); // Legit because list1 is not re-assigned.
  // list1 = [4, 5]; // ERROR: We cannot reassign a constant


  read-only:
  let list1: readonly number[] = [1, 2];
  // list1.push(3); // Error, cannot mutate the content 
  list1 = [4, 5]; // Legit, content is not mutated, we create a new list

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
  What is the inferred type by the control flow analysis for this array? 

  let myArray = [];
  myArray[0] = 5;
  myArray[1] = 'aString';
  myArray[2] = true;

Enter your answer: " response
answer="any[]"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Add an exhaustiveCheck for the default statement. 
    
    enum EnumWithChoices {
      ChoiceA,
      ChoiceB,
      ChoiceC,
    }

    function functionReturnStringFromEnum(c: EnumWithChoices): string {
        switch (c) {
            case EnumWithChoices.ChoiceA:
                return 'A';
            case EnumWithChoices.ChoiceB:
                return 'B';
            default:
              
              
        }
    }

Enter your answer: " response
answer="const exhaustiveCheck: never = c; throw new Error(exhaustiveCheck);"
additional_feedback="

  enum EnumWithChoices {
      ChoiceA,
      ChoiceB,
      ChoiceC,
    }

    function functionReturnStringFromEnum(c: EnumWithChoices): string {
        switch (c) {
            case EnumWithChoices.ChoiceA:
                return 'A';
            case EnumWithChoices.ChoiceB:
                return 'B';
            default:
              const exhaustiveCheck: never = c; 
              throw new Error(exhaustiveCheck);
        }
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    What happens in the following code? 

    let variable2: unknown;
    variable2 = 'It is a string';
    console.log(variable2.substr(0,2));

Enter your answer: " response
answer="The code throws a Typescript error, saying Object is of type 'unknown'."
additional_feedback="

  /usr/lib/node_modules/ts-node/src/index.ts:245
    return new TSError(diagnosticText, diagnosticCodes)
           ^
  TSError: ⨯ Unable to compile TypeScript:
  index.ts(3,13): error TS2571: Object is of type 'unknown'.
  index.ts(5,13): error TS2571: Object is of type 'unknown'.

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What are some limitations to casting? " response
answer="When going from a subtype to a type, without casting, the problem is that TypeScript will only validate access to the public type from the desired interface. However, under the hood, the object still contains all the members. For example (see below), TypeB has two members; when casting, it only exposes (at design time) the first member, which is in TypeA. However, printing the object reveals that both members are still there. The lack of cohesion between the type's schema and the actual object structure is an important detail."
additional_feedback="

  You cannot cast a typed object into something that is not a subtype 
  of the original type. If you have a TypeC that inherits TypeB which 
  inherits TypeA, you can cast a TypeC to TypeA or TypeB without problem 
  or TypeB to TypeA without casting.

    interface ICast1 { m1: string } 
    interface ICast2 { m1: string, m2: string } 
    let icast1: ICast1 = { m1: 'm1' }; 
    let icast2: ICast2 = { m1: 'm1', m2: 'm2' }; 
    let icast3: ICast1 = icast2; // work without cast because of the structure 

    console.log(icast1);
    console.log(icast2);
    console.log(icast3);

    //icast2 = icast1; // doesn't work, miss a member 
    let icast4: ICast2 = icast1 as ICast2; // work but m2 undefined 
    console.log(icast4); // { m1: 'm1' } // m2 is missing even if not optional 

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
      What happens when you uncomment icast2 = icast1;


      interface ICast1 { m1: string } 
      interface ICast2 { m1: string, m2: string } 
      let icast1: ICast1 = { m1: 'm1' }; 
      let icast2: ICast2 = { m1: 'm1', m2: 'm2' }; 
      let icast3: ICast1 = icast2; // work without cast because of the structure 

      console.log(icast1);
      console.log(icast2);
      console.log(icast3);

      //icast2 = icast1; // doesn't work, miss a member 
      let icast4: ICast2 = icast1 as ICast2; // work but m2 undefined 
      console.log(icast4); // { m1: 'm1' } // m2 is missing even if not optional 

Enter your answer: " response
answer="Uncommenting shows that without casting, when the structure is not similar, TypeScript blocks the transpilation."
evaluate_answer "$response" "$answer"

next_question

read -p "What is another limitation of type casting? " response
answer="Because casting tells TypeScript that you know what you're doing, it won't complain. However, non-optional members that aren't present will be undefined even if the contract specifies that the type must have the member."

evaluate_answer "$response" "$answer"

next_question

read -p "

    Explain what is taking place in regards to casting in the following code.

      interface ITypeA { m1: string } 
      interface ITypeB extends ITypeA { m2: string } 
      interface ITypeC extends ITypeB { m3: string } 
      const typea: ITypeA = { m1: 'm1' }; 
      const typeb: ITypeB = { m1: 'm1', m2: 'm2' }; 
      let typeb2: ITypeB = typea as ITypeB; // Work (m2 will be missing!!!) 
      let typea2: ITypeA = typeb; // No cast needed 
      console.log(typea2); // { m1: 'm1', m2: 'm2' } However, only m1 is accessible at compilation 
      // let m2 = typea2.m2;


Enter your answer: " response
answer="You can see an example below of when an object of TypeA (base interface) is cast down to TypeB. The cast coerces the change of type, but m2 is still not present.

While it is good enough for TypeScript that you manually override the validation, it can be problematic if later in the code, you try to access m2 and believe that it cannot be undefined. In fact, this can cause a runtime error if you try to access a function of the member. The example below has line 9 commented. It demonstrates that the member is not available at design time. While it is good enough for TypeScript that you manually override the validation, it can be problematic if later in the code, you try to access m2 and believe that it cannot be undefined. In fact, this can cause a runtime error if you try to access a function of the member. The example below has line 9 commented. It demonstrates that the member is not available at design time. However, when commented, you can see that it is present at runtime (JavaScript)."
evaluate_answer "$response" "$answer"

next_question

read -p "Is there a Date type in JavaScript? " response
answer="No. There is a Date object in JavaScript but unfortunately there is no Date type."
evaluate_answer "$response" "$answer"

next_question

read -p "What is an enum? " response
answer="An enum is a structure that proposes several allowed values for a variable. It is a way to constrain variable values by defining specific possible entries."
evaluate_answer "$response" "$answer"

next_question

read -p "
    What is the JavaScript output for this enum? 
    
    enum OrientationString {
        East = 'E',
        West = 'W',
        North = 'N',
        South = 'S',
    }

Enter your answer: " response
answer="(function (Orientation) { })(Orientation || (Orientation = { }));"
additional_feedback="

    let Orientation;
    (function (Orientation) { 

    })(Orientation || (Orientation = { }));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    What is the JavaScript output for this enum? 
    
    enum OrientationString {
        East = 'E',
        West = 'W',
        North = 'N',
        South = 'S',
    }


    let Orientation;
    (function (Orientation) { 

    })(Orientation || (Orientation = { }));

Enter your answer: " response
answer="Orientation[Orientation['East'] = 0] = 'East'; Orientation[Orientation['West'] = 1] = 'West'; Orientation[Orientation['North'] = 2] = 'North'; Orientation[Orientation['South'] = 3] = 'South';"
additional_feedback="

    enum OrientationString {
        East = 'E',
        West = 'W',
        North = 'N',
        South = 'S',
    }

    let Orientation;
    (function (Orientation) { 
        Orientation[Orientation['East'] = 0] = 'East';
        Orientation[Orientation['West'] = 1] = 'West';
        Orientation[Orientation['North'] = 2] = 'North';
        Orientation[Orientation['South'] = 3] = 'South';
    })(Orientation || (Orientation = { }));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a mapped type? " response
answer="Mapped type allows for creating a new type from an existing one."
evaluate_answer "$response" "$answer"

next_question

read -p "What does Extract do? " response
answer="Extract allows a developer to select from a set of types the one that is common in another type. "
evaluate_answer "$response" "$answer"

next_question

read -p "

    Create a generic that removes sound

    interface Animal {
       name: string;
       gender: string;
       sound: string;
    }

Enter your answer: " response
answer="type NoSound = Exclude<keyof Animal, 'sound'>;"
evaluate_answer "$response" "$answer"

next_question

read -p "Use Pick<T, U> and Exclude<T, U> to have a Humen type without a nickname. " response
answer="type LivingThing = Exclude<keyof Animal, keyof NoisyLivingSpecies>; type HumanWithoutNickname = Pick<Human, LivingThing>;"
additional_feedback="

    interface Animal {
       name: string;
       gender: string;
       sound: string;
    }

    interface Human {
        name: string;
        gender: string;
        nickname: string;
    }

    interface NoisyLivingSpecies {
        sound: string;
    }

    type LivingThing = Exclude<keyof Animal, keyof NoisyLivingSpecies>; 
    type HumanWithoutNickname = Pick<Human, LivingThing>;

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Assign functionType3 the primitive types of the return value from getSomething(). 
    
    function getSomething() {
       if (Math.random() < 0.5) {
          return 1;
       } else {
          return '1';
       }
    }

Enter your answer: " response
answer="type functionType = ReturnType<typeof getSomething>;"
additional_feedback="

    function getSomething() {
       if (Math.random() < 0.5) {
          return 1;
       } else {
          return '1';
       }
    }
    
    type functionType = ReturnType<typeof getSomething>;

"
evaluate_answer "$response" "$answer" "$additional_feedback"
next_question

read -p "
    Get the ReturnType using the generic parameter. 
    
    async function asyncFunction() {
      return await Math.random();
    }

Enter your answer: " response
answer="type functionType4 = ReturnType<typeof asyncFunction>;"
additional_feedback="

    async function asyncFunction() {
      return await Math.random();
    }

    type functionType4 = ReturnType<typeof asyncFunction>; // Promise<number>
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Get the ReturnType using the generic parameter. 
    
    async function asyncFunction() {
      return await Math.random();
    }

    type functionType4 = ReturnType<typeof asyncFunction>; // Promise<number>

Enter your answer: " response
answer="type functionType5 = ReturnTypeFromPromise<functionType4>;"
additional_feedback="

    async function asyncFunction() {
      return await Math.random();
    }

    type functionType4 = ReturnType<typeof asyncFunction>; // Promise<number>
    type functionType5 = ReturnTypeFromPromise<functionType4>; // number
    
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Get the ReturnType using the generic parameter. 
    
    async function asyncFunction() {
      return await Math.random();
    }

    type functionType4 = ReturnType<typeof asyncFunction>; // Promise<number>
    type functionType5 = ReturnTypeFromPromise<functionType4>; // number

Enter your answer: " response
answer="type ReturnTypeFromPromise<T> = T extends Promise<infer U> ? U : T;"
additional_feedback="

    async function asyncFunction() {
      return await Math.random();
    }

    type functionType4 = ReturnType<typeof asyncFunction>; // Promise<number>
    type functionType5 = ReturnTypeFromPromise<functionType4>; // number
    type ReturnTypeFromPromise<T> = T extends Promise<infer U> ? U : T;

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "How does the previous code work? " response
answer="The condition type checks if the returned type T extends Promise<?>. If it does, it can infer the type into U and return it. Otherwise, it returns the whole type"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Add a type that accepts a dataModified property.

    interface Person {
      name: string;
      dateCreated: Date;
    }

    const p: Person = { name: 'Pat', dateCreated: new Date() };
    const p2: Modified<Person> = { ...p, modifiedDate: new Date() }; 

Enter your answer: " response
answer="type Modified<T> = T extends { dateCreated: Date } ? T & { modifiedDate: Date } : never;"
additional_feedback="

    interface Person {
      name: string;
      dateCreated: Date;
    }

    type Modified<T> = T extends { dateCreated: Date } ? T & { modifiedDate: Date } : never;

    const p: Person = { name: 'Pat', dateCreated: new Date() };
    const p2: Modified<Person> = { ...p, modifiedDate: new Date() };

"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Create an object called returnValue from the parameters 
    passed to the function. 

    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        
    }

Enter your answer. " response
answer="const returnValue = <TT1 & TT2>{};"
additional_feedback="
    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        const returnValue = <TT1 & TT2>{};
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an object called returnValue from the parameters 
    passed to the function. 

    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        const returnValue = <TT1 & TT2>{};
    }

Enter your answer. " response
answer="for (let index in t1) { }"
additional_feedback="

    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        const returnValue = <TT1 & TT2>{};

        for (let index in t1) { 

        }
    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an object called returnValue from the parameters 
    passed to the function. 

    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        const returnValue = <TT1 & TT2>{};

        for (let index in t1) { 

        }
    }

Enter your answer: " response
answer="(returnValue as TT1)[index] = t1[index];"
additional_feedback="
    function intersectGeneric<TT1, TT2>(t1: TT1, t2: TT2): TT1 & TT2 {
        const returnValue = <TT1 & TT2>{};

        for (let index in t1) { 
          (returnValue as TT1)[index] = t1[index];
        }

        for (let index in t2) {
          (returnValue as TT2)[index] = t2[index];
        }
       return returnValue;
    }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Write a discriminate union for a Tree type. " response
answer="type Tree = | { type: 'empty' } | { type: 'leaf', value: number } | { type: 'node', left: Tree, right: Tree };"
additional_feedback="

    type Tree = 
      | { type: 'empty' }
      | { type: 'leaf', value: number }
      | { type: 'node', left: Tree, right: Tree };

"
evaluate_answer "$response" "$answer"

next_question

read -p "How is as const difference from const? " response
answer="With as const, the declaration is done with let, allowing the value to be changed. But, this change is done only to the literal type."
evaluate_answer "$response" "$answer"

next_question

read -p "
    Create a readonly Tuple.
    let firstTuple = [1, 2];

Enter your answer: " response
answer="let firstTuple: Readonly<[number, number]> = [1, 2];"
additional_feedback="

    let firstTuple: Readonly<[number, number]> = [1, 2];
    firstTuple[0] = 100;

    console.log(firstTuple);

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is never type? " response
answer="It's a special type that has no instances. In other words, it's not possible to create an instance of this type. If we look at it from the perspective of set theory, never is associated with an empty set. Therefore, string | never is just a string because a union of any set with an empty set is just that set."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "What is use case for infer" response
answer="A use case for infer is when a type extends a function that returns an unknown type. It's possible to use infer to have the type be a generic variable."
evaluate_answer "$response" "$answer"

next_question

read -p "
        Write a generic type using infer to get the return type for whatIsMyReturnType(). 
        
        function whatIsMyReturnType(): number {
            return 1;
        }
        // number from 'R'
        type TypeFromReturn = GetReturnedType<typeof whatIsMyReturnType>;
        const dynamicallyTyped: TypeFromReturn = 1;
            
Enter your answer: " response
        
answer="type GetReturnedType<T> = T extends (...args: any[]) => infer R ? R : T;"
additional_feedback="

        type GetReturnedType<T> = T extends (...args: any[]) => infer R ? R : T;
        
        function whatIsMyReturnType(): number {
          return 1;
        }

        // number from 'R'
        type TypeFromReturn = GetReturnedType<typeof whatIsMyReturnType>;
        const dynamicallyTyped: TypeFromReturn = 1;

"
evaluate_answer "$response" "$answer"

next_question

read -p "

    Write a type that infer a type and returns a union. 
    
    type C1 = CombinedType<{ t1: string, t2: string }>;  // string
    type C2 = CombinedType<{ t1: boolean, t2: number }>;  // boolean | number

Enter your answer: " response
answer="type CombinedType<T> = T extends { t1: infer U, t2: infer U } ? U : never;"
additional_feedback="
    type CombinedType<T> = T extends { t1: infer U, t2: infer U } ? U : never;

    type C1 = CombinedType<{ t1: string, t2: string }>;  // string
    type C2 = CombinedType<{ t1: boolean, t2: number }>;  // boolean | number
"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Write some types that infers the what the component props are. 

Enter your answer: " response
answer="type PropsType<C> = C extends React.ComponentType<infer P> ? P : never; type ArticleProps = PropsType<typeof Article>;"
additional_feedback="
    type PropsType<C> =
        C extends React.ComponentType<infer P> ? P : never;

    class Article extends React.Component<{ content: string }> {
        render = () => this.props.content; // This would normally be some JSX.
    }

    type ArticleProps = PropsType<typeof Article>;

"
evaluate_answer "$response" "$answer"

next_question

read -p "

    Write a some code demonstrating that Typescript is structural typed.

    interface Cat {
       name: string;
       breed: string;
    }

    interface Dog {
        name: string;
        breed: string;
    }



Enter your answer: " response
answer="const cat: Cat = { name: 'Filemon', breed: 'Chartreux' }; let dog: Dog = cat;"
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
evaluate_answer "$response" "$answer"

next_question

read -p "
    Write a Map type for Person. 

    interface Person { id: number, name: string };

Enter your answer: " response
answer="let myMap = new Map<number, Person>();"
additional_feedback="
    interface Person { id: number, name: string };
    let myMap = new Map<number, Person>();
"
evaluate_answer "$response" "$answer"

next_question

read -p "

    Create an open-ended tuple.

    ['Tom', 70]
    ['Jane', 70, 60]
    ['Fred', 70, 60, 80]

Enter your answer: " response
answer="[string, ...number[]]"
evaluate_answer "$response" "$answer"

next_question

read -p "What does effect does calling push() on a readonly have? " response
answer="Putting the readonly keyword before an array or object property name only ensures its reference won't change. The array can mutate but it cannot be set to a different array"
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "

    How do you prevent the following array from being mutated?

    interface ImmutableResult {
       readonly name: string;
       readonly scores: number[];
    }

    let tomScores: ImmutableResult = {
       name: 'Tom',
       scores: [50, 95, 80]
    }
    
    tomScores.scores.push(70);

Enter your answer: " response
answer="scores: readonly number[];"
additional_feedback="

    interface ImmutableResult {
       readonly name: string;
       readonly scores: readonly number[];
    }

    let tomScores: ImmutableResult = {
       name: 'Tom',
       scores: [50, 95, 80]
    }
    
    tomScores.scores.push(70);

"
evaluate_answer "$response" "$answer"

next_question

read -p "

    What will TypeScript infer the type of the people variable to be in the declaration below?

    let people = ['Paula', 'Bob', 'Sam'];

Enter your answer: " response
answer="The variable is assigned to an array where all the items are of type string. So, TypeScript infers the variable to be an array where all the items are of type string."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "

    How do you get the following code to work without issue? 

    class Lion implements Greeter {
        public greeting: string = 'Grrrrrr';
        public lionAttack() {
            console.log('Attacking like a lion');
        }
    }
    class Tulip {
        public greeting: string = '...';
        public lookingGood() {
            console.log('Snazzy Flower am I');
        }
    }

    class LivingSpecies {
        public species: Greeter;

        constructor(species: Greeter) {
            this.species = species;
        }
        public getSpecies() {
            return this.species;
        }
    }

    const species = new LivingSpecies(new Tulip());
    species.getSpecies().lookingGood();

Enter your answer: " response
answer="class LivingSpecies<T> { } public species: T; constructor(species: T) { }"
additional_feedback="

    class Lion implements Greeter {
        public greeting: string = 'Grrrrrr';
        public lionAttack() {
            console.log('Attacking like a lion');
        }
    }

    class Tulip {
        public greeting: string = '...';
        public lookingGood() {
            console.log('Snazzy Flower am I');
        }
    }

    class LivingSpecies<T> {
        public species: T;

        constructor(species: T) {
            this.species = species;
        }
        public getSpecies() {
            return this.species;
        }
    }

    const species = new LivingSpecies(new Tulip());
    species.getSpecies().lookingGood();    
"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Why does the function declaration return void while the function expressions return never.

    let a = () => {
      throw new Error('A');
    }

    let b = function() { 
        throw new Error('B');
    }

    function c() { 
        throw new Error('C');
    }

Enter your answer: " response
answer="The reason that the function declaration is different is because of the pattern that a base class defines a function that is expected to be re-defined by a subclass. The pattern dictates that the body of the base class returns an exception that refers to the body of the function later. If TypeScript infers that the type is never, the definition of the body by the base class will not be able to specify a return type, since never is not a subtype of any type."
additional_feedback=""
evaluate_answer "$response" "$answer"

next_question

read -p "

    Solve the callback this problem. 

    const family = {
    names: ['Patrick', 'Alicia', 'Melodie'],
    emotion: 'love',
    print: function() {
        console.log('print', this); // this = the family object
        return this.names.forEach(function(name: string) {
            console.log('forEach', this); // this = implicit any = won't transpile
            });
        },
    };
    family.print();

Enter your answer: " response
answer="interface Family { names: string[]; emotion: string; print: () => void; } const family: Family = { } return this.names.forEach(function(this: Family, name: string) { }, family);"
additional_feedback="

    interface Family {
       names: string[];
       emotion: string;
       print: () => void;
    }

    const family: Family = {
        names: ['Patrick', 'Alicia', 'Melodie'],
        emotion: 'love',
        print: function() {
            console.log('print', this); // this = the family object
            return this.names.forEach(function(this: Family, name: string) {
                console.log('forEach', this);
            }, family);
        },
    };
    family.print();

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the lowercase object in Typescript? " response
answer="The lowercase object was introduced in Typescript 2.2, it the lowercase object type contains all types that are not primitive, for example, undefined, null, number, string, Boolean, and symbol are not an object type."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the uppercase Object? " response
answer="The uppercase Object is the one from JavaScript that gives basic functions like toString, hasOwnProperty, etc. These functions are also available via the prototype chain if you are using curly braces to create an empty object. Direct use of Object is rare. However, when you instantiate a class, it summons a new uppercase Object."
evaluate_answer "$response" "$answer"

next_question

read -p "

    How do you use hasOwnProperty for the following code?
    
    print({ id: 3, y: 2 });

    function print(o) {
        if (o.hasOwnProperty('y')) {
            console.log(o);
        } else if (typeof o === 'number'){
            console.log('Number is ' + o);
        }
    }

Enter your answer: " response
answer="o: Object"
additional_feedback="

    print({ id: 3, y: 2 });

    function print(o: Object) {
        if (o.hasOwnProperty('y')) {
            console.log(o);
        } else if (typeof o === 'number'){
            console.log('Number is ' + o);
        }
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Can you use for-of to iterate over an object? " response
answer="Using it on an object will not work; for-of is more restrictive because it must implement Symbol.iterator."
evaluate_answer "$response" "$answer"

next_question

read -p "
    Multiple objToDesctruct1.destr1 by 100 and redestructor it to get the result. 

    const objToDesctruct1 = { destr1: 1, destr2: "2", destr3: true };
    let { destr1, destr2 } = objToDesctruct1;

    console.log(destr1);

Enter your answer: " response
answer="objToDesctruct1.destr1 *= 100; ({ destr1, destr2 } = objToDesctruct1);"
additional_feedback="
    const objToDesctruct1 = { destr1: 1, destr2: "2", destr3: true };
    let { destr1, destr2 } = objToDesctruct1;

    console.log(destr1);
    objToDesctruct1.destr1 *= 100;

    ({ destr1, destr2 } = objToDesctruct1); // Notice parentheses
    console.log(destr1);
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Why does function get cloned when the function is a function 
    declaration but not a function expression?
    
    class ClassToClone {
       public funct1() {
         console.log('Props1:', this.prop1);
       }
       constructor(public prop1: number, public prop2: string) {}
    }

    const classToClone = new ClassToClone(1, '2');
    const classCloned = { ...classToClone };
    console.log(classCloned); //{ prop1: 1, prop2: '2' }

    class ClassToClone2 {     
       public funct2 = () => { console.log('Props1:', this.prop1); }     
       constructor(public prop1: number, public prop2: string) { } 
    } 

    const classToClone2 = new ClassToClone2(1, '2'); 
    const classCloned2 = { ...classToClone2 }; 
    console.log(classCloned2); // { prop1: 1, prop2: '2', funct2: [Function] } 

Enter your answer: " response
answer="The reason is that the function of the class goes into the prototype, and as mentioned, only members of the object (not the prototype chain) get spread."
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the proper use case for the bang operator? " response
answer="Proper usage is when TypeScript may not infer that during a particular flow of execution, the value cannot be undefined, even if the variable is defined to accept undefined. This is true in the case of deferred initialization or re-initialization."
additional_feedback="
    let deferedInitialezVariable!: number[];
    initialize();
    deferedInitialezVariable.push(4);

    function initialize(): void {
        deferedInitialezVariable = [0, 1, 2, 3];
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "Why is it better to throw an object rather than a string? " response
answer="The reason is that throwing an object comes with a whole execution stack since the object must inherit from the base interface Error. The interface Error defines a name, a message, and the stack."
evaluate_answer "$response" "$answer"

next_question

read -p "What does creating a custom error require using Object.setPrototypeOf? " response
answer="The reason is that with the introduction of TypeScript version 2.1 when using EcmaScript 6, the Error constructor uses new.target to handle the prototype chain. In prior versions of EcmaScript, it did not. By manually calling it or by using the class's prototype to assign it, we restore the peace by being sure that the prototype chain is invoking new.target. Forgetting to do so will cause an issue when using instanceOf. The reason is that since TypeScript 2.1, the constructor functions Error, Array, and Map don't propagate. The workaround is using the setPrototypeOf function in the constructor of each class in the hierarchy. The function sets the prototype to another object."
additional_feedback="

    class MySpecificError extends Error {
      public data: string;
      constructor(data: string, message: string) {
        super(message);
        Object.setPrototypeOf(this, new.target.prototype);
        this.data = data;
      }
    }
    throw new MySpecificError('dataHere', 'My Message');
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    What's an alternative to this solution that doesn't include the return 
    type expressed as a union? 

    function withReturn(p1:number) : number | Error {
       if (wrong) {
         return new Error('My error message');
       }
       return 'String as expected when all good';
    }

Enter your answer: " response
answer="function withCallback(p1: number, error: (errMsg: string) => void): string { }"
additional_feedback="

    function withCallback(p1: number, error:(errMsg: string) => void): string {
      if (wrong) {
        error('My error message');
      }
        return 'String as expected when all good';
    }
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Create an exception handling program for the following classes. 

    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }


Enter the next line: " response
answer="function throwTwoExceptions(switcher: boolean) { }"
additional_feedback="
    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 

    }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an exception handling program for the following classes. 

    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 

    }

Enter the next line: " response
answer="if (switcher) { throw new ArgumentNullException('Switcher'); }"
additional_feedback="
    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Create an exception handling program for the following classes. 

    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }

Enter the next line: " response
answer="try { throw new ArgumentNullException('Switcher'); } catch(ex) { }"
additional_feedback="
    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }

    try { 
      throw new ArgumentNullException('Switcher'); 
    } catch(ex) { 

    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "
    Create an exception handling program for the following classes. 

    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }

    try { 
      throw new ArgumentNullException('Switcher'); 
    } catch(ex) { 

    }

Enter the next line: " response
answer="if (ex instanceof ArgumentNullException) { }"
additional_feedback="
    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }

    try { 
      throw new ArgumentNullException('Switcher'); 
    } catch(ex) { 
        if (ex instanceof ArgumentNullException) { 

        }
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "
    Create an exception handling program for the following classes. 

    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        }
    }

    try { 
      throw new ArgumentNullException('Switcher'); 
    } catch(ex) { 
        if (ex instanceof ArgumentNullException) { 

        }
    }

Enter the next line: " response
answer="else if (ex instanceof ReferenceException) { }"
additional_feedback="
    class ArgumentNullException extends Error {
       constructor(public name: string) {
          super('Argument was undefined');
          Object.setPrototypeOf(this, ArgumentNullException.prototype);
        }
    }

    class ReferenceException extends Error {
        constructor(public x: number, public y: number) {
          super('Reference was undefined');
          Object.setPrototypeOf(this, ReferenceException.prototype);
        }
    }

    function throwTwoExceptions(switcher: boolean) { 
        if (switcher) { 
          throw new ArgumentNullException('Switcher'); 
        } 
    }

    try { 
      throw new ArgumentNullException('Switcher'); 
    } catch(ex) { 
        if (ex instanceof ArgumentNullException) { 

        } else if (ex instanceof ReferenceException) { 

        }
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_question

read -p "
    How would you assert that address ia string?

    function assertAddress(address: any) {
        
       if (typeof address !== 'string') {
         throw new Error('Not a string!');
       }

       if(address.length < 3){
          throw new Error('Address must be above 3 characters');
        }
    }

Enter your answer" response
answer="asserts address is string"
additional_feedback="
    function assertAddress(address: any): asserts address is string {
        
       if (typeof address !== 'string') {
         throw new Error('Not a string!');
       }

       if(address.length < 3){
          throw new Error('Address must be above 3 characters');
        }
    }
"
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "
    Explain the following overload.

    filter(callbackfn: (value: T, index: number, array: T[]) => unknown, thisArg?: any): T[];
    filter<S extends T>(callbackfn: (value: T, index: number, array: T[]) => value is S, thisArg?: any): S[];

Enter your answer: " response
answer="It's a generic function with type argument S, where S is a subtype of T. The type of the callbackFn parameter is (value: T, index: number, array: T[]) => value is S; it's a type guard! All array elements for which callbackFn returns true can be typed as S instead of T. Therefore, the return type of the whole method is S[]."
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "Why would you pass a function to useState that returns the initial state instead of passing the initial state directly?" response
answer="Computing the initial state can be expensive. It's only needed when the component is mounted. However, in a function component it would be calculated on every render. Therefore, you have an option to pass a function that calculates initial state, meaning expensive computation will only be executed once, not on every render."
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_line

read -p "
    Will the following code compile?

    type Person = { name: string } | string;

    class Mother implements Person {
       name: string = "";
    }

Enter your answer: " response
answer="The following code does not compile because the type is a union. A union means a type or another type making the implementation not deterministic."
additional_feedback="

    type Person = { name: string } | string;

    class Mother implements Person {
       name: string = "";
    }

    /usr/lib/node_modules/ts-node/src/index.ts:245
    return new TSError(diagnosticText, diagnosticCodes)
           ^
    TSError: ⨯ Unable to compile TypeScript:
    index.ts(3,25): error TS2422: A class can only implement an object type or intersection of object types with statically known members.

"
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "What is a branded type? " response
answer="The pattern of branded types means creating uniqueness in the structure itself. One way is to use a common name among types and have a unique type. The unique type can be a literal type to avoid the creation of a new unique type each time."
additional_feedback="

    interface TypeA {
       kind: 'TYPEA'
       name: string;
       id: number;
    }

    interface TypeB {
      kind: 'TYPEB'
      error: boolean;
    }

    let var1: TypeA = {
      kind: 'TYPEA',
      name: 'Variable1',
      id: 1
    };

    let var2: TypeB = {
      kind: 'TYPEB',
      error: true
    };

    if (var1 === var2) { // Always will be false 
    
    }

"
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "What is the difference between a module and a namespace? " response
answer="Modules do not use global scope, but rather, their own scope."
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "

    What is the event type for the following function?

    <input
       type=\"text\"
       value={criteria}
       onChange={e => setCriteria(e.currentTarget.value)}
    />

Enter your answer: " response
answer="React.ChangeEvent<HTMLInputElement>"
evaluate_answer "$response" "$answer"

next_question

read -p "
    Make the handleSubmit event handler strongly-typed.

    function Search() {
        const handleSubmit = e => {
           e.preventDefault();
           ...
        };
        return (
            <form onSubmit={handleSubmit} >
            <input
                name=\"search\"
                type=\"text\"
            />
            </form>
        );
    }
Enter your answer: " response
answer="React.FormEvent<HTMLFormElement>"
additional_feedback="

    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
    ...
    };
"
evaluate_answer "$response" "$answer" "$additional_feedback" 

next_question

read -p "

    Build a theme context function for the following code.

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

 
        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

Enter the next line: " response
answer="type ThemeContextType = { theme: string; setTheme: (value: string) => void; };"
additional_feedback="

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

 
        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "

    Build a theme context function for the following code.

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

 
        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

Enter the next line: " response
answer="const ThemeContext = React.createContext<ThemeContextType | undefined>(undefined);"
additional_feedback="
    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

 
        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "

    Build a theme context function for the following code.

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

Enter the next line: " response
answer="const themeValues = { theme, setTheme, };"
additional_feedback="

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "

    Build a theme context function for the following code.

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

Enter the next line: " response
answer="const memoizedValues = useMemo(() => themeValues, [themeValues]);"
additional_feedback="

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        const memoizedValues = useMemo(() => themeValues, [themeValues]);

        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "

    Build a theme context function for the following code.

    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        const memoizedValues = useMemo(() => themeValues, [themeValues]);

        return (
            
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

Enter the next line: " response
answer="<ThemeContext.Provider value={memoizedValues}>{children}</ThemeContext.Provider>"
additional_feedback="
    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        const memoizedValues = useMemo(() => themeValues, [themeValues]);

        return (
            <ThemeContext.Provider value={memoizedValues}>
                {children}
            </ThemeContext.Provider>
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line

read -p "" response
answer="export const useTheme = () => React.useContext(ThemeContext);"
additional_feedback="
    type ThemeContextType = { 
        theme: string; 
        setTheme: (value: string) => void; 
    };

    const ThemeContext = React.createContext<ThemeContextType | undefined>(
       undefined
    );

    export const ThemeProvider = ({ children }: Props) => {
       const [theme, setTheme] = React.useState(defaultTheme);

        React.useEffect(() => {
         const currentTheme = \"lightblue\";
         setTheme(currentTheme);
        }, []);

        const themeValues = {
          theme,
          setTheme,
        };

        const memoizedValues = useMemo(() => themeValues, [themeValues]);

        return (
            <ThemeContext.Provider value={memoizedValues}>
                {children}
            </ThemeContext.Provider>
        );
    };

    const Header = () => {
    const { theme, setTheme } = useTheme()!;
        return (
            <div style={{ backgroundColor: theme }}>
                <select value={theme} onChange={e => setTheme(e.currentTarget.value)}>
                    <option value=\"white\">White</option>
                    <option value=\"lightblue\">Blue</option>
                    <option value=\"lightgreen\">Green</option>
                </select>
                <span>Hello!</span>
            </div>
        );
    };

    export const useTheme = () => React.useContext(ThemeContext);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_question

read -p "

    Why does there have to be an exclamation mark (!) after the call to the useTheme hook?

    const { theme, setTheme } = useTheme()!;

Enter your answer: " response
answer="Exclamation mark tells the TypeScript compiler that its return value won't be undefined."
evaluate_answer "$response" "$answer"

next_question

read -p "

   Define the type in useRef for the input variable.

    const Search = () => {
    const input = React.useRef(null);

    React.useEffect(() => {
      if (input.current) {
        input.current.focus();
      }
    }, []);

      return (
        <form>
         <input ref={input} type=\"search\" />
        </form>
      );
    };

Enter your answer:" response
answer="const input = React.useRef<HTMLInputElement>(null);"
additional_feedback="

 const Search = () => {
  const input = React.useRef<HTMLInputElement>(null);

  React.useEffect(() => {
    if (input.current) {
      input.current.focus();
    }
   }, []);

      return (
        <form>
         <input ref={input} type=\"search\" />
        </form>
      );
 };
"
evaluate_answer "$response" "$answer" "$additional_feedback" 




next_question

read -p "" response
answer=""
additional_feedback=""
evaluate_answer "$response" "$answer" "$additional_feedback" 
 
next_question

read -p "" response
answer=""
evaluate_answer "$response" "$answer"
type Procedure = (...args: any[]) => number;

function over<F extends Procedure>(...fns: F[]) {
  return function (...args: Parameters<F>) {
    return fns.map(function (fn) {
      return fn.apply(null, args);
    });
  };
}

const minMax = over(Math.min, Math.max);
console.log(minMax(1, 2, 3, 4, 5));
console.log(minMax(1, 2, 5, 4, 3));
console.log(minMax(1, 2, 5, -4, 3));
