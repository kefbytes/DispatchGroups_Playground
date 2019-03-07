import UIKit
import Foundation

func delay1(time: Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        print("🤖 delay1 complete")
        closure()
    }
}

func delay2(time: Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        print("🤖 delay2 complete")
        closure()
    }
}

func runGroups(completion: @escaping () -> Void) {
    let dispatchGroup = DispatchGroup()
    
    dispatchGroup.enter()
    delay1(time: 3.5) {
        dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    delay2(time: 2.5) {
        dispatchGroup.leave()
    }
    
    dispatchGroup.notify(queue: .main) {
        print("Both functions complete 👍")
        completion()
    }
}

runGroups() {
    () in
    print("🤖 runGroups complete")
}

