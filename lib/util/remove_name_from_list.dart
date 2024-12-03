List<T> removeItemList<T>(List<T> list, bool Function(T item) shouldRemove) {
  return list.where((item) => !shouldRemove(item)).toList();
}
