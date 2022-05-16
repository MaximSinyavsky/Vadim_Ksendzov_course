//js_hw_1*

//1*: Преобразовать написанный код в 26-33 пунктах в функцию, принимающую на вход возраст.
//Пример: const checkAge = function(age) {Ваши преобразования}
//Вывести в консоль результат работы функции с возрастами 17, 18, 61.
console.log("Задание №1")
{const checkAge = function(age){
    let age_minimum=18;
    let age_maximum=60;
    if(age < age_minimum){
        console.log("You don’t have access cause your age is", age, "It’s less then", age_minimum)
    }
    else if(age >= age_minimum && age < age_maximum) {
        console.log("Welcome!")
    }
    else if(age > age_maximum){
        console.log("Keep calm and look Culture channel")
    }
    else{"Technical work"}
    }
checkAge(17);
checkAge(18);
checkAge(61);
}
//2*: Преобразовать задание 1* таким образом, чтобы первым делом в функции проверялся тип данных. 
//И если он не Number - кидалась ошибка.
{console.log("Задание №2")
const checkAge = function(age){
    let age_minimum=18;
    let age_maximum=60;
    if(typeof age !== "number"){
        console.log("Error!")
    }
    else{
        if(age < age_minimum){
            console.log("You don’t have access cause your age is", age, "It’s less then", age_minimum)
        }
        else if(age >= age_minimum && age < age_maximum) {
            console.log("Welcome!")
        }
        else if(age > age_maximum){
            console.log("Keep calm and look Culture channel")
        }
        else{"Technical work"}
        }
    }
checkAge(17);
checkAge(18);
checkAge(61);
checkAge("12");
}
//3**: Преобразовать 2* таким образом, чтобы значение '2' (строка в которой лежит ТОЛЬКО ЦИФРА) пропускалось, 
//преобразовываясь в number
{console.log("Задание №3")
const checkAge = function(age){
    let age_minimum=18;
    let age_maximum=60;
    if(Number.isNaN(Number(age)) || !age){
        console.log("Error!")
    }
    else{
        if(age < age_minimum){
            console.log("You don’t have access cause your age is", age, "It’s less then", age_minimum)
        }
        else if(age >= age_minimum && age < age_maximum) {
            console.log("Welcome!")
        }
        else if(age > age_maximum){
            console.log("Keep calm and look Culture channel")
        }
        else{"Technical work"}
        }
    }
checkAge(55);
checkAge("17");
checkAge("18");
checkAge("61");
checkAge("number")
checkAge("");
}