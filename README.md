# HashMap and LRU Cache Implementation
## Learning Goals
(From App Academy Description)
> Be able to describe the characteristics of a good hashing function
>
> Be able to explain how a linked list works and know how to traverse it
>
> Be able to explain how a hash map works
>
> Know how to implement an LRU cache using hash maps and linked lists
## General Notes
For each section I was given prewritten RSPEC specs and a skeleton (class layout - 
primarily empty methods, a few commented suggestions).
## Phase 1: IntSet
#### MaxIntSet
Given the max size of the input, this set stores integers between zero and the max. 
Built on an array, where each value is either 'true' or 'false' and the index
corresponds to the given value.  
Insert: O(1)  
Delete: O(1)  
Lookup: O(1)  
Space Complexity: Relies on user inputting the maximum allowed value, at best could
be O(n), but if there are large gaps between numbers, it could be much worse.
#### IntSet
A set built on an array with a fixed size of 20. Each element is moduloed by 20
and then stored in a subarray at the resulting index.  
Insert: O(n)  
Delete: O(n)  
Lookup: O(n)  
Space complexity: O(1)
#### ResizingIntSet
Like IntSet except we keep resizing the array to keep the array size larger than the input.
Every time we resize the array, we have to move every element in the set to its new subarray (element % array.length).
To keep insertion O(1) (amortized), we double the size of the array every time we resize it.  
Insert: O(1)  
Delete: O(1)  
Lookup: O(1)
## Phase 2: Hashing
Overriding hash functions for Array, String, and Hash. All of the
functions are built on top of Integer#hash.
### Array#hash
Hashes an array to an integer. Arrays with the same elements in different
orders hash to different values.
### String#hash
### Hash#hash
## Phase 3: HashSet
## Phase 4: Linked List
## Phase 5: Hash Map (reprise)
## Phase 6: LRU Cache

# ToDo
-[] Remove all attraccessors and make note in README that they're necessary to pass 
the tests