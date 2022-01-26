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
        echo "    You scored $score% on React recipes."
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

        
       Your answer:     $1
       Correct answer:  $2
        

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


read -p "
   
   Update the value on the array of objects.
   const update = { id: 1, value: 'change' };

   setUserList();


Enter the next line" response
answer="setUserList((prev) => {});"
additional_feedback="

  setUserList((prev) => {

  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback" 

next_line


read -p "
   
   Update the value on the array of objects.

   const update = { id: 1, value: 'change' };

   setUserList((prev) => {

   });


Enter the next line" response
answer="return prev.map((a) => { });"
additional_feedback="

  const update = { id: 1, value: 'change' };

  setUserList((prev) => {
    return prev.map((a) => {
    
    });
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
   
   Update the value on the array of objects.

   const update = { id: 1, value: 'change' };

   setUserList((prev) => {
      return prev.map((a) => {
    
      });
   });


Enter the next line" response
answer="return a.id === update.id ? { ...a, value: update.value } : a;"
additional_feedback="

  const update = { id: 1, value: 'change' };

  setUserList((prev) => {
    return prev.map((a) => {
      return a.id === update.id
            ? { ...a, value: update.value }
            : a;
    });
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write a function in Typescript that handles detecting when 
  a user has scrolled to the bottom of the screen. 

Enter the next line: " response
answer="const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => { };"
additional_feedback="

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {

  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function in Typescript that handles detecting when 
  a user has scrolled to the bottom of the screen. 

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {

  };

Enter the next line: " response
answer="const scrollTop = e.currentTarget?.scrollTop;"
additional_feedback="

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
  };
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function in Typescript that handles detecting when 
  a user has scrolled to the bottom of the screen. 

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
  };

Enter the next line: " response
answer="const scrollHeight = e.currentTarget?.scrollHeight;"
additional_feedback="

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
    const scrollHeight = e.currentTarget?.scrollHeight;
  };  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function in Typescript that handles detecting when 
  a user has scrolled to the bottom of the screen. 

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
    const scrollHeight = e.currentTarget?.scrollHeight;
  }; 

Enter the next line: " response
answer="const clientHeight = e.currentTarget?.clientHeight;"
additional_feedback="

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
    const scrollHeight = e.currentTarget?.scrollHeight;
    const clientHeight = e.currentTarget?.clientHeight;
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function in Typescript that handles detecting when 
  a user has scrolled to the bottom of the screen. 

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
    const scrollHeight = e.currentTarget?.scrollHeight;
    const clientHeight = e.currentTarget?.clientHeight;
  };

Enter the next line: " response
answer="if (scrollTop + clientHeight >= scrollHeight) { setBottom(true); }"
additional_feedback="

  const handleScroll = (e: React.SyntheticEvent<HTMLDivElement>): void => {
    const scrollTop = e.currentTarget?.scrollTop;
    const scrollHeight = e.currentTarget?.scrollHeight;
    const clientHeight = e.currentTarget?.clientHeight;

    if (scrollTop + clientHeight >= scrollHeight) { 
      setBottom(true); 
    }
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How would you handle exceptions in the following code so that
  exception aren't hidden?

  setIsLoaded(true);
  setItems(result);
  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
     
  }, []);


Enter the next line: " response
answer=".then((res) => res.json())"
additional_feedback="

  setIsLoaded(true);
  setItems(result);
  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
     
  }, []);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How would you handle exceptions in the following code so that
  exception aren't hidden?

  setIsLoaded(true);
  setItems(result);
  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
  }, []);


Enter the next line: " response
answer=".then((result) => { });"
additional_feedback="

  setIsLoaded(true);
  setItems(result);
  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
       .then((result) => { 

       });
  }, []);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How would you handle exceptions in the following code so that
  exception aren't hidden?

  setIsLoaded(true);
  setItems(result);
  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
       .then((result) => { 
         
       });
  }, []);


