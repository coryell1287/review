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
        echo "    You scored $score% on cryptography review."
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
    Digest types specifies the format in which the digest is returned

    What are the digest types?

Enter your answer? " response
answer="hex binary base64"
evaluate_answer "$response" "$answer"

next_question

read -p "What does a Hex produce? " response
answer="Hex produces a result 40 bytes long, encoded as hexadecimal characters (0 - 9, A - F)."
evaluate_answer "$response" "$answer"

next_question

read -p "What does binary produce? " response
answer="Binary produces a result 20 bytes long."
evaluate_answer "$response" "$answer"

next_question

read - p "What does base64 produce? " response
answer="Base64 encoding produces a result 28 bytes long, using the characters A - Z, a - z, 0 - 9, +, /, =."
evaluate_answer "$response" "$answer"

next_question

read -p "Which are digest algorithms? " response
answer="unixsum unixcksum crc32c sha-256 sha-512 id-sha-256 id-sha-512"
evaluate_answer "$response" "$answer"

read -p "What is the crypto module? " response
answer="The module provides cryptographic functionality that includes a set of wrappers for OpenSSL's hash, HMAC, cipher, decipher, sign, and verify functions."
evaluate_answer "$response" "$answer"

next_question

read -p "
    Write a function that hashes the secret for the following variable using createHmac.

    const secret = 'abcdefg';

    console.log(hash);
    // Prints:
    //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

Enter next line of code here: " response
answer="const crypto = require('crypto');"
additional_feedback="

        const crypto = require('crypto');

        const secret = 'abcdefg';

        console.log(hash);
        // Prints:
        //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a function that hashes the secret for the following variable using createHmac.

      const crypto = require('crypto');

      const secret = 'abcdefg';

      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

Enter next line of code here: " response
answer="const hash = createHmac('sha256', secret)"
additional_feedback="

      const crypto = require('crypto');

      const secret = 'abcdefg';
      const hash = createHmac('sha256', secret)

      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
      Write a function that hashes the secret for the following variable using createHmac.

      const crypto = require('crypto');

      const secret = 'abcdefg';
      const hash = createHmac('sha256', secret)
                      

      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

Enter next line of code here: " response
answer="update('message')"
additional_feedback="
      const crypto = require('crypto');

      const secret = 'abcdefg';
      const hash = createHmac('sha256', secret)
                      .update('I love cupcakes')
                   
                      
      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p " 

     Write a function that hashes the secret for the following variable using createHmac.

      const crypto = require('crypto');

      const secret = 'abcdefg';
      const hash = createHmac('sha256', secret)
                       .update('message')

      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

Enter next line of code here: " response
answer="digest('hex');"
additional_feedback="
    
     const crypto = require('crypto');

      const secret = 'abcdefg';
      const hash = createHmac('sha256', secret)
                       .update('message')
                       .digest('hex');

      console.log(hash);
      // Prints:
      //   c0fa1bc00531bd78ef38c628449c5102aeabd49b5dc3a2a516ea6ea959d6658e

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What is the API call for the legacy crypto certificate? " response
answer="new crypto.Certificate()"
evaluate_answer "$response" "$answer"

next_question

read -p "What is the Cipher class used for? " response
answer="Cipher class are used to encrypt data."
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "Encrypt the following password using Cipher. 

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

Enter the next line here: " response
answer="const { scrypt, randomFill, createCipheriv } = require('crypto');"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key'; 

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

Enter the next line here: " response
answer="scrypt(password, 'salt', 24, (err, key)=> {});"
additional_feedback="

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
     
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
     
    });
Enter the next line here: " response
answer="if (err) throw err;"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
    });
Enter the next line here: " response
answer="randomFill(new Uint8Array(16), (err, iv) => {})"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           
        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
             
        });
    });
Enter the next line here: " response
answer="if (err) throw err;"
additional_feedback="
      const { scrypt, randomFill, createCipheriv } = require('crypto');

      const algorithm = 'aes-192-cbc';
      const password = 'Password used to generate key';

      scrypt(password, 'salt', 24, (err, key) => {
         if (err) throw err;
         randomFill(new Uint8Array(16), (err, iv) => {
            if (err) throw err;
         });
      });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  
        });
    });
Enter the next line here: " response
answer="const cipher = createCipheriv(algorithm, key, iv);"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);
        });
    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);
        });
    });
