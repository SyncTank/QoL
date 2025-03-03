import java.util.Scanner;
import java.io.File;
import java.io.PrintWriter;
import java.io.FileInputStream;

public class Main {
    public static void main(String[] args) {
        System.out.println("Assignment 7\n");
      Scanner scn = new Scanner(System.in);

        // Ask user to input file name.
        System.out.println("Please input a valid file name or path");
        boolean exists = false;
        String filepath = "";
        File file = null;
        while (!exists) {
            filepath = scn.nextLine();
            file = new File("src/" + filepath);
            System.out.println("Finding " + file);
            if (file.exists()) {
                exists = true;
            } else {
                System.out.println("Could not find the file, please input it again or exit program");
            }
        }

        // Read source and write temp file
        System.out.println("Creating temp");
        try (PrintWriter writer = new PrintWriter("temp.txt");
            Scanner fileScan = new Scanner(new FileInputStream(file))) {
            while (fileScan.hasNextLine()) {
                String line = fileScan.nextLine();
                String[] out = line.split("\\.");
                for (String str : out) {
                    writer.println(str.replaceAll("^\\s+",""));
                }
            }
          fileScan.close();
        } catch (Exception err) {
            System.out.println("Unable to open file: " + err);
        } 

        // replace source with temp and remove source
        System.out.println("Replacing Source at: " + filepath );
        if (file.exists()) {
          file.delete();
        }
        try {
          File nfile = new File("temp.txt");
          nfile.renameTo(file);
        } catch (Exception err){
          System.out.println("File not found " + err);
        }

        // delete temp
        System.out.println("Deleting temp" );
        File tempFile = new File("temp.txt");
        if (tempFile.exists()) {
          tempFile.delete();
        }

        scn.close();
    }

}
