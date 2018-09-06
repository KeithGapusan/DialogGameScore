//
//  GameScoreViewModel.swift
//
//  Created by Keith Gapusan on 04/09/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import Foundation

class GameScoreViewModel: NSObject {
    
    public static let shared = GameScoreViewModel()
    var score: Score?
    
    
    

    func setScoreValue(textFieldHome:String, textFieldOppenent: String){
        score = Score(home: Int(textFieldHome) ?? 0, opponent: Int(textFieldOppenent) ?? 0)
    }
    
    func getScoreValue(_ button: String) -> [String:Any]{
        return ["button": button, "data": score!.getAllData()] as [String : Any]
    }
    
    
    
}