Enter the next line here: " response
answer="let encrypted = '';"
additional_feedback="
     const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
        });
    });
Enter the next line here: " response
answer="cipher.setEncoding('hex');"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');
        });
    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');
        });
    });
Enter the next line here: " response
answer="cipher.on('data', (chunk) => encrypted += chunk);"
additional_feedback="
    
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           cipher.on('data', (chunk) => encrypted += chunk);
        });
    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           cipher.on('data', (chunk) => encrypted += chunk);
        });
    });
Enter the next line here: " response
answer="cipher.on('end', () => console.log(encrypted));"
additional_feedback="
     const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           cipher.on('data', (chunk) => encrypted += chunk);
           cipher.on('end', () => console.log(encrypted));
        });
    });
"
answer="cipher.write('some clear text data');"

next_line

read -p "Encrypt the following password using Cipher.

    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
        if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           cipher.on('data', (chunk) => encrypted += chunk);
           cipher.on('end', () => console.log(encrypted));

           cipher.write('some clear text data');
        });
    });
Enter the next line here: " response
answer="cipher.end();"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           cipher.on('data', (chunk) => encrypted += chunk);
           cipher.on('end', () => console.log(encrypted));

           cipher.write('some clear text data');
           cipher.end();
        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "What lines would you add to stream the following code?
    
    const { scrypt, randomFill, createCipheriv } = require('crypto');
    
    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           

        });
    });

Enter the next line here: " response
answer="const { createReadStream, createWriteStream } = require('fs');"
additional_feedback="

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           

        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What lines would you add to stream the following code?

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           

        });
    });

Enter the next line here: " response
answer="const { pipeline } = require('stream');"
additional_feedback="
    
    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           

        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What lines would you add to stream the following code?

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           

        });
    });

Enter the next line here: " response
answer="const input = createReadStream('test.js');"
additional_feedback="

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');

        });
    });

"

evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What lines would you add to stream the following code?

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');

        });
    });

Enter the next line here: " response
answer="const output = createWriteStream('test.enc');"
additional_feedback="

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');
           const output = createWriteStream('test.enc');
        });
    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What lines would you add to stream the following code?

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');
           const output = createWriteStream('test.enc');
        });
    });

Enter the next line here: " response
answer="pipeline(input, cipher, output, (err) => {});"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');
           const output = createWriteStream('test.enc');


           pipeline(input, cipher, output, () => {

           });
        });
    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "What lines would you add to stream the following code?

    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');
           const output = createWriteStream('test.enc');

           pipeline(input, cipher, output, (err) => {

           });
        });
    });

Enter the next line here: " response
answer="if (err) throw err;"
additional_feedback="
    const { scrypt, randomFill, createCipheriv } = require('crypto');
    const { createReadStream, createWriteStream } = require('fs');
    const { pipeline } = require('stream');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
        randomFill(new Uint8Array(16), (err, iv) => {
           if (err) throw err;  

           const cipher = createCipheriv(algorithm, key, iv);

           let encrypted = '';
           cipher.setEncoding('hex');

           const input = createReadStream('test.js');
           const output = createWriteStream('test.enc');

           pipeline(input, cipher, output, (err) => {
               if (err) throw err;
           });
        });
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Decrypt the text in the following code: 


    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data

Enter the next line: " response
answer="const { scrypt, createDecipheriv } = require('crypto');"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
 
    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');

    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data

Enter the next line: " response
answer="const { Buffer } = require('buffer');"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data

Enter the next line: " response
answer="const algorithm = 'aes-192-cbc';"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    
    const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
    
    let decrypted;
    console.log(decrypted);
    // Prints: some clear text data

Enter the next line: " response
answer="scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {});"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {

        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted;
        console.log(decrypted);
        // Prints: some clear text data

    });
"
evaluate_answer_written_with_code "$response" "$answer" "additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {

        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted;
        console.log(decrypted);
        // Prints: some clear text data

    });

Enter the next line: " response
answer="const iv = Buffer.alloc(16, 0);"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {

        const iv = Buffer.alloc(16, 0);
        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted;
        console.log(decrypted);
        // Prints: some clear text data

    });
"

evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {
        
        const iv = Buffer.alloc(16, 0);
        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted;
        console.log(decrypted);
        // Prints: some clear text data

    });

