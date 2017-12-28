#include <algorithm>
#include <iostream>
#include <queue>
#include <stack>

using namespace std;

char OPEN_BRACKETS[] = {'(', '{', '['};
stack<char> openBrackets;
char CLOSE_BRACKETS[] = {')', '}', ']'};
queue<char> closeBrackets;

bool checkBrackets(const string &chars) {
    for (char c : chars)
        if (find(begin(OPEN_BRACKETS), end(OPEN_BRACKETS), c) != end(OPEN_BRACKETS))
            openBrackets.push(c);
        else if (find(begin(CLOSE_BRACKETS), end(CLOSE_BRACKETS), c) != end(CLOSE_BRACKETS))
            closeBrackets.push(c);

    if (openBrackets.size() != closeBrackets.size())
        return false;

    while (!openBrackets.empty()) {
        if (closeBrackets.front() !=
            CLOSE_BRACKETS[distance(OPEN_BRACKETS, find(begin(OPEN_BRACKETS), end(OPEN_BRACKETS), openBrackets.top()))])
            return false;
        openBrackets.pop();
        closeBrackets.pop();
    }

    return true;
}

int main(int argc, char **argv) {
    cout << (checkBrackets(argv[1]) ? "YES" : "NO") << endl;
    return EXIT_SUCCESS;
}
