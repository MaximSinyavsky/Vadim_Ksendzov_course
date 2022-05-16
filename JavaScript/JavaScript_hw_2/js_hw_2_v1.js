/* js_hw_№2

Напишите валидационный скрипт используя функции:
 1. Скрипт должен на вход принимать строку.
 2. После проверки строки выводить в консоль сообщение где будет конкретно написано, что не так 
 в веденной строке.
 3. Минимум 5 символов в строке.
 4. Максимум 64 символа в строке.
 5. В строке должны быть буквы.
 6. Должна быть хотя бы одна буква в верхнем регистре.
 7. Должна быть хотя бы одна цифра.
 8. Должна быть хотя бы одна @.
 9. Строка не должна быть пустой.
*/

let my_string;
my_string = "132ааа";
function empty_string(my_string){
    if(my_string.trim() == ""){
        return false
    }
    else{
        return true
    }
} //Пустая строка;
function min_length(my_string){
    if(my_string.length < 5){
        return false
    }
    else{
        return true
    }
} //Минимальная длина;
function max_length(my_string){
    if(my_string.length > 64){
        return false
    }
    else{
        return true
    }
} //Максимальная длина;
function letter(my_string){
    if(/[a-zа-я]/.test(my_string) != true && /[A-ZА-Я]/.test(my_string) != true){
        return false
    }
    else{
        return true
    }
} //Буквы;
function capital_letter(my_string){
    if(/[A-ZА-Я]/.test(my_string) != true && /[a-zа-я]/.test(my_string) == true){
        return false
    }
    else{
        return true
    }
} //Заглавные буквы;
function numbers(my_string){
    if(/\d/.test(my_string) != true){
        return false
    }
    else{
        return true
    }
} //Цифра;
function symbol(my_string){
    if(/[@]/.test(my_string) != true){
        return false
    }
    else{
        return true
    }
} //Спец Символ

let a = false;
switch(a){
    case (empty_string(my_string) && min_length(my_string) && max_length(my_string) && letter(my_string) && capital_letter(my_string) && numbers(my_string) && symbol(my_string)):
        console.log("ОШИБКА!")
        console.log("Cтрока не должна быть пустой!", empty_string(my_string))
        console.log("Строка должна содержать минимум 5 символов!", min_length(my_string))
        console.log("Строка должна содержать максимум 64 символа!", max_length(my_string))
        console.log("В строке должны быть буквы!", letter(my_string))
        console.log("В строке должна быть хотя бы одна буква в верхнем регистре!", capital_letter(my_string))
        console.log("В строке должна быть хотя бы одна цифра!", numbers(my_string))
        console.log("В строке должна быть хотя бы одна @!", symbol(my_string))
        break;
    default:
        console.log("Все данные корректны!")
}