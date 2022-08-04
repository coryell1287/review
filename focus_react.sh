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
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
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
        
       Wrong! There is no tomorrow, 
       so get this right now!

        
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


Enter the next line: " response
answer="setUserList((prev) => { });"
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


Enter the next line: " response
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


Enter the next line: " response
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

read -p "Write a curry function that updates an array of user with a given index. " response
answer="const handleUserUpdate = (index: number) => { };"
additional_feedback="

  const handleUserUpdate = (index: number) => { 
    
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a curry function that updates an array of user with a given index. 

  const handleUserUpdate = (index: number) => { 
    
  };


Enter the next line: " response
answer="const tempArr = [...users];"
additional_feedback="

  const handleUserUpdate = (index: number) => {
    const tempArr = [...users];
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a curry function that updates an array of user with a given index. 

  const handleUserUpdate = (index: number) => { 
    const tempArr = [...users];
  };


Enter the next line: " response
answer="return (e: React.ChangeEvent<HTMLInputElement>) => { };"
additional_feedback="

  const handleUserUpdate = (index: number) => {
    const tempArr = [...users];

    return (e: React.ChangeEvent<HTMLInputElement>) => { 

    };
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a curry function that updates an array of user with a given index. 

  const handleUserUpdate = (index: number) => {
    const tempArr = [...users];

    return (e: React.ChangeEvent<HTMLInputElement>) => { 

    };
  };


Enter the next line: " response
answer="tempArr[index] = { ...tempArr[index], value: e.target.value };"
additional_feedback="

  const handleUserUpdate = (index: number) => { 
    const tempArr = [...users];

    return (e: React.ChangeEvent<HTMLInputElement>) => { 
      tempArr[index] = { 
        ...tempArr[index], 
        value: e.target.value 
      };
    };
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Write a curry function that updates an array of user with a given index. 

  const handleUserUpdate = (index: number) => { 
    const tempArr = [...users];

    return (e: React.ChangeEvent<HTMLInputElement>) => { 
      tempArr[index] = { 
        ...tempArr[index], 
        value: e.target.value 
      };
    };
  };


Enter the next line: " response
answer="setUserInput(e.target.value); setUserList(tempArr);"
additional_feedback="

  const handleUserUpdate = (index: number) { 
    const tempArr = [...users];

    return (e: React.ChangeEvent<HTMLInputElement>) => { 
      tempArr[index] = { 
        ...tempArr[index], 
        value: e.target.value 
      };
      setUserInput(e.target.value);
      setUserList(tempArr);
    }
  };

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
                population:{\" \"}
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
              
    <ul>
        {search(items).map((item) => (
        <li>
        <article key=\"{item.id}\">
            <h2>{item.name}</h2>
            <ol >
                <li>
                population:{\" \"}
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
                population:{\" \"}
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
                population:{\" \"}
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
                population:{\" \"}
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
answer="return searchParam.some((param) => { });"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 
         return searchParam.some((param) => { 

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
                population:{\" \"}
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
         return searchParam.some((param) => { 

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
                population:{\" \"}
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
answer="return item[param].toString().toLowerCase().indexOf(q.toLowerCase()) > -1;"
additional_feedback="

  function App() {
    const [items, setItems] = useState([]);
    const [q, setQ] = useState('');
    const [searchParam] = useState(['capital', 'name']);

     function search(items) { 
       return items.filter((item) => { 
         return searchParam.some((param) => { 
           return item[param].toString().toLowerCase().indexOf(q.toLowerCase()) > -1;
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
                population:{\" \"}
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
answer="multiSort((a, b) => a.title.localeCompare(b.title), (a, b) => a.published - b.published);"
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

next_question

read -p "

  Use string interpolation to map to the tile property.

      const [boardValues, setBoardValue] = useState([
        { tile0: 'tile0', boardValue: '' },
        { tile1: 'tile1', boardValue: '' },
        { tile2: 'tile2', boardValue: '' },
        { tile3: 'tile3', boardValue: '' },
        { tile4: 'tile4', boardValue: '' },
        { tile5: 'tile5', boardValue: '' },
        { tile6: 'tile6', boardValue: '' },
        { tile7: 'tile7', boardValue: '' },
        { tile8: 'tile8', boardValue: '' },
      ];

      {
        boardValues.map((item, index) => {
          return (
          <div 
            key={index} 
            data-tile=\"tile\"
            onClick={handlePlayers(index)} 
            >
              {item.boardValue}
          </div>
          )
        })
      }

Enter the next line: " response
answer="data-tile={\`\${item[\`tile\${index}\`]}\`}"
additional_feedback="

      const [boardValues, setBoardValue] = useState([
        { tile0: 'tile0', boardValue: '' },
        { tile1: 'tile1', boardValue: '' },
        { tile2: 'tile2', boardValue: '' },
        { tile3: 'tile3', boardValue: '' },
        { tile4: 'tile4', boardValue: '' },
        { tile5: 'tile5', boardValue: '' },
        { tile6: 'tile6', boardValue: '' },
        { tile7: 'tile7', boardValue: '' },
        { tile8: 'tile8', boardValue: '' },
      ];
  
      {
        boardValues.map((item, index) => {
          return (
          <div 
            key={index} 
            data-tile={\`\${item[\`tile\${index}\`]}\`}
            onClick={handlePlayers(index)} 
            >
              {item.boardValue}
          </div>
          )
        })
      }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Complete the code that alternates between players and updates the
  boardValue to either X or O.

  const handlePlayers = (index) => {  

  };


Enter the next line: " response
answer="return function(e) { }"
additional_feedback="

  const handlePlayers = (index) => {  
    return function(e) { 

    }
  };
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that alternates between players and updates the
  boardValue to either X or O.

  const handlePlayers = (index) => {  
    return function(e) { 

    }
  };


Enter the next line: " response
answer="let copyOfBoard = [...boardValues];"
additional_feedback="

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];
    }
  };    

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that alternates between players and updates the
  boardValue to either X or O.

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];
    }
  }; 


Enter the next line: " response
answer="if (player === 0) { }"
additional_feedback="

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 

      }
    }
  }; 
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that alternates between players and updates the
  boardValue to either X or O.

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 
    
      }
    }
  };


Enter the next line: " response
answer="copyOfBoard[index] = { ...copyOfBoard[index], boardValue: 'O' };"
additional_feedback="

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 
       copyOfBoard[index] = {
         ...coypOfBoard[index],
         boardValue: 'O'
       };
      }
    }
  };
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that alternates between players and updates the
  boardValue to either X or O.

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 
       copyOfBoard[index] = {
         ...copyOfBoard[index],
         boardValue: 'O'
       };
      }
    }
  };


Enter the next line: " response
answer="setBoardValue(copyOfBoard); return setPlayer(1);"
additional_feedback="

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 
       copyOfBoard[index] = {
         ...copyOfBoard[index],
         boardValue: 'O'
       };
        setBoardValue(copyOfBoard); 
        return setPlayer(1);
      }
    }
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

echo "

  The rest of the logic works the same.

  const handlePlayers = (index) => {  
    return function(e) { 
      let copyOfBoard = [...boardValues];

      if (player === 0) { 
        copyOfBoard[index] = {
          ...copyOfBoard[index],
          boardValue: 'O'
        };
         setBoardValue(copyOfBoard); 
         return setPlayer(1);
      }

      copyOfBoard[index] = {
         ...copyOfBoard[index],
         boardValue: 'X'
      };
      setBoardValue(copyOfBoard);
      return setPlayer(0);
    }
  };

"


next_question

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };


Enter the next line: " response
answer="function calculateScore(row, column, player, sizeOfBoard = 3) { }"
additional_feedback="

  function calculateScore(row, column, player, sizeOfBoard = 3) {

  }
  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {

  }


Enter the next line: " response
answer="players[player].rowsContainer[row] += 1;"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
  }

Enter the next line: " response
answer="players[player].columnsContainer[column] += 1;"
additional_feedback="
  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;
  }


Enter the next line: " response
answer="if (row === column) { players[player].diagonalContainer[row] += 1; }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }
  }


Enter the next line: " response
answer="if (row + column + 1 === sizeOfBoard) { players[player].oppositeDiagonalContainer[row] += 1; }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }
  }


Enter the next line: " response
answer="if (players[player].rowsContainer[row] === sizeOfBoard) { console.log(\`\${player} wins\`); }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }


Enter the next line: " response
answer="if (players[player].columnsContainer[column] === sizeOfBoard) { console.log(\`\${player} wins\`); }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }

  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }


Enter the next line: " response
answer="let sumForRegularDiagonalElements = 0; let sumForOppositeDiagonalElements = 0;"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;
  }


Enter the next line: " response
answer="for (let i of players[player].diagonalContainer) { }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 

    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

    const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 

    }
  }

Enter the next line: " response
answer="sumForRegularDiagonalElements += players[player].diagonalContainer[i];"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
    }
  }


Enter the next line: " response
answer="sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
      sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
      sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];
    }
  }


Enter the next line: " response
answer="if (sumForRegularDiagonalElements === sizeOfBoard) { console.log(\`\${player} wins\`); }"
additional_feedback="

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
      sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];
    }

    if (sumForRegularDiagonalElements === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the code that calculates the score in a tic tac toe game.

  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
      sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];
    }

    if (sumForRegularDiagonalElements === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

  }


Enter the next line: " response
answer="if (sumForOppositeDiagonalElements === sizeOfBoard) { console.log(\`\${player} wins\`); }"
additional_feedback="
  const players = {
    X: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
    O: {
        rowsContainer: [0, 0, 0],
        columnsContainer: [0, 0, 0],
        diagonalContainer: [0, 0, 0],
        oppositeDiagonalContainer: [0, 0, 0],
    },
  };

  function calculateScore(row, column, player, sizeOfBoard = 3) {
    players[player].rowsContainer[row] += 1;
    players[player].columnsContainer[column] += 1;

    if (row === column) { 
      players[player].diagonalContainer[row] += 1; 
    }

    if (row + column + 1 === sizeOfBoard) { 
      players[player].oppositeDiagonalContainer[row] += 1; 
    }

    if (players[player].rowsContainer[row] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (players[player].columnsContainer[column] === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    let sumForRegularDiagonalElements = 0; 
    let sumForOppositeDiagonalElements = 0;

    for (let i of players[player].diagonalContainer) { 
      sumForRegularDiagonalElements += players[player].diagonalContainer[i];
      sumForOppositeDiagonalElements += players[player].oppositeDiagonalContainer[i];
    }

    if (sumForRegularDiagonalElements === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }

    if (sumForOppositeDiagonalElements === sizeOfBoard) { 
      console.log(\`\${player} wins\`); 
    }
  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Calcuate rows and columns on a 3 by 3 board. " response
answer="const row = Math.floor(index / 3); const column = Math.floor(index % 3);"
additional_feedback="

  
"
evaluate_answer_written_with_code "$response" "$answer" 

next_line

read -p "

  Write a curry function that handles the change event on a form element.

  function handleInput(){
    
  }

Enter the next line: " response
answer="(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void"
additional_feedback="

  function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {

  }
  
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Write a curry function that handles the change event on a form element.

  function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {

  }

Enter the next line: " response
answer="return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { }"
additional_feedback="

  function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
    return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { 

    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a curry function that handles the change event on a form element.

  function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
    return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { 

    }
  }

Enter the next line: " response
answer="setInput(prev => ({ }));"
additional_feedback="

  function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
    return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { 
      setInput(prev => ({ 

      }));
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

# next_line

# read -p "

#   Write a curry function that handles the change event on a form element.

#   function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
#     return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { 
#       setInput(prev => ({ 
#         ...prev, fields: { 
#           ...prev.fields, 
#           [type]: e.target.value 
#         }
#       }));
#     }
#   }

# Enter the next line: " response
# answer="...prev, fields: { ...prev.fields, [type]: e.target.value }"
# additional_feedback="

#   function handleInput(type: keyof FormInput): (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void {
#     return function (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) { 
#       setInput(prev => ({ 
#         ...prev, fields: { 
#           ...prev.fields, 
#           [type]: e.target.value 
#         }
#       }));
#     }
#   }

# "
# evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Write the types for this reducer.

  function counterReducer(state, action) {
      const { type, payload } = action;
      switch (type) {
        case 'INCREASE':
          return {
            ...state,
            value: state.count + payload,
          };
        case 'DECREASE':
          return {
            ...state,
            value: state.count - payload,
          };
        default:
          throw Error(\`\${type} does not match.\`);
      }
    }


Enter the next line: " response
answer="enum CountActionKind { INCREASE = 'INCREASE', DECREASE = 'DECREASE', }"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write the types for this reducer.

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }


Enter the next line: " response
answer="interface CountAction { type: CountActionKind; payload: number; }"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write the types for this reducer.

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

Enter the next line: " response
answer="interface CountState { count: number; }"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write the types for this reducer.

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state, action) {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

Enter the next line: " response
answer="function counterReducer(state: CountState, action: CountAction): CountState { }"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state: CountState, action: CountAction): CountState {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write the types for this reducer.

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state: CountState, action: CountAction): CountState {
    const { type, payload } = action;
    switch (type) {
      case 'INCREASE':
        return {
          ...state,
          value: state.count + payload,
        };
      case 'DECREASE':
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

Enter the next line: " response
answer="CountActionKind.INCREASE: CountActionKind.DECREASE:"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state: CountState, action: CountAction): CountState {
    const { type, payload } = action;
    switch (type) {
      case CountActionKind.INCREASE:
        return {
          ...state,
          value: state.count + payload,
        };
      case CountActionKind.DECREASE:
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write the types for this reducer.

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state: CountState, action: CountAction): CountState {
    const { type, payload } = action;
    switch (type) {
      case CountActionKind.INCREASE:
        return {
          ...state,
          value: state.count + payload,
        };
      case CountActionKind.DECREASE:
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        throw Error(\`\${type} does not match.\`);
    }
  }

Enter the next line: " response
answer="const exhaustiveCheck: never = type; throw new Error(exhaustiveCheck);"
additional_feedback="

  enum CountActionKind { 
    INCREASE = 'INCREASE', 
    DECREASE = 'DECREASE', 
  }

  interface CountAction { 
    type: CountActionKind; 
    payload: number; 
  }

  interface CountState { 
    count: number; 
  }

  function counterReducer(state: CountState, action: CountAction): CountState {
    const { type, payload } = action;
    switch (type) {
      case CountActionKind.INCREASE:
        return {
          ...state,
          value: state.count + payload,
        };
      case CountActionKind.DECREASE:
        return {
          ...state,
          value: state.count - payload,
        };
      default:
        const exhaustiveCheck: never = type; 
        throw new Error(exhaustiveCheck);
    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Create a interfaces for the PostsContext API.

  export const PostsContext = createContext(postsContextDefaultValue);
  
Enter the next line: " response
answer="interface PostsContextData { }"
additional_feedback="

  interface PostsContextData { 
  
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
  
  } 

  export const PostsContext = createContext(postsContextDefaultValue);
  
Enter the next line: " response
answer="posts: Post[];"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"
next_line

read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
  }

  export const PostsContext = createContext(postsContextDefaultValue);
  
Enter the next line: " response
answer="isLoading: boolean;"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"
next_line

read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
  }  

  export const PostsContext = createContext(postsContextDefaultValue);
  
Enter the next line: " response
answer="fetchPosts: () => void;"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void;  
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"
next_line

read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void;  
  }

  export const PostsContext = createContext(postsContextDefaultValue);
  
Enter the next line: " response
answer="removePost: (postId: number) => void;"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  export const PostsContext = createContext(postsContextDefaultValue);

Enter the next line: " response
answer="const postsContextDefaultValue: PostsContextData = { };"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    
  };

  export const PostsContext = createContext<PostsContextData>(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    
  };

  export const PostsContext = createContext(postsContextDefaultValue);

Enter the next line: " response
answer="posts: [],"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
  };

  export const PostsContext = createContext<PostsContextData>(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
  };

  export const PostsContext = createContext(postsContextDefaultValue);

Enter the next line: " response
answer="isLoading: false,"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
    isLoading: false,
  };

  export const PostsContext = createContext<PostsContextData>(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
    isLoading: false,
  };

  export const PostsContext = createContext(postsContextDefaultValue);

Enter the next line: " response
answer="fetchPosts: () => null,"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
    isLoading: false,
    fetchPosts: () => null,
  };

  export const PostsContext = createContext<PostsContextData>(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "

  Create a interfaces for the PostsContext API.

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
    isLoading: false,
    fetchPosts: () => null,
  };

  export const PostsContext = createContext(postsContextDefaultValue);

Enter the next line: " response
answer="removePost: (postId: number) => null"
additional_feedback="

  interface PostsContextData { 
    posts: Post[]; 
    isLoading: boolean; 
    fetchPosts: () => void; 
    removePost: (postId: number) => void; 
  }  

  const postsContextDefaultValue: PostsContextData = { 
    posts: [],
    isLoading: false,
    fetchPosts: () => null,
    removePost: (postId: number) => null
  };

  export const PostsContext = createContext<PostsContextData>(postsContextDefaultValue);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Complete the functionality for fetchPosts.
  
  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);
  
      const fetchPosts = {

      }
    
      const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

Enter the next line: " response
answer="useCallback(() => { }, [setPosts]);"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  } 

Enter the next line: " response
answer="setIsLoading(true);"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the functionality for fetchPosts.

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

Enter the next line: " response
answer="fetch('api')"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);
      fetch('https://api/posts')

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the functionality for fetchPosts.

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);
      fetch('https://api/posts')

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

Enter the next line: " response
answer=".then((res) => res.json())"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);
      fetch('https://api/posts')
        .then((res) => res.json())

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

 Complete the functionality for fetchPosts.

 function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);
      fetch('https://api/posts')
        .then((res) => res.json())

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

Enter the next line: " response
answer=".then((result) => { setPosts(result); })"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

      fetch('https://api/posts')
        .then((res) => res.json())
        .then((result) => { 
          setPosts(result); 
        })

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

 Complete the functionality for fetchPosts.

 function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);
      fetch('https://api/posts')
        .then((result) => { 
          setPosts(result); 
        })

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }

Enter the next line: " response
answer=".finally(() => { setIsLoading(false); });"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

      fetch('https://api/posts')
        .then((res) => res.json())
        .then((result) => { 
          setPosts(result); 
        }).finally(() => { 
          setIsLoading(false); 
        });

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
      return { }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete the functionality for fetchPosts.

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

      fetch('https://api/posts')
        .then((res) => res.json())
        .then((result) => { 
          setPosts(result); 
        }).finally(() => { 
          setIsLoading(false); 
        });

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
    return { };
  } 


Enter the next line: " response
answer="return { posts, isLoading, fetchPosts, removePost };"
additional_feedback="

  function usePostsContextValue(): PostsContextData {
    const [posts, setPosts] = useState<Post[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchPosts = useCallback(() => {
      setIsLoading(true);

      fetch('https://api/posts')
        .then((res) => res.json())
        .then((result) => { 
          setPosts(result); 
        }).finally(() => { 
          setIsLoading(false); 
        });

    }, [setPosts]); 

    const removePost = useCallback((postId: number) => {
      // remove logic
      }, [setPosts, posts]);
    
    return { 
      posts, 
      isLoading, 
      fetchPosts, 
      removePost 
    };
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
  Memoize the return value.

   return { 
      posts, 
      isLoading, 
      fetchPosts, 
      removePost 
    };

Enter the next line: " response 
answer="const postsContextValues = { posts, isLoading, fetchPosts, removePost };"
additional_feedback="

  const postsContextValues = { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

  return { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Memoize the return value.

  const postsContextValues = { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

  return { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

Enter the next line: " response
answer="return useMemo(() => );"
additional_feedback="

  const postsContextValues = { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

  return useMemo(() => );
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Memoize the return value.

  const postsContextValues = { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

  return useMemo(() => );

Enter the next line: " response
answer="postsContextValues, [posts, isLoading, fetchPosts, removePost]"
additional_feedback="

  const postsContextValues = { 
    posts, 
    isLoading, 
    fetchPosts, 
    removePost 
  };

  return useMemo(() => postsContextValues, [posts, isLoading, fetchPosts, removePost]);
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

 Write a function that uses the usePostsContexValue.

  function App() {
    return  <PostsList />;
  }  

Enter the next line: " response
answer="const postsContextValue = usePostsContextValue();"
additional_feedback="

  const postsContextValue = usePostsContextValue();

  function PostsProvider() {
    return  <PostsList />;
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function that uses the usePostsContexValue.

  const postsContextValue = usePostsContextValue();

  function PostsProvider() {
    return  <PostsList />;
  }

Enter the next line: " response
answer="<PostsContext.Provider value={postsContextValue}><PostsList /></PostsContext.Provider>"
additional_feedback="

  const postsContextValue = usePostsContextValue();

  function PostsProvider() {
    return (
      <PostsContext.Provider value={postsContextValue}>
        <PostsList />
      </PostsContext.Provider>
    );
  }  


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
  Write a function that uses the PostsContext.


Enter the line next line: " response
answer="function usePostsContext() { }"
additional_feedback="

  function usePostsContext() { 
    
  }



"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
  Write a function that uses the PostsContext.

  function usePostsContext() { 
    
  }

Enter the line next line: " response
answer="const postsContext = useContext(PostsContext);"
additional_feedback="

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
  }



"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a function that uses the PostsContext.

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
  }

Enter the line next line: " response
answer="if (!postsContext) { }"
additional_feedback="

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {

    }
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a function that uses the PostsContext.

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {

    }
  }

Enter the line next line: " response
answer="throw new Error('usePostsContext must be used within the PostsContext.Provider');"
additional_feedback="

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {
      throw new Error('usePostsContext must be used within the PostsContext.Provider');
    }
  }



"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a function that uses the PostsContext.

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {
      throw new Error('usePostsContext must be used within the PostsContext.Provider');
    }
  }

Enter the line next line: " response
answer="return postsContext;"
additional_feedback="

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {
      throw new Error('usePostsContext must be used within the PostsContext.Provider');
    }
    return postsContext;
  }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a function that uses the PostsContext.

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {
      throw new Error('usePostsContext must be used within the PostsContext.Provider');
    }
    return postsContext;
  }

Enter the line next line: " response
answer="export { PostsProvider, usePostsContext };"
additional_feedback="

  function usePostsContext() { 
    const postsContext = useContext(PostsContext);
    if (!postsContext) {
      throw new Error('usePostsContext must be used within the PostsContext.Provider');
    }
    return postsContext;
  }

  export { PostsProvider, usePostsContext };

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
  Complete the function that deletes the user.

  function deleteUser(userId) {

  } 

Enter the next line: " response
answer="const userIndex = users.findIndex(user => user.id === userId);"
additional_feedback="

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Complete the function that deletes the user.

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
  }

Enter the next line: " response
answer="if (userIndex > -1) { }"
additional_feedback="

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 

    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Complete the function that deletes the user.

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 

    }
  } 

Enter the next line: " response
answer="const tempArr = [...users];"
additional_feedback="

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 
      const tempArr = [...users];
    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "
  Complete the function that deletes the user.

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 
      const tempArr = [...users];
    }
  }  

Enter the next line: " response
answer="tempArr.splice(userIndex, 1);"
additional_feedback="

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 
      const tempArr = [...users];
      tempArr.splice(userIndex, 1);
    }
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Complete the function that deletes the user.

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 
      const tempArr = [...users];
      tempArr.splice(userIndex, 1);
    }
  } 

Enter the next line: " response
answer="setUsers(tempArr);"
additional_feedback="

  function deleteUser(userId) {
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex > -1) { 
      const tempArr = [...users];
      tempArr.splice(userIndex, 1);
      setUsers(tempArr);
    }
  }   

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {

  }

Enter the next line: " response
answer="constructor(authToken) { this.authToken = authToken; }"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }
  }

Enter the next line: " response
answer="constructHeaders() { }"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
     
    }
   
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {

    } 

    
  }

Enter the next line: " response
answer="const headers = new Headers();"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
    }
   
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line


read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
    }
  }

Enter the next line: " response
answer="headers.set('Authorization', this.authToken);"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
    }
   
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


next_line


read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
    }
  }

Enter the next line: " response
answer="return headers;"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }
   
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }
  }

Enter the next line: " response
answer="handleResponse(response) { }"
additional_feedback="

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      
    }
  }

Enter the next line: " response
answer="if (response.ok) { return response.json(); }"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      }
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

     handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      }
    }
  }

Enter the next line: " response
answer="else { return Promise.reject({ }); }"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ });
      }
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

     handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ });
      }
    }
  }

Enter the next line: " response
answer="status: response.status,"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status,
        });
      }
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status,
        });
      }
    }
  }

Enter the next line: " response
answer="statusText: response.statusText"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status,
          statusText: response.statusText
        });
      }
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }
  }

Enter the next line: " response
answer="get(url, options) { }"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      
    } 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      
    } 
  }

Enter the next line: " response
answer="return fetch(url, { })"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { })
    } 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { })
    } 
  }

Enter the next line: " response
answer="headers: this.constructHeaders()"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { 
        headers: this.constructHeaders() 
      })
    } 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { 
        headers: this.constructHeaders() 
      })
    } 
  }

Enter the next line: " response
answer="...options"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { 
        headers: this.constructHeaders(), 
        ...options 
      })
    } 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Create a Class API for the following code.

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });


  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { 
        headers: this.constructHeaders(), 
        ...options 
      })
    } 
  }

Enter the next line: " response
answer=".then(this.handleResponse);"
additional_feedback="

  const api = new API('my-auth-token');

  api.get('https://api/users/1')
    .then(data => {
      console.log('User data', data);
    })
    .catch(error => {
      console.error(error);
  });

  class API {
    constructor(authToken) { 
      this.authToken = authToken; 
    }

    constructHeaders() {
      const headers = new Headers();
      headers.set('Authorization', this.authToken);
      return headers;
    }

    handleResponse(response) { 
      if (response.ok) { 
        return response.json(); 
      } else { 
        return Promise.reject({ 
          status: response.status, 
          statusText: response.statusText 
        });
      }
    }

    get(url, options) { 
      return fetch(url, { 
        headers: this.constructHeaders(), 
        ...options, 
        })
        .then(this.handleResponse);
    }

    post(url, options) {
      return fetch(url, {
        method: 'POST',
        headers: this.constructHeaders(),
        ...options,
      })
        .then(this.handleResponse);
    }

    put(url, options) {
      return fetch(url, {
        method: 'PUT',
        headers: this.constructHeaders(),
        ...options,
      })
        .then(this.handleResponse);
    }

    delete(url, options) {
      return fetch(url, {
        method: 'DELETE',
        headers: this.constructHeaders(),
        ...options,
      })
        .then(this.handleResponse); 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
 Optimize the list component.

  function MyParent({ term }) {

    const onItemClick = () => {
      console.log(event.currentTarget);
    };

    return (
      <MyBigList
        term={term}
        onItemClick={onItemClick}
      />
    );
  } 

  function MyBigList({ term, onItemClick }) {
    const items = useSearch(term);
    const map = item => <div onClick={onItemClick}>{item}</div>;
    return <div>{items.map(map)}</div>;
  }
  export default MyBigList;

Enter the next line: " response
answer="const onItemClick = React.useCallback(event => { }, [term]);"
additional_feedback="

  export function MyParent({ term }) {

    const onItemClick = React.useCallback(event => {
      console.log(event.currentTarget);
    }, [term]);

    return (
      <MyBigList
        term={term}
        onItemClick={onItemClick}
      />
    );
  }   

  function MyBigList({ term, onItemClick }) {
    const items = useSearch(term);
    const map = item => <div onClick={onItemClick}>{item}</div>;
    return <div>{items.map(map)}</div>;
  }
  export default MyBigList;

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
 Optimize the list component.

  function MyParent({ term }) {

    const onItemClick = React.useCallback(event => {
      console.log(event.currentTarget);
    }, [term]);

    return (
      <MyBigList
        term={term}
        onItemClick={onItemClick}
      />
    );
  } 

  function MyBigList({ term, onItemClick }) {
    const items = useSearch(term);
    const map = item => <div onClick={onItemClick}>{item}</div>;
    return <div>{items.map(map)}</div>;
  }
  export default MyBigList;

Enter the next line: " response
answer="export default React.memo(MyBigList);"
additional_feedback="

  function MyParent({ term }) {

    const onItemClick = React.useCallback(event => {
      console.log(event.currentTarget);
    }, [term]);

    return (
      <MyBigList
        term={term}
        onItemClick={onItemClick}
      />
    );
  } 

  function MyBigList({ term, onItemClick }) {
    const items = useSearch(term);
    const map = item => <div onClick={onItemClick}>{item}</div>;
    return <div>{items.map(map)}</div>;
  }
  export default React.memo(MyBigList);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What does the documentation on the createContext warn about the API? " response
answer="All consumers that are descendants of a Provider will re-render whenever the Provider's value prop changes."

evaluate_answer "$response" "$answer"

next_question


read -p "Why would the context not have a default value? " response
answer="Context would not have a default value when fetching information from an API to use the results as a default value."
evaluate_answer "$response" "$answer"

next_question

read -p "What should good error message for the context API include? " response
answer="The error message should include what went wrong and explain how to fix the error."
evaluate_answer "$response" "$answer"

next_question

read -p "What does useCallback do? " response
answer="The useCallback() hook memoize functions to prevent re-creating them on every re-render."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the issue with this component

  const Input = () => {  
    const [name, setName] = useState('');

    return (
      <input type=\"text\" value={name} onChange={(e) => setName(e.target.value)} />
    );
  };

Enter your answer: " response
answer="The onChange function has an anonymous function and is always a new reference every time the component renders."
additional_feedback="

  Even if you make it not anonymous, because it uses scoped 
  variables and therefore has to be declared inside the component, 
  it will always be a new reference.


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  The following function constructs data to pass to the submit function. How can it be optimized?

  import { callApi } from './actions';

  const FormWrapper = () => {  
    const submit = (data) => {
      const name = \`\${ data.fields.firstname } \${ data.fields.lastname }\`;
      const country = data.fields.country || 'USA';
      callApi({ ...data.fields, name, country });
    };

    // \"submit\" is always a different reference so
    // this component will always re-render
    return <Form submit={submit} />;
  });

Enter your answer: " response
answer="const submit = useCallback((data) => { }, []);"
additional_feedback="

  const FormWrapper = () => {  
    const submit = useCallback((data) => {
      const name = \`\${ data.fields.firstname } \${ data.fields.lastname }\`;
      const country = data.fields.country || 'USA';
      callApi({ ...data.fields, name, country });
    }, []);

    
      return <Form submit={submit} />;
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Why is this an improvement?

  import { callApi } from './actions';

  const FormWrapper = () => {  
    const submit = useCallback((data) => {
      const name = \`\${ data.fields.firstname } \${ data.fields.lastname }\`;
      const country = data.fields.country || 'USA';
      callApi({ ...data.fields, name, country });
    }, []);

      return <Form submit={submit} />;
  });

Enter your answer: " response
answer="submit function is cached and because no dependencies are specified, it will never change."
additional_feedback="

  const FormWrapper = () => {  
    const submit = useCallback((data) => {
      const name = \`\${ data.fields.firstname } \${ data.fields.lastname }\`;
      const country = data.fields.country || 'USA';
      callApi({ ...data.fields, name, country });
    }, []);

      return <Form submit={submit} />;
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Create a component that will accept a submit or a button type that the parent can 
  reference using ref.

  export const FancyButton = () => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  ));

Enter the next line: " response
answer="type Props = { children: React.ReactNode; type: 'submit' | 'button' };"
additional_feedback="

  type Props = { children: React.ReactNode; type: 'submit' | 'button' };

  export const FancyButton = () => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  ));

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a component that will accept a submit or a button type that the parent can 
  reference using ref.

  type Props = { children: React.ReactNode; type: 'submit' | 'button' };
  
  export const FancyButton = () => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  ));

Enter the next line: " response
answer="type Ref = HTMLButtonElement;"
additional_feedback="

  type Props = { children: React.ReactNode; type: 'submit' | 'button' };
  type Ref = HTMLButtonElement;
  
  export const FancyButton = () => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  ));  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Create a component that will accept a submit or a button type that the parent can 
  reference using ref.

  type Props = { children: React.ReactNode; type: 'submit' | 'button' };
  type Ref = HTMLButtonElement;
  
  export const FancyButton = () => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  ));  

Enter the next line: " response
answer="export const FancyButton = React.forwardRef<Ref, Props>((props, ref) => ( ));"
additional_feedback="

  type Props = { children: React.ReactNode; type: 'submit' | 'button' };
  type Ref = HTMLButtonElement;

  export const FancyButton = React.forwardRef<Ref, Props>((props, ref) => (
    <button ref={ref} className=\"MyClassName\" type={props.type}>
      {props.children}
    </button>
  )); 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function to assert that data is characters

  type Character = {
    name: string;
  };

Enter the next line: " response
answer="function assertIsCharacter(data: any): asserts data is Character { }"
additional_feedback="

  type Character = {
    name: string;
  };

  function assertIsCharacter(data: any): asserts data is Character {

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function to assert that data is characters

  type Character = {
    name: string;
  };

  function assertIsCharacter(data: any): asserts data is Character {

  }

Enter the next line: " response
answer="if (!('name' in data)) { }"
additional_feedback="

  type Character = {
    name: string;
  };

  function assertIsCharacter(data: any): asserts data is Character {
    if (!('name' in data)) { 

    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Write a function to assert that data is characters

  type Character = {
    name: string;
  };

  function assertIsCharacter(data: any): asserts data is Character {
    if (!('name' in data)) { 

    }
  }

Enter the next line: " response
answer="throw new Error('Not Character');"
additional_feedback="

  type Character = {
    name: string;
  };

  function assertIsCharacter(data: any): asserts data is Character {
    if (!('name' in data)) { 
      throw new Error('Not character');
    }
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    
  }

Enter the next line: " response
answer="const controller = new AbortController();"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
  } 

Enter the next line: " response
answer="const signal = controller.signal;"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;
  }

Enter the next line: " response
answer="const promise = new Promise(async (resolve) => { });"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => { 

    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => { 

    });
  }

Enter the next line: " response
answer="const response = await fetch('api', { });"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        
      }); 
    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        
      }); 
    });
  }

Enter the next line: " response
answer="method: 'get', signal"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      }); 
    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      }); 
    });
  }

Enter the next line: " response
answer="const data = await response.json();"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json(); 
    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json(); 
    });
  }

Enter the next line: " response
answer="assertIsCharacter(data);"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
    });
  }

Enter the next line: " response
answer="resolve(data);"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
  }

Enter the next line: " response
answer="promise.cancel = () => controller.abort();"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    promise.cancel = () => controller.abort();
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
  Write a program that fetch data and aborts the request.

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    promise.cancel = () => controller.abort();
  }

Enter the next line: " response
answer="return promise;"
additional_feedback="

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    promise.cancel = () => controller.abort();
    return promise;
  }  

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question
      
read -p "Create the isAbortError function. " response
answer="function isAbortError(error: any): error is DOMException { }"
additional_feedback="

  function isAbortError(error: any): error is DOMException { 
     
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Create the isAbortError function. 

  function isAbortError(error: any): error is DOMException { 
     
  }

Enter the next line: " response
answer="if (error && error.name === 'AbortError') { }"
additional_feedback="

  function isAbortError(error: any): error is DOMException { 
    if (error && error.name === 'AbortError') {

    }  
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Create the isAbortError function. 

  function isAbortError(error: any): error is DOMException { 
    if (error && error.name === 'AbortError') {

    }  
  }

Enter the next line: " response
answer="return true;"
additional_feedback="

  function isAbortError(error: any): error is DOMException { 
    if (error && error.name === 'AbortError') {
      return true;
    }  
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Create the isAbortError function. 

  function isAbortError(error: any): error is DOMException { 
    if (error && error.name === 'AbortError') {
      return true;
    }  
  }

Enter the next line: " response
answer="return false;"
additional_feedback="

  function isAbortError(error: any): error is DOMException { 
    if (error && error.name === 'AbortError') {
      return true;
    } 
    return false; 
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Complete the code that catches the error if the fetch call is aborted.

   const promise = new Promise(async (resolve) => {
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    promise.cancel = () => controller.abort();
    return promise;

Enter the next line: " response
answer="try { } catch (ex: unknown) { }"
additional_feedback="

  const promise = new Promise(async (resolve) => {
    try {
      const response = await fetch('https://api/people/\${id}/', {
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data);
      resolve(data);
     } catch (ex: unknown) {
       
     }
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

Complete the code that catches the error if the fetch call is aborted.

const promise = new Promise(async (resolve) => {
    try {
      const response = await fetch('https://api/people/\${id}/', {
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data);
      resolve(data);
     } catch (ex: unknown) {
       
     }
  });

Enter the next line: " response
answer="if (isAbortError(ex)) { console.log(ex.message); }"
additional_feedback="

  const promise = new Promise(async (resolve) => {
    try {
      const response = await fetch('https://api/people/${id}/', {
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data);
      resolve(data);
    } catch (ex: unknown) {
      if (isAbortError(ex)) {
        console.log(ex.message);
      }
    }
  });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  How do you solve this issue?

  // 💥 - Property 'cancel' does not exist on type 'Promise<unknown>'
  promise.cancel = () => controller.abort();

Enter the next line: " response
answer="interface PromiseWithCancel<T> extends Promise<T> { cancel: () => void; }"
additional_feedback="

  interface PromiseWithCancel<T> extends Promise<T> {
    cancel: () => void;
  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How do you solve this issue?

  // 💥 - Property 'cancel' does not exist on type 'Promise<unknown>'
  promise.cancel = () => controller.abort();


  *******************
   Promise Interface
  ******************

  interface PromiseWithCancel<T> extends Promise<T> {
    cancel: () => void;
  } 


  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
     try { 
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    promise.cancel = () => controller.abort();
    return promise;

    catch (ex: unknown) {
      if (isAbortError(ex)) {
        console.log(ex.message);
      }
    }
  } 

Enter the next line: " response
answer="(promise as PromiseWithCancel<Character>).cancel = () => controller.abort();"
additional_feedback="

  *******************
   Promise Interface
  ******************

  interface PromiseWithCancel<T> extends Promise<T> {
    cancel: () => void;
  } 



  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
     try { 
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    (promise as PromiseWithCancel<Character>).cancel = () => controller.abort();
    return promise;

    catch (ex: unknown) {
      if (isAbortError(ex)) {
        console.log(ex.message);
      }
    }
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  How do you solve this issue?

  // 💥 - Property 'cancel' does not exist on type 'Promise<unknown>'
  promise.cancel = () => controller.abort();


  *******************
   Promise Interface
  ******************

  interface PromiseWithCancel<T> extends Promise<T> {
    cancel: () => void;
  } 

  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
     try { 
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    (promise as PromiseWithCancel<Character>).cancel = () => controller.abort();
    return promise;

    catch (ex: unknown) {
      if (isAbortError(ex)) {
        console.log(ex.message);
      }
    }
  }

Enter the next line: " response
answer="return promise as PromiseWithCancel<Character>;"
additional_feedback="

  *******************
   Promise Interface
  ******************

  interface PromiseWithCancel<T> extends Promise<T> {
    cancel: () => void;
  } 



  function getCharacter(id: number) {
    const controller = new AbortController();
    const signal = controller.signal;

    const promise = new Promise(async (resolve) => {
     try { 
      const response = await fetch('https://api/people/\${id}/', { 
        method: 'get',
        signal,
      });
      const data = await response.json();
      assertIsCharacter(data); 
      resolve(data);
    });
    (promise as PromiseWithCancel<Character>).cancel = () => controller.abort();
    return promise as PromiseWithCancel<Character>;

    catch (ex: unknown) {
      if (isAbortError(ex)) {
        console.log(ex.message);
      }
    }
  } 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);

  }

Enter the next line: " response
answer="const [query, setQuery] = React.useState(undefined);"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState(undefined);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState(undefined);

  }

Enter the next line: " response
answer="<PromiseWithCancel<Character> | undefined>"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

  }

Enter the next line: " response
answer="React.useEffect(() => { }, []);"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => { 
      
    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => { 
      
    }, []);

  }

Enter the next line: " response
answer="const q = getCharacter(1);"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1); 

    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1); 

    }, []);

  }

Enter the next line: " response
answer="setQuery(q);"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q); 

    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q); 

    }, []);

  }

Enter the next line: " response
answer="q.then((character) => { });"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q);
      q.then((character) => { 
        
      }); 

    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q);
      q.then((character) => { 
        
      }); 

    }, []);

  }

Enter the next line: " response
answer="setData(character);"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q);
      q.then((character) => { 
        setData(character);
      }); 

    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "

  Complete this component to use the PromiseWithCancel interface for querying data.

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q);
      q.then((character) => { 
        setData(character);
      }); 

    }, []);

  }

Enter the next line: " response
answer="return () => { query?.cancel(); }"
additional_feedback="

  export function App() {
    const [data, setData] = React.useState<Character | undefined>(undefined);
    const [query, setQuery] = React.useState<PromiseWithCancel<Character> | undefined>(undefined);

    React.useEffect(() => {
      const q = getCharacter(1);
      setQuery(q);
      q.then((character) => { 
        setData(character);
      });

      return () => { 
        query?.cancel(); 
      } 

    }, []);

  }

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {

  }; 


Enter the next line: " response
answer="const keyword = e.target.value;"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
  }; 


Enter the next line: " response
answer="if (keyword !== '') { }"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      
    }
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      
    }
  };


Enter the next line: " response
answer="const results = users.filter((user) => { });"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        
      });
    }
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        
      });
    }
  }; 


Enter the next line: " response
answer="return user.name.toLowerCase().startsWith(keyword.toLowerCase());"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
    }
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
    }
  };  


Enter the next line: " response
answer="setFoundUsers(results);"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
      setFoundUsers(results);
    }
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
      setFoundUsers(results);
    }
  }; 


Enter the next line: " response
answer="else { setFoundUsers(users); }"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
      setFoundUsers(results);
    } else { 
      setFoundUsers(users); 
    }
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a filter that doesn't get substrings. 

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
      setFoundUsers(results);
    } else { 
      setFoundUsers(users); 
    }
  }; 


Enter the next line: " response
answer="setName(keyword);"
additional_feedback="

  const filter = (e) => {
    const keyword = e.target.value;
    if (keyword !== '') { 
      const results = users.filter((user) => { 
        return user.name.toLowerCase().startsWith(keyword.toLowerCase());
      });
      setFoundUsers(results);
    } else { 
      setFoundUsers(users); 
    }
    setName(keyword);
  }; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a function that searches for substrings. 
  
  function isEmptyString(search) {
    return search.trim().length;
  }

Enter the next line: " response
answer="const filtered = !isEmptyString(search)"
additional_feedback="

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a function that searches for substrings.

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)

Enter the next line: " response
answer="? users"
additional_feedback="

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)
      ? users

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a function that searches for substrings.

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)
      ? users

Enter the next line: " response
answer=": users.filter((user) => );"
additional_feedback="

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)
      ? users
      : users.filter((user) => );

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line
      
read -p "Write a function that searches for substrings.

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)
      ? users
      : users.filter((user) => );

Enter the next line: " response
answer="user.name.toLowerCase().includes(search.toLowerCase())"
additional_feedback="

  function isEmptyString(search) {
    return search.trim().length;
  }

  const filtered = !isEmptyString(search)
      ? users
      : users.filter((user) => user.name.toLowerCase().includes(search.toLowerCase()));
  
  setFoundUsers(filtered);

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"


# read -p "" response
# answer=""
# additional_feedback=""
# evaluate_answer "$response" "$answer"



# cache the team object to safely use as a dependency
# import React, { useState, useEffect, useMemo } from 'react'
# import { createTeam } from '../utils'
# import { getPlayers } from '../api'
# import Players from '../components/Players'

# const Team = ({ id, name, active }) => {
#   // memoize calling `createTeam` because it's
#   // an expensive operation
#   const team = useMemo(() => createTeam({ id, name, active }), [
#     id,
#     name,
#     active,
#   ])
#   const [players, setPlayers] = useState([])

#   useEffect(() => {
#     if (team.active) {
#       getPlayers(team).then(setPlayers)
#     }
#   }, [team])

#   return <Players team={team} players={players} />
# }



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



# const PostsList = () => {
#   const { posts, removePost } = useContext(PostsContext);
#   usePostsLoading();
#   return (
#     <div>
#       {
#         posts.map(post => (
#           <div key={post.id} onClick={() => removePost(post.id)}>
#             <h2>{post.title}</h2>
#             <p>{post.body}</p>
#           </div>
#         ))
#       }
#     </div>
#   )
# }

# function usePostsListManagement() {
#   const { removePost, posts } = useContext(PostsContext);
 
#   const handlePostRemove = useCallback((postId: number) => () => {
#     removePost(postId);
#   }, [removePost]);
 
#   return {
#     handlePostRemove,
#     posts
#   }
# }

# const PostsList = () => {
#   const { posts, handlePostRemove } = usePostsListManagement();
#   usePostsLoading();
#   return (
#     <div>
#       {
#         posts.map(post => (
#           <div key={post.id} onClick={handlePostRemove(post.id)}>
#             <h2>{post.title}</h2>
#             <p>{post.body}</p>
#           </div>
#         ))
#       }
#     </div>
#   )
# }