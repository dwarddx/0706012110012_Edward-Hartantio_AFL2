//
//  Enemies.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

protocol Monster {
    var enemyName: String { get }
    var enemyHP: Int { get set }
    var enemyDmg: Int { get set }

    func attack() -> Int
}

class Enemies: Monster {
    var enemyName: String
    var enemyHP: Int
    var enemyDmg: Int
    
    init(enemyName: String, enemyHP: Int, enemyDmg: Int) {
        self.enemyName = enemyName
        self.enemyHP = enemyHP
        self.enemyDmg = enemyDmg
    }
    
    func attack() -> Int {
        fatalError("attack() should be implemented by subclasses")
    }
}

class Troll: Enemies {
    init() {
        super.init(enemyName: "Troll", enemyHP: 750, enemyDmg: 10)
    }
    override func attack() -> Int {
        return enemyDmg
    }
}

class Golem: Enemies {
    init() {
        super.init(enemyName: "Golem", enemyHP: 900, enemyDmg: 12)
    }
    override func attack() -> Int {
        return enemyDmg
    }
}

//Forest Of Troll Function
func fTroll() {
    let troll = Troll()
    let trollDie: Int = 0
    var inputTroll: Int = 0
    
    while inputTroll != 6 {
        print("""
As you enter the forest, you feel a sense of unease wash over you.
Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.

👿Name: \(troll.enemyName)
👿Health: \(troll.enemyHP)

Choose your action:
[1] Physical Attack. No mana required. Deal 30pt of damage.
[2] Fire Ball. Use 15pt of MP. Deal 100pt of damage.
[3] Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

[4] Use Potion to heal wound. (Your Health : \(player.playerHP)/100)
[5] Scan enemy's vital.
[6] Flee from battle.

Your choice?
""")
        
        //Error Handling input must 1-6
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
            //Attacking after scanning enemy (Physical ATK)
            if player.multiplier == 1 {
                troll.enemyHP -= (physicalAttack.damage*2)
                player.playerHP -= troll.enemyDmg
                print("You attacked the Troll, you dealt \(physicalAttack.damage*2)pt of damage")
                print("")
                print("Troll attacked you, you lost \(troll.enemyDmg) HP")
                if player.playerHP <= 0 {
                    print("GAME OVER")
                    print("You ran out of HP, better luck next time")
                    exit(0)
                } else if player.playerHP <= 30 {
                    print("Your HP is low")
                }
                if troll.enemyHP <= trollDie {
                    player.multiplier = 0
                    print("Troll has been slayin. Great job!")
                    //50% Change to get drop items from the enemy
                    let randomNumber = Int.random(in: 1...100)
                    if randomNumber <= itemChange {
                        randItem()
                        print(journeyS)
                    } else {
                        print(journeyS)
                    }
                }
            } else if player.multiplier == 0{
                troll.enemyHP -= physicalAttack.damage
                player.playerHP -= troll.enemyDmg
                print("You attacked the Troll, you dealt \(physicalAttack.damage)pt of damage")
                print("")
                print("Troll attacked you, you lost \(troll.enemyDmg) HP")
                if player.playerHP <= 0 {
                    print("GAME OVER")
                    print("You ran out of HP, better luck next time")
                    exit(0)
                } else if player.playerHP <= 30 {
                    print("Your HP is low")
                }
                if troll.enemyHP <= trollDie {
                    player.multiplier = 0
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
            if player.playerMP >= 15 {
                if player.multiplier == 1 {
                    troll.enemyHP -= fireBall.damage*2
                    player.playerHP -= troll.enemyDmg
                    player.playerMP -= fireBall.skillMP
                    print("Alakazamm... you attacked the Troll with your fire ball, you dealt \(fireBall.damage*2)pt of damage")
                    print("")
                    print("Troll attacked you, you lost \(troll.enemyDmg) HP")
                    if player.playerHP <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if player.playerHP <= 30 {
                        print("Your HP is low")
                    }
                    if troll.enemyHP <= trollDie {
                        player.multiplier = 0
                        print("Troll has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                } else if player.multiplier == 0 {
                    troll.enemyHP -= fireBall.damage
                    player.playerHP -= troll.enemyDmg
                    player.playerMP -= fireBall.skillMP
                    print("Alakazamm... you attacked the Troll with your fire ball, you dealt \(fireBall.damage)pt of damage")
                    print("")
                    print("Troll attacked you, you lost \(troll.enemyDmg) HP")
                    if player.playerHP <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if player.playerHP <= 30 {
                        print("Your HP is low")
                    }
                    if troll.enemyHP <= trollDie {
                        player.multiplier = 0
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
            }else{
                print("You run out off mana points to use Fire Ball")
                continue
            }
        case 3:
            if player.playerMP >= 10 {
                player.playerMP -= guardianShield.skillMP
                print("You blocked Troll's attack using Guardian Shield")
                print("")
            }else{
                print("You run out off mana points to use Guardian Shield")
                continue
            }
        case 4:
            if player.playerHP >= maxHP {
                print("Your HP is already full, you don't need to use any potion.")
            } else {
                player.playerItem[0] -= 1
                player.playerHP += 20
                print("You used a potion and healed 20 points of your HP")
                print("")
            }
        case 5:
            print("Scanning the enemy using your Samsung S23 Ultra, allowing you to attack that dealt double damage and giving you an advantage in the battle")
            player.multiplier = 1
        case 6:
            printFlee()
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    printFlee()
                }
            }
            print(journeyS)
        default:
            print("Unexpected input.")
        }
        if troll.enemyHP <= trollDie {
            break
        }
    }
}

func mGolem() {
    let golem = Golem()
    var inputGolem: Int = 0
    let golemDie: Int = 0
    while inputGolem != 6 {
        print("""
    As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.
    
    👿Name: \(golem.enemyName)
    👿Health: \(golem.enemyHP)
    
    Choose your action:
    [1] Physical Attack. No mana required. Deal 30pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 100pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
    
    [4] Use Potion to heal wound. (Your Health : \(player.playerHP)/100)
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
            if player.multiplier == 1 {
                golem.enemyHP -= (physicalAttack.damage*2)
                player.playerHP -= golem.enemyDmg
                print("You attacked the Golem, you dealt \(physicalAttack.damage*2)pt of damage")
                print("")
                print("Golem attacked you, you lost \(golem.enemyDmg) HP")
                if player.playerHP <= 0 {
                    print("GAME OVER")
                    print("You ran out of HP, better luck next time")
                    exit(0)
                } else if player.playerHP <= 30 {
                    print("Your HP is low")
                }
                if golem.enemyHP <= golemDie {
                    player.multiplier = 0
                    print("Golem has been slayin. Great job!")
                    let randomNumber = Int.random(in: 1...100)
                    if randomNumber <= itemChange {
                        randItem()
                        print(journeyS)
                    } else {
                        print(journeyS)
                    }
                }
            } else if player.multiplier == 0{
                golem.enemyHP -= physicalAttack.damage
                player.playerHP -= golem.enemyDmg
                print("You attacked the Golem, you dealt \(physicalAttack.damage)pt of damage")
                print("")
                print("Golem attacked you, you lost \(golem.enemyDmg) HP")
                if player.playerHP <= 0 {
                    print("GAME OVER")
                    print("You ran out of HP, better luck next time")
                    exit(0)
                } else if player.playerHP <= 30 {
                    print("Your HP is low")
                }
                if golem.enemyHP <= golemDie {
                    player.multiplier = 0
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
            if player.playerMP >= 15{
                if player.multiplier == 1 {
                    golem.enemyHP -= fireBall.damage*2
                    player.playerHP -= golem.enemyDmg
                    player.playerMP -= fireBall.skillMP
                    print("Alakazamm... you attacked the Golem with your fire ball, you dealt \(fireBall.damage*2)pt of damage")
                    print("")
                    print("Golem attacked you, you lost \(golem.enemyDmg) HP")
                    if player.playerHP <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if player.playerHP <= 30 {
                        print("Your HP is low")
                    }
                    if golem.enemyHP <= golemDie {
                        player.multiplier = 0
                        print("Golem has been slayin. Great job!")
                        let randomNumber = Int.random(in: 1...100)
                        if randomNumber <= itemChange {
                            randItem()
                            print(journeyS)
                        } else {
                            print(journeyS)
                        }
                    }
                } else if player.multiplier == 0 {
                    golem.enemyHP -= fireBall.damage
                    player.playerHP -= golem.enemyDmg
                    player.playerMP -= fireBall.skillMP
                    print("Alakazamm... you attacked the Golem with your fire ball, you dealt \(fireBall.damage)pt of damage")
                    print("")
                    print("Golem attacked you, you lost \(golem.enemyDmg) HP")
                    if player.playerHP <= 0 {
                        print("GAME OVER")
                        print("You ran out of HP, better luck next time")
                        exit(0)
                    } else if player.playerHP <= 30 {
                        print("Your HP is low")
                    }
                    if golem.enemyHP <= golemDie {
                        player.multiplier = 0
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
            if player.playerMP >= 10{
                player.playerMP -= guardianShield.skillMP
                print("You blocked Golem's attack using Guardian Shield")
                print("")
            }else{
                print("You run out off mana points to use Guardian Shield")
                continue
            }
        case 4:
            if player.playerHP >= maxHP {
                print("Your HP is already full, you don't need to use any potion.")
            } else {
                player.playerItem[0] -= 1
                player.playerHP += 20
                print("You used a potion and healed 20 points of your HP")
                print("")
            }
        case 5:
            print("Scanning the enemy using your Samsung S23 Ultra, allowing you to attack that dealt double damage and giving you an advantage in the battle")
            player.multiplier = 1
        case 6:
            printFlee()
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    printFlee()
                }}
            print(journeyS)
        default:
            print("Unexpected input.")
        }
        if golem.enemyHP <= golemDie {
            break
        }
    }
}
