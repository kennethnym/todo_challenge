import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/todo_composer.dart';
import 'package:todo_challenge/src/widgets/button.dart';
import 'package:todo_challenge/src/widgets/screen.dart';

class AddTodoButton extends HookConsumerWidget {
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTodoComposer = useCallback(() {
      ref.read(todoComposerControllerProvider.notifier).showTodoComposer();
    }, [ref]);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.padding.left,
          vertical: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Button(label: '+ ADD', onTap: showTodoComposer),
      ),
    );
  }
}
