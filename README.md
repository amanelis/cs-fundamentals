# Common Principles
  1. Hash, BST, Linked List, Array, Sorting algos, Searching, String search etc.
  2. Linux, deadlocks, compilation, networking may be asked. But for new grads it will be mainly data structure, coding, and algorithms.
  3. For software test positions, read about unit test, regression test, load test etc.
  
  
# Unix
  
**`Mutex`** - is a protected critical section of code that can only be accessed by one process at a time.

**`Semaphore`** - it restricts the number of simultaneous users of a shared resource up to N. The diners problem in CS degree.

**`Context switch`** - is passing control from one process to another and/or thread.

**`deadlock`** -  is a situation in which two or more competing actions are each waiting for the other to finish, and thus neither ever does. If a process is unable to change its state indefinitely because the resources requested by it are being used by other waiting process, then the system is said to be in a deadlock.

# Graphs
## Breadth First Search
The Breadth First search is an extremely useful searching technique. It differs from the depth-first search in that it uses a queue to perform the search, so the order in which the nodes are visited is quite different. It has the extremely useful property that if all of the edges in a graph are unweighted (or the same weight) then the first time a node is visited is the shortest path to that node from the source node. You can verify this by thinking about what using a queue means to the search order. When we visit a node and add all the neighbors into the queue, then pop the next thing off of the queue, we will get the neighbors of the first node as the first elements in the queue. This comes about naturally from the FIFO property of the queue and ends up being an extremely useful property. One thing that we have to be careful about in a Breadth First search is that we do not want to visit the same node twice, or we will lose the property that when a node is visited it is the quickest path to that node from the source. 

#### Iterative Breadth First:

	void bfs(node start) {
 		queue s;
 		s.push(start);
 		while (s.empty() == false) {
  			top = s.front();
  			s.pop();
  		
  			mark top as visited;
  		}
  	}
  		
  
## Depth First Search
The basic concept is to visit a node, then push all of the nodes to be visited onto the stack. To find the next node to visit we simply pop a node of the stack, and then push all the nodes connected to that one onto the stack as well and we continue doing this until all nodes are visited. It is a key property of the Depth First search that we not visit the same node more than once, otherwise it is quite possible that we will recurse infinitely. We do this by marking the node as we visit it, then unmarking it after we have finished our recursions.
 
#### Iterative Depth First:
 
	dfs(node start) {
 		stack s;
 		s.push(start);
 		while (s.empty() == false) {
  			top = s.top();
  			s.pop();
  			mark top as visited;

  			check for termination condition

  			add all of top's unvisited neighbors to the stack.
  			mark top as not visited;
 		}
	}
	
#### Recursive Depth First:

	dfs(node current) {
 		mark current as visited;
 		visit all of current's unvisited neighbors by calling dfs(neighbor)
 		mark current as not visited;
	}
 
## Floyd-Warshall
Floyd-Warshall is a very powerful technique when the graph is represented by an adjacency matrix. It runs in O(n^3) time, where n is the number of vertices in the graph. However, in comparison to Dijkstra, which only gives us the shortest path from one source to the targets, Floyd-Warshall gives us the shortest paths from all source to all target nodes. There are other uses for Floyd-Warshall as well; it can be used to find connectivity in a graph (known as the Transitive Closure of a graph). 

First, however we will discuss the Floyd Warshall All-Pairs Shortest Path algorithm, which is the most similar to Dijkstra. After running the algorithm on the adjacency matrix the element at adj[i][j] represents the length of the shortest path from node i to node j. The pseudo-code for the algorithm is given below:

	for (k = 1 to n)
 		for (i = 1 to n)
  			for (j = 1 to n)
   				adj[i][j] = min(adj[i][j], adj[i][k] + adj[k][j]);
 
 
