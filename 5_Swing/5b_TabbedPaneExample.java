// 5b. Develop a Swing program in Java to create a JTabbedPane with three tabs labeled 
// BLUE, RED, and GREEN. Each tab should have a panel with a corresponding background color.



import java.awt.Color;
import javax.swing.*;

public class TabbedPaneExample {
    JFrame f;

    TabbedPaneExample() {
        f = new JFrame("TabbedPane Example");

        // Create three panels with different background colors
        JPanel p1 = new JPanel();
        JPanel p2 = new JPanel();
        JPanel p3 = new JPanel();
        p1.setBackground(Color.BLUE);
        p2.setBackground(Color.RED);
        p3.setBackground(Color.GREEN);

        // Create a tabbed pane and add the panels as tabs
        JTabbedPane tp = new JTabbedPane();
        tp.setBounds(50, 50, 200, 200);
        tp.add("BLUE", p1);
        tp.add("RED", p2);
        tp.add("GREEN", p3);

        // Add the tabbed pane to the frame
        f.add(tp);

        // Set frame properties
        f.setSize(400, 400);
        f.setLayout(null);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setVisible(true);
    }

    public static void main(String[] args) {
        new TabbedPaneExample();
    }
}
