## Common Principles
  1. Hash, BST, Linked List, Array, Sorting algos, Searching, String search etc.
  2. Linux, deadlocks, compilation, networking may be asked. But for new grads it will be mainly data structure, coding, and algorithms.
  3. For software test positions, read about unit test, regression test, load test etc.
  
  
## Unix
  
**`Mutex`** - is a protected critical section of code that can only be accessed by one process at a time.

**`Semaphore`** - it restricts the number of simultaneous users of a shared resource up to N. The diners problem in CS degree.

**`Context switch`** - is passing control from one process to another and/or thread
Random Integer between 1 and 5 - 10.times.map { 1+Random.rand(5) }


## Searching - Graphs
---------------------
**`Breadth First Search`** - this graphing algorithm uses a Queue to traverse through the nodes. It starts with a single vertex. Visits each
  node nearest to it and enqueue's each vertex. It uses the first element in the queue to be the next vertex it visits once all adjacent nodes 
  have been visited until there are no more nodes to visit and the last element in the queue is the current.
  
**`Depth First Search`** - this graphing algorithm uses a Stack to traverse through the nodes. It starts with a single vertex. It traverses down
 all nodes until there is no more adjacent nodes to visit, then once there is no more, it pops the stack and traverses back to find an element
 that is connected to an unvisited node.

## Searching - Strings
----------------------

## Regex
--------

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


## Block, Procs and Lambdas
---------------------------

In this section I will be going over Closures with use of Block, Procs and Lambdas in the Ruby language. Lets first define what a computer science closure is:

**`closure`** - is a function together with a referencing environment for the non-local variables of that function. A closure allows a function to access variables outside its immediate lexical scope. The concept of closures was developed in the 1960s and was first fully implemented as a language feature in the programming language Scheme to support lexically scoped first-class functions. 

**`first class functions`** - a language supports passing functions as arguments to other functions, returning them as the values from other functions, and assigning them to variables or storing them in data structures.

**`primitive functions`** - definining and basic functions being the first of recursion used to solve addition, subtraction, multiplication and division. Almost all functions are built off primitive functions.

#### Blocks and Procs
---------------------
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
------------
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







###### Written by Alex Manelis

