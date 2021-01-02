import 'dart:math';

class Counter<T extends num>
{
  List<T> _items = new List<T>();

  void addAll(Iterable<T> values) => this._items.addAll(values);

  void add(T value) => this._items.add(value);

  T elementAt(int index) => this._items.elementAt(index);

  void total()
  {
    num value = 0.0 ;
    this._items.forEach((element) {
      value += element;
    });

    print(value);
  }
}