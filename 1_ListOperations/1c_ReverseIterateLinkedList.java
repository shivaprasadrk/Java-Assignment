// 2. Write a Java program to iterate a linked list in reverse order 
// (using objList.descendingIterator())

import java.util.LinkedList;
import java.util.Iterator;

public class ReverseIterateLinkedList {
    public static void main(String[] args) {
        // Creating a LinkedList of colors
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("LinkedList: " + colors);

        // Using descending iterator
        Iterator<String> descIterator = colors.descendingIterator();
        System.out.println("Iterating in reverse order:");
        while (descIterator.hasNext()) {
            System.out.println(descIterator.next());
        }
    }
}
