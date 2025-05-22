// 3. Write a Java program to insert the specified element at the end of a linked list.
// (using l_listObj.offerLast("Pink"))

import java.util.LinkedList;

public class InsertAtEndOfLinkedList {
    public static void main(String[] args) {
        // Creating a LinkedList of colors
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");

        System.out.println("Original LinkedList: " + colors);

        // Inserting "Pink" at the end
        colors.offerLast("Pink");

        System.out.println("After inserting 'Pink' at the end: " + colors);
    }
}
