// 1. Write a Java program to iterate through all elements in a linked list starting at the
// specified position (2nd) using iterator 
// (Hint: Iterator iteratorObj = listObj.listIterator(1))

import java.util.LinkedList;
import java.util.Iterator;

public class IterateFromSecondPositionInLinkedList {
    public static void main(String[] args) {
        // Creating a LinkedList of colors
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("LinkedList: " + colors);

        // Creating iterator starting from index 1 (2nd element)
        Iterator<String> iterator = colors.listIterator(1);
        System.out.println("Iterating from 2nd position:");
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
