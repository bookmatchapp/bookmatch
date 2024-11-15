import 'package:collection/collection.dart';

enum Roles {
  basic_user,
  admin,
  manager,
  owner_founder,
}

enum BookGenre {
  Art_Photography,
  Autobiography_Memoir,
  Biography,
  Essays,
  Food_Drink,
  History,
  How_To_Guides,
  Humanities_Social_Sciences,
  Humor,
  Parenting,
  Philosophy,
  Religion_Spirituality,
  Science_Technology,
  Self_help,
  Travel,
  True_Crime,
}

enum Libraries {
  QuezonCityLIbrary,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (BookGenre):
      return BookGenre.values.deserialize(value) as T?;
    case (Libraries):
      return Libraries.values.deserialize(value) as T?;
    default:
      return null;
  }
}
