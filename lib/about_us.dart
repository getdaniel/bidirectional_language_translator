import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _HomeState();
}

class _HomeState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ContactUs(
          logo: const AssetImage('assets/images/ic_launcher.png'),
          avatarRadius: 100,
          companyFontSize: 32,
          companyName: 'Simple Language Translator',
          companyColor: Colors.teal,
          companyFontWeight: FontWeight.bold,
          tagLine: "Daniel G, Yezibalem A. Yeabsira A.",
          taglineColor: Colors.black,
          taglineFontWeight: FontWeight.bold,
          cardColor: Colors.teal,
          emailText: "Gmail",
          email: 'danielgetaneh2011@gmail.com',
          githubUserName: 'getdaniel',
          dividerThickness: 10,
          textColor: Colors.white,
          dividerColor: Colors.teal,
          linkedinURL: 'https://www.linkedin.com/in/daniel-getaneh-50b459175/',
          phoneNumberText: 'Phone Number',
          phoneNumber: '+251935976224',
          instagram: 'https://www.instagram.com/getdaniel3/',
          twitterHandle: 'https://twitter.com/DanielGetanehS',
          website: 'https://getdaniel.github.io/my_profile/',
          websiteText: 'Website',
        ),
      ),
    );
  }
}
