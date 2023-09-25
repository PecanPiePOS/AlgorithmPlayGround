//: [Previous](@previous)

import Foundation

print(Date())

var greeting = "1999-09-08"
var ggg = "2000-09-09"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let convertDate = dateFormatter.date(from: greeting)
let pooo = dateFormatter.date(from: ggg)

print(convertDate!, pooo!)

