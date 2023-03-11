import 'dart:io';

void main() {
  // Luas dan Keliling Circle
  Circle circle = Circle(radius: 10);
  print("----------------------------------");
  print("Lingkaran");
  stdout.write("Luas bangun datar lingkaran : ");
  print(circle.getArea());
  stdout.write("Keliling bangun datar lingkaran : ");
  print(circle.getPerimeter());

  // Luas dan Keliling Square
  Square square = Square(side: 10);
  print("----------------------------------");
  print("Persegi");
  stdout.write("Luas bangun datar persegi : ");
  print(square.getArea());
  stdout.write("Kelliling bangun datar persegi : ");
  print(square.getPerimeter());

  // Luas dan Keliling Rectangle
  Rectangle rectangle = Rectangle(width: 10, height: 10);
  print("----------------------------------");
  print("Persegi Panjang");
  stdout.write("Luas bangun datar persegi panjang : ");
  print(rectangle.getArea());
  stdout.write("Keliling bangun datar persegi panjang : ");
  print(rectangle.getPerimeter());
}

// Interface  Shape
abstract class Shape {
  int getArea();
  int getPerimeter();
}

// Class Circle
class Circle implements Shape {
  int? radius;

  Circle({required this.radius});

  @override
  // Method menghitung luas lingkaran
  int getArea() {
    double phi = 3.14;
    double result = phi * radius! * radius!;
    return result.toInt();
  }

  @override
  // Method menghitung keliling lingkaran
  int getPerimeter() {
    double phi = 3.14;
    double result = phi * (radius! * 2);
    return result.toInt();
  }
}

// Class Square
class Square implements Shape {
  int? side;

  Square({required this.side});

  @override
  // Method menghitung luas persegi
  int getArea() {
    return side! * side!;
  }

  @override
  // Method menghitung keliling persegi
  int getPerimeter() {
    return 4 * side!;
  }
}

// Class Rectangle
class Rectangle implements Shape {
  int? width;
  int? height;

  Rectangle({required this.width, required this.height});

  @override
  // Method menghitung luas persegi panjang
  int getArea() {
    return width! * height!;
  }

  @override
  // Method menghitung keliling persegi panjang
  int getPerimeter() {
    return 2 * (width! + height!);
  }
}
