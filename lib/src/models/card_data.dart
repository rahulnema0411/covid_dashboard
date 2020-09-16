class CardData {
  String location;

  String confirmed;
  String recovered;
  String deceased;

  String newConfirmed;
  String newRecovered;
  String newDeaths;

  String activeRate;
  String recoveryRate;
  String deathRate;

  String activeCases;

  CardData(
      {this.location = 'Location',
      this.confirmed = '150000',
      this.recovered = '145000',
      this.deceased = '800',
      this.newConfirmed = '1500',
      this.newRecovered = '1800',
      this.newDeaths = '10',
      this.activeRate = '70.0',
      this.recoveryRate = '97.5',
      this.deathRate = '1.5',
      this.activeCases = '15000'});

  void printAllData() {
    print(this.location +
        ' ' +
        this.newConfirmed +
        ' ' +
        this.newRecovered +
        ' ' +
        this.newDeaths +
        ' ' +
        this.confirmed +
        ' ' +
        this.recovered +
        ' ' +
        this.deceased +
        ' ' +
        this.activeCases +
        ' ' +
        this.activeRate +
        ' ' +
        this.deathRate +
        ' ' +
        this.recoveryRate +
        ' ' +
        this.newConfirmed);
  }
}
