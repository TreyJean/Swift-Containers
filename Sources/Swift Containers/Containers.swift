// Stacks in Swift
// Created by Trey Jean on 11/9/20.

import Foundation

// Stack
class Stack<Element> {
    // Each element in the stack is stored in a Frame object. The Node object
    // contains the element and a pointer to the Frame bellow it in the Stack.
    private class Frame<Element> {
        var data: Element;
        var next: Frame?;
        
        init(data: Element, next: Frame? = nil) {
            self.data = data;
            self.next = next;
        }
    }
    
    // The top pointer points to the top Frame of the Stack. If the Stack is
    // empty, the top pointer is nil.
    private var top_ptr: Frame<Element>?;
    
    public init() {
        self.top_ptr = nil;
    }
    
    // Returns true if the Stack is empty, false otherwise
    public func isEmpty() -> Bool {
        return self.top_ptr == nil;
    }
    
    public func push(data: Element) {
        let temp = Frame<Element>(data: data, next: self.top_ptr);
        self.top_ptr = temp;
    }
    
    public func pop() -> Element? {
        if self.isEmpty() {
            return nil;
        } else {
            let data = top_ptr?.data;
            top_ptr = top_ptr?.next;
            
            return data!;
        }
    }
    
    public func top() -> Element? {
        if self.isEmpty() {
            return nil;
        } else {
            return top_ptr?.data;
        }
    }
}

public struct Containers {
    public static func doSomethingSpecial() {
        print("Hello World!");
    }
}
