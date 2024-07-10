abstract class Authservices {
  Future<void> signIn(String email, String password, String nom, String prenom);
  Future<void> login(String email, String password);
}
