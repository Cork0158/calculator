import 'dart:collection';

var digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
var operators = ['+', '-', '*', '/', '(', ')'];

// 文字列を1文字ずつ読み込む
class MyBuffer {
    var str;
    var idx;

    MyBuffer({var str, var idx}) {
        this.str = str;
        this.idx = 0;
    }

    exist() {
        if (this.idx < 0) {
            return false;
        }
        if (this.str.length <= this.idx) {
            return false;
        }
        return true;
    }

    read() {
        return this.str.substring(this.idx, 1);
    }
    next() {
        return this.str.substring(this.idx++, 1);
    }
}

class MyLexer {
    var idx;
    var tokens;
    var buf = new MyBuffer();

    MyLexer(str) {
        this.idx = 0;
        this.tokens = [];
        if (str) {
            this.tokenize(str);
        }
    }

    tokenize(str) {
        this.tokens.removeRange(1, tokens.length);

        while (buf.exist()) {
            if (RegExp(r'/\d/').hasMatch(buf.read())) {
                this.tokens.add(this.getlex_number(buf));
            } else if (RegExp(r'/[\+\-\*\/\(\)]/').hasMatch(buf.read())) {
                this.tokens.add(this.getlex_symbol(buf));
            } else {
                buf.next();
            }
        }

        return this.tokens;
    }

    getlex_number(buf) {
        var num = '';
        while (RegExp(r'/\d/').hasMatch(buf.read())) {
            num += buf.next();
        }
        return int.parse(num);
    }

    getlex_symbol(buf) {
        return buf.next();
    }

    exist() {
        if (this.idx < 0) {
            return false;
        }
        if (this.tokens.length <= this.idx) {
            return false;
        }
        return true;
    }

    read() {
        return this.tokens[this.idx];
    }
    next() {
        return this.tokens[this.idx++];
    }
}


class MyLang {

    var laxer = new MyLexer();

    exec(str) {
        return this.expression(lexer);
    }

    expression(lexer) {
        var result = 1;
        if (lexer.read() == '+') {
            lexer.next();
        } else if (lexer.read() == '-') {
            result = -1;
            lexer.next();
        }
        result *= int.parse(this.term(lexer));

        while (lexer.read() == '+' || lexer.read() == '-') {
            switch (lexer.next()) {
                case '+':
                    result += int.parse(this.term(lexer));
                    break;
                case '-':
                    result -= int.parse(this.term(lexer));
                    break;
            }
        }
        return result;
    }

    term(lexer) {
        var result = this.factor(lexer);
        while (lexer.read() == '*' || lexer.read() == '/') {
            switch (lexer.next()) {
                case '*':
                    result *= double.parse(this.factor(lexer));
                    break;
                case '/':
                    result /= double.parse(this.factor(lexer));
                    break;
            }
        }
        return result;
    }

    factor(lexer) {
        if (lexer.read() == '(') {
            lexer.next();
            var result = this.expression(lexer);
            if (lexer.read() == ')') {
                lexer.next();
            }
            return result;
        }
        else {
            return lexer.next();
        }
    }
}



class Parser {
  const Parser();

  num parseExpression(String expr) {
    var cal = new MyLang();
    print(cal.expression(expr));
    return cal.expression(expr);
  }
}