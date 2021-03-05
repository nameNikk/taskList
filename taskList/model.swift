//
//  model.swift
//  taskList
//
//  Created by Никита Макаренко on 04.03.2021.
//

import Foundation


var taskItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "taskData")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array =    UserDefaults.standard.array(forKey: "taskData")
               as? [[String: Any]]{
           return  array
        } else{
           return  []
        }
    }
}


func addItem(nameItem:String?, isCompleted:Bool = false)  {
    taskItems.append(["Name":nameItem!,"isCompleted": false])
   
    
}

func removeItem(at index:Int)  {
    taskItems.remove(at: index)
   
}

func changeState(at item: Int)  {
    taskItems[item]["isCompleted"] = !(taskItems[item]["isCompleted"] as! Bool)
    
}




func moveItem(fromIndex: Int, toIndex: Int)  {

    let from = taskItems[fromIndex]
    taskItems.remove(at:fromIndex)
    taskItems.insert(from, at: toIndex)

}
