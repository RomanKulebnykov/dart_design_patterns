abstract class Render {}

class AndroidRender extends Render {}

class IosRender extends Render {}

abstract class CustomDialog {
  Render getRender();
  void showDialog() {
    Render render = getRender();
    //Render Dialog
  }
}

class AndroidDialog extends CustomDialog {
  @override
  Render getRender() => AndroidRender();
}

class IOSDialog extends CustomDialog {
  @override
  Render getRender() => IosRender();
}

enum PlatformType { android, ios }

void application(PlatformType platformType) {
  CustomDialog dialog;
  switch (platformType) {
    case PlatformType.android:
      dialog = AndroidDialog();
      break;
    case PlatformType.ios:
      dialog = IOSDialog();
      break;
  }
  dialog.showDialog();
}
