/*
47
redirect: (context, state) {
      final loggedIn = tokenState.token != null;
      final loggingIn = state.subloc == '/signIn';
      if (!loggedIn) {
        return loggingIn ? null : '/signIn';
      }
      if (loggingIn) {
        return '/';
      }
      return null;
    },
 */