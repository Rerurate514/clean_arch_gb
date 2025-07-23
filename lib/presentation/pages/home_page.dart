import 'package:clean_arch_gb/presentation/components/pages/home/home_components.dart';
import 'package:clean_arch_gb/presentation/components/util/page_wrapper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PageWrapper(
          child: HomeComponents()
        )
      ),
    );
  }
}
