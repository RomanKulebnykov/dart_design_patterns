/// Абстрактная фабрика(Abstract Factory) — это порождающий паттерн
/// проектирования, который позволяет создавать семейства связанных объектов,
/// не привязываясь к конкретным классам создаваемых объектов.

///## Применимость ##
///
/// * Когда бизнес-логика программы должна работать с разными видами связанных
/// друг с другом продуктов, не завися от конкретных классов продуктов.
//  Абстрактная фабрика скрывает от клиентского кода подробности того,
//  как и какие конкретно объекты будут созданы. Но при этом клиентский код
//  может работать со всеми типами создаваемых продуктов,
//  поскольку их общий интерфейс был заранее определён.

/// * Когда в программе уже используется Фабричный метод,
/// но очередные изменения предполагают введение новых типов продуктов.
//  В хорошей программе каждый класс отвечает только за одну вещь.
//  Если класс имеет слишком много фабричных методов, они способны затуманить
//  его основную функцию. Поэтому имеет смысл вынести всю логику создания
//  продуктов в отдельную иерархию классов, применив абстрактную фабрику.

abstract class Button {}

class AndroidButton extends Button {}

class IOSButton extends Button {}

abstract class CheckBox {}

class AndroidCheckBox extends CheckBox {}

class IOSCheckBox extends CheckBox {}

abstract class RenderFactory {
  Button createButton();
  CheckBox createCheckbox();
}

class AndroidRenderFactory extends RenderFactory {
  @override
  Button createButton() {
    return AndroidButton();
  }

  @override
  CheckBox createCheckbox() {
    return AndroidCheckBox();
  }
}

class IOSRenderFactory extends RenderFactory {
  @override
  Button createButton() {
    return IOSButton();
  }

  @override
  CheckBox createCheckbox() {
    return IOSCheckBox();
  }
}

enum PlatformType { android, ios }

class Application {
  late final RenderFactory renderFactory;

  Application(PlatformType platformType) {
    switch (platformType) {
      case PlatformType.android:
        renderFactory = AndroidRenderFactory();
        break;
      case PlatformType.ios:
        renderFactory = IOSRenderFactory();
        break;
    }
  }

  void createUI() {
    renderFactory.createButton();
    renderFactory.createCheckbox();
  }
}

// + Гарантирует сочетаемость создаваемых продуктов.
// + Избавляет клиентский код от привязки к конкретным классам продуктов.
// + Выделяет код производства продуктов в одно место, упрощая поддержку кода.
// + Упрощает добавление новых продуктов в программу.
// + Реализует принцип открытости/закрытости.

// - Усложняет код программы из-за введения множества дополнительных классов.
// - Требует наличия всех типов продуктов в каждой вариации.
