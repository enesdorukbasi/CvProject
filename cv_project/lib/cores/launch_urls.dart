// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;
import 'dart:html' as html;

void openMyGithub() {
  js.context.callMethod('open', ['https://github.com/enesdorukbasi']);
}

void openMyLinkedIn() {
  js.context.callMethod(
      'open', ['https://www.linkedin.com/in/enes-dorukba%C5%9F%C4%B1/']);
}

void openMyWhatsapp() {
  js.context.callMethod(
      'open', ['https://api.whatsapp.com/send/?phone=5418429774&text=']);
}

void openUrl(String url) {
  js.context.callMethod('open', [url]);
}

void downloadCV() {
  String url =
      'https://drive.google.com/file/d/1FYBSMIXMuOAEuIVCy_sHan0oqeQSz2Mi/view?usp=share_link';
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}
