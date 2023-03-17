//
//  main.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var healthPoints: Int = 100
var manaPoints: Int = 50
var itemHeld = [10,5]

let itemChange = 20
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

let fleeT = """
You feel that if you don't escape soon, you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
              
You're safe, for now. Press [return] to continue:
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
        itemHeld[0] += randomAmount
        print("Congratulations, you've got \(randomAmount) potion from the enemy!")
    } else if randomItem == 2{
        itemHeld[1] += randomAmount
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
let nickname = getInput()
print("")
print("Nice to meet you \(nickname)!👋")
print("")
print(journeyS)

//JOURNEY OPTION
func cStat() {
    print("""

Player name: \(nickname)

HP: \(healthPoints)/100
MP: \(manaPoints)/50

Magic:
- Physical Attack. No mana required. Deal 30pt of damage.
- Fire Ball. Use 15pt of MP. Deal 100pt of damage.
- Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

Items:
- Potion x\(itemHeld[0]). Heal 20pt of your HP.
- Elixir x\(itemHeld[1]). Add 10pt of your MP

Press [return] to go back:
""")
}

func hPotion() {
    print("""
Your HP is \(healthPoints).
Your have \(itemHeld[0]) Potions.

Are you sure want to use 1 potion to heal wound? [Y/N]
""")
}

func aMana(){
    print("""
Your HP is \(manaPoints).
Your have \(itemHeld[1]) Elixir.

Are you sure want to use 1 elixir to regen mana? [Y/N]
""")
}

func fTroll() {
    var trollH: Int = 1000
    let trollDie: Int = 0
    var inputTroll: Int = 0
    var doubleDamageTroll: Int = 0
    
        while inputTroll != 6 {
            print("""
As you enter the forest, you feel a sense of unease wash over you.
Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.

👿Name: Troll
👿Health: \(trollH)

Choose your action:
[1] Physical Attack. No mana required. Deal 30pt of damage.
[2] Fire Ball. Use 15pt of MP. Deal 100pt of damage.
[3] Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

[4] Use Potion to heal wound. (Your Health : \(healthPoints)/100)
[5] Scan enemy's vital.
[6] Flee from battle.

