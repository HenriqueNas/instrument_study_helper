// ignore_for_file: avoid_print

class Key {
  const Key(this.value);

  final String value;
}

abstract class BuildContext {
  const BuildContext();

  T? getInheritedClassByType<T extends Widget>();
}

class Element implements BuildContext {
  const Element(this.widget, [this.parent]);

  final Widget widget;
  final Element? parent;

  @override
  T? getInheritedClassByType<T extends Widget>() {
    print('searching for $T in $widget');
    if (widget is T) return widget as T;

    return parent?.getInheritedClassByType<T>();
  }
}

abstract class Widget {
  const Widget({required this.key});

  final Key key;

  Widget? build(BuildContext context);

  Element createElement() {
    print('creating element for $this');
    return Element(this);
  }
}

class InheritedWidget extends Widget {
  const InheritedWidget({
    required super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget? build(BuildContext context) {
    print('building $this');
    return child.build(context);
  }

  @override
  Element createElement() {
    print('creating element for $this');

    final childElement = child.createElement();
    print('child element: ${childElement.widget}');

    final element = Element(childElement.widget, Element(child));

    return element;
  }
}

class AppWidget extends InheritedWidget {
  const AppWidget({
    required super.key,
    required super.child,
  });

  @override
  Widget? build(BuildContext context) {
    print('building $this');
    return child.build(context);
  }
}

class WidgetController extends InheritedWidget {
  const WidgetController({
    required super.key,
    required super.child,
    this.data = 'default data',
  });

  final String data;

  static WidgetController? of(BuildContext context) {
    return context.getInheritedClassByType<WidgetController>();
  }

  @override
  Widget? build(BuildContext context) {
    print('building $this');
    return child.build(context);
  }
}

class MyWidget extends Widget {
  const MyWidget({required super.key});

  @override
  Widget? build(BuildContext context) {
    print('building $this');
    final controller = WidgetController.of(context);

    print('Controller: ${controller?.data}');

    return null;
  }
}

void main() {
  const widgetTree = AppWidget(
    key: Key('first'),
    child: WidgetController(
      key: Key('controller'),
      data: 'custom data to controller',
      child: MyWidget(key: Key('inside')),
    ),
  );

  final element = widgetTree.createElement();
  element.widget.build(element);
}
