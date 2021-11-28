Loss-less compression, where the compression-uncompression cycle doesn't 
alter the data that is recovered. It matches (byte to byte) with the original. 
For images, gif or png are using lossless compression.


Lossy compression, where the cycle alters the original data in a (hopefully) imperceptible 
way for the user. Video formats on the Web are lossy; the jpeg image format is also lossy.

End-to-end compression refers to a compression of the body of a message that is done by the 
server and will last unchanged until it reaches the client. Whatever the intermediate nodes are, 
they leave the body untouched.


In the 1990s, compression technology was advancing at a rapid pace and numerous successive 
algorithms have been added to the set of possible choices. Nowadays, only two are relevant:
gzip, the most common one, and br the new challenger.


Hop-by-hop compression, though similar to end-to-end compression, differs by one fundamental 
element: the compression doesn't happen on the resource in the server, creating a specific 
representation that is then transmitted, but on the body of the message between any two nodes 
on the path between the client and the server. Connections between successive intermediate nodes 
may apply a different compression.


 TE and Transfer-Encoding are mostly used to send a response by chunks, allowing to start 
 transmitting a resource without knowing its length.


additional info
Note that using Transfer-Encoding and compression at the hop level is so 
rare that most servers, like Apache, Nginx, or IIS, have no easy way to configure it. Such
 configuration usually happens at the proxy level


next_question

read -p "What is a technique to improve the rendering phase? " response
answer="Promoting content to it's own layers and composited can improve performance by painting portions of the screen on the GPU instead of the CPU, freeing up the main thread."
evaluate_answer "$response" "$answer"

next_question

read -p "What the style phase in the rendering process? " response
answer="The style process combines the DOM and CSSOM into a render tree,  starting with the root of the DOM, then traversing each visible node until its CSSOM rules are applied."
evaluate_answer "$response" "$answer"
 
next_question

read -p "What is layout phase in the rendering process? " response
answer="Layout is the process by which the width, height, and location of all the nodes in the render tree are determined, plus the determination of the size and position of each object on the page."
evaluate_answer "$response" "$answer"

next_question



read -p "What is reflow? " response
answer="Reflow is any subsequent recalcuations of the layout's size and position determination of any part of the page or the entire document."
evaluate_answer "$response" "$answer"

next_question

read -p "What the paint phase of the rendering process? " response
answer="Paint is when the browser converts each box calculated in the layout phase to actual pixels on the screen. Painting involves drawing every visual part of an element to the screen, including text, colors, borders, shadows, and replaced elements like buttons and images."
evaluate_answer "$response" "$answer"


next_question

read -p "What is compositing? " response
answer="Compositing ensures sections of the document drawn in different layers to the screen get drawn in the correct order, and the content gets rendered correctly."
evaluate_answer "$response" "$answer"


next_question

read -p "What is Time to Interactive (TTI)? " response
answer="Time to Interactive (TTI) is the measurement of how long it took from that first request which led to the DNS lookup and SSL connection to when the page is interactive -- interactive being the point in time after the First Contentful Paint when the page responds to user interactions within 50ms."
evaluate_answer "$response" "$answer"

next_question

read -p "What is the GPU good at handling? " response
answer="GPU is good at handling simple tasks but across multiple cores at the same time."
evaluate_answer "$response" "$answer"
Inter Process Communication (IPC)

next_question

read -p "What is Inter Process Communication? " response
answer="Inter Process Communication is how multiple processes communicate with one another."
evaluate_answer "$response" "$answer"

next_question

read -p "" response
answer=""
evaluate_answer "$response" "$answer"

