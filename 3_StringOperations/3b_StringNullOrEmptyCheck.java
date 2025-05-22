// Q1. Write a Java Program for Checking if a given string is null or contains only whitespace using user defined function isNullOrEmpty().
public class StringNullOrEmptyCheck {
    public static void main(String[] args) {
        String input = "   ";
        System.out.println("Input: \"" + input + "\"");
        System.out.println("Is null or empty? " + isNullOrEmpty(input));
    }

    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
