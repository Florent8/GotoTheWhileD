import java.util.Stack;

import static java.lang.System.exit;
import static java.lang.System.out;

public final class Bracket {

    private static final Stack<Character> characters = new Stack<>();

    public static void main(final String[] args) {
        final char[] chars = args[0].toCharArray();
        for (final char c : chars)
            switch (c) {
                case '(':
                    characters.push('(');
                    break;
                case ')':
                    checkBracket('(');
                    break;
                case '{':
                    characters.push('{');
                    break;
                case '}':
                    checkBracket('{');
                    break;
                case '[':
                    characters.push('[');
                    break;
                case ']':
                    checkBracket('[');
                    break;
            }
        if (characters.isEmpty())
            out.println("YES");
        else
            out.println("NO");
    }

    private static void checkBracket(final char bracket) {
        if (characters.pop() != bracket) {
            out.println("NO");
            exit(0);
        }
    }
}
