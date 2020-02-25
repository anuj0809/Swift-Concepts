/*Drawing curved shapes in SwiftUI*/

/*Last but not least, we’ll take a look at how to create curved shapes. By doing this, we’ll be able to create cool shapes like this raindrop icon!*/

/*Let’s create new SwiftUI view. Below this, declare a struct called Raindrop and conforming to the Shape protocol.*/


struct Raindrop: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in

        }
    }
}

/*Again we start with initialising the Raindrop Shape inside our SwiftUI view and applying a .stroke and .frame to it.*/


var body: some View {
        Raindrop()
            .stroke(lineWidth: 4)
            .frame(width: 200, height: 200)
    }

/*Inside our Raindrop’s path we start moving our “cursor” to the middle of the rect’s upper edge. */


Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        }



/*Next we want to draw a right curve downwards. To do this, we use the addQuadCurve method. This function adds a so-called Bézier curve to the path. For such a Bézier curve we first need to define an ending point for the curve but to actually do the curve we need to provide the Bézier curve with a control point. Such a control point is used to calculate the strength and direction of the curve. You don’t need to know the calculus for this (nor do i). Just take a look at the following infographic to get a feeling for this.*/

/*You see that the direction and strength of the curve depends on where we place the corresponding control point. The further away we place the control point, the more the curve is bent.*/

/*Let’s us this knowledge for our addQuadCurve function. We tell the path that the curve should end at the middle of the rect’s lower edge and we place the control point at the lower right edge of the rect.*/


Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
        }


/*Lets finish our Raindrop Shape by drawing another curve pointing to where we started drawing.*/

Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: 0), control: CGPoint(x: 0, y: rect.size.height))
        }

/*Awesome, we’re done with our Raindrop shape! Now we can fill out this Shape inside our SwiftUI view by exchanging the .stroke modifier. For example, you can fill the shape with a gradient like this:*/


Raindrop()
            .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottom))
            .frame(width: 200, height: 200)


            /*Now you’re Raindrop Shape will come on screen.*/

            