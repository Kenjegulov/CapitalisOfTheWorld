import 'dart:math';

List<int> getRandomCountry(int leng, int count) {
  List<int> result = [];
  Random random = Random();
  while (result.length < count) {
    int randomNumber = random.nextInt(leng);
    if (!result.contains(randomNumber)) {
      result.add(randomNumber);
    }
  }
  return result;
}

List<int> getRandomCity() {
  List<int> result = [];
  Random random = Random();
  while (result.length < 4) {
    int randomNumber = random.nextInt(4);
    if (!result.contains(randomNumber)) {
      result.add(randomNumber);
    }
  }
  return result;
}
