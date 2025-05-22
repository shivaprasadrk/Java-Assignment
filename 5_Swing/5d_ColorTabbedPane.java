// 5d. Develop a Swing program in Java to create a Tabbed Pane of Cyan, Magenta and Yellow 
// and display the concerned color whenever the specific tab is selected in the Pane.

import java.awt.Color;
import javax.swing.*;

public class ColorTabbedPane extends JFrame {

    public ColorTabbedPane() {
        // Create the JFrame
        setTitle("Color Tabbed Pane");
        setSize(400, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Create JTabbedPane
        JTabbedPane tabbedPane = new JTabbedPane();

        // Create panels for each color
        JPanel cyanPanel = new JPanel();
        cyanPanel.setBackground(Color.CYAN);

        JPanel magentaPanel = new JPanel();
        magentaPanel.setBackground(Color.MAGENTA);

        JPanel yellowPanel = new JPanel();
        yellowPanel.setBackground(Color.YELLOW);

        // Add panels as tabs
        tabbedPane.addTab("Cyan", cyanPanel);
        tabbedPane.addTab("Magenta", magentaPanel);
        tabbedPane.addTab("Yellow", yellowPanel);

        // Add the tabbed pane to the frame
        add(tabbedPane);

        setVisible(true);
    }

    public static void main(String[] args) {
        new ColorTabbedPane();
    }
}
