

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gx_flutter/common/bloc/DDBlocStates.dart';
import 'package:gx_flutter/widget/ComonLoading.dart';

class DDBlocBuilder<B extends Cubit<S>, S> extends BlocBuilderBase<B, S> {
  final BlocWidgetBuilder<S> builder;

  DDBlocBuilder({
    Key key,
    @required this.builder,
    BlocBuilderCondition<S> buildWhen,
    B bloc,
  })  : assert(builder != null),
        super(key: key, cubit: bloc, buildWhen: buildWhen);


  @override
  Widget build(BuildContext context, S state) {
    var widget = builder(context, state);

    // 如果传入的builder没有处理该状态则进行默认处理
    if (widget == null) {
      if (state is DDBlocStateLoading) {
        return Center(
          child: CommonLoading(),
        );
      }
    }

    return widget;
  }
}

/// Base class for widgets that build themselves based on interaction with
/// a specified [cubit].
///
/// A [BlocBuilderBase] is stateful and maintains the state of the interaction
/// so far. The type of the state and how it is updated with each interaction
/// is defined by sub-classes.
/// {@endtemplate}
abstract class BlocBuilderBase<C extends Cubit<S>, S> extends StatefulWidget {
  /// {@macro bloc_builder_base}
  const BlocBuilderBase({Key key, this.cubit, this.buildWhen})
      : super(key: key);

  /// The [cubit] that the [BlocBuilderBase] will interact with.
  /// If omitted, [BlocBuilderBase] will automatically perform a lookup using
  /// [BlocProvider] and the current `BuildContext`.
  final C cubit;

  /// {@macro bloc_builder_build_when}
  final BlocBuilderCondition<S> buildWhen;

  /// Returns a widget based on the `BuildContext` and current [state].
  Widget build(BuildContext context, S state);

  @override
  State<BlocBuilderBase<C, S>> createState() => _BlocBuilderBaseState<C, S>();
}

class _BlocBuilderBaseState<C extends Cubit<S>, S>
    extends State<BlocBuilderBase<C, S>> {
  C _cubit;
  S _state;
  Widget _buildWidget;

  @override
  void initState() {
    super.initState();
    _cubit = widget.cubit ?? context.read<C>();
    _state = _cubit.state;
  }

  @override
  void didUpdateWidget(BlocBuilderBase<C, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldCubit = oldWidget.cubit ?? context.read<C>();
    final currentCubit = widget.cubit ?? oldCubit;
    if (oldCubit != currentCubit) {
      _cubit = currentCubit;
      _state = _cubit.state;
    }
  }

  void buildListener(BuildContext context, S state) {
    _buildWidget = widget.build(context, state);
    if (_buildWidget != null) {
      setState(() => _state = state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, S>(
      cubit: _cubit,
      listenWhen: widget.buildWhen,
      listener: buildListener,
      child: _buildWidget ?? widget.build(context, _state),
    );
  }
}

