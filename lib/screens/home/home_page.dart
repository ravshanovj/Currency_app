import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home_cubit.dart';
import 'package:flutter_application_1/screens/home/home_state.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Total price",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Icon(
                                Icons.mark_chat_unread_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(children: [
                            Text(
                                "\$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40)),
                            Text(
                                state.currencyModel.last.cbPrice!.split(".")[1],
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 40))
                          ]),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "    + \$ ${state.currencyModel.last.cbPrice!.split(".")[0]}.",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "${state.currencyModel.last.cbPrice!.split(".")[1]}     ",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                              const Text(
                                "4.28% ->",
                                style: TextStyle(
                                    color: Colors.greenAccent, fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                color: Colors.white,
                                text: "Buy",
                                textColor: Colors.black,
                              ),
                              CustomButton(
                                color: Colors.white.withOpacity(0.6),
                                text: "Sell",
                                textColor: Colors.black,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text(
                  "Что-то не так",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
