import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:repository/user/user_profile_page/models/booking_history.dart';
import 'package:repository/utils/exceptions/database_exception.dart';
import 'models/user_profile.dart';

class FirebaseUserProfileDatabaseService implements UserProfileDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserProfile> fetchUserProfile() {
    final docRef = _db.collection('users').doc(_auth.currentUser?.uid);
    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserProfile.fromDocumentSnapshot(data);
      },
      onError: (e) {
        debugPrint('Error getting document: $e');
        throw DatabaseException('Unable to load profile data');
      },
    );
  }

  @override
  Future<List<BookingHistory>> getBookingHistoryList() {
    // TODO: implement getBookingHistoryList
    throw UnimplementedError();
  }
}

abstract class UserProfileDatabaseService {
  Future<UserProfile> fetchUserProfile();

  Future<List<BookingHistory>> getBookingHistoryList();
}
