import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/widgets/messenger.dart';

import '../../logic/managers/user_manager.dart';
import '../../util.dart';
import 'bottom_sheet.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.assetPath,
    required this.label,
    this.onTap,
    required this.radius,
    this.color,
    this.scale,
    this.marginVertical,
    this.width,
    this.crossAxisAlignment,
    this.marginHorizontal,
  });
  final String assetPath;
  final String label;
  final Function()? onTap;
  final double radius;
  final Color? color;
  final double? scale;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? width;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical ?? 10,
            horizontal: marginHorizontal ?? 0.0),
        width: width ?? size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: color ?? kPrimaryColor),
                shape: BoxShape.circle,
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: radius,
                  child: Image.asset(
                    assetPath,
                    scale: scale,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: label != '',
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarPane extends StatefulWidget {
  const AvatarPane(
      {super.key,
      required this.isForRegistration,
      required this.radius,
      required this.scale,
      this.marginVertical,
      this.marginHorizontal,
      this.crossAxisAlignment});
  final bool isForRegistration;
  final double radius, scale;
  final double? marginVertical, marginHorizontal;

  final CrossAxisAlignment? crossAxisAlignment;

  @override
  State<AvatarPane> createState() => _AvatarPaneState();
}

class _AvatarPaneState extends State<AvatarPane> {
  late String _selectedAvatarPath;
  late String _selectedAvatarLabel;
  @override
  void initState() {
    super.initState();

    //initialising selected avatar type of user
    if (widget.isForRegistration) {
      _selectedAvatarPath = kAvatarPaths.values.first;
      _selectedAvatarLabel = kAvatarPaths.keys.first;
    } else {
      String? userType = context.read<UserManager>().currentUser.userType;

      _selectedAvatarLabel = userType;
      _selectedAvatarPath = getAvatarPathFromLabel(
        _selectedAvatarLabel,
      );
    }
  }

  String getAvatarPathFromLabel(String? label) {
    String path;
    if (kAvatarPaths.containsKey(label)) {
      path = kAvatarPaths[label]!;
    } else {
      path = kAvatarPaths.values.first;
    }
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<UserManager>().currentUser;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
          onTap: () {
            BottomSheetLayout.showModalSheet(
              context: context,
              maxHeight: size.height * 0.25,
              header: "Choose Avatar",
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: kAvatarPaths.length,
                  itemBuilder: (context, index) => Avatar(
                        onTap: () {
                          setState(() {
                            _selectedAvatarPath =
                                kAvatarPaths.entries.elementAt(index).value;

                            currentUser.userType = _selectedAvatarLabel =
                                kAvatarPaths.entries.elementAt(index).key;

                            context
                                .read<UserManager>()
                                .updateUserData(currentUser);
                          });
                          Navigator.pop(context);

                          Messenger.showSnackBar(
                              message: "Avatar Updated", context: context);
                        },
                        assetPath: kAvatarPaths.entries.elementAt(index).value,
                        label: kAvatarPaths.entries.elementAt(index).key,
                        radius: size.height * 0.05,
                        scale: size.height * 0.01,
                      )),
            );
          },
          child: ClipRRect(
            child: Avatar(
              assetPath: _selectedAvatarPath,
              radius: widget.radius,
              scale: widget.scale,
              label: widget.isForRegistration ? _selectedAvatarLabel : '',
              marginVertical: widget.marginVertical,
              marginHorizontal: widget.marginHorizontal,
              crossAxisAlignment: widget.crossAxisAlignment,
              color: kPrimaryColorAccent,
            ),
          )),
    );
  }
}
