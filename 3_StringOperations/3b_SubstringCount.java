// Q2. Write a Java Program for Counting how many times a substring appears in a main string using user defined function countOccurrences().
public class SubstringCount {
    public static void main(String[] args) {
        String main = "Java is great. Java is powerful. Java is everywhere.";
        String sub = "Java";
        System.out.println("Occurrences of \"" + sub + "\": " + countOccurrences(main, sub));
    }

    public static int countOccurrences(String mainStr, String subStr) {
        int count = 0;
        int index = 0;
        while ((index = mainStr.indexOf(subStr, index)) != -1) {
            count++;
            index += subStr.length();
        }
        return count;
    }
}
