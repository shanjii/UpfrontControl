import 'package:app/pages/f16/f16.dart';
import 'package:app/pages/f18/f18.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/network.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var network = context.read<Network>();
    var feedbacks = context.read<Feedbacks>();

    TextEditingController ipController = TextEditingController(
      text: network.localIp,
    );

    return Scaffold(
      backgroundColor: DefaultColors.backgroundOled,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _ipInput(ipController),
                ),
                SizedBox(
                  width: 100,
                  child: Material(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () {
                        network.setLocalIp(ipController.value.text);
                      },
                      child: const Center(
                        child: Text("Apply"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Material(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () => goToF16(context),
                      child: const Center(
                        child: Text("F16"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Material(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () => goToF18(context),
                      child: const Center(
                        child: Text("F18"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(children: [
              Expanded(
                child: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      feedbacks.muted = true;
                    },
                    child: const Center(
                      child: Text("Muted"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      feedbacks.muted = false;
                    },
                    child: const Center(
                      child: Text("Unmuted"),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 50,
            child: Row(children: [
              Expanded(
                child: Material(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      feedbacks.hapticFeedback = FeedbackType.light;
                    },
                    child: const Center(
                      child: Text("Light vibration"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.yellow,
                  child: InkWell(
                    onTap: () {
                      feedbacks.hapticFeedback = FeedbackType.medium;
                    },
                    child: const Center(
                      child: Text("Medium vibration"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      feedbacks.hapticFeedback = FeedbackType.heavy;
                    },
                    child: const Center(
                      child: Text("Heavy vibration"),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  _ipInput(TextEditingController ipController) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      decoration: const InputDecoration(
        hintText: "Your machine IP address",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      controller: ipController,
    );
  }

  goToF16(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F16()),
    );
  }

  goToF18(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F18()),
    );
  }
}
