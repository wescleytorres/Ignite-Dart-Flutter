import 'package:flutter/foundation.dart';

class CardController extends ChangeNotifier {
  static CardController instance = CardController();
  var notes = <String>['Primeiro Item'];

  updateNote(int index, String note) {
    notes[index] = note;

    notifyListeners();
  }

  removeNote(int index) {
    notes.removeAt(index);

    notifyListeners();
  }

  addNote(String note) {
    notes.add(note);

    notifyListeners();
  }
}