Enter the next line: " response
answer="const decipher = createDecipheriv(algorithm, key, iv);"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {
        
        const iv = Buffer.alloc(16, 0);
        const decipher = createDecipheriv(algorithm, key, iv);
        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted;
        console.log(decrypted);
        // Prints: some clear text data

    });
"
answer="let decrypted = decipher.update(encrypted, 'hex', 'utf8');"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Decrypt the text in the following code: 

    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {
        
        const iv = Buffer.alloc(16, 0);
        const decipher = createDecipheriv(algorithm, key, iv);
        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted = decipher.update(encrypted, 'hex', 'utf8');
        console.log(decrypted);
        // Prints: some clear text data

    });

Enter the next line: " response
answer="decrypted += decipher.final('utf8');"
additional_feedback="
    const { scrypt, createDecipheriv } = require('crypto');
    const { Buffer } = require('buffer');

    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';

    scrypt('password', 'salt', 64, { N: 1024 }, (err, derivedKey) => {
        
        const iv = Buffer.alloc(16, 0);
        const decipher = createDecipheriv(algorithm, key, iv);
        const encrypted = 'e5f79c5915c02171eec6b212d5520d44480993d7d622a7c4c2da32f6efda0ffa';
        
        let decrypted = decipher.update(encrypted, 'hex', 'utf8');
        decrypted += decipher.final('utf8');

        console.log(decrypted);
        // Prints: some clear text data

    });

"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Write a hash in the following program as a stream: 

    const data = hash.read();
    if (data) {
        console.log(data.toString('hex'));
        // Prints:
        //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
    }

Enter the next line: " response
answer="const { createHash } = require('crypto');"
additional_feedback="
    const { createHash } = require('crypto');

    const data = hash.read();
    if (data) {
        console.log(data.toString('hex'));
        // Prints:
        //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
    }
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as a stream: 

    const { createHash } = require('crypto');

    const data = hash.read();
    if (data) {
        console.log(data.toString('hex'));
        // Prints:
        //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
    }

Enter the next line: " response
answer="const hash = createHash('sha256');"
additional_feedback="
    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    const data = hash.read();
    if (data) {
        console.log(data.toString('hex'));
        // Prints:
        //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
    }


"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as a stream: 

    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    const data = hash.read();
    if (data) {
        console.log(data.toString('hex'));
        // Prints:
        //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
    }

Enter the next line: " response
answer="hash.on('readable', () => {});"
additional_feedback="
    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    hash.on('readable', () => {
    const data = hash.read();
        if (data) {
            console.log(data.toString('hex'));
            // Prints:
            //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
        }
    });
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as a stream: 

    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    hash.on('readable', () => {
    const data = hash.read();
        if (data) {
            console.log(data.toString('hex'));
            // Prints:
            //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
        }
    });

Enter the next line: " response
answer="hash.write('data');"
additional_feedback="

    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    hash.on('readable', () => {
    const data = hash.read();
        if (data) {
            console.log(data.toString('hex'));
            // Prints:
            //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
        }
    });

    hash.write('data');
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as a stream: 

    const { createHash } = require('crypto');
    const hash = createHash('sha256');

    hash.on('readable', () => {
    const data = hash.read();
        if (data) {
            console.log(data.toString('hex'));
            // Prints:
            //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
        }
    });

    hash.write('data');

Enter the next line: " response
answer="hash.end();"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_question

read -p "
    Write a hash in the following program as hash.update() and hash.digest(): 

    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50

Enter the next line: " response
answer="const { createHash } = require('crypto');"
additional_feedback="
    const { createHash } = require('crypto');

    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as hash.update() and hash.digest(): 

    const { createHash } = require('crypto');

    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50

Enter the next line: " response
answer="const hash = createHash('sha256');"
additional_feedback="
    const { createHash } = require('crypto');

    const hash = createHash('sha256');
    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

next_line

read -p "
    Write a hash in the following program as hash.update() and hash.digest(): 

    const { createHash } = require('crypto');

    const hash = createHash('sha256');
    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50

Enter the next line: " response
answer="hash.update('data');"
additional_feedback="
    
    const { createHash } = require('crypto');

    const hash = createHash('sha256');
    hash.update('data');
    console.log(hash.digest('hex'));
    // Prints:
    //   6a2da20943931e9834fc12cfe5bb47bbd9ae43489a30726962b576f4e3993e50
