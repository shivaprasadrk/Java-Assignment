// Q8. Write a Java Program for Checking if a string contains only numbers using user defined function isNumeric().
public class CheckNumeric {
    public static void main(String[] args) {
        String input = "123456";
        System.out.println("Is numeric? " + isNumeric(input));
    }

    public static boolean isNumeric(String str) {
        return str != null && str.matches("\\d+");
    }
}
