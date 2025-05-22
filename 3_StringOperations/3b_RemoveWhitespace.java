// Q5. Write a Java Program for Removing all whitespaces from a string using user defined function removeWhitespace().
public class 3b_RemoveWhitespace {
    public static void main(String[] args) {
        String input = " Java   Programming Language ";
        System.out.println("Original: \"" + input + "\"");
        System.out.println("Without whitespaces: \"" + removeWhitespace(input) + "\"");
    }

    public static String removeWhitespace(String str) {
        return str.replaceAll("\\s+", "");
    }
}
