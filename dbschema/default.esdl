using extension auth;

module default {
  type User {
    required identity: ext::auth::Identity {
      constraint exclusive;
    };
    name: str;
  }
  global currentUser := (
    select User filter .identity = global ext::auth::ClientTokenIdentity
  )

  type snippets {
    required id: str;
    required title: str;
    required user: User
    required is_public: bool {
        default := false
    }
  }
}
