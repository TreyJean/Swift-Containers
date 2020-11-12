// Stacks in Swift
// Created by Trey Jean on 11/9/20.

import Foundation

public struct Containers {
    public static func doSomethingSpecial() {
        let stack: Stack<Int> = Stack<Int>();
        for i in 1 ... 10 {
            stack.push(data: i);
        }
        
        print(stack.pop()!);
        print(stack.top()!);
        print(stack.pop()!);
        print("Hello World!");
    }
}
