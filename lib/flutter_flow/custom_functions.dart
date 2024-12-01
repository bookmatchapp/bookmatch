import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkIfBookIsInTheFavorites(String? bookId) {
  // check if bookId parameter is in the user favoriteBooks
  if (currentUserDocument != null) {
    return currentUserDocument!.favoriteBooks.contains(bookId);
  }
  return false;
}

String? pascalToTitleCase(String? libName) {
  // create a utility function to Convert string in PascalCase format to Title Case format
  if (libName == null || libName.isEmpty) {
    return null;
  }

  // Convert PascalCase to Title Case
  String titleCase = libName.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
    return ' ${match.group(0)}';
  });

  // Capitalize the first letter
  titleCase = titleCase.trim();
  titleCase = titleCase.substring(0, 1).toUpperCase() + titleCase.substring(1);

  return titleCase;
}

bool is13YearsOldBelow(DateTime? birthDate) {
  // check if birthDate is below 13 year old
  if (birthDate == null) {
    return false;
  }

  DateTime currentDate = DateTime.now();
  DateTime thirteenYearsAgo = currentDate.subtract(Duration(days: 13 * 365));

  return !birthDate.isAfter(thirteenYearsAgo);
}

bool is13To17YearsOld(DateTime birthDate) {
  // check if birth date is 13 to 17 years old
  // check if birthDate is between 13 to 17 years old
  if (birthDate == null) {
    return false;
  }

  DateTime currentDate = DateTime.now();
  DateTime thirteenYearsAgo = currentDate.subtract(Duration(days: 13 * 365));
  DateTime seventeenYearsAgo = currentDate.subtract(Duration(days: 17 * 365));

  return !birthDate.isAfter(thirteenYearsAgo) &&
      birthDate.isAfter(seventeenYearsAgo);
}
