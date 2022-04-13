import '../navigation/widget_builder_args.dart';

abstract class Module {
  String get moduleName;
  Map<String, WidgetBuilderArgs> get routes;
  void Function() get injectionRegister;
  void Function() get createListener;
}