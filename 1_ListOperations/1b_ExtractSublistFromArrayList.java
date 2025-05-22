// 5. Write a java program for getting different colors through ArrayList interface 
// and extract the elements 1st and 2nd from the ArrayList object by using subList()

import java.util.ArrayList;
import java.util.List;

public class ExtractSublistFromArrayList {
    public static void main(String[] args) {
        // Creating an ArrayList to store colors
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("Original list: " + colors);

        // Extracting elements at index 0 and 1 (i.e., 1st and 2nd elements)
        List<String> subList = colors.subList(0, 2);

        System.out.println("Extracted sublist (1st and 2nd elements): " + subList);
    }
}
