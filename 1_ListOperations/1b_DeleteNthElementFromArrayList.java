// 6. Write a java program for getting different colors through ArrayList interface 
// and delete nth element from the ArrayList object by using remove by index

import java.util.ArrayList;

public class DeleteNthElementFromArrayList {
    public static void main(String[] args) {
        // Creating an ArrayList to store colors
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");
        colors.add("Purple");

        System.out.println("Original list: " + colors);

        int n = 3; // Index of element to remove (0-based index)

        // Check if the index is valid
        if (n >= 0 && n < colors.size()) {
            colors.remove(n);
            System.out.println("List after removing element at index " + n + ": " + colors);
        } else {
            System.out.println("Invalid index: " + n);
        }
    }
}
