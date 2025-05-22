// 4. Write a java program for getting different colors through ArrayList interface 
// and sort them using Collections.sort(ArrayListObj)

import java.util.ArrayList;
import java.util.Collections;

public class SortColorsInArrayList {
    public static void main(String[] args) {
        // Creating an ArrayList to store colors
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        System.out.println("Original list: " + colors);

        // Sorting the colors alphabetically
        Collections.sort(colors);

        System.out.println("Sorted list: " + colors);
    }
}
