import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_challenge/src/utils/spring_animation.dart';

const _hiddenPosition = 1.0;
const _expandedPosition = 0.0;

/// A widget that slides [child] up into view when [visible]
/// and slides [child] down when not [visible].
class SlideAnimation extends HookWidget {
  final bool visible;
  final Widget child;

  const SlideAnimation({
    Key? key,
    required this.visible,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPreviouslyVisible = usePrevious(visible);
    final animationController = useAnimationController(
      initialValue: visible ? _expandedPosition : _hiddenPosition,
    );
    final shouldRender = useState(visible);

    final animationControllerListener = useCallback(() {
      if (!animationController.isAnimating && !visible) {
        shouldRender.value = false;
      }
    }, [animationController, shouldRender.value, visible]);

    useEffect(() {
      animationController.addListener(animationControllerListener);
      return () {
        animationController.removeListener(animationControllerListener);
      };
    }, [animationController, animationControllerListener]);

    useEffect(() {
      if (visible == isPreviouslyVisible) {
        return;
      }

      if (visible && !shouldRender.value) {
        shouldRender.value = true;
      }

      animationController.spring(
        to: visible ? _expandedPosition : _hiddenPosition,
      );
    }, [visible, animationController, shouldRender.value]);

    if (!shouldRender.value) {
      return Container();
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, 500 * animationController.value),
        child: child,
      ),
      child: child,
    );
  }
}
