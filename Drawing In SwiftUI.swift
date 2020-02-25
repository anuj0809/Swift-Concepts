/* SwiftUI provides us with some basic shapes we can use for drawing in our app. These are:
Rectangle
RoundedRectangle
Ellipse
Circle
Capsule
You can use them by simply initialising them within your SwiftUI view.*/

struct ShapeSandbox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
    }
}


/*By default however, the Shape doesn’t know anything about its supposed size and position. 
This is why as long as we provide the shape with a .frame it tries to fill out the whole view.*/

/*So let’s provide our RoundedRectangle with a certain width and height. */
/*We also define another fill color than the default black. */

RoundedRectangle(cornerRadius: 20)
            .frame(width: 250, height: 100)
            .foregroundColor(.purple)


/*Maybe you want your shape not to be filled out with a certain but rather want to create some kind of border out of it. */
/*You can do this by using the stroke modifier (as the first one!) with choosing a certain lineWidth for your border.*/

RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 10)
            .frame(width: 250, height: 100)
            .foregroundColor(.purple)

/* It’s even possible to use another stroke style, for example to use a dashed-line as your border. For example like this:*/

RoundedRectangle(cornerRadius: 20)
            .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .square, dash: [15], dashPhase: 2))
            .frame(width: 250, height: 100)
            .foregroundColor(.purple)


         /*Of course, you can use the discussed “techniques” for all other shapes.*/


         /*Drawing own shapes by using paths*/


/*Let’s take a quick look at what paths in SwiftUI are. In a nutshell, you can imagine a path like a set of drawing instructions, including lines, curves and other segments like arcs. This why a shape is doing nothing different than using a specific path to define its appereance. */
/*Okay, let’s use this knowledge to draw a square by using a Path. To do this, create a new SwiftUI view and call it, for intance, PathSandbox.swift.*/
/*Let’s insert a Path instance followed by its corresponding closure. Inside the closure we can actually define how our Path should go. By default again, SwiftUI will fill out resulting view with a black color. While drawing the Path however, I personally prefer to only see the outer border for having a better overview of the resulting Path. This is why I’m applying the .stroke() we got familiar with before starting drawing the Shape.*/


struct PathSandbox: View {
    var body: some View {
        Path { path in

        }
            .stroke()
    }
}



/*Let’s draw our square by adding several lines to our Path. We can do this by using absolute x- and y-coordinates. Before drawing the first line, we move the “cursor” right upper corner of our imaginary square. Then we’re adding a line which points to the lower right corner and another line pointing to the lower left corner.*/

Path { path in
            path.move(to: CGPoint(x: 200, y: 0))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 0, y: 200))
        }
            .stroke()


/*You see that two lines got added to our SwiftUI! Let’s finish our square by adding a third line pointing to the upper left corner. We could close the rectangle by adding a last line pointing to where we started, but we can also closing the Path “automatically” by using the .closeSubPath modifier.*/


Path { path in
            path.move(to: CGPoint(x: 200, y: 0))
            path.addLine(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 0, y: 200))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.closeSubpath()
        }
            .stroke()

/*Now that we are done with defining our square path, we can fill it out by deleting the .stroke modifier again.*/

var body: some View {
        Path { path in
            //...
        }
    }


/*Since, as you already know, a Shape also consists of a Path. For reusability purposes, we can simply convert our Square Path to such a Shape by declaring a struct which adopts the Shape protocol. */

struct MySquare: Shape {
    
}


/*The single requirement for the Shape protocol is having a path function which draws the actual shape. We can simply use the Path we just created like this.*/


struct MySquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 200, y: 0))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()

        return path
    }
}


/*We now use our MySquare Shape inside our SwiftUI view!*/

struct PathSandbox: View {
    var body: some View {
        MySquare()
    }
}


/*However, our MySquare Shape still uses the absolute coordinates we defined earlier. Instead, we want to make it dynamic so that we can transform it by adding a .frame modifier to the MySquare instance inside our SwiftUI view.*/
/*We can achieve the rect parameter of our MySquare’s path function. The rect is like a invisible scratchpad inside which we can draw our square and which can gets transformed by passing a certain frame to it when initialising the actual shape.*/
/*So let’s exchange the fixed coordinates by the corresponding points of the invisible rect.*/


struct MySquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.width))
        path.addLine(to: CGPoint(x: 0, y: rect.size.width))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()

        return path
    }
}



/*Let’s talk through it very quick. We just move our cursor to the very upper right edge of our invisible rectangle. Then we tell our path to draw a line to another point by using the rect’s width for both (remember, we want to ensure it’s a square) x- and y-coordinates. Then we’re going back to the lower left corner, followed by the upper left corner before closing the subpath. Awesome, now our MySquare Shape is dynamic and we can adjust its size by using the .frame modifier!*/


struct PathSandbox: View {
    var body: some View {
        MySquare()
            .frame(width: 250, height: 250)
    }
}