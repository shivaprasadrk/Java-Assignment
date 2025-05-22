// Q10. Write a Java Program for Counting the number of words in a string using user defined function countWords().
public class WordCounter {
    public static void main(String[] args) {
        String input = "Java is a powerful programming language.";
        System.out.println("Word count: " + countWords(input));
    }

    public static int countWords(String str) {
        if (str == null || str.trim().isEmpty()) return 0;
        return str.trim().split("\\s+").length;
    }
}
