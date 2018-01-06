public class Sierpinski {

    public static void main(String[] args) {
        int max = 1;
        int lig = Integer.parseInt(args[0]);

        while (max < lig) {
            max *= 2;
        }

        for (int i = lig - 1; i >= 0; i--) {
            for (int k = 0; k < i / 2; k++) {
                System.out.print(" ");
            }

            for (int j = 0; j < max - i; j++) {
                int ii = i;
                int jj = j;
                int div = max;

                while (div > 1 && ii + jj < div) {
                    div /= 2;
                    ii = ii % div;
                    jj = jj % div;
                }

                if (div == 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }

            System.out.println();
        }
    }
}
