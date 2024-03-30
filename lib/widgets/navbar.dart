import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 52,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              child: SvgPicture.string(
                '''
                  <svg stroke="currentColor" fill="none" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M4 6h16M4 12h16M4 18h16"></path>
                  </svg>
                ''',
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.string(
                '''
                  <svg fill="currentColor" height="24" icon-name="search-outline" viewBox="0 0 20 20" width="24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.5 18.616 14.985 14.1a8.528 8.528 0 1 0-.884.884l4.515 4.515.884-.884ZM1.301 8.553a7.253 7.253 0 1 1 7.252 7.253 7.261 7.261 0 0 1-7.252-7.253Z"></path>
                  </svg>
                ''',
                height: 26,
                width: 26,
              ),
              const SizedBox(width: 20),
              Container(
                width: 40,
                height: 40,
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://preview.redd.it/snoovatar/avatars/nftv2_bmZ0X2VpcDE1NToxMzdfZWI5NTlhNzE1ZGZmZmU2ZjgyZjQ2MDU1MzM5ODJjNDg1OWNiMTRmZV8yNTU5MjM0OQ_rare_7b15159a-149e-48db-b70f-e9a3f0b94af2-headshot.png?width=128&height=128&crop=smart&auto=webp&s=fe40df49b6cfeeeaa9ae43fa8476482c2157cd96',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
      shape: const Border(
        bottom: BorderSide(
          color: Color(0xFFF0F4F5),
          width: 1.0,
        ),
      ),
      floating: true,
      pinned: true,
    );
  }
}
