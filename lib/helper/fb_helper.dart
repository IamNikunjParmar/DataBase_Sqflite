import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class FireStoreHelper {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final Logger logger = Logger();

  static Future<void> addUser(String name, String email, int age) async {
    try {
      logger.d('Adding User: $name, $email, $age');
      await _fireStore.collection('users').add({
        'name': name,
        'email': email,
        'age': age,
      });
    } catch (e) {
      logger.e("Add User Error: $e");
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      logger.d('Fetching users...');
      final snapShot = await _fireStore.collection('users').get();
      final users = snapShot.docs.map((doc) => doc.data()).toList();
      logger.d("Users: $users");
      logger.i("Users fetched successfully: ${users.length}");
      return users;
    } catch (e) {
      logger.e("Fetch Users Error: $e");
      rethrow;
    }
  }

  static Future<void> deleteUser(String docId) async {
    logger.d("Document Id :: $docId");
    await _fireStore.collection('users').doc(docId).delete();
    logger.i("User Deleted For SuccessFully");
  }
}
