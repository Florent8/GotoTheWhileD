import java.util.*;

import static java.lang.System.out;

public final class Bracket {

    private static final List<Character>  OPEN_BRACKETS  = Arrays.asList('(', '{', '[');
    private static final Stack<Character> openBrackets   = new Stack<>();
    private static final List<Character>  CLOSE_BRACKETS = Arrays.asList(')', '}', ']');
    private static final Queue<Character> closeBrackets  = new ArrayDeque<>();

    public static void main(final String[] args) {
        out.println(checkBracket(args[0].toCharArray()) ? "YES" : "NO");
    }

    private static boolean checkBracket(final char[] chars) {
        for (final char c : chars)
            if (OPEN_BRACKETS.contains(c))
                openBrackets.push(c);
            else if (CLOSE_BRACKETS.contains(c))
                closeBrackets.offer(c);

        if (openBrackets.size() != closeBrackets.size())
            return false;

        while (!openBrackets.isEmpty())
            if (closeBrackets.poll() != CLOSE_BRACKETS.get(OPEN_BRACKETS.indexOf(openBrackets.pop())))
                return false;

        return true;
    }
}
