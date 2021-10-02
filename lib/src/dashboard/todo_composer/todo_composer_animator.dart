import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/utils/spring_animation.dart';

import 'todo_composer_controller.dart';

const _hiddenPosition = 1.0;
const _expandedPosition = 0.0;

/// This widget animates [TodoComposer].
class TodoComposerAnimator extends HookConsumerWidget {
  final Widget child;

  const TodoComposerAnimator({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTodoComposerVisible = ref.watch(todoComposerControllerProvider);
    final isTodoComposerPreviouslyVisible = usePrevious(isTodoComposerVisible);
    final animationController =
        useAnimationController(initialValue: _hiddenPosition);
    final shouldRender = useState(false);
    final theme = Theme.of(context);

    final animationControllerListener = useCallback(() {
      if (!animationController.isAnimating && !isTodoComposerVisible) {
        shouldRender.value = false;
      }
    }, [animationController, shouldRender.value, isTodoComposerVisible]);

    useEffect(() {
      if (isTodoComposerVisible == isTodoComposerPreviouslyVisible) {
        return null;
      }

      if (isTodoComposerVisible && !shouldRender.value) {
        shouldRender.value = true;
      }

      animationController
        ..spring(
          to: isTodoComposerVisible ? _expandedPosition : _hiddenPosition,
        )
        ..addListener(animationControllerListener);

      return () {
        animationController.removeListener(animationControllerListener);
      };
    }, [isTodoComposerVisible, animationController, shouldRender.value]);

    if (!shouldRender.value) {
      return Container();
    }

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (_, child) => Transform.translate(
          offset: Offset(0, 500 * animationController.value),
          child: child,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: theme.primaryColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
