part of '../constants/values.dart';

// LaunchViewModel 是一个 StateNotifier，它管理著 List<Launch> 的狀態。
// StateNotifier 是 Riverpod 提供的一個類別，用於管理可變狀態。
class LaunchViewModel extends StateNotifier<List<Launch>> {
  // repository，用來存取 Launch 的資料
  final LaunchRepository _repository;

  // 建構函數，初始化狀態為空列表，並傳入一個 LaunchRepository 實例
  LaunchViewModel(this._repository) : super([]);

  // 異步方法，使用 repository 實例，獲取資料；獲取後更新狀態
  Future<void> fetchLaunches() async {
    try {
      final launches = await _repository.fetchLaunches();

      // 更新狀態
      state = launches;
    } catch (e) {
      // handle error
      print("error: ${e.toString()}");
    }
  }
}

// StateNotifierProvider 是 Riverpod 提供的一個類，用來提供 StateNotifier 的實例。
// 創建一個 provider，launchViewModelProvider，用它提供 LaunchViewModel 的實例。
final launchViewModelProvider =
    StateNotifierProvider<LaunchViewModel, List<Launch>>((ref) {
  return LaunchViewModel(LaunchRepository());
});
