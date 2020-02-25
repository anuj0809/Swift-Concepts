//Create the Object you want inside your Button, for example a Text. 
//If you want more than one object inside your Button, you can group them using, for instance, a HStack. 
//You can now apply modifiers for customizing the created objects.

Import SwiftUI

struct ContentView : View {
    var body: some View {
        HStack {
            Text("ADD TO CART")
                .font(.custom("Avenir-Medium", size: 20))
                .foregroundColor(.black)
            Image(systemName: "cart")
                .foregroundColor(.black)
        }
    }
}




// If you nested multiple objects, you have to apply the overall modifiers like the Buttons frame size or background color to the Stack.  
//If you have only one object, simply apply these modifiers to the object itself.


struct ContentView : View {
    var body: some View {
        HStack {
            Text("ADD TO CART")
                .font(.custom("Avenir-Medium", size: 20))
                .foregroundColor(.black)
            Image(systemName: "cart")
                .foregroundColor(.black)
        }
            .frame(width: 220, height: 30)
            .padding()
            .background(Color.green)
            .cornerRadius(10.0)
    }
}




//Wrap everything into a Button. Insert the action parameter followed by curly braces. 
//Inside these braces you can execute for example a print statement or a custom function



import SwiftUI

struct ContentView : View {
    var body: some View {
        Button(action: {print("Button touched!")}) {
            HStack {
                Text("ADD TO CART")
                    .font(.custom("Avenir-Medium", size: 20))
                    .foregroundColor(.black)
            Image(systemName: "cart")
                    .foregroundColor(.black)
            }
                .frame(width: 220, height: 30)
                .padding()
                .background(Color.green)
                .cornerRadius(10.0)
        }
    }
}