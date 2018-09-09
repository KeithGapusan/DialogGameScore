//
//  GameScoreDialog.swift
//
//  Created by Keith Gapusan on 30/08/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit


@objc public protocol GameDialogViewDelegate:class{
    func didPressedButton(_ data: [String: Any])
    
}


@objc public class GameScoreDialog: UIView {

    @IBOutlet public  weak var lblTitle: UILabel!
    @IBOutlet public  weak var lblTeamHome: UILabel!
    @IBOutlet public  weak var lblTeamOpponent: UILabel!
    
    @IBOutlet public  weak var tfHome: UITextField!
    @IBOutlet weak var tfOpponent: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    var view: UIView!
    public var delegate: GameDialogViewDelegate!
    static let shared = GameScoreDialog()
    var viewModel : GameScoreViewModel?
    
    
//    var viewModel : GameScoreDialo?
    
    
    
    @IBAction func didPressedButton(_ sender: UIButton) {
        switch sender {
        case btnSubmit:
            viewModel?.setScoreValue(textFieldHome: tfHome?.text ?? "0", textFieldOppenent: tfOpponent?.text ?? "0")
            self.delegate.didPressedButton(self.getCurrentTextFieldValue("submit"))
            break
        case btnCancel:
            self.delegate.didPressedButton(self.getCurrentTextFieldValue("cancel"))
            break
        default:
            print("not applicable")
        }
    }
    
    func getCurrentTextFieldValue(_ button: String) -> [String:Any]{
        let result = viewModel?.getScoreValue(button)
        return result!
    }
    
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
       // self.tfOpponent.text = String(describing: viewModel?.score?.home)
    }
    
    func loadViewFromNib() -> UIView {
        
        return UINib(nibName: "GameScoreDialog", bundle: Bundle().getBundle(swiftClass: GameScoreDialog.self)).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    public override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        
    }
    
   public override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = GameScoreViewModel.shared
        self.viewModel?.setScoreValue(textFieldHome: "0", textFieldOppenent: "0")
        xibSetup()
    
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = GameScoreViewModel.shared
        self.viewModel?.setScoreValue(textFieldHome: "0", textFieldOppenent: "0")
        xibSetup()
  
    }

    
}
extension GameScoreDialog{
    func animateMoveUp(viewBaseLine : UIView){
        UIView.animate(withDuration: 0.3, animations:{
            self.frame.origin.y -= self.view.bounds.height
            
        })
    }
    func animateMoveDown(viewBaseLine : UIView){
        UIView.animate(withDuration: 0.2, delay: 0.1, options: [ .curveEaseOut], animations: {
            self.frame.origin.y += self.view.bounds.height
        }) { (status) in
            print(status)
        }
    }
    
}
