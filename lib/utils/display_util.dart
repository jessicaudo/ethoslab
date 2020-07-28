//navigation links for header
//var links = ["Home", "Ethos Lab ", "Events", "GitHub"];
//enum NavLinks { Home, Github, Videos, Resources, Jobs, LogIn }
enum NavLinks { Home, EthosLab, Events, GitHub, LogIn, Support }

String displayString(NavLinks link) {
  switch (link) {
    case NavLinks.Home:
      return "Home";
      break;

    case NavLinks.GitHub:
      return "GitHub";
      break;

    case NavLinks.Events:
      return "Events";
      break;

    case NavLinks.EthosLab:
      return "EthosLab";
      break;

    case NavLinks.LogIn:
      return "LogIn";
      break;

    case NavLinks.Support:
      return "Support";
      break;

    default:
      return "";
  }
}

String linkUrl(NavLinks link) {
  switch (link) {
    case NavLinks.Home:
      //return "https://flutter-to-fly.web.app/";
      //to return Atlanthos app user homepage
      return null;
      break;

    case NavLinks.GitHub:
      return "https://github.com/jessicaudo/ethoslab";
      break;
    
    case NavLinks.EthosLab:
      return "https://www.ethoslab.space/";
      break;

    case NavLinks.Support:
      //return "https://flutterjobs.info/jobs/all";
      //should take user to documentation, help info, or how to contact us
      return null;
      break;

    default:
      return "";
  }
}