Enter the next line: " response
answer="setIsLoaded(true); setItems(result);"
additional_feedback="

  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
       .then((result) => { 
          setIsLoaded(true);
          setItems(result);
       });
  }, []);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How would you handle exceptions in the following code so that
  exception aren't hidden?

  setError(error);

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
       .then((result) => { 
          setIsLoaded(true);
          setItems(result);
       });
  }, []);


Enter the next line: " response
answer="(error) => { setIsLoaded(true); setError(error); }"
additional_feedback="

  useEffect(() => {
    fetch(\"https://restcountries.eu/rest/v2/all\")
       .then((res) => res.json())
       .then((result) => { 
          setIsLoaded(true);
          setItems(result);
       },
       (error) => { 
          setIsLoaded(true); 
          setError(error); 
       });
  }, []);


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Finish writing the logic on the following component that will
  perform a search on an array of items using search params.

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);
              
  <ul>
    {search(items).map((item) => (
    <li>
      <article key=\"{item.id}\">
          <h2>{item.name}</h2>
          <ol >
            <li>
              population:{" "}
              <span>{item.population}</span>
            </li>
            <li>Region: <span>{item.region}</span></li>
            <li>Capital: <span>{item.capital}</span></li>
          </ol>
      </article>
    </li>
    ))}
  </ul>

}


Enter the next line: " response
answer="function search(items) { }"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

    function search(items) { 

    }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul>

 }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Finish writing the logic on the following component that will
  perform a search on an array of items using search params.

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

    function search(items) { 

    }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul>

 }


Enter the next line: " response
answer="return items.filter((item) => { });"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 

       });
     }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul>

 }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Finish writing the logic on the following component that will
  perform a search on an array of items using search params.

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 

       });
     }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul> 
  }


Enter the next line: " response
answer="return searchParam.some((newItem) => { });"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 
         return searchParam.some((newItem) => { 

         });
       });
     }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul> 
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Finish writing the logic on the following component that will
  perform a search on an array of items using search params.

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

    
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul>
  }



Enter the next line: " response
answer="return item[newItem].toString().toLowerCase().indexOf(q.toLowerCase()) > -1;"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 
         return searchParam.some((newItem) => { 
           return item[newItem].toString().toLowerCase().indexOf(q.toLowerCase()) > -1;
         });
       });
     }
              
    <ul>
      {search(items).map((item) => (
      <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
              <li>
                population:{" "}
                <span>{item.population}</span>
              </li>
              <li>Region: <span>{item.region}</span></li>
              <li>Capital: <span>{item.capital}</span></li>
            </ol>
        </article>
      </li>
      ))}
    </ul> 
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

Enter the next line: " response
answer="const multiSort = <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>"
additional_feedback="

  const multiSort = <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort = <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>

Enter the next line: " response
answer="(a: Item, b: Item) => { };"
additional_feedback="

  const multiSort =
    <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
    (a: Item, b: Item) => {
  
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
    <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
    (a: Item, b: Item) => {
  
  };

Enter the next line: " response
answer="for (let comparator of comparators) { }"
additional_feedback="

  const multiSort =
    <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
    (a: Item, b: Item) => {

      for (let comparator of comparators) { 

      }
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
    <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
    (a: Item, b: Item) => {

      for (let comparator of comparators) { 

      }
  };

Enter the next line: " response
answer="const comparatorResult = comparator(a, b);"
additional_feedback="

    const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
      }
    };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
      }
   };

Enter the next line: " response
answer="if (comparatorResult !== 0) return comparatorResult;"
additional_feedback="

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
   };
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
   };

Enter the next line: " response
answer="return 0;"
additional_feedback="

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
      return 0;
   };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
      return 0;
   };

Enter the next line: " response
answer="const sortedBooks = books.sort();"
additional_feedback="

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
      return 0;
   };
  
  const sortedBooks = books.sort();

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
      return 0;
   };
  
  const sortedBooks = books.sort();


