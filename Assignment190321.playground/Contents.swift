//[ 과제 ]

//Assignment 1
//이미지처럼 Animal, Human, Pet, Dog, Cat 클래스 정의
//상속을 적용해 필요한 속성을 모두 가지면서도 각각 다른 속성과 값을 지닐 수 있도록 구현

print("======show me the Animal======")
class Animal {
    var brain = true
    var legs = 0
    
    init (brain: Bool, legs: Int) {
        self.brain = brain
        self.legs = legs
    }
    
}

var animal = Animal(brain: true, legs: 0)
print("Animal의 다리 개수는 \(animal.legs)개 입니다.")
print("Animal은 뇌가 있습니까? \(animal.brain)")


print("======show me the Human======")
class Human : Animal {
    
//    override init (brain: Bool, legs: Int) {
//        super.init(brain: brain, legs: legs)
//
//    }
}

var human = Human(brain: true, legs: 2)
print("Human의 다리 개수는 \(human.legs)개 입니다.")
print("Human은 뇌가 있습니까? \(human.brain)")


print("======show me the Pet======")
class Pet : Animal {
    var fleas: Int
    
    init(brain: Bool, legs: Int, fleas: Int) {
        self.fleas = fleas
        super.init(brain: brain, legs: legs)
    }
}

var pet = Pet(brain: true, legs: 4, fleas: 0)
print("Pet의 다리 개수는 \(pet.legs)개 입니다.")
print("Pet의 벼룩 개수는 \(pet.fleas)개 입니다.")
print("Pet의 뇌가 있습니까? \(pet.brain)")


print("======show me the Dog======")
class Dog : Pet {
    
//    override init (brain: Bool, legs: Int, fleas: Int) {
//        super.init(brain: brain, legs: legs, fleas: fleas)
//    }
}

var dog = Dog(brain: true, legs: 4, fleas: 8)
print("Dog의 다리 개수는 \(dog.legs)개 입니다.")
print("Dog의 벼룩 개수는 \(dog.fleas)개 입니다.")
print("Dog의 뇌가 있습니까? \(dog.brain)")


print("======show me the Cat======")
class Cat : Pet {
    
//    override init(brain: Bool, legs: Int, fleas: Int) {
//        super.init(brain: brain, legs: legs, fleas: fleas)
//    }
}

var cat = Cat(brain: true, legs: 4, fleas: 4)
print("Cat의 다리 개수는 \(cat.legs)개 입니다.")
print("Cat의 벼룩 개수는 \(cat.legs)개 입니다.")
print("Cat의 뇌가 있습니까? \(cat.brain)")

//Assignment 2

print("========show me the Square=========")

class Square {
    var width : Double
    var length : Double
    
    init(width: Double, length: Double) {
        self.width = width
        self.length = length
    }
    
    func area() -> Double {
        return width * length
    }
    func circumference() -> Double {
        return width * 4
    }
}

var square = Square(width: 7.0, length: 7.0)
print("정사각형의 넓이는 = \(square.area())")
print("정사각형의 둘레는 = \(square.circumference())")


print("========show me the Rectangle=========")

class Retangle : Square {
    
    override func circumference() -> Double {
        return (width + length) * 2
    }
}

var retangle = Retangle(width: 8.0, length: 4.0)
print("직사각형의 넓이는 = \(retangle.area())")
print("직사각형의 둘레는 = \(retangle.circumference())")


print("========show me the Rectangle Solid=========")

class RetangleSolid : Retangle  {
    var height : Double
    
    init(width: Double, length: Double, height: Double) {
        self.height = height
        super.init(width: width, length: length)
    }
    
    func volume() -> Double {
        return width * length * height
    }
}

var retangleSolid = RetangleSolid(width: 8.0, length: 4.0, height: 5.0)
print("직육면체의 큰 직사각형의 넓이는 = \(retangleSolid.area())")
print("직육면체의 큰 직사각형의 둘레는 = \(retangleSolid.circumference())")
print("직육면체의 부피는 = \(retangleSolid.volume())")


print("========show me the Cube=========")

class Cube : RetangleSolid {
    
}

var cube = Cube(width: 5, length: 5, height: 5)
print("정육면체의 부피는 = \(cube.volume())")


print("========show me the circle=========")

class Circle {
    var radius: Double
    var pi: Double
    
    init (radius: Double, pi: Double) {
        self.radius = radius
        self.pi = pi
    }
    
    func area () -> Double {
        return pi * radius * radius
    }
    
    func circumference () -> Double {
        return 2 * pi * radius
    }
}

var circle = Circle(radius: 4, pi: 3.14)
print("원의 넓이는 = \(circle.area())")
print("윈의 둘레는 = \(circle.circumference())")


print("========show me the circular cylinder=========")

class CircularCylinder : Circle {
    var height: Double
    
    init (radius: Double, pi: Double, height: Double) {
        self.height = height
        super.init(radius: radius, pi: pi)
    }
    
    func volume () -> Double {
        return pi * radius * radius * height
    }
}

var circularCylinder = CircularCylinder(radius: 3, pi: 3.14, height: 5)
print("원기둥의 부피는 = \(circularCylinder.volume())")


print("========show me the sphere=========")

class Sphere : Circle {
    
    func volume () -> Double {
        return ( 4 / 3 ) * pi * ( radius * radius * radius )
    }
}

var sphere = Sphere(radius: 3.2, pi: 3.14)
print("구의 부피는 = \(sphere.volume())")


print("========show me the triangle=========")

class Triangle {
    var baseLine: Double
    var height: Double
    
    init (baseLine: Double, height: Double) {
        self.baseLine = baseLine
        self.height = height
    }
    
    func area () -> Double {
        return ( 1 / 2 ) * baseLine * height
    }
}

var triangle = Triangle(baseLine: 6, height: 4)
print("삼각형의 넓이는 = \(triangle.area())")


print("========show me the cone=========")

class Cone {
    var height: Double
    var radius: Double
    var pi: Double
    
    init (height: Double, radius: Double, pi: Double) {
        self.height = height
        self.radius = radius
        self.pi = pi
        
    }
    
    func volume () -> Double {
        return ( 1 / 3) * pi * ( radius * radius ) * height
    }
}

var cone = Cone(height: 4, radius: 2, pi: 3.14)
print("원뿔의 부피는 = \(cone.volume())")


print("========show me the trapezoid=========")

class Trapezoid {
    var baseLine: Double
    var topLine: Double
    var height: Double
    
    init (baseLine: Double, topLine: Double, height: Double) {
        self.baseLine = baseLine
        self.topLine = topLine
        self.height = height
    }
    
    func area () -> Double {
        return  1 / 2  * height * ( baseLine + topLine )
    }
}

var trapezoid = Trapezoid(baseLine: 5, topLine: 2, height: 4)
print("사다리꼴의 넓이는 = \(trapezoid.area())")
