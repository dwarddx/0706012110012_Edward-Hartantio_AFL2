//
//  Skill.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

class Skill {
    var skillName: String
    var skillMP: Int
    
    init(skillName: String, skillMP: Int) {
        self.skillName = skillName
        self.skillMP = skillMP
    }
}

class PhysicalAtk: Skill {
    var damage: Int
    
    init(skillName: String, skillMP: Int, damage: Int) {
        self.damage = damage
        super.init(skillName: skillName, skillMP: skillMP)
    }
}

class FireBall: Skill {
    var damage: Int
    
    init(skillName: String, skillMP: Int, damage: Int) {
        self.damage = damage
        super.init(skillName: skillName, skillMP: skillMP)
    }
}

class GuardianShield: Skill {
    override init(skillName: String, skillMP: Int) {
        super.init(skillName: skillName, skillMP: skillMP)
    }
}

