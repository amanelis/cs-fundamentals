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
 
## HashTable
Very similar to Ruby's hash {key: value}. Synchronized data flow. This makes HashMap better for non-threaded applications, as unsynchronized Objects typically perform better than synchronized ones. Hashtables do not allow null keys or values. HashMap allows one null key and any number of null values.

	Hashtable<String, Integer> numbers = new Hashtable<String, Integer>();
	numbers.put('one', 1);
	numbers.put('two', 2);

## HashMap

 
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


# Searching
**`Linear Search`** -  O(n) - looks down a list, one item at a time, without jumping. In complexity terms this is an O(n) search - the time taken to search the list gets bigger at the same rate as the list does.

**`Binary Search`** -  O(logn) - is when you start with the middle of a sorted list, and see whether that's greater than or less than the value you're looking for, which determines whether the value is in the first or second half of the list.

## String
### Rabin-Karp Algorithm (RK)
The "pure" form of "the needle in a haystack problem" is considered too straightforward and is rarely seen in programming contests. However, the "rolling hash" technique used in RK is an important weapon. It is especially useful in problems where we have to look at all substrings of fixed length of a given text. An example is "the longest common substring problem": given two strings find the longest string that is a substring of both. In this case, the combination of binary search (BS) and "rolling hash" works quite well. The important point that allows us to use BS is the fact that if the given strings have a common substring of length n, they also have at least one common substring of any length m < n. And if the two strings do not have a common substring of length n they do not have a common substring of any length m > n. So all we need is to run a BS on the length of the string we are looking for. For every substring of the first string of the length fixed in the BS we insert it in a hash table using one hash value as an index and a second hash value ("double hash") is inserted in the table. For every substring of the fixed length of the second string, we calculate the corresponding two hash values and check in the table to see if they have been already seen in the first string. A hash table based on open addressing is very suitable for this task.

### Knuth-Morris-Pratt Algorithm (KMP)


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

# Java

## Concurrency


## Generics
Introduced in Java SE 5.0, add stability to your code by making more of your bugs detectable at compile time. 

#### What is the primary purpose of Java generics?
The need for generic types stems mainly from the implementation and use of collections, like the ones in the Java collection framework. Generic types or methods differ from regular types and methods in that they have type parameters. A class like LinkedList<E> is a generic type.  It has a type parameter E that represents the type of the elements stored in the list.  Instead of just using a LinkedList , not saying anything about the type of elements the list contains, we can use a LinkedList<String> or a LinkedList<Integer> , thereby specifying that we mean a list of strings or integral values respectively. 

#### What is the benefit of using Java generics?
Using a parameterized type such as LinkedList<String> , instead of LinkedList , enables the compiler to perform more type checks and requires fewer dynamic casts. This way errors are detected earlier, in the sense that they are reported at compile-time by means of a compiler error message rather than at runtime by means of an exception. 
Consider the example of a LinkedList<String> . The type LinkedList<String> expresses that the list is a homogenous list of elements of type String .  Based on the stronger information the compiler performs type checks in order to ensure that a LinkedList<String> contains only strings as elements. Any attempt to add an alien element is rejected with a compiler error message. 

Example (using a parameterized type): 

	LinkedList<String> list = new LinkedList<String>(); 
	list.add("abc");       // fine 
	list.add(new Date());  // error
	
Using a plain LinkedList , the compiler had not issued any message and both elements would have been added to the list. This is because the non-parameterized LinkedList does not mandate that all elements must be of the same or any particular type. A non-parameterized list is a sequence of elements of type Object and hence arbitrary. 
Same example (using a non-parameterized type): 

	LinkedList list = new LinkedList(); 
	list.add("abc");       // fine 
	list.add(new Date());  // fine as well

Since it is ensured that a LinkedList<String> contains strings it is not necessary to cast an element retrieved from the list to type String . 

Example (using a parameterized type): 

	LinkedList<String> list = new LinkedList<String>(); 
	list.add("abc");  
	String s = list.get(0);  // no cast needed

## Abstracts Methods and Classes
An abstract **class** is a class that is declared abstract—it may or may not include abstract methods. Abstract classes cannot be instantiated, but they can be subclassed. 

An abstract **method** is a method that is declared without an implementation (without braces, and followed by a semicolon), like this:

	public abstract class GraphicObject {
   		// declare fields
   		// declare non-abstract methods
   		abstract void draw();
	}
	
When an abstract class is subclassed, the subclass usually provides implementations for all of the abstract methods in its parent class. However, if it does not, the subclass must also be declared abstract.

#### Abstract Classes versus Interfaces
Unlike interfaces, abstract classes can contain fields that are not static and final, and they can contain implemented methods. Such abstract classes are similar to interfaces, except that they provide a partial implementation, leaving it to subclasses to complete the implementation. If an abstract class contains only abstract method declarations, it should be declared as an interface instead.

Multiple interfaces can be implemented by classes anywhere in the class hierarchy, whether or not they are related to one another in any way. Think of Comparable or Cloneable, for example.

By comparison, abstract classes are most commonly subclassed to share pieces of implementation. A single abstract class is subclassed by similar classes that have a lot in common (the implemented parts of the abstract class), but also have some differences (the abstract methods).

