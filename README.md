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
### ToDo
- [] Rewatch IntSet sections: write notes
- [] Write MaxIntSet
- [] Write IntSet
- [] Write ResizingIntSet
- [] Refactor code
- [] Finish README notes
#### MaxIntSet
A set that can only store integers within a given range. 
Built on an array, where each value is either 'true' or 'false' and the index
corresponds to the given value.
Insert: O(1)
Delete: O(1)
Lookup: O(1)
Space Complexity: Relies on user inputting the maximum allowed value, at best could
be O(n), but if there are large gaps between numbers, it could be much worse.
## Phase 2: Hashing
## Phase 3: HashSet
## Phase 4: Linked List
## Phase 5: Hash Map (reprise)
## Phase 6: LRU Cache

# ToDo
- [] Remove all attraccessors and make note in README that they're necessary to pass 
the tests