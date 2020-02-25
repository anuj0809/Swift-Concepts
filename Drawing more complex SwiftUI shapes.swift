/*Drawing more complex SwiftUI shapes*/

/*Okay, now that we know how to create our own shapes we practice our SwiftUI drawing skills by creating more complex shapes./* 

/*To do this, create a new SwiftUI view called BBLogo. The icon should simply consist of a black background with two B letters on it. We start by inserting a ZStack into or BBLogo view so that all views inside it get stacked on top of each other. For the background we use the rounded rectangle shape we got familiar with earlier.*/

struct BBLogo: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
        }
    }
}


/*Next, we draw the B-Letter Shape. Let’s declare a struct conforming to the Shape protocol.*/

struct LetterB: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
        }
    }
}


/*To instantly see what we’re drawing we already initialize a LetterB Shape inside our BBLogo view and apply it with a stroke, white color and a certain frame.*/

ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
            LetterB()
                .stroke(lineWidth: 12)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
        }


/*Let’s start drawing the LetterB Shape! First, we move the “cursor” to the middle of the rect’s upper edge. Then we add a line pointing to the upper left edge of the invisible rectangle. Next, we draw a line to middle of the rect’s left edge followed by a line pointing to center of the rect.*/

Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.size.width/2))
            path.addLine(to: CGPoint(x: rect.size.width/2, y: rect.size.width/2))
        }

/*Before drawing on, we move our “cursor” back to the middle of the rect’s left edge. Then we draw a line to the lower left edge. Our last line points the middle of the rect’s lower edge.*/

Path { path in
            path.move(to: CGPoint(x: rect.size.width/2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.size.width/2))
            path.addLine(to: CGPoint(x: rect.size.width/2, y: rect.size.width/2))
            path.move(to: CGPoint(x: 0, y: rect.size.width/2))
            path.addLine(to: CGPoint(x: 0, y: rect.size.width))
            path.addLine(to: CGPoint(x: rect.size.width/2, y: rect.size.width))
        }



 /*To complete the letter B we have to add two halved circles to our Shape. We do this by adding two arcs to our Path. When adding arcs, we need to specify the arcs center, as well as the start and end angle. Therefore we write:*/



ath { path in
            //...
            path.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width*(3/4)), radius: rect.size.width/4, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
            path.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/4), radius: rect.size.width/4, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
        }

        /*Awesome, we are finished with creating our LetterB Shape!*/

        /*We complete the BBLogo by stacking another BLetter Shape on top of the background and the existing one and offsetting it a little bit.*/

        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
            LetterB()
                .stroke(lineWidth: 12)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
            LetterB()
                .stroke(lineWidth: 12)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .offset(x: 40)
        }


        /*That’s it! By building our  logo we learned how to create more complex shapes.*/