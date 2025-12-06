class Cart {
  static List<String> items = [];

  static void addItem(String item) {
    items.add(item);
  }

  static void removeItem(String item) {
    items.remove(item);
  }

  static void clearCart() {
    items.clear();
  }
}
