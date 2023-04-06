//
//  main.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var player = Player(playerName: "", playerHP: 100, playerMP: 50, multiplier: 0, playerItem: [10,5])
let physicalAttack = PhysicalAtk(skillName: "Physical Attack", skillMP: 0, damage: 30)
let fireBall = FireBall(skillName: "Fire Ball", skillMP: 15, damage: 100)
let guardianShield = GuardianShield(skillName: "Guardian Shield", skillMP: 10)

let itemChange = 50
let maxHP: Int = 100
let maxMP: Int = 50

let openingS = """
Welcome to the world of magic! 🧙🏻🧌

You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests🌲, mountains⛰️, and dungeons🏰, where you will face challenges, make allies, and fight enemies.

Press [return] to continue :
"""

let welcomingS = """
May I know your name, a young wizard?
"""

let journeyS = """
From here, you can...

[C]heck your health and stats
[H]eal your wounds with potion
[A]dd your mana with elixir

...or choose where you want to go

[F]orest of Troll
[M]ountain of Golem
[Q]uit game

Your choice?
"""

func getInput() -> String {
    // Keep asking for input until a valid alphabetic string is entered
    while true {
        if let input = readLine(), input.count > 0 {
            // Check if input contains only alphabetic characters
            let isValidInput = input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
            if isValidInput {
                return input
            }
        }
        print("Invalid input. Please enter only alphabetic characters.")
    }
}

//Random item from enemies
func randItem() {
    let randomItem = Int.random(in: 1...2)
    let randomAmount = Int.random(in: 1...3)
    
    //Potion drop
    if randomItem == 1{
        player.playerItem[0] += randomAmount
        print("Congratulations, you've got \(randomAmount) potion from the enemy!")
    } else if randomItem == 2{
        player.playerItem[1] += randomAmount
        print("Congratulations, you've got \(randomAmount) elixir from the enemy!")
    }
}

//GAME START -----------------------------------------------------------------
print(openingS)

while let inputCon = readLine(){
    if inputCon == ""{
        break
    } else {
        print("")
        print(openingS)
    }
}

//ENTER NAME -----------------------------------------------------------------
print(welcomingS)
player.playerName = getInput()
print("")
print("Nice to meet you \(player.playerName)!👋")
print("")
print(journeyS)

while true {
    if let inputJourney = readLine()?.uppercased() {
        switch inputJourney {
        case "C":
            playerStat()
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    playerStat()
                }}
            print(journeyS)
        case "H":
            usePotion()
        case "A":
            useElixir()
        case "F":
            fTroll()
        case "M":
            mGolem()
        case "Q":
            print("Thank you for playing...")
            exit(0)
        default:
            print("Invalid input")
        }
    } else {
        print("Error reading input.")
        exit(1)
    }
}


