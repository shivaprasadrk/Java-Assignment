// 5. Write a Java program that swaps two elements (first and third elements) in a linked list 
// (using Collections.swap(l_list, 0, 2))

import java.util.LinkedList;
import java.util.Collections;

public class SwapElementsInLinkedList {
    public static void main(String[] args) {
        // Creating a LinkedList of colors
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("Original LinkedList: " + colors);

        // Swapping first (index 0) and third (index 2) elements
        Collections.swap(colors, 0, 2);

        System.out.println("After swapping first and third elements: " + colors);
    }
}
