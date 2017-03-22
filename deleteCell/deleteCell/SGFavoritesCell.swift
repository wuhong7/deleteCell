//
//  SGFavoritesCell.swift
//  SouGet
//
//  Created by 盖特 on 2017/3/8.
//  Copyright © 2017年 souget.com. All rights reserved.
//

import UIKit

class SGFavoritesCell: UITableViewCell {

    let kMiddle : CGFloat = 250
    
    var titleLabel : UILabel?
    var urlLabel   : UILabel?
    var iconView   : UIImageView?
    var showView   : UIView?
    
    var cellHelper: deleteCellHelper?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellHelper = deleteCellHelper.sharedHelper(cell: self)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

// MARK: - 界面布局
extension SGFavoritesCell{
    
    fileprivate func setupUI() {
        //取消选中效果
        selectionStyle = .none
        contentView.backgroundColor = UIColor.blue
        
        // 1.show视图
        showView = getShowView()
        contentView.addSubview(showView!)
        
        showView!.snp_makeConstraints{ (make) -> Void in
            make.edges.equalTo(0)
        }


       
    }
    
    // 2.edit视图
    func setBottomView( btnArray : [EditButton]){
        
        if let bottomView = getBottomView(btnArray: btnArray){
            contentView.addSubview(bottomView)
            //布局
            bottomView.snp_makeConstraints{ (make) -> Void in
                make.edges.equalTo(0)
            }
        }
        
    }
    
    private func getBottomView(btnArray : [EditButton]) -> UIView?{
        
        let bottomView = UIView()
        
        var rightDistance:Double = 0.0
        
        
        for (index, btn) in btnArray.enumerated()
        {
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            if index>0 {
                rightDistance = rightDistance + btn.rightMargin! + Double((btnArray[index - 1].buttonSize?.width)!)
            }else{
                 rightDistance = rightDistance + btn.rightMargin!
            }
           
            
            bottomView.addSubview(btn)
            
            btn.snp_makeConstraints{ (make) -> Void in
                make.centerY.equalTo(bottomView)
                make.right.equalTo(bottomView.snp_right).offset(-rightDistance)
                make.size.equalTo(btn.buttonSize!)
            }
            
            
        }

        return bottomView
    }
    
    private func getShowView() -> UIView{
        
        let showView = UIView()
        showView.backgroundColor = UIColor.white
        
        titleLabel = UILabel()
        titleLabel?.text = "你好你好你好你好你好你好"
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        titleLabel?.numberOfLines = 2
        
        urlLabel = UILabel()
        urlLabel?.text = "www.baidu.com"
        urlLabel?.font = UIFont.systemFont(ofSize: 14)
        
        iconView = UIImageView()
        iconView?.backgroundColor = UIColor.brown
        
        showView.addSubview(titleLabel!)
        showView.addSubview(urlLabel!)
        showView.addSubview(iconView!)
        
        //布局
        titleLabel!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.equalTo(200)
        }
        urlLabel!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(titleLabel!.snp_bottom).offset(10)
            make.left.equalTo(10)

        }
        iconView!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.height.equalTo(150)
        }

        return showView
    }
}


extension SGFavoritesCell{
    func btnClick(btn:EditButton){
        
        let indexPath = cellHelper?.currentTableView?.indexPath(for: self)
        btn.deleteCallBack!(indexPath!,self)
        
    }
}














