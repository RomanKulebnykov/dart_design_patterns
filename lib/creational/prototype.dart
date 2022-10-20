/// Прототип — это порождающий паттерн проектирования, который позволяет
/// копировать объекты, не вдаваясь в подробности их реализации.

/// Когда ваш код не должен зависеть от классов копируемых объектов.
//  Такое часто бывает, если ваш код работает с объектами, поданными извне через какой-то общий интерфейс. Вы не можете привязаться к их классам, даже если бы хотели, поскольку их конкретные классы неизвестны.
//
// Паттерн прототип предоставляет клиенту общий интерфейс для работы со всеми прототипами. Клиенту не нужно зависеть от всех классов копируемых объектов, а только от интерфейса клонирования.
abstract class Shape {
  final int color;
  Shape({required this.color});
  Shape.clone(Shape source) : color = source.color;
  Shape clone();
}

class Rectangle extends Shape {
  final double height;
  final double width;

  Rectangle({
    required this.height,
    required this.width,
    required super.color,
  });

  Rectangle.clone(Rectangle source)
      : height = source.height,
        width = source.width,
        super.clone(source);

  @override
  Shape clone() {
    return Rectangle.clone(this);
  }
}
