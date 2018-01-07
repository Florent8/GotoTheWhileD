import scala.collection.mutable

object Bracket {

  private val OPEN_BRACKETS: List[Char] = List('(', '{', '[')
  private val openBrackets: mutable.Stack[Char] = mutable.Stack()
  private val CLOSE_BRACKETS: List[Char] = List(')', '}', ']')
  private val closeBrackets: mutable.Queue[Char] = mutable.Queue()

  def main(args: Array[String]): Unit = {
    println(if (checkBracket(args(0).toCharArray)) "YES" else "NO")
  }

  private def checkBracket(chars: Array[Char]): Boolean = {
    for (c <- chars)
      if (OPEN_BRACKETS.contains(c)) openBrackets.push(c)
      else if (CLOSE_BRACKETS.contains(c)) closeBrackets.enqueue(c)
    if (openBrackets.lengthCompare(closeBrackets.size) != 0) return false
    while (openBrackets.nonEmpty)
      if (!closeBrackets.dequeue().equals(CLOSE_BRACKETS(OPEN_BRACKETS.indexOf(openBrackets.pop())))) return false
    true
  }
}
