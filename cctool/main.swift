//
//  main.swift
//  cctool
//
//  Created by Cc on 2016/12/19.
//  Copyright © 2016年 Cc. All rights reserved.
//

import Foundation

print("Hello, cctool!")

while(true) {

    let stdin = FileHandle.standardInput
    //var input = NSString(data: stdin.availableData,encoding: NSUTF8StringEncoding) as! String
    var input = String.init(data: stdin.availableData, encoding: .utf8)
    
    print("input = \(input)")
    
    if (input?.hasPrefix("a|"))! {
       
        let arrArgc = input?.components(separatedBy: "|")
        if arrArgc?.count == 2 {
            
            let path = FileManager.default.currentDirectoryPath
            let fileZip = path.appending("/booom.zip")
            if FileManager.default.fileExists(atPath: fileZip) {
                
                let data = NSData.init(contentsOfFile: fileZip)
                let newData = data?.c_common_Encrypt256(withPassword: arrArgc![1])
                let newFileZip = path.appending("/booom.cas")
                let url = URL.init(fileURLWithPath: newFileZip)
                try? newData?.write(to: url)
                print("完成")
            }
            else {
            
                print("没有找到booom.zip")
            }
        }
        else {
            
            print("错误的参数")
        }
    }
    else if (input?.hasPrefix("b|"))! {
        
        let arrArgc = input?.components(separatedBy: "|")
        if arrArgc?.count == 2 {
        
            let path = FileManager.default.currentDirectoryPath
            let fileCas = path.appending("/booom.cas")
            if FileManager.default.fileExists(atPath: fileCas) {
                
                let data = NSData.init(contentsOfFile: fileCas)
                let newData = data?.c_common_Decrypt256(withPassword: arrArgc![1])
                let newFileZip = path.appending("/booom1.zip")
                let url = URL.init(fileURLWithPath: newFileZip)
                try? newData?.write(to: url)
                print("完成")
            }
            else {
                
                print("没有找到booom.cas")
            }
        }
        else {
            print("错误的参数")
        }
    }
}
