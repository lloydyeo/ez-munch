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
import '/auth/firebase_auth/auth_util.dart';

double sumCartItemPrice(List<CartItemsRecord> cartItems) {
  double price = 0.0;

  cartItems.forEach((cartItem) => price += cartItem.price);

  return price;
}

double? sumDouble(
  double doubleA,
  double doubleB,
) {
  double c = doubleA + doubleB;

  return double.parse(c.toStringAsFixed(2));
}
