let Cal = require('./calculater.js')

var check = Boolean(0);

function get_calc(btn) {
    if(check) {
        document.dentaku.display.value = "";
        check = Boolean(0);
    }

    if (btn.value == "=") {
        let cal = new Cal(document.dentaku.display.value)
        
        document.dentaku.display.value = Cal.exec(document.dentaku.display.value)
        //document.dentaku.display.value = eval(document.dentaku.display.value);
        check = Boolean(1);
    } else if (btn.value == "AC") {
        document.dentaku.display.value = "";
    } else if (btn.value == "C") {
        document.dentaku.display.value = document.dentaku.display.value.slice(0, -1);
    } else {
        if (btn.value == "×") {
            btn.value = "*";
        } else if (btn.value == "÷") {
            btn.value = "/";
        } else if (btn.value == "SP") {
            btn.value = " "
        }
        document.dentaku.display.value += btn.value;
        document.dentaku.multi_btn.value = "×";
        document.dentaku.div_btn.value = "÷";
    }
}