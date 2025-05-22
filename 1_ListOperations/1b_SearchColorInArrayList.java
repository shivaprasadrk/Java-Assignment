// 1. Write a java program for getting different colors through ArrayList interface 
// and search whether the color "Red" is available or not

import java.util.ArrayList;

public class SearchColorInArrayList {
    public static void main(String[] args) {
        // Creating an ArrayList to store colors
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Green");
        colors.add("Blue");
        colors.add("Yellow");

        // Display the colors
        System.out.println("Colors: " + colors);

        // Check if "Red" is present
        if (colors.contains("Red")) {
            System.out.println("Color 'Red' is available in the list.");
        } else {
            System.out.println("Color 'Red' is not available in the list.");
        }
    }
}
