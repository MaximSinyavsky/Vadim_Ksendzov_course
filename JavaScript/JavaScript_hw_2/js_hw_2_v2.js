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
my_string = "";
function empty_string(my_string){
    return !my_string.trim() == ""}//Пустая строка;
function min_length(my_string){
    return my_string.length >= 5}//Минимальная длина;
function max_length(my_string){
    return my_string.length < 64}//Максимальная длина;
function letter(my_string){
    return /[A-ZА-Яa-zа-я]/.test(my_string)}//Буквы;
function capital_letter(my_string){
    return /[A-ZА-Я]/.test(my_string)}//Заглавные буквы;
function numbers(my_string){
    return /\d/.test(my_string)}//Цифра;
function symbol(my_string){
    return /[@]/.test(my_string)}//Спец Символ;
if(
    empty_string(my_string) &&
    min_length(my_string) &&
    max_length(my_string) &&
    letter(my_string) &&
    capital_letter(my_string) &&
    numbers(my_string) &&
    symbol(my_string))
    {console.log("Все данные корректны")}
else{
    console.log("ОШИБКА!")
    console.log("Cтрока не должна быть пустой!", empty_string(my_string))
    console.log("Строка должна содержать минимум 5 символов!", min_length(my_string))
    console.log("Строка должна содержать максимум 64 символа!", max_length(my_string))
    console.log("В строке должны быть буквы!", letter(my_string))
    console.log("В строке должна быть хотя бы одна буква в верхнем регистре!", capital_letter(my_string))
    console.log("В строке должна быть хотя бы одна цифра!", numbers(my_string))
    console.log("В строке должна быть хотя бы одна @!", symbol(my_string))}
    
    
    










/*




    function empty_string(my_string){
        return !my_string.trim() == ""
    }//Пустая строка
    function min_length(my_string){
        return my_string.length >= 5
    } //Минимальная длина
    function max_length(my_string){
        return my_string.length < 64
    }//Максимальная длина;
    function letter(my_string){
        return /[A-ZА-Яa-zа-я]/.test(my_string)
    }//Буквы;
    function capital_letter(my_string){
        return /[A-ZА-Я]/.test(my_string)
    }//Заглавные буквы
    function numbers(my_string){
        return /\d/.test(my_string)
    }//Цифра;
    function symbol(my_string){
        return /[@]/.test(my_string)
    }//Спец Символ





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
*/