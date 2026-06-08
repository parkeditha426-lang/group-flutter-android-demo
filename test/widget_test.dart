import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_flutter_android_demo/main.dart';

void main() {
  testWidgets('group Flutter Android demo renders main sections', (tester) async {
    await tester.pumpWidget(const GroupFlutterAndroidApp());

    expect(find.text('Android 真机运行展示'), findsOneWidget);
    expect(find.text('星火小组 Android 真机运行展示'), findsOneWidget);
    expect(find.text('小组成员与分工'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('Android 真机运行任务'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('真机照片证据要求'), findsOneWidget);
  });
}
