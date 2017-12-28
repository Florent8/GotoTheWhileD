import java.lang.System.out
import java.util.*

object Bracket {

    private val OPEN_BRACKETS = Arrays.asList('(', '{', '[')
    private val openBrackets = Stack<Char>()
    private val CLOSE_BRACKETS = Arrays.asList(')', '}', ']')
    private val closeBrackets = ArrayDeque<Char>()

    @JvmStatic
    fun main(args: Array<String>) {
        out.println(if (checkBracket(args[0].toCharArray())) "YES" else "NO")
    }

    private fun checkBracket(chars: CharArray): Boolean {
        for (c in chars)
            if (OPEN_BRACKETS.contains(c))
                openBrackets.push(c)
            else if (CLOSE_BRACKETS.contains(c))
                closeBrackets.offer(c)

        if (openBrackets.size != closeBrackets.size)
            return false

        while (!openBrackets.isEmpty())
            if (closeBrackets.poll() != CLOSE_BRACKETS[OPEN_BRACKETS.indexOf(openBrackets.pop())])
                return false

        return true
    }
}
