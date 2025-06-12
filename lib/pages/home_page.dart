import 'package:flutter/material.dart';
import 'package:luffgiff_sidebar_menu/components/custom_text.dart';
import 'package:luffgiff_sidebar_menu/components/initials.dart';
import 'package:luffgiff_sidebar_menu/components/sliding_toggle_button.dart';
import 'package:luffgiff_sidebar_menu/pages/app_bar.dart';
import 'package:luffgiff_sidebar_menu/components/extension.dart';
import 'package:luffgiff_sidebar_menu/pages/menu_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredContacts = [];

  final List<String> _numbers = [
    '+44 (674-8754-8765)',
    '+44 (675-9821-4532)',
    '+44 (676-1234-5678)',
    '+44 (677-8765-4321)',
    '+44 (678-5555-9999)',
    '+44 (679-3333-7777)',
    '+44 (680-1111-2222)',
    '+44 (681-4444-8888)',
  ];
  final List<Map<String, String>> _contacts = [
    {'firstName': 'John', 'lastName': 'Kennel'},
    {'firstName': 'Ada', 'lastName': 'Nwosu'},
    {'firstName': 'John', 'lastName': 'Doe'},
    {'firstName': 'Dwight', 'lastName': 'Terrence'},
    {'firstName': 'Martins', 'lastName': 'Doe'},
    {'firstName': 'Richard', 'lastName': 'Edwards'},
    {'firstName': 'Pamala ', 'lastName': 'Scholes'},
    {'firstName': 'Michael ', 'lastName': 'Jordan'},
  ];

  @override
  void initState() {
    super.initState();

    _filteredContacts = _contacts;

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();
  }

  void _filterContacts(String query) {
    final filtered = _contacts.where((contact) {
      final fullName = '${contact['firstName']} ${contact['lastName']}';
      return fullName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredContacts = filtered;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: MenuDetails()),
      body: Column(children: [_appBar(), _contactWidget()]),
    );
  }

  Widget _appBar() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            height: 300,
            width: double.infinity,
            color: Color.fromRGBO(114, 16, 255, 1),
            child: Stack(
              children: [
                // Large Ellipse (Bottom Right)
                Positioned(
                  top: 110,
                  left: 5,
                  child: Image.asset('assets/images/Ellipse2.png'),
                ),
                // Small Ellipse (Top Right)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Image.asset('assets/images/Ellipse1.png'),
                ),

                // Menu Icon
                Builder(
                  builder: (context) => Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ),
                ),

                // Notification Icon with Dot
                Positioned(
                  top: 60,
                  right: 20,
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 25,
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Welcome Text
                const Positioned(
                  top: 105,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Welcome',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      CustomText(
                        text: 'Damilola',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 170,
          left: 20,
          right: 20,
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterContacts,
                    decoration: InputDecoration(
                      hintText: "Search for contacts",

                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onTap: _showSearchOptions,
                        child: Icon(
                          Icons.tune,
                          color: Colors.grey,
                        ), 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactWidget() {
    return Expanded(
      child: SlideTransition(
        position: _animation,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: _filteredContacts.length + 1, // title row = 0
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Contacts',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'See All',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                    ),
                  ],
                ),
              );
            }

            // index since first item is the title row
            final contact = _filteredContacts[index - 1];
            final phoneNumber = index - 1 < _numbers.length
                ? _numbers[index - 1]
                : 'No number';

            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InitialsAvatar(
                        firstName: contact['firstName'] ?? '',
                        lastName: contact['lastName'] ?? '',
                      ),
                    ),
                    15.w,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              '${contact['firstName']} ${contact['lastName']}',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                        CustomText(
                          text: phoneNumber,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromRGBO(207, 207, 207, 1),
                    ),
                    10.w,
                    Icon(
                      Icons.more_vert,
                      size: 25,
                      color: Color.fromRGBO(134, 134, 134, 1),
                    ),
                  ],
                ),
                10.h,
                Divider(color: Color.fromRGBO(207, 207, 207, 1)),
                10.h,
              ],
            );
          },
        ),
      ),
    );
  }

  void _showSearchOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    if (_filteredContacts.isEmpty)
                      const Center(
                        child: CustomText(
                          text: 'No matching contacts',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _filteredContacts.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final contact = _filteredContacts[index];
                          final phone = index < _numbers.length
                              ? _numbers[index]
                              : 'No number';

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 300.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color.fromRGBO(
                                      207,
                                      207,
                                      207,
                                      1,
                                    ),
                                    child: Icon(Icons.close, size: 16),
                                  ),
                                ),
                              ),
                              InitialsAvatar(
                                firstName: contact['firstName'] ?? '',
                                lastName: contact['lastName'] ?? '',
                              ),
                              5.h,
                              CustomText(
                                text:
                                    '${contact['firstName']} ${contact['lastName']}',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              5.h,
                              CustomText(
                                text: phone,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                              ),
                              5.h,
                            ],
                          );
                        },
                      ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: CircleAvatar(
                            radius: 25,

                            backgroundColor: Color.fromRGBO(233, 232, 255, 1),
                            child: Icon(Icons.list_alt, size: 20),
                          ),
                        ),
                        10.w,
                        CustomText(
                          text: 'View wish list',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: CircleAvatar(
                            radius: 25,

                            backgroundColor: Color.fromRGBO(207, 235, 242, 1),
                            child: Icon(Icons.people, size: 20),
                          ),
                        ),
                        10.w,
                        CustomText(
                          text: 'Add contact to family and friend list',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        30.w,
                        SlidingToggleButton(),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: CircleAvatar(
                            radius: 25,

                            backgroundColor: Color.fromRGBO(255, 240, 240, 1),
                            child: Icon(Icons.delete, size: 20),
                          ),
                        ),
                        10.w,
                        CustomText(
                          text: 'Remove Contact',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
