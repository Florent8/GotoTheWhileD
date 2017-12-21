import java.util.ArrayList;
import java.util.List;

import static java.lang.System.exit;
import static java.lang.System.out;

public final class Bracket {

    private static final List<Character> characters = new ArrayList<>();

    public static void main(final String[] args) {
        final char[] chars = args[0].toCharArray();
        for (final char c : chars)
            switch (c) {
                case '(':
                    characters.add('(');
                    break;
                case ')':
                    checkBracket('(');
                    break;
                case '{':
                    characters.add('{');
                    break;
                case '}':
                    checkBracket('{');
                    break;
                case '[':
                    characters.add('[');
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
        if (characters.get(characters.size() - 1) != bracket) {
            out.println("NO");
            exit(0);
        }
        characters.remove(characters.size() - 1);
    }
}
