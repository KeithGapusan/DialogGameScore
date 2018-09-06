//
//  Score.swift
//  DialogGameScore
//
//  Created by Keith Gapusan on 06/09/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

struct Score {
    var home: Int
    var opponent : Int

    

    func getAllData()->[String:Any]{
        return ["homeScore" : self.home , "oppponentScore": self.opponent]
    }
    
    
    
}
