import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseState {
  bool isLoading;
  bool hasError;
  dynamic error;

  BaseState({this.isLoading = false, this.hasError = false, this.error});
}

class BaseStateProvider extends StateNotifier<BaseState> {
  BaseStateProvider() : super(BaseState());
}