Enter the next line: " response
answer="multiSort((a, b) => a.title.localeCompare(b.title), (a, b) => a.published - b.published)"
additional_feedback="

  const multiSort =
      <Item>(...comparators: Array<(a: Item, b: Item) => number>) =>
      (a: Item, b: Item) => {

      for (let comparator of comparators) { 
        const comparatorResult = comparator(a, b);
        if (comparatorResult !== 0) return comparatorResult;
      }
      return 0;
   };
  
  const sortedBooks = books.sort(
    multiSort(
      (a, b) => a.title.localeCompare(b.title), 
      (a, b) => a.published - b.published
    ),
  );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a multi-sort utility for the array of books.

Enter the next line: " response
answer=""
additional_feedback="

  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"



# type Props = { children: React.ReactNode; type: "submit" | "button" };
# export type Ref = HTMLButtonElement;
# export const FancyButton = React.forwardRef<Ref, Props>((props, ref) => (
#   <button ref={ref} className="MyClassName" type={props.type}>
#     {props.children}
#   </button>
# ));


# type Props = { children: React.ReactNode; type: "submit" | "button" };
# export type Ref = HTMLButtonElement;
# export const FancyButton = React.forwardRef((
#   props: Props,
#   ref: React.Ref<Ref> // <-- here!
# ) => (
#   <button ref={ref} className="MyClassName" type={props.type}>
#     {props.children}
#   </button>
# ));

# You can make it immutable if you have to - assign React.Ref


# // this is a higher-order-function that returns a function
# function add(x: number): (y: number) => number {
#     // A function is returned here as closure
#     // variable x is obtained from the outer scope of this method and memorized in the closure
#     return (y: number): number => x + y;
# }

# // we are currying the add method to create more variations
# var add10 = add(10);
# var add20 = add(20);
# var add30 = add(30);

# console.log(add10(5)); // 15
# console.log(add20(5)); // 25
# console.log(add30(5)); // 35

# type Callback = (n: number) => void;
# function cb(){

# }

# const func: (num: number) => string = (num: number) => console.log(num);
# const func: (num: number) => string = (num: number) => String(num);


# function fillArray<T>(len: number, elem: T) {
#   return new Array<T>(len).fill(elem);
# }





# Type mapping over children
#         {React.Children.map<ReactNode, ReactNode>(mainMenu, (child) => {
#     const menu = child as ReactElement<PropsWithChildren<SidebarProps>>;
#     const props = menu.props.navItems.map((prop) => {
#         return {
#           ...prop,
#           ...(prop.href ? { onClick: closeMenu } : ''),
#         };
#       });
#         if (isValidElement(child)) {
#           return cloneElement(child, {
#             ...menu.props,
#             navItems: [...props],
#           });
#         }
#       })}



# Handle click event
#       useEffect(() => {
#     const sidebar = document.getElementById('dotSidebar') as HTMLDivElement;
#     sidebar.addEventListener('mousedown', (e: Event) => {
#       if (sidebar.contains(e.target as HTMLElement)) {
#         if ((e.target as HTMLElement).getAttribute('href')) {
#           setIsOpen(false)
#         }
#       }
#     });
#     setIsOpen(open);
#   }, [open]);




#   import React, {
#   createContext,
#   useMemo,
#   ReactNode,
#   useState,
#   useContext,
# } from 'react';
# import { DotSnackbarContainer } from './DotSnackbarContainer';

# const initialState = [
#   { message: '', open: false, severity: 'success', id: '' },
# ];

# interface DotSnackbarProviderProps {
#   children: ReactNode;
# }

# type Severity = 'success' | 'warning' | 'info' | 'error';

# interface DotSnackbarProps {
#   alerts: typeof initialState;
#   enqueueMessage: (message: string, severity: Severity) => void;
#   removeMessage: (id: string) => void;
# }