## Array - Graphs
The basic concept is to have a 2 dimensional array of integers, where the element in row i, at column j represents the edge cost from node i to j. If the connection from i to j is not possible, we use some sort of sentinel value (usually a very large or small value, like -1 or the maximum integer). Another nice thing about this type of structure is that we can represent directed or undirected edges very easily. 

So for example, the following connection matrix:

	    A  B  C
	A   0  1  5
	B  -1  0  1
	C  -1 -1  0
	
![Array Graph](http://community.topcoder.com/i/education/graph.gif)
	

# Heaps
## Dijkstra (Heap method)

It essentially allows you to write a Breadth First search, and instead of using a Queue you use a Priority Queue and define a sorting function on the nodes such that the node with the lowest cost is at the top of the Priority Queue. This allows us to find the best path through a graph in O(m * log(n)) time where n is the number of vertices and m is the number of edges in the graph.

The fundamental operations on a Heap are:

1) **Add** - Inserts an element into the heap, putting the element into the correct ordered location.

2) **Pop** - Pops the top element from the heap, the top element will either be the highest or lowest element, depending on implementation.

3) **Top** - Returns the top element on the heap.

4) **Empty** - Tests if the heap is empty or not.


## Searching
**`Linear Search`** -  O(n) - looks down a list, one item at a time, without jumping. In complexity terms this is an O(n) search - the time taken to search the list gets bigger at the same rate as the list does.

**`Binary Search`** -  O(logn) - is when you start with the middle of a sorted list, and see whether that's greater than or less than the value you're looking for, which determines whether the value is in the first or second half of the list.

# Sorting
## Quicksort
Standard divide and conquor method. Pivot point, sort both arrays recursively. By splitting the array in to two parts you are inherently having a run time of 2* O(n/2). This ends up with a performance of O(nlogn).

http://www.vogella.com/articles/JavaAlgorithmsQuicksort/article.html

## Mergesort
A divide and conquer algorithm. The sorting elements are stored in a collection. This collection is divided into two collections and these are again sorted via mergesort. Once the two collections are sorted then the result is combined. Mergesort sorts in worst case in O(n log n) time. Due to the required copying of the collection Mergesort is in the average case slower then Quicksort.


## Regex

Expression   		 | Denotation
:------------------- | :-----------       
**[abc]**            | A single character of: a, b or c     
**[^abc]**      	 | Any single character except: a, b, or c       
**[a-z]**			 | Any single character in the range a-z
**[a-zA-Z]**		 | Any single character in the range a-z or A-Z
**^**				 | Start of line
**$**				 | End of line
**\A**				 | Start of string
**\z**				 | End of string
**.**				 | Any single character
**\s**				 | Any whitespace character
**\S**	  			 | Any non-whitespace character
**\d**	 			 | Any digit
**\D**				 | Any non-digit
**\w**				 | Any word character (letter, number, underscore)
**\W**				 | Any non-word character
**\b**				 | Any word boundary character
**(…)**				 | Capture everything enclosed
**(a|b)**			 | a or b
**a?**				 | Zero or one of a
**a***				 | Zero or more of a
**a+**				 | One or more of a
**a{3}**			 | Exactly 3 of a
**a{3,}**			 | 3 or more of a
**a{3,6}**	 		 | Between 3 and 6 of a

#### Examples
**email** - `\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b` or  `/\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/`


# Ruby

## Block, Procs and Lambdas

In this section I will be going over Closures with use of Block, Procs and Lambdas in the Ruby language. Lets first define what a computer science closure is:

**`closure`** - is a function together with a referencing environment for the non-local variables of that function. A closure allows a function to access variables outside its immediate lexical scope. The concept of closures was developed in the 1960s and was first fully implemented as a language feature in the programming language Scheme to support lexically scoped first-class functions. 

**`first class functions`** - a language supports passing functions as arguments to other functions, returning them as the values from other functions, and assigning them to variables or storing them in data structures.

**`primitive functions`** - definining and basic functions being the first of recursion used to solve addition, subtraction, multiplication and division. Almost all functions are built off primitive functions.

