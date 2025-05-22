// 4. Write a Java program to display elements and their positions in a linked list 
// (using l_listObj.get(p))

import java.util.LinkedList;

public class DisplayElementsAndPositionsInLinkedList {
    public static void main(String[] args) {
        // Creating a LinkedList of colors
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("Displaying elements and their positions:");
        for (int i = 0; i < colors.size(); i++) {
            System.out.println("Position " + i + ": " + colors.get(i));
        }
    }
}
