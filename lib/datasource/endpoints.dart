releaseKeyUrl(String localIp) {
  return Uri.parse('http://$localIp:3000/release');
}

pressKeyUrl(String localIp) {
  return Uri.parse('http://$localIp:3000/press');
}
