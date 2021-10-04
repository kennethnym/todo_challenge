import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/todo_composer/todo_composer.dart';
import 'package:todo_challenge/src/widgets/button.dart';

class AddTodoButton extends HookConsumerWidget {
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTodoComposer = useCallback(() {
      ref.read(todoComposerControllerProvider.notifier).showTodoComposer();
    }, [ref]);

    return Button(label: '+ ADD', onTap: showTodoComposer);
  }
}
