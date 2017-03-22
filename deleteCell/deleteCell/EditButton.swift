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
    ///回调闭包
    typealias callBack = (IndexPath, UITableViewCell) -> ()
    var deleteCallBack : callBack?
    
    init(size: CGSize,rightMargin:Double,deleteCallBack:@escaping callBack) {
        super.init(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        self.buttonSize = size
        self.rightMargin = rightMargin
        self.deleteCallBack = deleteCallBack

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
