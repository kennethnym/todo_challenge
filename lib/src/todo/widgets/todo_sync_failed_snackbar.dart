import 'package:flutter/material.dart';

/// Creates a [SnackBar] that informs the user that
/// the app failed to sync their list of to-dos.
SnackBar todoSyncFailedSnackBar() => const SnackBar(
      content: Text('Failed to sync todos.'),
    );
