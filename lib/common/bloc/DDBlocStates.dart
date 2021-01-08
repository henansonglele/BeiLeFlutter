abstract class DDBlocState {}

class DDBlocStateLoading extends DDBlocState {}

class DDBlocStateEmpty extends DDBlocState {}

/// 数据加载失败状态
class DDBlocStateError extends DDBlocState {
  int _errorCode;
  String _errorMsg;

  DDBlocStateError(this._errorCode, this._errorMsg);

  String get errorMsg => _errorMsg;

  int get errorCode => _errorCode;

}

/// 无需更新UI的提示后续统一调用bloc的sendTip，不需要指定状态
@deprecated
class DDBlocStateErrorTip<T> extends DDBlocState {
  String _errorMsg;
  final T _data;

  DDBlocStateErrorTip(this._errorMsg, this._data);

  String get errorMsg => _errorMsg;
  T get data => _data;
}

/// 数据变化
class DDBlocStateDataChange<T> extends DDBlocState {
  T _data;
  bool noMore = false;

  DDBlocStateDataChange(this._data, {this.noMore = false});

  T get data => _data;
}
