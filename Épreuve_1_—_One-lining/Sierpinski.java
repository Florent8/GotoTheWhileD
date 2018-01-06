public class Sierpinski {

    public static void main(String[] args) {
        int size = (int) Math.pow(2, Double.parseDouble(args[0])), triangle[][] = new int[size][];
        triangle[0] = new int[1];
        triangle[0][0] = 1;
        for (int row = 1; row < size; row++) {
            triangle[row] = new int[triangle[row - 1].length + 1];
            for (int col = 0; col <= row; col++)
                if ((col == 0) || (col == row))
                    triangle[row][col] = 1;
                else
                    triangle[row][col] = triangle[row - 1][col - 1] + triangle[row - 1][col];
        }
        for (int row = 0; row < size; row++) {
            for (int col = 0; col <= row; col++)
                System.out.print(triangle[row][col] % 2 == 0 ? " " : "*");
            System.out.println();
        }
    }
}
