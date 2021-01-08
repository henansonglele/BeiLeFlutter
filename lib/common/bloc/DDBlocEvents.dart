abstract class DDBlocEvent {}

class DDBlocEventInit extends DDBlocEvent {}

class DDBlocEventShowLoading extends DDBlocEvent {}

class DDBlocEventRefresh extends DDBlocEvent {}

class DDBlocEventLoadMore extends DDBlocEvent {}

class DDBlocEventSendState extends DDBlocEvent {
  dynamic state;

  DDBlocEventSendState(this.state);
}

class DDBlocEventCollectedCancel extends DDBlocEvent {
  int postion;
  bool collected; //collected = true， 已经收藏，false 没有收藏
  DDBlocEventCollectedCancel(this.postion, this.collected);
}

enum DDBlocTip {
  show_loading,
  hide_loading,
}