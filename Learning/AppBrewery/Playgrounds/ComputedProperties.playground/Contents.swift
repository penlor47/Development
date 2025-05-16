// Computed properties reduce the lines of code and can reduce the opportunities for error in the code.
// These are properties that are computed or calculated based on inputs, so when one property is changed the computed property will change to match

import Foundation

var pizzaInInches: Int = 10 {
    // This is an observed property, it monitors when a property is changed. Here we are using it to ensure that the property remains a 'correct' value
    willSet {
        // This monitors just before the property gets changed
        // print(newValue) this prints the new value that the property is being set to
    }
    didSet {
        // This monitors just after the property gets changed
        // print(oldValue) this prints the old value that the property used to be
        if pizzaInInches > 18 {
            print("Invalid size specified, pizzaInInches set to 18in.")
            pizzaInInches = 18
        }
    }
}
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get{
        // This is a getter as it is a block of code that calculates a value every time that you try to 'get' that property
        return pizzaInInches - 4
    }
    set {
        // This is a setter and is the block of code called when a new value is 'set' to a property i.e. you can go property = newValue
        print("The numberOfSlices now has a new value which is \(newValue)")
    }
}

var numberofPizza: Int{
    get{
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberofPizza = 6
pizzaInInches = 33
print(pizzaInInches)