"
evaluate_answer_written_with_code "$response" "$answer" "$additional_feedback"

read -p "What is a Cipher? " response
answer="Cipher is an algorithm for performing encryption or decryption."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a public-key cryptography? " response
answer="Public-key cryptography is a cryptographic system that uses pairs of keys--public key, known to others, and private key, known to only the owner."
evaluate_answer "$response" "$answer"

next_question

read -p "What is message signing? " response
answer="Message signing uses the sender’s private key to sign the message, and the public key is used to read the signature."
evaluate_answer "$response" "$answer"

next_question

read -p "What is hash-based message authentication code (HMAC)? " response
answer="HMAC is a specific type of message authentication code (MAC) involving a cryptographic hash function and a secret cryptographic key."
evaluate_answer_written_with_code "$response" "$answer"

next_question

read -p "What are Symmetric-key algorithms? " response
answer="Symmetric-key algorithms are algorithms for cryptography that use the same cryptographic keys for both the encryption of plaintext and the decryption of ciphertext."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a digital signature? " response
answer="A digital signature is a mathematical scheme for verifying the authenticity of digital messages or documents."
evaluate_answer "$response" "$answer"

next_question

read -p "What is public key infrastructure (PKI)? " response
answer="A public key infrastructure (PKI) is a set of roles, policies, hardware, software and procedures needed to create, manage, distribute, use, store and revoke digital certificates and manage public-key encryption."
additional_feedback="
    The purpose of a PKI is to facilitate the secure electronic transfer of information 
    for a range of network activities such as e-commerce, internet banking, and confidential 
    email. It is required for activities where simple passwords are an inadequate authentication 
    method, and more rigorous proof is required to confirm the identity of the parties involved 
    in the communication and validate the transferred information.
"
evaluate_answer "$response" "$answer" "$additional_feedback"

next_question

read -p "What is a shared secret? " response
answer="A shared secret is a piece of data, known only to the parties involved, in a secure communication."
additional_feedback="
    This usually refers to the key of a symmetric cryptosystem. 
    The shared secret can be a password, a passphrase, a big number, 
    or an array of randomly chosen bytes.   


    The shared secret is either shared beforehand between the communicating parties, 
    in which case it can also be called a pre-shared key, or it is created at the start 
    of the communication session by using a key-agreement protocol, for instance using 
    public-key cryptography such as Diffie–Hellman or using symmetric-key cryptography 
    such as Kerberos.
"
evaluate_answer "$response" "$answer"

next_question

read -p "What is cryptanalysis? " response
answer="Cryptanalysis is used to breach cryptographic security systems and gain access to the contents of encrypted messages, even if the cryptographic key is unknown."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the registration authority (RA)? " response
answer="RA is responsible for accepting requests for digital certificates and authenticating the entity making the request."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the Internet Engineering Task Force? " response
answer="The Internet Engineering Task Force is responsible the identification and authentication of certificate applicants, the approval or rejection of certificate applications, initiating certificate revocations or suspensions under certain circumstances, processing subscriber requests to revoke or suspend their certificates, and approving or rejecting requests by subscribers to renew or re-key their certificates."
evaluate_answer "$response" "$answer"

next_question

read -p "What is a certificate authority (CA)? " response
answer="A certificate authority or certification authority (CA) is an entity that issues digital certificates. A digital certificate certifies the ownership of a public key by the named subject of the certificate."
evaluate_answer "$response" "$answer"

read -p "What is a Diffie–Hellman key exchange? " response
answer="Diffie–Hellman key exchange is a method of securely exchanging cryptographic keys over a public channel and was one of the first public-key protocols as conceived by Ralph Merkle and named after Whitfield Diffie and Martin Hellman."
additional_feedback="
    DH is one of the earliest practical examples of public key 
    exchange implemented within the field of cryptography. 

    Traditionally, secure encrypted communication between two 
    parties required that they first exchange keys by some secure 
    physical means, such as paper key lists transported by a trusted 
    courier. The Diffie–Hellman key exchange method allows two parties 
    that have no prior knowledge of each other to jointly establish a 
    shared secret key over an insecure channel. This key can then be 
    used to encrypt subsequent communications using a symmetric-key 
    cipher.
"
evaluate_answer "$response" "$answer" "$additional_feedback"

########################################
#         Calculate your score         #
########################################

calculate_score