Your choice?
""")
            
            while true {
                if let inputStr = readLine(), let num = Int(inputStr) {
                    if (1...6).contains(num) {
                        inputTroll = num
                        break
                    }
                }
                print("Invalid input, please try again.")
            }
            
            switch inputTroll {
            case 1:
                if doubleDamageTroll == 1 {
                    trollH -= 60
                    healthPoints -= 10
                    print("You attacked the Troll, you dealt 60pt of damage")
                    print("")
                    print("Troll attacked you, you lost 10 HP")
                    if healthPoints <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if healthPoints <= 30 {
                        print("Your HP is low")
                    }
                    if trollH <= trollDie {
                        doubleDamageTroll = 0
                        print("Troll has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                } else if doubleDamageTroll == 0{
                    trollH -= 30
                    healthPoints -= 10
                    print("You attacked the Troll, you dealt 30pt of damage")
                    print("")
                    print("Troll attacked you, you lost 10 HP")
                    if healthPoints <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if healthPoints <= 30 {
                        print("Your HP is low")
                    }
                    if trollH <= trollDie {
                        doubleDamageTroll = 0
                        print("Troll has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                }
            case 2:
                if manaPoints >= 15 {
                    if doubleDamageTroll == 1 {
                        trollH -= 200
                        healthPoints -= 10
                        manaPoints -= 15
                        print("Alakazamm... you attacked the Troll with your fire ball, you dealt 200pt of damage")
                        print("")
                        print("Troll attacked you, you lost 10 HP")
                        if healthPoints <= 0 {
                            print("GAME OVER")
                            print("You ran out of HP, better luck next time")
                            exit(0)
                        } else if healthPoints <= 30 {
                            print("Your HP is low")
                        }
                        if trollH <= trollDie {
                            doubleDamageTroll = 0
                            print("Troll has been slayin. Great job!")
                            let randomNumber = Int.random(in: 1...100)
                            if randomNumber <= itemChange {
                                randItem()
                                print(journeyS)
                            } else {
                                print(journeyS)
                            }
                        }
                    } else if doubleDamageTroll == 0 {
                        trollH -= 100
                        healthPoints -= 10
                        manaPoints -= 15
                        print("Alakazamm... you attacked the Troll with your fire ball, you dealt 100pt of damage")
                        print("")
                        print("Troll attacked you, you lost 10 HP")
                        if healthPoints <= 0 {
                            print("GAME OVER")
                            print("You ran out of HP, better luck next time")
                            exit(0)
                        } else if healthPoints <= 30 {
                            print("Your HP is low")
                        }
                        if trollH <= trollDie {
                            doubleDamageTroll = 0
                            print("Troll has been slayin. Great job!")
                            let randomNumber = Int.random(in: 1...100)
                            if randomNumber <= itemChange {
                                randItem()
                                print(journeyS)
                            } else {
                                print(journeyS)
                            }
                        }
                    }}else{
                        print("You run out off mana points to use Fire Ball")
                        continue
                    }
            case 3:
                if manaPoints >= 10 {
                    manaPoints -= 10
                    print("You blocked Troll's attack using Guardian Shield")
                    print("")
                }else{
                    print("You run out off mana points to use Guardian Shield")
                    continue
                }
            case 4:
                itemHeld[0] -= 1
                healthPoints += 20
                print("You used a potion and healed 20 points of your HP")
                print("")
            case 5:
                print("Scanning the enemy using your Samsung S23 Ultra, allowing you to attack that dealt double damage and giving you an advantage in the battle")
                doubleDamageTroll = 1
            case 6:
                print(fleeT)
                while let inputCon = readLine(){
                    if inputCon == ""{
                        break
                    } else {
                        print(fleeT)
                    }}
                print(journeyS)
            default:
                print("Unexpected input.")
            }
            if trollH <= trollDie {
                break
            }
    }
}

func mGolem() {
    var golemH: Int = 1000
    var inputGolem: Int = 0
    let golemDie: Int = 0
    var doubleDamageGolem: Int = 0
        while inputGolem != 6 {
            print("""
    As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.
    
    👿Name: Golem
    👿Health: \(golemH)
    
    Choose your action:
    [1] Physical Attack. No mana required. Deal 30pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 100pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound. (Your Health : \(healthPoints)/100)
    [5] Scan enemy's vital.
    [6] Flee from battle.
    
    Your choice?
    """)
            
            while true {
                if let inputStr = readLine(), let num = Int(inputStr) {
                    if (1...6).contains(num) {
                        inputGolem = num
                        break
                    }
                }
                print("Invalid input, please try again.")
            }
            
            switch inputGolem {
            case 1:
                if doubleDamageGolem == 1 {
                    golemH -= 60
                    healthPoints -= 12
                    print("You attacked the Golem, you dealt 60pt of damage")
                    print("")
                    print("Golem attacked you, you lost 10 HP")
                    if healthPoints <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if healthPoints <= 30 {
                        print("Your HP is low")
                    }
                    if golemH <= golemDie {
                        doubleDamageGolem = 0
                        print("Golem has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                } else if doubleDamageGolem == 0{
                    golemH -= 30
                    healthPoints -= 12
                    print("You attacked the Golem, you dealt 30pt of damage")
                    print("")
                    print("Golem attacked you, you lost 10 HP")
                    if healthPoints <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if healthPoints <= 30 {
                        print("Your HP is low")
                    }
                    if golemH <= golemDie {
                        doubleDamageGolem = 0
                        print("Golem has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                }
            case 2:
                if manaPoints >= 15{
                    if doubleDamageGolem == 1 {
                        golemH -= 200
                        healthPoints -= 12
                        manaPoints -= 15
                        print("Alakazamm... you attacked the Golem with your fire ball, you dealt 200pt of damage")
                        print("")
                        print("Golem attacked you, you lost 10 HP")
                        if healthPoints <= 0 {
                            print("GAME OVER")
                            print("You ran out of HP, better luck next time")
                            exit(0)
                        } else if healthPoints <= 30 {
                            print("Your HP is low")
                        }
                        if golemH <= golemDie {
                            doubleDamageGolem = 0
                            print("Golem has been slayin. Great job!")
                            let randomNumber = Int.random(in: 1...100)
                            if randomNumber <= itemChange {
                                randItem()
                                print(journeyS)
                            } else {
                                print(journeyS)
                            }
                        }
                    } else if doubleDamageGolem == 0 {
                        golemH -= 100
                        healthPoints -= 12
                        manaPoints -= 15
                        print("Alakazamm... you attacked the Golem with your fire ball, you dealt 100pt of damage")
                        print("")
                        print("Golem attacked you, you lost 10 HP")
                        if healthPoints <= 0 {
                            print("GAME OVER")
                            print("You ran out of HP, better luck next time")
                            exit(0)
                        } else if healthPoints <= 30 {
                            print("Your HP is low")
                        }
                        if golemH <= golemDie {
                            doubleDamageGolem = 0
                            print("Golem has been slayin. Great job!")
                            let randomNumber = Int.random(in: 1...100)
                            if randomNumber <= itemChange {
                                randItem()
                                print(journeyS)
                            } else {
                                print(journeyS)
                            }
                        }
                    }
                }else{
                    print("You run out off mana points to use Fire Ball")
                    continue
                }
            case 3:
                if manaPoints >= 10{
                    manaPoints -= 10
                    print("You blocked Golem's attack using Guardian Shield")
                    print("")
                }else{
                    print("You run out off mana points to use Guardian Shield")
                    continue
                }
            case 4:
                itemHeld[0] -= 1
                healthPoints += 20
                print("You used a potion and healed 20 points of your HP")
                print("")
            case 5:
                print("Scanning the enemy using your Samsung S23 Ultra, allowing you to attack that dealt double damage and giving you an advantage in the battle")
                doubleDamageGolem = 1
            case 6:
                print(fleeT)
                while let inputCon = readLine(){
                    if inputCon == ""{
                        break
                    } else {
                        print(fleeT)
                    }}
                print(journeyS)
            default:
                print("Unexpected input.")
            }
            if golemH <= golemDie {
                break
            }
    }
}

while true {
    if let inputJourney = readLine()?.uppercased() {
        switch inputJourney {
        case "C":
            cStat()
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    cStat()
                }}
            print(journeyS)
        case "H":
            if healthPoints == maxHP {
                print("Your HP is already full, you don't need to use any potion.")
                print(journeyS)
            } else {
                var optionHeal = false
                repeat {
                    hPotion()
                    
                    if let response = readLine()?.uppercased() {
                        if response == "Y" && itemHeld[0] > 0{
                            itemHeld[0] -= 1
                            healthPoints += 20
                            if healthPoints > 100 {
                                healthPoints = 100
                            }
                        
                            if response == "N"{
                                optionHeal = true
                            }
                        } else if response == "N" {
                            print("You choose not to use any potion.")
                            optionHeal = true
                            print(journeyS)
                        } else if itemHeld[0] == 0{
                            print("""
                        You don't have any potion left. Be careful of your next journey.
                    Press [return] to go back:
                    """)
                            while let inputCon = readLine(){
                                if inputCon == ""{
                                    break
                                } else {
                                    cStat()
                                }}
                            print(journeyS)
                        } else {
                            print("Invalid input. Please enter either 'Y' or 'N'.")
                        }
                    }
                }while !optionHeal
            }
        case "A":
            if manaPoints == maxMP {
                print("Your MP is already full, you don't need to use any elixir.")
                print(journeyS)
            } else {
                var optionHeal = false
                repeat {
                    aMana()
                    
                    if let response = readLine()?.uppercased() {
                        if response == "Y" && itemHeld[0] > 0{
                            itemHeld[0] -= 1
                            manaPoints += 25
                            if manaPoints > 50 {
                                healthPoints = 50
                            }
                        
                            if response == "N"{
                                optionHeal = true
                            }
                        } else if response == "N" {
                            print("You choose not to use any elixir.")
                            optionHeal = true
                            print(journeyS)
                        } else if itemHeld[0] == 0{
                            print("""
                        You don't have any elixir left. Be careful of your next journey my friend.
                    Press [return] to go back:
                    """)
                            while let inputCon = readLine(){
                                if inputCon == ""{
                                    break
                                } else {
                                    cStat()
                                }}
                            print(journeyS)
                        } else {
                            print("Invalid input. Please enter either 'Y' or 'N'.")
                        }
                    }
                }while !optionHeal
            }
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


