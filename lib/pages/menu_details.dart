import 'package:flutter/material.dart';
import 'package:luffgiff_sidebar_menu/components/custom_expansion_title.dart';
import 'package:luffgiff_sidebar_menu/components/custom_text.dart';
import 'package:luffgiff_sidebar_menu/components/extension.dart';

class MenuDetails extends StatelessWidget {
  const MenuDetails({super.key});

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 43,
        height: 43,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: CustomText(text: title, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(244, 237, 255, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 33,
                  backgroundImage: AssetImage('assets/images/menuPicture.jpg'),
                ),
                15.w,
                const CustomText(
                  text: 'Damilola',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          _buildMenuItem(
            icon: Icons.home_filled,
            iconColor: const Color.fromRGBO(103, 96, 255, 1),
            title: 'Home',
          ),
          const Divider(),

          CustomExpansionTile(
            leading: Container(
              width: 43,
              height: 43,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.list_alt_outlined,
                color: Color.fromRGBO(121, 102, 255, 1),
                size: 20,
              ),
            ),
            title: const CustomText(
              text: 'My List',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'My Birthday List', fontSize: 14),
                    ),
                  ],
                ),
              ),

              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'My Dream List', fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'Surprise List', fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Icon(Icons.add, color: Colors.black, size: 20),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'Create Your List', fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),

          CustomExpansionTile(
            leading: Container(
              width: 43,
              height: 43,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.favorite_rounded,
                color: Color.fromRGBO(84, 224, 255, 1),
                size: 20,
              ),
            ),
            title: const CustomText(
              text: 'Heart Hub',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'Invite', fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'Couple Zone', fontSize: 14),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    12.w,
                    const Expanded(
                      child: CustomText(text: 'Friends history', fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),

          _buildMenuItem(
            icon: Icons.people,
            iconColor: const Color.fromRGBO(255, 138, 194, 1),
            title: 'Friends & Family',
          ),
          const Divider(),

          _buildMenuItem(
            icon: Icons.person,
            iconColor: const Color.fromRGBO(103, 96, 255, 1),
            title: 'People',
          ),
          const Divider(),

          _buildMenuItem(
            icon: Icons.logout_outlined,
            iconColor: const Color.fromRGBO(255, 113, 113, 1),
            title: 'Log Out',
          ),
        ],
      ),
    );
  }
}
