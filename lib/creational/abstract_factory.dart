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