#### Blocks and Procs
A block is basically a `Proc`, producedures, AKA, Procs. A Proc can be used as reusable code. The difference here between a `&block` and a `Proc` is that a &block cannot be saved and a Proc can be saved. It thus is an object of &block code.

Using a Proc instead of sending a block we can instantiate objects ready to be called with given blocks of code an basically run at a later time since we saved the object.

Blocks become limiting when you want to send more than 1 closure to a function, Procs can help this. 

Procs act very similar to what other languages call anonymous functions.

So when should we use blocks over Procs?

1) Block: Your method is breaking an object down into smaller pieces, and you want to let your users interact with these pieces.
2) Block: You want to run multiple expressions atomically, like a database migration.
3) Proc: You want to reuse a block of code multiple times.
4) Proc: Your method will have one or more callbacks.

#### Lambdas
Lambdas at first glance seem to be the same at Procs. The main difference in the Prob and Lambda is that the Lambda checks the arguments passed to it.

	def args(code)
  		one, two = 1, 2
  		code.call(one, two)
	end
	
	>  args(Proc.new{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"})
	=> Give me a 1 and a 2 and a NilClass
	
	>  args(lambda{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"})
	=> ArgumentError: wrong number of arguments (2 for 3) (ArgumentError)

We see with the Proc example, extra variables are set to nil. However with lambdas, Ruby throws an error instead.

The second difference is that lambdas have diminutive returns. What this means is that while a Proc return will stop a method and return the value provided, lambdas will return their value to the method and let the method continue on.

	def proc_return
  		Proc.new { return "Proc.new"}.call
  		return "proc_return method finished"
	end

	def lambda_return
  		lambda { return "lambda" }.call
  		return "lambda_return method finished"
	end

	puts proc_return
	puts lambda_return

	=> Proc.new
	=> lambda_return method finished
	
In proc_return, our method hits a return keyword, stops processing the rest of the method and returns the string Proc.new. On the other hand, our lambda_return method hits our lambda, which returns the string lambda, keeps going and hits the next return and outputs lambda_return method finished. Why the difference?

The answer is in the conceptual differences between procedures and methods. Procs in Ruby are drop in code snippets, not methods. Because of this, the Proc return is the proc_return method’s return, and acts accordingly. Lambdas however act just like methods, as they check the number of arguments and do not override the calling methods return. For this reason, it is best to think of lambdas as another way to write methods, an anonymous way at that.

So, when should we write an anonymous method (lambda) instead of a Proc? The following code shows one such case.

	def generic_return(code)
  		code.call
  		return "generic_return method finished"
	end

	puts generic_return(Proc.new { return "Proc.new" })
	=> unexpected return (LocalJumpError)
	
	puts generic_return(lambda { return "lambda" })
	=> generic_return method finished


##### Basics of Proc vs Lambda

	Proc.new { return "Proc.new"}.call
	puts "I'm a Proc"
	=> "Proc.new""
	
	lambda { return "lambda" }.call
	puts "I'm a Lambda"
	=> "I'm a Lambda"
	
**`Procs`** in Ruby are drop in code snippets, not methods. They will alter the calling functions control.

**`Lambdas`** act like methods. They check the number of arguments and do not override the calling methods return.

#### When to use Procs and Lambdas?

So, when to use Proc over lambdas and vice versa? Honestly, besides argument checking, the difference is just in how you see closures. If you want to stay in the mindset of passing blocks of code, keep with Proc. If sending a method to another method that can return a method makes sense to you, use lambdas. But, if lambdas are just methods in object form, can we store existing methods and pass them just like Procs? For that, Ruby has the something pretty tricky up its sleeve.

Ruby’s four closure types, blocks, Procs, lambdas and Methods. 

Blocks and Procs act like drop-in code snippets, while lambdas and Methods act just like methods.

# Sources

[TopCoder - Graphs](http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=graphsDataStrucs1)



###### Written by Alex Manelis

