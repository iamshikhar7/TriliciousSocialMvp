import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:image_picker/image_picker.dart';

import '../../data/services/remote/firebase_service.dart';
import '../models/event_model.dart' as event_model;
import '../models/gift.dart';
import '../models/track.dart';
import '../models/user_model.dart';

class UserRepository {
  final _firebaseService = FirebaseService();
  final authinstance = firebase_auth.FirebaseAuth.instance;

  Future<String> saveUserDetails(String name, String phoneNumber, String dob,
      Map<String, dynamic> address, String? url) async {
    final email = authinstance.currentUser!.email;
    final user = User(
      name: name,
      email: email!,
      phoneNumber: phoneNumber,
      dob: dob,
      address: event_model.Address(
        pinCode: address['pinCode'],
        name: address['name'],
        city: address['city'],
        state: address['state'],
      ),
      profileImage: url,
    ).toJson();
    final result = await _firebaseService.saveUserDetails(user);
    return result;
  }

  Future<String> uploadPic(XFile image) async {
    final result = await _firebaseService.uploadPic(image);
    return result;
  }

  Future<User> getUserDetails() async {
    final result =
        await _firebaseService.getUserDetails(authinstance.currentUser!.email!);
    return result;
  }

  Future<List<Track>> getGiftTracking(String giftId, String eventId) async {
    final result = await _firebaseService.getGiftTracking(
        authinstance.currentUser!.email!, giftId, eventId);
    return result;
  }

  Future<String> saveHostedEventDetails(
      String name,
      String type,
      String description,
      String date,
      String time,
      Map<String, dynamic> address) async {
    final event = event_model.Event(
      name: name,
      type: type,
      description: description,
      date: date,
      time: time,
      address: event_model.Address(
        pinCode: address['pinCode'],
        name: address['name'],
        city: address['city'],
        state: address['state'],
      ),
    ).toJson();
    final result = await _firebaseService.saveHostedEventDetails(
        event, authinstance.currentUser!.email);
    return result;
  }

  Future<String> saveJoinedEventDetails(
    String name,
    String type,
    String description,
    String date,
    String time,
  ) async {
    final event = event_model.Event(
      name: name,
      type: type,
      description: description,
      date: date,
      time: time,
      address: event_model.Address(
        pinCode: 'addres',
        name: 'address',
        city: 'aa',
        state: 'aa',
      ),
    ).toJson();
    final result = await _firebaseService.saveJoinedEventDetails(
        event, authinstance.currentUser!.email);
    return result;
  }

  Future<String> saveGiftsToJoined(String name, String type, String description,
      String date, String time, List<Gift> gifts) async {
    final event = event_model.Event(
      name: name,
      type: type,
      description: description,
      date: date,
      time: time,
      address: event_model.Address(
        pinCode: 'addres',
        name: 'address',
        city: 'aa',
        state: 'aa',
      ),
    ).toJson();
    final result = await _firebaseService.saveGiftsForJoined(event,
        gifts.map((e) => e.name).toList(), authinstance.currentUser!.email);
    return result;
  }

  Future<event_model.Event> getEventDetails(String id) async {
    final result = await _firebaseService.getEventDetails(id);
    return result;
  }

  Future<List<event_model.Event>> getAllEventDetails() async {
    final result = await _firebaseService.getAllEventDetails();
    return result;
  }

  Future<List<Gift>> getAllGiftsDetails() async {
    final result = await _firebaseService.getAllGiftsDetails();
    return result;
  }

  Future<Map<Gift, String>> getGiftsDetailsForIDS(
      List<dynamic> ids, Map<String, List<String>> giftIdsToEventIds,
      {bool hosted = false}) async {
    final result = await _firebaseService
        .getGiftsDetailsForIDS(ids, giftIdsToEventIds, hosted: hosted);
    return result;
  }

  Future<List<event_model.Event>> getAllEventDetailsWithChannel(
      String id) async {
    final result = await _firebaseService.getAllEventDetailsWithChannel(id);
    return result;
  }

  Future<List<event_model.Event>> getAllEventDetailsWithID(String id) async {
    final result = await _firebaseService.getAllEventDetailsWithID(id);
    return result;
  }

  Future<String> getPath() async {
    final result =
        await _firebaseService.getPath(authinstance.currentUser!.email!);
    return result;
  }
}
