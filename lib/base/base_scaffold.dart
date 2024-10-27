import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base_state_provider.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final BaseStateProvider viewModel;

  const BaseScaffold({
    required this.body,
    required this.viewModel,
    this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.body,
      ),
    );
  }
}
