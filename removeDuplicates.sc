object Solution {
    def main(args: Array[String]) {
        val itStdin = io.Source.stdin.getLines()
        println(itStdin.toList.head.distinct.mkString(""))
    }
}
