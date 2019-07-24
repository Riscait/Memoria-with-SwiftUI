import SwiftUI

struct GiftList : View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

#if DEBUG
struct GiftList_Previews : PreviewProvider {
    static var previews: some View {
        GiftList()
    }
}
#endif

protocol Animal {
    var name: String { get set }
    var age: Int { get set }

    func bow()
}

struct Cat: Animal {
    var name: String
    var age: Int
    
    var isCute = true
    func bow() {
        print("Mew!")
    }
}

struct Dog: Animal {
    var name: String
    
    var age: Int
    
    func bow() {
        print("One!")
    }
}

class MainSub {
    
    var animals = [Animal]()
    
    func addAnimal() {
        animals.append(Cat(name: "Pinkie", age: 8))
        animals.append(Dog(name: "Jon", age: 29))
        
    }
}
