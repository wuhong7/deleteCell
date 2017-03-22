//
//  NSAttributedString+Addtion.swift
//  deleteCell
//
//  Created by 吴鸿 on 2017/3/22.
//
//

import UIKit

extension NSAttributedString{
    class func imageTextWith(image:UIImage,imageWH:CGFloat,title:String,fontSize:CGFloat,titleColor:UIColor,spacing:CGFloat) -> NSAttributedString{
        //文本字典
        let titleDict = [NSFontAttributeName : UIFont.systemFont(ofSize: fontSize),NSForegroundColorAttributeName : titleColor]
        let spacingDict = [NSFontAttributeName : UIFont.systemFont(ofSize: spacing)]
        
        //图片文本
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: imageWH, height: imageWH)
        let imageText = NSAttributedString(attachment: attachment)
        
        //换行文本
        let lineText = NSAttributedString.init(string: "\n\n", attributes: spacingDict)
        
        //按钮文字
        let text = NSAttributedString.init(string: title, attributes: titleDict)
        
        //合并文字
        let attM = NSMutableAttributedString(attributedString: imageText)
        attM.append(lineText)
        attM.append(text)
        
        return attM.copy() as! NSAttributedString
        
    }
}


