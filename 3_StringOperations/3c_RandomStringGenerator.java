// Q9. Write a Java Program for Creating a random string of a specified length using user defined function generateRandomString().
import java.util.Random;

public class RandomStringGenerator {
    public static void main(String[] args) {
        System.out.println("Random string: " + generateRandomString(10));
    }

    public static String generateRandomString(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder result = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < length; i++) {
            result.append(chars.charAt(rand.nextInt(chars.length())));
        }
        return result.toString();
    }
}