# const DotSnackbarContext = createContext<DotSnackbarProps>({
#   alerts: [],
#   enqueueMessage: (message: string, severity: Severity) => null,
#   removeMessage: (id: string) => null,
# });

# export const DotSnackbarProvider = ({ children }: DotSnackbarProviderProps) => {
#   const [alerts, setAlerts] = useState<typeof initialState>([]);

#   function enqueueMessage(message: string, severity: Severity): void {
#     const queue = { id, message, severity, open: true };

#     setAlerts((prevState) => {
#       return [...prevState, { ...queue }];
#     });
#   }

#   const removeMessage = (id: string) => {
#     setAlerts((prev) => {
#       return prev.map((a) => {
#         return a.id === id ? { ...a, open: false } : a;
#       });
#     });
#   };

#   const DotSnackbarValues = {
#     alerts,
#     enqueueMessage,
#     removeMessage,
#   };

#   const memoizedValues = useMemo(() => DotSnackbarValues, [alerts]);

#   return (
#     <DotSnackbarContext.Provider value={memoizedValues}>
#       <DotSnackbarContainer />
#       {children}
#     </DotSnackbarContext.Provider>
#   );
# };

# export const useDotSnackbarContext = () => {
#   return useContext(DotSnackbarContext);
# };




# Handle a click event with curry function
# function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
#     return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) {
#       setInput(oldValues => ({
#         ...oldValues,
#         fields: {
#           ...oldValues.fields,
#           [type]: e.target.value,
#         },
#       }));
#     };
#   }


# string interpolation
# data-tile={`${item[`tile${index}`]}`}


#   import React, { useState } from "react";
# import "./styles.css";
# function Game() {
#   const [player, setPlayer] = useState(0);
#   const [boardValues, setBoardValue] = useState([{
#     tile0: 'tile0', boardValue: ''},
#     {tile1: 'tile1', boardValue: ''},
#     {tile2: 'tile2', boardValue: ''},
#    { tile3: 'tile3', boardValue: ''},
#     {tile4: 'tile4', boardValue: ''},
#     {tile5: 'tile5', boardValue: ''},
#     {tile6: 'tile6', boardValue: ''},
#     {tile7: 'tile7', boardValue: ''},
#     {tile8: 'tile8', boardValue: ''},
#   ]);

#   const handlePlayers = (index) =>{
#     return (e) => {
#     const copyOfBoard = [...boardValues];
    
#     if(player === 0){
#       copyOfBoard[index] = {
#         ...copyOfBoard[index],
#         boardValue: 'X'
#       }
#       setBoardValue(copyOfBoard)
#        return setPlayer(1);
#     }
#     copyOfBoard[index] = {
#       ...copyOfBoard[index],
#       boardValue: 'O'
#     }
#     setBoardValue(copyOfBoard)
#      return setPlayer(0);

#     }
#   }

#   return (
#     <div>
#       Board:
#       <h3> Player {player === 0 ? '0' : 'X'} is playing </h3>
#       <div className="board">
#         {
#           boardValues.map((item, index)=>{
#             return (
#             <div 
#             key={index} 
#             data-tile={`${item[`tile${index}`]}`}
#             onClick={handlePlayers(index)} 
#             className={"tile"}>
#                 {item.boardValue}
#             </div>
#             )
#           })
#         }
        
        
#       </div>
#       <button onClick={() => {}}>Reset</button>
#     </div>
#   );
# }

# export default function App() {
#   return (
#     <div className="App">
#       <h1>Tic Tac Toe</h1>
#       <Game />
#     </div>
#   );
# }

# //class syntax below is equivalent
# // export default class Game extends React.Component {
# //   constructor(props) {
# //     super(props);
# //     this.state = {
# //       player: 0
# //     };
# //   }
# //   render() {
# //     return (
# //       <div>
# //         Board:
# //         <div>...</div>
# //         <button onClick={() => {}}>Reset</button>
# //       </div>
# //     );
# //   }
# // }
