// Q7. Write a Java Program for Truncating a string and adding an ellipsis using user defined function truncate().
public class TruncateString {
    public static void main(String[] args) {
        String input = "This is a very long sentence that should be shortened.";
        System.out.println(truncate(input, 25));
    }

    public static String truncate(String str, int length) {
        if (str.length() <= length) return str;
        return str.substring(0, length) + "...";
    }
}
