#include <iostream>
#include <map>
#include <vector>
using namespace std;

int main() {
    string input;
    cout << "例：123+234('+','-','*','/'のみ対応)" << endl;
    cout << "数式を入力してください：";
    cin >> input;

    string first, second,op;
    long long ans;
    long double ans_double;
    bool check = false;
    for (int i = 0; i < input.length(); i++) {
        first = input.substr(0, i);
        second = input.substr(i + 1, input.length() - 1);
        op = input[i];

        if (input[i] == '+') {
            ans = stoll(first) + stoll(second);
            break;
        } else if (input[i] == '-') {
            ans = stoll(first) - stoll(second);
            break;
        } else if (input[i] == '*') {
            ans = stoll(first) * stoll(second);
            break;
        } else if (input[i] == '/') {
            check = true;
            if (stoll(second) == 0) {
                cout << "0除算は許されていません" << endl;
                return 0;
            }
            ans_double = stold(first) / stold(second);
            break;
        }
    }

    cout << "<計算の結果>" << endl;
    cout << first << op << second << '=';
    if (check)
        cout << ans_double << endl;
    else
        cout << ans << endl;

    return 0;
}