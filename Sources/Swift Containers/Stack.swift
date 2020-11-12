// Stacks in Swift
// Created by Trey Jean on 11/9/20.

// Stack
class Stack<Element> {
    // Each element in the stack is stored in a Frame object. The Frame object
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
    
    // Returns true if the Stack is empty, false otherwise.
    public func isEmpty() -> Bool {
        return self.top_ptr == nil;
    }
    
    // Adds a new Frame to the top of the stack.
    public func push(data: Element) {
        let temp = Frame<Element>(data: data, next: self.top_ptr);
        self.top_ptr = temp;
    }
    
    // Removes the top Frame from the stack and returns the data to the user
    public func pop() -> Element? {
        if self.isEmpty() {
            return nil;
        } else {
            let data = top_ptr?.data;
            top_ptr = top_ptr?.next;
            
            return data!;
        }
    }
    
    // Returns the data stored in the top Frame of the stack to the user.
    public func top() -> Element? {
        if self.isEmpty() {
            return nil;
        } else {
            return top_ptr?.data;
        }
    }
}
