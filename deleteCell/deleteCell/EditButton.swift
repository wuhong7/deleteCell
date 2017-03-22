//
//  EditButton.swift
//  deleteCell
//
//  Created by 盖特 on 2017/3/22.
//
//

import UIKit

class EditButton: UIButton {
    ///右边距
    var rightMargin : Double?
    ///button的尺寸
    var buttonSize : CGSize?
    
    init(size: CGSize,rightMargin:Double) {
        super.init(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        self.buttonSize = size
        self.rightMargin = rightMargin
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
