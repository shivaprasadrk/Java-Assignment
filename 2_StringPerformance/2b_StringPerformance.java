/*
 * 2.b. Develop a Java program to make a Performance Test on StringBuffer and StringBuilder
 * for appending the string 'AIET' for 10,000 times both in StringBuffer and StringBuilder.
 * Justify your answer which one is better.
 */

public class PerformanceTest {
    public static void main(String[] args) {
        // StringBuffer Test
        StringBuffer buffer = new StringBuffer();
        long startBuffer = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            buffer.append("AIET");
        }
        long endBuffer = System.nanoTime();
        System.out.println("Time taken by StringBuffer: " + (endBuffer - startBuffer) + " ns");

        // StringBuilder Test
        StringBuilder builder = new StringBuilder();
        long startBuilder = System.nanoTime();
        for (int i = 0; i < 10000; i++) {
            builder.append("AIET");
        }
        long endBuilder = System.nanoTime();
        System.out.println("Time taken by StringBuilder: " + (endBuilder - startBuilder) + " ns");

        // Conclusion
        System.out.println("\nNote: StringBuilder is usually faster than StringBuffer because it is not synchronized.");
    }
}
