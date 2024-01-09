class HomeTabModel {
  const HomeTabModel(
      {required this.isSelected, required this.label, required this.tabId});

  final String label;
  final String tabId;
  final bool isSelected;

  HomeTabModel copyWith({
    String? label,
    String? tabId,
    bool? isSelected,
  }) {
    return HomeTabModel(
      label: label ?? this.label,
      tabId: tabId ?? this.tabId,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
