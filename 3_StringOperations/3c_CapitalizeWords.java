// Q6. Write a Java Program for Capitalizing the first letter of each word using user defined function capitalizeWords().
public class CapitalizeWords {
    public static void main(String[] args) {
        String input = "java programming language";
        System.out.println("Capitalized: " + capitalizeWords(input));
    }

    public static String capitalizeWords(String str) {
        String[] words = str.split("\\s+");
        StringBuilder result = new StringBuilder();
        for (String word : words) {
            if (!word.isEmpty()) {
                result.append(Character.toUpperCase(word.charAt(0)))
                      .append(word.substring(1))
                      .append(" ");
            }
        }
        return result.toString().trim();
    }
}
