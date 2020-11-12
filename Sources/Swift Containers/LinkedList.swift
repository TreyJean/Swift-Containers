//  Linked List in Swift
//  Created by Trey Jean on 11/10/20.

// Linked List
public class LinkedList<Element: Comparable> : Sequence {
    
    // Each element in the linked list is stored in a Node object. The Node object
    // contains the element and a pointer to the next node in the linked list.
    public class Node<Element> {
        var data: Element;
        var next: Node?;
        
        init(data: Element, next: Node? = nil) {
            self.data = data;
            self.next = next;
        }
    }
    
    // Iterator Class for LinkedList Object
    public struct LLIterator : IteratorProtocol {
        let list: LinkedList<Element>;
        var curr_node: Node<Element>?;
        
        init(list: LinkedList<Element>) {
            self.list = list;
            self.curr_node = list.head;
        }
        
        // next function to conform to the IteratorProtocol protocol
        public mutating func next() -> Node<Element>? {
            let temp_curr = self.curr_node ?? nil;
            self.curr_node = self.curr_node?.next;
            
            return temp_curr;
        }
    }
    
    // makeIterator function to conform to Sequence protocol
    public func makeIterator() -> LLIterator {
        return LLIterator(list: self);
    }
    
    // The head pointer points to the first element of the list. If the list is
    // empty, the head pointer is nil.
    private var head: Node<Element>?;
    private var length: Int;
    
    public init() {
        self.head = nil;
        self.length = 0;
    }
    
    // Returns true if the list is empty, false otherwise
    public func isEmpty() -> Bool {
        return self.length == 0;
    }
    
    // The append function adds an element to the end of the linked list.
    public func append(data: Element, front: Bool? = false) {
        if self.isEmpty() {
            self.head = Node<Element>(data: data);
        } else if front! {
            let temp = Node<Element>(data: data, next: self.head);
            self.head = temp;
        } else {
            var temp = self.head;
            
            while temp?.next != nil {
                temp = temp!.next;
            }
            temp?.next = Node<Element>(data: data);
        }
        
        self.length += 1;
    }
    
    // The remove function removes an element from the end of the list as long as
    // the list isn't empty.
    public func trim(front: Bool? = false) -> Element? {
        if self.isEmpty() {
            return nil;
        } else if self.length == 1 {
            let data = self.head?.data;
            self.head = nil;
            
            self.length -= 1;
            return data;
        } else if front! {
            let data = self.head?.data;
            self.head = self.head?.next;
            
            self.length -= 1;
            return data;
        } else {
            var temp = self.head;
            
            while temp!.next?.next != nil {
                temp = temp?.next;
            }
            
            let data = temp?.next?.data;
            temp?.next = temp?.next?.next;
            
            self.length -= 1;
            return data;
        }
    }
    
    public func find(data: Element) -> Bool {
        for node in self {
            if node.data == data {
                return true;
            }
        }
        
        return false;
    }
    
    public func delete(data: Element) {
        for node in self {
            if node.next?.data == data {
                node.next = node.next?.next;
            }
        }
    }
    
    public func display() {
        for node in self {
            print(node.data);
        }
    }
}
