public class Sierpinski {

    public static void main(String[] args) {
        int size = (int) Math.pow(2, Double.parseDouble(args[0])), triangle[][] = new int[size][];
        triangle[0] = new int[1];
        triangle[0][0] = 1;
        for (int row = 0; row < size; row++) {
            for (int col = 0; col < (size - row) / 2; col++)
                System.out.print(" ");
            if (row == 0)
                System.out.println("*");
            else {
                triangle[row] = new int[triangle[row - 1].length + 1];
                for (int col = 0; col <= row; col++) {
                    triangle[row][col] = (col == 0) || (col == row) ? 1 : triangle[row - 1][col - 1] + triangle[row - 1][col] % 2;
                    System.out.print(triangle[row][col] % 2 == 0 ? " " : "*");
                }
                System.out.println();
            }
        }
    }
}