import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobspot/Screens/Ecom.dart';
import 'package:jobspot/Screens/Login.dart';
import 'package:page_transition/page_transition.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                'https://qph.cf2.quoracdn.net/main-qimg-b329dba7a38eaa6453871fdb2f882521-pjlq'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Star Platinum",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: const Color.fromARGB(255, 4, 6, 126),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Account"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("ffff"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const Ecom()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    leading: const Icon(Icons.headset_mic_rounded),
                    title: const Text("Support"),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                children: [
                  ListTile(
                    title: const Text("Sign Out",textAlign: TextAlign.end,),
                    trailing: const Icon(Icons.subdirectory_arrow_right_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const Login()));
                      
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