### Final
You can declare some or all of a class's methods final. You use the final keyword in a method declaration to indicate that the method cannot be overridden by subclasses. The Object class does this—a number of its methods are final.

## Inheritance
In the Java programming language, each class is allowed to have one direct superclass, and each superclass has the potential for an unlimited number of subclasses.

## Interfaces
Implementing an interface allows a class to become more formal about the behavior it promises to provide. Interfaces form a contract between the class and the outside world, and this contract is enforced at build time by the compiler. If your class claims to implement an interface, all methods defined by that interface must appear in its source code before the class will successfully compile.

## Package
A package is a namespace that organizes a set of related classes and interfaces. Conceptually you can think of packages as being similar to different folders on your computer. You might keep HTML pages in one folder, images in another, and scripts or applications in yet another. Because software written in the Java programming language can be composed of hundreds or thousands of individual classes, it makes sense to keep things organized by placing related classes and interfaces into packages.

## Superclassing
The Object class, in the java.lang package, sits at the top of the class hierarchy tree. Every class is a descendant, direct or indirect, of the Object class. Every class you use or write inherits the instance methods of Object. You need not use any of these methods, but, if you choose to do so, you may need to override them with code that is specific to your class. The methods inherited from Object that are discussed in this section are:

	protected Object clone() throws CloneNotSupportedException
    // Creates and returns a copy of this object.

	public boolean equals(Object obj)
    // Indicates whether some other object is "equal to" this one.

	protected void finalize() throws Throwable
    // Called by the garbage collector on an object when garbage
    // collection determines that there are no more references to the object
	
	public final Class getClass()
    // Returns the runtime class of an object.

	public int hashCode()
    // Returns a hash code value for the object.

	public String toString()
    // Returns a string representation of the object.
    
The notify, notifyAll, and wait methods of Object all play a part in synchronizing the activities of independently running threads in a program, which is discussed in a later lesson and won't be covered here. There are five of these methods:

	public final void notify()
	public final void notifyAll()
	public final void wait()
	public final void wait(long timeout)
	public final void wait(long timeout, int nanos)
	
#### The clone() Method
If a class, or one of its superclasses, implements the Cloneable interface, you can use the clone() method to create a copy from an existing object. The simplest way to make your class cloneable is to add implements Cloneable to your class's declaration. then your objects can invoke the clone() method. To create a clone, you write:

	aCloneableObject.clone();
	
#### The equals() Method
The equals() method compares two objects for equality and returns true if they are equal. The equals() method provided in the Object class uses the identity operator (==) to determine whether two objects are equal. For primitive data types, this gives the correct result. For objects, however, it does not. The equals() method provided by Object tests whether the object references are equal—that is, if the objects compared are the exact same object.

To test whether two objects are equal in the sense of equivalency (containing the same information), you must override the equals() method. Here is an example of a Book class that overrides equals():

	public class Book {
    	public boolean equals(Object obj) {
        	if (obj instanceof Book)
            	return ISBN.equals((Book)obj.getISBN()); 
        	else
            	return false;
    	}
	}
Consider this code that tests two instances of the Book class for equality:

	// Swing Tutorial, 2nd edition
	Book firstBook  = new Book("0201914670");
	Book secondBook = new Book("0201914670");
	if (firstBook.equals(secondBook)) {
    	System.out.println("objects are equal");
	} else {
    	System.out.println("objects are not equal");
	}
	
This program displays objects are equal even though firstBook and secondBook reference two distinct objects. They are considered equal because the objects compared contain the same ISBN number.

You should always override the equals() method if the identity operator is not appropriate for your class.

#### The finalize() Method
The Object class provides a callback method, finalize(), that may be invoked on an object when it becomes garbage. Object's implementation of finalize() does nothing—you can override finalize() to do cleanup, such as freeing resources.

The finalize() method may be called automatically by the system, but when it is called, or even if it is called, is uncertain. Therefore, you should not rely on this method to do your cleanup for you. For example, if you don't close file descriptors in your code after performing I/O and you expect finalize() to close them for you, you may run out of file descriptors.

#### The getClass() Method
The getClass() method returns a Class object, which has methods you can use to get information about the class, such as its name (getSimpleName()), its superclass (getSuperclass()), and the interfaces it implements (getInterfaces()). For example, the following method gets and displays the class name of an object:

	void printClassName(Object obj) {
    	System.out.println("The object's" + " class is " +
        	obj.getClass().getSimpleName());
	}
	
The Class class, in the java.lang package, has a large number of methods (more than 50). For example, you can test to see if the class is an annotation (isAnnotation()), an interface (isInterface()), or an enumeration (isEnum()). You can see what the object's fields are (getFields()) or what its methods are (getMethods()), and so on.

#### The hashCode() Method
The value returned by hashCode() is the object's hash code, which is the object's memory address in hexadecimal.

By definition, if two objects are equal, their hash code must also be equal. If you override the equals() method, you change the way two objects are equated and Object's implementation of hashCode() is no longer valid. Therefore, if you override the equals() method, you must also override the hashCode() method as well.

#### The toString() Method
You should always consider overriding the toString() method in your classes.

The Object's toString() method returns a String representation of the object, which is very useful for debugging. The String representation for an object depends entirely on the object, which is why you need to override toString() in your classes


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

