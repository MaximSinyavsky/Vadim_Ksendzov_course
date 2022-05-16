//4***:Преобразовать задание 3* таким образом, чтобы возраст вводился используя 
//функцию prompt в привязанной верстке.
const checkAge = function(age){
    let age_minimum=18;
    let age_maximum=60;
    if(age.trim() == "" || +age){
        alert("Error!")
    }
    else{
        if(age < age_minimum){
            alert("You don’t have access cause your age is", age, "It’s less then", age_minimum)
        }
        else if(age >= age_minimum && age < age_maximum) {
            alert("Welcome!")
        }
        else if(age > age_maximum){
            alert("Keep calm and look Culture channel")
        }
        else{"Technical work"}
        }
    }
checkAge(prompt("Введите возраст"))