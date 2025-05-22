// 2. Write a java program for getting different colors through ArrayList interface 
// and remove the 2nd element and color "Blue" from the ArrayList

import java.util.ArrayList;

public class RemoveElementsFromArrayList {
    public static void main(String[] args) {
        // Creating an ArrayList to store colors
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("Original list: " + colors);

        // Remove the 2nd element (index 1)
        colors.remove(1);

        // Remove the color "Blue"
        colors.remove("Blue");

        System.out.println("List after removing 2nd element and 'Blue': " + colors);
    }
}
