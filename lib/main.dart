import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterAndroidApp());
}

class GroupFlutterAndroidApp extends StatelessWidget {
  const GroupFlutterAndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Android 真机运行展示',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TeamAndroidHomePage(),
    );
  }
}

class TeamAndroidHomePage extends StatelessWidget {
  const TeamAndroidHomePage({super.key});

  static const String projectTitle = 'Flutter Android 真机运行演示';
  static const String projectSlogan = '通过 Fork 仓库和 Pull Request 协作，完成 Flutter 应用在 Android 真机上的运行。';
  static const String deviceProof = '最终证据：用第二部手机拍摄手持 Android 真机运行照片，并加入 GitHub README。';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '于昕冉', task: '创建原始仓库，审核并合并 PR，组织最终真机运行和提交，提供主 Android 手机'),
    TeamMember(role: '组员 A', name: '王小梅', task: '修改应用标题和项目口号'),
    TeamMember(role: '组员 B', name: '刘昱泽', task: '修改成员信息和分工'),
    TeamMember(role: '组员 C', name: '杨晨曦', task: '修改真机运行任务列表'),
    TeamMember(role: '组员 D', name: '蒋亿乐', task: '修改证据说明和 README 照片说明'),
    TeamMember(role: '组员 E', name: '张蕴洁', task: '添加小组联系方式/主题色/页面风格等自定义内容'),
    TeamMember(role: '组员 F', name: '唐一甜', task: '负责用第二部手机拍摄真机运行照片，整理图片并提交到 images/，更新 README 图片部分'),
  ];

  static const List<String> androidTasks = [
    '确认主电脑已安装 Flutter SDK 和 Android Studio',
    '确认项目路径为英文短路径，如 C:\\dev\\group_flutter_android_demo',
    '配置 FLUTTER_STORAGE_BASE_URL 和 PUB_HOSTED_URL 国内镜像',
    '运行 flutter doctor -v 检查开发环境是否完整',
    '通过 Android Studio SDK Manager 安装 SDK Platform、Build-Tools、Platform-Tools',
    '运行 flutter doctor --android-licenses 接受所有许可',
    '打开 Android 手机开发者选项与 USB 调试',
    '用数据线连接手机，选择文件传输 / MTP 模式',
    '手机弹出授权时点击允许 USB 调试',
    '运行 adb devices 确认设备状态为 device',
    '运行 flutter devices 确认 Flutter 识别到设备',
    '进入项目目录运行 flutter pub get 下载依赖',
    '运行 flutter test 确认测试通过',
    '运行 flutter run 在真实 Android 手机上启动应用',
  ];

  static const List<String> evidenceNotes = [
    '证据照片必须展示真实 Android 手机正在运行本 Flutter 应用。',
    '照片需要由第二部手机拍摄，并拍到手持真机，不能用手机截图代替。',
    '不能提交 Web 页面截图、模拟器截图或电脑屏幕截图作为真机证据。',
    '照片建议保存为 images/android-real-device.jpg，并在 README 中使用相同路径引用。',
    '提交前检查照片中不要出现账号、手机号、聊天记录等明显隐私信息。',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android 真机运行展示')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          AndroidTasksSection(),
          SizedBox(height: 20),
          EvidenceSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.phone_android, size: 42, color: Colors.teal),
            SizedBox(height: 12),
            Text(
              TeamAndroidHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamAndroidHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text(TeamAndroidHomePage.deviceProof, style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamAndroidHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class AndroidTasksSection extends StatelessWidget {
  const AndroidTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Android 真机运行任务', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.androidTasks.map((task) => Text('• $task')),
          ],
        ),
      ),
    );
  }
}

class EvidenceSection extends StatelessWidget {
  const EvidenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('真机照片证据要求', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamAndroidHomePage.evidenceNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
