//
//  Player.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 05/04/23.
//

import Foundation

struct Player {
    var playerName: String
    var playerHP: Int
    var playerMP: Int
    var multiplier: Int
    var playerItem: [Int]
    
    init(playerName: String, playerHP: Int, playerMP: Int, multiplier: Int, playerItem: [Int]) {
        self.playerName = playerName
        self.playerHP = playerHP
        self.playerMP = playerMP
        self.multiplier = multiplier
        self.playerItem = playerItem
    }
}

//Player Status Display
func playerStat() {
    print("""

Player name: \(player.playerName)

HP: \(player.playerHP)/100
MP: \(player.playerMP)/50

Magic:
- Physical Attack. No mana required. Deal 30pt of damage.
- Fire Ball. Use 15pt of MP. Deal 100pt of damage.
- Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

Items:
- Potion x\(player.playerItem[0]). Heal 20pt of your HP.
- Elixir x\(player.playerItem[1]). Add 10pt of your MP

Press [return] to go back:
""")
}

func printFlee() {
    print("""
    You feel that if you don't escape soon, you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
                  
    You're safe, for now. Press [return] to continue:
    """)
}

//Health Display
func hPotion() {
    print("""
Your HP is \(player.playerHP).
Your have \(player.playerItem[0]) Potions.

""")
}

//Mana Display
func aMana() {
    print("""
Your MP is \(player.playerMP).
Your have \(player.playerItem[1]) Elixir.

""")
}

//Using potion to regen health points
func usePotion() {
    if player.playerHP == maxHP {
        print("Your HP is already full, you don't need to use any potion.")
        print(journeyS)
    } else {
        var optionHeal = false
        repeat {
            hPotion()
            
            if player.playerHP >= maxHP {
                print("Your HP is already full, you don't need to use any potion.")
                print(journeyS)
                break
            } else {
                
                print("Are you sure want to use 1 potion to heal wound? [Y/N]")
                if let response = readLine()?.uppercased() {
                    if response == "Y" && player.playerItem[0] > 0{
                        player.playerItem[0] -= 1
                        player.playerHP += 20
                        if player.playerHP > 100 {
                            player.playerHP = 100
                        }
                        
                        if response == "N"{
                            optionHeal = true
                        }
                    } else if response == "N" {
                        print("You choose not to use any potion.")
                        optionHeal = true
                        print(journeyS)
                    } else if player.playerItem[0] == 0{
                        print("""
                You don't have any potion left. Be careful of your next journey.
            Press [return] to go back:
            """)
                        while let inputCon = readLine(){
                            if inputCon == ""{
                                break
                            } else {
                                playerStat()
                            }}
                        print(journeyS)
                    } else {
                        print("Invalid input. Please enter either 'Y' or 'N'.")
                    }
                }
            }
        }while !optionHeal
    }
}

//Using elixir to regen mana
func useElixir() {
    if player.playerMP == maxMP {
        print("Your MP is already full, you don't need to use any elixir.")
        print(journeyS)
    } else {
        var optionHeal = false
        repeat {
            aMana()
            if player.playerMP >= maxMP {
                print("Your MP is already full, you don't need to use any elixir.")
                print(journeyS)
                break
            } else {
                print("Are you sure want to use 1 elixir to regen mana? [Y/N]")
                if let response = readLine()?.uppercased() {
                    if response == "Y" && player.playerItem[0] > 0{
                        player.playerItem[0] -= 1
                        player.playerMP += 25
                        if player.playerMP > 50 {
                            player.playerHP = 50
                        }
                        
                        if response == "N"{
                            optionHeal = true
                        }
                    } else if response == "N" {
                        print("You choose not to use any elixir.")
                        optionHeal = true
                        print(journeyS)
                    } else if player.playerItem[0] == 0{
                        print("""
                You don't have any elixir left. Be careful of your next journey my friend.
            Press [return] to go back:
            """)
                        while let inputCon = readLine(){
                            if inputCon == ""{
                                break
                            } else {
                                playerStat()
                            }}
                        print(journeyS)
                    } else {
                        print("Invalid input. Please enter either 'Y' or 'N'.")
                    }
                }
            }
        }while !optionHeal
    }
}

